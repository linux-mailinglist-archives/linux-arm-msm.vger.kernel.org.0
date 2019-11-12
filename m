Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5CAF8D55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 11:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbfKLKyw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 05:54:52 -0500
Received: from onstation.org ([52.200.56.107]:48248 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbfKLKyv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 05:54:51 -0500
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 76AAA3E994;
        Tue, 12 Nov 2019 10:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1573556090;
        bh=jjKN6d8ptQSkUyJcPph5rCkFf0mBynfnJx+7tQMICQ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VORlG8Nn/3lq3rYkTopLtuLPXh2vlijLFzlNyEBCu4fJtdhpfSVehn+fa32ryyxyU
         LxnIYKoabfxZU5OhptEPMIOeM3FbFpqdhWPOiHSxLbihbLXYO2eKzMOEsJFxb6pL4R
         F+PmEubwY8vTdhKlUiQMI55U73QeJvBrbtU1alDE=
Date:   Tue, 12 Nov 2019 05:54:50 -0500
From:   Brian Masney <masneyb@onstation.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] drm/msm: 'pp done time out' errors after async
 commit changes
Message-ID: <20191112105450.GA9144@onstation.org>
References: <CAF6AEGsZkJJTNZ8SzHsSioEnkpekr1Texu5_EeBW1hP-bsOyjQ@mail.gmail.com>
 <20191107111019.GA24028@onstation.org>
 <CAF6AEGtbP=X2+DELajQq9zMZYGgmhyUhe62ncvHvyFnyZexTXg@mail.gmail.com>
 <CAOCk7NrPdGqc4vo70NmTuyszkPaPe41-e89ym2vAYBY+GTt9BA@mail.gmail.com>
 <CAJs_Fx4UJYd-k3_3AAGJo-8udThhvf6t-J=OZi3jappWjTNnFQ@mail.gmail.com>
 <CAOCk7Nq7rPmraofy+o8vWTwSAd1+dTRsoZ4QN0mRAOOz7u7TUg@mail.gmail.com>
 <20191110135321.GA6728@onstation.org>
 <CAOCk7Nr3nkUWOynxVK_0SxWKUss803_fhkdVehRajtiA9vi8ng@mail.gmail.com>
 <20191111113806.GA1420@onstation.org>
 <CAOCk7NoZN63zZQrbw-RRnbUko3OREy=15FMC7sN5M95oNb5JNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7NoZN63zZQrbw-RRnbUko3OREy=15FMC7sN5M95oNb5JNw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 11, 2019 at 07:51:22AM -0700, Jeffrey Hugo wrote:
> On Mon, Nov 11, 2019 at 4:38 AM Brian Masney <masneyb@onstation.org> wrote:
> >
> > On Sun, Nov 10, 2019 at 10:37:33AM -0700, Jeffrey Hugo wrote:
> > > On Sun, Nov 10, 2019 at 6:53 AM Brian Masney <masneyb@onstation.org> wrote:
> > > >
> > > > On Fri, Nov 08, 2019 at 07:56:25AM -0700, Jeffrey Hugo wrote:
> > > > There's a REG_MDP5_PP_AUTOREFRESH_CONFIG() macro upstream here:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h#n1383
> > > >
> > > > I'm not sure what to put in that register but I tried configuring it
> > > > with a 1 this way and still have the same issue.
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> > > > index eeef41fcd4e1..6b9acf68fd2c 100644
> > > > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> > > > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
> > > > @@ -80,6 +80,7 @@ static int pingpong_tearcheck_setup(struct drm_encoder *encoder,
> > > >         mdp5_write(mdp5_kms, REG_MDP5_PP_SYNC_THRESH(pp_id),
> > > >                         MDP5_PP_SYNC_THRESH_START(4) |
> > > >                         MDP5_PP_SYNC_THRESH_CONTINUE(4));
> > > > +       mdp5_write(mdp5_kms, REG_MDP5_PP_AUTOREFRESH_CONFIG(pp_id), 1);
> > > >
> > > >         return 0;
> > > >  }
> > >
> > > bit 31 is the enable bit (set that to 1), bits 15:0 are the
> > > frame_count (how many te events before the MDP sends a frame, I'd
> > > recommend set to 1).  Then after its programmed, you'll have to flush
> > > the config, and probably use a _START to make sure the flush takes
> > > effect.
> >
> > I think that I initially get autorefresh enabled based on your
> > description above since the ping pong IRQs occur much more frequently.
> > However pretty quickly the error 'dsi_err_worker: status=c' is shown,
> > the contents on the screen shift to the right, and the screen no longer
> > updates after that. That error decodes to
> > DSI_ERR_STATE_DLN0_PHY | DSI_ERR_STATE_FIFO according to dsi_host.c.
> >
> > Here's the relevant code that I have so far:
> 
> So, Unless I missed it, you haven't disabled using _start when
> autorefresh is enabled.  If you are using both at the same time,
> you'll overload the DSI and get those kinds of errors.

That fixed the issue. Just to close out this thread, I submitted a
patch with what I have here:
https://lore.kernel.org/lkml/20191112104854.20850-1-masneyb@onstation.org/T/#u

I'll work on async commit support for the MDP5.

Thanks Jeff and Rob!

Brian
