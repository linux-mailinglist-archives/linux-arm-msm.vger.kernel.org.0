Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 944EC913BF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 Aug 2019 02:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbfHRAKy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Aug 2019 20:10:54 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37542 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbfHRAKy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Aug 2019 20:10:54 -0400
Received: by mail-pg1-f193.google.com with SMTP id d1so4226407pgp.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Aug 2019 17:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2P41VmpgH709MNjHtQjn5kqjWZE/eE2T7peV7aC9s3c=;
        b=o3sGogWvJviB7R6PAM2ZAPgtxpcOjEugWQ8M4NTCjhEyK7O1HITcRLaHJBElmqbjao
         tsADmvTpZRmCbm9xUVuEcaLTIvcS8H0Yg18MEcyLqpRENzCq4kDA2cI34BF5DMy9CPDB
         akbgXsac8k4R954sOTrsifvNYGKYx45C67svRpjGoWWdiShZ1f0oTl7fLWh6fuJTEJQy
         I9jYrG8UreC7ov8hIIAeh38qcNvSjY3HYex+hT1E/xDcOX/ZWtvT6+CoGHNNDoqDrkc4
         X0R+3Pw87KKTdaSuHYJmJm4FhnGvrk90hvxZ2JgT9pLusd2W2O2eg0+SJ9K8DKRLMcfM
         EHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2P41VmpgH709MNjHtQjn5kqjWZE/eE2T7peV7aC9s3c=;
        b=UX2hhDfIHTpZKsmJ1Abg2xAwVGrxH2E87Ck/xisgnS7MGpEkZx/Qrkz6XXM7oy/4ZZ
         Ma1mdpxhYceBCluym4BFsv6XvjqL/xNjGR09CsdGDi1HSPZA/Rwf3/7yN/yHWLvOBCHC
         wyv9OIOBEquEkfWlh6ef8qfUeUzUOKlCuG+mr/p6dIw8fFZG8eYHHt06LeloRETQ5G4m
         cz/mI92zkBl8XECc4daRlsUgGwpHShzuxWumUKIkNhOvCfAKQweieM1m9qUmqqjk1C/L
         SOPVaXdKsFTngKZ7V9/dzs20u+4pgFs1P7JoyLK9ThULqErGLrJiK3d99JNLk1T101M/
         q15w==
X-Gm-Message-State: APjAAAWy5rsx0BifYPN/ScKLe/OvwxHtRhUHC2Ept7KuPoXBFb3v0POa
        SgjP/LWEcHeU/oGhXgLDLkcpHw==
X-Google-Smtp-Source: APXvYqxx9Yp9jc1UsaQxsOLh+ZbdBrM65L0qU1Ys+W3yCPVRifCRRIBAFjP9lfKXMe4c4uP55xWvtA==
X-Received: by 2002:a65:518a:: with SMTP id h10mr11820901pgq.117.1566087053602;
        Sat, 17 Aug 2019 17:10:53 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h11sm10630488pfn.120.2019.08.17.17.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2019 17:10:52 -0700 (PDT)
Date:   Sat, 17 Aug 2019 17:12:35 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Dewar <alex.dewar@gmx.co.uk>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl/qcom: Fix -Wimplicit-fallthrough
Message-ID: <20190818001235.GX26807@tuxbook-pro>
References: <20190817082520.7751-1-alex.dewar@gmx.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190817082520.7751-1-alex.dewar@gmx.co.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 17 Aug 01:25 PDT 2019, Alex Dewar wrote:

> In pinctrl-spmi-gpio.c there is a switch case which is obviously
> intended to fall through to the next label. Add a comment to suppress
> -Wimplicit-fallthrough warning.
> 

Thanks for your patch Alex, this was fixed in 6161dc03587b ("pinctrl:
qcom: spmi-gpio: Mark expected switch fall-through")

Regards,
Bjorn

> Signed-off-by: Alex Dewar <alex.dewar@gmx.co.uk>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index f39da87ea185..b035dd5e25b8 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -813,6 +813,7 @@ static int pmic_gpio_populate(struct pmic_gpio_state *state,
>  	switch (subtype) {
>  	case PMIC_GPIO_SUBTYPE_GPIO_4CH:
>  		pad->have_buffer = true;
> +		/* FALLS THROUGH */
>  	case PMIC_GPIO_SUBTYPE_GPIOC_4CH:
>  		pad->num_sources = 4;
>  		break;
> --
> 2.22.1
> 
