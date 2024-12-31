Return-Path: <linux-arm-msm+bounces-43746-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 313F09FEF92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 14:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 107CC1883234
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 13:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C409619F120;
	Tue, 31 Dec 2024 13:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iZPkARi5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F9219E968
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 13:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735650851; cv=none; b=K1aInwTDKyyOZJqgvhoZoihkBuHC1lHqSusawKVYU6gUR4rDOKJU1pgZWym+A5F7gZnKkRsoLKGeNYXm5xjG9DGyR9fzs5SbtoykyGkFgimVR28Tk9y9OmAabaZ90Frwp+nKw1RJJcGMA1KN1VHlAc7oUzh0FUIyvEnBGxkoB9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735650851; c=relaxed/simple;
	bh=v8whFl/jk7+v9u73VH0q13g2zK6IQeJsS/9Wvy4ZCpA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JOFoDJIP/y03oj2k6BzzPibz7xLowA1VQnFrI4OHnoF6wry4EH86j1LFDp8yrGiQeWU6siGp1sFB9xtBNZfRP2o4Dy/qPmb/sjnMlXfXe40eCz5un1azFYJTZ8sCumbjfn19N68PdJ0XBQuUwPpZe+QPWKJeqM2OGbjql+8RaFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iZPkARi5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2166f1e589cso160592105ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 05:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735650849; x=1736255649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xa1jN/asG74sjrgB8hwyWegLPzfHxpGYS7ycWDuiTK0=;
        b=iZPkARi5ILpnlbjIA6sF6rkZRFmUSmelceldXdyim1pBlkmujFr054ET4conjc9LcM
         jqFL9If4hDJ6C6YLkmHdFrGQKuLbvni14/KfTX58cuVi86lyEK2Wp4RIa1/NG6lusp5e
         XtvevibR+Dx5SDgH+w7VtLtnsKf6qioMik8av+n3Vcq01lI5QCo96cwS/VyNqPtTpyp3
         6LNazUmJ3dk79peWBZG2/yiui8hVJ2ca71JI5mJMmjZyoPBgNKp6GDDpGjhV1C+p3u/L
         NOn6oyYO73uoF/BXF1K/FyrRC3Hk1qoWdKDUSPNQWuLeJ4vJYba3PbZDLWs/427azYH8
         29Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735650849; x=1736255649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xa1jN/asG74sjrgB8hwyWegLPzfHxpGYS7ycWDuiTK0=;
        b=KW2DJ10WPEL+qojuUXKsq78WVKAD4xfQ+VaTm+CKLXMxzfNHCfygrTKZJx+AkUxc47
         cWyFTZT6zg+gWYOS3oNnt3fkqX7SOQPTYCa+jKNPsk6OzajCNtTsa50EYKC7BqY5Ca9A
         Rz3H4g+PGUg/BpYuez7CmaFU6DT32kxfVgeju22cnMNzJxcPsPoGFrqnfkelvLYnO4nT
         QsfzwN3Gp277JUjGcwL4Avmauhkq3pXgu0Tr0/IUiJr/6WPs0ehqNzInOfeHBqydvn9O
         kaXbt8VkpiRys0WLQqEjVwEwX2olv0Q7HTiRY4cVvkUGjJtVK4MMdDmXZjEMFmmBXGtB
         o81w==
X-Forwarded-Encrypted: i=1; AJvYcCW2+UZubnuM/ZfpYu2v3X8zpeKh9oBJEuk95fHmDZhO3zReaquNTocg4SCpUJCBgpCaFSfktNNecPosCmK8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2CBRudzmt+uqI1zbgAy1PmBgNp45vP/6QfNS5tQn8OhqBSlcP
	W/906o7BqTFQrSINIqSgP9dG8Z0W7O4y1L2mLbHqaTqmY/Z8Wi8Wcic7jbLo9w==
X-Gm-Gg: ASbGnctwn+4D/0OFYT1+vyiQaXa0LXFf9PLYI2hzjqrNWkzcS98+FOvD3JR059nUsoH
	jo1lLLcpEzA3JMf32sFcMhCElq0aV0kF+Xp1e2xGE/onO9DuM4Lzh3XhhA3Yf5iot+run9K/iSD
	TjksgkfjYKXa5B9JFeLkbwg0ZSjSESufWVu36iV4zuREzXS6KPtTeafXM/dII2Eo2Z4NrUOovw+
	CuE727z1P9PPAGM1SeIstC/Ug1xTQT76Cnj5teVa4Wh2z/c17XWG4+8jzsKWccPhi7MwN6dk1Xk
	UxVie8MTM1Y=
X-Google-Smtp-Source: AGHT+IGZUa+Nt5saRgpUAg+RSZhQyxrVDXNDUEbMn6mYhhN1yi9azaKToiDiWgeEgiAtKmbQZ/2U4A==
X-Received: by 2002:a05:6a00:124a:b0:725:f282:1f04 with SMTP id d2e1a72fcca58-72abde846e5mr55442921b3a.18.1735650849549;
        Tue, 31 Dec 2024 05:14:09 -0800 (PST)
Received: from localhost.localdomain ([117.193.213.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad6cc885sm20994862b3a.0.2024.12.31.05.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:14:09 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kw@linux.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	lpieralisi@kernel.org,
	shuah@kernel.org
Cc: kishon@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhelgaas@google.com,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	linux-kselftest@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 2/3] selftests: Move PCI Endpoint tests from tools/pci to Kselftests
Date: Tue, 31 Dec 2024 18:43:40 +0530
Message-Id: <20241231131341.39292-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231131341.39292-1-manivannan.sadhasivam@linaro.org>
References: <20241231131341.39292-1-manivannan.sadhasivam@linaro.org>
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
index 1e930c7a58b1..0e611b845d50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18003,7 +18003,7 @@ F:	Documentation/PCI/endpoint/*
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


