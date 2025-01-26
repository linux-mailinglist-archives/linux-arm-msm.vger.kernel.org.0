Return-Path: <linux-arm-msm+bounces-46158-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B197EA1CD07
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 17:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11A3E3A7F9A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 16:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 921A3189912;
	Sun, 26 Jan 2025 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPaTf9Hn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B5A188A0D;
	Sun, 26 Jan 2025 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737909930; cv=none; b=ArU7+oKL3HkJk9b4u94Y/D0DYYbFcVmSAV4DUVeqZP/jSVlYZQuXm9jai5YJQUbjorKiMjE5KtOn7O1kj5U1qFOxCu1sTdD0ohYGWAoOvUI1VTr49yciKQAK9wzaWohVGAzoiAX95AolJkGFM5XSajvjHnLRE/r2wFKL8ySbYh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737909930; c=relaxed/simple;
	bh=eHpbizKgn6CSVwriuhoLYz2nwZcbqsdtk+tV3EUyfuY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jYRxmH8o0l6pk4ZqNaRD3gZTFSjhPmSABTM0ZGCEpSje2nRsMIV3kbP/KCQlQ0Qf6dN/umEPZOWn/Z5JHf+bRh2e282NKlIWduezq0azd8Fs0IRbAF1ttmxVooEaV4rda4pgWi/LvX9mUQbapnPl/ch9tRVRmA4uLbvbX3SvHKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPaTf9Hn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBCBC4CEE3;
	Sun, 26 Jan 2025 16:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737909930;
	bh=eHpbizKgn6CSVwriuhoLYz2nwZcbqsdtk+tV3EUyfuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EPaTf9HnOe/RrXFPEMMxHTK38Ou1xu9rApbhC4iKPeh6yEozCjsQ3WsNQQ9aEv7YA
	 X2A0miJCYhBLNA+8L6d/4Xzh2SzToa7g2dvrYOx+NYhzcPBIfvlde8K2uJo9cAznAC
	 e6MY5NQV+QasO29B9pNB2BrIyWdfI48CwA+InkML4UDzF9dBV9zT74VHGOx9CZj972
	 /cHF8kS5/qvXfr10RLB40jXMtNAUSzugxnHBLmf4a+TdPz5J1Jo38pBrFR1sVMHTB4
	 Ja7w0pTuk8jvqv1ZzlQWK0l5W0Xz5UbaLxdouhjzZyAMs2Sz6UHOlCEz7G/Ga6fawA
	 zk5YVmDnbsRsw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.13 4/8] soc: qcom: llcc: Update configuration data for IPQ5424
Date: Sun, 26 Jan 2025 11:45:19 -0500
Message-Id: <20250126164523.963930-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126164523.963930-1-sashal@kernel.org>
References: <20250126164523.963930-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.13
Content-Transfer-Encoding: 8bit

From: Varadarajan Narayanan <quic_varada@quicinc.com>

[ Upstream commit c88c323b610a6048b87c5d9fff69659678f69924 ]

The 'broadcast' register space is present only in chipsets that
have multiple instances of LLCC IP. Since IPQ5424 has only one
instance, both the LLCC and LLCC_BROADCAST points to the same
register space.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20241121051935.1055222-3-quic_varada@quicinc.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/qcom/llcc-qcom.c | 57 ++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 32c3bc887cefb..2b832b730be72 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -142,6 +142,7 @@ struct qcom_llcc_config {
 	bool skip_llcc_cfg;
 	bool no_edac;
 	bool irq_configured;
+	bool no_broadcast_register;
 };
 
 struct qcom_sct_config {
@@ -154,6 +155,38 @@ enum llcc_reg_offset {
 	LLCC_COMMON_STATUS0,
 };
 
+static const struct llcc_slice_config ipq5424_data[] =  {
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 1,
+		.max_cap = 768,
+		.priority = 1,
+		.bonus_ways = 0xFFFF,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+		.alloc_oneway_en = true,
+		.ovcap_en = true,
+		.ovcap_prio = true,
+		.vict_prio = true,
+	},
+	{
+		.usecase_id = LLCC_VIDSC0,
+		.slice_id = 2,
+		.max_cap = 256,
+		.priority = 2,
+		.fixed_size = true,
+		.bonus_ways = 0xF000,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+	},
+};
+
 static const struct llcc_slice_config sa8775p_data[] =  {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -3185,6 +3218,16 @@ static const struct qcom_llcc_config qdu1000_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config ipq5424_cfg[] = {
+	{
+		.sct_data       = ipq5424_data,
+		.size           = ARRAY_SIZE(ipq5424_data),
+		.reg_offset     = llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+		.no_broadcast_register = true,
+	},
+};
+
 static const struct qcom_llcc_config sa8775p_cfg[] = {
 	{
 		.sct_data	= sa8775p_data,
@@ -3360,6 +3403,11 @@ static const struct qcom_sct_config qdu1000_cfgs = {
 	.num_config	= ARRAY_SIZE(qdu1000_cfg),
 };
 
+static const struct qcom_sct_config ipq5424_cfgs = {
+	.llcc_config	= ipq5424_cfg,
+	.num_config	= ARRAY_SIZE(ipq5424_cfg),
+};
+
 static const struct qcom_sct_config sa8775p_cfgs = {
 	.llcc_config	= sa8775p_cfg,
 	.num_config	= ARRAY_SIZE(sa8775p_cfg),
@@ -3957,8 +4005,12 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 
 	drv_data->bcast_regmap = qcom_llcc_init_mmio(pdev, i, "llcc_broadcast_base");
 	if (IS_ERR(drv_data->bcast_regmap)) {
-		ret = PTR_ERR(drv_data->bcast_regmap);
-		goto err;
+		if (cfg->no_broadcast_register) {
+			drv_data->bcast_regmap = regmap;
+		} else {
+			ret = PTR_ERR(drv_data->bcast_regmap);
+			goto err;
+		}
 	}
 
 	/* Extract version of the IP */
@@ -4029,6 +4081,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
 	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs},
 	{ .compatible = "qcom,qcs8300-llcc", .data = &qcs8300_cfgs},
 	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
-- 
2.39.5


