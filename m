Return-Path: <linux-arm-msm+bounces-37586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EB99C543E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 11:39:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDC71284C70
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 10:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1405E2123DC;
	Tue, 12 Nov 2024 10:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRn9GE58"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEF720EA35;
	Tue, 12 Nov 2024 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731407768; cv=none; b=CaI/nBoIquCDb/BLPwwRB5z4km7cLw17YehXISWYCN8YOnv2K6tJlVfBB827sacpOn7fNMD3o6vDPX0eq7BQBO1dphp1Xt+a/u8+4LDzaiuVv1Zbq4BIGMvyT6WrRHuA9P9y3xefgb7SMQEXn6hcYz5bBUM/nKv1NkGdL8LPuN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731407768; c=relaxed/simple;
	bh=DHiTAMwV398QIUGxkXtvg8oIerdlFd/qTK8p+EpW/R4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cf4d9Ltgbx259DZOO0+87VpyaEpWhzvmfZblN2fYVxZEwkDJ0lNiJe/HAboW2Lu7rtU34wOHiaSQSmDATRW3wpYoxZqsIMuUmIjBKndrmb2TKoXjVF8g8Cl47JxEE7g/QLyxjzR6f1+33At70Ls0/IUjLEOFE8ZnY+yfNz4XtuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRn9GE58; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D56B3C4CED4;
	Tue, 12 Nov 2024 10:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407767;
	bh=DHiTAMwV398QIUGxkXtvg8oIerdlFd/qTK8p+EpW/R4=;
	h=From:To:Cc:Subject:Date:From;
	b=jRn9GE58rg5jRKYzneHhwC9isjT4j93Hqwyw8MJZgGHEV3FQpizt1Y0fAdar/y4WN
	 MsBLsRrVfokx6/upoaCt6SniNa76mwPDlWNros0ooTd73reZVQE+oQDy94mkKCxt1h
	 vJ1pdqt5D0+9rJ610Pvbjc5T+sZ2b4t7sYPJlCOzOdaKv58jz3MXeDQRpgrpfiMZi1
	 NT2Nd0fE1+nAb4jmnTQZp0g+zPJA+WRNZGKw2zkRSoi88osz07zAnJyCf3hd0uOtol
	 LANQglcfj4SY7iKag+XfGuc0752AGQeGQ2yrK1M4FLJ41CJ14AX/3wR6Cr691ADCpW
	 YGSR1kv2xVtoQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Charles Han <hanchunchao@inspur.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 01/16] soc: qcom: Add check devm_kasprintf() returned value
Date: Tue, 12 Nov 2024 05:35:43 -0500
Message-ID: <20241112103605.1652910-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.7
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
index d7359a235e3cf..1d5a69eda26e5 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -782,10 +782,16 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
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


