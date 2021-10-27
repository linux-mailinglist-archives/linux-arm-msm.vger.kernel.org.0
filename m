Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E96243CB80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 16:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242343AbhJ0OHZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 10:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242290AbhJ0OHZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 10:07:25 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC19C061745
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 07:04:59 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id x135-20020a4a418d000000b002b961605657so272290ooa.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Oct 2021 07:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VntufPEXWFWBoEDKmzIiyo/GIHA3Qut0nsI1RRSquPQ=;
        b=b1UGX9rErTp6W+4QIxehwiD2vWEVnO96A45hsBlatKYdl7QbrI9WKakB84huYPAA2w
         JYUJdbu1vtNCj2vv/XnjFio/MNRKVxv0jYJA3sy56eGrEAqqE4X/xSdj81dBbHmY5KJi
         j4OkPBAufm+jKunkkyK7mDNwpKCezsbDmPS2IcgRImLC7Qxh6SX9cFaOxswfxMzVcFFK
         95H9bsaUc0bpJbZbyjpZFZCziskFTMWhLC4vSVPW5k0xv6ujYE/s6E6W/auOa2e7OGBg
         B8AvE0RYLfATlhqRhvVlpS73eW20bEIuCXxIaeGopdOswiP+vau3eFKGk2+CSG0EvpHS
         r8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VntufPEXWFWBoEDKmzIiyo/GIHA3Qut0nsI1RRSquPQ=;
        b=TCHjMOJqAjBHZEhJsJMBBU/IrovenUcH3njwqLVU0Gx/+vIYzvSWvB5cBjBc7WnWpZ
         jAWCbYY9hLYVH1RKWvaq0Qv0Jj//8MLPcvAWwEqrC4B2o+i+TCOCxzu2nLB97YIeXZ/m
         HWuUW6wvHopV6yQrXenE0ayT8uVtv/Lgl3Vhso5ZKOM8bpit34mQXhlMRAfwhsL6SPFC
         3UR2NCIPHmcW9SDLMjYu7aCeKkrRym7Gcp0piQZkWqInGtEdPIMC1d1MqEd0SV6drS60
         vOjy2ZRBS4tSH11iAH7KoOldeQgKdWtlYucUquziN8v5sZDukQc6FmcQtjVvYGDTba+0
         GBwA==
X-Gm-Message-State: AOAM531Fvn9k7Ehlvo21z8OKTQhSI3ALDUPAbBDw9yzsiOQGwEiMfNEh
        2NFP0jZsuilNu2OFI1wN1/jdtQ==
X-Google-Smtp-Source: ABdhPJyn5syHeDgk5I1YEs92D7gGAaJtHbLqnyK3p9VdwN3sOi7j7PgsxuQuGYkzVcRWjuTLOsK9QQ==
X-Received: by 2002:a4a:de94:: with SMTP id v20mr22599573oou.77.1635343499224;
        Wed, 27 Oct 2021 07:04:59 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id i28sm31734ood.23.2021.10.27.07.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 07:04:58 -0700 (PDT)
Date:   Wed, 27 Oct 2021 07:06:51 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>, linux-pwm@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v7 2/3] drm/bridge: ti-sn65dsi86: Use regmap_bulk_write
 API
Message-ID: <YXlc+7BzbADe/p4A@ripper>
References: <20211025170925.3096444-1-bjorn.andersson@linaro.org>
 <20211025170925.3096444-2-bjorn.andersson@linaro.org>
 <CAG3jFysN4pFqTrF8tGTVapCzysPkvO=MpYosAJnErY-AW7BqgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG3jFysN4pFqTrF8tGTVapCzysPkvO=MpYosAJnErY-AW7BqgQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 27 Oct 01:29 PDT 2021, Robert Foss wrote:

> Hey Bjorn,
> 
> On Mon, 25 Oct 2021 at 19:07, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > The multi-register u16 write operation can use regmap_bulk_write()
> > instead of two separate regmap_write() calls.
> >
> > It's uncertain if this has any effect on the actual updates of the
> > underlying registers, but this at least gives the hardware the
> > opportunity and saves us one transation on the bus.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Did you miss including Dougs R-B from v6? As far as I can tell nothing
> else changed between v6 & v7.
> 

Yes, I missed adding Doug's R-b from v6. I also missed fixing the
spelling of transaction (transation) in the commit message.

Would you be willing to correct these two items as you apply the
patches?

Thanks,
Bjorn

> > ---
> >
> > Changes since v6:
> > - None
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 6154bed0af5b..5b59d8dd3acd 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -193,8 +193,9 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
> >  static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
> >                                    unsigned int reg, u16 val)
> >  {
> > -       regmap_write(pdata->regmap, reg, val & 0xFF);
> > -       regmap_write(pdata->regmap, reg + 1, val >> 8);
> > +       u8 buf[2] = { val & 0xff, val >> 8 };
> > +
> > +       regmap_bulk_write(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
> >  }
> >
> >  static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
> > --
> > 2.29.2
> >
