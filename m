Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D6E20475C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 04:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730456AbgFWCiD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 22:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731557AbgFWCiD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 22:38:03 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA65C061795
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 19:38:00 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id g12so8465784pll.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 19:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8ViMd9qxutEQeRkcx0Bbqk7Xg6v8bNGAxJWPNkNpxVc=;
        b=VoSLhcSdum8qpYuIQFkoX+QSLojIc5Hf5YyPZttYms37nvRxpQzTBfd9wFGBNBJcZ2
         6pqqPy+CFfSRTiNIZrzeHc5Q1zSpamKpIxgrYkUvcifUB/8HHeBRt/fz0g9MQLoFLmV8
         jgv06t9SyaED8LKybP4fDpAOK6LMEKO+eL2umeWTjZEGiY7Hw39G6xC0koYT5bnEEc5v
         LtpaVuBUVCmFRhDoYhEl0en4KXSrhyi7Chq3uGIrLNn8F2I5WDsyfEyM3L3Dq2y80QPT
         i1SHRLezLfkhVsf/A6/UZICxHOseoL7Qe6qFYEUevC33jNEVu9k43syG4TpSqw1eMQfh
         DAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8ViMd9qxutEQeRkcx0Bbqk7Xg6v8bNGAxJWPNkNpxVc=;
        b=CO7+DiHBoR/n11wy6jSgDAKQaMEBtZ0gT15uHk1nxsqAl/sNXN5/SIUjg+/FOzMfIM
         XfgG3HJK0xnhB54apqKNDaPS2R4N8Frrvy+rnaX3D0TiW0MQoLCLpSgRMueoWOxUseCH
         uKcpAgZrPmd8P33WzbnyzRBSeM1j4Aw6oSi7GaXjz9JBQ1lNUofqWx7Px36CHw6s8Lvj
         eC9EM8wkmmOKVJwaDv+r1TyZo2dkK6rQha+FF4P81UOrcnPoYfYna+8d51ctpPgfeLjn
         ZkPnjenMn57hlbWCYoeUJxg3wdarmvrDtstwFJicWWN1Ci4AtsLV76mjJKQk2hBxrpzH
         QAAA==
X-Gm-Message-State: AOAM5307q3wDiIfi5jTtPBREy+D0vp/rvVEg9Axx+MijoSii5FDE2p3u
        trTVX9dtMWeRmMBsHkYh73j/
X-Google-Smtp-Source: ABdhPJxSVCDIre3q0AVXoF9eoc089O0HsHoNFFhrKVy+1BO2Z+QfC5F1GNiUW5qwQVds3ruRp4eLrg==
X-Received: by 2002:a17:902:9f8d:: with SMTP id g13mr21815478plq.292.1592879879378;
        Mon, 22 Jun 2020 19:37:59 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:609d:7d26:e4ff:f0b0:edd6:2484])
        by smtp.gmail.com with ESMTPSA id i10sm12258533pgq.36.2020.06.22.19.37.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jun 2020 19:37:58 -0700 (PDT)
Date:   Tue, 23 Jun 2020 08:07:52 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm SM8250 pinctrl driver
Message-ID: <20200623023752.GA11093@Mani-XPS-13-9360>
References: <20200622220048.717073-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622220048.717073-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 22, 2020 at 03:00:48PM -0700, Bjorn Andersson wrote:
> The SM8250 pinctrl driver provides pin configuration, pin muxing and
> GPIO pin control for many pins on the SM8250 SoC.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index b3d13e1a052a..bbbaaab5a4fa 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -469,6 +469,7 @@ CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>  CONFIG_PINCTRL_SC7180=y
>  CONFIG_PINCTRL_SDM845=y
>  CONFIG_PINCTRL_SM8150=y
> +CONFIG_PINCTRL_SM8250=y
>  CONFIG_GPIO_ALTERA=m
>  CONFIG_GPIO_DWAPB=y
>  CONFIG_GPIO_MB86S7X=y
> -- 
> 2.26.2
> 
