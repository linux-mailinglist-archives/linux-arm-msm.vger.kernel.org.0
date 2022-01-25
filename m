Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 603EA49A840
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jan 2022 05:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S3416189AbiAYDBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jan 2022 22:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3422146AbiAYCaV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jan 2022 21:30:21 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7F3C06809F
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 18:07:01 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id e9so2376490ljq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jan 2022 18:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=03gjQlgR5Dxhb9WkNowyotEgdW202c8d1VlLtX85qok=;
        b=Du4AGA7nF/W00f2LVQw8lhgAnoO0ZwqlUuMelw6cNUYR5/Ma2Fv7dOVrFjkwmLv6Qm
         tmohqjX9pW0GxAkpVFO2yqIFbr7Nn51fCIXPrGKKKwnKLMIjo9hcUhIyqcbEodsHKY1p
         G7o2jGSo/tgkX3bveHJcQeRdM56Va17Jrnhpm+Io2lffnZBEezWiiA4ijZvN04Buv5PT
         3iTCUueNEw6iiJTuwv394C7St1sNAYYPasKNopsuMIqG5BoKjgx97YiOcl5IvhSYtLL3
         7vEIy5hPLu9VYpqIsIawF/tuXJW8MoS4YH3DhddGH3aPL/QEatiy8exUSejEhJmFEbQh
         x0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=03gjQlgR5Dxhb9WkNowyotEgdW202c8d1VlLtX85qok=;
        b=2jJ3olVH1ds/HpvCcCopbYL1Q0PcvIhyV7ApYUcoyIjVuWvlifro+hPjqvY1OElFLt
         RW35n0f0XsYP2u33mbWGqVR78upY1wg8VZNdDbG1eWDduUtr1A/joZmQoYmBFe1S6/hJ
         RE57CKIOUlvUe8oRbuiI9h0Re28BhrsawuoEMUJl1RHzly4F03Bqbe2Fv1phRaJwJV3O
         a6KtTchazeQ5+N7bFCUMv9a/xQJWtZSUzI9dvNvwGVbA6KsGrJhUHZ+s8YIYybrzuXdE
         Xzptn03GZJgtchZ9jkjrhEx+6cF+AOWrtoX6GWZ78ztb+m6xqBkMLijzdASmlL90Z6lk
         otJg==
X-Gm-Message-State: AOAM532+9RbqeAAVjCWyKkEq0sLI9CuVXelcx4lYPbAsiegwhG30dHXi
        omr82TOge8vjoTqWAk10gGBkwg==
X-Google-Smtp-Source: ABdhPJwpuM9KRu0Rv7HDlKS2t+F8icSc/PHdc4SswuzcxRomivyaxQfI2OVr7fcX9oboDIopEgrk0g==
X-Received: by 2002:a2e:9148:: with SMTP id q8mr7558833ljg.258.1643076419522;
        Mon, 24 Jan 2022 18:06:59 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i18sm1339400lfv.257.2022.01.24.18.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jan 2022 18:06:58 -0800 (PST)
Message-ID: <c4c56b0f-84ca-0a56-6618-73e24f4bfd46@linaro.org>
Date:   Tue, 25 Jan 2022 05:06:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/msm: Fix wrong size calculation
Content-Language: en-GB
To:     Xianting Tian <xianting.tian@linux.alibaba.com>,
        robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, sumit.semwal@linaro.org, christian.koenig@amd.com
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20220112123334.749776-1-xianting.tian@linux.alibaba.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220112123334.749776-1-xianting.tian@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/01/2022 15:33, Xianting Tian wrote:
> For example, memory-region in .dts as below,
> 	reg = <0x0 0x50000000 0x0 0x20000000>
> 
> We can get below values,
> struct resource r;
> r.start = 0x50000000;
> r.end	= 0x6fffffff;
> 
> So the size should be:
> size = r.end - r.start + 1 = 0x20000000
> 
> Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>

Fixes: 072f1f9168ed ("drm/msm: add support for "stolen" mem")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 892c04365..f04a2337d 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -466,7 +466,7 @@ static int msm_init_vram(struct drm_device *dev)
>   		of_node_put(node);
>   		if (ret)
>   			return ret;
> -		size = r.end - r.start;
> +		size = r.end - r.start + 1;
>   		DRM_INFO("using VRAM carveout: %lx@%pa\n", size, &r.start);
>   
>   		/* if we have no IOMMU, then we need to use carveout allocator.


-- 
With best wishes
Dmitry
