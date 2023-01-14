Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF9766A75E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jan 2023 01:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjANAJP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 19:09:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjANAJN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 19:09:13 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26D48CD38
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 16:09:12 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id jl4so24996560plb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 16:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iCt1TVcQGT69o0NxFcLxxxAse3ihgOBwig0LVJHKNSQ=;
        b=PbPnpcZ8eF/CwYhed0OtyJu8Vmo2IAckT9ykkO30Wp2z+MDwWjyn/lhG4KDd0f171G
         qP5MTty7fpLNF1p7JwY3jjwkYxy9Bikgc7JsJBqj4XvvfhK+f1Y0DBZgOddOIO/4xHNf
         wo+du5YEL8RN8nKdgGHhfMUzV749F4sCl1kh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCt1TVcQGT69o0NxFcLxxxAse3ihgOBwig0LVJHKNSQ=;
        b=47dhe2ycm8CndxQ/p5pY+z+MiQKLptibTqMki6hJbStczw5sejhxMc4Th7FZcfa1E3
         LREH2a+fW+ZK/xIMzDxuBvkPc+2DBN+o040ouNOzSSNgblQZhFJh/XOvaG7tVm4z32/v
         0o85SDGbFuMnW+3XnktATmPhFx8g87M9xLLUAIi8CVS+o8G6I5AgX02IKqrpIty6gR3H
         iXNqTEtXpDw/JME/ydrY6hfhf92DvkX3wBxhS9/9HGv6c4Xe1bHaWuQiYR/c7qHU2CvL
         8v4ndjEpROXge+ZYj8Irh3DFN1jU4/J7rxru27ITasOgvsDIc9K7GqiQBNfrWMpoHmC+
         66bg==
X-Gm-Message-State: AFqh2kpEE7lnEuQXWg9b1TXPaldDiyX+BYSuhbBOXSDnJSYEZ6SOCctR
        3W0Va+inkoO0Nz0husYc118D5A==
X-Google-Smtp-Source: AMrXdXvx17AIp+ECFymjutA1xBaxl0yWe14V9QyFLYnxxmH8Bd1cQLvxABFqH5ZfQYMYlm2zXzKovg==
X-Received: by 2002:a17:902:8d81:b0:194:4339:f12e with SMTP id v1-20020a1709028d8100b001944339f12emr13815441plo.1.1673654952381;
        Fri, 13 Jan 2023 16:09:12 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:11a:201:4652:3752:b9b7:29f9])
        by smtp.gmail.com with ESMTPSA id n15-20020a170902d2cf00b0018963b8e131sm14637072plc.290.2023.01.13.16.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 16:09:11 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] phy: qcom-qmp: Introduce Kconfig symbols for discrete drivers
Date:   Fri, 13 Jan 2023 16:09:10 -0800
Message-Id: <20230114000910.1256462-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce a config option for each QMP PHY driver now that the QMP PHY
mega-driver has been split up into different modules. This allows kernel
configurators to limit the binary size of the kernel by only compiling
in the QMP PHY driver that they need, or to split the module up into one
per PHY driver instead of one module for all the QMP PHY drivers.

Leave the old config QCOM_QMP in place and make it into a menuconfig so
that 'make olddefconfig' continues to work. Furthermore, set the default
of the new Kconfig symbols to be QCOM_QMP so that the transition is
smooth.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/phy/qualcomm/Kconfig  | 50 ++++++++++++++++++++++++++++++++---
 drivers/phy/qualcomm/Makefile | 12 ++++-----
 2 files changed, 52 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 5c98850f5a36..1d3a8062e651 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -50,13 +50,55 @@ config PHY_QCOM_PCIE2
 	  Enable this to support the Qualcomm PCIe PHY, used with the Synopsys
 	  based PCIe controller.
 
