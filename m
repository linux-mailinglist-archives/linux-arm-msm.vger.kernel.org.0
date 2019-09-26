Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 529A9BF980
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 20:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbfIZSov (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 14:44:51 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:41790 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728192AbfIZSov (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 14:44:51 -0400
Received: from localhost.localdomain (80-110-106-143.cgn.dynamic.surfer.at [80.110.106.143])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id EB3FDC1432;
        Thu, 26 Sep 2019 18:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1569523489; bh=TtCFp66H0BRdliV0MDGqy9XsOfbrryGZJzyXlR1T3/k=;
        h=From:To:Cc:Subject:Date;
        b=AhsW8TrDVbuJ0VHaUpnEMSmpUfG2mjqVP3pcjYroAro4Zq/vRQ7C5GYaUWs/wZaUz
         zSChIOGOPb15HQ74jnEKCyreY8H69vSH/FMN8H4hMNkcbo5KGO4cWF+9DRtZ4OGxGr
         RaEZoKZHIDlKYduz+3/3bi6TbJpMgcRmzSiCFC7w=
From:   Luca Weiss <luca@z3ntu.xyz>
Cc:     Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: msm8974-FP2: Drop unused card-detect pin
Date:   Thu, 26 Sep 2019 20:44:34 +0200
Message-Id: <20190926184436.1078314-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The gpio is not used for SD card detection on the FP2.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
index bf402ae39226..2869be16bc6e 100644
--- a/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts
@@ -272,14 +272,6 @@
 			};
 		};
 
-		sdhc2_cd_pin_a: sdhc2-cd-pin-active {
-			pins = "gpio62";
-			function = "gpio";
-
-			drive-strength = <2>;
-			bias-disable;
-		};
-
 		sdhc2_pin_a: sdhc2-pin-active {
 			clk {
 				pins = "sdc2_clk";
@@ -317,7 +309,7 @@
 		bus-width = <4>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&sdhc2_pin_a>, <&sdhc2_cd_pin_a>;
+		pinctrl-0 = <&sdhc2_pin_a>;
 	};
 
 	usb@f9a55000 {
-- 
2.23.0

