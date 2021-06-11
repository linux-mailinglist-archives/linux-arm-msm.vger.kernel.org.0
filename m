Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2571F3A3A10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 05:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbhFKDDu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 23:03:50 -0400
Received: from mail-ot1-f50.google.com ([209.85.210.50]:44790 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231438AbhFKDDu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 23:03:50 -0400
Received: by mail-ot1-f50.google.com with SMTP id q5-20020a9d66450000b02903f18d65089fso1767794otm.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 20:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CMqzFHpL/T/3Mu7pEcAjimpE29cdfMEPiGJnXB3dZDc=;
        b=xhQjKJNC5QUacmFM0L5+he2v67mA+MyCRbRQb5hMJPhkXWUFJ2q+Aetkcuz9I8lkqM
         CjYP3omEYdZTQbyRdqY17ZHgQ+KcD4Z1iVvUTahlp81bwIoc5GXCTqT3c69Cs0zDfye2
         Vtpdk+ymJNY4WaJ4tk+7xRbTWNRHBH9hUwmVL3j/t5dX9ILtFpiAJZvNhPcct4JrxoGO
         Bh5O2V6JPi7MRKgQfr1XNVCrqBqd1KkvbPYmnfB40ycx97NGLIVDA8g9sSb6WvhQn+55
         Dy1aUSNyTyiEzPT4eC+rYLKx3uk1pgeZ6uBGK/bufNeGVS4p5OxoyhG+FZgnnc+7FNZW
         gx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CMqzFHpL/T/3Mu7pEcAjimpE29cdfMEPiGJnXB3dZDc=;
        b=HyoMZZ4ujrHuJVhIJq1I7t443uqkP2cykmrpG41MDEOJPXTv2FmBo0+Ij8lnMsf3jU
         YtfvMAN6lt/rL3Ru1aU24WnRnvYsWui/NG0xa/PouSk3IJey9p3MCemY9vSz1StKrbEp
         lIxo20b22h0mHKPq5cj/l1eIjD6h7/ubd8iyCJ5C0ct6hJh0bFd/zCit3brDyjH7E0Y2
         Z0i/F95PnHTq1lTdi0Y+wXMPCHOemUIeNq2QQL5I/Hg9MlRO+VtnOR6uW1tUjdypxar/
         kXQIgiUfkzgpTEca9xR/OiGOKqM1YzBxFFP3Ap+wyXhzfe9UNU+yHuOfur5aReaYx1D1
         zirQ==
X-Gm-Message-State: AOAM530QSL1E3/IwONM+8bBN4kpxpI441kINzkXpSJxFgL4pq9muqFMK
        6za7WghKqfUBvBYnR8+P3ebicg==
X-Google-Smtp-Source: ABdhPJypjD1Lk3iNtELqDAcPXKCtM+oT3ko2EQNtyx0WUHMSXGYLlrUd6fnidHS8/EAyhn0NlqptwA==
X-Received: by 2002:a05:6830:1d0:: with SMTP id r16mr1157644ota.116.1623380441709;
        Thu, 10 Jun 2021 20:00:41 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q15sm921677oon.28.2021.06.10.20.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 20:00:41 -0700 (PDT)
Date:   Thu, 10 Jun 2021 22:00:39 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: Re: [PATCH 5/8] pinctrl: qcom/pinctrl-spmi-gpio: Add compatibles for
 pmic-gpios on SA8155p-adp
Message-ID: <YMLR11+6A/6klgqJ@builder.lan>
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-6-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607113840.15435-6-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:

> SA8155p-adp PMICs (PMM8155AU_1 and PMM8155AU_2) expose
> the following PMIC GPIO blocks:
> 
> - PMM8155AU_1: gpio1-gpio10 (with holes on gpio2, gpio5, gpio7 and gpio8)
> - PMM8155AU_2: gpio1-gpio10 (with holes on gpio2, gpio5, gpio7)
> 
> Add support for the same in the pinctrl driver.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: bhupesh.linux@gmail.com
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 00870da0c94e..890c44b6e198 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1127,6 +1127,10 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
>  	/* pm8150l has 12 GPIOs with holes on 7 */
>  	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
> +	/* pmm8155au-1 has 10 GPIOs with holes on 2, 5, 7 and 8 */
> +	{ .compatible = "qcom,pmm8155au-1-gpio", .data = (void *) 10 },

As noted in the binding, I think this should be "qcom,pmm8155au-gpio"
and please skip the comment about the holes.

Thanks,
Bjorn

> +	/* pmm8155au-2 has 10 GPIOs with holes on 2, 5 and 7 */
> +	{ .compatible = "qcom,pmm8155au-2-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pm8350-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pm8350b-gpio", .data = (void *) 8 },
>  	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
> -- 
> 2.31.1
> 
