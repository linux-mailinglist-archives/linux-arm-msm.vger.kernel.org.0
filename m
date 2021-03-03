Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5881132C207
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1573529AbhCCVkC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:40:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241254AbhCCOyq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 09:54:46 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A790AC0613E2
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 06:51:09 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id l64so26196116oig.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 06:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ws/0H/NBtbGAfBsufQouIyZBnJjYNp6N//wE944yD2A=;
        b=PBx9BOiiU9F8cKscjuanYUvBgUjV1VF+fWKhzW/8b/FHiQLg5W/BAeg0Us0cHwFvUS
         XCViMM+N7ql6JsXW81H/1HY6Z5wTm90hpXJ/DIQVxDUhl1FleP2tCgBamhUWQ/1c/s9a
         EYhwNqWwrizarG5JRentlw6KFxAgKzFDSwsFGO0iKIDtubff+6ToTAF8Ji6G/UM/mFCD
         Y/EG2wErU2z+HBwTk2Qv8jlUwIcqnCpVxKR7qqTKABh6xpRklmJUcjw/luF2OZld0ob2
         Bi14vKkIYuVs1EzSUuyGOuakYhRCc7xBm2t8coFynRdvdAllyBMzh6wJSKyq3YtF56pC
         5Jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ws/0H/NBtbGAfBsufQouIyZBnJjYNp6N//wE944yD2A=;
        b=RiHpMXuusicxX5TgJfvN6m3NeorhMzn2zUD1VTSWzFiPfBXb2SsxBYXbnKgKGlARqL
         q9tFflSgd8VojPWFXmFGKPE2xM6FuYhjPlTQ1j3xVuNrv+YJwNZYMQM6OxabQQkLx5Dq
         fSXmtg39CIJI3YX9se/YV4EZAPOsGbAoamSsQiTD09b/kc9VjfN0eNSBxF7usHSWd8OJ
         HRfJxU0E+0AKr1Atjz5J3sk7VheaqDnujXLr55VldrfeeVhb1nOeXQdUIJHnbCqMZUpN
         wBDkFb4IWqFxEJNqYP5vn/f9iD+R5IxwwJ9aga5eMgREdYrJqBMavv+bL/QqXl/Oqqcr
         SCew==
X-Gm-Message-State: AOAM5329eKk6syBYsvHZC+xNd9unYzpVrpT7nP8C1FUHGbaU/QURfj9M
        KVIwTiG0suzVtPwpsyx5NK+otg==
X-Google-Smtp-Source: ABdhPJzofhTGYtIsBJ7sqsu7289D2ieSzP7iLSu2PUtje7TbDa7z3ZM8WEgDeRZX4SxvpFZGqwsBvg==
X-Received: by 2002:aca:cf05:: with SMTP id f5mr7657309oig.32.1614783069005;
        Wed, 03 Mar 2021 06:51:09 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id s21sm4842863oos.5.2021.03.03.06.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 06:51:08 -0800 (PST)
Date:   Wed, 3 Mar 2021 08:51:06 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: support gpio_chip .set_config call
Message-ID: <YD+iWuLS/9knWLFb@builder.lan>
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

I like the fact that this solves your gpio configuration issue, but I'm
uncertain if just adding support for configuring pins (in addition to
groups) in the driver is the right solution.

@Linus, to summarize, the Qualcomm TLMM configures pingroups, but all
gpios are defined as a single pin. pinctrl_gpio_set_config() is invoked
based on the configuration provided in the ACPI tables, so Shawn's
proposal is to just implement "config by pin" as well.
Would this not be a problem shared with all pinctrl drivers that
configure gpios in groups?

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

Generally the pinconf/pinmux part of the driver deals with groups, and
the gpio_chip deals with gpio numbers. So I think that either
gpiochip_generic_config() should somehow do the translation, or we
should use a different function that does it (even though there's no
translation).

Regards,
Bjorn

>  	.request          = gpiochip_generic_request,
>  	.free             = gpiochip_generic_free,
>  	.dbg_show         = msm_gpio_dbg_show,
> -- 
> 2.17.1
> 
