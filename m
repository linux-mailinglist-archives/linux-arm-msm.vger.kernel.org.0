Return-Path: <linux-arm-msm+bounces-28549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1715195233B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 22:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B36CB23A5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 20:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D471C8FB5;
	Wed, 14 Aug 2024 20:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0EWNg2y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A837D1C8249
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 20:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723666693; cv=none; b=YIBZyIQRuHrbGmuKSSCDY2o9XuPyVox2ycOe1Fnj5X+kTOZSu1I323FFWJ8xjYc60nGQAmfn+FHNYYFpxMCGa6magi7yVC4jEkzxmvG3HuFd31SWjtCNOIgp3h2HimcKhg5C8TTOv2ScnV0NsOt5eFEOcO7IfGyBw/C0Whc0his=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723666693; c=relaxed/simple;
	bh=2Ohf+Waz1Uv9wtQt31iPhyooUXS97YnL8KjoPlEF1Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JxxElB6rPsEIc1h9XwZO12BvJMY/gJXKcIL0fOWQYKVspWHsTHv1xNKNSLXZRcjRZy9U9FGtBpBa5rkNVXlcYR+AbeVca3xGm1/3BAsbPs+Iojxu9yMfE5wVlQdojQtqydRHcU9bbQs4Li7CP+Uo+TlccgxBOghDexTY0PS6z5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0EWNg2y; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-429c4a4c6a8so1171055e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 13:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723666690; x=1724271490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iS8jaBQ+XPS+HrSzqaFJuxj2Miuibr1hkk4HXdd8vis=;
        b=c0EWNg2yeMWeAIhfHOfiv199ajt/4CHHnA8OPrKmmjwoHUvs9od4Jt4+87TzaZ7Iud
         Hbq2iojxrmkYJvAtndkjyZuVfLBukTkn3dq5neLEqJsUnXhdw+HawWPzhtehrZqKgjwy
         bzohgB3gHEC1UH/YjK3pfS5RXos5sr6JJhKWggwDF9cw8rIjYcYasJgshl68x91Mf0/D
         QYO5iqt5c6HlGv7INxZ8Y2gv9nEtXgvhZzhAVxr6CPiQudO1LCuYodk0ij1JFfL8AVQc
         bcJY0AyRVnEjQmA1An6XJEr9QxTD9E0w1nJs7nPuNecJMu5//AbUna/bQFZWy6DDxpAL
         ptxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723666690; x=1724271490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iS8jaBQ+XPS+HrSzqaFJuxj2Miuibr1hkk4HXdd8vis=;
        b=eKD0TZS1wUuijgMuTTlsQJETLPZi9wU8vjHZxkdyW1JA2CMDqsjzepd+qN/BJ8wfcM
         xY5DTp0o9YQW3anq1301KlOL0WvMB/hqL+tEjE3HkqQsD4g4q4t1NqqnlYlrUr6DFyIm
         lgjDv1ACWXxP96XtqVh2MfxzOGjruSJo4NjE41e5DNWRxMNhVr9dUH4yDPCrdrPdNJpE
         W/RlUAKCsGfF8hty09Jxpc3Dvd+8m1N+UDxJjF95zA5crZrfOWRsfD+ZzTvOiC78FCm0
         Dth0eFSRYKisqpQaqiz8rFilEaJlh7ok3T3yp+upUXrzahG8LV6ptQJTqAI5zmaCquh1
         JXBw==
X-Forwarded-Encrypted: i=1; AJvYcCXjwmGgtaM+uChmKWmHUjkvcEWPzveWYsxLc7eSYWFwt5ZoQxmRVnAUniCxJHI5Mq6vEU5Ctz9vkj345iwWAE8Gam7IHdm/3pbs37Y1dQ==
X-Gm-Message-State: AOJu0YwJwGs2ZUNiItAIk43q+YRcdqHV9lxYaNKxVfKB22uq686Gx4zP
	OLxTI/u6SOs7dPmQi0ZL9ZZVyMZmBXO0m+mOOeu9nLmd0Ix0cX+UyAKjmQIf6bk=
