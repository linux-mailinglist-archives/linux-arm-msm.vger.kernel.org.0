Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D62FD780A9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2019 19:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbfG1Rcx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Jul 2019 13:32:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39748 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbfG1Rcw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Jul 2019 13:32:52 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 250AF60247; Sun, 28 Jul 2019 17:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564335171;
        bh=HIR7nBYXO3+FtqWafLLF5meNLRHqiK3l/PIi4dFF348=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ModjmV4KJpuk55XYpqCY1CohhDNBOSSgFlyESIpZpahAmQVclSS7RE0m4gf49cFOA
         9WAbxVlq2yHMtfw+SfDgKtcdFzIwsYvUxCmDnVEVgDM1Gl9mR1Og/xZRdnu3rFSGBX
         mwEOE5OHRZgj2cNXsV7UR/O3lzbroaNfhycA8KAQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 58C8260247;
        Sun, 28 Jul 2019 17:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564335169;
        bh=HIR7nBYXO3+FtqWafLLF5meNLRHqiK3l/PIi4dFF348=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lUqLn/c0DoOVlwKBs9U85MGQZ9Nt+fOZjxN9A2iFhES10ogvqoPgHL7PPmJIzPdDT
         lwHJ+EDoGjeSCyhxYFlV/aRVqb3SNgqaENs1cHH70ixOpDWbgUb9QI8NZ77Ldxl3bw
         9dfDesvtxYGS2eBurhlwA8p8h8Pi7OiMo+l2WD4g=
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Sun, 28 Jul 2019 10:32:49 -0700
From:   Jeykumar Sankaran <jsanka@codeaurora.org>
To:     Sean Paul <sean@poorly.run>
Cc:     =?UTF-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, pdhaval@codeaurora.org,
        seanpaul@chromium.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [RFC] Expanding drm_mode_modeinfo flags
In-Reply-To: <20190724144833.GM104440@art_vandelay>
References: <1562870805-32314-1-git-send-email-jsanka@codeaurora.org>
 <20190716090712.GY15868@phenom.ffwll.local>
 <16fee2b42fa03d2cf104452223dcf5af@codeaurora.org>
 <20190719090553.GF15868@phenom.ffwll.local>
 <20190719135558.GC104440@art_vandelay> <20190719141528.GN5942@intel.com>
 <20190719142959.GD104440@art_vandelay>
 <afaf9da1143534422a277c2bbe8c84db@codeaurora.org>
 <20190724144833.GM104440@art_vandelay>
