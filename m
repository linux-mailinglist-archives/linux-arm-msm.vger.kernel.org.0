Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2CB753A53D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jun 2022 14:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243050AbiFAMlJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jun 2022 08:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352403AbiFAMlH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jun 2022 08:41:07 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9195E6FA00
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jun 2022 05:41:06 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id x17so2189643wrg.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jun 2022 05:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=82D84xfOz9UFhgLk1p0WJgUaCXHpLRzcEqRYu6sSb2s=;
        b=bdxF3/DXO4qlpxqkXTrRROXDIzdPmZxYjgx2PxYdOKJuSWBn8HLo4nATCcT0DKW9KH
         Cijrvdvd0yqX/EojdnkIt5nfBf89U1g/5anXHWLFWAp74qZyRSomsXZB7TExj7ggiD1m
         UpFKG7zfCy9A55FysHzghHj8HSFQzlFhnIlOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=82D84xfOz9UFhgLk1p0WJgUaCXHpLRzcEqRYu6sSb2s=;
        b=dwsWDQcHYadn59zurRSohhCXleheudXpgD2MKnTJVvju31bnvUZ+saenmDgNfvxBJ1
         LrAOv2b3Bg71E2fbcj9a6nPDrwxxkZleOKTIKJsd4S0c3/cGlc3Uqc5m3HvcerqAAXgq
         NhoQ0/tKJckAXPXYy0TmbLwMtQZtSj2dhTHDhmeN02zUOdJdKy3KxVrRvUwZxyKEc+6a
         a8SKEZ6Zoqr/RZ1tezYgiyA7UPgcYXi2BsrFDXa9J/9FdA9GOLuLmeds31oRa+dVT9qG
         tJ6ODQ+yFBGPIs08SU8w4JcReRaVNXwu/LCt6bPHCm6+Mi9CJZCNqwBnbhBmIjXHgOks
         0Izw==
X-Gm-Message-State: AOAM533IVcE1VPj3KfEZ0oF8/yyrfggmo/IEU9Psm5HKLkkafxr5U4Cr
        MbgvHzaYYjBaeFcltPb6cUKapA==
X-Google-Smtp-Source: ABdhPJzHKqlkmDoQMVjXPxnvl7IKRCbzihedoNMp9HVpHhhgsWSiQTlxA7XH2Wmeq/uhzhc2s74sIg==
X-Received: by 2002:a05:6000:1847:b0:20f:c628:5884 with SMTP id c7-20020a056000184700b0020fc6285884mr44468094wri.526.1654087265056;
        Wed, 01 Jun 2022 05:41:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l10-20020a5d410a000000b0020fc6590a12sm1472887wrp.41.2022.06.01.05.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:41:04 -0700 (PDT)
Date:   Wed, 1 Jun 2022 14:41:02 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= 
        <ville.syrjala@linux.intel.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@google.com>
Subject: Re: [PATCH v3] drm/probe-helper: Make 640x480 first if no EDID
Message-ID: <YpdeXux0R6PUZhnf@phenom.ffwll.local>
Mail-Followup-To: Doug Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        =?iso-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "Aravind Venkateswaran (QUIC)" <quic_aravindh@quicinc.com>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@google.com>
References: <20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <5857c510-9783-a483-8414-65d7350618d6@suse.de>
 <CAD=FV=X99EWmRk82ako7cL7BWPEsTG=L7VVBVDFX5qKc1MifSA@mail.gmail.com>
 <CAD=FV=U3Wywjev9tEhkL_zE1cV5NwEknH2YwHqyhd5TQtiJ=AQ@mail.gmail.com>
 <Yo4ufWm5WiXsnRX8@phenom.ffwll.local>
 <CAOw6vbLu7TzTppUYv1cynMvn+ykTuGiYBCNhN7FO2kYqZj4DUg@mail.gmail.com>
 <CAKMK7uHTkQjQ5=HOb0MtXD4JZRj3Szt5vm9gQZ6BixZ8LtUpxQ@mail.gmail.com>
 <CAD=FV=WgRjW2yFKvRkcKoj-nGEAhku6_d3kgs9WhTC6bVrzxeQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WgRjW2yFKvRkcKoj-nGEAhku6_d3kgs9WhTC6bVrzxeQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 26, 2022 at 09:01:03AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Thu, May 26, 2022 at 8:42 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, 26 May 2022 at 03:28, Sean Paul <seanpaul@chromium.org> wrote:
