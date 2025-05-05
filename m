Return-Path: <linux-arm-msm+bounces-56846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BBCAAA996
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 03:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 917F23A070E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 01:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B188C25B67E;
	Mon,  5 May 2025 22:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uA9Ukabo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64D5299AB0;
	Mon,  5 May 2025 22:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485017; cv=none; b=ugF4NATu8CmMiwlZvSfIzKU0GPkDTK8G47tMxroHxOanam2N2yLxyUhUq0x/hy09qYrStHuudh9VtPT5jr2mzuye3Z5DFj7oyX8HGmP66hZ7cdrg+oszxo0pBFW4NkhdBp9BFBALp10ZFW326h+BhfhfLd+1N4P3970D/s6BjcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485017; c=relaxed/simple;
	bh=2pyPJPnx1Gcn8XcH7QJPQ3Fh+4609/JM60WbXtoVZnQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PM88t+e2DAcr9ZLv+UIKHz0b4KyVLjNrM7e7fSVzODD8AHqdAituJ9qr+IpdQ3ccVxZyW8lTkgYW3NB7tU+xjNgsQbugtCBnrIFE40cELC//8SOeExMbU1qALkyDgqjvQ94X/mtKWJo4hBJvpKzCj0cd0aH9AbIvr8qW30HYoiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uA9Ukabo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7008AC4CEEF;
	Mon,  5 May 2025 22:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485016;
	bh=2pyPJPnx1Gcn8XcH7QJPQ3Fh+4609/JM60WbXtoVZnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uA9Ukabo+ZofWzAAGFlGWbqBqyHwOoMHgAf2MEvNRnBImUOR9vxmtVMmQa0XjeeVY
	 bbx3pPZk1v01D8WtsrrM9/iHFJsAO3F0UXwWQlzGEFGTwn826Dpe654idiEHJyrogc
	 W2nX7AEinuP7eocICJjX4mRgYgyTlrSJVo5qGMuQOhIwADwajTpTRK4H42DL+L7zBT
	 NKe8iNZ3yFrw5wmId1+20Hy33gT6tqerJu4wVBP0mrnbxPFStjZs49EmWh+FxBOwIZ
	 9QDaO25b3qEaxZNGSliAOwFpBOiU1wCOBbWdELXdGroVou6ouqxQd16+qjehhnek/2
	 DC7gZOmhmpbTw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Taniya Das <quic_tdas@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 124/486] clk: qcom: lpassaudiocc-sc7280: Add support for LPASS resets for QCM6490
Date: Mon,  5 May 2025 18:33:20 -0400
Message-Id: <20250505223922.2682012-124-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit

From: Taniya Das <quic_tdas@quicinc.com>

[ Upstream commit cdbbc480f4146cb659af97f4020601fde5fb65a7 ]

On the QCM6490 boards, the LPASS firmware controls the complete clock
controller functionalities and associated power domains. However, only
the LPASS resets required to be controlled by the high level OS. Thus,
add support for the resets in the clock driver to enable the Audio SW
driver to assert/deassert the audio resets as needed.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Link: https://lore.kernel.org/r/20250221-lpass_qcm6490_resets-v5-2-6be0c0949a83@quicinc.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/qcom/lpassaudiocc-sc7280.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
index 45e7264770866..22169da08a51a 100644
--- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
+++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/clk-provider.h>
@@ -713,14 +714,24 @@ static const struct qcom_reset_map lpass_audio_cc_sc7280_resets[] = {
 	[LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
 };
 
+static const struct regmap_config lpass_audio_cc_sc7280_reset_regmap_config = {
+	.name = "lpassaudio_cc_reset",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = 0xc8,
+};
+
 static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
-	.config = &lpass_audio_cc_sc7280_regmap_config,
+	.config = &lpass_audio_cc_sc7280_reset_regmap_config,
 	.resets = lpass_audio_cc_sc7280_resets,
 	.num_resets = ARRAY_SIZE(lpass_audio_cc_sc7280_resets),
 };
 
 static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
-	{ .compatible = "qcom,sc7280-lpassaudiocc" },
+	{ .compatible = "qcom,qcm6490-lpassaudiocc", .data = &lpass_audio_cc_reset_sc7280_desc },
+	{ .compatible = "qcom,sc7280-lpassaudiocc", .data = &lpass_audio_cc_sc7280_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpass_audio_cc_sc7280_match_table);
@@ -752,13 +763,17 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int ret;
 
+	desc = device_get_match_data(&pdev->dev);
+
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcm6490-lpassaudiocc"))
+		return qcom_cc_probe_by_index(pdev, 1, desc);
+
 	ret = lpass_audio_setup_runtime_pm(pdev);
 	if (ret)
 		return ret;
 
 	lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc";
 	lpass_audio_cc_sc7280_regmap_config.max_register = 0x2f000;
-	desc = &lpass_audio_cc_sc7280_desc;
 
 	regmap = qcom_cc_map(pdev, desc);
 	if (IS_ERR(regmap)) {
@@ -772,7 +787,7 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
 	regmap_write(regmap, 0x4, 0x3b);
 	regmap_write(regmap, 0x8, 0xff05);
 
-	ret = qcom_cc_really_probe(&pdev->dev, &lpass_audio_cc_sc7280_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, desc, regmap);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC clocks\n");
 		goto exit;
-- 
2.39.5