Message-ID: <331f891d4f403c30ab346982251c911c@codeaurora.org>
X-Sender: jsanka@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-07-24 07:48, Sean Paul wrote:
> On Mon, Jul 22, 2019 at 04:50:43PM -0700, Jeykumar Sankaran wrote:
>> On 2019-07-19 07:29, Sean Paul wrote:
>> > On Fri, Jul 19, 2019 at 05:15:28PM +0300, Ville Syrjälä wrote:
>> > > On Fri, Jul 19, 2019 at 09:55:58AM -0400, Sean Paul wrote:
>> > > > On Fri, Jul 19, 2019 at 11:05:53AM +0200, Daniel Vetter wrote:
>> > > > > On Thu, Jul 18, 2019 at 11:18:42AM -0700, Jeykumar Sankaran
> wrote:
>> > > > > > On 2019-07-16 02:07, Daniel Vetter wrote:
>> > > > > > > On Thu, Jul 11, 2019 at 11:46:44AM -0700, Jeykumar Sankaran
> wrote:
>> >
>> > /snip
>> >
>> > > > > > > >   drm: add mode flags in uapi for seamless mode switch
>> > > > > > >
>> > > > > > > I think the uapi is the trivial part here, the real deal is
> how
>> > > > > > > userspace
>> > > > > > > uses this. Can you pls post the patches for your compositor?
>> > > > > > >
>> > > > > > > Also note that we already allow userspace to tell the kernel
> whether
>> > > > > > > flickering is ok or not for a modeset. msm driver could use
> that to at
>> > > > > > > least tell userspace whether a modeset change is possible.
> So you can
>> > > > > > > already implement glitch-free modeset changes for at least
> video mode.
>> > > > > > > -Daniel
>> > > > > >
>> > > > > > I believe you are referring to the below tv property of the
> connector.
>> > > > > >
>> > > > > > /**
>> > > > > >  * @tv_flicker_reduction_property: Optional TV property to
> control the
>> > > > > >  * flicker reduction mode.
>> > > > > >  */
>> > > > > > struct drm_property *tv_flicker_reduction_property;
>> > > > >
>> > > > > Not even close :-)
>> > > > >
>> > > > > I mean the DRM_MODE_ATOMIC_ALLOW_MODESET flag for the atomic
> ioctl. This
>> > > > > is not a property of a mode, this is a property of a
> _transition_ between
>> > > > > configurations. Some transitions can be done flicker free,
> others can't.
>> > > >
>> > > > Agree that an atomic flag on a commit is the way to accomplish
> this. It's pretty
>> > > > similar to the psr transitions, where we want to reuse most of the
> atomic
>> > > > circuitry, but in a specialized way. We'd also have to be careful
> to only
>> > > > involve the drm objects which are seamless modeset aware (you
> could imagine
>> > > > a bridge chain where the bridges downstream of the first bridge
> don't care).
>> > > >
>> > > > >
>> > > > > There's then still the question of how to pick video vs command
> mode, but
>> > > > > imo better to start with implementing the transition behaviour
> correctly
>> > > > > first.
>> > > >
>> > > > Connector property? Possibly a terrible idea, but I wonder if we
> could [re]use
>> > > > the vrr properties for command mode. The docs state that the
> driver has the
>> > > > option of putting upper and lower bounds on the refresh rate.
>> > >
>> > > Not really sure why this needs new props and whatnot. This is kinda
>> > > what
>> > > the i915 "fastset" stuff already does:
>> > > 1. userspace asks for something to be changed via atomic
>> > > 2. driver calculates whether a modeset is actually required
>> > > 3. atomic validates need_modeset() vs. DRM_MODE_ATOMIC_ALLOW_MODESET
>> > > 4. if (need_modeset) heavyweight_commit() else lightweight_commit()
>> > >
>> > > Ie. why should userspace really care about anything except the
>> > > "flickers are OK" vs. "flickers not wanted" thing?
>> >
>> > Agree, I don't think the seamless modeset (ie: changing resolution
>> > without
>> > flicker) needs a property. Just need to test the commit without
>> > ALLOW_MODESET
>> > and commit it if the test passes.
>> >
>> 
>> Agreed that a TEST_ONLY commit without ALLOW_MODESET flag can be used 
>> to
>> check
>> whether the modeset can be done seamless. But since there are no error
> code
>> returns,
>> the client cannot distinguish the test_only commit failures from other
>> invalid config failures.
>> 
>> Also, note that when the client sees two 1080p modes (vid/cmd) and it 
>> is
>> interested only
>> to do *only* seamless switches, without any additional flag it cannot
>> distinguish between
>> these two 1080p modes. The client has to invoke two test_only commits
> with
>> these
>> modes to identify the seamless one. Is that a preferred approach?
> 
> Hi Jey!
> Yeah, pretty much. Stepping back a bit though, why is the kernel 
> exposing
> 2
> 1080p modes in the first place? If you just expose one mode and then 
> use a
> property to enter "low-latency operation" (or overloading vrr for cmd
> mode), you
> shouldn't need to do the mode switch, just flip the property and let 
> the
> kernel
> figure out how to transition to video/cmd mode.
> 
>> 
>> Intel's "fastset" calculates the need for modeset internally based on
> the
>> configuration and chooses the best commit path. But the requirement 
>> here
>> is to expose the information up-front since the use case cannot afford
>> to fall back to the normal modeset when it has requested for a 
>> seamless
> one.
>> 
>> > >
>> > > Also what's the benefit of using video mode if your panel supportes
>> > > command mode? Can you turn off the memory in the panel and actually
>> > > save power that way? And if there is a benefit can't the driver just
>> > > automagically switch between the two based on how often things are
>> > > getting updated? That would match how eDP PSR already works.
>> >
>> > I'm guessing video mode might have some latency benefits over command
>> > mode?
>> >
>> > Sean
>> 
>> Yes. Pretty much those are reasons we need to switch to video mode. 
>> But
>> instead
>> of making the decision internal to the driver based on the frequency 
>> of
>> frame updates,
>> we have proprietary use cases where the client has to trigger the 
>> switch
>> explicitly.
> 
> Unsolicited advice: if you find yourself typing "proprietary" while
> justifying
> an upstream proposal, reword your argument immediately :-)
> 
> Now that I've filled my awful joke quota for the mail, I can move on.
> Generally
> speaking, it's better to you expand on why userspace needs this. 
> There's a
> very
> good chance that if it makes sense for Qualcomm, it makes sense for
> others. If
> we have an open discussion about it, others might chime in with "me 
> too"
> and
> that will help your case (and you might even hook someone into doing 
> the
> work
> for you!). Alternatively, we might be able to solve the problem in a
> different
> way that makes everyone happy (or most everyone happy).
> 
> There's 100% a case for allowing userspace to trigger a low-latency 
> mode
> at the
> expense of power (we should have it disable the psr entry timer as 
> well).
> Let's
> steer this conversation in the direction of "can we use something that
> already
> exists, or should we add something new?"
> 
> Sean
> 
Thank you Sean for the suggestion! I can use the proposed property 
approach to
switch between vid/cmd mode if every resolution is capable of switching
between these two modes. But we have uses cases where the switch is
restricted only between a set of resolutions.

Also, appreciate your guidance for formating closed usecase questions. 
Let me
check how much more details I can provide on why H/W has to enforce such
restrictions and will revive the thread if needed.

Thanks and Regards,
Jeykumar S.

> 
>> So we are trying to find ways to represent the same resolution in both
>> video/cmd modes.
>> 
>> Thanks and Regards,
>> Jeykumar S.
>> 
>> >
>> > >
>> > > --
>> > > Ville Syrjälä
>> > > Intel
>> 
>> --
>> Jeykumar S
> 
> --
> Sean Paul, Software Engineer, Google / Chromium OS

-- 
Jeykumar S
