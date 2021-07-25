Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 756753D4B63
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jul 2021 06:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhGYD2j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 23:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhGYD2i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 23:28:38 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8F9C061757
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:09:08 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 68-20020a9d0f4a0000b02904b1f1d7c5f4so5435300ott.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XsOomHsagha9Fe+7yEyhkFKXqWi8OGM/BC3XLcUzh3c=;
        b=WJHqntMpjQoASjgw3nvDB6VDxvWIEQ+kqoS2e+dZ3gx0+Low/cqHPeWuVtpaqDDGBi
         W/e3/8HZGtnjmb4zlfiYwtGFgGPlCxhEvmZbTd9aTdM/wQvBCzESdm247syHxxZXgoRm
         CrCTo87S13rnCMGUOOGJr68DxsPa+oKBwnzqizpZNLoyYv1+VZXg0uz+KHFxrKqDXXol
         lK5w+e/AVbiYLFoti93PcVUvwelqXfCu/ms/d4uMElQ9fa+wMWu58tGVwdw5DQfPiGh0
         Rm51zWy6KSMR14E0v//Vtwe/sNZ50cUgfHV46qOm4krBFdPqZPnq0Ls5sS9UYpRUps+s
         5+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XsOomHsagha9Fe+7yEyhkFKXqWi8OGM/BC3XLcUzh3c=;
        b=PKd4u8yRgvIGjIZHtL71w1YOrZ8mZKPK/FWte0ruZpl1jcP0IdpPBdwhS8qfZ6HqIk
         aDx/BsMebyz35JYaS0FRd6Nvwyrb7nP+FIZnpJc32Gi6rrmYAfqtrpzCi8RLSHcRklk+
         Fhme1wjX0ciTIp7aXDQF516LpPM4FdR7dYWwMkNXhXY09+zyYlKYkfIfOH8slR/uzRDT
         qzuTiPfr4XNtgG8Fgg8HSqt8j+DkcNwbCRYmw/3FYPPLq4H0KeODdmmOjoe8VgD+RB/X
         AT2MMneoWOHD86vZdLTBNeXgOloOAS4dLdYCCjoUaTLAiqXioNAsmurOIqVw3pn2cKYc
         raSA==
X-Gm-Message-State: AOAM531HTpm+lOOrsb5/vSjmuYn/0gczPup073EvFUUQEuVy+i+QV/Pf
        oPoSWdpMFR5FpK8i3uW6+vS8+w==
X-Google-Smtp-Source: ABdhPJw89eAvGX619ev78112N8AQSStiF+TDCXhViFNPfC2fU8J2UZXoQmkMrtRDPokBOIL5ab7Qbw==
X-Received: by 2002:a9d:6059:: with SMTP id v25mr7766284otj.204.1627186148383;
        Sat, 24 Jul 2021 21:09:08 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r6sm1134577otv.0.2021.07.24.21.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:09:08 -0700 (PDT)
Date:   Sat, 24 Jul 2021 23:09:05 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 7/7] drm/msm/kms: drop set_encoder_mode callback
Message-ID: <YPzj4QExgE/nCaJQ@yoga>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
 <20210717124016.316020-8-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210717124016.316020-8-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 17 Jul 07:40 CDT 2021, Dmitry Baryshkov wrote:

> set_encoder_mode callback is completely unused now. Drop it from
> msm_kms_func().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/msm_kms.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 086a2d59b8c8..9484e8b62630 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -117,9 +117,6 @@ struct msm_kms_funcs {
>  			struct drm_encoder *encoder,
>  			struct drm_encoder *slave_encoder,
>  			bool is_cmd_mode);
> -	void (*set_encoder_mode)(struct msm_kms *kms,
> -				 struct drm_encoder *encoder,
> -				 bool cmd_mode);
>  	/* cleanup: */
>  	void (*destroy)(struct msm_kms *kms);
>  
> -- 
> 2.30.2
> 
