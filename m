Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 049397D13F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Oct 2023 18:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjJTQ0q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Oct 2023 12:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjJTQ0p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Oct 2023 12:26:45 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4389A3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Oct 2023 09:26:43 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5a7c011e113so11740487b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Oct 2023 09:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697819203; x=1698424003; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=laCUhecyJPMse9WCZXFmWhJICCZVXR+jQqS99SOAngQ=;
        b=gKUVZbndFDQjIMo8aeoGzBjgs1BstucaQSwAlDNDrc1NU+QkZi4XsMA/ti4sYhDNrv
         msyXDHEFubzMc4OmGIITPDd8MQ1QhNOYj9JVPrSblRpLw2sRhXOnEj3wYs+umU3m7vLe
         3h5YoJqbMdGDsjy6vLH93L0nE9g0mhdOJ1mavsf1s8atrDkcQ3XRAG7/JX/EC7mTSBZt
         HZzwycTAGqaB3g4adLZ31I4o4KYFTbAaH2nSgNiqWTGo76Rk2aUbdsKLjtpqr3KktfQz
         wh2J4Hya7ncB3uNA1H+gG53qXkQZfZjTCPNfzMOAinHFfq8TDZra4Zr3y5NNhaVeNi0h
         Rmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819203; x=1698424003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=laCUhecyJPMse9WCZXFmWhJICCZVXR+jQqS99SOAngQ=;
        b=tAn89isUjynbI0W+k+sxG5IzigacqPZ2+Lz3HekHsqwMzWIN4PCm+WUezsSGHoN+jK
         kWgAkE8XG0GKcUWtcWNuvq559ZZIs6+ebls6hNpEin9mU7ekOGGivh4Az7tVcMByYppD
         GZTsv6olUrvfreQ7tnOokGXgVCXD1ZKEFr/3MnlMPWYkPhJgCCKixUwF8eEAgTfuHY3J
         W17Kx/SIBr+kxn7JRldfdxXiE7arwTZBCOqmRodIDg7qraXFHy4kECKASZV8f9PxNd4z
         CMPHH8y2+4Fm4W/lJ78F30VDIq9fIUlHlMbq8f/GbI8yp5SbVljDgNqcuyfkn/tYilDS
         06ww==
X-Gm-Message-State: AOJu0YwnJdl7csWyK3x8EipfzhML60Te4eiZY8mgNsY6Ekj/Q4Q+5lW6
        yr91luBHmfPuQkVhv00TQy6f34MyyIDd+pXutrs6SQ==
X-Google-Smtp-Source: AGHT+IHlS5lOS1dRyKb32JPUatddf/uU7kGSi+POVALsr0E3HwVcVMoX7GP36MY5ZrltEXBQage+2OuLDlCcdM7+K8s=
X-Received: by 2002:a81:e20a:0:b0:5a8:1844:124d with SMTP id
 p10-20020a81e20a000000b005a81844124dmr2284502ywl.9.1697819203005; Fri, 20 Oct
 2023 09:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231018074627.55637-1-dmitry.baryshkov@linaro.org> <883e40de-7d1d-03fb-014f-74db5b6ab406@quicinc.com>
In-Reply-To: <883e40de-7d1d-03fb-014f-74db5b6ab406@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 20 Oct 2023 19:26:31 +0300
Message-ID: <CAA8EJpr8MdtSYyF5Q==TRo60VD2nx9p6vhjb5CJMoGA2NhmEZw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: attach the DP subconnector property
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 18 Oct 2023 at 12:24, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/18/2023 12:46 AM, Dmitry Baryshkov wrote:
> > While developing and testing the commit bfcc3d8f94f4 ("drm/msm/dp:
> > support setting the DP subconnector type") I had the patch [1] in my
> > tree. I haven't noticed that it was a dependency for the commit in
> > question. Mea culpa.
> >
>
> I agree with you that, we should be setting this in the framework is better.
>
> Will review that one on the other patch.
>
> But yes, we need to fix this regression first.
>
> > Since the patch has not landed yet (and even was not reviewed)
> > and since one of the bridges erroneously uses USB connector type instead
> > of DP, attach the property directly from the MSM DP driver.
> >
> > This fixes the following oops on DP HPD event:
> >
> >   drm_object_property_set_value (drivers/gpu/drm/drm_mode_object.c:288)
> >   dp_display_process_hpd_high (drivers/gpu/drm/msm/dp/dp_display.c:402)
> >   dp_hpd_plug_handle.isra.0 (drivers/gpu/drm/msm/dp/dp_display.c:604)
> >   hpd_event_thread (drivers/gpu/drm/msm/dp/dp_display.c:1110)
> >   kthread (kernel/kthread.c:388)
> >   ret_from_fork (arch/arm64/kernel/entry.S:858)
> >
> > Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Just to note, I'm going to send v2 in the next few days, fixing this
code to also work in eDP.

>
> One question, while reviewing the code, I see you have two calls to
> drm_dp_set_subconnector_property() for the connect and disconnect case.
>
> Why cant we have just one call in dp_display_send_hpd_notification() for
> both cases?

Hmm, I'll have to check.

>
>
> >   drivers/gpu/drm/msm/dp/dp_drm.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> > index 40e7344180e3..e3bdd7dd4cdc 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> > @@ -345,6 +345,9 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
> >       if (IS_ERR(connector))
> >               return connector;
> >
> > +     if (!dp_display->is_edp)
> > +             drm_connector_attach_dp_subconnector_property(connector);
> > +
> >       drm_connector_attach_encoder(connector, encoder);
> >
> >       return connector;



-- 
With best wishes
Dmitry
