Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED861B1F4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 08:57:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgDUG5A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 02:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725940AbgDUG5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 02:57:00 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B81C0C061A0F
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 23:56:58 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id v2so4911242plp.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 23:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TckRE+jObJAFfNE3QH7dFW0hwJQRglQ114oDkBXiq8w=;
        b=aUXYxc+vc+dHVeU1uqo9yVVf4TOmqv2D3amUesUFg+Wr4zFOmy47i5YkscWN+bkG3G
         UODlXYLp0Cp0eKj8eJXQ8I3Vfh9qLysdtpBDUtv9ixwJuIbT0MTergXpp/GEBMRo0bV8
         MgmWAMOnmWiXoWx90nhkQu9DQmtr4K4g2TyoRMoMziHgZmHZr2+fJbwdwl5rx7rBkvUH
         dDvR/iRJSqIk3NPL7tuMnD2nDGJmx6SXihJORPqFVqw/fyrFFhAH4UKJek3AFEl0IpBT
         EB68mZ0V9zEpDy2LDJiWSy+q6aqjqLOvFoLI8nQhB+oG196CMFiRXttdhR67np1I+EZG
         E2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TckRE+jObJAFfNE3QH7dFW0hwJQRglQ114oDkBXiq8w=;
        b=R15gsMf2mOsGmI8g/QKDtAi45fiMxLgXL7eJDvybZTUjER6qD9IZdFIYHPvQ2GMU8j
         0Mx9uuctkoLF9isH6Kfnvsyz54fPItjAreVzQqKMItc/XQK20ygyKAdIezwYcbohVO5S
         9Aqtk6gdFuviUHEGc6bF9JN7sTMxShYWFXiplVr6MHD2Xo/F2PehapfuGQzNrcCgj71r
         CGe/5BDaSByNPARowUzFJfLsDvUgR+Y+V9w4PvS6LHDTVXEkUC5tC7s+7VL2uWF5VAAs
         xP1aWlxO36GZM+F3v/qkNZvUTdgrJz5x/UrZRFGLh0h8dWBl88vVD/blXayBQJeq+Moe
         RXQQ==
X-Gm-Message-State: AGi0Pubyyy9GS0w0wpTesC+fz4NeXNpJtzWXpXbsRosrpNBzOJxJpTKU
        ChwCxawVAHYRuOL8FcUoF38X9w==
X-Google-Smtp-Source: APiQypJqJ+4EqJfHE3sYHsS40LYAqT90GUXHBVRUYOqekJ2NonThFqrPUdvVZq1Y9iPw85aoIflkyg==
X-Received: by 2002:a17:90a:2526:: with SMTP id j35mr3751249pje.98.1587452218149;
        Mon, 20 Apr 2020 23:56:58 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l30sm1332883pgu.29.2020.04.20.23.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 23:56:57 -0700 (PDT)
Date:   Mon, 20 Apr 2020 23:57:22 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Srinivas Rao L <lsrao@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: rpmh: Dirt can only make you dirtier, not
 cleaner
Message-ID: <20200421065722.GV576963@builder.lan>
References: <20200417141531.1.Ia4b74158497213eabad7c3d474c50bfccb3f342e@changeid>
 <20200420203107.GR576963@builder.lan>
 <CAD=FV=WVqdpNyCmtDFb1t_BZiu=7QbMNTr91Pfm1Jd3V6CMhrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WVqdpNyCmtDFb1t_BZiu=7QbMNTr91Pfm1Jd3V6CMhrA@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 20 Apr 13:47 PDT 2020, Doug Anderson wrote:

> Hi,
> 
> On Mon, Apr 20, 2020 at 1:30 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Fri 17 Apr 14:15 PDT 2020, Douglas Anderson wrote:
> >
> > > Adding an item into the cache should never be able to make the cache
> > > cleaner.  Use "|=" rather than "=" to update the dirty flag.
> > >
> >
> > This is correct...
> >
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >
> > > Fixes: bb7000677a1b ("soc: qcom: rpmh: Update dirty flag only when data changes")
> > > Reported-by: Stephen Boyd <swboyd@chromium.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > >
> > >  drivers/soc/qcom/rpmh.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
> > > index 3abbb08cd6e1..d1626a1328d7 100644
> > > --- a/drivers/soc/qcom/rpmh.c
> > > +++ b/drivers/soc/qcom/rpmh.c
> > > @@ -151,10 +151,10 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
> > >               break;
> > >       }
> > >
> > > -     ctrlr->dirty = (req->sleep_val != old_sleep_val ||
> > > -                     req->wake_val != old_wake_val) &&
> > > -                     req->sleep_val != UINT_MAX &&
> > > -                     req->wake_val != UINT_MAX;
> > > +     ctrlr->dirty |= (req->sleep_val != old_sleep_val ||
> > > +                      req->wake_val != old_wake_val) &&
> > > +                      req->sleep_val != UINT_MAX &&
> > > +                      req->wake_val != UINT_MAX;
> >
> > ...but this logic says dirty "if either sleep or wake has changed and
> > both sleep and wake are requested".
> >
> > So what if we have an entry with only sleep wake changed, then the
> > controller won't be dirty and hence the hardware won't know about this
> > request - until another "fully specified" request comes in, which would
> > cause the controller to be dirty and flush out the "partially specified"
> > request as well.
> >
> > Is this really the expected behavior?
> 
> IIRC, this has to do with how is_req_valid() works and how it's called
> from rpmh_flush().  ...but since I clearly screwed up the "|=" in the
> past let's see if I screwed this up too.  ...errr, what I mean to say
> is that I never make any mistakes.  Ever.  How dare you accuse me of
> such a thing?  ;-)
> 
> So is_req_valid() says that a request is valid if all three of these are true
> * Sleep is not UINT_MAX
> * Wake is not UINT_MAX
> * Sleep is not equal to wake
> 
> If a request is not valid then rpmh_flush will ignore it, it won't be
> sent, and it's as if it wasn't even in the cache.  Also: It's not
> expected that anyone will ever change a value _to_ UINT_MAX, so once
> something is initialized it's never uninitialized (NOTE: I don't think
> anything actually enforces this).
> 
> The above means that until both sleep and wake have changed away from
> their default of UINT_MAX that they can't really dirty the cache
> because we act as if they're not even in the cache.  Once they get
> something then the cache gets dirty if either sleep changes or wake
> changes.
> 
> 
> So I think the logic is right...  Does that make sense?
> 

Okay, that makes sense. Iirc how the RPMh deals with entering and
exiting the sleep state having one without the other shouldn't be valid,
so it sounds like we're good here.

Thanks for the explanation, applied the patch.

Regards,
Bjorn