-config PHY_QCOM_QMP
-	tristate "Qualcomm QMP PHY Driver"
+menuconfig PHY_QCOM_QMP
+	tristate "Qualcomm QMP PHY Drivers"
 	depends on OF && COMMON_CLK && (ARCH_QCOM || COMPILE_TEST)
+
+if PHY_QCOM_QMP
+
+config PHY_QCOM_QMP_COMBO
+	tristate "Qualcomm QMP Combo PHY Driver"
+	default PHY_QCOM_QMP
+	select GENERIC_PHY
+	help
+	  Enable this to support the QMP Combo PHY transceiver that is used
+	  with USB3 and DisplayPort controllers on Qualcomm chips.
+
+config PHY_QCOM_QMP_PCIE
+	tristate "Qualcomm QMP PCIe PHY Driver"
+	depends on PCI || COMPILE_TEST
+	select GENERIC_PHY
+	default PHY_QCOM_QMP
+	help
+	  Enable this to support the QMP PCIe PHY transceiver that is used
+	  with PCIe controllers on Qualcomm chips.
+
+config PHY_QCOM_QMP_PCIE_8996
+	tristate "Qualcomm QMP PCIe 8996 PHY Driver"
+	depends on PCI || COMPILE_TEST
 	select GENERIC_PHY
+	default PHY_QCOM_QMP
 	help
-	  Enable this to support the QMP PHY transceiver that is used
-	  with controllers such as PCIe, UFS, and USB on Qualcomm chips.
+	  Enable this to support the QMP PCIe PHY transceiver that is used
+	  with PCIe controllers on Qualcomm msm8996 chips.
+
+config PHY_QCOM_QMP_UFS
+	tristate "Qualcomm QMP UFS PHY Driver"
+	select GENERIC_PHY
+	default PHY_QCOM_QMP
+	help
+	  Enable this to support the QMP UFS PHY transceiver that is used
+	  with UFS controllers on Qualcomm chips.
+
+config PHY_QCOM_QMP_USB
+	tristate "Qualcomm QMP USB PHY Driver"
+	select GENERIC_PHY
+	default PHY_QCOM_QMP
+	help
+	  Enable this to support the QMP USB PHY transceiver that is used
+	  with USB3 controllers on Qualcomm chips.
+
+endif # PHY_QCOM_QMP
 
 config PHY_QCOM_QUSB2
 	tristate "Qualcomm QUSB2 PHY Driver"
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 65f6c30a3e93..79dd4e507961 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -5,12 +5,12 @@ obj-$(CONFIG_PHY_QCOM_EDP)		+= phy-qcom-edp.o
 obj-$(CONFIG_PHY_QCOM_IPQ4019_USB)	+= phy-qcom-ipq4019-usb.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_SATA)	+= phy-qcom-ipq806x-sata.o
 obj-$(CONFIG_PHY_QCOM_PCIE2)		+= phy-qcom-pcie2.o
-obj-$(CONFIG_PHY_QCOM_QMP)		+= \
-	phy-qcom-qmp-combo.o \
-	phy-qcom-qmp-pcie.o \
-	phy-qcom-qmp-pcie-msm8996.o \
-	phy-qcom-qmp-ufs.o \
-	phy-qcom-qmp-usb.o
+
+obj-$(CONFIG_PHY_QCOM_QMP_COMBO)	+= phy-qcom-qmp-combo.o
+obj-$(CONFIG_PHY_QCOM_QMP_PCIE)		+= phy-qcom-qmp-pcie.o
+obj-$(CONFIG_PHY_QCOM_QMP_PCIE_8996)	+= phy-qcom-qmp-pcie-msm8996.o
+obj-$(CONFIG_PHY_QCOM_QMP_UFS)		+= phy-qcom-qmp-ufs.o
+obj-$(CONFIG_PHY_QCOM_QMP_USB)		+= phy-qcom-qmp-usb.o
 
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o

base-commit: 30a0b95b1335e12efef89dd78518ed3e4a71a763
-- 
https://chromeos.dev

