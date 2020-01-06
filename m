Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6991313CA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 15:36:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgAFOgr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 09:36:47 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40552 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgAFOgr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 09:36:47 -0500
Received: by mail-wr1-f68.google.com with SMTP id c14so49832896wrn.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 06:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4/Feq/rl6du9+WwKmwHvwjCEbxCtkVApIqBg0qi4BAU=;
        b=Kwkiv6kTlXRw0zfK2SsUQb1YAw6N2Fo7iNI1TA7T289RrCSp0B33ZIQA/fyd3xkPq1
         LT0AoU2e7/X9iYwny/jGYc7Xfwf0yL6PJRDGWJ4EOBD62UlWMpKxPXceB/JXGYWeur5A
         Jy8H3eL6qiWJTQZwrFBvUXBHIPuLP/h/KxHpiNyCy1iNURkCRPySRPqA6xOPEwxL/qZH
         W96es1Kzimsx3HHQQIg1hDzwkdHwlq/kLBnSx+WwLut+pv4wuEfAxS5g+ygBawsWbpng
         Lrx0Ou8FkjIFoj21GPE2iNpuvjWIWrJS9XpDatiQlkNOwpzqGZ0CE1bVmcFNA3UBfyvt
         hZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4/Feq/rl6du9+WwKmwHvwjCEbxCtkVApIqBg0qi4BAU=;
        b=KgVr/FkLifd+jenebnBodr2oCwgKkpKGXnVBNg0CAJS8Yvm0rsC+LyLaktob8ni4VX
         57ParCD+guyQhlonN4U410pIqqc4Ixq88/eQ2Z83cecQiNCjVTdPN1mOAmOpokHxTnns
         vSCR3n+9EyuY6vs6DXqnnARbd2+4otfN3siEzeiQyhH0Rq2TXKJuf1iasfvfmd0xLuwy
         el1UlhirsKHmFNZr6xVE183dRNpdFXPbnsQhzb4HSJ3xsrFOrz2ssfRB8w7RP4/OUzGR
         ZbAqUpT22VYgL88BgzVxtTo20HR2vTg3+GbwPchRANuQbB/lm1NWBeZj0HNEwvHO80Wx
         9q0A==
X-Gm-Message-State: APjAAAVr13MphAXoq1QH/Q1L/OdG92k2Cng32PBPz/W2A5DqKeWVgS8n
        E69vdWfQLjg0azS5P58XGwRL6A==
X-Google-Smtp-Source: APXvYqy6pRTUkXogQo9TN9R1Ao4bR0NLxiBkmvJ0ChfpK+LQLTLdU7Z8rRdAXtUwtY7lbAVxma6tsg==
X-Received: by 2002:adf:8b4f:: with SMTP id v15mr75604316wra.231.1578321404543;
        Mon, 06 Jan 2020 06:36:44 -0800 (PST)
Received: from localhost.localdomain (93-137-254-179.adsl.net.t-com.hr. [93.137.254.179])
        by smtp.googlemail.com with ESMTPSA id b17sm70224301wrp.49.2020.01.06.06.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 06:36:43 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        Sven Eckelmann <sven.eckelmann@openmesh.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH] ARM: dts: qcom: add gpio-ranges property
Date:   Mon,  6 Jan 2020 15:36:33 +0100
Message-Id: <20200106143633.1268701-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Christian Lamparter <chunkeey@gmail.com>

This patch adds the gpio-ranges property to almost all of
the Qualcomm ARM platforms that utilize the pinctrl-msm
framework.

The gpio-ranges property is part of the gpiolib subsystem.
As a result, the binding text is available in section
"2.1 gpio- and pin-controller interaction" of
Documentation/devicetree/bindings/gpio/gpio.txt

For more information please see the patch titled:
"pinctrl: msm: fix gpio-hog related boot issues" from
this series.

