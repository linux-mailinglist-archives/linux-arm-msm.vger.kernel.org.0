Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34CCEF9487
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 16:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfKLPij (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 10:38:39 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:44417 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727316AbfKLPij (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 10:38:39 -0500
Received: by mail-il1-f196.google.com with SMTP id i6so15899070ilr.11;
        Tue, 12 Nov 2019 07:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yr6BI4I1G58Q9ppVoxfKvd4slmiaD/nL3ZVF0pbXsZk=;
        b=K9hrElsX99SWt5Ednn+QUE5MOS8fc8J3NVvLl7BRMQGWsS1fWdA9JEElCCtyaeOk9n
         Io6irpQ8lqfrQ5ej5SHkFxlDC+/tPTimgZL3QYj6H9VVVgEhiSQYjBNVBWqz7fS/fCQx
         CkmdQuNF5C+PARJ/o/pArFQmurRyHmyN4dhKNjg9xgdnQ6+1th6bMRPtDzSvZbGDP9/k
         q45SLHsr+TjPHEuC/Ygaypa72od6jdz06x5VY0PBRJUDB+h/bGqPG11W1xHVuqiL1M2y
         TDfAOzuog9vUJQGrqcSXcSe/kmVyRlax5KENFMFBxrC11kCZ5FcAaMl1uHR5idIMNx68
         x7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yr6BI4I1G58Q9ppVoxfKvd4slmiaD/nL3ZVF0pbXsZk=;
        b=rMqx4vona6SScM20m2EV/gN5BAJeuYS5fp0gtJuVG42e6gSmHa3XhXq6q3HTBo9EEV
         ChvwycLW7NZaUQfHExOfz3yj1Y9uq2T+LFt2EVFwNAFNIqVoCbFUgKctUWsicRe2tP9B
         IwUzJEk2byJjHHTpNM/PEOxrterrb4w5Ojs6WnsJICYpTMdo3qwKPk3Vbqbwy6W/Y1aI
         xWjFVWbIFEEtO2amE/WQ9CAl699X5ZimS6RuNSj5OSZmhehobp/bNdbgrbAzBZHHDA61
         6TUUhddiw3oimKU417oyDhy0OpyJ/nzHnrAAr7stbiUF1tRtj/I+76pWu8gEXBhziuwI
         tfGQ==
X-Gm-Message-State: APjAAAVyWfFHq6b9gO0mwCGdm2Fif/KS1Ohck5IvuJvz+/tyv3HxshRV
        nbAJomZ1amJieGRBXopeFGh04oLypdehcJJtvPA=
X-Google-Smtp-Source: APXvYqySAuW+prOeEBX4YzE0FVWFfe7dV+Mh0+pdW6Q0AWECKwn+x1wFimNSpWPY+i3JTrNJuDQ0Sa1W+XdOoMMdiD8=
X-Received: by 2002:a92:b60e:: with SMTP id s14mr36796565ili.178.1573573118182;
 Tue, 12 Nov 2019 07:38:38 -0800 (PST)
MIME-Version: 1.0
References: <20191112104854.20850-1-masneyb@onstation.org>
In-Reply-To: <20191112104854.20850-1-masneyb@onstation.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 12 Nov 2019 08:38:27 -0700
Message-ID: <CAOCk7NosRhRp3vZxg2Nx8106PQ0ryo5b68cUv605XUzCm6gYPA@mail.gmail.com>
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

On Tue, Nov 12, 2019 at 3:49 AM Brian Masney <masneyb@onstation.org> wrote:
>
> Since the introduction of commit 2d99ced787e3 ("drm/msm: async commit
> support"), command-mode panels began throwing the following errors:
>
>     msm fd900000.mdss: pp done time out, lm=0
>
> Let's fix this by enabling the autorefresh feature that's available in
> the MDP starting at version 1.0. This will cause the MDP to
> automatically send a frame to the panel every time the panel invokes
> the TE signal, which will trigger the PP_DONE IRQ. This requires not
> sending a START signal for command-mode panels.
>
> This fixes the error and gives us a counter for command-mode panels that
> we can use to implement async commit support for the MDP5 in a follow up
> patch.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> Suggested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 15 ++++++++++++++-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c  |  9 +--------
>  2 files changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index 05cc04f729d6..539348cb6331 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -456,6 +456,7 @@ static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
>  {
>         struct mdp5_crtc *mdp5_crtc = to_mdp5_crtc(crtc);
>         struct mdp5_crtc_state *mdp5_cstate = to_mdp5_crtc_state(crtc->state);
> +       struct mdp5_pipeline *pipeline = &mdp5_cstate->pipeline;
>         struct mdp5_kms *mdp5_kms = get_kms(crtc);
>         struct device *dev = &mdp5_kms->pdev->dev;
>
> @@ -493,9 +494,21 @@ static void mdp5_crtc_atomic_enable(struct drm_crtc *crtc,
>
>         mdp_irq_register(&mdp5_kms->base, &mdp5_crtc->err);
>
> -       if (mdp5_cstate->cmd_mode)
> +       if (mdp5_cstate->cmd_mode) {
>                 mdp_irq_register(&mdp5_kms->base, &mdp5_crtc->pp_done);
>
> +               /*
> +                * Enable autorefresh so we get regular ping/pong IRQs.
> +                * - Bit 31 is the enable bit
> +                * - Bits 0-15 represent the frame count, specifically how many
> +                *   TE events before the MDP sends a frame.
> +                */
> +               mdp5_write(mdp5_kms,
> +                          REG_MDP5_PP_AUTOREFRESH_CONFIG(pipeline->mixer->pp),
> +                          BIT(31) | BIT(0));
> +               crtc_flush_all(crtc);
> +       }
> +
>         mdp5_crtc->enabled = true;
>  }
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> index 030279d7b64b..aee295abada3 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> @@ -187,14 +187,7 @@ static bool start_signal_needed(struct mdp5_ctl *ctl,
>         if (!ctl->encoder_enabled)
>                 return false;
>
> -       switch (intf->type) {
> -       case INTF_WB:
> -               return true;
> -       case INTF_DSI:
> -               return intf->mode == MDP5_INTF_DSI_MODE_COMMAND;
> -       default:
> -               return false;
> -       }
> +       return intf->type == INTF_WB;
>  }

I don't think this fully works.

The whole "flush" thing exists because the configuration is double
buffered.  You write to the flush register to tell the hardware to
pickup the new configuration, but it doesn't do that automatically.
It only picks up the new config on the next "vsync".  When you have a
video mode panel, you have the timing engine running, which drives
that.  With a command mode panel, you have either the start signal, or
the auto refresh to do the same, but you have a bit of a chicken and
egg situation where if you are programming the hardware from scratch,
autorefresh isn't already enabled to then pickup the config to enable
autorefresh. In this case, you'll need a single start to kick
everything off.  However, if say the bootloader already configured
things and has autorefresh running, then you need to not do that start
because you'll overload the DSI like you saw.

Nothing is simple, is it?  :)
