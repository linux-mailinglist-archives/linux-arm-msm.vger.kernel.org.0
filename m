Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC6F29E08D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 02:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729918AbgJ2BWu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 21:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729922AbgJ1WEX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 18:04:23 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693B1C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 15:04:23 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id x1so1133468oic.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2020 15:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UGEvSBlqCbH7r/XeVff2EFEE3W3a/89hWK9X3Eu9+ZI=;
        b=tDhfRl8lL7XqVAS0dE9ih0wEOsD381IONb26mPbYM6z+rGn3WyK0u5UobSFx7JnaJT
         XBxkLh/aTXCuPOrd7R97cbmTf3tBsvopShAd2rhYZVXnChpr0BI5840zNyBN3+RksuCv
         pDU4pHD57XdjIyBKgMPioHw8IHfFmPeggSBXDtwvCpUknpq2/vgQMKI9wFUuDJXxiV22
         GFf3nPBaqPXtmOFOjvQwcAHA9seK3iyBvXpDe0eYwVTe3j9aHrT2Rc4iPo5dj5bgSRGH
         y45as3KX9exbNHVC+AAWPGZ2Wl+1ns0HTwvas/0qQwB9Yn2ub3tqD0bDWEaOD9Ozj6z1
         zXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UGEvSBlqCbH7r/XeVff2EFEE3W3a/89hWK9X3Eu9+ZI=;
        b=ulQYMy7yGtZiDY7VK1NCCOPAPkaNyR4AYhQ0x8LJI6X4urWDLDv3jFU7x3tpWtGETs
         2oQ5GFUTfqErDjkqltiEEdIYWYW7QDEERT0fvg3b6xyRxpGEI7cF7Pfwvj1+zs5wDGdW
         djWYgifigta8vVABPbE2nxSrw4ZPiqh/fUmgJhU8JAR0q1UrDwo1mSCV9wsNFdGfYx2l
         0hqATpeT0mE3zMwvsrTHfuB5IgXgN/H5UKj/+g1THeGuB5VfLslfWS4sivbRGwpnYlos
         wNx8862SgnySNkMJUWp6BymU2Jc4vtpo1jUyn8UjAM/WFkOaq18adERjgSPdeGeuFqWW
         pTww==
X-Gm-Message-State: AOAM531b1obl417Ws169dOdC9Q26DJuNKEDNOFs4VYzQDbHFf5qMUG+u
        KQzrdabWAR+W+yKzJloVbsavuok+1GgDDQ==
X-Google-Smtp-Source: ABdhPJwr2K1NnepE5uXMHDTSc5jfBqdvp6zG1zCPfe5GimQyYat9Pv1/3IU0ouG58kOUTa/MpOy4Gw==
X-Received: by 2002:a17:90a:ab8b:: with SMTP id n11mr5453925pjq.162.1603864873109;
        Tue, 27 Oct 2020 23:01:13 -0700 (PDT)
Received: from localhost ([122.181.54.133])
        by smtp.gmail.com with ESMTPSA id ei4sm3821960pjb.4.2020.10.27.23.01.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2020 23:01:12 -0700 (PDT)
Date:   Wed, 28 Oct 2020 11:31:09 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Lee <frank@allwinnertech.com>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, vireshk@kernel.org, nm@ti.com, sboyd@kernel.org,
        rjw@rjwysocki.net, jcrouse@codeaurora.org, eric@anholt.net,
        tiny.windzz@gmail.com, kholk11@gmail.com,
        emil.velikov@collabora.com, gustavoars@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/msm: Convert to devm_pm_opp_set_supported_hw
Message-ID: <20201028060109.qlggrsza5jjfno4y@vireshk-i7>
References: <20201012135517.19468-1-frank@allwinnertech.com>
 <20201012135517.19468-4-frank@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201012135517.19468-4-frank@allwinnertech.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-10-20, 21:55, Frank Lee wrote:
> From: Yangtao Li <tiny.windzz@gmail.com>
> 
> Use the devm_pm_opp_set_supported_hw() to avoid memory leaks in some cases.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 91726da82ed6..8d88f119a59f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1487,7 +1487,7 @@ static void check_speed_bin(struct device *dev)
>  		nvmem_cell_put(cell);
>  	}
>  
> -	dev_pm_opp_set_supported_hw(dev, &val, 1);
> +	devm_pm_opp_set_supported_hw(dev, &val, 1);
>  }
>  
>  struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)

Rob: Can I have your Ack to pick this patch up please ?

-- 
viresh
