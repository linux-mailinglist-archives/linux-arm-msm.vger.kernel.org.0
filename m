Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510EC225A84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 10:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727881AbgGTIy3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 04:54:29 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:32481 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbgGTIy2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 04:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595235264;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=P50bqUKae+4BoV1Ia2wCGoVIA+nByJSgCS2UVC9KFyU=;
        b=It/z2W3N6iZS/Z3w4x7NMFh3rYA7m4eegaVGJ5E6LBYWYWT7NmYOg1vmJXhPEl4veE
        YhaxLbQPpyN5lhUxPt7RSQgQCjSeTmoUXAu/yewMJFXe3PCgu/5OOEEMDUWBe+pt2kT3
        kAfuS3sp9vvCtWTfqnSmhlD76xa9gsIvknfzbrlcpYcoCn6wb1YiRkES5taya0Sb8v5E
        sXttkbJOf1ni3hMF5aI2wpsoiv7aT2KpClWN9XJtVyhVhTwW9YY77c+cuvH/d9y5NVl1
        E7IHJJxgiYGd5nWRP65DxeW2KGrkO7K+I5ozS6d/gRnIIzpn3kzPEs0ZgZSLArbYVDkn
        QFpQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6NeHYC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew6K8sMdgO
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 20 Jul 2020 10:54:22 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 09/10] arm64: dts: qcom: msm8916: Set default pinctrl for blsp1_uart1/2
Date:   Mon, 20 Jul 2020 10:54:05 +0200
Message-Id: <20200720085406.6716-10-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720085406.6716-1-stephan@gerhold.net>
References: <20200720085406.6716-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Right now some device nodes set default pinctrl within msm8916.dtsi
(e.g. I2C, SPI), but for others it needs to be explicitly set in the
board-specific device tree (e.g. UART).

While it is theoretically possible that some super special board
needs different pinctrl for these, in practice pretty much every
board ends up using the common pinctrl definitions.

Make this consistent by also defining the common pinctrl properties
for blsp1_uart1 and blsp1_uart2 so we don't need to copy this for every
board. If there is really such a super special board it could just
override these properties with custom pinctrl or make minor modifications
to the common pinctrl configurations provided by msm8916-pins.dtsi.

Also move #address-cells/#size-cells for &dsi0 to msm8916.dtsi
since this is specific to the DSI node, not the board.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi                | 8 --------
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts     | 4 ----
 arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi                | 3 ---
 .../boot/dts/qcom/msm8916-samsung-a2015-common.dtsi      | 7 -------
 arch/arm64/boot/dts/qcom/msm8916.dtsi                    | 9 +++++++++
 5 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 91852f929141..1ecc49e36319 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -235,19 +235,11 @@ &blsp_spi5 {
 &blsp1_uart1 {
 	status = "okay";
 	label = "LS-UART0";
-
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&blsp1_uart1_default>;
-	pinctrl-1 = <&blsp1_uart1_sleep>;
 };
 
 &blsp1_uart2 {
 	status = "okay";
 	label = "LS-UART1";
-
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&blsp1_uart2_default>;
-	pinctrl-1 = <&blsp1_uart2_sleep>;
 };
 
 &camss {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 8a6a9cd4a3fe..dec5e3ba7df4 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -54,10 +54,6 @@ volume-up {
 
 &blsp1_uart2 {
 	status = "okay";
-
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&blsp1_uart2_default>;
-	pinctrl-1 = <&blsp1_uart2_sleep>;
 };
 
 &pm8916_resin {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
index 9c4926326f21..1bd05046cdeb 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
@@ -18,7 +18,4 @@ chosen {
 
 &blsp1_uart2 {
 	status = "okay";
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&blsp1_uart2_default>;
-	pinctrl-1 = <&blsp1_uart2_sleep>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index f1ddb23ac3c3..eb667f4b0e05 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -115,16 +115,9 @@ magnetometer@12 {
 
 &blsp1_uart2 {
 	status = "okay";
-
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&blsp1_uart2_default>;
-	pinctrl-1 = <&blsp1_uart2_sleep>;
 };
 
 &dsi0 {
-	#address-cells = <1>;
-	#size-cells = <0>;
-
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&mdss_default>;
 	pinctrl-1 = <&mdss_sleep>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 141348a92788..273faffab369 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -487,6 +487,9 @@ blsp1_uart1: serial@78af000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp_dma 1>, <&blsp_dma 0>;
 			dma-names = "rx", "tx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_uart1_default>;
+			pinctrl-1 = <&blsp1_uart1_sleep>;
 			status = "disabled";
 		};
 
@@ -513,6 +516,9 @@ blsp1_uart2: serial@78b0000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp_dma 3>, <&blsp_dma 2>;
 			dma-names = "rx", "tx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_uart2_default>;
+			pinctrl-1 = <&blsp1_uart2_sleep>;
 			status = "disabled";
 		};
 
@@ -1113,6 +1119,9 @@ dsi0: dsi@1a98000 {
 				phys = <&dsi_phy0>;
 				phy-names = "dsi-phy";
 
+				#address-cells = <1>;
+				#size-cells = <0>;
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.27.0

