Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 560AD2DB2E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 18:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730399AbgLORna (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 12:43:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729206AbgLORn3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 12:43:29 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34EBAC06179C
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 09:42:49 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id j22so10922974eja.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 09:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OyPmNltZPbkGiq8ZU3o70mtt59kIUHa7iWyeMCJtAkM=;
        b=Tufg4rnymzNGJ4FWuhTaQkgREaEC6hpftCK9k82W0d40B1tsKbE0xyv8fZgtbdoXi/
         MERjB/URiKpEZ36bB0stcV3RDsxy6vIhlPAX683NQmqd+MXJ5XMBprfEXf3uXqcl/FM4
         4IfPF9yxOwTN8PhFmAGDPGJMd6leaPwLsfO/zo+2cbce9YiCL17SFguxblJoXsbZp9k8
         rmRsmaWOHgws7YnDAAEhQDpj4Kx1hx7ot2pCLO34Go6Qll51odyA3ZqdyqzlHHG5xZGv
         u4iolhTaxS1r8A97MRe9/mtpPSSqvqnseyMuuRA4Vxx5W6PdInZQsJYFl+jMx6H+rMmS
         ktGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OyPmNltZPbkGiq8ZU3o70mtt59kIUHa7iWyeMCJtAkM=;
        b=CptU3V2NpaQUggRAd9DEs1sAgciOF6Ecn8IB01KsqJT3IR5egyc61AzS/feelx2gw6
         gPFfttLotsRlINQdB1rXD4TskI1niHMtm3XqGmlXKCkV82UGh04hG3uFiX9pyBMozdcW
         yH4HF9sVd2PyxutY+MHj5F3TzhDJTmbQ1hmzRnK0JLLFzNK8+Bv4Im08F5WIgzveNMPC
         CFsgxohRyapfxX2VWoZQNSQLLUPjq2xxcMS9U+4WMkPLI5eBAtJVSjkqH2FXAgd50BRw
         EhylR3ObdkTmEDlY+/6SuzTMzKr03AaqAEd2Y00T2dwsGAuhlLRQ59gg7SR1MLI+Mg/1
         /z+Q==
X-Gm-Message-State: AOAM531cjZPyYM5JmXKM8PTB1z6zFOCkRtM/pfTeKv1tS1085Ag6NcJa
        1lPodEVWMoj2Hg0fBcbF20DUYUdLlG9xPq1G1bvvaA==
X-Google-Smtp-Source: ABdhPJyVvqSTbNHHHW4kF1g4sRUiqfgJZk2qzLdhyM84F2Np4FiwE7Sa9FtzuZAZg2/pNwrNQjMts+ItUsNxXSIVUC4=
X-Received: by 2002:a17:906:d8dc:: with SMTP id re28mr27995623ejb.168.1608054167838;
 Tue, 15 Dec 2020 09:42:47 -0800 (PST)
MIME-Version: 1.0
References: <20201215170308.2037624-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201215170308.2037624-1-bjorn.andersson@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 15 Dec 2020 18:42:36 +0100
Message-ID: <CAMpxmJU0XWxiYr716MNGnORJJJ-czuBGWNnFTa5oBTUK4uVheQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: Allow name duplicates of "" and "NC"
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 15, 2020 at 6:02 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Not all GPIO pins are exposed to the world and this is typically
> described by not giving these lines particular names, commonly "" or
> "NC".
>
> With the recent introduction of '2cd64ae98f35 ("gpiolib: Disallow
> identical line names in the same chip")' any gpiochip with multiple such
> pins will refuse to probe.
>
> Fix this by treating "" and "NC" as "no name specified" in
> gpio_name_to_desc()
>
> Fixes: 2cd64ae98f35 ("gpiolib: Disallow identical line names in the same chip")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> The introduction of 2cd64ae98f35 breaks pretty much all Qualcomm boards and
> grepping the DT tree indicates that other vendors will have the same problem.
>
> In addition to this the am335x-* boards will also needs "[NC]", "[ethernet]",
> "[emmc"], "[i2c0]", "[SYSBOOT]" and "[JTAG]" added to this list to allow
> booting v5.11 with the past and present dtb/dts files.
>
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index b3340ba68471..407ba79ae571 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -302,7 +302,7 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
>         struct gpio_device *gdev;
>         unsigned long flags;
>
> -       if (!name)
> +       if (!name || !strcmp(name, "") || !strcmp(name, "NC"))
>                 return NULL;
>
>         spin_lock_irqsave(&gpio_lock, flags);
> --
> 2.29.2
>

I have a bad feeling about this. This opens the door for all kinds of
exceptions: "N/A", "none" etc. Depending on whose boards are getting
broken.

If non-uniqueness of names is needed then let's better revert 2cd64ae98f35.

Bartosz
