Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A128942DA81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 15:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhJNNff (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 09:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhJNNff (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 09:35:35 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECA1C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 06:33:30 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j21so27432813lfe.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 06:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DX670cS5phCvDQLx3T743whZZwRjd/in8iOIX3rB6XQ=;
        b=Z3DEwQvmJ1TfKoJ2dBFXH1mqVWhkZmcioOroxnN/POQZMZ1jel2+i+jnHUsieV1XBi
         Ud6AHfJARWt7HOOIZNC2w8anCflMmLjbZNcMFzBYqNRZyVY6DDy+MWyXCvBYh/JOedbC
         ZF+jynw26e9JFpuOcCFWgzC14ntG+7mtxwvBzAfOqBV5euyIUw43Vhr9ZrzSDEYVFQNG
         0NuEIRRs/rxbCrplu44/WUoMDnw8XdU/Ak7X0PATcLSP3GcHP7nmiUr9dWUTL+HwRaBL
         mNp96K8Dgw0SL0gHRYNwW5YjkUwJD6VDkYNGHnywFdZYq3r4/zy6hmKNYT3l6ydyx1Yj
         qUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DX670cS5phCvDQLx3T743whZZwRjd/in8iOIX3rB6XQ=;
        b=pQlgGfCrxWvNlUfh6uRm/NCGLPJeaNKB/f8wfs3/ljx10b2XsAnkSZZKA/PaL6sVRY
         qf9HRdfDmmV9ogLCStuFpa4JC4NFE/vxkUNeH/Gp+8hdwz/ML5cz7TaBrWPNLCdLwYSs
         KDBReK/Uf7k0BatVG/a3QnDx+5upw+RVuK7ThJ6n56YFYjfUwEvYLXTHhCugBmnicmIe
         GOBhl/P+dOs9lZjg3wS6iSO7J4huzntHXCo/3xd26xnu8R/ScHyFZVKCLfGAUtQN+GV/
         ztDczT0JVSLOyBYB2za49aAqK0DbO5QCdvuhRqMXbMFQwL+5jAlmPzbHiHPHFXMt2p1q
         EBAA==
X-Gm-Message-State: AOAM532LZjRBmfmhg+98Co9rNSkuHmO1vgnh/NQ+V9KE1BncDMM6R8x5
        EDKIcVITcq6oW+GovSo+Bibf9g==
X-Google-Smtp-Source: ABdhPJzpDVfwZXhJGDANIIHEgLk2g2w/JDjdDth7w2YvSqUG3bjNmmV/IhBY/bheKThItFWTOUxeNg==
X-Received: by 2002:a19:7616:: with SMTP id c22mr5030684lff.450.1634218407507;
        Thu, 14 Oct 2021 06:33:27 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t20sm265427ljc.40.2021.10.14.06.33.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 06:33:27 -0700 (PDT)
Subject: Re: [PATCH v2 05/11] drm/msm/disp/dpu1: Add DSC for SDM845 to
 hw_catalog
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-6-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <fca3eadc-91db-c5fc-110f-423efc1638ce@linaro.org>
Date:   Thu, 14 Oct 2021 16:33:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211007070900.456044-6-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/10/2021 10:08, Vinod Koul wrote:
> This adds SDM845 DSC blocks into hw_catalog
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> Changes since
> v1:
>   - Remove DSC_SDM845_MASK and use 0 as feature mask
> 
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b131fd376192..6423a2fe6698 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -821,6 +821,24 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
>   	PP_BLK("pingpong_2", PINGPONG_2, 0x6b000, 0, sc7280_pp_sblk, -1, -1),
>   	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
>   };
> +
> +/*************************************************************
> + * DSC sub blocks config
> + *************************************************************/
> +#define DSC_BLK(_name, _id, _base) \
> +	{\
> +	.name = _name, .id = _id, \
> +	.base = _base, .len = 0x140, \
> +	.features = 0, \
> +	}
> +
> +static struct dpu_dsc_cfg sdm845_dsc[] = {
> +	DSC_BLK("dsc_0", DSC_0, 0x80000),
> +	DSC_BLK("dsc_1", DSC_1, 0x80400),
> +	DSC_BLK("dsc_2", DSC_2, 0x80800),
> +	DSC_BLK("dsc_3", DSC_3, 0x80c00),
> +};
> +
>   /*************************************************************
>    * INTF sub blocks config
>    *************************************************************/
> @@ -1130,6 +1148,8 @@ static void sdm845_cfg_init(struct dpu_mdss_cfg *dpu_cfg)
>   		.mixer = sdm845_lm,
>   		.pingpong_count = ARRAY_SIZE(sdm845_pp),
>   		.pingpong = sdm845_pp,
> +		.dsc_count = ARRAY_SIZE(sdm845_dsc),
> +		.dsc = sdm845_dsc,
>   		.intf_count = ARRAY_SIZE(sdm845_intf),
>   		.intf = sdm845_intf,
>   		.vbif_count = ARRAY_SIZE(sdm845_vbif),
> 


-- 
With best wishes
Dmitry
