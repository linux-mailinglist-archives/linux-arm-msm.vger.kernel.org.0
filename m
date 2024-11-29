Return-Path: <linux-arm-msm+bounces-39551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 659849DC17D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 10:27:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCB08B23B27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 09:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DC5188CDC;
	Fri, 29 Nov 2024 09:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TrQ/qfkp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223A317836B
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 09:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732872419; cv=none; b=JxzTu3oUJXpwnIWhJAISZhcMzZaYx5GWjjgDWH26qr4NmxGum2R5o/My+VbbpHM2I+ga0L8j5s1cJqmCvEq6qfYsw7eBiaE+LuiXPv5Dv+SXiszlqSNjGJEbbkEtT49/t0JpTRR0q4tJ57SSw95HUE7cMci/Ur8tNKslUinWZkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732872419; c=relaxed/simple;
	bh=lWn6bFGNd/3JKefZVdI9nxhLKSncMF+8FCLHmP8ExpA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k9afSiFc6L3ASwSfHRifs4IEGhw93IaxTr3ZFYUtkCQuDidEE7pXEAbjLJLDD6DS0NeppHTtCRiFA0BEUA1/gw6Y2aD84LuEo0vaZLSv+ErEJLNxatRqACKBns96/8OcN4c+r8Qf/YG/Su54Zv64Y5FJtbx+yO/EloTuFx5xluA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TrQ/qfkp; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20cf3e36a76so14385425ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 01:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732872417; x=1733477217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI3p2DNU6VR/r2E24vXbkA5gNVpP0sFqur3k9w/neH8=;
        b=TrQ/qfkpjERf0NSthoGUEWNmfvBs16LaOBZ/GEL+e54MuCuBZo2rM8PZZYXxI04BU9
         eQFKugDuAF32kGtcXekfhkhE9pcG9Pj5Thadwq1UR8m0nv2iq4CaAtkf6gTLO/DBvI45
         2WaXzC5OQ1zIhqBNbxepkFjSRA4FPk3LSW3MX9EQzvnGVcZzq6BfDoLkzjY1NP7n7ntH
         PRcFbeEe2vaPxFsurv6Rsn8UoZJA9MLN7o38Kjgrmc+S4WG2p0g1R9nZMsMe0ruePJ/C
         po6z/kNFfkVOdmg5jCwrSHx6rbnqJ1+rOdu4l4QBgkzJodTf4ta/CynKC4pz4gJm2+2b
         K10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732872417; x=1733477217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oI3p2DNU6VR/r2E24vXbkA5gNVpP0sFqur3k9w/neH8=;
        b=lV6h+HG12zfpTlBgtQnPcw0FPSHyMjOE+J5jU7MJIK3Tg1gNiOLcDlvzV0b0RG/cg9
         IWET8diFHOnA+YCT9g/wHgvwNWOxvcbywEXWc/BDzDz68GypY1CmWe4VlXXhKk9UTidR
         kVXQK0uk/vSlhoHraXrG1a/aBOsjZiKAYNvcgDMgkYEKR2RFvuaCUEmloOrUxS0VeSso
         NoTFufgnrz8PC/gPzSI/10rL1ehMa+PP0TbqfJ2XP0AoDss1EAVV5grKifTNFCqoOPTL
         FTihilS0zsjPi1A2c6sqK8u/mz8vD3jx/8AINUrqI6iEnaIV3tv8To4IreEtThDpRCzN
         Yhwg==
X-Forwarded-Encrypted: i=1; AJvYcCVefw0nTZsdrbJGlxlJHJhY73zIrm7t3Y+eLxG2VyPNot3qGQO5/xOJOIsH0vs4IWohmqXMhyjRACUJ/6NH@vger.kernel.org
X-Gm-Message-State: AOJu0YwhruiDKZKfNPlWtNaT2jcc0ugyZcpGPuJ8WUJZT250ASgvCeqW
	oC+HNo21yq394AANxdW7q1wv9qufhQrPTHN7rU2NhFJqtbzp936zOP1eBaFnHQ==
X-Gm-Gg: ASbGncv9WYb5f2Upq/eMA34vIlxlNLL0TYbbMceRo9EixPFi5SX0HZJnLx35jivr/Vu
	0Ser8c64hUek+70AljQ//HtfC2EZqivIpt4smo6oUM4N0Z20qUpXrHmD/kpfVvqoRrExTzp5EXL
	WyQe+mNz+Pu/+XS6+1czn5joeODMeR2ju/Dtq8PHoppU2DC++9Sp4B7AsQUZAt4o05e/FmBC4mP
	oGBPjcxaKo0VaXEZvNPBFLYLEck3SLGof+r6+/L/Am2qLzOCW/rbzpX/vVP9FbLh1BdA6vJxKWH
	JQ==
X-Google-Smtp-Source: AGHT+IEyxJ6ItSZfdJwmXopsXcgR31wY8rRyptyG0GlAlOJhoeWk52XWXYbOrNtRNKWp96yu5L+fqw==
X-Received: by 2002:a17:902:f60f:b0:215:30d1:36f6 with SMTP id d9443c01a7336-21530d13a46mr64816825ad.37.1732872417436;
        Fri, 29 Nov 2024 01:26:57 -0800 (PST)
