Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC11132725F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Feb 2021 14:10:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhB1NJw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Feb 2021 08:09:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbhB1NJo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Feb 2021 08:09:44 -0500
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF848C061786;
        Sun, 28 Feb 2021 05:08:48 -0800 (PST)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 84E6E1F525;
        Sun, 28 Feb 2021 14:08:45 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] arm64: dts: qcom: msm8996: Add SDHCI1
Date:   Sun, 28 Feb 2021 14:08:22 +0100
Message-Id: <20210228130831.203765-4-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210228130831.203765-1-konrad.dybcio@somainline.org>
References: <20210228130831.203765-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SDHCI1 device to allow for usage of (more often than not) eMMC.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 17a7e2a0c730..c45350cefdc8 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2308,6 +2308,29 @@ hsusb_phy2: phy@7412000 {
 			status = "disabled";
 		};
 
+		sdhc1: sdhci@7464900 {
+			compatible = "qcom,sdhci-msm-v4";
+			reg = <0x07464900 0x11c>, <0x07464000 0x800>;
+			reg-names = "hc_mem", "core_mem";
+
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clock-names = "iface", "core", "xo";
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				<&gcc GCC_SDCC1_APPS_CLK>,
+				<&xo_board>;
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&sdc1_state_on>;
+			pinctrl-1 = <&sdc1_state_off>;
+
+			bus-width = <8>;
+			non-removable;
+			status = "disabled";
+		};
+
 		sdhc2: sdhci@74a4900 {
 			 status = "disabled";
 			 compatible = "qcom,sdhci-msm-v4";
-- 
2.30.1

