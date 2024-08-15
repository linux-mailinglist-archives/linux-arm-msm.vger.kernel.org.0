Return-Path: <linux-arm-msm+bounces-28586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C979529A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 09:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13F8F1F2144B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 07:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A884B17A932;
	Thu, 15 Aug 2024 07:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Q0d8xHct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADD415E5D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 07:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723705828; cv=none; b=gG/5BDwhi9pmF04dMr/l1nfia614u77uPLzHiyx7awcESDyP3d4/MnQ4a2Wq3KyL1KTXJxbEfor3T0PJRKu63Ta02GgrM+ibJ0ilBLs37F0Z7TkNu4uK2Y3EpxwEHhG5Un0bHPKRxAh+4MeCjZeLsvt4zIDtqLrEBF1QFxxO1/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723705828; c=relaxed/simple;
	bh=+G2x58+Rfzt9S7NTB27xB1O9RQRhx/e+CR+izCKso3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HspXPR36hCf6JfVxqWa8kVEEHwLB7YJ4Ys19vArYX6GI1IhAZUueqJKQFqBS1/4nD2HCWxfU2/+CC8L1wPdyz+3aib9a98ejMGI8g/e0g6wLSkIjrEw7Q8Y3hGIpuTO7VsByJQWDes5o1TDXL5wk78Pyy0p/kkf7nFwTYKzQoLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Q0d8xHct; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d1a74a43bso427828b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723705825; x=1724310625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J08p29teShFomh8KvO2Ddu4MMDaSeQCVywSAkToMLKQ=;
        b=Q0d8xHctEB6TqR/kumIhzB32FPnELvdKJd1/6UhA2j51oN+4gdVxf0Vp6EChj3vALB
         JMgdR7kUxiOED+MIiWRGqU/LOtG9sm6D3V7TOd9cYdyOBiG3aE4g8YFDWNYhq+bUIpUa
         9MsG7z45weW1omActBTPEfF2EonvbZvcPos/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723705825; x=1724310625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J08p29teShFomh8KvO2Ddu4MMDaSeQCVywSAkToMLKQ=;
        b=BXJbQoLK/qF0chSKXPJXbdCVyFH0Igh99cfcwhHfweooQiQuqigYP0HpizjtF9qky9
         V6amovUPbcHMX9ts5rBi6BH4FBDqztNiyrrGLdwNT/rDoyZkAVcQNiIJSXGUdKOmPqau
         os/68zB1duIHxaDSA+QSmJ0gMMYteZgZLCYTAk/mFkA/iOunDcJIT8gflKnWmafMa3Tb
         4TbtYwhnEW0CL/zAFohlDE/VlSIfg7Fu0jPLrHWIZLv30AnAHgQjsO9xqVowpC127oCt
         l0jgON7LPdsH3yf2omSMUJXlKL0mGVEDjVJiAsVrkhA2hTDCvkQZsX2Yzcd7unV98DH6
         Z7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPY8qJEMwcc0kbWFA2VFo8caOXX5aUXXVw/tKgwDwgT6JjMKSuucge0EVJpZL56OOdxnopgqlVuI7KyMYOmvzr/bbXXuwUbR0Ea5i8IA==
X-Gm-Message-State: AOJu0Yzl3m7hVfmk90X7E6oTbWz67tfJ5dttlg9EpA9HphRSgCo9Zxsw
	qsxCJEFqP8eCaUue3DVN6wKcM9vG0goakBUpvKgR+Sv6hrV3zKiQLDhljl9Tug==
X-Google-Smtp-Source: AGHT+IHiXJsW+fRg102OhEnKAhvxwqG0Aaky2UVkllFzxbNrNdYCyuMBqkLJT5RdAPJhpDiPBU7AYw==
X-Received: by 2002:a05:6a00:4b49:b0:70e:8070:f9d0 with SMTP id d2e1a72fcca58-7126710d3a1mr6179895b3a.9.1723705824996;
        Thu, 15 Aug 2024 00:10:24 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:745d:58f7:b3cd:901f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af19683sm536163b3a.163.2024.08.15.00.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 00:10:24 -0700 (PDT)
Date: Thu, 15 Aug 2024 15:10:19 +0800
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
Subject: Re: [PATCH 1/7] thermal: of: Use scoped device node handling to
 simplify of_find_trip_id()
Message-ID: <20240815071019.GA350960@google.com>
References: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-thermal-v1-1-7a1381e1627e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-thermal-v1-1-7a1381e1627e@linaro.org>

On Wed, Aug 14, 2024 at 10:17:47PM +0200, Krzysztof Kozlowski wrote:
> Obtain the device node reference with scoped/cleanup.h and use scoped
> for_each_child_of_node_scoped() to reduce error handling in
> of_find_trip_id() and make the code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/thermal/thermal_of.c | 20 ++++++--------------
>  1 file changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index 1f252692815a..a2278d4ad886 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -8,6 +8,7 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <linux/cleanup.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
>  #include <linux/of.h>
> @@ -22,11 +23,9 @@
>  
>  static int of_find_trip_id(struct device_node *np, struct device_node *trip)
>  {
> -	struct device_node *trips;
> -	struct device_node *t;
>  	int i = 0;
>  
> -	trips = of_get_child_by_name(np, "trips");
> +	struct device_node *trips __free(device_node) = of_get_child_by_name(np, "trips");
>  	if (!trips) {
>  		pr_err("Failed to find 'trips' node\n");
>  		return -EINVAL;
> @@ -35,20 +34,13 @@ static int of_find_trip_id(struct device_node *np, struct device_node *trip)
>  	/*
>  	 * Find the trip id point associated with the cooling device map
>  	 */
> -	for_each_child_of_node(trips, t) {
> -
> -		if (t == trip) {
> -			of_node_put(t);
> -			goto out;
> -		}
> +	for_each_child_of_node_scoped(trips, t) {
> +		if (t == trip)
> +			return i;
>  		i++;
>  	}
>  
> -	i = -ENXIO;
> -out:
> -	of_node_put(trips);
> -
> -	return i;
> +	return -ENXIO;
>  }
>  
>  /*
> 
> -- 
> 2.43.0
> 