Received: from localhost.localdomain ([117.213.97.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521987f17sm26648115ad.211.2024.11.29.01.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 01:26:57 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kw@linux.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	lpieralisi@kernel.org,
	shuah@kernel.org
Cc: kishon@kernel.org,
	aman1.gupta@samsung.com,
	p.rajanbabu@samsung.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhelgaas@google.com,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	linux-kselftest@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 3/4] selftests: Move PCI Endpoint tests from tools/pci to Kselftests
Date: Fri, 29 Nov 2024 14:54:14 +0530
Message-Id: <20241129092415.29437-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241129092415.29437-1-manivannan.sadhasivam@linaro.org>
References: <20241129092415.29437-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This just moves the existing tests under tools/pci to
tools/testing/selftests/pci_endpoint and adjusts the paths in Makefile
accordingly. Migration to Kselftest framework will be done in subsequent
commits.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/PCI/endpoint/pci-test-howto.rst          |  9 +++++----
 MAINTAINERS                                            |  2 +-
 tools/testing/selftests/pci_endpoint/.gitignore        |  3 +++
 tools/{pci => testing/selftests/pci_endpoint}/Build    |  0
 tools/{pci => testing/selftests/pci_endpoint}/Makefile | 10 +++++-----
 .../{pci => testing/selftests/pci_endpoint}/pcitest.c  |  0
 .../{pci => testing/selftests/pci_endpoint}/pcitest.sh |  0
 7 files changed, 14 insertions(+), 10 deletions(-)
 create mode 100644 tools/testing/selftests/pci_endpoint/.gitignore
 rename tools/{pci => testing/selftests/pci_endpoint}/Build (100%)
 rename tools/{pci => testing/selftests/pci_endpoint}/Makefile (83%)
 rename tools/{pci => testing/selftests/pci_endpoint}/pcitest.c (100%)
 rename tools/{pci => testing/selftests/pci_endpoint}/pcitest.sh (100%)

diff --git a/Documentation/PCI/endpoint/pci-test-howto.rst b/Documentation/PCI/endpoint/pci-test-howto.rst
index 909f770a07d6..c4ae7af50ede 100644
--- a/Documentation/PCI/endpoint/pci-test-howto.rst
+++ b/Documentation/PCI/endpoint/pci-test-howto.rst
@@ -123,16 +123,17 @@ above::
 Using Endpoint Test function Device
 -----------------------------------
 
-pcitest.sh added in tools/pci/ can be used to run all the default PCI endpoint
-tests. To compile this tool the following commands should be used::
+pcitest.sh added in tools/testing/selftests/pci_endpoint can be used to run all
+the default PCI endpoint tests. To compile this tool the following commands
+should be used::
 
 	# cd <kernel-dir>
-	# make -C tools/pci
+	# make -C tools/testing/selftests/pci_endpoint
 
 or if you desire to compile and install in your system::
 
 	# cd <kernel-dir>
-	# make -C tools/pci install
+	# make -C tools/testing/selftests/pci_endpoint install
 
 The tool and script will be located in <rootfs>/usr/bin/
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 21fdaa19229a..f116f78a2ec5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17794,7 +17794,7 @@ F:	Documentation/PCI/endpoint/*
 F:	Documentation/misc-devices/pci-endpoint-test.rst
 F:	drivers/misc/pci_endpoint_test.c
 F:	drivers/pci/endpoint/
-F:	tools/pci/
+F:	tools/testing/selftests/pci_endpoint/
 
 PCI ENHANCED ERROR HANDLING (EEH) FOR POWERPC
 M:	Mahesh J Salgaonkar <mahesh@linux.ibm.com>
diff --git a/tools/testing/selftests/pci_endpoint/.gitignore b/tools/testing/selftests/pci_endpoint/.gitignore
new file mode 100644
index 000000000000..29ab47c48484
--- /dev/null
+++ b/tools/testing/selftests/pci_endpoint/.gitignore
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+*.o
+pcitest
diff --git a/tools/pci/Build b/tools/testing/selftests/pci_endpoint/Build
similarity index 100%
rename from tools/pci/Build
rename to tools/testing/selftests/pci_endpoint/Build
diff --git a/tools/pci/Makefile b/tools/testing/selftests/pci_endpoint/Makefile
similarity index 83%
rename from tools/pci/Makefile
rename to tools/testing/selftests/pci_endpoint/Makefile
index 62d41f1a1e2c..3c6fe18e32cc 100644
--- a/tools/pci/Makefile
+++ b/tools/testing/selftests/pci_endpoint/Makefile
@@ -1,11 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
-include ../scripts/Makefile.include
+include ../../../scripts/Makefile.include
 
 bindir ?= /usr/bin
 
 ifeq ($(srctree),)
-srctree := $(patsubst %/,%,$(dir $(CURDIR)))
-srctree := $(patsubst %/,%,$(dir $(srctree)))
+srctree := $(patsubst %/tools/testing/selftests/,%,$(dir $(CURDIR)))
 endif
 
 # Do not use make's built-in rules
@@ -27,10 +26,11 @@ include $(srctree)/tools/build/Makefile.include
 #
 # We need the following to be outside of kernel tree
 #
-$(OUTPUT)include/linux/: ../../include/uapi/linux/
+$(OUTPUT)include/linux/: ../../../../include/uapi/linux/
 	mkdir -p $(OUTPUT)include/linux/ 2>&1 || true
-	ln -sf $(CURDIR)/../../include/uapi/linux/pcitest.h $@
+	ln -sf $(CURDIR)/../../../../include/uapi/linux/pcitest.h $@
 
+$(info ${CURDIR})
 prepare: $(OUTPUT)include/linux/
 
 PCITEST_IN := $(OUTPUT)pcitest-in.o
diff --git a/tools/pci/pcitest.c b/tools/testing/selftests/pci_endpoint/pcitest.c
similarity index 100%
rename from tools/pci/pcitest.c
rename to tools/testing/selftests/pci_endpoint/pcitest.c
diff --git a/tools/pci/pcitest.sh b/tools/testing/selftests/pci_endpoint/pcitest.sh
similarity index 100%
rename from tools/pci/pcitest.sh
rename to tools/testing/selftests/pci_endpoint/pcitest.sh
-- 
2.25.1


