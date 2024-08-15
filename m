Return-Path: <linux-arm-msm+bounces-28595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF809529FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 09:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E929DB22EEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 07:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B2515E5D4;
	Thu, 15 Aug 2024 07:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H3Ygra5j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9601176FB4
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 07:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723707201; cv=none; b=lBcVLPPQ4y4Bcq/UW8t7Jf2WglXJhJOsiabWTuE/IbODOKHBxfzv8aeaYgrveuB1nUK+zq0yOf3v9OBDtLP2yyGrtwFcB4FzzEdmQI6p676Vd/fc0qvJVHYZnu4QfNdgJRwqbOfwvN2TR6j4Ec09pm98oMYsXdX4bQRntEYL0ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723707201; c=relaxed/simple;
	bh=LCZqNlothIJ7iUi0FaViXUQV8VMf+8pHOfULUFoQPlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRMy8p32ICpaqaacj2vLSw3UjPa45ZjD0Ee7j48mqhg7CGjDOOLpqf9xr9ec51vVJuxRBpG0RFn5Rom+tpxxcm8iCHI8Jbuq3lM843jEw7zHOg1UqAVdjLkeEgU6w0mlOo1ZxqaYQvs6kA44PtLOPg8u24jk0NlLDDw+2Iv1FmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=H3Ygra5j; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-712603f7ba5so497729b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 00:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723707199; x=1724311999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mSVgOh4W3trTwpBrRTkuN1lvc7J54SJDhoOOLbBw+iU=;
        b=H3Ygra5j6izjFuKBbcoHy/HiVK8e12hsJniFGdD3G3ndnf8qF5w5XCQErswkq0woi0
         Waj2qJpPLUP8s/gX/YOCaSA9PGFH/46AQsmhUYEzFFl13H+tXjpVYp/RIso9Cj6c/QZB
         smfKh6oOd36hGUc+fPq3A3cFlM0qfU7vgpeaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723707199; x=1724311999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSVgOh4W3trTwpBrRTkuN1lvc7J54SJDhoOOLbBw+iU=;
        b=Xcx0e//rsbct2Mb8/TAhMZEd2yY8K5fi+VzsCErnJb6A0NMbtXKuT4/UvDSTlPUngn
         4weRaKv61o6Co1wQV09UF+ZQJCEl5bqJw28woM/WwSrBf2PypURYFmFd8R8Urzki7j1R
         ufATpwGER9WXPosv0lg9hqOjJ9qxUzCfbeF5aks8wrNIiOHQpqY1VnOeeeBsEPweA6Qr
         ZJl/Bj+qR37MjmsoLJ0gZsbtrkGIJhzBljiw6nJQTR+NED3Fr+OZvwe7V097z4KLQXCz
         PuQXbJYsPc4ExmfGCK+NGlcVZAAA6t00ZoKkYPbfGT2j05OlBbsB6yAlxfLT6ox71FDx
         vRhw==
X-Forwarded-Encrypted: i=1; AJvYcCX27Dd00IhDSBB/xCc1m5bteFZszlSqYadUs5ajAmoQDpMVD0nKtrBWnu8atLZU0xEJbb9ft3Wuv6HnbCvYZpC3ebuKTsnt7SMYNRbWVg==
X-Gm-Message-State: AOJu0Yy2/T03zc0D8nC7dCo43ekFyLvj1HZitnYCiRDHBKlJAAuRYnG7
	Mf7oRUjCJ3ZV2qpaqorQhVV9mA+wTTPfIpIosRntg9HT5EH5a01tsk60gGjUNQ==
X-Google-Smtp-Source: AGHT+IE+v6e+Df7tQx88UbXmfy+wlQroZUtqBIcjWsCC3V2G6r5uCEDNzWqCeTXlE1H5mKvT4LnM9w==
X-Received: by 2002:a05:6a00:1394:b0:705:a13b:e740 with SMTP id d2e1a72fcca58-712673abaf0mr5999238b3a.19.1723707199046;
        Thu, 15 Aug 2024 00:33:19 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:745d:58f7:b3cd:901f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127aef544csm563951b3a.121.2024.08.15.00.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 00:33:18 -0700 (PDT)
Date: Thu, 15 Aug 2024 15:33:14 +0800
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
Subject: Re: [PATCH 7/7] thermal: sun8i: Use scoped device node handling to
 simplify error paths
Message-ID: <20240815073314.GG350960@google.com>
References: <20240814-b4-cleanup-h-of-node-put-thermal-v1-0-7a1381e1627e@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-thermal-v1-7-7a1381e1627e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-thermal-v1-7-7a1381e1627e@linaro.org>

On Wed, Aug 14, 2024 at 10:17:53PM +0200, Krzysztof Kozlowski wrote:
> Obtain the device node reference with scoped/cleanup.h to reduce error
> handling and make the code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/thermal/sun8i_thermal.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
> index 3203d8bd13a8..22674790629a 100644
> --- a/drivers/thermal/sun8i_thermal.c
> +++ b/drivers/thermal/sun8i_thermal.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <linux/bitmap.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/device.h>
>  #include <linux/interrupt.h>
> @@ -348,19 +349,18 @@ static void sun8i_ths_reset_control_assert(void *data)
>  
>  static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node)
>  {
> -	struct device_node *sram_node;
>  	struct platform_device *sram_pdev;
>  	struct regmap *regmap = NULL;
>  
> -	sram_node = of_parse_phandle(node, "allwinner,sram", 0);
> +	struct device_node *sram_node __free(device_node) =
> +		of_parse_phandle(node, "allwinner,sram", 0);
>  	if (!sram_node)
>  		return ERR_PTR(-ENODEV);
>  
>  	sram_pdev = of_find_device_by_node(sram_node);
>  	if (!sram_pdev) {
>  		/* platform device might not be probed yet */
> -		regmap = ERR_PTR(-EPROBE_DEFER);
> -		goto out_put_node;
> +		return ERR_PTR(-EPROBE_DEFER);
>  	}
>  
>  	/* If no regmap is found then the other device driver is at fault */
> @@ -369,8 +369,7 @@ static struct regmap *sun8i_ths_get_sram_regmap(struct device_node *node)
>  		regmap = ERR_PTR(-EINVAL);
>  
>  	platform_device_put(sram_pdev);
> -out_put_node:
> -	of_node_put(sram_node);
> +
>  	return regmap;
>  }
>  
> 
> -- 
> 2.43.0
> 

