Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B78710FFFA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 15:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbfLCOSo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 09:18:44 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:46312 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfLCOSo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 09:18:44 -0500
Received: by mail-il1-f195.google.com with SMTP id t17so3255503ilm.13;
        Tue, 03 Dec 2019 06:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XN+XRtcOHa0jorvMJvWtS/vVXdDZhBa/Ghza1vzaZdo=;
        b=NqNyCNRXymGDyuCXHcsD+tVnihrhxEaHPUnfiLassfKRzV3b51ExPc5dYPPr54iZlo
         OcvukUd9PB8OHHXv9g66G+tarKutYvfTDdej21zW4zEXWdLvPHkZEHSnY4VTg0v91vYl
         oTpKWI1PMnOMRbHKgQkUJ364gn1h1RoLuNNkpvTAFqTExXai5i4JPHL1VdO4zCpKMb5I
         zYdJbwfF5XsNLEoQjsEKEeMEn4mgYTmLk3blvdLTw4kLO5iFjzQCcULk1tw7Kh0ucbbm
         lQ74crkyrOjTdfXswn7g1+pfzxf2JRNf3DH3IN72mhhOV+KEKNx0WU9m4ZEvtp+gmN3Z
         E96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XN+XRtcOHa0jorvMJvWtS/vVXdDZhBa/Ghza1vzaZdo=;
        b=UZk8ZFu6v515XBCjhoL+rr4tOp/d8RoKcLozXA3k/AnMqIfGlJ1P7irLLamd9VtYXh
         /qtsAybBmo0XlCx3BR2rT5mRDkCLaK05eEGOs3BPBwAXSDvzjwr2lkEVZdYOVCWrWUOq
         1Pk+HExoxup57CjMyNVRWnnOAmWlE/B7pZjlud5F7qY6go6C3OpeB4uqSRd/HXU7xuTX
         XWCRE1zmwDHStrsXKllOH6bjjsQzemK1CawQgCunClY/VHPybCRPR0EHWdtCZI7z5MIu
         yJ0KRNFQOJnDZAKpJKF1xid6OwpBQt8mKg3lVG15j6Lag6ZxvZ5S/wb29GYd2D6AYPQV
         Qdjw==
X-Gm-Message-State: APjAAAUJLiaWJFwjJzKTcdx9jOoCpSktbp5SZ0MfmO0YXyT1p19zv/GD
        GfUU4vB//usTJ2guifX1g9ovtuYbnNwDIrcX+g0=
X-Google-Smtp-Source: APXvYqw8NxWNBMAQg+prj1Z6J3tAFZbuAh+ImBksrtUjlqlkkC8tJBBcqFJ7aCPLjzythQNt+TXpAs42ySY6N3wNVXM=
X-Received: by 2002:a92:b60e:: with SMTP id s14mr4891623ili.178.1575382722774;
 Tue, 03 Dec 2019 06:18:42 -0800 (PST)
MIME-Version: 1.0
References: <20191112104854.20850-1-masneyb@onstation.org> <CAOCk7NosRhRp3vZxg2Nx8106PQ0ryo5b68cUv605XUzCm6gYPA@mail.gmail.com>
 <20191113112334.GA18702@onstation.org> <20191203014006.GA7756@onstation.org>
