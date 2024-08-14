Return-Path: <linux-arm-msm+bounces-28505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BE1951CC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 16:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AABD1C20BEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 14:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE1A1B3757;
	Wed, 14 Aug 2024 14:11:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5201B3729;
	Wed, 14 Aug 2024 14:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723644712; cv=none; b=FzAzk+SjnjY75ns6ivwPjsJUrbdT2xY9XcUxPGmf1pKjN/59LCirPTWeb5kpvqcykkxUPicZMN45xBsuN2FqlVCVet/RZ83exkIDQXhqcZbkeW5L/9Q1QLV2t6+M+7cAnEFAEn8tSs2b9owuyRPLCS7LriAlBbT2MCRyCQ1xm6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723644712; c=relaxed/simple;
	bh=i1CAnk/h9Q4SXCTz0xXO4EAsYZeuzccmTH4b+ucvLnw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SYqJYJIqQA8gBeTreqVM1XfBOTZuyvQIqdOS2jCqcssLUSrUJH8hYt2r4+HBaTxRsvfD8mKEocA5zSrpYVYbBbFFF3vsQ3K9XC2aOC8hi+6Hbj/lxbAPSAorUbj/8xptFqCdFBxd3ZyLjtgeSoT/uFAft6SJs+zvUNZu86Ghxn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-01 (Coremail) with SMTP id qwCowAA3P0sOu7xmZa95Bg--.10101S2;
	Wed, 14 Aug 2024 22:11:33 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: vkoul@kernel.org,
	kishon@kernel.org,
	make24@iscas.ac.cn,
	ansuelsmth@gmail.com,
	agross@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] phy: qualcomm: Check NULL ptr on data
Date: Wed, 14 Aug 2024 22:11:25 +0800
Message-Id: <20240814141125.50763-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAA3P0sOu7xmZa95Bg--.10101S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKr13KryDCF45ZF4UCFW5trb_yoW3tFcE93
	4UZr4fuF1ktF1rGr1UtrnIvryIya4qqr48Xa1SgFyrAay5AF1aqF98JFZ8ZrZ8Wa1xJw18
	J34UuFykZr42qjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUbQVy7UUUUU==
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

Check NULL ptr on data, verify that data is not NULL before using it.

Cc: stable@vger.kernel.org
Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index 06392ed7c91b..9b9fd9c1b1f7 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -492,6 +492,8 @@ static int qcom_ipq806x_usb_phy_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
 
 	phy_dwc3->dev = &pdev->dev;
 
-- 
2.25.1


