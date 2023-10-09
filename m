Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93BEC7BE4DC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 17:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376839AbjJIPes (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 11:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376861AbjJIPeq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 11:34:46 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF0594
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 08:34:43 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32167a4adaaso4246368f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 08:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696865682; x=1697470482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JgFvFXMn5Y6xZ4S2gUYlHQTeZ5E3kahjOuIj+D5Dvo=;
        b=Bp3WutyjipES8TCyyg3fb3pdT8QmsUWTwOP2CiqoDdG3erpAT19+IziFAQAqk4R9ea
         5xrBnS61i3G/AzoNNiPhtFV4ttmLRRBxwwN5I9jbOA/3p2dQeVfyldMSkh6+d8mj+4ZQ
         tmJKNPMPGFPNIaxv2B2RRUaxA0rEHtty3oMj+/Jx5gC+vy1b7oVW/RONC18y9isGag8P
         xvWVnKDZlRc6myz4Ur2v9PacmoBnXBYQYdeGrsOgWaFqh1bdVY+YUaCXOAQ83RNTOE2j
         Cgmr2Pax0O3rq4u5lFOjyx8o9j80MJOCdagAJItk9JZQzq+xHc5mG4VH7h54XriFsusy
         /XnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696865682; x=1697470482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3JgFvFXMn5Y6xZ4S2gUYlHQTeZ5E3kahjOuIj+D5Dvo=;
        b=GR+GCoMCciB1G8BUCxVbkg1i0yRNJ9u8Op2omlMoi4R019BGfKELyPb4o2IyPqpmSL
         hQ+fqO2tZhTbpmqqjNCO08H9MMF72/LMAYbIXgn4xCMvSmh45HOV00fsaaHSliL+1bQg
         1FgJLNM2dBSlQtGTWInTDcSdIj1A1CZMVBW7mlOCnmL4two/MfVdf+is2VyTn5JJlH72
         SV4SZ0QL5SzHIigQKRMH+uenS+CaFYrTp1dq63ejw4+mv+yadHbOrhkO71QicJAlgudY
         i+b6WWfXJ/3N6XI4l/al2/QSHMzIfqzd1qkpS6L6paePWtfxLjbahLjts8f4CCxbAqaS
         lBBw==
X-Gm-Message-State: AOJu0Yy/zKAy/1+WgeGAPr7ORP9PGbGAKiXIu2xDSlrJBXHay/XujxEj
        6YM7K5lDpGCZ8tJTK24vDrxz5Q==
X-Google-Smtp-Source: AGHT+IEqi4677J4pAGP0xKAYVO8OCleif7+alJ1NmS0aO/nzLWnEnTcYF64a+uAPiUGjLKxHVg/fiQ==
X-Received: by 2002:adf:fd12:0:b0:321:4ca9:ee86 with SMTP id e18-20020adffd12000000b003214ca9ee86mr14312384wrr.53.1696865680844;
        Mon, 09 Oct 2023 08:34:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:f20d:2959:7545:e99f])
        by smtp.gmail.com with ESMTPSA id b3-20020adff243000000b0031431fb40fasm10016521wrp.89.2023.10.09.08.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 08:34:40 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@quicinc.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v3 01/15] firmware: qcom: move Qualcomm code into its own directory
