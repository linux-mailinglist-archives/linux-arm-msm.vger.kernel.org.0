Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 455834F0527
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 19:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358689AbiDBRId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Apr 2022 13:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358683AbiDBRId (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Apr 2022 13:08:33 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E806FDE92C
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Apr 2022 10:06:40 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id d10so1572461edj.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 10:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5VLKCCSpyLmISzla9N+/XjTX+JlDxz/a8/Khh5Jtd44=;
        b=EBQqUAyAT2mFgxAKYH2mUSOPgB8C0WKxoSl2rV5zFX5XrqYk/q4IfaW3dN8mTnyRaK
         6GqdOmrmI+L2/7nD1BufbrQsZ9zwdhDQ43hGb4cJD8bbwF4a2c0hp1ZpB2K0ikTBCCm1
         Qas1Q/6mJyz1+zmx9g8I5NTiOnNndaJ0Fh+pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5VLKCCSpyLmISzla9N+/XjTX+JlDxz/a8/Khh5Jtd44=;
        b=JOpHbGNEQGIqGYjcmxdWrbOAt+DUI/oxrJ6rFcv3QGu+VnI7/Y+D0vXpSQv8Nxf/TB
         dQi4u1BaZEcz4gvUIgWklQyeeSr2O6BWBNGanNciFu9LOttwOtktBQ7M8UoiCwsiIJrl
         hlp/i5szHjENBYYjGGInOnU6WsOfeIXAKTCDng4VLi81KKowPDNOR27PoL3AHTItDjbY
         X18bkWzQB0qd4A1e2tQMUl0AHRqqKywUmM9uwHrbqs16PbM0caNhH5aVt1wl3sHsjZyh
         9F5VuKLNCvgrJ7RwziSZadgbIL8b36GVYKV7G4Keg3Q2KZoTXrb8i5Kuf5avQAx2l5WT
         jyqg==
X-Gm-Message-State: AOAM530Y1hZNh2mnRefs6It2kzcVaP+65lRmViGnwoES/klEFFrYxs3c
        CVWohGSq6AY9MeofIWiAhTt8JoJLcNcCoA==
X-Google-Smtp-Source: ABdhPJzT2igTHtm5r5lL8TXC+ZmJwh6ktZ81Q7r2H/yUg8PsOYYKhbc1Rl8i5xDJXSQ57f3bonItRA==
X-Received: by 2002:aa7:c345:0:b0:419:12ae:449c with SMTP id j5-20020aa7c345000000b0041912ae449cmr25970781edr.300.1648919199173;
        Sat, 02 Apr 2022 10:06:39 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id gg7-20020a170906e28700b006e73ac96f99sm339462ejb.224.2022.04.02.10.06.38
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Apr 2022 10:06:38 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id u16so8413095wru.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 10:06:38 -0700 (PDT)
X-Received: by 2002:a5d:5551:0:b0:203:f916:e319 with SMTP id
 g17-20020a5d5551000000b00203f916e319mr11736269wrw.422.1648919197780; Sat, 02
 Apr 2022 10:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com> <392b933f-760c-3c81-1040-c514045df3da@linaro.org>
In-Reply-To: <392b933f-760c-3c81-1040-c514045df3da@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Sat, 2 Apr 2022 10:06:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
Message-ID: <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        quic_kalyant <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        quic_vproddut <quic_vproddut@quicinc.com>,
        quic_aravindh@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Apr 2, 2022 at 3:37 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 01/04/2022 02:22, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Mar 30, 2022 at 9:03 AM Sankeerth Billakanti
> > <quic_sbillaka@quicinc.com> wrote:
> >>
> >> @@ -1547,6 +1593,10 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> >>
> >>          dp_display->encoder = encoder;
> >>
> >> +       ret = dp_display_get_next_bridge(dp_display);
> >> +       if (ret)
> >> +               return ret;
> >
> > It feels weird to me that this is in a function called "modeset_init",
> > though I certainly don't know the structure of the MSM display code
> > well enough to fully comment.
>
> It's called modeset_init() as it initializes KMS objects used by DP
> driver. We have similar functions for dsi and hdmi

Sorry, I wasn't meaning to imply that modeset_init() was a bad name or
anything. Mostly saying that I wasn't sure that modeset init was the
proper time to populate the aux bus. ...but then again, perhaps it is
given the current structure of this driver?


> > My expectation would have been that
> > devm_of_dp_aux_populate_ep_devices() would have been called from your
> > probe routine and then you would have returned -EPROBE_DEFER from your
> > probe if you were unable to find the panel afterwards.
>
> I don't think it's possible to call it from probe() since
> drm_dp_aux_register() is called only from dp_display_bind().
> The PHY also isn't initialized at that moment, so we can not probe AUX
> devices.
>
> The overall semantics of the AUX bus is not clear to me.
> Typically the bus is populated (and probed) when devices are accessible.
> But for the display related buses this might not be the case.

In general the AUX bus is modeled much like the i2c bus. You probe the
sub-device when you're able to transfer. Then you can confirm that the
device is actually there and init the device.


> For example for the DSI bus we clearly define that DSI transfer are not
> possible before the corresponding bridge's (or panel's) enable call.
>
> Maybe the same approach should be adopted for the AUX bus. This would
> allow us to populate the AUX bus before hardware access is actually
> possible, thus creating all the DRM bridges before the hardware is
> actually up and running.

So I guess what you're proposing is that you could probe the devices
under the AUX bus and they could acquire resources (and possibly
return EPROBE_DEFER) at a point in time _before_ it's actually
possible to transfer. Then I guess you'd later do the transfer?

I guess conceivably one could re-design the DRM subsystem like that,
but I don't think it's trivial. Why? I believe that we need to know
things about the panel at probe time. For instance, we need to be able
to populate the panel's modes. To get this information we need the
EDID which means we need to be able to do a transfer. If we're using
an AUX backlight we also need to add info about the backlight at probe
time and that also needs the transfer to work.


So I guess the net result is maybe we should just keep it where it is.
Long term I'd be interested in knowing if there's a reason why we
can't structure the driver so that AUX transfers can happen with less
intertwining with the rest of the code, but that can happen later. I
would expect that you'd basically just need clocks and regulators on
and maybe your PHY on. Ideally with some pm_runtime fun we should be
able to do that independently with anything else the driver needs to
do?

-Doug
