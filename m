Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E09266227
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 17:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgIKPaB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 11:30:01 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:36075 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbgIKP3u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 11:29:50 -0400
Received: by mail-ej1-f66.google.com with SMTP id e23so14365915eja.3;
        Fri, 11 Sep 2020 08:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1L7ouaVwl53aJ/C0pjue7rijbsZk1fSarRvqjzRo/2A=;
        b=CbMTTjjsmyA/hcEjBksOE/sHyAE6i8TM7OZ5uQXHxo0z4hrUipDYwzWxzKGHvzsyMF
         s5fo4i1aiDGjoUUtCFSwtYUB/JWutnlKpCsJo/VIZblgmzceKnj0hIJYtnJeSQijPKWB
         xzGFfPBBoL3Dq7FIFB/31lV0v3eZN3U0ediu1TdpylCMbCDU9IUUhPLaIkJT6fEx2Wny
         tsUSVexB0ke/bQwD6OmL3/Lrh8fRiKH7zcdERJQaK/2ypYXLD7iXH2hvDkB4TKNgocbP
         bLf+Lt50FKbzCXdJUI9/KE4STlEEg8imzfxX0UquOq60lc5GYFpCEO8+hKYZW2H8skRu
         66vA==
X-Gm-Message-State: AOAM531m7KneRPjnWu+xm4c9hicS/Lyb/+ME8mpE66VC3xwDfjlzpesq
        4sFtHy2TE8t1WRjTO5UFz0g=
X-Google-Smtp-Source: ABdhPJxn7jTDwZi5ZOlrQEeLynoOjxot2Skr5RMkSQ65PrDAYi4hyy9lmSIKeLY2io8IfaK7BKOeXg==
X-Received: by 2002:a17:906:386:: with SMTP id b6mr2565409eja.538.1599838187269;
        Fri, 11 Sep 2020 08:29:47 -0700 (PDT)
Received: from kozik-lap ([194.230.155.174])
        by smtp.googlemail.com with ESMTPSA id bf25sm1890178edb.95.2020.09.11.08.29.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 08:29:46 -0700 (PDT)
Date:   Fri, 11 Sep 2020 17:29:43 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        David Lechner <david@lechnology.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] clk: gpio: Simplify with dev_err_probe()
Message-ID: <20200911152943.GA17780@kozik-lap>
References: <20200902150348.14465-1-krzk@kernel.org>
 <20200902150348.14465-4-krzk@kernel.org>
 <159977526650.2295844.8933765686946237404@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <159977526650.2295844.8933765686946237404@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 10, 2020 at 03:01:06PM -0700, Stephen Boyd wrote:
> Quoting Krzysztof Kozlowski (2020-09-02 08:03:42)
> > diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
> > index 38755a241ab7..a3cc53edcb11 100644
> > --- a/drivers/clk/clk-gpio.c
> > +++ b/drivers/clk/clk-gpio.c
> > @@ -211,17 +210,10 @@ static int gpio_clk_driver_probe(struct platform_device *pdev)
> >  
> >         gpio_name = is_mux ? "select" : "enable";
> >         gpiod = devm_gpiod_get(dev, gpio_name, GPIOD_OUT_LOW);
> > -       if (IS_ERR(gpiod)) {
> > -               ret = PTR_ERR(gpiod);
> > -               if (ret == -EPROBE_DEFER)
> > -                       pr_debug("%pOFn: %s: GPIOs not yet available, retry later\n",
> > -                                       node, __func__);
> > -               else
> > -                       pr_err("%pOFn: %s: Can't get '%s' named GPIO property\n",
> > -                                       node, __func__,
> > -                                       gpio_name);
> > -               return ret;
> > -       }
> > +       if (IS_ERR(gpiod))
> > +               return dev_err_probe(dev, PTR_ERR(gpiod),
> 
> This is cool! I wonder if we could make it even more simplified with
> 
> 	ret = dev_err_probe_ptr(dev, ptr, ...)
> 	if (ret)
> 		return ret;
> 
> then we don't have to do the PTR_ERR() or IS_ERR() dance in all the
> drivers. It could already be changed here to look at the return value of
> dev_err_probe() so please do that at the least.

I think this could be achieved with Rob's work here:
git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dev_err-removal

It would make this patchset obsolete. Up to you then if you plan to wait
for Rob's work.


> It would also even be more super duper cool if we had a way to save some
> sort of cookie when the provider can't find it and is returning the
> -EPROBE_DEFER value. Maybe the provider could use
> device_set_deferred_probe_reason() on error and then if dev_err_probe()
> is called without any string it can print what is in the device's
> deferred probe reason? Or append to it whatever string is passed from
> the device driver? Sometimes the provider has more info like the DT
> property is malformed or the provider isn't probed yet which would
> probably help understand the deferred problem more.

Yes, good point. If all (or most) messages are moved to the providers,
it would be easier to print also the defer reasons.

Best regards,
Krzysztof

