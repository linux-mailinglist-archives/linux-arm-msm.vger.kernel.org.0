Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8303C42E541
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 02:26:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234600AbhJOA2J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 20:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234592AbhJOA2J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 20:28:09 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A51CC061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 17:26:03 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x27so33895798lfa.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Oct 2021 17:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gAakFVCdlu4BwUnr1HsiBStLYgFMjKgM2HCJV6khvVI=;
        b=KqrFJqTAAd10gLKTVHbzWujEhl0n1HYn0E+xVy66B9zm1FNUxx8QtX5yZVfLeeODxs
         TYuPsYapJNCClxzEXoVd2HvUwe/BQa07J/w+ePK17SSbJQXNzoX4Zri8wYr9KTf82caF
         iH7sJpZRdliFvfgO2ualjYGlVrWZTKdGa09dTq3gOozlXNwDalk6SknK8K0j0TE78GRD
         hoFF/VtosBG2t8NSZhhlDJ12ZDgS2Rmh2cb00OIpkxvm7hXT3y9qfQUhiIcdrj0W8K2X
         F9oFDrm2aJQBk3gTmmc5a3T7XgWTZYV4zw14o4TXGuBhh3oGIPpOAvTOlyjwaB8dhoje
         6QhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gAakFVCdlu4BwUnr1HsiBStLYgFMjKgM2HCJV6khvVI=;
        b=EgevPavP0W8oVLV610Xud7tuJhXEspAzqtzxGikMr8nmseyTrH/VNUKlLTpaAGf/mD
         v2qMDrXDLOB4a+HYCrVwgvwd9Z0vPixLf9Ec8wLisibceF2xxnjW7JB6gL2oeSoUFxek
         qW/ikou3aOVBa1vX0KGpRirZdURLmcYGU8Wkz396ctC3jfulTYz1q97hBKHk007yzx3H
         mdDtLdafT3op1XXFLI9pinXmOk8ULU5oXYkUXIsESx4HLcEA5gnkSavSrwpyqs5xy4v9
         PsjcQDrRYE/VjvzsHYNiTc3uXwsKfqBk2saE0mWvEXmEg4I0FXcJxZxkpYFO+pnhagGN
         7p6A==
X-Gm-Message-State: AOAM531cdhhTeBteyUcuSYYCjUIZyVt7kjlhG71oevlrR0Ai8ddo3ufl
        d9bAcHKRF0uXJR3RwZSh/+U8tA==
X-Google-Smtp-Source: ABdhPJw9BcxSBn4If2tX2xf6UOr7GhCJzVW2y/ue10VwQ8YI92czy1tR/ihi61fsOSqbJQZNBCi/ng==
X-Received: by 2002:ac2:4ecd:: with SMTP id p13mr7883899lfr.237.1634257561771;
        Thu, 14 Oct 2021 17:26:01 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e12sm396760ljp.30.2021.10.14.17.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 17:26:01 -0700 (PDT)
Subject: Re: [PATCH] drm: msm: fix building without CONFIG_COMMON_CLK
To:     Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Alex Elder <elder@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rajeev Nandan <rajeevny@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211013144308.2248978-1-arnd@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <e88d5a3f-2c46-f891-c505-87e20bf714e9@linaro.org>
Date:   Fri, 15 Oct 2021 03:26:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211013144308.2248978-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/10/2021 17:42, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_COMMON_CLOCK is disabled, the 8996 specific
> phy code is left out, which results in a link failure:
> 
> ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3f0): undefined reference to `msm_hdmi_phy_8996_cfg'
> 
> This was only exposed after it became possible to build
> test the driver without the clock interfaces.
> 
> Make COMMON_CLK a hard dependency for compile testing,
> and simplify it a little based on that.
> 
> Fixes: b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This drops dependency on CONFIG_OF. While ARM64 selects OF, pure ARM 
does not.

With that fixed:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/Kconfig  | 2 +-
>   drivers/gpu/drm/msm/Makefile | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index f5107b6ded7b..cb204912e0f4 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -4,8 +4,8 @@ config DRM_MSM
>   	tristate "MSM DRM"
>   	depends on DRM
>   	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
> +	depends on COMMON_CLK
>   	depends on IOMMU_SUPPORT
> -	depends on (OF && COMMON_CLK) || COMPILE_TEST
>   	depends on QCOM_OCMEM || QCOM_OCMEM=n
>   	depends on QCOM_LLCC || QCOM_LLCC=n
>   	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 904535eda0c4..bbee22b54b0c 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -23,8 +23,10 @@ msm-y := \
>   	hdmi/hdmi_i2c.o \
>   	hdmi/hdmi_phy.o \
>   	hdmi/hdmi_phy_8960.o \
> +	hdmi/hdmi_phy_8996.o \
>   	hdmi/hdmi_phy_8x60.o \
>   	hdmi/hdmi_phy_8x74.o \
> +	hdmi/hdmi_pll_8960.o \
>   	edp/edp.o \
>   	edp/edp_aux.o \
>   	edp/edp_bridge.o \
> @@ -37,6 +39,7 @@ msm-y := \
>   	disp/mdp4/mdp4_dtv_encoder.o \
>   	disp/mdp4/mdp4_lcdc_encoder.o \
>   	disp/mdp4/mdp4_lvds_connector.o \
> +	disp/mdp4/mdp4_lvds_pll.o \
>   	disp/mdp4/mdp4_irq.o \
>   	disp/mdp4/mdp4_kms.o \
>   	disp/mdp4/mdp4_plane.o \
> @@ -117,9 +120,6 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>   	dp/dp_audio.o
>   
>   msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
> -msm-$(CONFIG_COMMON_CLK) += disp/mdp4/mdp4_lvds_pll.o
> -msm-$(CONFIG_COMMON_CLK) += hdmi/hdmi_pll_8960.o
> -msm-$(CONFIG_COMMON_CLK) += hdmi/hdmi_phy_8996.o
>   
>   msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
>   
> 


-- 
With best wishes
Dmitry
