Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 502DD523DB1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 21:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347052AbiEKTjz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 15:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347048AbiEKTjy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 15:39:54 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5214B219C14
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 12:39:52 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id d6so3760596ede.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 12:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=KUjfW/kaHDRwhWp5Rt/2AgtSuQq/hXyzExdN5I7ro90=;
        b=N5Sewa0q9eHV45UM94+DzpGvQdCTPLlQVm2dEzNxjvomA5nCkkBrjpYNctI7qVfxDw
         zTTnnDEJyOsSB1lBbLOg8zLzUazdA4CE5/w+5mlE77v9ce3pHkQQltOb3x41srT+4OrW
         xrFq9MjViOUDiGbXn7gV83kszXNflH/WBLH4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=KUjfW/kaHDRwhWp5Rt/2AgtSuQq/hXyzExdN5I7ro90=;
        b=Vnu27oijqyM/q9J4Q33vQrHcE4ZkV1fJXk3X1JEEiUaZ8JtvFAORgEAuNaII69MxED
         L46EXwd/14h+MGSFfSRIWG3anHTe1TzHWOa1RR2k+c7c9xJCBkir4Te3nRE3IaEkJmV3
         BnEM4hHRAtXp35fUX6yezqTFo2bt13mIX+Pdg9us3/E3qj/yqU1CWJ8rXWcTuYuae5wk
         SPXeR+JcRhProYslCYoFSnqwMt7vYq9KaqzS9M9gZ8PED5gwlh9dD2UkmBU9Tx2ZXRFy
         nPicvdnf5sbt+p+nWw2oGEpoypTUhOAe+Tx/D0Si5+RLMEh3P0yMxdLGZ1AC7QDHGQTg
         EtCA==
X-Gm-Message-State: AOAM531KiIvy2noBAEy7EemTNuIO6xQvZ1xeMTnYk/rEIPwHnRiDLUmf
        14vfFb1TQIxRpaSP8OeXGgsFcg==
X-Google-Smtp-Source: ABdhPJzWesYTj8gmkcmegNXLf0uSlKr9mITbAOCF+I6/YdvNNo+sGdi8tvr8Vq30B8lkClQ7lWiONw==
X-Received: by 2002:a05:6402:2932:b0:425:d7b3:e0d1 with SMTP id ee50-20020a056402293200b00425d7b3e0d1mr30745307edb.141.1652297990866;
        Wed, 11 May 2022 12:39:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id h11-20020a170906828b00b006f3ef214e44sm1295729ejx.170.2022.05.11.12.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 12:39:50 -0700 (PDT)
Date:   Wed, 11 May 2022 21:39:48 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Dave Airlie <airlied@gmail.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: Adding CI results to the kernel tree was Re: [RFC v2] drm/msm:
 Add initial ci/ subdirectory
Message-ID: <YnwRBFNyygB0Ub6S@phenom.ffwll.local>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
        Dave Airlie <airlied@gmail.com>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
References: <20220510070140.45407-1-tomeu.vizoso@collabora.com>
 <20220510141329.54414-1-tomeu.vizoso@collabora.com>
 <CAPM=9tzLR-wsLhg2ikGjoK06s-ju5XWa1rtPPiUpN=pwD1vgtA@mail.gmail.com>
 <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg8YgH1h3wrm9CtXff7rSewa+NE0Z5upb1GOE8XiTL9HA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 11, 2022 at 10:33:06AM -0700, Linus Torvalds wrote:
