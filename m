Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBAD4DDECF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Mar 2022 17:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236385AbiCRQ04 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Mar 2022 12:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238988AbiCRQ0t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Mar 2022 12:26:49 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921FC160C07
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 09:24:34 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id w4so10848726edc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 09:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vJ9L0V5osggSMXilV0NUxdZ3YODQ2c0ZIQihzHn4ios=;
        b=L11FSvmMxR/S/6J58hseaebFIGaY1w0GQZO0yjGrp1k0/LWn77MPX3oLnVkjnLa5VR
         LTHnw3hZDmkoqVvtsOmvrvAv1apNvoCA4XOtpR8yn3emgjHbyE24KjF+ugN0bagp+Sau
         pFEAfzk+AtQzHPGhS9ydM1oyairTwvQlgkBS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vJ9L0V5osggSMXilV0NUxdZ3YODQ2c0ZIQihzHn4ios=;
        b=Nzz94yMNpSL40dMQKxlDafCo75AI6gYnwSi0ITd72lA0JpxzKKAgBNPD/NmGk2HEkm
         mpDTdA3VbLFa861zO1UWLrQ1bRz9zppMhPq/n5sjEzeEATgMd5BQmBhZjR7+DpZzlvEr
         9LfTMVp3bedA86hAgsMfSHT/0I7/AgyHW0pjpBbI+QnJPH09oYwLim5314UypekSfPgl
         RyWbCGIbKN13E1bcJPudisI8nuHMoqGVNZrZ2nyky/Efn4lBY/+7RNDLOv2hdw63DFMS
         HA//1NdXfRC7p/RbftdXk/7EjcYVM61lLvxf8VkAxPKYbvnfenszoSVscClOF6sUp6BI
         kLJw==
X-Gm-Message-State: AOAM533DceF/uyYyXFKZG+lI3NHiyNxP+OY301mSOk/cPHruH198eCEj
        M4F3y50odzCYdht72UKMnG2P+5brpUetCkjSuN8=
X-Google-Smtp-Source: ABdhPJyuvfzp8HMzEg0yuY9BAX93oAKPBhdNFPOHTHgqLhEMMZDGuq6FqpxGCoZPgJdRrv2OYBnVzg==
X-Received: by 2002:aa7:cf08:0:b0:418:e5f7:b2a1 with SMTP id a8-20020aa7cf08000000b00418e5f7b2a1mr10150541edy.76.1647620673135;
        Fri, 18 Mar 2022 09:24:33 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm3868935ejj.142.2022.03.18.09.24.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 09:24:32 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id a1so11031647wrh.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Mar 2022 09:24:32 -0700 (PDT)
X-Received: by 2002:a5d:4491:0:b0:203:f63a:e89b with SMTP id
 j17-20020a5d4491000000b00203f63ae89bmr3246004wrq.342.1647620671999; Fri, 18
 Mar 2022 09:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-7-git-send-email-quic_sbillaka@quicinc.com> <CAE-0n520pQKM7mFSE_00ER+F9RKUPrN+y4U8fmsxi7FoFMyOrA@mail.gmail.com>
In-Reply-To: <CAE-0n520pQKM7mFSE_00ER+F9RKUPrN+y4U8fmsxi7FoFMyOrA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 18 Mar 2022 09:24:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWF8K9JPJXFSGMRK-HmCi+2jM3aN6Uy7hyDSu1_azF+w@mail.gmail.com>
Message-ID: <CAD=FV=UWF8K9JPJXFSGMRK-HmCi+2jM3aN6Uy7hyDSu1_azF+w@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] drm/msm/dp: wait for hpd high before any sink interaction
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, krzk+dt@kernel.org,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        quic_vproddut@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Mar 17, 2022 at 6:19 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Sankeerth Billakanti (2022-03-16 10:35:51)
> >         The source device should ensure the sink is ready before
> > proceeding to read the sink capability or performing any aux transactions.
> > The sink will indicate its readiness by asserting the HPD line.
> >
> >         The eDP sink requires power from the source and its HPD line will
> > be asserted only after the panel is powered on. The panel power will be
> > enabled from the panel-edp driver.
> >
> >         The controller driver needs to wait for the hpd line to be asserted
> > by the sink.
> >
> > Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_aux.c     |  6 ++++++
> >  drivers/gpu/drm/msm/dp/dp_catalog.c | 23 +++++++++++++++++++++++
> >  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
> >  drivers/gpu/drm/msm/dp/dp_reg.h     |  7 ++++++-
> >  4 files changed, 36 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> > index 6d36f63..2ddc303 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> > @@ -337,6 +337,12 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
> >                 goto exit;
> >         }
> >
> > +       ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
>
> Why are we making aux transactions when hpd isn't asserted? Can we only
> register the aux device once we know that state is "connected"? I'm
> concerned that we're going to be possibly polling the connected bit up
> to some amount of time (0x0003FFFF usecs?) for each aux transfer when
> that doesn't make any sense to keep checking. We should be able to check
> it once, register aux, and then when disconnect happens we can
> unregister aux.

