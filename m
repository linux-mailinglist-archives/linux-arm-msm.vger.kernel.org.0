Return-Path: <linux-arm-msm+bounces-37590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 476E09C5536
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 12:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1B08B3E0C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 10:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F64A215C62;
	Tue, 12 Nov 2024 10:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwogEJO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018C03DAC0A;
	Tue, 12 Nov 2024 10:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731407886; cv=none; b=X6ZxntwQ+gtdekJMEtPJJCfgPN9vkP4c8AhD9o++znVJ0PdfhDjNHN97lUoxBIRB3XSvtn/A5V4/EWpEtQbDLZP4/6oKHxJFn3H8DjVNEufsbJC9nzQdAN79vHNp3xDTn60dY+wLuRSWyRG511hoLKdrM6IHEIw6fxIkyFp+4IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731407886; c=relaxed/simple;
	bh=vLmLDpa5C4+ZEWhnvJzIn9iW5dllKopKUeYDJSUKq6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YP3T5dXRAeHDh5cluD/hDIUHImSCrXlIFnOyMPoxgtMXQ+70ZMcpHIaZVkinMpUzTpF3YMKFvuDfCvmTWjR/lDnEdrJHIruBpnV3HH7UGQabzKHSTJJmkeQMlE9WL+NzBCUlMSV/K3N9QLpST4sQUUjTV8+XpV7fHHkkBc2nikY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwogEJO+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1F2C4CECD;
	Tue, 12 Nov 2024 10:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407885;
	bh=vLmLDpa5C4+ZEWhnvJzIn9iW5dllKopKUeYDJSUKq6k=;
	h=From:To:Cc:Subject:Date:From;
	b=HwogEJO+HzFnJAHrNqyzDU3YrPdWZgH6mBk1TBWqRUsAiGtLMMn6kfLKV1qw330bY
	 4gG30bnLnJEmLrZyVjjyO4bmhUesNlc/NnRTHS4VgIc0z8Wk6xuVfCgDyMb/anNoGd
	 CvEshrhnBOkYVddL64QFdIo208BLLMTZ28Kc0z+PaziL524Ll8KLbYrJM74a8uFeTs
	 U06ka+28CULPRPBY2t/ESuoecHyc6+9wc3jZijJK1Se62KNg3Gc2UPKKkrbwWQlFo0
	 teHQyWZX0n0KvswjhA8zNr4xJIlQAId7uH8XMXDOKtZT/L++WcddL+dUhvWATenaRo
	 Qs5PmIagHww2A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Charles Han <hanchunchao@inspur.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 1/6] soc: qcom: Add check devm_kasprintf() returned value
Date: Tue, 12 Nov 2024 05:37:56 -0500
Message-ID: <20241112103803.1654174-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.229
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
index 60c82dcaa8d1d..7bb3543e42e59 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -507,10 +507,16 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
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