> On Tue, May 10, 2022 at 10:07 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > > And use it to store expectations about what the drm/msm driver is
> > > supposed to pass in the IGT test suite.
> >
> > I wanted to loop in Linus/Greg to see if there are any issues raised
> > by adding CI results file to the tree in their minds, or if any other
> > subsystem has done this already, and it's all fine.
> >
> > I think this is a good thing after our Mesa experience, but Mesa has a
> > lot tighter integration here, so I want to get some more opinions
> > outside the group.
> 
> Honestly, my immediate reaction is that I think it might be ok, but
> 
>  (a) are these things going to absolutely balloon over time?
> 
>  (b) should these not be separated out?
> 
> Those two issues kind of interact.
> 
> If it's a small and targeted test-suite, by all means keep it in the
> kernel, but why not make it part of "tools/testing/selftests"
> 
> But if people expect this to balloon and we end up having megabytes of
> test output, then I really think it should be a separate git tree.
> 
> A diffstat like this:
> 
> >  7 files changed, 791 insertions(+)

Yeah I guess it's good to have some numbers for where this might go. Good
comparison is probably mesa3d, since it's the same-ish people doing the
same-ish ci on the same-ish infrastructure, just the userspace part of it.

mesa$ git ls-files | grep ci | xargs cat | wc -l
123077

mesa$ git ls-files | grep ci | wc -l
421

Compared to drivers/gpu it's really not much, and mesa is about the size
of drivers/gpu if you exclude the massive amount of register headers from
amd.

And I guess if we do stuff like result file compression like you mentioned
it should be quite a bit less even.

So yeah if this does take off it wil be substantially more, but I don't
think it'll ever get to a point where it'll swamp code changes. And if it
does that's kinda a solid indicator that something really wrong is going
on.

> is not a problem at all. But I get the feeling that this is just the
> tip of the iceberg, and people will want to not just have the result
> files, but start adding actual *input* files that may be largely
> automated stuff and may be tens of megabytes in size.
> 
> Because the result files on their own aren't really self-contained,
> and then people will want to keep them in sync with the test-files
> themselves, and start adding those, and now it *really* is likely very
> unwieldy.
> 
> Or if that doesn't happen, and the actual input test files stay in a
> separate CI repo, and then you end up having random coherency issues
> with that CI repo, and it all gets to be either horribly messy, or the
> result files in the kernel end up really stale.
> 
> So honestly, I personally don't see a good end result here.  This
> particular small patch? *This* one looks fine to me, except I really
> think tools/testing/selftests/gpu would be a much more logical place
> for it.
> 
> But I don't see a way forward that is sane.
> 
> Can somebody argue otherwise?

I do personally think we should add a bunch more things here, radically
putting everything into the drm-ci repo feels a bit much like appeasement
to get the foot in the door. Like some of the scripts are definitely
specific to the ci infra on freedesktop.org (or specific hw runners for
the drivers), and that makes sense to keep in that drm/fd ci repo. But
other scripts should probably migrate to scripts/ and at least start out
in a ci/ folder in the kernel.

igt itself might eventually move to tools/testing/selftests/gpu or
whatever, but that's kinda a huge discussion onto itself. And I haven't
seen a clear consensus yet among subsystem that these kind of tests (like
xfs-tests, and I think pretty much ever bigger subsystem that is old
enough to predate selftests has them somewhere) should all move into
tools/testing/selftest. Maybe they should, but feels like this is
orthogonal to ci integration.

Note that mesa3d has the exact same issue going that you're raising, and
some of those are unfixable because the opengl/vulkan conformance test
suites are maintained entirely externally by Khronos (and you have to use
those or you're not conformant to the spec, which renders the point of
having a shared spec a bit moot). It's messy but workable, and the CI you
get seems very much to be worth the price.

One idea I tossed out on irc is to move this all under drivers/gpu/ci.
There's driver specific stuff like the test result/fail lists, and maybe
those could eventually move out to drivers. But for starting out it might
be better to keep it all in one place so it's a bit better under control
and doesn't accidentally become a kranken of some kind. And then make sure
pieces move to scripts/ or tools/testing/ appropriately.

In general I think any mess this causes is a pretty good indicator that
something is amiss, like if this causes messy history due to tests
flipping too much and causing issues then that also indicates an issue
with the kernel or testcase quality itself. And it might be good to shine
more light on that stuff.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