Reported-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
Tested-by: Sven Eckelmann <sven.eckelmann@openmesh.com> [ipq4019]
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
Tested-by: Robert Marko <robert.marko@sartura.hr> [ipq4019]
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi   | 1 +
 arch/arm/boot/dts/qcom-apq8084.dtsi   | 1 +
 arch/arm/boot/dts/qcom-ipq4019.dtsi   | 1 +
 arch/arm/boot/dts/qcom-ipq8064.dtsi   | 1 +
 arch/arm/boot/dts/qcom-mdm9615.dtsi   | 1 +
 arch/arm/boot/dts/qcom-msm8660.dtsi   | 1 +
 arch/arm/boot/dts/qcom-msm8960.dtsi   | 1 +
 arch/arm/boot/dts/qcom-msm8974.dtsi   | 1 +
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 1 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 +
 13 files changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 8b79b4112ee1..2687c4e890ba 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -350,6 +350,7 @@
 			reg = <0x800000 0x4000>;
 
 			gpio-controller;
+			gpio-ranges = <&tlmm_pinmux 0 0 90>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index 0a0fb147ebb9..4cc2d33f3d3b 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -401,6 +401,7 @@
 			compatible = "qcom,apq8084-pinctrl";
 			reg = <0xfd510000 0x4000>;
 			gpio-controller;
+			gpio-ranges = <&tlmm 0 0 147>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 72d4e290b543..b6e5203a210b 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -201,6 +201,7 @@
 			compatible = "qcom,ipq4019-pinctrl";
 			reg = <0x01000000 0x300000>;
 			gpio-controller;
+			gpio-ranges = <&tlmm 0 0 100>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 16c0da97932c..4021f661cd11 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -119,6 +119,7 @@
 			reg = <0x800000 0x4000>;
 
 			gpio-controller;
+			gpio-ranges = <&qcom_pinmux 0 0 69>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
index 356e9535f7a6..347b4f7d7889 100644
--- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
+++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
@@ -128,6 +128,7 @@
 		msmgpio: pinctrl@800000 {
 			compatible = "qcom,mdm9615-pinctrl";
 			gpio-controller;
+			gpio-ranges = <&msmgpio 0 0 88>;
 			#gpio-cells = <2>;
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index ec5cbc468bd3..480fc08cbe8e 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -115,6 +115,7 @@
 			reg = <0x800000 0x4000>;
 
 			gpio-controller;
+			gpio-ranges = <&tlmm 0 0 173>;
 			#gpio-cells = <2>;
 			interrupts = <0 16 0x4>;
 			interrupt-controller;
diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
index f2aeaccdc1ad..172ea3c70eac 100644
--- a/arch/arm/boot/dts/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
@@ -107,6 +107,7 @@
 		msmgpio: pinctrl@800000 {
 			compatible = "qcom,msm8960-pinctrl";
 			gpio-controller;
+			gpio-ranges = <&msmgpio 0 0 152>;
 			#gpio-cells = <2>;
 			interrupts = <0 16 0x4>;
 			interrupt-controller;
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 369e58f64145..1689cf925b03 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -707,6 +707,7 @@
 			compatible = "qcom,msm8974-pinctrl";
 			reg = <0xfd510000 0x4000>;
 			gpio-controller;
+			gpio-ranges = <&msmgpio 0 0 146>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 67ee5f560104..2b31823d3ccd 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -21,6 +21,7 @@
 			reg = <0x1000000 0x300000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
+			gpio-ranges = <&tlmm 0 0 70>;
 			#gpio-cells = <0x2>;
 			interrupt-controller;
 			#interrupt-cells = <0x2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5ea9fb8f2f87..2d1cbe762b3a 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -374,6 +374,7 @@
 			reg = <0x1000000 0x300000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
+			gpio-ranges = <&msmgpio 0 0 122>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 8be60c08a9ab..2021795c99ad 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -171,6 +171,7 @@
 			reg = <0xfd510000 0x4000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
+			gpio-ranges = <&msmgpio 0 0 146>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 3932757f78b7..b1c2d7d6a0f2 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -133,6 +133,7 @@
 			reg = <0xfd510000 0x4000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
+			gpio-ranges = <&msmgpio 0 0 146>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 87f4d9c1b0d4..81576aeb2408 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1234,6 +1234,7 @@
 			reg = <0x01010000 0x300000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
+			gpio-ranges = <&msmgpio 0 0 150>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-- 
2.24.1

