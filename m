Return-Path: <linux-arm-msm+bounces-59357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03932AC3687
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 21:28:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C51517ABB37
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 19:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DF6326A09A;
	Sun, 25 May 2025 19:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wrcDgDdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8973726A0BD
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 19:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748201185; cv=none; b=HyxFy3t6HmQUNmi5JDmiN9ca8zXu0RfvZChmjLC7vNR1weDydCbbZKZ9X/u89PeN38IspSrFDNoAofy4xaagzCvxypuHL5JJvDaGIWQaraNv5SQfOIs0s3FPcJn1BXY7NLdQVZeYeBQZC7RHoe1skt0/NYlpOQFi6H+adl8FOmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748201185; c=relaxed/simple;
	bh=wf9mMF4piwylWLERQD6eu/HVFRIY7xIhB8VCk+ieFdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fukeTs7n44PFtYas4dQkm99CJSHQZ/jVkn88zwwnG1Bz70d5bHgTnUOZulrAoCHQ0RpeEmO9p1BjlIWIBsu3bgoN7xr1zaIaL1HAveWtNW7NehrofF90vbqvjcmQplqJjeIz3IinjK3MhZi3vE0I1NZDr3N0tF6JkZX/mebHrQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wrcDgDdl; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60462e6f227so163389a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 12:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748201179; x=1748805979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dB8Qgyau5a7VreD6df5S2eMKOiRWv79kx7XCROS4r/I=;
        b=wrcDgDdlB77/8sVADWbFbOueNOJpY8qiY9wKfUIUQE9NoFavXjWdOUwgMoNiJBvPkO
         z4h9OtgTl8ePEx26YoyUWKBz7o2+jSY0Uab/ZaQKF3ph1BoVatIHG6lMoI1s983uDVna
         gMnNYvFGP4puFStd8Tpy6vNf3+YuGEW5MloIh8tX7Y08BMyZui4anXbaXe/oJlQsNfk6
         MSqcEA9b4orMXeWaGEk2YLCRRWVhNk2GMNfN83gONhMThdzG2NzB+KXxwejg4t9LHwPT
         aw2s2/pID65qzl/yXRZS+Y4cobkUsngQq3xn2x5xqlTPLGMJyBQovbq6Y3sGrqiMOxzZ
         jpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748201179; x=1748805979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dB8Qgyau5a7VreD6df5S2eMKOiRWv79kx7XCROS4r/I=;
        b=awh7LgXUaMMgdhgSwzreWF1BtyQwTHqiK1zmQwEvRDXc+n6n64B7ucC9uxVw9R5chh
         YIgo+S6Yb3icyRCo0rT0RAUmDTEoK3wg62PzdICBTxTHeZfkglS7uCgQMvRtFQa6OWwA
         WsUC+6HpnxWzKUDVhKepzr2LH+ukaAZYEPz1J8UV1ii+gjyjtEJ7B104hvc9wE77a+hO
         emSOSv+j94dy9HXv/iQZ6dzuioSo519J5upOL2IaTne4yJwI9J0Xie8DT/o3I5WWk61v
         oYzvM99dV4QlDQj+Z4UpoSkXFGjrrGYcOAx7Wo1yMO1jgWiab9ndON1zi4aC0p+qIKPW
         qIog==
X-Forwarded-Encrypted: i=1; AJvYcCXRk6wDCcSQ+bH0t1Y1hpyO9zYb7Jg1mc5g5da0U0gDqeHJwX4rmQ2be6IXBj6xz7FECqzIofA+7Lf36JgT@vger.kernel.org
X-Gm-Message-State: AOJu0YzTGNj+hfb+DhkMyBsIzhmwBfliNksbNI+dQwJ5crCulWAoXVgB
	LKOudezjO00Z6Mt9wuki1ypqX7LLj5tOoLSaYY5DD2ajiCMBlk3Fn681n+PjtuBXQcfI3CyR6K/
	iY++K
X-Gm-Gg: ASbGnctSQjpTkB3Nj+Zadu87v9VHBwqq5ZlWe1BjrVUqBAGYHzeALK22+RnGOrAWMy5
	eKKh4kv4w2haRC6+5cI/ir+h+l16LnIGXNtoHDZtpHqB88+N09DfyF1enfBUpDarHz7uxkbl1Lp
	tbDfBEzCB8bdtr9auKP/cMgBvC25PY75eWl2ElAa/4A1IQp8AAT/XSW1zez/ZNXQYAWFX2lvQl1
	CmudZMnsZHXdQdh7tQupy/WpYIumeDcf9+6GjujSDOxhHruotwZfVNW7BCxFiQfI5aTUjU97h8B
	1fVp7v8qrtyjieGNp9amheDYbOQcln/cmST6gUmyJz2qZUBjDcN/A+ENxKbAZQaoU3h1YSs=
