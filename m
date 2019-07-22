Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDD370DA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 01:50:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733057AbfGVXuq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 19:50:46 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46002 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729728AbfGVXuq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 19:50:46 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 2009A611DC; Mon, 22 Jul 2019 23:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563839445;
        bh=EJx4k7/D+Lskl+Q991OT1HuNiR0lNx2S8Xv79Ex6lxc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=F2JknA+L+sI6JkrIyQiuwDnv9Ius3czNAvEc+UYuLTYd08uljtlZVyYuBz/SogFKB
         YDcE6Nypb4qzKbes1MVuwnHqJR/Hr2I4d7fWliaCVU3qfxerB0b+lXzkQQeO7EC3SY
         kMT6jNWbhra0EJ4yBjS0ObV537704cuMdnhQJvk8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id AE22D60247;
        Mon, 22 Jul 2019 23:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1563839443;
        bh=EJx4k7/D+Lskl+Q991OT1HuNiR0lNx2S8Xv79Ex6lxc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=V+knWme44H1ZCoWT24XloeJZU/ge53Xr3iHw6ZpbaJ9kbYI4KxRd3/2IMSL1RRtSm
         Pjbc/q/PcgzLY6F8wjeW6s0/jH6rVVW0vfCxl6wQvL08QHLi/SV9XepT7YqBay8fXA
         IcbmB3fcGctBSDkNjOS7jEdm8SmaMB5ayhnWjJZw=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 22 Jul 2019 16:50:43 -0700
From:   Jeykumar Sankaran <jsanka@codeaurora.org>
To:     Sean Paul <sean@poorly.run>
Cc:     =?UTF-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, pdhaval@codeaurora.org,
        seanpaul@chromium.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [RFC] Expanding drm_mode_modeinfo flags
In-Reply-To: <20190719142959.GD104440@art_vandelay>
References: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
 <20190716090712.GY15868@phenom.ffwll.local>
 <16fee2b42fa03d2cf104452223dcf5af@codeaurora.org>
 <20190719090553.GF15868@phenom.ffwll.local>
 <20190719135558.GC104440@art_vandelay> <20190719141528.GN5942@intel.com>
 <20190719142959.GD104440@art_vandelay>
Message-ID: <afaf9da1143534422a277c2bbe8c84db@codeaurora.org>
X-Sender: jsanka@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-07-19 07:29, Sean Paul wrote:
> On Fri, Jul 19, 2019 at 05:15:28PM +0300, Ville Syrjälä wrote:
>> On Fri, Jul 19, 2019 at 09:55:58AM -0400, Sean Paul wrote:
>> > On Fri, Jul 19, 2019 at 11:05:53AM +0200, Daniel Vetter wrote:
>> > > On Thu, Jul 18, 2019 at 11:18:42AM -0700, Jeykumar Sankaran wrote:
>> > > > On 2019-07-16 02:07, Daniel Vetter wrote:
>> > > > > On Thu, Jul 11, 2019 at 11:46:44AM -0700, Jeykumar Sankaran wrote:
> 
> /snip
> 
>> > > > > >   drm: add mode flags in uapi for seamless mode switch
>> > > > >
>> > > > > I think the uapi is the trivial part here, the real deal is how
>> > > > > userspace
>> > > > > uses this. Can you pls post the patches for your compositor?
>> > > > >
>> > > > > Also note that we already allow userspace to tell the kernel whether
>> > > > > flickering is ok or not for a modeset. msm driver could use that to at
>> > > > > least tell userspace whether a modeset change is possible. So you can
>> > > > > already implement glitch-free modeset changes for at least video mode.
>> > > > > -Daniel
>> > > >
>> > > > I believe you are referring to the below tv property of the connector.
>> > > >
>> > > > /**
>> > > >  * @tv_flicker_reduction_property: Optional TV property to control the
>> > > >  * flicker reduction mode.
>> > > >  */
>> > > > struct drm_property *tv_flicker_reduction_property;
>> > >
>> > > Not even close :-)
>> > >
>> > > I mean the DRM_MODE_ATOMIC_ALLOW_MODESET flag for the atomic ioctl. This
>> > > is not a property of a mode, this is a property of a _transition_ between
>> > > configurations. Some transitions can be done flicker free, others can't.
>> >
>> > Agree that an atomic flag on a commit is the way to accomplish this. It's pretty
>> > similar to the psr transitions, where we want to reuse most of the atomic
>> > circuitry, but in a specialized way. We'd also have to be careful to only
>> > involve the drm objects which are seamless modeset aware (you could imagine
>> > a bridge chain where the bridges downstream of the first bridge don't care).
>> >
>> > >
>> > > There's then still the question of how to pick video vs command mode, but
>> > > imo better to start with implementing the transition behaviour correctly
>> > > first.
>> >
>> > Connector property? Possibly a terrible idea, but I wonder if we could [re]use
>> > the vrr properties for command mode. The docs state that the driver has the
>> > option of putting upper and lower bounds on the refresh rate.
>> 
>> Not really sure why this needs new props and whatnot. This is kinda 
>> what
>> the i915 "fastset" stuff already does:
>> 1. userspace asks for something to be changed via atomic
>> 2. driver calculates whether a modeset is actually required
>> 3. atomic validates need_modeset() vs. DRM_MODE_ATOMIC_ALLOW_MODESET
>> 4. if (need_modeset) heavyweight_commit() else lightweight_commit()
>> 
>> Ie. why should userspace really care about anything except the
>> "flickers are OK" vs. "flickers not wanted" thing?
> 
> Agree, I don't think the seamless modeset (ie: changing resolution 
> without
> flicker) needs a property. Just need to test the commit without 
> ALLOW_MODESET
> and commit it if the test passes.
> 

Agreed that a TEST_ONLY commit without ALLOW_MODESET flag can be used to 
check
whether the modeset can be done seamless. But since there are no error 
code returns,
the client cannot distinguish the test_only commit failures from other 
invalid config failures.

Also, note that when the client sees two 1080p modes (vid/cmd) and it is 
interested only
to do *only* seamless switches, without any additional flag it cannot 
distinguish between
these two 1080p modes. The client has to invoke two test_only commits 
with these
modes to identify the seamless one. Is that a preferred approach?

Intel's "fastset" calculates the need for modeset internally based on 
the
configuration and chooses the best commit path. But the requirement here
is to expose the information up-front since the use case cannot afford
to fall back to the normal modeset when it has requested for a seamless 
one.

>> 
>> Also what's the benefit of using video mode if your panel supportes
>> command mode? Can you turn off the memory in the panel and actually
>> save power that way? And if there is a benefit can't the driver just
>> automagically switch between the two based on how often things are
>> getting updated? That would match how eDP PSR already works.
> 
> I'm guessing video mode might have some latency benefits over command 
> mode?
> 
> Sean

Yes. Pretty much those are reasons we need to switch to video mode. But 
instead
of making the decision internal to the driver based on the frequency of 
frame updates,
we have proprietary use cases where the client has to trigger the switch 
explicitly.
So we are trying to find ways to represent the same resolution in both 
video/cmd modes.

Thanks and Regards,
Jeykumar S.

> 
>> 
>> --
>> Ville Syrjälä
>> Intel

-- 
Jeykumar S
