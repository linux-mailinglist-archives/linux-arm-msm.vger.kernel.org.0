Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181B13FE261
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 20:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235458AbhIAScY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 14:32:24 -0400
Received: from relay03.th.seeweb.it ([5.144.164.164]:54999 "EHLO
        relay03.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233200AbhIAScX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 14:32:23 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 2D91520153;
        Wed,  1 Sep 2021 20:31:25 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org, jeffrey.l.hugo@gmail.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 2/5] arm64: dts: msm8998: Configure the multimedia subsystem iommu
Date:   Wed,  1 Sep 2021 20:31:20 +0200
Message-Id: <20210901183123.1087392-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901183123.1087392-1-angelogioacchino.delregno@somainline.org>
References: <20210901183123.1087392-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation for enabling various components of the multimedia
subsystem, write configuration for its related IOMMU.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 1a53f15f1266..c83e54a84bca 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2361,6 +2361,43 @@ mmcc: clock-controller@c8c0000 {
 				 <0>;
 		};
 
+		mmss_smmu: iommu@cd00000 {
+			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
+			reg = <0x0cd00000 0x40000>;
+			#iommu-cells = <1>;
+
+			clocks = <&mmcc MNOC_AHB_CLK>,
+				 <&mmcc BIMC_SMMU_AHB_CLK>,
+				 <&rpmcc RPM_SMD_MMAXI_CLK>,
+				 <&mmcc BIMC_SMMU_AXI_CLK>;
+			clock-names = "iface-mm", "iface-smmu",
+				      "bus-mm", "bus-smmu";
+			status = "disabled";
+
+			#global-interrupts = <0>;
+			interrupts =
+				<GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		remoteproc_adsp: remoteproc@17300000 {
 			compatible = "qcom,msm8998-adsp-pas";
 			reg = <0x17300000 0x4040>;
-- 
2.32.0

