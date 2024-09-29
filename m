Return-Path: <linux-arm-msm+bounces-32715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1694398936F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 09:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3FD9285EB3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Sep 2024 07:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E83B13A88A;
	Sun, 29 Sep 2024 07:24:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1800E13959D;
	Sun, 29 Sep 2024 07:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727594644; cv=none; b=gV46De8s2rTftMsUV8FpGPVhQ2vxiqS+ovSE2Jvi/Si97px7oJm1hBPMLY1Fd2sxeQ+UJItIcC6hWtW7rl/gp62V0/JtYr+0jc5MvoGyQmDh1FXqWYaPEdlHjKSFjVZRnWCuc0GxaaIxWE3r5uwo3bHA999pCIwZUpEyWSx9yX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727594644; c=relaxed/simple;
	bh=EhZTeDsP/cO7ivbbJMpV5UHje6DDvs93xgeIwHM5sCg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JzHMTXhd4mOdhiybgEp8UMmO3YhjSqkIpuu5i+B35Yoab7XFuxZE62sPn5UpBODAtiqwVguMMVGITEqTTOVOp0DqrYJ4h450jfcRxAPGrenI5yI+Hg1eErGJMeu9usQkKBtsw3TwDGUdrGIY76Rooq5InMbMCbT83BOVymjnyv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from unicom145.biz-email.net
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id ZGA00153;
        Sun, 29 Sep 2024 15:23:53 +0800
Received: from jtjnmail201607.home.langchao.com (10.100.2.7) by
 jtjnmail201604.home.langchao.com (10.100.2.4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 29 Sep 2024 15:23:52 +0800
Received: from localhost.localdomain (10.94.12.73) by
 jtjnmail201607.home.langchao.com (10.100.2.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 29 Sep 2024 15:23:52 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <kimran@codeaurora.org>, <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Charles
 Han" <hanchunchao@inspur.com>
Subject: [PATCH] soc: qcom: Add check devm_kasprintf() returned value
Date: Sun, 29 Sep 2024 15:23:49 +0800
Message-ID: <20240929072349.202520-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Jtjnmail201615.home.langchao.com (10.100.2.15) To
 jtjnmail201607.home.langchao.com (10.100.2.7)
tUid: 202492915235359499fb467a6607f5186e469dc76228f
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

devm_kasprintf() can return a NULL pointer on failure but this
returned value in qcom_socinfo_probe() is not checked.

Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/soc/qcom/socinfo.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 24c3971f2ef1..e42d86d5f6f9 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -786,10 +786,16 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
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
2.31.1