X-Google-Smtp-Source: AGHT+IFU6iw0nh+JfwxngddrMbaAdOgnyTVpsEnCYJPukcl1HAYkzxRla7dTLdaaFau0zKRt4TXHew==
X-Received: by 2002:a17:906:8470:b0:ac7:4397:4345 with SMTP id a640c23a62f3a-ad85b11378bmr178652266b.6.1748201179389;
        Sun, 25 May 2025 12:26:19 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047738sm1578899866b.19.2025.05.25.12.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:26:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 25 May 2025 21:26:05 +0200
Subject: [PATCH 5/5] dmaengine: mmp: Fix again Wvoid-pointer-to-enum-cast
 warning
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-dma-fixes-v1-5-89d06dac9bcb@linaro.org>
References: <20250525-dma-fixes-v1-0-89d06dac9bcb@linaro.org>
In-Reply-To: <20250525-dma-fixes-v1-0-89d06dac9bcb@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vinod Koul <vkoul@kernel.org>, 
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wf9mMF4piwylWLERQD6eu/HVFRIY7xIhB8VCk+ieFdQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoM27QVOIFby5xrQ2vikjmTQ7sy/m4A+Dgt9+tq
 viv3z7R1WGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDNu0AAKCRDBN2bmhouD
 13XnEACJx5d0HBGfD5BYrQ/0oD8C7EAM3yTiKzycRx0rnOvdsj40fPEbcAEVzJWDBnzOojfNm6D
 lnrDDw49hqQIGOukFQsiJv/gZDfBaUJw7+Dmtv57AjMZ585U2DErn1tA2ts/l8KZ4G2m23X/eFK
 BBND/wfdmH4dlObFa99BwZ/25oozbvMPTm4vX/w99ss1IfuHu5ccWWTWWPRT7UhGKKEjaP0DKn9
 52jsFGQqXwGXeXQlOeOhVZ/sRVW8qTABHRgDoNS8jnUAZc1JyimVR16JQTQYc+FhBXPvT+HC4Ds
 JTTxgv2cB8/KJSg3TD1yXecjPEC14rrhX9hLg7MwERfca5VtUOgATV/iRGO/6Yam/XNwHeCGm3a
 HWsKhm5Jor2ZFKDzphxNICY4Hlfn05hfbPz8CictbHrcbLFLQhvujVChlYOA+yzUUDcU8ZHuHuL
 wq9KcgowFM3M1pBICip1f6FPIIJ+1rvfFNIX+bWNvcsHECHzL7gStOswCNa/BGQS3OdLj9rTgOg
 hCJxryLHK7x3BkTmWdJkqhVkc+p0/4jjmtrZeYLpMo10JtVV8ocEAFD4b4sGYK6HIsWpXH0LHrf
 OD1yWyRuahfwIM4pACg81vcfiesVeEOYgsWaUrFbe34fn1tNlGZIA4rvem0fMjGYuiwCcc2wXaJ
 6MtXrUj2ocfKrEQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

This was fixed and re-introduced.  'type' is an enum, thus cast of
pointer on 64-bit compile test with W=1 causes:

  mmp_tdma.c:644:9: error: cast to smaller integer type 'enum mmp_tdma_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Fixes: a67ba97dfb30 ("dmaengine: Use device_get_match_data()")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/dma/mmp_tdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mmp_tdma.c b/drivers/dma/mmp_tdma.c
index c8dc504510f1e325017ba4fa5e7aa72b019e3be4..b7fb843c67a6f247395296fc726f7b6cab7d223f 100644
--- a/drivers/dma/mmp_tdma.c
+++ b/drivers/dma/mmp_tdma.c
@@ -641,7 +641,7 @@ static int mmp_tdma_probe(struct platform_device *pdev)
 	int chan_num = TDMA_CHANNEL_NUM;
 	struct gen_pool *pool = NULL;
 
-	type = (enum mmp_tdma_type)device_get_match_data(&pdev->dev);
+	type = (kernel_ulong_t)device_get_match_data(&pdev->dev);
 
 	/* always have couple channels */
 	tdev = devm_kzalloc(&pdev->dev, sizeof(*tdev), GFP_KERNEL);

-- 
2.45.2


