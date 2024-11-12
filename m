Return-Path: <linux-arm-msm+bounces-37589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4119C551B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 11:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2591B24CB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 10:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E80622B396;
	Tue, 12 Nov 2024 10:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yvk8kSrP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AC022B397;
	Tue, 12 Nov 2024 10:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731407868; cv=none; b=gCr26QoF6QY6KDKSOUUXrCtaFN/GvYgu3C8CisqA+e/EYcRlMsRJ2FbV36R5enXl7BDaDzrTWfvE0KgaeKuG2cpoyvRyGiv+b+Eo9zYnA5evQMmD+p+89OGtggXiD62XiBz3yLwgh6C3FLlQjCSfO73WVTsD8eXHGrQJfDW3z4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731407868; c=relaxed/simple;
	bh=jGFLZK+Nv+GHQpcFnQgykeoo0kPtjY9xn/SnLBFtoI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tn2PSg/bT56nXPRTJltSBrl7P1ZFjSpgfdMQWqjNAjqMCpMJg6UiNeyrwsDI8LJLBo/IQEne43TSvtph+A2ngvRHyayVDLpeGBoNUy/chxGW3anpPg5e042RBP3HxiHuAF8acQk7YwdHcks1GiFDNh3T9MAV8wtiT7TFIffPG3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yvk8kSrP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2AAAC4CECD;
	Tue, 12 Nov 2024 10:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407867;
	bh=jGFLZK+Nv+GHQpcFnQgykeoo0kPtjY9xn/SnLBFtoI4=;
	h=From:To:Cc:Subject:Date:From;
	b=Yvk8kSrPTtrT2ewYG6yi2JShaYAxZiaWINKc5g4ZkdxULfnY+OpjHZ8KN79ravjKI
	 O83+kHXykAUZK/lxr6KCvu8Srzm+H0NyN0Vy9lp3hTducgSROIyEICwb1Vj4icwjhu
	 VMEeuF5R8PWW7BqCB8+gcLji3NiPZ5MUk7M8k3jST0ITWNjrDOf+NaVOuQW8Gjjb4m
	 xggM+W2ft0AhTOTNrotCEYBkeDjA9ed0ESxdpIqQamKgwZbKpNpONOwohaC5BDo+OE
	 CJGg6M2LFgatBqomnsKVaMnDjypAxgG5ewEamPD27Vxl9Vmk1yJpuBNXQhc1Ngbtjj
	 tTMwXvENJ3C2g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Charles Han <hanchunchao@inspur.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 1/8] soc: qcom: Add check devm_kasprintf() returned value
Date: Tue, 12 Nov 2024 05:37:35 -0500
Message-ID: <20241112103745.1653994-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.171
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
index 5beb452f24013..491f33973aa0c 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -614,10 +614,16 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
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


