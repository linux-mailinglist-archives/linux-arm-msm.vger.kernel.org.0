Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DACAE14D387
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 00:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgA2XUm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 18:20:42 -0500
Received: from onstation.org ([52.200.56.107]:33840 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726940AbgA2XUl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 18:20:41 -0500
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id B200644628;
        Wed, 29 Jan 2020 23:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1580340040;
        bh=6eTuSRirkEXnr3v3SyyQ4ce5AROJdQAO8ufiw5pA55g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pXEtHP+ts8GPlaO0fqHRi1ZaNxwpS8mlUZBJuNhCHweIt/Yp2KsR6p1QHV3a4rQ+p
         /5BokFi6Nwpm3v0/h2iUvCEfqZbOEFy2KmmubsqWeobYcTCHPS3z6yUDTo0EOIZxN/
         0L7KZINuMkCK8MUG485T8G7a+MenWg5bDOYrwViU=
From:   Brian Masney <masneyb@onstation.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jonathan@marek.ca
Subject: [PATCH 2/3] ARM: dts: qcom: msm8974: add blsp2_uart10
Date:   Wed, 29 Jan 2020 18:20:30 -0500
Message-Id: <20200129232031.34538-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200129232031.34538-1-masneyb@onstation.org>
References: <20200129232031.34538-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add blsp2_uart10 node in order to support bluetooth on the Nexus 5
phone.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
[masneyb@onstation.org: use constants in interrupts property; patch
 extracted from much larger out of tree patch.]
Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 4b161b809dd5..f8e093179c3f 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -715,6 +715,15 @@ blsp1_uart2: serial@f991e000 {
 			status = "disabled";
 		};
 
+		blsp2_uart10: serial@f9960000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0xf9960000 0x1000>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_UART4_APPS_CLK>, <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
 		sdhci@f9824900 {
 			compatible = "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4";
 			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;
-- 
2.24.1

