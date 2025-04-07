Return-Path: <linux-arm-msm+bounces-53442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71BFA7E9D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 20:20:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 246193BB620
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 18:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA562550A3;
	Mon,  7 Apr 2025 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dK1JEoVc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44132236ED;
	Mon,  7 Apr 2025 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049483; cv=none; b=TdElNBrmdudKZ2zkFdauB6xwvu9CsZWiOcW10XMizsOMSuYTr1U21lyCwGpbJ4nWD3z21XSOBpulfZQDEXQIgQQTajuNaSOB97muIHp9R7G0HG5wZKphZrMhZa9a8HpgLY4ZNdf5VYwX48l+AxIt803R+njfiZTksj9u3C0Tl1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049483; c=relaxed/simple;
	bh=VLTyvpMWS/bw6pyMgplGAhRhyBZWm7/B21i4Z8dYpLw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QH6USW6jL5Io/G+aXYDGQ4GMhfLrPtlGenpv5LVSc5un6r+zATSDsUsMGydkVI212LEOMjmjvxCSwsIa12Pr+i2MViJaWXPP+/8THXqVvE9M82MmC+7c897+vS0+enfYz2djb6TGf6Qfixn/o+un28yKl8VXiPTa+dmh0buImEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dK1JEoVc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D37C4CEE7;
	Mon,  7 Apr 2025 18:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049483;
	bh=VLTyvpMWS/bw6pyMgplGAhRhyBZWm7/B21i4Z8dYpLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dK1JEoVcDguJW+OF2fKZm72JC96YiEWPzWiTZ0Y2BQWQIk+zeKqoFg0B+xczXrBDJ
	 c5AcUOUhlT8y7mqAOHb+Iqf/PgavhSakLrueqI91/CHz7f4p3TftSUXRIauQHvF/da
	 IDPXf3ahj/Weer6Otpin9tsfGcMmxvMLnRS9rQZsFb3rA8WQ93Fns4LDEJahfsuvgC
	 CDEE0LoYf4+BpdotgcMlq2cRkJEBgXMbVAMROSLoL/KpOn261bBLMjBW0Ch+eWBAMB
	 Bzi/BsepIhAe/tlOpjBcKtPhjcBdUtQa9ExHOlbNTnLx2Fo8vMHocwP3XHhJkw6iDq
	 eq+e05Sj0QoVQ==
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
	abel.vesa@linaro.org,
	neil.armstrong@linaro.org,
	quic_qianyu@quicinc.com,
	quic_ziyuzhan@quicinc.com,
	quic_devipriy@quicinc.com,
	quic_krichai@quicinc.com,
	manivannan.sadhasivam@linaro.org,
	johan+linaro@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 08/31] phy: qcom: qmp-pcie: Add X1P42100 Gen4x4 PHY
Date: Mon,  7 Apr 2025 14:10:24 -0400
Message-Id: <20250407181054.3177479-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181054.3177479-1-sashal@kernel.org>
References: <20250407181054.3177479-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.1
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
index 018bbb3008303..6726bbe4ad15d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -4156,6 +4156,21 @@ static const struct qmp_phy_cfg x1e80100_qmp_gen4x8_pciephy_cfg = {
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
@@ -4960,6 +4975,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
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


