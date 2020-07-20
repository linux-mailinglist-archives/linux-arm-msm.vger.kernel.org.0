Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11DAD225A7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 10:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgGTIy0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 04:54:26 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:26062 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgGTIyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 04:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595235262;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=NInr2D0dwMPC+kO5dWmv8Z6xjbIzLaZOm/bqLcHIy1A=;
        b=BjA6CNnUVanH4JMoZAR0rQT5zadD1PAivZEAvsE8q8HF9YAVbxv7pLmalsuo6ANI5U
        E96DeiurTb98z3hqfunBj2An1Wym3GPkz2q2tHywlVmo3DQ8qyb6ysTCMU+jAGpdSsWv
        rnxH1ouoPsPHwVf66yffmPTDFz4FMVjXdagmqoIbbpPQZe8C9ghTAxdHa4yrTkgYTg7t
        JAaTLMkS02zxnumP1bsY9UDpxxFakJcfHSZuF0d70ST9bMgcz0lH1wWs5lVkMDc+W6gK
        gygtbQhkN7DLVYAcvOymLCVfUHt8NAjr5NXYDxm4PEn2JAZbZdCNbhALZb3rSaXEt8i3
        verQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6NeHYC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew6K8sKdgI
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 20 Jul 2020 10:54:20 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 06/10] arm64: dts: qcom: pm8916: Add resin node
Date:   Mon, 20 Jul 2020 10:54:02 +0200
Message-Id: <20200720085406.6716-7-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720085406.6716-1-stephan@gerhold.net>
References: <20200720085406.6716-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Right now we define the entire pm8916 resin node separately in
the board-specific device tree part, including the interrupt that
belongs to PM8916.

As a feature of the PMIC it should be declared in pm8916.dtsi,
disabled by default. Like all other optional components it can then
by enabled and configured in the board-specific device tree part.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi     | 19 +++++--------------
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 18 +++++-------------
 .../qcom/msm8916-samsung-a2015-common.dtsi    | 18 +++++-------------
 arch/arm64/boot/dts/qcom/pm8916.dtsi          |  8 ++++++++
 4 files changed, 23 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 89cc53ddf6b5..0627ef9bd54a 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -323,6 +323,11 @@ &lpass {
 	status = "okay";
 };
 
+&pm8916_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
 &pronto {
 	status = "okay";
 };
@@ -393,20 +398,6 @@ codec {
 	};
 };
 
-&spmi_bus {
-	pm8916_0: pm8916@0 {
-		pon@800 {
-			resin {
-				compatible = "qcom,pm8941-resin";
-				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
-				debounce = <15625>;
-				bias-pull-up;
-				linux,code = <KEY_VOLUMEDOWN>;
-			};
-		};
-	};
-};
-
 &usb {
 	status = "okay";
 	extcon = <&usb_id>, <&usb_id>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 68d89a8acbcf..90ce0f96eda4 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -61,6 +61,11 @@ &blsp1_uart2 {
 	pinctrl-1 = <&blsp1_uart2_sleep>;
 };
 
+&pm8916_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
 &pronto {
 	status = "okay";
 };
@@ -89,19 +94,6 @@ &sdhc_2 {
 	non-removable;
 };
 
-&spmi_bus {
-	pm8916@0 {
-		pon@800 {
-			volume-down {
-				compatible = "qcom,pm8941-resin";
-				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
-				bias-pull-up;
-				linux,code = <KEY_VOLUMEDOWN>;
-			};
-		};
-	};
-};
-
 &usb {
 	status = "okay";
 	dr_mode = "peripheral";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index 89b1418eeeb4..c6eb0b0cd849 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -138,6 +138,11 @@ &dsi_phy0 {
 	vddio-supply = <&pm8916_l6>;
 };
 
+&pm8916_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
 &pronto {
 	status = "okay";
 };
@@ -166,19 +171,6 @@ &sdhc_2 {
 	cd-gpios = <&msmgpio 38 GPIO_ACTIVE_LOW>;
 };
 
-&spmi_bus {
-	pm8916@0 {
-		pon@800 {
-			volume-down {
-				compatible = "qcom,pm8941-resin";
-				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
-				bias-pull-up;
-				linux,code = <KEY_VOLUMEDOWN>;
-			};
-		};
-	};
-};
-
 &usb {
 	status = "okay";
 	extcon = <&muic>, <&muic>;
diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index 0bcdf0471107..c3f62090aff7 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -33,6 +33,14 @@ pwrkey {
 				linux,code = <KEY_POWER>;
 			};
 
+			pm8916_resin: resin {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				status = "disabled";
+			};
+
 			watchdog {
 				compatible = "qcom,pm8916-wdt";
 				interrupts = <0x0 0x8 6 IRQ_TYPE_EDGE_RISING>;
-- 
2.27.0

