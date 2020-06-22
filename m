Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B84A203154
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 10:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbgFVIFA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 04:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgFVIE7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 04:04:59 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9B2C061797
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 01:04:59 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id j189so14801307oih.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oFg5A+95pM59/qGFEv+Fs7c2uxP7PZPlwZ9Sb7/zk9o=;
        b=RhFsPNv8B+mzzAxIfzD6FKEz/gq9Fwmn7AGf8zVUZRQ227r+d/K4M70J5tHUXJS1W0
         QCWcrxnTyu1XtydKQfNajv0NTS+u8BpDKBpUef5/BcLR819uy5cKUkxe2v0U6pnc94eb
         QNqhIULYUEFblQWnXjtjw+nnBXKtNAtWn7yIwDO2t45Y2Lu/yneDxyq9PfVUOQycbHvk
         jt+PgHePheU7dl1tqkA07kYJYV7vWmEMLj5nwX8ER48e7lszG3Sw35k2rlY06jFmQrRW
         AWUIO3cuDvtwwqaQRAdTyjCnvR4wZUWjvpl8zx1CV1dh+jEhFXb1vEHBYvCVf6vSP9nz
         OpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oFg5A+95pM59/qGFEv+Fs7c2uxP7PZPlwZ9Sb7/zk9o=;
        b=cPPAbBlfBt9+qA1CNQSpJLJTVO8s4qLPyA8c1lO8C0xpcOaXqoaD3mWoJXfVFquxPz
         CIHJz0Ld5qHzO993xwiWFznm9eaPHIhuk7ZFpwGxLm5HAfrvx4mw2SI4aWiwG05SK+AC
         ZVdEyE+30jhMB0qvruEffd1d9keRp/tS2XWN9uqJPJqz2Ab72Lrqct91/4bBbHRKQELq
         saf3iwL4h8KX4iCoyo4ORuSYot4puKLsu3YiiovBJa6Cbdh8W//8lhF+ZGGsYEMfYwcc
         sVbfC7CZSb96dBc1//SLwciHZ8b2NIfdx3Lq6wv9SxUtWvKeyoWScsnbC+nm1mvYclGu
         WiKw==
X-Gm-Message-State: AOAM531gCknNJ890VlVhcf75X18aDjerYeQjLb9RGyfW7Ux8o/9xrXce
        Ek54QJGlvZ6aTICfICAZhBiMwA==
X-Google-Smtp-Source: ABdhPJzWmAtYUs+hLvmFl+xyB/KStphIquf59zpASuse0m4EtYM0ug+al52Voj78F6w81Roqgeub3g==
X-Received: by 2002:aca:300e:: with SMTP id w14mr11852313oiw.45.1592813098520;
        Mon, 22 Jun 2020 01:04:58 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t18sm3150802otk.42.2020.06.22.01.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 01:04:57 -0700 (PDT)
Date:   Mon, 22 Jun 2020 01:02:12 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/8] pinctrl: qcom: spmi-gpio: Add pm660(l)
 compatibility
Message-ID: <20200622080212.GC2421@builder.lan>
References: <20200622075749.21925-1-konradybcio@gmail.com>
 <20200622075749.21925-2-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622075749.21925-2-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 22 Jun 00:57 PDT 2020, Konrad Dybcio wrote:

> Add support for pm660(l) SPMI GPIOs. The PMICs feature
> 13 and 12 GPIOs respectively, though with a lot of
> holes inbetween.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index fe0be8a6ebb7..95ca66e24e7c 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1118,6 +1118,10 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
>  	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
>  	{ .compatible = "qcom,pms405-gpio", .data = (void *) 12 },
> +	/* pm660 has 13 GPIOs with holes on 1, 5, 6, 7, 8 and 10 */
> +	{ .compatible = "qcom,pm660-gpio", .data = (void *) 13 },
> +	/* pm660l has 12 GPIOs with holes on 1, 2, 10, 11 and 12 */
> +	{ .compatible = "qcom,pm660l-gpio", .data = (void *) 12 },
>  	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
>  	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },
>  	/* pm8150b has 12 GPIOs with holes on 3, r and 7 */
> -- 
> 2.27.0
> 
