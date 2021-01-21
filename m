Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9062FE14A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 05:59:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbhAUDwS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 22:52:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727350AbhAUDUf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 22:20:35 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60B66C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 19:19:16 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id i20so336562otl.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 19:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8Rp2B5BZv6lIw+nnY7lV34RDMnSmVwqnPc777cf3U+0=;
        b=NkEj1mMXhbaRzvPldVQpLi/kkm1Us5mKQIOA/B/990oJQ4XtITyBH/fAUUlE1dojJ0
         3rie8SnB27VwwuiKeU5NO+MUJP4bHPUZ8z5G8qsKMJlRYEZAtXtqY4RGuH8R3WrdHU4v
         ifDwv0kYQUpDExwhpS7L71jrQSxPQYIQOd4C8YAkSVbGk1EStVpi1oVZTXmKONffxmAm
         X8Z5ULAUv9cPbXt5C2fczkQ+oIqSxZw+iH4tI0ThK0a9WBqQLRpGF5bXD7JKYUW1qBG+
         oA24oxYApDNvZMAsM8i6kGMQtL+TiUdDoV3+RzGIl3RLPIBRTKOPSpY9D5zvoseEoFHz
         pIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8Rp2B5BZv6lIw+nnY7lV34RDMnSmVwqnPc777cf3U+0=;
        b=VfUBXxEGpDDvo6r8s2lIdexK72gO8U2vD6ukqkHEDfw9YFjjdObsN/Fcdgvz0b62/i
         WlEATb31D38oraZaNI8wWCU9l8UWX6E6nBNbAbhPI8i974zLdzDRUhuWda4gix8XW25x
         MjMpZpVGVskOxNoy3Krj7OgveGDKU13t43M8I44kMWzuqDHmM15dNqkVYiS0BLz8V/RD
         GcrkSEIaPu7TsdlB22bHviDvhVtCyFqg/uY4S6/+0NDqDvfzuGHngs5plA8gyY6Ni7TV
         oDuR++4TsVQu7Vijs6OHG8bBf78ns5WupkMTw7WYgs6ljNzZTv336bq+P/DPeWET1wQ5
         zSqQ==
X-Gm-Message-State: AOAM533SgxTDD7mmJb8uOxg2fMhRhO8l5QQFBAR3U4rFyOTGIcS4/Vnw
        ORxK5aFXdpx6hXl0qkgl4ZHi3A==
X-Google-Smtp-Source: ABdhPJxuY7waI6QdTU1Q9xQW1jHXgw+x26QczNUMzXPrT8tg4A5/nB3Md4IX8Gi545ZP+gvDQXIBtw==
X-Received: by 2002:a9d:4c83:: with SMTP id m3mr596284otf.353.1611199155747;
        Wed, 20 Jan 2021 19:19:15 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i1sm858689otr.81.2021.01.20.19.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 19:19:15 -0800 (PST)
Date:   Wed, 20 Jan 2021 21:19:13 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: Assign boolean values to a
 bool variable
Message-ID: <YAjysf3IQvxO/qsT@builder.lan>
References: <1611127757-52999-1-git-send-email-abaci-bugfix@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611127757-52999-1-git-send-email-abaci-bugfix@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 20 Jan 01:29 CST 2021, Jiapeng Zhong wrote:

> Fix the following coccicheck warnings:
> 
> ./drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:340:3-15: WARNING:
> Assignment of 0/1 to bool variable.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Although we're mixing bool/int on line 417 and 637 as well, with:

	val |= pin->disable;

and

	pin->disable = val & BIT(0);

respectively. The latter could be dealt with using !!(val & BIT(0)); I
guess the appropriate for for the prior is:

	if (pin->disable)
		val |= BIT(0);

If you would like to update your patch with these as well I'd be happy
to review this.

Thanks,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> index b5949f7..eb0b60c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> @@ -331,13 +331,13 @@ static int pm8xxx_pin_config_set(struct pinctrl_dev *pctldev,
>  		case PIN_CONFIG_BIAS_DISABLE:
>  			pin->bias = PM8XXX_GPIO_BIAS_NP;
>  			banks |= BIT(2);
> -			pin->disable = 0;
> +			pin->disable = false;
>  			banks |= BIT(3);
>  			break;
>  		case PIN_CONFIG_BIAS_PULL_DOWN:
>  			pin->bias = PM8XXX_GPIO_BIAS_PD;
>  			banks |= BIT(2);
> -			pin->disable = 0;
> +			pin->disable = false;
>  			banks |= BIT(3);
>  			break;
>  		case PM8XXX_QCOM_PULL_UP_STRENGTH:
> @@ -350,11 +350,11 @@ static int pm8xxx_pin_config_set(struct pinctrl_dev *pctldev,
>  		case PIN_CONFIG_BIAS_PULL_UP:
>  			pin->bias = pin->pull_up_strength;
>  			banks |= BIT(2);
> -			pin->disable = 0;
> +			pin->disable = false;
>  			banks |= BIT(3);
>  			break;
>  		case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
> -			pin->disable = 1;
> +			pin->disable = true;
>  			banks |= BIT(3);
>  			break;
>  		case PIN_CONFIG_INPUT_ENABLE:
> -- 
> 1.8.3.1
> 
