Return-Path: <linux-arm-msm+bounces-29200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84264959E33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 15:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 433931F21BE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 13:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE93515FA92;
	Wed, 21 Aug 2024 13:11:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6C1192D9C;
	Wed, 21 Aug 2024 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724245865; cv=none; b=OUFukn8dfYLPvHZaaBlu2YO4DWElTrzvcwC/QYvzAQTztUz0arL24S2X4mlOE1Rj3mn8XaBn7Jz0dkPoFrYaS7wA3hosi/es7t1ANYWGn0rSa2wmlKT2TK5GL85dlsI9UKN2lM9K6Ipt9QvMUXlxGqiNfG39VqC6w+aZieNsXv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724245865; c=relaxed/simple;
	bh=IXNh5XLies2Zu+d70075n+GhEUYfdwWx9D38TKDaRHo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FWSxxW3jjgHpiyWGXB4R+gNF8sDFaTko4DU/HXXR9GU3uM0572KhXVNCu/Pwh3oRVElefcEUYbCOthSDQtHPvJKGU2n9OmuxnRpPaEMYKRBLafJxhvvNLnbEwpTUME55G9atvhrsMS9F1D9tTdQsy+pjgAQgbIIuNu0Oa37NuzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-05 (Coremail) with SMTP id zQCowAC3vzNT58VmLeC2CA--.16735S2;
	Wed, 21 Aug 2024 21:10:50 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: vkoul@kernel.org,
	kishon@kernel.org,
	make24@iscas.ac.cn,
	agross@codeaurora.org,
	ansuelsmth@gmail.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] phy: qualcomm: Check NULL ptr on lvts_data in qcom_ipq806x_usb_phy_probe()
Date: Wed, 21 Aug 2024 21:10:42 +0800
Message-Id: <20240821131042.1464529-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC3vzNT58VmLeC2CA--.16735S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZr13try3AFW8tr17CrW3Wrg_yoWDGrbEga
	4UZr47urn7JF1rKr1UtrnIvryvka4qqrW8Xa1IgFyfCrWrAF1aqFyDJrs8ZrZxu3WIvr1D
	J34YvFZ5Zr1jqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

of_device_get_match_data() can return NULL if of_match_device failed, and
the pointer 'data' was dereferenced without checking against NULL. Add
checking of pointer 'data' in qcom_ipq806x_usb_phy_probe().

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


