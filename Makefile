YUM		= /usr/bin/yum
RPMBUILD	= /usr/bin/rpmbuild

ARC		:= $(shell uname -m)
BUILD_DIR	= /usr/src/redhat
SOURCE_DIR	= $(BUILD_DIR)/SOURCES
RPM_DIR		= $(BUILD_DIR)/RPMS/$(ARC)
SRPM_DIR	= $(BUILD_DIR)/SRPMS


all: build update_repo


build: install_deps update_sources
	$(RPMBUILD) -v -ba nginx.spec


update_repo:
	mkdir -p RPMS/$(ARC) SRPMS
	cp -f $(RPM_DIR)/nginx* RPMS/$(ARC)/
	cp -f $(SRPM_DIR)/nginx* SRPMS/


update_sources:
	cp -f SOURCES/* $(SOURCE_DIR)/

install_deps:
	$(YUM) install rpm-build pcre-devel
