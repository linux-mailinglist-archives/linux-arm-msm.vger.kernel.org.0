Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9FD2FE42C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 08:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727425AbhAUHkU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 02:40:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:40542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbhAUHUW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 02:20:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 726C123A1D;
        Thu, 21 Jan 2021 07:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611213508;
        bh=h+FnArthq66xndfpWsFAxK7FHnJyAY6Cs3A8V9B1WC0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nyfeM0WI0p5CSnc2WUbULtfjVcNrK60h2ehrfLTQtfb3VKnCYTJflEkSQTP7aKeQr
         x2IFvg4iWlvC5z2i5USAHXAqFi+wPnmZP/nlm/7zr80hw0s4jdtz8fZCAn9HJ6rll8
         kEgEYNwNbNVlFo9OqjvTW+it/AriYck/Nscq07DhyRgYDuRtFWzDBZYLAJ0gpGoPx9
         SQd77r4aidPTDsTMc2TMj5JtMiTtqQNeZtgFenV6aOFpWeLpYOOFeduWRz98qhNEwV
         0E1OH2yuVOG6ic+3S9RChVKAekcF7LPcyfIBKE3Sr/8Sh1FwDhi7+2V8NRsdULCebc
         1D/1jCebbvUnQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1l2UEb-004BsX-PP; Thu, 21 Jan 2021 08:18:25 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mayulong <mayulong1@huawei.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 18/21] spmi: hisi-spmi-controller: move driver from staging
Date:   Thu, 21 Jan 2021 08:18:20 +0100
Message-Id: <edc1a3f12e802607be42c60814b141aa5e1554f4.1611212783.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611212783.git.mchehab+huawei@kernel.org>
References: <cover.1611212783.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Hisilicon 6421v600 SPMI driver is ready for mainstream.

So, move it from staging.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../spmi}/hisilicon,hisi-spmi-controller.yaml         |  0
 MAINTAINERS                                           |  7 +++++++
 drivers/spmi/Kconfig                                  |  9 +++++++++
 drivers/spmi/Makefile                                 |  1 +
 .../{staging/hikey9xx => spmi}/hisi-spmi-controller.c |  0
 drivers/staging/hikey9xx/Kconfig                      | 11 -----------
 drivers/staging/hikey9xx/Makefile                     |  1 -
 7 files changed, 17 insertions(+), 12 deletions(-)
 rename {drivers/staging/hikey9xx => Documentation/devicetree/bindings/spmi}/hisilicon,hisi-spmi-controller.yaml (100%)
 rename drivers/{staging/hikey9xx => spmi}/hisi-spmi-controller.c (100%)

diff --git a/drivers/staging/hikey9xx/hisilicon,hisi-spmi-controller.yaml b/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
similarity index 100%
rename from drivers/staging/hikey9xx/hisilicon,hisi-spmi-controller.yaml
rename to Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
diff --git a/MAINTAINERS b/MAINTAINERS
index 281de213ef47..056777397c68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7999,6 +7999,13 @@ F:	drivers/crypto/hisilicon/sec2/sec_crypto.c
 F:	drivers/crypto/hisilicon/sec2/sec_crypto.h
 F:	drivers/crypto/hisilicon/sec2/sec_main.c
 
+HISILICON SPMI CONTROLLER DRIVER FOR HIKEY 970
+M:	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
+F:	drivers/spmi/hisi-spmi-controller.c
+
 HISILICON STAGING DRIVERS FOR HIKEY 960/970
 M:	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
 L:	devel@driverdev.osuosl.org
diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
index a53bad541f1a..2874b6c26028 100644
--- a/drivers/spmi/Kconfig
+++ b/drivers/spmi/Kconfig
@@ -11,6 +11,15 @@ menuconfig SPMI
 
 if SPMI
 
+config SPMI_HISI3670
+	tristate "Hisilicon 3670 SPMI Controller"
+	select IRQ_DOMAIN_HIERARCHY
+	depends on HAS_IOMEM
+	help
+	  If you say yes to this option, support will be included for the
+	  built-in SPMI PMIC Arbiter interface on Hisilicon 3670
+	  processors.
+
 config SPMI_MSM_PMIC_ARB
 	tristate "Qualcomm MSM SPMI Controller (PMIC Arbiter)"
 	select IRQ_DOMAIN_HIERARCHY
diff --git a/drivers/spmi/Makefile b/drivers/spmi/Makefile
index 55a94cadeffe..6e092e6f290c 100644
--- a/drivers/spmi/Makefile
+++ b/drivers/spmi/Makefile
@@ -4,4 +4,5 @@
 #
 obj-$(CONFIG_SPMI)	+= spmi.o
 
+obj-$(CONFIG_SPMI_HISI3670)	+= hisi-spmi-controller.o
 obj-$(CONFIG_SPMI_MSM_PMIC_ARB)	+= spmi-pmic-arb.o
diff --git a/drivers/staging/hikey9xx/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
similarity index 100%
rename from drivers/staging/hikey9xx/hisi-spmi-controller.c
rename to drivers/spmi/hisi-spmi-controller.c
diff --git a/drivers/staging/hikey9xx/Kconfig b/drivers/staging/hikey9xx/Kconfig
index b29f5d5df134..6dc9f9307510 100644
--- a/drivers/staging/hikey9xx/Kconfig
+++ b/drivers/staging/hikey9xx/Kconfig
@@ -11,17 +11,6 @@ config PHY_HI3670_USB
 
 	  To compile this driver as a module, choose M here.
 
-# to be placed at drivers/spmi
-config SPMI_HISI3670
-	tristate "Hisilicon 3670 SPMI Controller"
-	select IRQ_DOMAIN_HIERARCHY
-	depends on HAS_IOMEM
-	depends on SPMI
-	help
-	  If you say yes to this option, support will be included for the
-	  built-in SPMI PMIC Arbiter interface on Hisilicon 3670
-	  processors.
-
 # to be placed at drivers/mfd
 config MFD_HI6421_SPMI
 	tristate "HiSilicon Hi6421v600 SPMI PMU/Codec IC"
diff --git a/drivers/staging/hikey9xx/Makefile b/drivers/staging/hikey9xx/Makefile
index 1924fadac952..64b419cf7bca 100644
--- a/drivers/staging/hikey9xx/Makefile
+++ b/drivers/staging/hikey9xx/Makefile
@@ -2,6 +2,5 @@
 
 obj-$(CONFIG_PHY_HI3670_USB)		+= phy-hi3670-usb3.o
 
-obj-$(CONFIG_SPMI_HISI3670)		+= hisi-spmi-controller.o
 obj-$(CONFIG_MFD_HI6421_SPMI)		+= hi6421-spmi-pmic.o
 obj-$(CONFIG_REGULATOR_HI6421V600)	+= hi6421v600-regulator.o
-- 
2.29.2

