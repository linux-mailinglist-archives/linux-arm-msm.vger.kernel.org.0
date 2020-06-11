Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 949721F6A27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 16:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgFKOh4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 10:37:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728104AbgFKOh4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 10:37:56 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A13C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 07:37:55 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id y11so7193566ljm.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W8JuzWgGQJqJMJ7NStV0+vrbD8KPYxNrC1ErgrGwRP8=;
        b=LP7lYKyBcJ0c/zsKM7VsENoVZuu4RxJoAHYyk5amgZL8KHIqFHSHcYDWO4bwokeqDm
         1yoxQG/GNOsK1bnJCWXa0n4OEOPy9qpPpou5AB7dkzaT5c8Gd+f/bBbHD+ol5B0+hSdQ
         MWRarKhSKjVRSBCKJZrJyi5P/51je+mbvTysRKXD1qx5mtDbzovfC5ZgW1oxUJCAHwY2
         G0aWXUvZdMH9olr6zHtvBFoUvqsE+G65j+lgCRT+JKC1r0bSCoawClyD+XLmOydn/aZD
         0IduyObRb+ErjnUjGesbWMuux2FXMcbNWrsA0/qsyRtr7v67lhWpDwFSZ1NzWbPVfBf+
         mGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W8JuzWgGQJqJMJ7NStV0+vrbD8KPYxNrC1ErgrGwRP8=;
        b=Qs288cyKaoXGBqvmX95XmYS1cech59kePfhXJ9E0u4marUsEFKJm6/hUYx6F/PC3bb
         C2BDHYKFRxhTKE/OieiwfIA59i7LuBJr2+xksfIBy7ziaBZjZDknTEnyyRIFQzw/73p6
         90MnxxqynY2HP8cFai9i4feWUpKnQ2Fd02l/lv1q2nGxL7kDwI+yr1ZoVIyRuyMdhcfS
         uVU8rrBib/ETVQ6gnWKaC9wzshy1tDePhGFnvDSC5RR3zos6O1CIeykTQ/355zrwBQaT
         VQP6FaUYy2HF3RZkm6oTmGAqzZcQ7oiMbEwlREMpDiog9BDk6NBBUWitGdm2xKIesB+x
         zIow==
X-Gm-Message-State: AOAM531DMtcBLMBvHaR7Fzftl0E/65aU7IUhdO2uMFEl7tbnAfP8j+P5
        GrUxv+sbddjKQPZnuDqd0Y8h4Q==
X-Google-Smtp-Source: ABdhPJwbWAFtv28FnS27QIotAn5zL/uv6fdd2W4GB2WhoiUk/5Sup8589qE/tLC4x6jv6a1uVVLiLw==
X-Received: by 2002:a2e:8e82:: with SMTP id z2mr4314872ljk.71.1591886274014;
        Thu, 11 Jun 2020 07:37:54 -0700 (PDT)
Received: from [10.0.0.100] ([94.25.228.141])
        by smtp.gmail.com with ESMTPSA id o4sm844112lfb.75.2020.06.11.07.37.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2020 07:37:53 -0700 (PDT)
Subject: Re: [PATCH 7/8] drm/msm/dpu: add SM8150 to hw catalog
To:     Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shubhashree Dhar <dhar@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200526032235.21930-1-jonathan@marek.ca>
 <20200526032235.21930-8-jonathan@marek.ca>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ce713ed0-5f11-e92f-0ef4-c87690b67090@linaro.org>
Date:   Thu, 11 Jun 2020 17:37:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200526032235.21930-8-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/05/2020 06:22, Jonathan Marek wrote:
> This brings up basic video mode functionality for SM8150 DPU. Command mode
> and dual mixer/intf configurations are not working, future patches will
> address this. Scaler functionality and multiple planes is also untested.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 147 ++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
>   2 files changed, 149 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 1e64fa08c219..f99622870676 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -90,6 +90,23 @@ static const struct dpu_caps sc7180_dpu_caps = {
>   	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>   };
>   
> +static const struct dpu_caps sm8150_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 0xb,
> +	.max_linewidth = 4096,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED3,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2_5,

It seems you missed sending a patch adding support for 
DPU_SSPP_SMART_DMA_V2_5. Could you please point to it?


-- 
With best wishes
Dmitry
