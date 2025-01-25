Return-Path: <linux-arm-msm+bounces-46121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E73A1C0B5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 04:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 414F01888EDC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 03:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0002B2066E8;
	Sat, 25 Jan 2025 03:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxu4swP5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F223595E;
	Sat, 25 Jan 2025 03:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737775898; cv=none; b=jeOqOCpKzyfXf9uS0tGJ3+RigvvwjFZvkaK+v+8XlF7M/TwUjGQdtF+G0Zbk/v/6weQI0HR+jph/empc7Yyf+rjpQMWjjdyRJjLpQpFFUnYevJJzmEgXeHC5QlOzMs+9z4Jvi4/bPfBVXz0oy1YrxAXYZvVUeWTsxi2emffVHFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737775898; c=relaxed/simple;
	bh=9bWNkRroU63nU3KiE7zz4lmrFAcVbebubnHxCwCouEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TnJkTClvY2znMdughAioAxCbkLWMRW8VZLaltlKg8KrkTPPC+FKbE3dohQ/4wWyNnGdUB1v5ubfV3zCJMgn97mtj0bzjmvOghp2eh6AU+r0dPR4wgCj1kcrIkwoC1J5fd4EJ9tCRdjIdE3MgeKWv1a+/D4s3U66juRhhNNdDkKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxu4swP5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696EBC4CEDD;
	Sat, 25 Jan 2025 03:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737775898;
	bh=9bWNkRroU63nU3KiE7zz4lmrFAcVbebubnHxCwCouEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mxu4swP5IH0rQT5ONJw4tf/4nhl3OoJj2/uRRVxu/VeF94/2McCUEjxIgjoM26jvZ
	 xkUraZryJvMa/LTY+dn+gFQbFJJxt3BwcZdHq+4joYc4Xa01D0rVXV2UXvsJ27HPoQ
	 9twhpWOaxImuEp/wOwRyVLSSoj66ZTh4JoYqPH8m6ay8e3MkQunoYs9lWLSmATDw2m
	 K3SQH0vOP/+NKBJkREaCPw/6Cin4R60DeCjdoV7kSNXSCoA7UnunZj0ar+126PufkJ
	 K+QH/vIkmiAq8Scb+RSRPoEjsetBcB8GigjZdjsRlX1YEC+48AKnSm48FAKvkFiSpd
	 1emA3AaV8puTA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 25 Jan 2025 04:31:19 +0100
Subject: [PATCH 3/6] phy: qcom: qmp-pcie: Add X1P42100 Gen4x4 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250125-topic-x1p4_dts-v1-3-02659a08b044@oss.qualcomm.com>
References: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
In-Reply-To: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737775883; l=1932;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=gcbUb/R2HEswdsbX0ctwFYMYlcTBRiL80fLYyi/m0fo=;
 b=ufWUmvHanITNco0RZydJHi5NtQHtZThaL5HkTkHN2PSzFhf+hiRkm5vpufl6sXgA8/U0oc1DI
 AkY24bC1ZW1BGbGItHtE5f6o7a/mNMJSIKcD7evvpjTt9INTB89v0L+
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add a new, common configuration for Gen4x4 V6 PHYs without an init
sequence.

The bootloader configures the hardware once and the OS retains that
configuration by using the NOCSR reset line (which doesn't drop
register state on assert) in place of the "full reset" one.

Use this new configuration for X1P42100's Gen4x4 PHY.

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


