Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 874F91521D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 22:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727458AbgBDVSy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 16:18:54 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37744 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727574AbgBDVSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 16:18:54 -0500
Received: by mail-vs1-f66.google.com with SMTP id x18so12439700vsq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 13:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ig51N1g6KEOgKY3CEDTkDorjmkcG1hiofbCpAcjU/P0=;
        b=MbThkf17ZqdxHDxIYXmCBNWXk/NFKFXqv0PotnuvrnwkaoezorZsnAXOkc9nD6Bag/
         r5bgOiJxr07kUK8bfSFBJ/udvgZlfFuV8+5j4ko/r+AWxOMYXFEi7dhzaXHuNjAyC0gc
         24b2xgB4p1oVhuE8CNVmGyy0jlvsb0dAasjrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ig51N1g6KEOgKY3CEDTkDorjmkcG1hiofbCpAcjU/P0=;
        b=OJrQQSThJpG+0mTA1Nglv3EyrW2DY7kO2v0SYqMTbyjFvKG7+M1ezuxM+pkP7P9Hto
         SUMiTaustyICngEqCQ/mtlo7VnRlq68iajSJSHvfoXNhP/yVqt8wXbehxjqJmXPDy92e
         BKB3fuj32u3f0XCeCfcXWQlvDxIbVLT8toepAelWTXMcX3rkl36LrNW5aD1iYzAjToji
         0yeXjXF3YHS6Pi8HpM8URBzCah2E/m0mDh3/Uh1hkocwyYHCAA9XxMMzsGr8M7B6N5Me
         fOYDsfAGkSSwK5OfCUDa0WRTTE1HxiGScOps0TxtQ6la3eboA1ZN7AC6gBnZGQLNA/JY
         klCA==
X-Gm-Message-State: APjAAAU5ARvXS3xqkcv0mqRTaeGe8sY/TX0srrGxFUNAAsdtO+cSiHNO
        BIp61iCpACWnrcr9uX2WXJHyElDgQu4=
X-Google-Smtp-Source: APXvYqxizjrf2qGSDR6y+70ole/8O46VWJ5uQoONGBiNIJ23IlB82fra20iRdw+rKvwhx4wTu8xOjg==
X-Received: by 2002:a67:70c5:: with SMTP id l188mr20284531vsc.201.1580851132969;
        Tue, 04 Feb 2020 13:18:52 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id y7sm6699582vso.28.2020.02.04.13.18.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 13:18:52 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id p14so12466892vsq.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 13:18:52 -0800 (PST)
X-Received: by 2002:a67:ec4a:: with SMTP id z10mr18832183vso.73.1580851131312;
 Tue, 04 Feb 2020 13:18:51 -0800 (PST)
MIME-Version: 1.0
References: <20200204193152.124980-1-swboyd@chromium.org> <20200204193152.124980-3-swboyd@chromium.org>
In-Reply-To: <20200204193152.124980-3-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 4 Feb 2020 13:18:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W-2jrpSbHoTLJ7MzVAhR=4hKnVyjdtgUQCs=Qr4ptOfg@mail.gmail.com>
Message-ID: <CAD=FV=W-2jrpSbHoTLJ7MzVAhR=4hKnVyjdtgUQCs=Qr4ptOfg@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: qcom-geni: Grow a dev pointer to simplify code
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-i2c@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Feb 4, 2020 at 11:31 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Some lines are long here. Use a struct dev pointer to shorten lines and
> simplify code. The clk_get() call can fail because of EPROBE_DEFER
> problems too, so just remove the error print message because it isn't
> useful.
>
> Cc: Girish Mahadevan <girishm@codeaurora.org>
> Cc: Dilip Kota <dkota@codeaurora.org>
> Cc: Alok Chauhan <alokc@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 51 ++++++++++++++----------------
>  1 file changed, 24 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 3e13b54ce3f8..192a8f622f3d 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -502,45 +502,42 @@ static int geni_i2c_probe(struct platform_device *pdev)
>         struct resource *res;
>         u32 proto, tx_depth;
>         int ret;
> +       struct device *dev = &pdev->dev;
>
> -       gi2c = devm_kzalloc(&pdev->dev, sizeof(*gi2c), GFP_KERNEL);
> +       gi2c = devm_kzalloc(dev, sizeof(*gi2c), GFP_KERNEL);
>         if (!gi2c)
>                 return -ENOMEM;
>
> -       gi2c->se.dev = &pdev->dev;
> -       gi2c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
> +       gi2c->se.dev = dev;
> +       gi2c->se.wrapper = dev_get_drvdata(dev->parent);
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       gi2c->se.base = devm_ioremap_resource(&pdev->dev, res);
> +       gi2c->se.base = devm_ioremap_resource(dev, res);
>         if (IS_ERR(gi2c->se.base))
>                 return PTR_ERR(gi2c->se.base);
>
> -       gi2c->se.clk = devm_clk_get(&pdev->dev, "se");
> -       if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(&pdev->dev)) {
> +       gi2c->se.clk = devm_clk_get(dev, "se");
> +       if (IS_ERR(gi2c->se.clk) && !has_acpi_companion(dev)) {
>                 ret = PTR_ERR(gi2c->se.clk);
> -               dev_err(&pdev->dev, "Err getting SE Core clk %d\n", ret);
>                 return ret;
>         }

As with my response to your similar SPI change [1], there are cases
where this print could have informed us about other errors besides
EPROBE_DEFER, but it does seem rather unlikely so I'm OK w/ your
change.

I'm wondering why you didn't further clean this up, though.  You could
have fully gotten rid of the braces by just doing:

return PTR_ERR(gi2c->se.clk);


> -       ret = device_property_read_u32(&pdev->dev, "clock-frequency",
> -                                                       &gi2c->clk_freq_out);
> +       ret = device_property_read_u32(dev, "clock-frequency",
> +                                      &gi2c->clk_freq_out);
>         if (ret) {
> -               dev_info(&pdev->dev,
> -                       "Bus frequency not specified, default to 100kHz.\n");
> +               dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
>                 gi2c->clk_freq_out = KHZ(100);
>         }
>
> -       if (has_acpi_companion(&pdev->dev))
> -               ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(&pdev->dev));
> +       if (has_acpi_companion(dev))
> +               ACPI_COMPANION_SET(&gi2c->adap.dev, ACPI_COMPANION(dev));
>
>         gi2c->irq = platform_get_irq(pdev, 0);
> -       if (gi2c->irq < 0) {
> -               dev_err(&pdev->dev, "IRQ error for i2c-geni\n");
> +       if (gi2c->irq < 0)

Commit message doesn't mention removing this print, though checking
platform_get_irq() it looks like it already spams in the case where a
non-EPROBE_DEFER error is returned so I think you're good.

[1] https://lore.kernel.org/r/CAD=FV=U6Yiv5i4PdDFqNhp0STqAvVi_=F_iuKyonx=MsOQFABQ@mail.gmail.com


In any case above things aren't terribly important, so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