In-Reply-To: <20191203014006.GA7756@onstation.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 3 Dec 2019 07:18:31 -0700
Message-ID: <CAOCk7NpHE7kPX5tc=qUJo9qM-7Qzg2E+zmmmhBdnnVwJ+i5XLg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: enable autocommit
To:     Brian Masney <masneyb@onstation.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 2, 2019 at 6:40 PM Brian Masney <masneyb@onstation.org> wrote:
>
> Hi Jeffrey,
>
> On Wed, Nov 13, 2019 at 06:23:34AM -0500, Brian Masney wrote:
> > On Tue, Nov 12, 2019 at 08:38:27AM -0700, Jeffrey Hugo wrote:
> > > On Tue, Nov 12, 2019 at 3:49 AM Brian Masney <masneyb@onstation.org> wrote:
> > > >
> > > > Since the introduction of commit 2d99ced787e3 ("drm/msm: async commit
> > > > support"), command-mode panels began throwing the following errors:
> > > >
> > > >     msm fd900000.mdss: pp done time out, lm=0
> > > >
> > > > Let's fix this by enabling the autorefresh feature that's available in
> > > > the MDP starting at version 1.0. This will cause the MDP to
> > > > automatically send a frame to the panel every time the panel invokes
> > > > the TE signal, which will trigger the PP_DONE IRQ. This requires not
> > > > sending a START signal for command-mode panels.
> > > >
> > > > This fixes the error and gives us a counter for command-mode panels that
> > > > we can use to implement async commit support for the MDP5 in a follow up
> > > > patch.
> > > >
> > > > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > > > Suggested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 15 ++++++++++++++-
> > > >  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c  |  9 +--------
> > > >  2 files changed, 15 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > > > index 05cc04f729d6..539348cb6331 100644
> > > > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > > > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> > > > @@ -456,6 +456,7 @@ static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
> > > >  {
> > > >         struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
> > > >         struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
> > > > +       struct mdp5_pipeline *pipeline = &mdp5_cstate->pipeline;
> > > >         struct mdp5_kms *mdp5_kms = get_kms(crtc);
> > > >         struct device *dev = &mdp5_kms->pdev->dev;
> > > >
> > > > @@ -493,9 +494,21 @@ static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
> > > >
> > > >         mdp_irq_register(&mdp5_kms->base, &mdp5_crtc->err);
> > > >
> > > > -       if (mdp5_cstate->cmd_mode)
> > > > +       if (mdp5_cstate->cmd_mode) {
> > > >                 mdp_irq_register(&mdp5_kms->base, &mdp5_crtc->pp_done);
> > > >
> > > > +               /*
> > > > +                * Enable autorefresh so we get regular ping/pong IRQs.
> > > > +                * - Bit 31 is the enable bit
> > > > +                * - Bits 0-15 represent the frame count, specifically how many
> > > > +                *   TE events before the MDP sends a frame.
> > > > +                */
> > > > +               mdp5_write(mdp5_kms,
> > > > +                          REG_MDP5_PP_AUTOREFRESH_CONFIG(pipeline->mixer->pp),
> > > > +                          BIT(31) | BIT(0));
> > > > +               crtc_flush_all(crtc);
> > > > +       }
> > > > +
> > > >         mdp5_crtc->enabled = true;
> > > >  }
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> > > > index 030279d7b64b..aee295abada3 100644
> > > > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> > > > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> > > > @@ -187,14 +187,7 @@ static bool start_signal_needed(struct mdp5_ctl *ctl,
> > > >         if (!ctl->encoder_enabled)
> > > >                 return false;
> > > >
> > > > -       switch (intf->type) {
> > > > -       case INTF_WB:
> > > > -               return true;
> > > > -       case INTF_DSI:
> > > > -               return intf->mode == MDP5_INTF_DSI_MODE_COMMAND;
> > > > -       default:
> > > > -               return false;
> > > > -       }
> > > > +       return intf->type == INTF_WB;
> > > >  }
> > >
> > > I don't think this fully works.
> > >
> > > The whole "flush" thing exists because the configuration is double
> > > buffered.  You write to the flush register to tell the hardware to
> > > pickup the new configuration, but it doesn't do that automatically.
> > > It only picks up the new config on the next "vsync".  When you have a
> > > video mode panel, you have the timing engine running, which drives
> > > that.  With a command mode panel, you have either the start signal, or
> > > the auto refresh to do the same, but you have a bit of a chicken and
> > > egg situation where if you are programming the hardware from scratch,
> > > autorefresh isn't already enabled to then pickup the config to enable
> > > autorefresh. In this case, you'll need a single start to kick
> > > everything off.  However, if say the bootloader already configured
> > > things and has autorefresh running, then you need to not do that start
> > > because you'll overload the DSI like you saw.
> >
> > As part of my testing for this work, I added a log statement to
> > mdp5_crtc_pp_done_irq() and it shows that a PP_IRQ comes in consistently
> > every ~0.0166 seconds, which is about 60 HZ. Without this change, plus
> > the 3 commits I mentioned in an earlier email related to the async
> > commit support, the PP IRQs come in at a variety of times: between every
> > ~0.0140 and ~0.2224 seconds. That's why I assumed that this was working.
> >
> > If I call send_start_signal() inside mdp5_crtc_atomic_enable(), then the
> > display does not work properly.
>
> I'd like to get the 'pp done time out' errors that are now occurring
> upstream for command-mode panels fixed. As I mentioned above, this patch
> fixes the problem on the Nexus 5 and the pp done interrupts are
> delivered at approximately 60 HZ. I don't have any other command-mode
> panels to test.
>
> I'm not sure how to proceed here since sending the start command breaks
> the display. I'm likely putting that command in the wrong spot.

Sorry, I didn't realize you were waiting on me,

I'm traveling currently, so this is more off the top of my head than
looking at the code/docs.  What I'm thinking is that we want to get
autorefresh enabled, which would be simple except that the bootloader
may have already enabled it for us.  Perhaps we have a state flag that
indicates if autorefresh is enabled, and if so, it skips the start
command (where the start command is normally in the code).  When we
boot up, we check the hardware and set the flag if its already enabled
(note I just realized the flag is per ping pong, so we need multiple
flags I guess).  If the flag is not enabled when we go to use the
start command, we issue the start, then set the flag.  The only catch
is I don't know recall the exact sequence of when we configure the
ping pong in the entire initialization sequence.  We may configure a
bunch of stuff, but not the ping pong, flush the config (which issues
a start) and then get stuck because we didn't set the autorefresh.
