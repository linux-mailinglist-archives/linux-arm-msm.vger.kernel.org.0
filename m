Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37D6864D480
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 01:17:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiLOARg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 19:17:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiLOARN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 19:17:13 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A518E5B589
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 16:14:58 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id gh17so48558283ejb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 16:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JksENWg0mHiBla2rAma/eo8ORkZkU6LETkySUkD8cxk=;
        b=UusWUebN7mlxwVGhTYr7zsNvvf2hEZi+CA57ijbfdY/KnuzUTvXCj4CaP+v/zEmQq2
         JSIr/39zUO4gWaglhhT186eMsnOhRxXkqoSOsiswigEaGjk8T9hjGDYgdFMAbi9fDxk/
         pQW5GGYM9yhaVvETC52cruIqRR578zRFhCC3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JksENWg0mHiBla2rAma/eo8ORkZkU6LETkySUkD8cxk=;
        b=NMBV2mpeQLNGlm1jdJOk1s27ch033E3qKGl2iperTcaYoUyT+8n7gSNzFkK9Ys8yzz
         IedPOGZlWqENC3d3ges5HNiUBblHDR5m57hFeL/kb8piOugnkfz3bNMiGgGFCoBn+70K
         480kIEvtUJKOiQBc+59WM7rugr1yrotUuAsc3PPb54ZIGuSkNznjzszQqYIk9+vlq0Et
         28pk0BD+RCGaCV3noFPdDEAdiA565C2Y5pvC3Jsf388JsFKHH/1SGlTuvi5KiPkiKhV0
         dS8tjbB6mM7ajhb3eBoWLWv+U8F3QES0FSnBO23AG7qiZiCl/o+AmoN5sidLgJ4Kjmcg
         e+Yw==
X-Gm-Message-State: ANoB5pmO4YCxAR6CZU+R5vH1HtJWyJHxJ1xTlZ2yf1/O+lo8wTGS+0M1
        D6BdjjD+qm6L5ntl+5KEpsuwEphInCG0m5YyyZU=
X-Google-Smtp-Source: AA0mqf7n01bFhRLYyCwmZnDGVVKSv/ad0/uULh2To+Fe4yPpfe/jXvmGDpmVLbf+b45CG1osSWtUOQ==
X-Received: by 2002:a17:907:88cd:b0:7c1:932c:96d7 with SMTP id rq13-20020a17090788cd00b007c1932c96d7mr6801275ejc.58.1671063297079;
        Wed, 14 Dec 2022 16:14:57 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id kw17-20020a170907771100b0078d22b0bcf2sm6365325ejc.168.2022.12.14.16.14.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 16:14:55 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id o15so12635297wmr.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 16:14:54 -0800 (PST)
X-Received: by 2002:a05:600c:298:b0:3cf:7716:8954 with SMTP id
 24-20020a05600c029800b003cf77168954mr348637wmk.57.1671063294548; Wed, 14 Dec
 2022 16:14:54 -0800 (PST)
MIME-Version: 1.0
References: <1671052890-11627-1-git-send-email-quic_khsieh@quicinc.com>
 <CAD=FV=UTeCU7BcfPMXz8J-9uOp_7Fn9PFdtFMsu46x5wKa0RyQ@mail.gmail.com> <512f9f0d-a399-27fb-08d0-7311b73fd2a1@quicinc.com>
In-Reply-To: <512f9f0d-a399-27fb-08d0-7311b73fd2a1@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Dec 2022 16:14:42 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VvP8Xe+wrMrKymetQ8X9-771m7jM7o1kRQz+oxXdRptg@mail.gmail.com>
Message-ID: <CAD=FV=VvP8Xe+wrMrKymetQ8X9-771m7jM7o1kRQz+oxXdRptg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if irq
 is not for aux transfer
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org,
        daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
        dmitry.baryshkov@linaro.org, andersson@kernel.org,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Dec 14, 2022 at 3:46 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Doug