X-Google-Smtp-Source: AGHT+IFsLMIyu4uFm0/1NmefGh3pTOjHspg7ni39a5RRrIULetCOqFEEtE6l7XZ/TGGxfp+c31PvHw==
X-Received: by 2002:adf:f341:0:b0:367:98e6:2a1b with SMTP id ffacd0b85a97d-3717775ed3fmr2326419f8f.4.1723666689920;
        Wed, 14 Aug 2024 13:18:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4ebd3631sm13623519f8f.110.2024.08.14.13.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 13:18:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 22:17:51 +0200
Subject: [PATCH 5/7] thermal: qcom-spmi-adc-tm5: Simplify with scoped for
 each OF child loop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-thermal-v1-5-7a1381e1627e@linaro.org>
References: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2Ohf+Waz1Uv9wtQt31iPhyooUXS97YnL8KjoPlEF1Fw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvRDz4gsbX2oJh3LGRuALE91k2eaHcfy8c0zAl
 +KSZZ6MB5yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZr0Q8wAKCRDBN2bmhouD
 12jvD/4vU8Pg3N25/ox/QWe50Am5C8y6qF9U2XuADTIEwRHGA1yeXaB2aQoyiOJpuu2/tFOj9Ng
 NFgeHa27zgl8O8Lm3gV+/0B0cpPv6BSTUlbscVbe0RZmZmfjPNu8j2SlVe1DT+cVujUocxUVRio
 nwE5QJHIHEhlJVIilweu7hT1loUd6XrsYg6Mu+54wbp2ew33JMGG/69C5FZau5sbIgIL2MUPWve
 yhuuCdl1K9adE6TzmiRrZenA8oWJH+Whj59x86R8gwlgCZCu2J4ErN4eS13wJOTWNtA5XqPkGV+
 8jfT6359HEESKIsgjIwE8qs5mac9oMgiwgkwqSXA8hXT3rrHAY71npS9ocSWp/4XUJy+Rp/Z1A8
 UeprbsR04p/SgeQIMp5OAPkx5SVGO9h4P/VXnirEkIT89UM9+CqHSnf+Gz2bMEJ274MaE+9JCdK
 V0RYrvP2VUCmhrS1PsGNLhwhINe0/Ac7fugRryhBu/in7dt4McyJjxrxz1/jxsMgXx52xPINCs8
 +RkotbesbQXqKl9pUHqaCDFuZIIgiWJa0D65disgmxhdxzDqklCNkP+w8mLcHn0pe0AgTIuhfzS
 nqrbxvcTPblQy1+Qvj56I3UFoRZOXxEp3+qoqXCxM1Fn85YM9qq8YSoAS1ENjFscfm6Edqm7qrR
 A6oUV4OvIB44QRw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index 7c9f4023babc..19cdb98c310e 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -938,7 +938,6 @@ static const struct adc_tm5_data adc_tm5_gen2_data_pmic = {
 static int adc_tm5_get_dt_data(struct adc_tm5_chip *adc_tm, struct device_node *node)
 {
 	struct adc_tm5_channel *channels;
-	struct device_node *child;
 	u32 value;
 	int ret;
 	struct device *dev = adc_tm->dev;
@@ -982,12 +981,10 @@ static int adc_tm5_get_dt_data(struct adc_tm5_chip *adc_tm, struct device_node *
 		adc_tm->avg_samples = VADC_DEF_AVG_SAMPLES;
 	}
 
-	for_each_available_child_of_node(node, child) {
+	for_each_available_child_of_node_scoped(node, child) {
 		ret = adc_tm5_get_dt_channel_data(adc_tm, channels, child);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 
 		channels++;
 	}

-- 
2.43.0


