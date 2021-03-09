Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6735F331DA7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 04:43:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhCIDmr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 22:42:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhCIDmq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 22:42:46 -0500
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8CA0C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Mar 2021 19:42:46 -0800 (PST)
Received: by mail-oi1-x232.google.com with SMTP id y131so10588038oia.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Mar 2021 19:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DaRZhYEEBuJEs4sQSMc6XWN+waZ/3FyxtXVqXDmVOaU=;
        b=EWT0/MPAHuLAOBljfoZ3xCtbHBzrc6V0lmjkneRaAoQgGjTesU2ilzqb7S8037eBZ2
         drsSbjOFJkpfCr2dJqpqm2w4zyrvvnqNNGYghYjDwaXnZq2iNtAmTS1Mpn9uvV9zaSTn
         FnPrSFRySpZJc6vMwaRXPLgHjiYP/vnjyWLpgHhVuuJdS6QRoj9WeFdIc0BuLe4GMOmD
         xPWxZUsQX586SoUfNRuG5lzYzY/rSUZk8GIqobdnvjFO1H68D/chct7sHIU7CMNlExnD
         MzrvFX/Sk4MWcKKLT/yrpVhrIUYlLU+Lh19AfTKEnhI9wxJ4GeVBm2vAdJIW4s7IUGBa
         K1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DaRZhYEEBuJEs4sQSMc6XWN+waZ/3FyxtXVqXDmVOaU=;
        b=a6/vUJrgSVf9g4ljQtlDj6Mlqp3OXps0IpHMr+KvCoc65gG4Y+ZfWDBsTF5K+5dnJ5
         FTxlX+l/vw4wbI5tTKwExygtvfL2W+Wr3Cr1RcW1YeVPqO/nClbSnDAOXMYaZJD2RS2x
         /K7IqFqTxPGwx0PIUH9xdjXa8Ki8h6PyHM4P7tl55xKpkodCcxy4SsscAhh5lRjeyjdw
         TaWVXMSc2wuVH9Vob4MYEXNQBF1b9rXMHrTin/fwv9yqdI6KTit4oN8LPbc7DXhiczTf
         AITbx2jFk53DeiYSRnBcFjBn4nozTPCOIUDMNmEXXFwtAFEGokGVj5vU/P+pMTn+ZHdh
         9Yyg==
X-Gm-Message-State: AOAM532KLw9C+14t+P6glFCK7l/WJDDjx63p5ceDBoYlz0caWGD8ctit
        Wn31h+ZfKF/qoISVEsCQsuKTpQ==
X-Google-Smtp-Source: ABdhPJwOQ6vWNofAqiJzM6bxhOiD9P9srP3HMScfHu6lXONniGIJP9Bir5NurI5VvG+dhvgqB4j9Zw==
X-Received: by 2002:aca:3c87:: with SMTP id j129mr1604484oia.4.1615261366080;
        Mon, 08 Mar 2021 19:42:46 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v66sm2608317otb.16.2021.03.08.19.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 19:42:45 -0800 (PST)
Date:   Mon, 8 Mar 2021 21:42:43 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/2] pinctrl: qcom: sc8180x: drop the use of tiles
Message-ID: <YEbus+4iOde4A0/X@builder.lan>
References: <20210304060520.24975-1-shawn.guo@linaro.org>
 <20210304060520.24975-2-shawn.guo@linaro.org>
 <YEbKcOwr/c1fPFLQ@builder.lan>
 <20210309025604.GQ17424@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309025604.GQ17424@dragon>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 08 Mar 20:56 CST 2021, Shawn Guo wrote:

> On Mon, Mar 08, 2021 at 07:08:00PM -0600, Bjorn Andersson wrote:
> > On Thu 04 Mar 00:05 CST 2021, Shawn Guo wrote:
> > 
> > > To support both ACPI and DT, it makes more sense to not use tiles for
> > > pinctrl-sc8180x driver, as ACPI table describes TLMM block with one
> > > single memory resource.  Since DTS of SC8180X hasn't landed, there is
> > > still chance to align DT description with ACPI.
> > > 
> > 
> > I don't like the idea that we make up addresses to put in the DT to fit
> > what was put in the DSDT. It is 3 different memory regions, with things
> > in-between that Linux shouldn't touch.
> 
> This is not a new idea but something pinctrl-sdm845 has been doing for
> years.  And IMHO, it's not a bad idea but a reasonable compromise.
> 

SDM845 was the first platform where the previous contiguous TLMM block
was split up in tiles, at the time we didn't see a need to split it up.

But then we hit QCS404 (iirc) where one of the tiles was way off and
concluded that we needed the DT binding to actually represent the
hardware - so the tiles concept was introduced.

Unfortunately introducing the tiles back into sdm845 would cause issues
with existing DT, so that has not happened.

> > Isn't it possible to during ACPI probe take reg 0 and register the 3
> > named regions instead?
> 
> It is possible.  But let's see what it takes.  We will need to have some
> quirk handling in the ACPI core to detect TLMM device on Flex 5G
> machine, and then override the memory resource registration for that
> device.  Myself is not even convinced this is a good solution, not
> mentioning whether ACPI maintainers will accept it.
> 

I don't think this quirk should belong in the core. Can't you massage
the resources once you're in the probe function in pinctrl-sc8180x.c? Or
the platform resources can't be modified when we reach that point?

Regards,
Bjorn
