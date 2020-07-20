Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0E3225A77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 10:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbgGTIy0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 04:54:26 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:23358 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbgGTIyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 04:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595235260;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=sMSf89oNgXFNR/QeFcbmrQ2NUJTKYJ1K/o8t1gfMtOo=;
        b=GiBLvzSEbEQIQ6DOA0xhDJX9zK+C0LGrnz9zCYjEPVdC3H4a9/AG1p/yKFpxHN1PTE
        MHzRoL6thBvyvf1CvrJkS4cKaFxjLiYT0jEGlKvvF6ySDilen/nIt6lalM8JX2OCnSIv
        4YKzTCY4gAVP1fSnmbKr7FYkoCAV8A1KGiM3IA8xG2OniYnR1YwFUqZFSglfdjiO73Fo
        WOo2oxKb7rUqxidqFDIPPK+zmiQ1PopLrDpoFWoZ5n7CkxLUS4BQggtE7YixVXz0pSPB
        uwcQ4EaGOkb06rF6VIOB+LEDoqcxPz6n4Nn82d7l4fe5Fhwp6j3b4ZI7+Kzxp75cq4fQ
        M0Yg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6NeHYC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew6K8sIdgF
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 20 Jul 2020 10:54:18 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 03/10] arm64: dts: qcom: apq8016-sbc: Define leds outside of soc node
Date:   Mon, 20 Jul 2020 10:53:59 +0200
Message-Id: <20200720085406.6716-4-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720085406.6716-1-stephan@gerhold.net>
References: <20200720085406.6716-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The leds node does not use any memory regions of the SoC and should
therefore be declared outside the "soc" node.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 104 +++++++++++-----------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 1155e51c4e4f..47a4ebd86bee 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -307,58 +307,6 @@ spi@78b9000 {
 			status = "okay";
 		};
 
-		leds {
-			pinctrl-names = "default";
-			pinctrl-0 = <&msmgpio_leds>,
-				    <&pm8916_gpios_leds>,
-				    <&pm8916_mpps_leds>;
-
-			compatible = "gpio-leds";
-
-			led@1 {
-				label = "apq8016-sbc:green:user1";
-				gpios = <&msmgpio 21 GPIO_ACTIVE_HIGH>;
-				linux,default-trigger = "heartbeat";
-				default-state = "off";
-			};
-
-			led@2 {
-				label = "apq8016-sbc:green:user2";
-				gpios = <&msmgpio 120 GPIO_ACTIVE_HIGH>;
-				linux,default-trigger = "mmc0";
-				default-state = "off";
-			};
-
-			led@3 {
-				label = "apq8016-sbc:green:user3";
-				gpios = <&pm8916_gpios 1 GPIO_ACTIVE_HIGH>;
-				linux,default-trigger = "mmc1";
-				default-state = "off";
-			};
-
-			led@4 {
-				label = "apq8016-sbc:green:user4";
-				gpios = <&pm8916_gpios 2 GPIO_ACTIVE_HIGH>;
-				linux,default-trigger = "none";
-				panic-indicator;
-				default-state = "off";
-			};
-
-			led@5 {
-				label = "apq8016-sbc:yellow:wlan";
-				gpios = <&pm8916_mpps 2 GPIO_ACTIVE_HIGH>;
-				linux,default-trigger = "phy0tx";
-				default-state = "off";
-			};
-
-			led@6 {
-				label = "apq8016-sbc:blue:bt";
-				gpios = <&pm8916_mpps 3 GPIO_ACTIVE_HIGH>;
-				linux,default-trigger = "bluetooth-power";
-				default-state = "off";
-			};
-		};
-
 		sdhci@7824000 {
 			vmmc-supply = <&pm8916_l8>;
 			vqmmc-supply = <&pm8916_l5>;
@@ -563,6 +511,58 @@ button@0 {
 			gpios = <&msmgpio 107 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	leds {
+		pinctrl-names = "default";
+		pinctrl-0 = <&msmgpio_leds>,
+			    <&pm8916_gpios_leds>,
+			    <&pm8916_mpps_leds>;
+
+		compatible = "gpio-leds";
+
+		led@1 {
+			label = "apq8016-sbc:green:user1";
+			gpios = <&msmgpio 21 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "off";
+		};
+
+		led@2 {
+			label = "apq8016-sbc:green:user2";
+			gpios = <&msmgpio 120 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "mmc0";
+			default-state = "off";
+		};
+
+		led@3 {
+			label = "apq8016-sbc:green:user3";
+			gpios = <&pm8916_gpios 1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "mmc1";
+			default-state = "off";
+		};
+
+		led@4 {
+			label = "apq8016-sbc:green:user4";
+			gpios = <&pm8916_gpios 2 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "none";
+			panic-indicator;
+			default-state = "off";
+		};
+
+		led@5 {
+			label = "apq8016-sbc:yellow:wlan";
+			gpios = <&pm8916_mpps 2 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "phy0tx";
+			default-state = "off";
+		};
+
+		led@6 {
+			label = "apq8016-sbc:blue:bt";
+			gpios = <&pm8916_mpps 3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "bluetooth-power";
+			default-state = "off";
+		};
+	};
 };
 
 &camss {
-- 
2.27.0

