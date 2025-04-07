Return-Path: <linux-arm-msm+bounces-53444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1EFA7EA02
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 20:25:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFA031887DF9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 18:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB3C22FDF0;
	Mon,  7 Apr 2025 18:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aG6CD8wP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B9425A323;
	Mon,  7 Apr 2025 18:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049560; cv=none; b=pO4QijupulAgSh9BOvmQV+3ns5VnvoLsWGpTbeQ51poF7oho4paKdPpPoGmRWaBryJVDBDL0suF0VFgaQal++H/aWL4HCCt+TuYKVBlHO7SF/bvl3c3rsAEdlWvLyudC/GmsUfsm8SAe6oJdyYIO9U/h04PaCkMpewXpmbGtjh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049560; c=relaxed/simple;
	bh=j6+bi5lVLy0URTHxStXKwgC/N1bCcMeQLLcy4p6Ft9U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r7P4w7p76zqkyMwihsnG5vXRX4jZuGBmojIbYEHst44bsZLkwgqU100w133T+m8VVGhl0BrtR10p1PP+jmY+RyKQs0QgLOyF9ROHvQ5aAi5QtNE5zRj3hoPA28JxSA/z3FfewkgHyTAcELVxOBp0MtlhvTjFQedYgbQDzFUY10w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aG6CD8wP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F76C4CEDD;
	Mon,  7 Apr 2025 18:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049560;
	bh=j6+bi5lVLy0URTHxStXKwgC/N1bCcMeQLLcy4p6Ft9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aG6CD8wPghDB5XCtwzHN91+Gt0NIQaN+mAiGF7ZvhDVMgwc9DPftJvR+FJfyUUK7i
	 9OivApH0OEMkuh07NHJZ/Roc9OVWZ6U7KzXyFSTWB64ocOi7U5BiOvLZSFfcJQcUit
	 B7vdNtki8IC64cQ/w9GSU/kJMXNIyWbJrWCZwE8/QptwWdwSGMtfFw/S5E0C4nxgMZ
	 Sb3aeR7+/1Jsgl8QjushjI4+OGXROiAQZrdrGdsjZcO+k8QNVZ6wOAHBFrYLSMU7Fn
	 dXRBsQVuzC7FLUFqW4zSi7VwaQSOgGglWqG0+b9RiOLfl87UilubSooFdBTEeayzp+
	 9ti5K8VDSqPwA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	kishon@kernel.org,
	lumag@kernel.org,
	neil.armstrong@linaro.org,
	abel.vesa@linaro.org,
	johan+linaro@kernel.org,
	quic_qianyu@quicinc.com,
	quic_devipriy@quicinc.com,
	quic_ziyuzhan@quicinc.com,
	quic_krichai@quicinc.com,
	manivannan.sadhasivam@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH AUTOSEL 6.13 06/28] phy: qcom: qmp-pcie: Add X1P42100 Gen4x4 PHY
Date: Mon,  7 Apr 2025 14:11:56 -0400
Message-Id: <20250407181224.3180941-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181224.3180941-1-sashal@kernel.org>
References: <20250407181224.3180941-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13.10
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[ Upstream commit 0d8db251dd15d2e284f5a6a53bc2b869f3eca711 ]

Add a new, common configuration for Gen4x4 V6 PHYs without an init
sequence.

The bootloader configures the hardware once and the OS retains that
configuration by using the NOCSR reset line (which doesn't drop
register state on assert) in place of the "full reset" one.

Use this new configuration for X1P42100's Gen4x4 PHY.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20250203-topic-x1p4_dts-v2-3-72cd4cdc767b@oss.qualcomm.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 873f2f9844c66..0f96a3507ca20 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -3905,6 +3905,21 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x8_pciephy_cfg = {
 	.has_nocsr_reset	= true,
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
@@ -4692,6 +4707,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
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
2.39.5


