Return-Path: <linux-arm-msm+bounces-33506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DB1994371
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 11:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19C701F22F7A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 09:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A290E1D8DF6;
	Tue,  8 Oct 2024 09:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r7g0f0Mv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C3D1D2B0F
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728378031; cv=none; b=S/8fDFZLJWPE/qpVrtNTzPCU64acUITrBtI2Y/vyKeo8Om5wtGDKFX8MRxWaBL8ei+uULWUuBtTqXeVq9eM+11MpXheFNufDma/V2WPh6x55gzM0/DrqvH7V1vfJawQ2w6wpHGxf3LSv1XwDodT54WzxgCsiDtHERabbMh/f5oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728378031; c=relaxed/simple;
	bh=fMDVmrSNIlAN6mKgDdvZqzHHbI0RRw3DAu9CnirmtAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aCsyulHT2jOVUXvmXbiMC0KDlF9TugcDYX4cDY8vfAApsDbN/0GpqFW7jFx6dGZS0OapWG1Oq+2u68wqYeP2dJMdaRvxGjs35b0RafUeBLI1cDyszQaaeIoD/OgPLyfLLYYiOHK7KPpVdJjlhYZsaH7v1BpQKIrGrk3hRkBgHAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r7g0f0Mv; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a994df6bf42so18428366b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 02:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728378025; x=1728982825; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7hI3WMX3UyIZgodODIkEfxJvby1HaOS571OBh/jtnnQ=;
        b=r7g0f0MvVYOKENuXMfVXB8Uk5Qr/6ZSIJ7mBm9iya6Ndfe9SY39rhcA8neGC/YeLaY
         7RdSFz3x0on0Ox+xmf9wC4eY8CAe/kmgBykOq/9M/tbrhGqrR44rJozVrFO+7UPGadzJ
         Jj1Pe0uSTYLqmM8eZ1a/JhNNTfYx5lwXKRbz+gKAbsFo/Y6fUlqilTBzwHQdofzuc0y9
         y/EDV4ZT2AIwvHPfK3nrNW1r2AGlnyMVE2jf7c2AgIwUao9X71ZfvpPeIt2SoCV3VSJB
         28GS03/TNQIuajregT40noZPhBsn9MtpFHi8y6OT1nwk4EpKViNECYCwDE0L4fQEMaFM
         sMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728378025; x=1728982825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hI3WMX3UyIZgodODIkEfxJvby1HaOS571OBh/jtnnQ=;
        b=xPg91ByoAZktl4zh3whid0a4QTuXReKBg8KZ0xw79LPljvhLM5YfweTHlc8pzWuyOl
         Eg2Id7ZW8MIz74pkY3B+z2AgjkBgTryDdkNhrJJCLJJUIpFjhiARFyaQh0GjtVBAatEs
         PvaCIqvnjsPjWA9zfzPT4T+tqgcMY7qzVFwnEH75boTzhUcxvc9q3hleUtnACQ+QtmBp
         QAP9l9+qDKlv4oMTmfoxBn4oHLTj6voNaoT4Da+xTHOIvcxmNJo80LTli3I4IJCiQLd0
         +vQ8/mtcMsPFChQNMbvUOsoT5h+dpxTyh2VbnyIluVb+IacYbBDPcYugKoodDbPY6YBh
         S9FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkC47mAt0Zp+S1U2QCkWfFcbduEeEEJqCTKKsZs30MUF0YZ47OFokIkVy+ifdT+jvm2BYrC3GQAadMsrkU@vger.kernel.org
X-Gm-Message-State: AOJu0Yxii337Avwd8CC36sMhcvZOHVmZl1GNjdGkvYadErnboHkqQ7R8
	1xeI9Fh0sYscrT1aI0h/2WixO/e9la2WYrkWiQo3zLbjW6Ftq9GfcGBUvLhCNVk=
X-Google-Smtp-Source: AGHT+IGn3CxuMTqoQCh13mz4jC9JwZZSlRHEULhxnYn2dzYEgwR+mm0SUFPiPolkk77R3YOE5iHsbg==
X-Received: by 2002:a17:907:980c:b0:a99:55e7:9736 with SMTP id a640c23a62f3a-a9955e79ec7mr244229366b.0.1728378025394;
        Tue, 08 Oct 2024 02:00:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994e6e571asm294701166b.85.2024.10.08.02.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 02:00:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Oct 2024 11:00:04 +0200
Subject: [PATCH v3 4/6] thermal: qcom-spmi-adc-tm5: Simplify with scoped
 for each OF child loop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-b4-cleanup-h-of-node-put-thermal-v3-4-825122398f71@linaro.org>
References: <20241008-b4-cleanup-h-of-node-put-thermal-v3-0-825122398f71@linaro.org>
In-Reply-To: <20241008-b4-cleanup-h-of-node-put-thermal-v3-0-825122398f71@linaro.org>
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
 Chen-Yu Tsai <wenst@chromium.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fMDVmrSNIlAN6mKgDdvZqzHHbI0RRw3DAu9CnirmtAM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnBPSd09eIsYVkCYVYCFtZlxLflDGibJpZer6/c
 cwqxX/AN7CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwT0nQAKCRDBN2bmhouD
 1/IWD/9fe/DMRWMYbu4UcWX2DGRdX/wQYi2rD7n8B+VkDmq0wfAQZ0HLkkbappU3ISFcb+qEqEo
 ukgaKzu1lpDWZXDdGsUfbinrxufa5/xftAt2khQWgmWq5QwdtwBIF5jm4dGHvc+yQEBaoJ3ZGeq
 aMXoaSTCMCAogUZc0ic+SdX/plf+qg7gs4nimuwtpndONT+hq3qYHvk3hC5x0nhAMJ0gSmKS840
 6g6ySO1Ji/wqZp81AifDouypuz7xj3vm2mKT+SWOOcYmnlx8gwHCXXvCgaIs1ulUwxMXkB11p7Y
 R6k4dVvZqTb8HSOB0Ez5JVkEJZ1w2HxF+rt/doKnG0Rw9faIlqf2eJ7B6DoujNofmCvqSrK5cax
 vCo+kx1rVHqwH0LZZdbgmYNZ7GrLR1yTM0gBfm0b0QQCHSgIw5EPAKT4ntW41iySAt9VWiWbP2U
 leE0F/Ffqbjg33IoY9O636bHq081Srro9eR1vdQmzDJK97cx2tBueTKltT6mLhZhz3PtgQpZSib
 x96MJXhDmBFG6meZHxPTkJXkFoc5punDftyolCJsk7u9nyxVx9BjzZ0mM5SfsX84ulV/e9OYOyg
 GE4vXrRlnSLyDllpDe7PngXzY8YE8XgxqOeDEEilgxx30OoFYTxCjzQYBJ/2YzVE4ieyMkl991V
 AD3UH91yTwkEzmQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index 5e94a45eba3eef65e436a01b3aa58aabf5f706c2..d7f2e6ca92c2c9fb532ca5d4bcc22b6c2cddbdb0 100644
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


