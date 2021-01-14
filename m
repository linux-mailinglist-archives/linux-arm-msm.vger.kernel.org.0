Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B9E2F6604
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 17:35:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbhANQcp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 11:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727431AbhANQco (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 11:32:44 -0500
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976D4C0613C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 08:32:04 -0800 (PST)
Received: by mail-ot1-x32b.google.com with SMTP id b24so5737084otj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 08:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=akrbvbA4YoHsLqjTiV+7cEpzWhLiMDKtYLiBha64FcU=;
        b=LCHqwPaBQiMFGvNIVGN61jFBE6ERHgqJeqD/zQLFK7CBCcSxFMIMQ6/ZPCTQDlN+5j
         Mu+e/iEkvlGscT3WTjkcBROv7qtzmx0b1MpAfRzPLD+Wb5rc+i6QeFkDrlkVxwnHXjs/
         hI+ouGoRFwjE1ePheoy3iFVxb01CzbPpn2zHddDgjSdfWjvYewXva8GC1Wz4D262umyN
         ecayTOv/74Uvc1ZOnN+UkyXnPGH0RJPWj2suiGRx7Y5dL+WjNJXrtvCMU94LM66TMIKE
         XuhZyI10UJFupingxPoJ47Hs+jHpLVfvSUWQJQziuICGbnLeRg7nG8xUW3VyVbb8UFOH
         Z35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=akrbvbA4YoHsLqjTiV+7cEpzWhLiMDKtYLiBha64FcU=;
        b=aD9xUaZptuvM32AuaK+id2LrDrSQ9QtSd1ntaqx1FzJJb4f16QjBBMfcgy9Lx41Eoc
         xA6i/g/ejlFRCxQrAAQyXzIxHUOY3TrmO9Tz0454uWx8JaW+Zn3N9sXwriiDIPiP/jAK
         2iWg6GvP7szkCPSAWGIFUXkVXA+vvgyCiF1MgZr+BBYh/sGT7PhAG0cTR9my+wINKmEy
         dRpMNJa57ivRJ2Vm/v0V/+OvHCSlcgMGwB0pUVcl7tPh9nhKeTKqTz6Q4YXIMHPb5/Ip
         NaqTHYXqFCQP/nkoVZ5MKQLf10IFqnxHYWqRaatrMdgKb5lCIhMyjgeJzziedVxXkLRz
         xh/A==
X-Gm-Message-State: AOAM531ti6+fC1G0OXfyo2TetsJzdviBIwQqiAFq8fGuE6234SZ/9Knn
        rxYQRIIkX7nuq2wskYg+h23v6Q==
X-Google-Smtp-Source: ABdhPJxnoJBx3D8j3FKtFFah/u4It4fwBbrFyNIIM7367oA1jK14Me4BXsv+TPzfwJq2ETZF+vDvpg==
X-Received: by 2002:a9d:2643:: with SMTP id a61mr4956445otb.158.1610641923837;
        Thu, 14 Jan 2021 08:32:03 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a14sm1135049oie.12.2021.01.14.08.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 08:32:03 -0800 (PST)
Date:   Thu, 14 Jan 2021 10:32:01 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] pinctrl: qcom: Allow SoCs to specify a GPIO
 function that's not 0
Message-ID: <YAByAS6qDTgpwwGh@builder.lan>
References: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 08 Jan 11:35 CST 2021, Douglas Anderson wrote:

> There's currently a comment in the code saying function 0 is GPIO.
> Instead of hardcoding it, let's add a member where an SoC can specify
> it.  No known SoCs use a number other than 0, but this just makes the
> code clearer.  NOTE: no SoC code needs to be updated since we can rely
> on zero-initialization.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>


> ---
> 
> (no changes since v1)
> 
>  drivers/pinctrl/qcom/pinctrl-msm.c | 4 ++--
>  drivers/pinctrl/qcom/pinctrl-msm.h | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index e051aecf95c4..1d2a78452c2d 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -210,8 +210,8 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
>  	if (!g->nfuncs)
>  		return 0;
>  
> -	/* For now assume function 0 is GPIO because it always is */
> -	return msm_pinmux_set_mux(pctldev, g->funcs[0], offset);
> +	return msm_pinmux_set_mux(pctldev,
> +				  g->funcs[pctrl->soc->gpio_func], offset);

Although I would have preferred this line not be wrapped.

Regards,
Bjorn

>  }
>  
>  static const struct pinmux_ops msm_pinmux_ops = {
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
> index 333f99243c43..e31a5167c91e 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.h
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.h
> @@ -118,6 +118,7 @@ struct msm_gpio_wakeirq_map {
>   * @wakeirq_dual_edge_errata: If true then GPIOs using the wakeirq_map need
>   *                            to be aware that their parent can't handle dual
>   *                            edge interrupts.
> + * @gpio_func: Which function number is GPIO (usually 0).
>   */
>  struct msm_pinctrl_soc_data {
>  	const struct pinctrl_pin_desc *pins;
> @@ -134,6 +135,7 @@ struct msm_pinctrl_soc_data {
>  	const struct msm_gpio_wakeirq_map *wakeirq_map;
>  	unsigned int nwakeirq_map;
>  	bool wakeirq_dual_edge_errata;
> +	unsigned int gpio_func;
>  };
>  
>  extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
> -- 
> 2.29.2.729.g45daf8777d-goog
> 
