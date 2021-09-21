Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2555413D0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 23:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235745AbhIUVzA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 17:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235752AbhIUVyz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 17:54:55 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA3E4C061768
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 14:53:23 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 24so1423800oix.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 14:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i6tk9/R5e/Ojy6WWFzxM+f+lVDyX3vnnXj9ScwFQosA=;
        b=iKwHVJeDUTwT7OoRAPKQahj97WQjqdqoLeQy2o0iK3/oDZZzglw6URXU53MAvCzhs7
         1DCiY7elhL2tOG6hUN1E/+Xs98WB4S0j+0Z/Bxk7ueC1qtVy4+SXoQC+YHRTdADNBzFf
         Jb6QbevDqyX/VTVNohTkAfRNq9TrDPUm2WdpxfU/dkJIi5dzrMIVJc/VxUUJ7df4JK3T
         16wr7W7IDPyiNtbomZaIEKM531sKQxlJ5mQ7pU3iKWsBasXxrcAHR6By6ABt5N9lMZLn
         KfMbEzoJrMxMSIsAkb1pvbUwT+hFVx/DhfgZR08jaGztY7Rr/w/ISgCY2lXF0qzldBcp
         blZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i6tk9/R5e/Ojy6WWFzxM+f+lVDyX3vnnXj9ScwFQosA=;
        b=Z4XoZRoqUY0QMMtgVPAvWYzCgJWpqa0bwgCrSO6usA56bLDxCWeOweQZF6gMspXhR5
         QM829Hm3Rj10TLgBcbDwlKkKvtCvgkVzpJ7jMzLVHlFcmVQFJ9kEFe6d/lyfLd4KJasn
         EhN0lvVEmoyjxW9MLhlY30OZzQiYaiR2mAQSHuDsWq3rTdvYq7P2IuJsZ/LtUWjE5U8V
         yQJ30YfOZmnvEPqVQVMUHhhEdc2KM22RCZaDhXfch85c4jK+HjWF2ue8wjyhkTKCOPCf
         lXlfah20hVlVBaN/R1ACULfupQ6n1LKfPCW+X/sL4cEYsXhZVvat941XwU3M98RPA3WO
         f80A==
X-Gm-Message-State: AOAM533ZKyyjDDIrOxRPAxTt4NFW5gqrHsPKqvxoR4S3scQ97EDy8uzx
        AdsFekSSN3SQU4pIAlp6BKj/9w==
X-Google-Smtp-Source: ABdhPJwSxP6PkEBnLKZoPP/NnDjm8RoIzCYd16aMYqUildhh0Jou3q1+0axbeUw+RYp3ae9YAVVq6Q==
X-Received: by 2002:aca:b6d5:: with SMTP id g204mr5530134oif.29.1632261203217;
        Tue, 21 Sep 2021 14:53:23 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u27sm71423otj.6.2021.09.21.14.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 14:53:22 -0700 (PDT)
Date:   Tue, 21 Sep 2021 16:53:21 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: add support to
 enable/disable output
Message-ID: <YUpUUdx9UJ+aL0Fu@builder.lan>
References: <1631588246-4811-1-git-send-email-quic_subbaram@quicinc.com>
 <1631588246-4811-3-git-send-email-quic_subbaram@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1631588246-4811-3-git-send-email-quic_subbaram@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 13 Sep 21:57 CDT 2021, Subbaraman Narayanamurthy wrote:

> Currently, if the GPIO is configured as output in the bootloader
> and user changes the mode to input in HLOS, it would end up
> getting configured as input/output. Functionally, this is fine;
> however, there may be some requirements where the output needs
> to be disabled so that it can be used only for input.
> 
> Add support to enable/disable output mode through "output-enable"
> or "output-disable" pinctrl properties.
> 
> Signed-off-by: Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 98bf0e2..39a18aa 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2012-2014, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2012-2014, 2021, The Linux Foundation. All rights reserved.
>   */
>  
>  #include <linux/gpio/driver.h>
> @@ -424,6 +424,9 @@ static int pmic_gpio_config_get(struct pinctrl_dev *pctldev,
>  			return -EINVAL;
>  		arg = 1;
>  		break;
> +	case PIN_CONFIG_OUTPUT_ENABLE:
> +		arg = pad->output_enabled;
> +		break;
>  	case PIN_CONFIG_OUTPUT:
>  		arg = pad->out_value;
>  		break;
> @@ -503,6 +506,9 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
>  		case PIN_CONFIG_INPUT_ENABLE:
>  			pad->input_enabled = arg ? true : false;
>  			break;
> +		case PIN_CONFIG_OUTPUT_ENABLE:
> +			pad->output_enabled = arg ? true : false;
> +			break;
>  		case PIN_CONFIG_OUTPUT:
>  			pad->output_enabled = true;
>  			pad->out_value = arg;
> -- 
> 2.7.4
> 