>
> On 12/14/2022 2:29 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Dec 14, 2022 at 1:21 PM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>
> >> There are 3 possible interrupt sources are handled by DP controller,
> >> HPDstatus, Controller state changes and Aux read/write transaction.
> >> At every irq, DP controller have to check isr status of every interrupt
> >> sources and service the interrupt if its isr status bits shows interrupts
> >> are pending. There is potential race condition may happen at current aux
> >> isr handler implementation since it is always complete dp_aux_cmd_fifo_tx()
> >> even irq is not for aux read or write transaction. This may cause aux read
> >> transaction return premature if host aux data read is in the middle of
> >> waiting for sink to complete transferring data to host while irq happen.
> >> This will cause host's receiving buffer contains unexpected data. This
> >> patch fixes this problem by checking aux isr and return immediately at
> >> aux isr handler if there are no any isr status bits set.
> >>
> >> Follows are the signature at kernel logs when problem happen,
> >> EDID has corrupt header
> >> panel-simple-dp-aux aux-aea0000.edp: Couldn't identify panel via EDID
> >> panel-simple-dp-aux aux-aea0000.edp: error -EIO: Couldn't detect panel nor find a fallback
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >> ---
> >>   drivers/gpu/drm/msm/dp/dp_aux.c | 7 +++++++
> >>   1 file changed, 7 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> >> index d030a93..8f8b12a 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> >> @@ -423,6 +423,13 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
> >>
> >>          isr = dp_catalog_aux_get_irq(aux->catalog);
> >>
> >> +       /*
> >> +        * if this irq is not for aux transfer,
> >> +        * then return immediately
> >> +        */
> >
> > Why do you need 4 lines for a comment that fits on one line?
> Yes, we can fit this to one line.
> >
> >> +       if (!isr)
> >> +               return;
> >
> > I can confirm that this works for me. I could reproduce the EDID
> > problems in the past and I can't after this patch. ...so I could give
> > a:
> >
> > Tested-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'm not an expert on this part of the code, so feel free to ignore my
> > other comments if everyone else thinks this patch is fine as-is, but
> > to me something here feels a little fragile. It feels a little weird
> > that we'll "complete" for _any_ interrupt that comes through now
> > rather than relying on dp_aux_native_handler() / dp_aux_i2c_handler()
> > to specifically identify interrupts that caused the end of the
> > transfer. I guess that idea is that every possible interrupt we get
> > causes the end of the transfer?
> >
> > -Doug
>
> So this turned out to be more tricky and was a good finding from kuogee.
>
> In the bad EDID case, it was technically not bad EDID.
>
> What was happening was, the VIDEO_READY interrupt was continuously
> firing. Ideally, this should fire only once but due to some error
> condition it kept firing. We dont exactly know why yet what was the
> error condition making it continuously fire.
>
> In the DP ISR, the dp_aux_isr() gets called even if it was not an aux
> interrupt which fired (so the call flow in this case was
> dp_display_irq_handler (triggered for VIDEO_READY) ---> dp_aux_isr()
> So we should certainly have some protection to return early from this
> routine if there was no aux interrupt which fired.
>
> Which is what this fix is doing.
>
> Its not completing any interrupt, its just returning early if no aux
> interrupt fired.

...but the whole problem was that it was doing the complete() at the
end, right? Kuogee even mentioned that in the commit message.
Specifically, I checked dp_aux_native_handler() and
dp_aux_i2c_handler(), both of which are passed the "isr". Unless I
messed up, both functions already were no-ops if the ISR was 0, even
before Kuogee's patch. That means that the only thing Kuogee's patch
does is to prevent the call to "complete(&aux->comp)" at the end of
"dp_aux_isr()".

...and it makes sense not to call the complete() if no "isr" is 0.
...but what I'm saying is that _any_ non-zero value of ISR will still
cause the complete() to be called after Kuogee's patch. That means
that if any of the 32-bits in the "isr" variable are set, that we will
call complete(). I'm asking if you're sure that every single bit of
the "isr" means that we're ready to call complete(). It feels like it
would be less fragile if dp_aux_native_handler() and
dp_aux_i2c_handler() (which both already look at the ISR) returned
some value saying whether the "isr" contained a bit that meant that
complete() should be called.

-Doug
