Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3FA4F0624
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 22:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238027AbiDBU22 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Apr 2022 16:28:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236036AbiDBU21 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Apr 2022 16:28:27 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241E812109E
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Apr 2022 13:26:35 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id gh15so4576832qvb.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 13:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QB0eo72y6FVZ0oU4JIps4fOnMAO+oClDWy1YjIZjL/c=;
        b=WsjkuDwwoa3g9mvKJsL+Y+5IhFD3xsQFVDkNUAS3Mzmr/ZWiDeLtX6UdpE5KCpPAkU
         4DYT/K9KCCotzJ6zlWueDyGuQXB68VflTcz212Ml55fDJYI+Jn7XFwfnxiXCrUr5xZ2B
         yVwU+edqQJ1OkNakKYD+55rEMoNOl15O0DluBw7AgLSZ3ABcDzs48xYfRVTTeHIqPOhb
         S9pl6SmynSKzB4zo3/xu9Puf6lk6lja5bR9vMXBQQKYyqiBJAFInLhgZLZXEnaDFxXr+
         ZtpdliCY5R9nlEndcV3coBblNz9gs7fbixEw9JuNVFMHtHxipiW40TTbzpcGXCOr+BRr
         dBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QB0eo72y6FVZ0oU4JIps4fOnMAO+oClDWy1YjIZjL/c=;
        b=wHAZ0o3MALIChzt+9qnRybaYoHEUJo34oYdXoAeLn9wYU+L1nola16YgPjJ40SaLVi
         ZfL7OzhbNLxfLll+DYwPgqO5AdHZD72n3VwtdCqBlFrBFufl4DgJf7eO7XuSUQ4dzztN
         AoCwQJVoFNHvdIPAra0/9H+kC1aMQP3k23TTohEEKTYvwAX/IpSyXhRIWW43OaD1jREW
         2g9AKjdB8zNhFdFAQ239vYHN6WDwxuFCOE7VAVFWCzxDEcQxgMJL8RzIVR5t0Hdd6qvE
         sJeA4mzicK3D2aiRXoigDGx6HKiL/tzLIaJlh24/TNk4FVu6mt4BXxQE1kuNAYAwuCs0
         GnFQ==
X-Gm-Message-State: AOAM533A7ELgULONsOdNT8R/uqsahduNEctVfzOc2W3RtnNCpPGiXxKM
        p4Cq1KOQX7boHrp5gixKAE645gLBWT8O8iJwQ8zCCw==
X-Google-Smtp-Source: ABdhPJyOclbx6ZxnfFkNqKq1SFZp9RuXDLSvl9rQ8srJRugzrvyKznh3ayrfvwqMdnFoa8uizhMrAJf2kev/oVHQDZs=
X-Received: by 2002:a05:6214:921:b0:443:ce3d:577b with SMTP id
 dk1-20020a056214092100b00443ce3d577bmr1502390qvb.122.1648931194181; Sat, 02
 Apr 2022 13:26:34 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
 <392b933f-760c-3c81-1040-c514045df3da@linaro.org> <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
