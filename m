Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1879E1D379C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 19:08:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbgENRI0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 13:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbgENRIZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 13:08:25 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A3DC061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 10:08:25 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id n18so1583971pfa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 10:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uUcyf9NwOhWDSsoXsAafDnpXglCvcvKACjl1qcHNAFk=;
        b=m1/voEXyUnijavkOQ2KcCoSjVH54gh9UOXPA7PAvf7E+8JFUn7g+xt6iYEALFHnLnA
         QF2divI3/3Aldqgbubwmwyp+pXVy9GbeZAOV9LSANKIBjmYqK9sNAYffdkL1GzI0IDqU
         LKofRS/Sz9SINnKubmGRLNW81UD9AqjrjY3Wm07fSjPTGjjJ77uHHyIQqeY4Itm+sc8e
         lImgcyfqOZD4/XX1a3LdUnp5EscjmX1ByO20ve6PERtwuIefl5Bmj3qsjLsPdA8U7bZL
         epydIx60tjNt9FI9WbTRy2EpfwUU92JbmjKT32P2o2JzzW9oAQiY0FS/wUhZYOorfpei
         Tk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uUcyf9NwOhWDSsoXsAafDnpXglCvcvKACjl1qcHNAFk=;
        b=uJEUl+6LgDSGbWcjOWpB0rRKBl6O3fgPY1PrZDYLyTl+n1C6ioNUw8e30XMCKABUUz
         uv9wK/r7+ufUqy1aSLMOrYgr9Jo0m5bDBUOWcsJJtmNipAobgVZ+LVAp43RZaju4gZsK
         7KFOr2NONihzscLPfny+/bOgzNIqcZZr6DSjwa7mPX0vuaWvYhtZ5jzuvjCEzia8PY42
         +2KbYRP1FbFAFbcoPuK7lVSUzPbSRrKRJPFEmNxZl4/Cs9at/XAaZrhkwBMhrKGG19/H
         NXZwJONTrITN9+bRgN9/h7NwzPL+SJ32ihac0amH4Thcrxk6I/SVQR7j1DbB05LO5qRI
         xiWw==
X-Gm-Message-State: AOAM531S3/jKweBZzC+QctZxKZ0TkKEj+UDNO/xp79UFhbg4acCqDn/n
        gCtfJUZWphIZxVLGyErhRGB4fw==
X-Google-Smtp-Source: ABdhPJzsIEv8c2T+CBe2MehVpzlYUEhQ5SEp4znGfWcviT0qA6+Uh7WohNI59SLjpioEdJ1m5ct7OQ==
X-Received: by 2002:a65:6703:: with SMTP id u3mr4771334pgf.179.1589476105048;
        Thu, 14 May 2020 10:08:25 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j186sm2754328pfb.220.2020.05.14.10.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 10:08:24 -0700 (PDT)
Date:   Thu, 14 May 2020 10:06:54 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Baolin Wang <baolin.wang7@gmail.com>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] hwspinlock: qcom: Allow mmio usage in addition to
 syscon
Message-ID: <20200514170654.GY2165@builder.lan>
References: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
 <20200513005441.1102586-4-bjorn.andersson@linaro.org>
 <CADBw62oF=o4xxar8yO+xwhLa3h2oD_GD_tWhFo1DDTJGgFnEjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADBw62oF=o4xxar8yO+xwhLa3h2oD_GD_tWhFo1DDTJGgFnEjg@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 12 May 20:57 PDT 2020, Baolin Wang wrote:

> On Wed, May 13, 2020 at 8:55 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > In all modern Qualcomm platforms the mutex region of the TCSR is forked
> > off into its own block, all with a offset of 0 and stride of 4096. So
> > add support for directly memory mapping this register space, to avoid
> > the need to represent this block using a syscon.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >  drivers/hwspinlock/qcom_hwspinlock.c | 72 +++++++++++++++++++++-------
> >  1 file changed, 56 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
[..]
> > +static struct regmap *qcom_hwspinlock_probe_mmio(struct platform_device *pdev,
> > +                                                u32 *offset, u32 *stride)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +       struct resource *res;
> > +       void __iomem *base;
> > +
> > +       /* All modern platform has offset 0 and stride of 4k */
> > +       *offset = 0;
> > +       *stride = 0x1000;
> > +
> > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       base = devm_ioremap_resource(&pdev->dev, res);
> 
> I think you can use devm_platform_ioremap_resource(pdev, 0) to
> simplify your code, otherwise looks good to me.

You're right, I better fix this before someone with Coccinelle get the
chance ;)

> Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>
> 

Thanks,
Bjorn
