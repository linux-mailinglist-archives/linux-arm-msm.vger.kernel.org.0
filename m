Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF6192E7B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 23:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbfE2VyX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 17:54:23 -0400
Received: from onstation.org ([52.200.56.107]:44478 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726250AbfE2VyX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 17:54:23 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 4E7603E93F;
        Wed, 29 May 2019 21:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1559166861;
        bh=tIAy2GIEYuNFrX/uboRVUaQFApaBDfrKHODIjF4ZzsY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f+ScQg9nH5BPsj0L/L9Pa5xMLgJuRWLyNAdh6g8x1q7BuhrDpRaPl+RkGQ21g7SyY
         R3BKA8lT8S5AS73Wb7sjxnACIfi+ejE5m4rfW7XJW9+TS9avwbBeX05ysQyCH2fT17
         Trm/LM+RDTvci7VHkavslpvmltPUrECo6Wpb/35Y=
Date:   Wed, 29 May 2019 17:54:21 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dave Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5
 display support
Message-ID: <20190529215421.GA20611@basecamp>
References: <20190529011705.GA12977@basecamp>
 <CAOCk7NrRo2=0fPN_Sy1Bhhy+UV7U6uO5aV9uXZc8kc3VpSt71g@mail.gmail.com>
 <20190529013713.GA13245@basecamp>
 <CAOCk7NqfdNkRJkbJY70XWN-XvdtFJ0UVn3_9rbgAsNCdR7q5PQ@mail.gmail.com>
 <20190529024648.GA13436@basecamp>
 <CAOCk7NpC93ACr4jFm7SBOKSvFJSDhq2byX6BAYPX29BuYEkWnQ@mail.gmail.com>
 <20190529102822.GA15027@basecamp>
 <CAOCk7NoVknZOkFcki9c8hq2vkqLhBSfum05T9Srq8mtJjAaLyQ@mail.gmail.com>
 <20190529193046.GA19876@basecamp>
 <26c535af-9853-c8c9-3138-04f5d9ee11b0@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26c535af-9853-c8c9-3138-04f5d9ee11b0@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 29, 2019 at 01:58:16PM -0600, Jeffrey Hugo wrote:
> On 5/29/2019 1:30 PM, Brian Masney wrote:
> > On Wed, May 29, 2019 at 08:41:31AM -0600, Jeffrey Hugo wrote:
> > > On Wed, May 29, 2019 at 4:28 AM Brian Masney <masneyb@onstation.org> wrote:
> > > > 
> > > > On Tue, May 28, 2019 at 08:53:49PM -0600, Jeffrey Hugo wrote:
> > > > > On Tue, May 28, 2019 at 8:46 PM Brian Masney <masneyb@onstation.org> wrote:
> > > > > > 
> > > > > > On Tue, May 28, 2019 at 07:42:19PM -0600, Jeffrey Hugo wrote:
> > > > > > > > > Do you know if the nexus 5 has a video or command mode panel?  There
> > > > > > > > > is some glitchyness with vblanks and command mode panels.
> > > > > > > > 
> > > > > > > > Its in command mode. I know this because I see two 'pp done time out'
> > > > > > > > messages, even on 4.17. Based on my understanding, the ping pong code is
> > > > > > > > only applicable for command mode panels.
> > > > > > > 
> > > > > > > Actually, the ping pong element exists in both modes, but 'pp done
> > > > > > > time out' is a good indicator that it is command mode.
> > > > > > > 
> > > > > > > Are you also seeing vblank timeouts?
> > > > > > 
> > > > > > Yes, here's a snippet of the first one.
> > > > > > 
> > > > > > [    2.556014] WARNING: CPU: 0 PID: 5 at drivers/gpu/drm/drm_atomic_helper.c:1429 drm_atomic_helper_wait_for_vblanks.part.1+0x288/0x290
> > > > > > [    2.556020] [CRTC:49:crtc-0] vblank wait timed out
> > > > > > [    2.556023] Modules linked in:
> > > > > > [    2.556034] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.2.0-rc1-00178-g72c3c1fd5f86-dirty #426
> > > > > > [    2.556038] Hardware name: Generic DT based system
> > > > > > [    2.556056] Workqueue: events deferred_probe_work_func
> > > > > > ...
> > > > > > 
> > > > > > > Do you have busybox?
> > > > > > > 
> > > > > > > Can you run -
> > > > > > > sudo busybox devmem 0xFD900614
> > > > > > > sudo busybox devmem 0xFD900714
> > > > > > > sudo busybox devmem 0xFD900814
> > > > > > > sudo busybox devmem 0xFD900914
> > > > > > > sudo busybox devmem 0xFD900A14
> > > > > > 
> > > > > > # busybox devmem 0xFD900614
> > > > > > 0x00020020
> > > > > 
> > > > > Ok, so CTL_0 path, command mode, ping pong 0, with the output going to DSI 1.
> > > > > 
> > > > > Next one please:
> > > > > 
> > > > > busybox devmem 0xFD912D30
> > > > 
> > > > It's 0x00000000 on mainline and 4.17. I used the following script to
> > > > dump the entire mdp5 memory region and attached the dump from 4.17 and
> > > > 5.2rc1.
> > > > 
> > > 
> > > ok, 0 means autorefresh is not on.  Which is fine.  My next guess
> > > would be the vblank code checking the hardware vblank counter, which
> > > doesn't exist.
> > > In video mode, there is a frame counter which increments, which can be
> > > used as the vblank counter.  Unfortunately, that hardware isn't active
> > > in command mode, and there isn't an equivalent.
> > > 
> > > So, the vblank code is going to read the register, and look for an
> > > update, which will never happen, thus it will timeout.  There is a
> > > backup path which uses timestamps (no hardware), which you can
> > > activate with a quick hack - make max_vblank_count = 0 at the
> > > following line
> > > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c#L753
> > 
> > That fixed the issue!
> 
> Awesome.  I'm glad it was something simple.
> 
> > 
> > I previously observed that mdp5_get_vblank_counter, specifically
> > mdp5_encoder_get_framecount, would always return 0.
> > 
> > What's the best way to fix this in mainline? Set that to zero if any
> > of the interface modes is MDP5_INTF_DSI_MODE_COMMAND?
> > 
> 
> Short version, yes.  Long version:
> 
> I still have that hack in my tree and haven't come back to formulating
> a proper fix yet.  Feel free to run with it.
> 
> Thinking about it briefly, we could do two things.  We could fake a
> hardware counter by just increment an int every time the vblank irq is
> processed, but that seems clunky.  Otherwise, we could force a
> fallback onto the timestamp solution, which seems less invasive.
> 
> In theory, we could service multiple displays, with different
> properties (ie a combination of command and video mode).  The hack
> then, is not good, because it would break video mode (at-least we
> wouldn't be using the register when we could).  It would be great if
> the use of the hardware register could be done per display.
> 
> Luckily, it looks like someone just made that possible -
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/drm_vblank.c?h=v5.2-rc2&id=ed20151a7699bb2c77eba3610199789a126940c4

I'll work on this for the msm driver.

Thanks for the info!

Brian
