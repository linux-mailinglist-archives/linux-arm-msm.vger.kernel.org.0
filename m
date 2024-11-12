Return-Path: <linux-arm-msm+bounces-37587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB74D9C5482
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 11:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EB6C28714E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 10:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44F3214435;
	Tue, 12 Nov 2024 10:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs5wa2JO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EDF214434;
	Tue, 12 Nov 2024 10:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731407805; cv=none; b=fv33Y+KYQSocdI4RfBeozDr5JlA0V1H5V1bmuoBcHVpjEhZFRgI12sO7vYiYZO0dpWaS6LvXwDtuJItp257eWmFjMAgvjYmo+iN0BJIRpNLtBYCqIqBpJHT44ENymTQoBvrKXpuAztlsajq9NIPCYyNTFqI7Kx+FO9XZU75jLQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731407805; c=relaxed/simple;
	bh=dXP0DU3zJcs5rrAZD1HgD93OSFybGm2VxGdNoNkzBKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r1MBsTImcHd1dnJk+tA/e2pAWxUqhgTuEWWM0BjiQeD4wZ124xTOMEEN+Zsinvlp4z1J1ddIk3Rz4yTnjuEl0L91UVBLlARxbM7Qa/w38Lk1DIFOg81jw5SDhJ5r0ca3Kc+ilckt1FyAOhbHMOtM2X60v5sjDeaOtl9Djts0JvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs5wa2JO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE8AC4CECD;
	Tue, 12 Nov 2024 10:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407805;
	bh=dXP0DU3zJcs5rrAZD1HgD93OSFybGm2VxGdNoNkzBKo=;
	h=From:To:Cc:Subject:Date:From;
	b=Gs5wa2JOJgbLs0vQzx0kiOoFnAvt+eulfUvXWrEUbcGZUY7RW3LwX7+gpBCd3Vc3x
	 88fcdajxHKT0YDVuvdtQJJK2HgP/1DfcARgeGngt5klEGhsiqBAarlvxv4bT/HWaIr
	 nXepB9J8xAeMks52Ng1zVNBW9r4HpWyin6rtTP9mxIusHPlQWIFWg8lZnHpKcnCbmR
	 tf/owmmDcGAG0utdBmvRMX+nkJvwver5GbRwtuAYlkREu64AiSs1VEI6TEfoJn3F8N
	 vEVNGHdgA+CSHp4TG0xrVu0+5Z9ZyDRy0k+UR2sEjg7NrKRRghzGwHB8o+DTX+TRe8
	 w3J11VMuHoiLw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Charles Han <hanchunchao@inspur.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 01/15] soc: qcom: Add check devm_kasprintf() returned value
Date: Tue, 12 Nov 2024 05:36:22 -0500
Message-ID: <20241112103643.1653381-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.60
Content-Transfer-Encoding: 8bit

From: Charles Han <hanchunchao@inspur.com>

[ Upstream commit e694d2b5c58ba2d1e995d068707c8d966e7f5f2a ]

devm_kasprintf() can return a NULL pointer on failure but this
returned value in qcom_socinfo_probe() is not checked.

Signed-off-by: Charles Han <hanchunchao@inspur.com>
Link: https://lore.kernel.org/r/20240929072349.202520-1-hanchunchao@inspur.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/qcom/socinfo.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 880b41a57da01..f979ef420354f 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -757,10 +757,16 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
 	qs->attr.revision = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%u.%u",
 					   SOCINFO_MAJOR(le32_to_cpu(info->ver)),
 					   SOCINFO_MINOR(le32_to_cpu(info->ver)));
-	if (offsetof(struct socinfo, serial_num) <= item_size)
+	if (!qs->attr.soc_id || qs->attr.revision)
+		return -ENOMEM;
+
+	if (offsetof(struct socinfo, serial_num) <= item_size) {
 		qs->attr.serial_number = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 							"%u",
 							le32_to_cpu(info->serial_num));
+		if (!qs->attr.serial_number)
+			return -ENOMEM;
+	}
 
 	qs->soc_dev = soc_device_register(&qs->attr);
 	if (IS_ERR(qs->soc_dev))
-- 
2.43.0