In-Reply-To: <CAD=FV=W4PYK-t607yjRbfjDjjEZX0KdgHDRukw_vSH8E8EDH6w@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 2 Apr 2022 23:26:22 +0300
Message-ID: <CAA8EJppt9XONbgtKfmHmN+==QNqiVJeb8GKJFdZm=yyY-tgmHQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
To:     Doug Anderson <dianders@chromium.org>
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 2 Apr 2022 at 20:06, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sat, Apr 2, 2022 at 3:37 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On 01/04/2022 02:22, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Wed, Mar 30, 2022 at 9:03 AM Sankeerth Billakanti
> > > <quic_sbillaka@quicinc.com> wrote:
> > >>
> > >> @@ -1547,6 +1593,10 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
> > >>
> > >>          dp_display->encoder = encoder;
> > >>
> > >> +       ret = dp_display_get_next_bridge(dp_display);
> > >> +       if (ret)
> > >> +               return ret;
> > >
> > > It feels weird to me that this is in a function called "modeset_init",
> > > though I certainly don't know the structure of the MSM display code
> > > well enough to fully comment.
> >
> > It's called modeset_init() as it initializes KMS objects used by DP
> > driver. We have similar functions for dsi and hdmi
>
> Sorry, I wasn't meaning to imply that modeset_init() was a bad name or
> anything. Mostly saying that I wasn't sure that modeset init was the
> proper time to populate the aux bus. ...but then again, perhaps it is
> given the current structure of this driver?
>
>
> > > My expectation would have been that
> > > devm_of_dp_aux_populate_ep_devices() would have been called from your
> > > probe routine and then you would have returned -EPROBE_DEFER from your
> > > probe if you were unable to find the panel afterwards.
> >
> > I don't think it's possible to call it from probe() since
> > drm_dp_aux_register() is called only from dp_display_bind().
> > The PHY also isn't initialized at that moment, so we can not probe AUX
> > devices.
> >
> > The overall semantics of the AUX bus is not clear to me.
> > Typically the bus is populated (and probed) when devices are accessible.
> > But for the display related buses this might not be the case.
>
> In general the AUX bus is modeled much like the i2c bus. You probe the
> sub-device when you're able to transfer. Then you can confirm that the
> device is actually there and init the device.
>
>
> > For example for the DSI bus we clearly define that DSI transfer are not
> > possible before the corresponding bridge's (or panel's) enable call.
> >
> > Maybe the same approach should be adopted for the AUX bus. This would
> > allow us to populate the AUX bus before hardware access is actually
> > possible, thus creating all the DRM bridges before the hardware is
> > actually up and running.
>
> So I guess what you're proposing is that you could probe the devices
> under the AUX bus and they could acquire resources (and possibly
> return EPROBE_DEFER) at a point in time _before_ it's actually
> possible to transfer. Then I guess you'd later do the transfer?

Exactly.

>
> I guess conceivably one could re-design the DRM subsystem like that,
> but I don't think it's trivial.

The problem is that the DRM subsystem is already designed like that.
All the bridge chains are static. They are created during the device
probe. And the modes are populated later (via the get_modes()
callback), after the HPD signal is delivered.
For the encoder/bridge chains it is explicitly stated that the display
pipe (clocks and timing signals) are not running before bridge's
enable() callback or after the disable() callback being called.

> Why? I believe that we need to know
> things about the panel at probe time. For instance, we need to be able
> to populate the panel's modes.

As I said, panel modes are not needed at the probe time. The fact that
most (if not all) of the panel drivers provide them in the platform
data (and thus modes are typically populated at the probe time) comes
from the fact that the panel is usually a known static piece of
hardware. With the generic edp-panel this is no longer the case. A
single device handles a (probed) variety of panels.

Compare it with the generic monitor:
We have a known bridge (display-connector.c), so the driver can build
the display chain. However a set of modes is not known till the actual
monitor is plugged into the device.

> To get this information we need the
> EDID which means we need to be able to do a transfer. If we're using
> an AUX backlight we also need to add info about the backlight at probe
> time and that also needs the transfer to work.

Yes, the backlight is the problem in the suggested design. I'm not
sure when panel->backlight has to  be populated for things to work.
If we can set it after the probe but before calling into
mode_set/drm_bridge_chain_enable(), then it should be fine.

> So I guess the net result is maybe we should just keep it where it is.
> Long term I'd be interested in knowing if there's a reason why we
> can't structure the driver so that AUX transfers can happen with less
> intertwining with the rest of the code, but that can happen later. I
> would expect that you'd basically just need clocks and regulators on
> and maybe your PHY on. Ideally with some pm_runtime fun we should be
> able to do that independently with anything else the driver needs to
> do?

Not really. The driver is shared between the DP and eDP. And the DP
(well, combo DP+USB-C) part has quite logical expectations that e.g.
AUX channel is not up until all negotiations about the USB-C altmodes
are done and the HPD event is delivered. This is the source for my
suggestion regarding AUX bus rework/redesign. For non-eDP cases the
connected device becomes known much later than the dp_parser code runs
(and much later than all the bridges are to be instantiated).

Another option would be to keep common drm/msm/dp core code and split
the actual driver code into two distinct code paths: one supporting
DP, another one supporting eDP. I think, up to now we were trying hard
to stay away from such a split.

-- 
With best wishes
Dmitry
