Return-Path: <linux-arm-msm+bounces-52739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCBFA745F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 10:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 504011897B44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 09:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE7B1C84CA;
	Fri, 28 Mar 2025 09:05:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B56817BA3;
	Fri, 28 Mar 2025 09:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743152721; cv=none; b=WTVDD8qa40ExbihziNd9cVd/7Q5iOxGbCzYCZN2uVFINtlhTHgoC99V2sDh5vy32NUCQZGx1dyHcpy+Cu+MYoa1KpIUhWMeXxEpZkVyOmk6KZShsIBu7mSDsKUUxTeiwEhBDcCqW41nSo4umazOthYZHJM+/swK4/CZs+DEi1MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743152721; c=relaxed/simple;
	bh=Z0NePWjC0usRfphBp4RYVUXKLMLWOyek6WqP11WZt3M=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=oSZCJhXhqJiGT7okEfeW5MEDKHmNJY8OGneHqT9rf7Ox9pnNtkKGiqJFxz1CTY8Nu6YEcE6+RucbuPJiJsdU3cfDr7X2HL1dTCLAM6NrAAimSPo7vIJYI6rwzSyHJd873nxWG1dwBY6mcK0sAadEl7hb2n7j10kFA8xQuCucaGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZPF3f34lyz5B1Jd;
	Fri, 28 Mar 2025 17:05:18 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl2.zte.com.cn with SMTP id 52S958Sd007615;
	Fri, 28 Mar 2025 17:05:08 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 28 Mar 2025 17:05:10 +0800 (CST)
Date: Fri, 28 Mar 2025 17:05:10 +0800 (CST)
X-Zmail-TransId: 2afc67e66646ffffffffca3-c3901
X-Mailer: Zmail v1.0
Message-ID: <20250328170510996P1Sd9KSFJn1p08vc0LXHX@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <robert.marko@sartura.hr>
Cc: <luka.perkov@sartura.hr>, <vkoul@kernel.org>, <kishon@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBwaHkvcXVhbGNvbW06IHBoeS1xY29tLWlwcTQwMTktdXNiOiBVc2UgZGV2X2Vycl9wcm9iZSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 52S958Sd007615
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67E6664E.001/4ZPF3f34lyz5B1Jd

From: Zhang Enpei <zhang.enpei@zte.com.cn>

Replace the open-code with dev_err_probe() to simplify the code.

Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
index da6f290af722..738b3015747f 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq4019-usb.c
@@ -109,11 +109,9 @@ static int ipq4019_usb_phy_probe(struct platform_device *pdev)
 	}

 	phy->por_rst = devm_reset_control_get(phy->dev, "por_rst");
-	if (IS_ERR(phy->por_rst)) {
-		if (PTR_ERR(phy->por_rst) != -EPROBE_DEFER)
-			dev_err(dev, "POR reset is missing\n");
-		return PTR_ERR(phy->por_rst);
-	}
+	if (IS_ERR(phy->por_rst))
+		return dev_err_probe(dev, PTR_ERR(phy->por_rst),
+				     "POR reset is missing\n");

 	phy->srif_rst = devm_reset_control_get_optional(phy->dev, "srif_rst");
 	if (IS_ERR(phy->srif_rst))
-- 
2.25.1

