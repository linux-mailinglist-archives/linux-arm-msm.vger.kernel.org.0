Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62ECA1B9774
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2020 08:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgD0G2u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 02:28:50 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:38196 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726407AbgD0G2u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 02:28:50 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Apr 2020 11:58:47 +0530
Received: from c-skakit-linux.qualcomm.com ([10.242.50.210])
  by ironmsg01-blr.qualcomm.com with ESMTP; 27 Apr 2020 11:58:32 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 36AFB3BD4; Mon, 27 Apr 2020 11:58:31 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy.qti.qualcomm.com@qualcomm.com,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH] arm64: dts: sc7180: Add wakeup support over UART RX
Date:   Mon, 27 Apr 2020 11:57:24 +0530
Message-Id: <1587968844-26667-1-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the necessary pinctrl and interrupts to make UART
wakeup capable.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 4216b57..3a49603 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -637,9 +637,12 @@
 				reg = <0 0x0088c000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
-				pinctrl-names = "default";
+				pinctrl-names = "default", "sleep";
 				pinctrl-0 = <&qup_uart3_default>;
-				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-1 = <&qup_uart3_default>;
+				interrupts-extended =
+					<&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
+					<&tlmm 41 0>;
 				status = "disabled";
 			};
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

