Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17B9FEEB06
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 22:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbfKDVXO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 16:23:14 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:35398 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728634AbfKDVXN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 16:23:13 -0500
Received: from localhost.localdomain (80-110-127-196.cgn.dynamic.surfer.at [80.110.127.196])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 7F0F6C791A;
        Mon,  4 Nov 2019 21:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1572902591; bh=sHHFLZ4a/AYzel3aIkFvv+8ac5WlYoo+mlefNTaIupA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=k7ivHT3Io/k6Xg0RV2m9fPck3IBdmPejiUyKvhYUEVdUJAkfivbXkXcOq8VLDxE4U
         OeBUVJbVQp+LynKCXvk/KCc//dGprx5INq1ddMukvqY6CZLp/xWl++Zq7LejvdqSr8
         RCcVNRc8IU2Mu86Fre57gMjO4LNICKO+Uz9Atx5s=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: msm8974-FP2: Introduce the wcnss remoteproc node
Date:   Mon,  4 Nov 2019 22:23:02 +0100
Message-Id: <20191104212302.105469-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191104212302.105469-1-luca@z3ntu.xyz>
References: <20191104212302.105469-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the remoteproc node and add the necessary pinctrl states.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 .../boot/dts/qcom-msm8974-fairphone-fp2.dts   | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
index 26160394d717..d2d48770ec0f 100644
--- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
@@ -259,6 +259,25 @@
 		status = "ok";
 	};
 
+	remoteproc@fb21b000 {
+		status = "ok";
+
+		vddmx-supply = <&pm8841_s1>;
+		vddcx-supply = <&pm8841_s2>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&wcnss_pin_a>;
+
+		smd-edge {
+			qcom,remote-pid = <4>;
+			label = "pronto";
+
+			wcnss {
+				status = "ok";
+			};
+		};
+	};
+
 	pinctrl@fd510000 {
 		sdhc1_pin_a: sdhc1-pin-active {
 			clk {
@@ -287,6 +306,32 @@
 				bias-pull-up;
 			};
 		};
+
+		wcnss_pin_a: wcnss-pin-active {
+			wlan {
+				pins =  "gpio36", "gpio37", "gpio38", "gpio39", "gpio40";
+				function = "wlan";
+
+				drive-strength = <6>;
+				bias-pull-down;
+			};
+
+			bt {
+				pins = "gpio35", "gpio43", "gpio44";
+				function = "bt";
+
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			fm {
+				pins = "gpio41", "gpio42";
+				function = "fm";
+
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+		};
 	};
 
 	sdhci@f9824900 {
-- 
2.23.0

