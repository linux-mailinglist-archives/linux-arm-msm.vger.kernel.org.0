Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDF802CC97C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 23:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgLBWTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 17:19:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728186AbgLBWTq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 17:19:46 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4554C0617A6
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 14:18:59 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id cm17so5747027edb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 14:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w+aMhLNq1eUvJgs6SrXO/85+NlnOMnHMly+a+tezdWo=;
        b=HPJA4fYkHsnGkMC38cJgmAaOkXQnXM7Tr2VwPCocQTaDxASqYUke/Fqpj05G/YnlzB
         eHjvakUlyg5TxEe8gQLzL6E/XyUCaJfwC73kuzkg4wnMHDBK1SkrK7e+jem3Pob/XwIG
         poKK8UNtA0Z7LVsNu90uC06K6mM2IjFoeDybs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w+aMhLNq1eUvJgs6SrXO/85+NlnOMnHMly+a+tezdWo=;
        b=I9Ej9nV/0AceYWQkHL7dlMD2hh+TgyPUorq8p1gP6CmhDArWjsqbHE6vaMae3MfwKd
         rmOby8MDvHVH02LMdw8paAgQqyf7oh6iwn/lWoJ3X87WFWp3NcHLaSzM48WczXN+B6mj
         LMqyKBVtxwY3CY/g55U0Fw/ngL196Aj/uCphquym2r/xDHPothxRB39GNseOlhVV/lvh
         1jqjzMdPM9sgSN6gWRZT5Cr1ymyRmuowdFY4r+RxwSH5qKIGugj/DYP404G+Vpd+JO3Y
         b+JDNBQw8mA6I8ZZ8CN4aH0piTZVucQfM6YFNMAY2Exk8E3or1QhPRaltxVPqQi0wdj3
         JvaQ==
X-Gm-Message-State: AOAM530vAAN2WhzDcpcwoGuTjAYvxEwd8ABu0ynNmx5LuDTOXkwcX0Tl
        S+gXfyLnz6R1PPr3/WmmYFonpTsH4n7DNQ==
X-Google-Smtp-Source: ABdhPJwHvs9E825Qicl573FbhLx8NYI0ig0uy0AP8ZhF2qc/xtGhZtoKIJKIee7d7CtG0WAdXw+DCQ==
X-Received: by 2002:aa7:d6c9:: with SMTP id x9mr182426edr.96.1606947538228;
        Wed, 02 Dec 2020 14:18:58 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id s15sm48335edj.75.2020.12.02.14.18.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 14:18:57 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id jx16so394960ejb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 14:18:56 -0800 (PST)
X-Received: by 2002:a17:906:5847:: with SMTP id h7mr1817692ejs.124.1606947536600;
 Wed, 02 Dec 2020 14:18:56 -0800 (PST)
MIME-Version: 1.0
References: <20201202214935.1114381-1-swboyd@chromium.org>
In-Reply-To: <20201202214935.1114381-1-swboyd@chromium.org>
From:   Alexandru M Stan <amstan@chromium.org>
Date:   Wed, 2 Dec 2020 14:18:20 -0800
X-Gmail-Original-Message-ID: <CAHNYxRwMD4XahHXWW9z7b=VCOEsdPe5Df4CohNwmBy_ijWJ62g@mail.gmail.com>
Message-ID: <CAHNYxRwMD4XahHXWW9z7b=VCOEsdPe5Df4CohNwmBy_ijWJ62g@mail.gmail.com>
Subject: Re: [PATCH] spi: spi-geni-qcom: Use the new method of gpio CS control
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Mark Brown <broonie@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 2, 2020 at 1:49 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Let's set the 'use_gpio_descriptors' field so that we use the new way of
> requesting the CS GPIOs in the core. This allows us to avoid having to
> configure the CS pins in "output" mode with an 'output-enable' pinctrl
> setting.
>
> Cc: Akash Asthana <akashast@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Alexandru M Stan <amstan@chromium.org>
I meant this as a joke in chat. It doesn't really mean anything in any capacity.

> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/spi/spi-geni-qcom.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 25810a7eef10..c4c88984abc9 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -636,6 +636,7 @@ static int spi_geni_probe(struct platform_device *pdev)
>         spi->auto_runtime_pm = true;
>         spi->handle_err = handle_fifo_timeout;
>         spi->set_cs = spi_geni_set_cs;
> +       spi->use_gpio_descriptors = true;
>
>         init_completion(&mas->cs_done);
>         init_completion(&mas->cancel_done);
>
> base-commit: b65054597872ce3aefbc6a666385eabdf9e288da
> --
> https://chromeos.dev
>

Unfortunately this patch makes my cros-ec (the main EC that used to
work even before my debugging) also fail to probe:
[    0.839533] cros-ec-spi spi6.0: EC failed to respond in time
[    1.040453] cros-ec-spi spi6.0: EC failed to respond in time
[    1.040852] cros-ec-spi spi6.0: Cannot identify the EC: error -110
[    1.040855] cros-ec-spi spi6.0: cannot register EC, fallback to spidev
[    1.040942] cros-ec-spi: probe of spi6.0 failed with error -110

I wasn't closely looking at this part closely when I was using my
other spi port with spidev, so this is why I haven't noticed it
before.
Doug suggests this might be a polarity issue. More scoping to be had.

On the other hand my gpioinfo output is better with this patch:
       line  86: "AP_SPI_FP_MISO" unused input active-high
       line  87: "AP_SPI_FP_MOSI" unused input active-high
       line  88: "AP_SPI_FP_CLK" unused input active-high
       line  89: "AP_SPI_FP_CS_L" "spi10 CS0" output active-low [used]

Previously they were:
       line  86: "AP_SPI_FP_MISO" unused input active-high
       line  87: "AP_SPI_FP_MOSI" unused input active-high
       line  88: "AP_SPI_FP_CLK" unused input active-high
       line  89: "AP_SPI_FP_CS_L" unused output active-high

But I'm still disappointed the rest of the pins (CLK MISO MOSI) are
still "unused", but I was told that's just an artifact of those pins
not being gpios (but remuxed to spi).

Alexandru Stan (amstan)
