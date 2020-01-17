Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 058D6141395
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2020 22:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729035AbgAQVrC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jan 2020 16:47:02 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34923 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgAQVrC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jan 2020 16:47:02 -0500
Received: by mail-pl1-f195.google.com with SMTP id g6so10389991plt.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2020 13:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lpIgyl5NCXKJtlVfY6LDVr/laVruYd1wjo/GE/EvpJk=;
        b=NS/EhPCspDc9BrYLxCDbQc6HGbciz//NMH4L/3A+Fp+eNZn38j6WuZ+ZZUud6V4CBL
         hv6R4IebxYsKRgwAr6BF5zxIvj6gLzdVCboFtdIXId4AIuc0ro5IJBGobecYx6XvfEL2
         IpYFTISZskx1s5EmflFSZiHCz1YhmswzGbSFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lpIgyl5NCXKJtlVfY6LDVr/laVruYd1wjo/GE/EvpJk=;
        b=o8gCgjlCUG+uoaZT765uI+kFTQkOt1FFOtrtTuspYsI5X8+37gOt5FxRT8AW5bjfZf
         WgF1WFn+gbemKGvu2xsnChhxTZZI3PbPknwsRfP18LXO8X3ozT25Grq430PZ7SpnLJcN
         syLIT33CZrBENxavd7AH+qm2QX3XNRB8yEwBX3lHWUgPbbN6vGBEv7UCd7jv+Zun0Flf
         UGoAlCsXiatKoKvJ2ckPXK2GYSMdgx3zjxSpzjWxtIMwwHqlS7i2hYhD7Db/uMhgghkW
         MjBMvBRmE34dIljaK82xl4Q4Pmb4JrsZ2NrzTl/5G/Hekg62ZZZ+U+7uCd5i8nYeHcwt
         k2+g==
X-Gm-Message-State: APjAAAWl51KbIk9zBWdp6lQzbSEDpGbqVgxTq7bW8HOcgC/UfrGcky3G
        2vtYnQztQUecapKXbnaWQx/1nQ==
X-Google-Smtp-Source: APXvYqx9BLen4IIYmuKFE1qPi9xL0KYuRvk3pdIuKyhIfjRLB6W+fgmMd+3jUJonjejco6dc9E68ug==
X-Received: by 2002:a17:90a:5d15:: with SMTP id s21mr8497823pji.114.1579297621658;
        Fri, 17 Jan 2020 13:47:01 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id j8sm287874pjb.4.2020.01.17.13.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2020 13:47:01 -0800 (PST)
Date:   Fri, 17 Jan 2020 13:46:59 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 4/5] phy: qcom-qusb2: Add support for overriding
 tuning parameters in QUSB2 V2 PHY
Message-ID: <20200117214659.GR89495@google.com>
References: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
 <1578658699-30458-5-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1578658699-30458-5-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jan 10, 2020 at 05:48:18PM +0530, Sandeep Maheswaram wrote:
> Add support for overriding tuning parameters in QUSB2 V2 PHY
> bias-ctrl-value,charge-ctrl-value and hsdisc-trim-value.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 51 +++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index db4ae26..d8bed13 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -66,6 +66,14 @@
>  #define IMP_RES_OFFSET_MASK			GENMASK(5, 0)
>  #define IMP_RES_OFFSET_SHIFT			0x0
>  
> +/* QUSB2PHY_PLL_BIAS_CONTROL_2 register bits */
> +#define BIAS_CTRL2_RES_OFFSET_MASK		GENMASK(5, 0)
> +#define BIAS_CTRL2_RES_OFFSET_SHIFT		0x0
> +
> +/* QUSB2PHY_CHG_CONTROL_2 register bits */
> +#define CHG_CTRL2_OFFSET_MASK			GENMASK(5, 4)
> +#define CHG_CTRL2_OFFSET_SHIFT			0x4
> +
>  /* QUSB2PHY_PORT_TUNE1 register bits */
>  #define HSTX_TRIM_MASK				GENMASK(7, 4)
>  #define HSTX_TRIM_SHIFT				0x4
> @@ -73,6 +81,10 @@
>  #define PREEMPHASIS_EN_MASK			GENMASK(1, 0)
>  #define PREEMPHASIS_EN_SHIFT			0x0
>  
> +/* QUSB2PHY_PORT_TUNE2 register bits */
> +#define HSDISC_TRIM_MASK			GENMASK(1, 0)
> +#define HSDISC_TRIM_SHIFT			0x0
> +
>  #define QUSB2PHY_PLL_ANALOG_CONTROLS_TWO	0x04
>  #define QUSB2PHY_PLL_CLOCK_INVERTERS		0x18c
>  #define QUSB2PHY_PLL_CMODE			0x2c
> @@ -327,6 +339,12 @@ struct qusb2_phy {
>  	u8 preemphasis_level;
>  	bool override_preemphasis_width;
>  	u8 preemphasis_width;
> +	bool override_bias_ctrl;
> +	u8 bias_ctrl_value;
> +	bool override_charge_ctrl;
> +	u8 charge_ctrl_value;
> +	bool override_hsdisc_trim;
> +	u8 hsdisc_trim_value;

Documentation for the new struct members is missing.

Given the increasing numbers of overrides you could consider to organize
them in a struct, instead of adding a 'override_' and '_value' to qusb2_phy
for every param. E.g.:

struct override_param {
        bool override;
        u8 value;
};

struct override_params {
        struct override_param imp_res_offset;
        struct override_param hstx_trim;
        ...
};

struct qusb2_phy {
        struct override_params overrides;
};


Or - if you want to take it even further - something along these lines:

struct override_param {
        const char *dt_property;
        u32 offset;
        u8 shift;
        u8 mask;

        // separate struct, since these are not constant?
        bool override;
        u8 value;
};

struct override_param params[] = {
        { "qcom,bias-ctrl-value", QUSB2PHY_PLL_BIAS_CONTROL_2, GENMASK(5, 0), 0 },
        { "qcom,charge-ctrl-value", QUSB2PHY_CHG_CTRL2, GENMASK(5, 4), 4 },
        ...
};
