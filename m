Return-Path: <linux-arm-msm+bounces-37588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5287F9C54B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 11:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1817D289522
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 10:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8BE2139A6;
	Tue, 12 Nov 2024 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phbfYCsp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5420F213159;
	Tue, 12 Nov 2024 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731407841; cv=none; b=jIKJZ5wjTKGqSCih6Y3uQ14wBEkT2OfEx/jLaodlkOhSrBJjYQnj2WMxmHgomz+4IR1W4JM7HvMncRL28/f0pUzrg5sEAO0f6VIu9IhyEe3jboeE4ozGzlz0ULH6dTZvuIGSTK22NUl4k5rl89fpPDbhWK34jFKuvBuLdekLkIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731407841; c=relaxed/simple;
	bh=ymDWeltvdVZ04JzWsMMXuVglND/zCFxPgQqSdNVCuSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZnhrVl0eqqhJUemLFG8XNdegjGRQzIlqHJJCzmHL3EineHDEe7k3B8Tqcs5k7jLGF+7BGMatSBmZDmTw+dkez3JufAZUmGg53Teeom2rGP8efzJoph4M85gKXIRiZhCOZw4LXQwASalGeJnPerwkVkvpWq3yryzjXIQaxVBesBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=phbfYCsp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BBAAC4CED7;
	Tue, 12 Nov 2024 10:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407841;
	bh=ymDWeltvdVZ04JzWsMMXuVglND/zCFxPgQqSdNVCuSw=;
	h=From:To:Cc:Subject:Date:From;
	b=phbfYCspRYEgkps5efm6R0hK+B1oHwwXEHi+vcuRkKRI+MXRaBwAyVg17fKLik1fU
	 9Hh3G2kqOrQ62Yb02J3HbKDOg+XpMqF+Qdr+nBIGF7/dryk8O8d7PTO/PwqRr6Jh3e
	 UBzhdlFSDQqoQY8z6FRifJiI4G202yACxMyOXYYgUp7gJEUaC+UIOt6Up5F5W8G1pR
	 R45foDKttYSR0rNO6T9U9QO2HUbHHwX5ATzUW1ZYFN1YAHOqewZnyMIKwbMkcV6Mup
	 TVsULy3SD199Tgk1hAij53hY6PoiyAtzlrpOf7AwWRnNvueaj3pPz+8EWuUMTFFaHG
	 wAMFabSZmxEXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Charles Han <hanchunchao@inspur.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 01/12] soc: qcom: Add check devm_kasprintf() returned value
Date: Tue, 12 Nov 2024 05:37:03 -0500
Message-ID: <20241112103718.1653723-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.116
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
index aa37e1bad095c..66219ccd8d47f 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -649,10 +649,16 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
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


