# Use standard variables: DESTDIR, prefix, bindir, libexecdir

DESTDIR=
prefix=/usr/local
bindir=$(prefix)/bin
libexecdir=$(prefix)/lib

BUILDDIR=build

GITHGEXECDIR=$(libexecdir)/git-hg

INSTALL=/usr/bin/install -c
SED=sed

GITHG_S=bin/git-hg
GITHG_F=$(BUILDDIR)/git-hg

all: $(GITHG_F)

$(GITHG_F): $(GITHG_S)
	mkdir -p $(BUILDDIR)
	$(SED) -e '/^[ \t]*GITHG_HOME=/s:=.*:='"'$(GITHGEXECDIR)'"':' $< > $@

install: 
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL) -m 755 $(GITHG_F) $(DESTDIR)$(bindir)/

uninstall:
	-rm -f $(DESTDIR)$(bindir)/git-hg

clean:
	rm -rf $(BUILDDIR)

.PHONY: all install uninstall clean
