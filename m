Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA6133465C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 19:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232828AbhCJSNQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 13:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232624AbhCJSNH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 13:13:07 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E48E9C061761
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 10:13:06 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id r24so9180967otp.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 10:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pHWXTwbw9p9uf8ft6VKP7REHTpiAGXpesgcV8HDhEdc=;
        b=rQ4z0maaHQrOGoltyEtGi+HBeho+EyAB0vE97faSaA9m8+shVlUUHmeeozrjMXp9su
         BuPo2Bh4A/fvXda9mixvifOAV9qCKZs9EsjR1//Nn4sZBA9b8Q8TSMopxHpeCfZqCELn
         EKab7qBAIFfWf6JkcV+PmvtG4oWmw3FBKijBkqgZd0sqkp3Q1M57pVD/Q1pw7DUTkaCU
         qzWzWUETOIYecznvO/oN9cobPvIXL4whx1UWIMK2o/OSlyIerx/+lJeUw29yiXiU48X3
         mwwz9dKYTyQJ6wDFziYUKbZe8qoI8QXnGCHCtJ3erjdmnDcMKn6Ny2+mgQH1vdhiGQx4
         Ahxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pHWXTwbw9p9uf8ft6VKP7REHTpiAGXpesgcV8HDhEdc=;
        b=K2ijFvmVqoingdYyegq3rV2zmmlB6yvg8qYZTRVmND7mlyvphV2ZLjc6xp78gzDKa1
         AK/iyplOQXFLAQew3TfG5LMit+lIFKlu7Hrefrgi14kseJOyJsdI7vlkgezvQ8zAqZnA
         m+AjI9HhlIRcZXOQFBKTWa8lJW4n1j1jogRv/uHq4eM3Zu4mWKgTqNRistii2Q5sH3VS
         PwrdjO4I64u+4e0k9Wg6kOlBY0J2MvPNyhU5AwbpDoVCWfTGwY1chmCZPV0UfyAh8NAc
         6PlsXVFKx6ZC+bl55kL29klRJjxMeHkqNoZ9554i+lIGjvh2t9fyh8jWJ+B/7G1w6nc6
         nx1A==
X-Gm-Message-State: AOAM533kxFipn18v6SId8TURjg2sH/ZY+5GHlILM7AB9lDXeUrTorcb5
        m9m6EDYKspih2dDJZnljRg6/QA==
X-Google-Smtp-Source: ABdhPJzdjuvepmnxQb7O5JaPX1+qMlv8VGrocqBj0XnMpha7kZXxtTo+hL1f1I+OtfGYaMriPDcLqQ==
X-Received: by 2002:a9d:3f6:: with SMTP id f109mr3471150otf.187.1615399986315;
        Wed, 10 Mar 2021 10:13:06 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v7sm70768otq.62.2021.03.10.10.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 10:13:05 -0800 (PST)
Date:   Wed, 10 Mar 2021 12:13:04 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: support gpio_chip .set_config call
Message-ID: <YEkMMIkSAe1yA7KN@builder.lan>
References: <20210303131858.3976-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210303131858.3976-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 03 Mar 07:18 CST 2021, Shawn Guo wrote:

> In case of ACPI boot, GPIO core does the right thing to parse GPIO pin
> configs from ACPI table, and call into gpio_chip's .set_config hook for
> setting them up.  It enables such support on qcom platform by using
> generic config function, which in turn calls into .pin_config_set of
> pinconf for setting up hardware.  For qcom platform, it's possible to
> reuse pin group config functions for pin config hooks, because every pin
> is maintained as a single group.
> 
> This change fixes the problem that Touchpad of Lenovo Flex 5G laptop
> doesn't work with ACPI boot, because PullUp config of Touchpad GpioInt
> pin is not set up by the kernel.
> 

Per Linus comment that this is how others are doing it, I guess we can
do it too...

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> Changes for v2:
> - Add pin config functions that simply call into group config ones.
> 
>  drivers/pinctrl/qcom/pinctrl-msm.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index af6ed7f43058..a59bb4cbd97e 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -489,10 +489,24 @@ static int msm_config_group_set(struct pinctrl_dev *pctldev,
>  	return 0;
>  }
>  
> +static int msm_config_pin_get(struct pinctrl_dev *pctldev, unsigned int pin,
> +			      unsigned long *config)
> +{
> +	return msm_config_group_get(pctldev, pin, config);
> +}
> +
> +static int msm_config_pin_set(struct pinctrl_dev *pctldev, unsigned pin,
> +			      unsigned long *configs, unsigned num_configs)
> +{
> +	return msm_config_group_set(pctldev, pin, configs, num_configs);
> +}
> +
>  static const struct pinconf_ops msm_pinconf_ops = {
>  	.is_generic		= true,
>  	.pin_config_group_get	= msm_config_group_get,
>  	.pin_config_group_set	= msm_config_group_set,
> +	.pin_config_get		= msm_config_pin_get,
> +	.pin_config_set		= msm_config_pin_set,
>  };
>  
>  static int msm_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
> @@ -717,6 +731,7 @@ static const struct gpio_chip msm_gpio_template = {
>  	.get_direction    = msm_gpio_get_direction,
>  	.get              = msm_gpio_get,
>  	.set              = msm_gpio_set,
> +	.set_config       = gpiochip_generic_config,
>  	.request          = gpiochip_generic_request,
>  	.free             = gpiochip_generic_free,
>  	.dbg_show         = msm_gpio_dbg_show,
> -- 
> 2.17.1
> 
