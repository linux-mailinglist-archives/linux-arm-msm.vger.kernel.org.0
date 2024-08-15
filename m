Return-Path: <linux-arm-msm+bounces-28593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5499529E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 09:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABE8328110E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 07:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFBA017AE11;
	Thu, 15 Aug 2024 07:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ak1x0BR4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEB1179954
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 07:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723706986; cv=none; b=F79q+/+4yCvWKSkXyRqnRP7lNQauvpWqxNKuu9wjQ7Yxcaz+pQDqtnRrK5rREasFYMzQXWacps8PFugz05ac2sk7ivKwCnzxNmhcyPFjyzTDVnEhwvpQcZzOUnonUVJ/61NaAgagxpoJWinBDX+qNYM9DEVaVTASZDRhK/zSgn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723706986; c=relaxed/simple;
	bh=hPX1celK2r4ELG+EKPXeAClu4f8aV/KAzwDNQ2P/imE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bchs2jS898rQpv0Btm0+kKKoghUqIrre9iijcsVtQeOJY0amrafj2kQCTo+0nY7IHb6pU60v5+cWM0behppe67/pG9CVKxr0itZdn9qUrP8aS3jgf0F8H0X6hU+Tp9A5/5LG8O9nTLUQ2zO8bQwZXR+kyicDcELp1XbvkSUuJjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ak1x0BR4; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3db130a872fso384046b6e.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 00:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723706984; x=1724311784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EwP1Gv/Yx/xpl+pnVih7/w3vpScHL1lhIFF+Jyhxw7M=;
        b=Ak1x0BR4TtlYd5wFix/qt3t0aDEzhwxVLrirTJtyNmYzslnKpF+wdwpy9oXIe41w+6
         3/s6pKqsbl0c/SMYvRm2fPsiuQfWzl10JappVmN7TOTeUsfLRBUQo0XAJ3u9/qN/o5tv
         Hm9HjZ6ZGSj8myiJb+rktiFvw+Mq3U0S1pAnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723706984; x=1724311784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwP1Gv/Yx/xpl+pnVih7/w3vpScHL1lhIFF+Jyhxw7M=;
        b=qNvSNzxVcMJn8/1e4Fveq4E3SRn0aYBefBup+Xm7FLx+VeupMC1+mJl33IvVNGP7ny
         ucgCQtGYQqm2izzr8v3Hzn62ar2LWji8Ic8fGFsdre3zyZSDHvy3s3yEgYsW9R6xvBSs
         itvg82pnuDfVCNdQg4n0wPsWl8M7RjTHctaR76ku4SDlAGL4+jLvPVSI1Bn1lhsj9RVs
         lvYI//Kvv0Pisodp8K2YSpb3ZCMYctIx576MYOWDBo9zJGJF0Hm8FY36/DGm2RJwplTu
         YuWmfYtTU7grWBKt1A0xoRXxGYH6+BFy2Rhj2xbEo1xPRcLEhkFcxRFaRABFe7nfQZxL
         rFKg==
X-Forwarded-Encrypted: i=1; AJvYcCVJM2qYTJasPAtJEnPnKH8vg1M1snNlCk+P9NWfH6nLDEXe9V49edxxSznxFUTVcMLqKsTS0ehjy5DdxQk5c7GAAo+RUdlfaqfM1DgqHQ==
X-Gm-Message-State: AOJu0Ywqs6+rq4ICjqSXHabEy5Q6j1HRKHRmrGnsbOMqExomQegsOQ5a
	xAHfd7yUDZI4QCbKdfuWLIGEdZQmkL7CT6bSYmhQmZ0pfDvVBoJ4ee17rB4r0A==
X-Google-Smtp-Source: AGHT+IGmv5LKc/rdRpi8Ra9/RsIMunAWATmlN37PMZ/4ZdYVF8yC6fAOhJyK+4vfrUac1BNWQewwDg==
X-Received: by 2002:a05:6808:1821:b0:3da:aae9:717b with SMTP id 5614622812f47-3dd299929c7mr6326564b6e.45.1723706984412;
        Thu, 15 Aug 2024 00:29:44 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:745d:58f7:b3cd:901f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61a6d98sm524661a12.11.2024.08.15.00.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 00:29:43 -0700 (PDT)
Date: Thu, 15 Aug 2024 15:29:38 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 5/7] thermal: qcom-spmi-adc-tm5: Simplify with scoped for
 each OF child loop
Message-ID: <20240815072938.GE350960@google.com>
References: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-thermal-v1-5-7a1381e1627e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-thermal-v1-5-7a1381e1627e@linaro.org>

On Wed, Aug 14, 2024 at 10:17:51PM +0200, Krzysztof Kozlowski wrote:
> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> index 7c9f4023babc..19cdb98c310e 100644
> --- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> @@ -938,7 +938,6 @@ static const struct adc_tm5_data adc_tm5_gen2_data_pmic = {
>  static int adc_tm5_get_dt_data(struct adc_tm5_chip *adc_tm, struct device_node *node)
>  {
>  	struct adc_tm5_channel *channels;
> -	struct device_node *child;
>  	u32 value;
>  	int ret;
>  	struct device *dev = adc_tm->dev;
> @@ -982,12 +981,10 @@ static int adc_tm5_get_dt_data(struct adc_tm5_chip *adc_tm, struct device_node *
>  		adc_tm->avg_samples = VADC_DEF_AVG_SAMPLES;
>  	}
>  
> -	for_each_available_child_of_node(node, child) {
> +	for_each_available_child_of_node_scoped(node, child) {
>  		ret = adc_tm5_get_dt_channel_data(adc_tm, channels, child);
> -		if (ret) {
> -			of_node_put(child);
> +		if (ret)
>  			return ret;
> -		}
>  
>  		channels++;
>  	}
> 
> -- 
> 2.43.0
> 