Date:   Mon,  9 Oct 2023 17:34:13 +0200
Message-Id: <20231009153427.20951-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009153427.20951-1-brgl@bgdev.pl>
References: <20231009153427.20951-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We're getting more and more qcom specific .c files in drivers/firmware/
and about to get even more. Create a separate directory for Qualcomm
firmware drivers and move existing sources in there.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Acked-by: Elliot Berman <quic_eberman@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS                                   |  4 +-
 drivers/firmware/Kconfig                      | 48 +---------------
 drivers/firmware/Makefile                     |  5 +-
 drivers/firmware/qcom/Kconfig                 | 56 +++++++++++++++++++
 drivers/firmware/qcom/Makefile                |  9 +++
 drivers/firmware/{ => qcom}/qcom_qseecom.c    |  0
 .../{ => qcom}/qcom_qseecom_uefisecapp.c      |  0
 drivers/firmware/{ => qcom}/qcom_scm-legacy.c |  0
 drivers/firmware/{ => qcom}/qcom_scm-smc.c    |  0
 drivers/firmware/{ => qcom}/qcom_scm.c        |  0
 drivers/firmware/{ => qcom}/qcom_scm.h        |  0
 11 files changed, 69 insertions(+), 53 deletions(-)
 create mode 100644 drivers/firmware/qcom/Kconfig
 create mode 100644 drivers/firmware/qcom/Makefile
 rename drivers/firmware/{ => qcom}/qcom_qseecom.c (100%)
 rename drivers/firmware/{ => qcom}/qcom_qseecom_uefisecapp.c (100%)
 rename drivers/firmware/{ => qcom}/qcom_scm-legacy.c (100%)
 rename drivers/firmware/{ => qcom}/qcom_scm-smc.c (100%)
 rename drivers/firmware/{ => qcom}/qcom_scm.c (100%)
 rename drivers/firmware/{ => qcom}/qcom_scm.h (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index c934244acc31..0d032572cce0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17930,13 +17930,13 @@ QUALCOMM QSEECOM DRIVER
 M:	Maximilian Luz <luzmaximilian@gmail.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-F:	drivers/firmware/qcom_qseecom.c
+F:	drivers/firmware/qcom/qcom_qseecom.c
 
 QUALCOMM QSEECOM UEFISECAPP DRIVER
 M:	Maximilian Luz <luzmaximilian@gmail.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-F:	drivers/firmware/qcom_qseecom_uefisecapp.c
+F:	drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
 
 QUALCOMM RMNET DRIVER
 M:	Subash Abhinov Kasiviswanathan <quic_subashab@quicinc.com>
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 817e011a8945..74d00b0c83fe 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -188,53 +188,6 @@ config MTK_ADSP_IPC
 	  ADSP exists on some mtk processors.
 	  Client might use shared memory to exchange information with ADSP.
 
-config QCOM_SCM
-	tristate
-
-config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
-	bool "Qualcomm download mode enabled by default"
-	depends on QCOM_SCM
-	help
-	  A device with "download mode" enabled will upon an unexpected
-	  warm-restart enter a special debug mode that allows the user to
-	  "download" memory content over USB for offline postmortem analysis.
-	  The feature can be enabled/disabled on the kernel command line.
-
-	  Say Y here to enable "download mode" by default.
-
-config QCOM_QSEECOM
-	bool "Qualcomm QSEECOM interface driver"
-	depends on QCOM_SCM=y
-	select AUXILIARY_BUS
-	help
-	  Various Qualcomm SoCs have a Secure Execution Environment (SEE) running
-	  in the Trust Zone. This module provides an interface to that via the
-	  QSEECOM mechanism, using SCM calls.
-
-	  The QSEECOM interface allows, among other things, access to applications
-	  running in the SEE. An example of such an application is 'uefisecapp',
-	  which is required to access UEFI variables on certain systems. If
-	  selected, the interface will also attempt to detect and register client
-	  devices for supported applications.
-
-	  Select Y here to enable the QSEECOM interface driver.
-
-config QCOM_QSEECOM_UEFISECAPP
-	bool "Qualcomm SEE UEFI Secure App client driver"
-	depends on QCOM_QSEECOM
-	depends on EFI
-	help
-	  Various Qualcomm SoCs do not allow direct access to EFI variables.
-	  Instead, these need to be accessed via the UEFI Secure Application
-	  (uefisecapp), residing in the Secure Execution Environment (SEE).
-
-	  This module provides a client driver for uefisecapp, installing efivar
-	  operations to allow the kernel accessing EFI variables, and via that also
-	  provide user-space with access to EFI variables via efivarfs.
-
-	  Select Y here to provide access to EFI variables on the aforementioned
-	  platforms.
-
 config SYSFB
 	bool
 	select BOOT_VESA_SUPPORT
@@ -320,6 +273,7 @@ source "drivers/firmware/efi/Kconfig"
 source "drivers/firmware/imx/Kconfig"
 source "drivers/firmware/meson/Kconfig"
 source "drivers/firmware/psci/Kconfig"
+source "drivers/firmware/qcom/Kconfig"
 source "drivers/firmware/smccc/Kconfig"
 source "drivers/firmware/tegra/Kconfig"
 source "drivers/firmware/xilinx/Kconfig"
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index cb18fd8882dc..5f9dab82e1a0 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -17,10 +17,6 @@ obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
 obj-$(CONFIG_MTK_ADSP_IPC)	+= mtk-adsp-ipc.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
-obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
-qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
-obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
-obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
 obj-$(CONFIG_SYSFB)		+= sysfb.o
 obj-$(CONFIG_SYSFB_SIMPLEFB)	+= sysfb_simplefb.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
@@ -36,6 +32,7 @@ obj-$(CONFIG_GOOGLE_FIRMWARE)	+= google/
 obj-y				+= efi/
 obj-y				+= imx/
 obj-y				+= psci/
+obj-y				+= qcom/
 obj-y				+= smccc/
 obj-y				+= tegra/
 obj-y				+= xilinx/
diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
new file mode 100644
index 000000000000..3f05d9854ddf
--- /dev/null
+++ b/drivers/firmware/qcom/Kconfig
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# For a description of the syntax of this configuration file,
+# see Documentation/kbuild/kconfig-language.rst.
+#
+
+menu "Qualcomm firmware drivers"
+
+config QCOM_SCM
+	tristate
+
+config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
+	bool "Qualcomm download mode enabled by default"
+	depends on QCOM_SCM
+	help
+	  A device with "download mode" enabled will upon an unexpected
+	  warm-restart enter a special debug mode that allows the user to
+	  "download" memory content over USB for offline postmortem analysis.
+	  The feature can be enabled/disabled on the kernel command line.
+
+	  Say Y here to enable "download mode" by default.
+
+config QCOM_QSEECOM
+	bool "Qualcomm QSEECOM interface driver"
+	depends on QCOM_SCM=y
+	select AUXILIARY_BUS
+	help
+	  Various Qualcomm SoCs have a Secure Execution Environment (SEE) running
+	  in the Trust Zone. This module provides an interface to that via the
+	  QSEECOM mechanism, using SCM calls.
+
+	  The QSEECOM interface allows, among other things, access to applications
+	  running in the SEE. An example of such an application is 'uefisecapp',
+	  which is required to access UEFI variables on certain systems. If
+	  selected, the interface will also attempt to detect and register client
+	  devices for supported applications.
+
+	  Select Y here to enable the QSEECOM interface driver.
+
+config QCOM_QSEECOM_UEFISECAPP
+	bool "Qualcomm SEE UEFI Secure App client driver"
+	depends on QCOM_QSEECOM
+	depends on EFI
+	help
+	  Various Qualcomm SoCs do not allow direct access to EFI variables.
+	  Instead, these need to be accessed via the UEFI Secure Application
+	  (uefisecapp), residing in the Secure Execution Environment (SEE).
+
+	  This module provides a client driver for uefisecapp, installing efivar
+	  operations to allow the kernel accessing EFI variables, and via that also
+	  provide user-space with access to EFI variables via efivarfs.
+
+	  Select Y here to provide access to EFI variables on the aforementioned
+	  platforms.
+
+endmenu
diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
new file mode 100644
index 000000000000..c9f12ee8224a
--- /dev/null
+++ b/drivers/firmware/qcom/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the linux kernel.
+#
+
+obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
+qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
+obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
+obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
diff --git a/drivers/firmware/qcom_qseecom.c b/drivers/firmware/qcom/qcom_qseecom.c
similarity index 100%
rename from drivers/firmware/qcom_qseecom.c
rename to drivers/firmware/qcom/qcom_qseecom.c
diff --git a/drivers/firmware/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
similarity index 100%
rename from drivers/firmware/qcom_qseecom_uefisecapp.c
rename to drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
diff --git a/drivers/firmware/qcom_scm-legacy.c b/drivers/firmware/qcom/qcom_scm-legacy.c
similarity index 100%
rename from drivers/firmware/qcom_scm-legacy.c
rename to drivers/firmware/qcom/qcom_scm-legacy.c
diff --git a/drivers/firmware/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
similarity index 100%
rename from drivers/firmware/qcom_scm-smc.c
rename to drivers/firmware/qcom/qcom_scm-smc.c
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
similarity index 100%
rename from drivers/firmware/qcom_scm.c
rename to drivers/firmware/qcom/qcom_scm.c
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
similarity index 100%
rename from drivers/firmware/qcom_scm.h
rename to drivers/firmware/qcom/qcom_scm.h
-- 
2.39.2

