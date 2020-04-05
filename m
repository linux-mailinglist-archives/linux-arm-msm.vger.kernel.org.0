Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDF7C19EACF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2020 13:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726720AbgDELaQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Apr 2020 07:30:16 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:56596 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726695AbgDELaL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Apr 2020 07:30:11 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 05 Apr 2020 04:30:11 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg02-sd.qualcomm.com with ESMTP; 05 Apr 2020 04:30:08 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 0DC492165C; Sun,  5 Apr 2020 17:00:02 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaprak@codeaurora.org
Subject: [PATCH V2 8/8] arm64: dts: ipq6018: Add a53 pll and apcs clock
Date:   Sun,  5 Apr 2020 16:59:25 +0530
Message-Id: <1586086165-19426-9-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586086165-19426-1-git-send-email-sivaprak@codeaurora.org>
References: <1586086165-19426-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

add support for a53 pll and apcs clock.

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 1aa8d85..3c2d91a 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -294,12 +294,22 @@
 		};
 
 		apcs_glb: mailbox@b111000 {
-			compatible = "qcom,ipq8074-apcs-apps-global";
-			reg = <0x0b111000 0xc>;
-
+			compatible = "qcom,ipq6018-apcs-apps-global";
+			reg = <0x0b111000 0x1000>;
+			#clock-cells = <1>;
+			clocks = <&a53pll>, <&xo>;
+			clock-names = "pll", "xo";
 			#mbox-cells = <1>;
 		};
 
+		a53pll: clock@b116000 {
+			compatible = "qcom,ipq6018-a53pll";
+			reg = <0x0b116000 0x40>;
+			#clock-cells = <0>;
+			clocks = <&xo>;
+			clock-names = "xo";
+		};
+
 		timer {
 			compatible = "arm,armv8-timer";
 			interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.7.4

