Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168E7445F2B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 05:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231736AbhKEEfd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 00:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbhKEEfc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 00:35:32 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F096C061203
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Nov 2021 21:32:53 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id r10-20020a056830448a00b0055ac7767f5eso11409762otv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Nov 2021 21:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=e7wV/zXlbFEZLefjaI+cZ2mUrOMI6pJgxRuHVeGTiB0=;
        b=YnYsM26Rs+Xf8pXIQ5nENuN+3ANyFaM6dkQjCLCP7Ir99A28SjSRGrkLaVtovNqGAb
         kXGyJRInVW3Mtkd6uetRuQXo7TIlSwBojh1OY+AEL6vmyOrgBb9vuke1dNfO34Ogmk81
         0id+xA535P1bR386wD0sBznxFSt1DRTXkNXILdHMk4eFKQtLxNuXrYU/Gx5URa3N3ORj
         ZPKDNdxwYqziFSBrkQIT7z8pXgkYc8KVAb4I/kBduklg9VRYe9wud4sT0867QFkUpFp5
         bgwRsM43YiwqfVOtFG1TWyxjHCYEGMVXLruAZgdafFefPZFR7KlQLCYVgqJjIuVkvQ0C
         Oa+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=e7wV/zXlbFEZLefjaI+cZ2mUrOMI6pJgxRuHVeGTiB0=;
        b=UxA7Ib8W2HULmF3WWRpni7uGtJlX0MfQ/blBeRzTWxp/lhhpEPxuFciWws7ECTCO4L
         4VNW/7pIBp7j5ug6zqTbJV2dOObF3dya3NzhtNJVUyjXZdZkU4jragpbbFcOEXwW8ylo
         dnYjEL5VwshKEds2dQzPySFYfHlM0uNus8dCKrxYvRNTgARq7OdGPYLPsMPvwJ5k/WfW
         7mCeUO2TLBGcz8m+S2h/pYuHkFn0ETUfDOiwyaIBxKqdt6qKrubrjF5NbkgdvihXrQ/u
         ZiH8dJVRFfIQ0ABf76XPqYLQCVfVgnMjUv6cwMR4O7ftZnoRyTz1+GOPzQJ6K3NYtbfm
         DEkw==
X-Gm-Message-State: AOAM533z+ovnyiOyNb3ikQ3GEu4sp0ynHI0K9NAcMi8uUjXK/ZdXlN5T
        QafsuZMsPdYFYfoZ6DyryV20Rg==
X-Google-Smtp-Source: ABdhPJz149yEAnlzEutepXMNcT57vxTomZmWHg5AgNejKGnvWASOFZ022mCwDSj4uZFjon3aCelt8g==
X-Received: by 2002:a9d:7d8c:: with SMTP id j12mr34638887otn.373.1636086773005;
        Thu, 04 Nov 2021 21:32:53 -0700 (PDT)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id w10sm1506327otk.51.2021.11.04.21.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Nov 2021 21:32:52 -0700 (PDT)
Message-ID: <be2222e2-8fec-84f9-bbcf-bf639a1a63bd@kali.org>
Date:   Thu, 4 Nov 2021 23:32:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/msm/devfreq: Fix OPP refcnt leak
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20211104222840.781314-1-robdclark@gmail.com>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20211104222840.781314-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/4/21 5:28 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index d32b729b4616..9bf8600b6eea 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -20,8 +20,6 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>   	struct msm_gpu *gpu = dev_to_gpu(dev);
>   	struct dev_pm_opp *opp;
>   
> -	opp = devfreq_recommended_opp(dev, freq, flags);
> -
>   	/*
>   	 * If the GPU is idle, devfreq is not aware, so just ignore
>   	 * it's requests
> @@ -31,6 +29,8 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>   		return 0;
>   	}
>   
> +	opp = devfreq_recommended_opp(dev, freq, flags);
> +
>   	if (IS_ERR(opp))
>   		return PTR_ERR(opp);
>   

Testing this here on the Lenovo Yoga C630, and I'm starting to see in my 
dmesg output

[   36.337061] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[   36.388122] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[   36.810941] wcd934x-codec wcd934x-codec.3.auto: Port Closed RX port 
1, value 4
[   36.811914] wcd934x-codec wcd934x-codec.3.auto: Port Closed RX port 
2, value 4
[  198.794946] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  198.845698] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  502.285421] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  502.339427] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  503.361469] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  503.412757] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  503.871480] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  503.922712] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  503.974474] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  504.025501] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  505.923563] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  505.974513] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  510.313052] usb 3-1.3: USB disconnect, device number 4
[  519.677148] usb 3-1.3: new high-speed USB device number 5 using xhci-hcd
[  519.793394] usb 3-1.3: New USB device found, idVendor=5986, 
idProduct=2115, bcdDevice=54.20
[  519.793441] usb 3-1.3: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[  519.793472] usb 3-1.3: Product: Integrated Camera
[  519.793495] usb 3-1.3: Manufacturer: SunplusIT Inc
[  519.861020] usb 3-1.3: Found UVC 1.00 device Integrated Camera 
(5986:2115)
[  519.892879] input: Integrated Camera: Integrated C as 
/devices/platform/soc@0/a8f8800.usb/a800000.dwc3/xhci-hcd.1.auto/usb3/3-1/3-1.3/3-1.3:1.0/input/input27
[  520.283839] devfreq 5000000.gpu: Couldn't update frequency transition 
information.
[  520.335854] devfreq 5000000.gpu: Couldn't update frequency transition 
information.


Is this intended?

