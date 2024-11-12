Return-Path: <linux-arm-msm+bounces-37591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF549C5677
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 12:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D306AB3F05E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 11:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F4E22ABCB;
	Tue, 12 Nov 2024 10:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apalGjAD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093EB22ABC9;
	Tue, 12 Nov 2024 10:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731407900; cv=none; b=Xb+FMO6b+6wntFK00PZUSvkmh0ETo077l8l9znELeD3jAhK54dfUuzJyr416dwv3vda1Ds58ytClUCPTrTor0ZrEzlEtD/g1T9ozLOVzPiKia8uCXpxhNkdt7hssHHnR+5fNCOpExDa3Pbh5U9Wyq8O7Fj2HvZuqtrJuqEIf6dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731407900; c=relaxed/simple;
	bh=kBmfT+2MaIKwAD0O7GVP0b1yByXEfpXufGLr1Rpv7Us=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j539uZ16WghH1yCEyzk4j3QWDgcqCrm++HE1M9PkSfiJ7GDp4bUxcryCqjBsL5HGl4/tPm9ZkjHt1v8ToYwnhoJCTYHbBPtcVPUMDUPaq1HfT67El+1Shgr3E2b723vO7EtzpKxUk07dAC1KrE8rIXcVhJObqzqDm7oi3rZgXa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apalGjAD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5ADC4CECD;
	Tue, 12 Nov 2024 10:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407899;
	bh=kBmfT+2MaIKwAD0O7GVP0b1yByXEfpXufGLr1Rpv7Us=;
	h=From:To:Cc:Subject:Date:From;
	b=apalGjADgPCVq109+sC+CMbgsJYJ3ZNS7KPJ56cog6i90Ru9gCeMmjvgY8t5aEnxy
	 dq4um3NyE7XxAxVcxRH6iEqTRVBWlXiWHYhSgy0XvKGjO3R3Nc3qXk1Q0tViMcq4vo
	 g+WTm7esvb9Cu3mSun06H4m/zHgFWYeBlJJ7/NOANSrT1NQoRWFCfdIDAxP4Ah8ECO
	 uD4XN0h7WHVmOryb/QCZhsUIjqC1Sy2tBnTOZHUVZerOn3rbrJNk/X9Fv4E/AxJZF3
	 +GsGnf9Tfjnp5VKynDJcl8Bargmn2sgLQDjj54EFj71R6JHL8j+J1MoamtCtpyh1QT
	 tA8VxfGseei+g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Charles Han <hanchunchao@inspur.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 1/5] soc: qcom: Add check devm_kasprintf() returned value
Date: Tue, 12 Nov 2024 05:38:11 -0500
Message-ID: <20241112103817.1654333-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.285
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
index 3303bcaf67154..8a9f781ba83f7 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -433,10 +433,16 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
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


