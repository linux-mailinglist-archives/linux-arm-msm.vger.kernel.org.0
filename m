Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8550325E2B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 22:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbgIDU0s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 16:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727951AbgIDU0r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 16:26:47 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7914AC061245
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 13:26:47 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id i26so10179828ejb.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 13:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=71QF8U6Pk/SiD85qlDqgpqkUOmuelTg8cgLRGmKd4dg=;
        b=dWScMilwgzS+jeGX34RxcHODSmT017udhLnTrcdCacIY5qKlib/Ga1PVvLXMJBSV+x
         h5h9I8waE88HTpZuR8PqVIdBzBgwbh6YS0rrdycZMe3cOD5Y0K9oCXwunA66el91/5Mb
         Q9/iYkvEhMeTGtBF8BSMOtRbKHD4Pl8roa1XvmslHehpbFctdKTIYqPqugoSDn/ufxP8
         IhwSeo45OrFgDsZGP7jHhz42AICfLI7mj3mwIdyD3G61H3MaLV/4W0dbnZJiCAacqk2D
         IEkIJ0W0VmXpwYzgbA4VoVBf74j4xGZqnTA7XWHqLbCfpWPxfCq3kit7o7RZgzLGwO/r
         8IvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=71QF8U6Pk/SiD85qlDqgpqkUOmuelTg8cgLRGmKd4dg=;
        b=RHmbJsW72jWFkyet7JgEdP7NmrNCJY9sBnEWvs/5vZRVQtJFI3NT8r5eC1YtRZD9VG
         LbuPZgX5l3SxmyBqicTEg88p9y7I754yBzDgHfZQ6A/Yi5Z3UxBFjXRhPlgsQqxwoGXs
         b+4oQRLTKLOqtMDxhNCZCoEgClgoTur4WpxUEdx8ISD68nWfar1yKexwivu4/hLZiovj
         ToQqz/8qbA2LsTdVj8nFeY4dsFw5wbz6PvIigx6oQkPFj3P6NDbJKuhT0jcx3x8irEQa
         /c4UbkhK631nmI3kXz0JMxFf1qFsVS9jd9qvSZZj9c6YZJL+42PC2Zv8x7aNWfPu5j77
         zKzg==
X-Gm-Message-State: AOAM532vohWmJgRNjpbcV1i4398qx5Y2IncNpn10wcFapK+wm9vmz6Xx
        sdNV1yxOXVSmMp1fOTDSPjGAiwmcBJi5J7zT
X-Google-Smtp-Source: ABdhPJx30bReT6CTdB48NgVjNdPtv2dzDs6J0R/E4WIddm4nOy7VcNTajmbkx8JjJoGBxw+SAEnSog==
X-Received: by 2002:a17:906:3755:: with SMTP id e21mr9269680ejc.39.1599251205777;
        Fri, 04 Sep 2020 13:26:45 -0700 (PDT)
Received: from [192.168.1.6] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id dm22sm7068399edb.49.2020.09.04.13.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2020 13:26:44 -0700 (PDT)
Subject: Re: [PATCH] media: venus: core: Drop local dma_parms
To:     Robin Murphy <robin.murphy@arm.com>, stanimir.varbanov@linaro.org,
        mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <e5384b296a0af099dc502572752df149127b7947.1599167568.git.robin.murphy@arm.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <c474d49b-7800-28c6-d73b-20a6d2258e9e@linaro.org>
Date:   Fri, 4 Sep 2020 23:26:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e5384b296a0af099dc502572752df149127b7947.1599167568.git.robin.murphy@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

Thanks for the patch!

On 9/4/20 12:14 AM, Robin Murphy wrote:
> Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
> for platform devices"), struct platform_device already provides a
> dma_parms structure, so we can save allocating another one.
> 
> Also the DMA segment size is simply a size, not a bitmask.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/media/platform/qcom/venus/core.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index 203c6538044f..2fa9275d75ff 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -226,13 +226,7 @@ static int venus_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	if (!dev->dma_parms) {
> -		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
> -					      GFP_KERNEL);
> -		if (!dev->dma_parms)
> -			return -ENOMEM;
> -	}
> -	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
> +	dma_set_max_seg_size(dev, UINT_MAX);

To be correct we should check for EIO error?

>  
>  	INIT_LIST_HEAD(&core->instances);
>  	mutex_init(&core->lock);
> 

-- 
regards,
Stan