> > >
> > > On Wed, May 25, 2022 at 9:26 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Mon, May 23, 2022 at 05:59:02PM -0700, Doug Anderson wrote:
> > > > > Hi,
> > > > >
> > > > > On Fri, May 20, 2022 at 5:01 PM Doug Anderson <dianders@chromium.org> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Mon, May 16, 2022 at 3:28 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > > > > > >
> > > > > > > Hi Douglas,
> > > > > > >
> > > > > > > I understand that you're trying to tell userspace that the modelist has
> > > > > > > been made up, but it's not something that should be done via fragile
> > > > > > > heuristics IMHO.
> > > > > > >
> > > > > > > I looked at the Chromium source code that you linked, but I cannot say
> > > > > > > whether it's doing the correct thing. It all depends on what your
> > > > > > > program needs.
> > > > > > >
> > > > > > > In that function, you could also search for 'DRM_MODE_TYPE_USERDEF'.
> > > > > > > It's the mode that the user specified on the kernel command line. If
> > > > > > > Chromium's automatic mode selection fails, you'd give your users direct
> > > > > > > control over it.
> > > > > >
> > > > > > That doesn't really work for Chrome OS. Certainly a kernel hacker
> > > > > > could do this, but it's not something I could imagine us exposing to
> > > > > > an average user of a Chromebook.
> > > > > >
> > > > > >
> > > > > > > When there's no flagged mode or if
> > > > > > > /sys/class/drm/card<...>/status contains "unconnected", you can assume
> > > > > > > that the modelist is artificial and try the modes in an appropriate order.
> > > > > >
> > > > > > So "no flagged" means that nothing is marked as preferred, correct?
> > > > > >
> > > > > > ...so I guess what you're suggesting is that the order that the kernel
> > > > > > is presenting the modes to userspace is not ABI. If there are no
> > > > > > preferred modes then userspace shouldn't necessarily assume that the
> > > > > > first mode returned is the best mode. Instead it should assume that if
> > > > > > there is no preferred mode then the mode list is made up and it should
> > > > > > make its own decisions about the best mode to start with. If this is
> > > > > > the ABI from the kernel then plausibly I could convince people to
> > > > > > change userspace to pick 640x480 first in this case.
> > > > > >
> > > > > > > If we really want the kernel to give additional guarantees, we should
> > > > > > > have a broader discussion about this topic IMHO.
> > > > > >
> > > > > > Sure. I've added St�phane Marchesin to this thread in case he wants to
> > > > > > chime in about anything.
> > > > > >
> > > > > > Overall, my take on the matter:
> > > > > >
> > > > > > * Mostly I got involved because, apparently, a DP compliance test was
> > > > > > failing. The compliance test was upset that when it presented us with
> > > > > > no EDID that we didn't default to 640x480. There was a push to make a
> > > > > > fix for this in the Qualcomm specific driver but that didn't sit right
> > > > > > with me.
> > > > > >
> > > > > > * On all devices I'm currently working with (laptops), the DP is a
> > > > > > secondary display. If a user was trying to plug in a display with a
> > > > > > bad EDID and the max mode (1024x768) didn't work, they could just use
> > > > > > the primary display to choose a different resolution. It seems
> > > > > > unlikely a user would truly be upset and would probably be happy they
> > > > > > could get their broken display to work at all. Even if this is a
> > > > > > primary display, I believe there are documented key combos to change
> > > > > > the resolution of the primary display even if you can't see anything.
> > > > > >
> > > > > > * That all being said, defaulting to 640x480 when there's no EDID made
> > > > > > sense to me, especially since it's actually defined in the DP spec. So
> > > > > > I'm trying to do the right thing and solve this corner case. That
> > > > > > being said, if it's truly controversial I can just drop it.
> > > > > >
> > > > > >
> > > > > > So I guess my plan will be to give St�phane a little while in case he
> > > > > > wants to chime in. If not then I guess I'll try a Chrome patch...
> > > > > > ...and if that doesn't work, I'll just drop it.
> > > > >
> > > > > OK, this userspace code seems to work:
> > > > >
> > > > > https://crrev.com/c/3662501 - ozone/drm: Try 640x480 before picking
> > > > > the first mode if no EDID
> > > > >
> > > > > ...so we'll see how review of that goes. :-)
> > >
> > > Mirroring some of my comments on that review here :-)
> > >
> > > IMO, this should be addressed in the kernel, or not at all. The kernel
> > > ensures other aspects of DisplayPort implementation are compliant, so
> > > I don't think this would be any exception. Further, the kernel is the
> > > one creating the "safe" mode list, so it seems odd that userspace
> > > would override that. Finally, relying on every userspace to do the
> > > right thing is asking for trouble (we have 3 places which would need
> > > this logic in CrOS).
> >
> > Oh I missed the part that this is defined in the DP spec as _the_ fallback mode.
> >
> > I think the probe helpers could check whether it's a DP connector and
> > then dtrt per DP spec? I think that should have a solid chance of
> > avoiding the regression mess, since the really shoddy stuff tends to
> > be VGA/HDMI.
> 
> I'm fine with making this DP-specific if that's what people think is best.
> 
> 
> > Also if DP says only 640x480 should be the fallback if there's no
> > other mode list source, then I think we should trim it down to only
> > that. But also only for DP.
> 
> So the DP spec says that 640x480 is _the_ default fallback, but it
> also says that we're also allowed to have some implementation-specific
> fall-back modes as well, so I'd rather not fully trim the list and
> just make it clear (somehow) that 640x480 ought to be the default.
> Would you be OK going back to v2 of this patch [1] but adding a check
> that the connector type is DP and also making sure that the spec is
> referenced?

Sounds reasonable.
-Daniel

> 
> 
> > Also ofc that patch should reference the right DP spec sections :-)
> 
> My original patch description for this patch (v3) did reference
> section 4.2.2.6 (EDID Corruption Detection) of the DP 1.4a Link CTS.
> ...or did you want this in inline comments in the patch itself?
> 
> 
> [1] https://lore.kernel.org/r/20220510135101.v2.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
