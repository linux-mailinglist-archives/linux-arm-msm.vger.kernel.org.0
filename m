Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE4A2F7EE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 16:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727283AbhAOPEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 10:04:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726801AbhAOPEv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 10:04:51 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2DC6C061757
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 07:04:11 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id q205so9766878oig.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 07:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nSjALy3jV0oPYw/Kq3ABzoFE5GwYu5XYQTy7SMBJWro=;
        b=onZkUziS9rLFVRU2bY0ha2607MuWRWtakdeDQIDYO8JFOc/THhqzc9ZhV4Jk1fjoAP
         CWaBmdQx+bn5Tk9+aIs4nSJztei7ozTFK4HoUKGzks2d7oH//FZFun92ZPSPwcCQ30fF
         7pS2mDAStIeCIdPWMlQehmgt3nP0X1yjxhozOBCjpWn+JEw8pTY3ZTLSdPfQ8nK21LIo
         fAxP2ZSGNq+wjW3a3dFNWYVwOTeux79YbHQpzlcO/zIqlWz1wyGNXHpa3eKdgxoANfmf
         r7UffZK+8BuqLFLxaFHbzUUutjjM1RFNHxyrio+p2cNzzKMkagqE0Mi5H+vNrMZ1dm6D
         dj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nSjALy3jV0oPYw/Kq3ABzoFE5GwYu5XYQTy7SMBJWro=;
        b=bVu4YkJfgwpHtpC8M3p4Zp/fYwYRjfFRLwkilboMjmgW0bGLK9qmS/bHlR7jfJ0eA6
         V8bb+8b56GOd9Apnmd0x38uhV5Rm2q0vG5/BAb9/tOyIaIEl2YUe+bi5jE4pL4DbCN5r
         Yf1feRNUXYxhLoKZ5pjQqtHlxTnQUL6RDyBiys3A9h+X9EjuJFZQTvAW2KdHbs9q0YQ/
         bndjmrJSvYn2BmG7uBZq5sz4kx2O51wbia0MA57fOH8KEBro2CX/zTr/2AJJIAfzpc6Z
         wHp9YNY2uDbPODYwYIPpXtdOLLnR0EfTZM8x8jlDIEahm2kDysuHORyT4jXQOeaR6JTM
         mrFQ==
X-Gm-Message-State: AOAM532FQyzGD9BWUJlOPSi4/P0CSdJkOQ3nVsAUsu1LV1wDmX7Dgbs9
        8pFrCsKHHeIQMTBcNEFg4pgLNg==
X-Google-Smtp-Source: ABdhPJyQO03gpZFrbnm6c8igTD3Tg782ZNXBMML7dKMjOmaBo+WeF5xqVMVHcyrxN4TEn67JZPO20g==
X-Received: by 2002:a05:6808:199:: with SMTP id w25mr5900361oic.151.1610723050910;
        Fri, 15 Jan 2021 07:04:10 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w11sm279938otl.13.2021.01.15.07.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:04:09 -0800 (PST)
Date:   Fri, 15 Jan 2021 09:04:08 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SM8250 audio config
Message-ID: <YAGu6Oe2B0Uzq11U@builder.lan>
References: <20201228152947.4021689-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201228152947.4021689-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 28 Dec 09:29 CST 2020, Dmitry Baryshkov wrote:

> Enable ASoC platform driver and condec drivers for Qualcomm SM8250
> platform and devices based on it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 838301650a79..9b1c438aa17f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -505,6 +505,7 @@ CONFIG_PINCTRL_SC7180=y
>  CONFIG_PINCTRL_SDM845=y
>  CONFIG_PINCTRL_SM8150=y
>  CONFIG_PINCTRL_SM8250=y
> +CONFIG_PINCTRL_LPASS_LPI=y

The reason for keeping the TLMM drivers builtin is because they will
otherwise prevent the UART from probing before we hit userspace (leaving
us without a console). But this should be possible to land as =m
instead?

>  CONFIG_GPIO_ALTERA=m
>  CONFIG_GPIO_DAVINCI=y
>  CONFIG_GPIO_DWAPB=y
> @@ -724,6 +725,7 @@ CONFIG_SND_SOC_QCOM=m
>  CONFIG_SND_SOC_APQ8016_SBC=m
>  CONFIG_SND_SOC_MSM8996=m
>  CONFIG_SND_SOC_SDM845=m
> +CONFIG_SND_SOC_SM8250=m
>  CONFIG_SND_SOC_ROCKCHIP=m
>  CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
>  CONFIG_SND_SOC_ROCKCHIP_RT5645=m
> @@ -747,6 +749,8 @@ CONFIG_SND_SOC_TAS571X=m
>  CONFIG_SND_SOC_WCD934X=m
>  CONFIG_SND_SOC_WM8904=m
>  CONFIG_SND_SOC_WSA881X=m
> +CONFIG_SND_SOC_LPASS_WSA_MACRO=m
> +CONFIG_SND_SOC_LPASS_VA_MACRO=m
>  CONFIG_SND_SIMPLE_CARD=m
>  CONFIG_SND_AUDIO_GRAPH_CARD=m
>  CONFIG_I2C_HID=m
> @@ -932,6 +936,7 @@ CONFIG_SM_GCC_8250=y
>  CONFIG_SM_GPUCC_8150=y
>  CONFIG_SM_GPUCC_8250=y
>  CONFIG_QCOM_HFPLL=y
> +CONFIG_CLK_GFM_LPASS_SM8250=y

This clock controller seems to only provide clocks needed by audio (and
no power-domains), could we therefor instead make it =m?

Regards,
Bjorn

>  CONFIG_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_QCOM=y
>  CONFIG_ARM_MHU=y
> -- 
> 2.29.2
> 
