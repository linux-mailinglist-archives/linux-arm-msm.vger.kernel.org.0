Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8C3338541
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 06:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhCLF2F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 00:28:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:34598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231337AbhCLF1u (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 00:27:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFAC764F84;
        Fri, 12 Mar 2021 05:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615526870;
        bh=ed7quphv4hnu+7jfPvg+C+72B9xlk1az1sYpAKAiYzc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WsEbHcy/3gE6Lrw2eWfzhn3aPCCgDv5E+ON/ifSMW/3ahUkYk7nlxSXYcDVPfoEqx
         OsUk9066vbTM/vHwYtLOFNSvQSe0clyz56vd4nbNiQKRT8ng4rTg6OswyZ346fIKBl
         cb2uTqQB2amXRhh2SMWxvwLnUJD82avq2zoKFIrNWsP4sp23AxmyeEUPuGTokYs0Wt
         OGBISQ7HZPeRAjdCb4ftVX0ZMH/XcaWxzWuq+q7UurEnb5oUWcDXX+HwlL/UAPKR/K
         2vqfIunDt1ynFV9tQl/Z14nRosaDOTLpIN+py8jgVPXoRyUkZXn85zcv+/Dwgqv922
         fK/44PC3I1LYA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] arm64: dts: qcom: sm8350: Add spmi node
Date:   Fri, 12 Mar 2021 10:57:30 +0530
Message-Id: <20210312052737.3558801-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312052737.3558801-1-vkoul@kernel.org>
References: <20210312052737.3558801-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SPMI node found in SM8350 SoC

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 90439bd6eea8..5e2569ceebad 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -634,6 +634,24 @@ aoss_qmp: qmp@c300000 {
 			#power-domain-cells = <1>;
 		};
 
+		spmi_bus: qcom,spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0xc440000 0x0 0x1100>,
+			      <0x0 0xc600000 0x0 0x2000000>,
+			      <0x0 0xe600000 0x0 0x100000>,
+			      <0x0 0xe700000 0x0 0xa0000>,
+			      <0x0 0xc40a000 0x0 0x26000>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,sm8350-tlmm";
 			reg = <0 0x0f100000 0 0x300000>;
-- 
2.26.2

