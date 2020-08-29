Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA9D256705
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Aug 2020 13:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgH2LMS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Aug 2020 07:12:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:38582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726876AbgH2LMR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Aug 2020 07:12:17 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 960DF207DF;
        Sat, 29 Aug 2020 11:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598699537;
        bh=1rZZTHYv2srzGJyq4r3KsvCUUvcAAp36hZsvCxBAaik=;
        h=From:To:Cc:Subject:Date:From;
        b=Y5+2Zu9+0ji/9k7BPULSt0zGyr8h/eAh8E6Swaxpm1Snyc4wseqJl0n/17yvNiJak
         ZiC6vJQliFizVeC36aSg879gIi/bDZPpaGOOlYWqGPxv2yOauRnmIkyVqL4GMqeYTu
         ivcUCAn/nuyYsJpXnalLThSyDN9oipFTs8FJEp1M=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] arm64: dts: qcom: msm8992: Fix UART interrupt property
Date:   Sat, 29 Aug 2020 13:12:09 +0200
Message-Id: <20200829111209.32685-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

"interrupt" is not a valid property.

Fixes: 7f8bcc0c4cfe ("arm64: dts: qcom: msm8992: Add BLSP2_UART2 and I2C nodes")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/qcom/msm8992.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index 188fff2095f1..8626b3a50eda 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -335,7 +335,7 @@
 		blsp2_uart2: serial@f995e000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0xf995e000 0x1000>;
-			interrupt = <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
 			clock-names = "core", "iface";
 			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>,
 				<&gcc GCC_BLSP2_AHB_CLK>;
-- 
2.17.1