This is for eDP and, unless someone wants to redesign it again, is
just how it works.

Specifically:

1. On eDP you _always_ report "connected". This is because when an eDP
panel is turned off (but still there) you actually have no way to
detect it--you just have to assume it's there. And thus you _always_
register the AUX bus.

2. When we are asked to read the EDID that happens _before_ the normal
prepare/enable steps. The way that this should work is that the
request travels down to the panel. The panel turns itself on (waiting
for any hardcoded delays it knows about) and then initiates an AUX
transaction. The AUX transaction is in charge of waiting for HPD.


For the DP case this should not cause any significant overhead, right?
HPD should always be asserted so this is basically just one extra IO
read confirming that HPD is asserted which should be almost nothing...
You're just about to do a whole bunch of IO reads/writes in order to
program the AUX transaction anyway.


> > +       if (ret) {
> > +               DRM_DEBUG_DP("DP sink not ready for aux transactions\n");
> > +               goto exit;
> > +       }
> > +
> >         dp_aux_update_offset_and_segment(aux, msg);
> >         dp_aux_transfer_helper(aux, msg, true);
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > index fac815f..2c3b0f7 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> > @@ -242,6 +242,29 @@ void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog)
> >         phy_calibrate(phy);
> >  }
> >
> > +int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
> > +{
> > +       u32 state, hpd_en, timeout;
> > +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> > +                               struct dp_catalog_private, dp_catalog);
> > +
> > +       hpd_en = dp_read_aux(catalog, REG_DP_DP_HPD_CTRL) &
> > +                                       DP_DP_HPD_CTRL_HPD_EN;
>
> Use two lines
>
>         hpd_en = dp_read_aux();
>         hpd_en &= DP_DP_HPD_CTRL_HPD_EN;
>
> > +
> > +       /* no-hpd case */
> > +       if (!hpd_en)
> > +               return 0;

I guess reading from hardware is fine, but I would have expected the
driver to simply know whether HPD is used or not. Don't need to read
it from hardware, do we? It's not like it's changing from minute to
minute--this is something known at probe time.


> > +       /* Poll for HPD connected status */
> > +       timeout = dp_read_aux(catalog, REG_DP_DP_HPD_EVENT_TIME_0) &
> > +                                       DP_HPD_CONNECT_TIME_MASK;
> > +
> > +       return readl_poll_timeout(catalog->io->dp_controller.aux.base +
> > +                               REG_DP_DP_HPD_INT_STATUS,
> > +                               state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
> > +                               2000, timeout);

The timeout that comes from hardware is really stored in microseconds?
That's the units of the value passed to readl_poll_timeout(), right?
Looking at your #defines, that means that your max value here is
0x3fff which is 16383 microseconds or ~16 ms. That doesn't seem like
nearly a long enough timeout to wait for a panel to power itself up.

Also: I'm not sure why exactly you're using the timeout in the
register here. Isn't the time you need to wait more about how long an
eDP panel might conceivably need to power itself on? Most eDP panels
I've seen have max delays of ~200 ms. I'd probably just wait 500 ms to
be on the safe side.

-Doug
