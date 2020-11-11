Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 380CC2AE784
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 05:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgKKEkj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 23:40:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgKKEki (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 23:40:38 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6405C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 20:40:36 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id 79so985649otc.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 20:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=THrPvA4MnBC8Urb8jc0qQLcCeVuZ6qnFpjMfa/vJgI0=;
        b=uUZlf5+MFOWKlhsgSRXBhS5kpeKILSIafsgHgJyM1YabeHp4xJ6FvzZVwoTxG1PGon
         Kry/+h8otjzXYWWp+l4K9r6CucpDNTZPqMBHo+s7ZGIThItEwIw6PeJp2m1mDCbVojD9
         WJmG1QxA09AWEoFLzOYkJTVCVr4SVJ/Q+lRp15M+kVGwGXpiqx2NJUpHgGlt+TSJFajW
         oeMQbhcQ491d1TEBdKxA+e+2i+IUuOWuguCJbe+MQ2bgm8wkTpLoR8a5RfNtsjbzmrTW
         qi+s4y5WH1TUXZDP3lz8eN7yiIXJDLvkoPPiuxBITWQQduBB/K3ygRkcmM0tgWo7yYWd
         4JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=THrPvA4MnBC8Urb8jc0qQLcCeVuZ6qnFpjMfa/vJgI0=;
        b=ZwMvuJWqtBkm7zwBTYRUOQ5VtRZqGj+UYhMM3t/MeJUnMwA8EIFIMQTPqD1Ps+2eAo
         xD7IJ6iflblUJ9NY357WViosYBY5HslY5oZHBBi1JETghAoAJIH9WsNmqaZutiW/L+lt
         1aCmY5X7T72VNXvbn2fcSIgWsRi3mSYjjskRoW0NjX3gfMGig8YMMDAzGiuSoQWfS++i
         jTF7DUE52VVJsUZTjFLMmG+mpUeAXe1nBz9G3OAMUS+jqC76ZvgSNK5APUgbt71B68jQ
         cJEe3hX0dMKcx9bxP5O2C8MHNf/FMsX0OX7/tn870xYxoOu4fTh7BnwRc0Nh2Lg1hqcp
         jUcQ==
X-Gm-Message-State: AOAM533OtUB6eN7k1rmaxsAMPfxgeUG3AeySBR/hgL0YxVs2a8WaJGwB
        +H+cq2kBSGVDbrLvqA9mV3kmow==
X-Google-Smtp-Source: ABdhPJwBHSrK09E4znwr4seoYWvwVMd41X7dAMtiSP0vflu+iW9WN6P4JTndr4yCSFufXdUQEGffyA==
X-Received: by 2002:a9d:6343:: with SMTP id y3mr17197227otk.78.1605069636250;
        Tue, 10 Nov 2020 20:40:36 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q10sm193715oih.56.2020.11.10.20.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 20:40:35 -0800 (PST)
Date:   Tue, 10 Nov 2020 22:40:34 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: sdx55: update kconfig dependency
Message-ID: <20201111044034.GE332990@builder.lan>
References: <20201111043610.177168-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111043610.177168-1-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 10 Nov 22:36 CST 2020, Vinod Koul wrote:

> Commit be117ca32261 ("pinctrl: qcom: Kconfig: Rework PINCTRL_MSM to be a
> dependency rather then a selected config") moved the qcom pinctrl drivers
> to have PINCTRL_MSM as dependency rather then a selected config, so do
> this change for SDX55 pinctrl driver as well.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/pinctrl/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index 8bdf878fe970..dcc046a921cc 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -232,7 +232,7 @@ config PINCTRL_SDM845
>  config PINCTRL_SDX55
>  	tristate "Qualcomm Technologies Inc SDX55 pin controller driver"
>  	depends on GPIOLIB && OF
> -	select PINCTRL_MSM
> +	depends on PINCTRL_MSM
>  	help
>  	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
>  	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
> -- 
> 2.26.2
> 
