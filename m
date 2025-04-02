Return-Path: <linux-arm-msm+bounces-53029-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6495EA78D60
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 13:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDEB71683EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 11:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B28238156;
	Wed,  2 Apr 2025 11:44:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99B3236451;
	Wed,  2 Apr 2025 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.216.63.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743594257; cv=none; b=cgl4KRJdHt4be4+q9ITUdYV7v07SKDi61XNkyn94jrJJJSRZnqLDsw09WpF7baIQ7BVVx67po714A0E/eX/Bs26OAjc3i1imc3dzUuFQzzv1dnAWsk48Us/vH7FyTecB/n/zLGEErfdVVa5+fZCLPOA+9Gu8xoYudnMEyYPzuDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743594257; c=relaxed/simple;
	bh=Z0NePWjC0usRfphBp4RYVUXKLMLWOyek6WqP11WZt3M=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=g3L1AwUYlngreUDV0Uudi18eTyxVdHKgzIkCPWLaUOi6oHmR9LvvgZI/r0xRVkm1Xm50LtoXaaCE+f43Fi6CquZe412/D8NoEJiOl5xp3Nff9G9XwHehY4Asb9TYyYdjPacqTL4G+ydViGYzJoMFgtpGWULNTD3dDCB9eItIz0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=63.216.63.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZSNLk0g6Rz5B1Jd;
	Wed,  2 Apr 2025 19:44:14 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 532BhsZv019636;
	Wed, 2 Apr 2025 19:43:54 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 2 Apr 2025 19:43:57 +0800 (CST)
Date: Wed, 2 Apr 2025 19:43:57 +0800 (CST)
X-Zmail-TransId: 2af967ed22fd046-2b930
X-Mailer: Zmail v1.0
Message-ID: <20250402194357404aoSxd3G74tojxA7uCZXiy@zte.com.cn>
In-Reply-To: <20250402194100610qY6KQ4JPISk-4v214Qs36@zte.com.cn>
References: 20250402194100610qY6KQ4JPISk-4v214Qs36@zte.com.cn
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <vkoul@kernel.org>, <robert.marko@sartura.hr>
Cc: <kishon@kernel.org>, <wens@csie.org>, <jernej.skrabec@gmail.com>,
        <samuel@sholland.org>, <zhang.enpei@zte.com.cn>,
        <linux-phy@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
        <linux-kernel@vger.kernel.org>, <luka.perkov@sartura.hr>,
        <linux-arm-msm@vger.kernel.org>, <heiko@sntech.de>,
        <linux-rockchip@lists.infradead.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgMy81XSBwaHk6IHF1YWxjb21tOiBwaHktcWNvbS1pcHE0MDE5LXVzYjogVXNlwqBkZXZfZXJyX3Byb2JlKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 532BhsZv019636
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67ED230E.000/4ZSNLk0g6Rz5B1Jd

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

