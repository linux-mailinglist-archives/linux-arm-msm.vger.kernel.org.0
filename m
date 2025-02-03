Return-Path: <linux-arm-msm+bounces-46785-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80381A25D67
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 006D6188A0AD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9961920E6E7;
	Mon,  3 Feb 2025 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwykFQ+g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672A3209F25;
	Mon,  3 Feb 2025 14:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593824; cv=none; b=UX81/PAohiOl76bqFNeP8/x7j7ltNevUZznbZQmmeQEdOeNyldVz+x/I1STTsN2LCr6PHZrxRHanOIefc8WVQjJiwfiS407wSZ9yz1yd+Cu//KYMQw6rRIpEhJ3hZS/FXYc47DgkEFDguV2lzazswq1cLcFQvKGjnz4aHoIvZMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593824; c=relaxed/simple;
	bh=E5UWmKZHfmUPPBAUAOD2QHMmxB8u/RhMpbRI6NU0d20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iIWvlipAQpKsTS4oQLBk+eO5Yh5rgr6hdpS2fPeYyQ71/LTRmiZTScv+AfxZZ9VdfO0mlcaUoczVmzxEv/bK5FJ2BVcnhyMUG584+uoDztvxIw/gm0jLPtCCOe4VokipZN3HUCjEu+3RuqOXFMqqtbWRaptLwEIv+GA4clr7l6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwykFQ+g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7581BC4CED2;
	Mon,  3 Feb 2025 14:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738593823;
	bh=E5UWmKZHfmUPPBAUAOD2QHMmxB8u/RhMpbRI6NU0d20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JwykFQ+gn5wmgR1ZKsK15dg06wEhVJWkOh+1IT5kMKoauARXo6ahVDHKisW1ZWGV3
	 B5CEIvJG1o01D0G1HMvSjRo/Lj/ew14J72hk66ypX4w5rniZUfAtKchl8zD358FJOe
	 4VTn0VZYRUYx2WWZnKgtx2vEL1IQ2OAQ2AI9RHsNVOpz8/JwHBPfv0d5j6P6ivRdnv
	 f1J03hDkzg3FpxT2coOjzxxzL4oe17Yvvem9+6KA9KO10oBvwEsLsq04pupLZqRTTz
	 fokZ5CwyJMXSN7+whGblEGRhLmCq/3DANc6k/ByPmDWgKSORTpkHnNfRficqD5OqLt
	 d2vix+udOy5jg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 03 Feb 2025 15:43:22 +0100
Subject: [PATCH v2 3/6] phy: qcom: qmp-pcie: Add X1P42100 Gen4x4 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-topic-x1p4_dts-v2-3-72cd4cdc767b@oss.qualcomm.com>
References: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
In-Reply-To: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738593805; l=2051;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=nzsvvcCxOygMnYLwhijRvCq7bSIq9zyoNX9K393UW/c=;
 b=NTor0H9g3H5sFFqMrIR1S0ITNkBJI44QEf5YImzlJJ9rfSq+v/f0yNQN9w4r5WPv7jxpEXKjL
 RdJVZNh8lIbCaYVfM+FkxP5ey/GNsaSLJizqpc3pqjWgtUPLczLAMEK
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add a new, common configuration for Gen4x4 V6 PHYs without an init
sequence.

The bootloader configures the hardware once and the OS retains that
configuration by using the NOCSR reset line (which doesn't drop
register state on assert) in place of the "full reset" one.

Use this new configuration for X1P42100's Gen4x4 PHY.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 58103e87540ad84faca708debf61d79fe9f9ac54..68befe2901944b7f39e5adc12208c4b5578d94b1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4150,6 +4150,21 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x8_pciephy_cfg = {
 	.phy_status		= PHYSTATUS_4_20,
 };
 
+static const struct qmp_phy_cfg qmp_v6_gen4x4_pciephy_cfg = {
+	.lanes = 4,
+
+	.offsets                = &qmp_pcie_offsets_v6_20,
+
+	.reset_list             = sdm845_pciephy_reset_l,
+	.num_resets             = ARRAY_SIZE(sdm845_pciephy_reset_l),
+	.vreg_list              = qmp_phy_vreg_l,
+	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
+	.regs                   = pciephy_v6_regs_layout,
+
+	.pwrdn_ctrl             = SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status             = PHYSTATUS_4_20,
+};
+
 static void qmp_pcie_init_port_b(struct qmp_pcie *qmp, const struct qmp_phy_cfg_tbls *tbls)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -4981,6 +4996,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,x1e80100-qmp-gen4x8-pcie-phy",
 		.data = &x1e80100_qmp_gen4x8_pciephy_cfg,
+	}, {
+		.compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy",
+		.data = &qmp_v6_gen4x4_pciephy_cfg,
 	},
 	{ },
 };

-- 
2.48.1


