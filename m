Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF915F982
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 16:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727229AbfGDOAh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 10:00:37 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35585 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbfGDOAh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 10:00:37 -0400
Received: by mail-ed1-f66.google.com with SMTP id w20so5542713edd.2;
        Thu, 04 Jul 2019 07:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HMTl4ePFhkH/NYoGcX+X5eP1rO1yNge0+/aoWl+3Kxc=;
        b=By1AtMX5jEZPJ4J24SQyPaKTsYJ2JtL1Y0VZb/VDK2/3CrPleHUSdY2QElWAXtMNxi
         k7Sb0CmFoCdLCGhArhTOHz5aLfafjqLS9dsxVpGvpF8ZodStmt6qLJ0uC1UMjxHXL/i/
         C0d319P/ztxBHeB3kTRoOnJRddbG9Bqg6+D6cytnVG/lHqBqktMG+TfWLqu2EXySXpdB
         WGmDLg5jwOxrCWrTOxgJnZKTtFfzB6V/vQVAThp4Q6dEIET/jeq1ele2FG8kFfSqp2pq
         AApQx8YFNMPJZUig2WjBXBDEcahQRBmZReUru5bqOU+s4I5E0fKW53HkHkPPArMDDP/W
         hqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HMTl4ePFhkH/NYoGcX+X5eP1rO1yNge0+/aoWl+3Kxc=;
        b=srL5CfhWmu2xynW1eQf2gHz0f1o89CzBxoYlKiOeguT1CbMOobbQGpUHLOQOaK28Yf
         uoc2h/CC2Z0xf4KCuFx5/A7VKHxPJzz3+EM0akDhbHUdRN9xmY+K7OYlrWPyJz1Wys3P
         iKiCrQzX8QohqGr/bqf4Jn/ddfWZs+i/ZntQmSYdwPJM+n1w68JXsxk0z0imUgkC3ZNW
         1xxpoRBUETKtcquhbqe+oOJJK641VBNroYhzf75K8Atn/fPfwAWw+fMnfmBSLM52hVO/
         SmnW2lpP+3K3PudP7Def5WzeE2t0EVsxa8oW2p2R0Gi8llwTBwOSnloPFzG3p7WDB8xs
         MR5g==
X-Gm-Message-State: APjAAAXvl2Ii92UHQOQJopXAuyieo7T90igLE5mURNp0sep4hYU3549W
        oRuhGPvCiqT7qzEIzQfxOYki+F/diMjQTPDBcfU=
X-Google-Smtp-Source: APXvYqzt53qJ6zbCj1CHOqsKdMrnqupwCudH0gFOg52VQqIxQGj4vvfOJvh9gAgbdIhPO7ETsnkN6Wn04FcbqusBGnI=
X-Received: by 2002:a17:906:85d4:: with SMTP id i20mr40872552ejy.256.1562248834738;
 Thu, 04 Jul 2019 07:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190630131445.25712-1-robdclark@gmail.com> <CGME20190630131612epcas1p22f241f3e6edc3976f7abedcb74f86e3a@epcas1p2.samsung.com>
 <20190630131445.25712-4-robdclark@gmail.com> <8a88e865-68a1-37e2-93a1-efd50a778c47@samsung.com>
In-Reply-To: <8a88e865-68a1-37e2-93a1-efd50a778c47@samsung.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 4 Jul 2019 07:00:18 -0700
Message-ID: <CAF6AEGuRFb1y4rXY5kqgPpZ=timF4rBcUsfxSKtv0ZqOopc03Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/dsi: make sure we have panel or bridge earlier
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Sibi Sankar <sibis@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 3, 2019 at 11:39 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> On 30.06.2019 15:14, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > If we are going to -EPROBE_DEFER due to panel/bridge not probed yet, we
> > want to do it before we start touching hardware.
>
>
> As the evidence shows, if the driver create bus (mipi-dsi), then it
> should not defer probing due to lack of sink (panel/bridge), because the
> sink will not appear without the bus.
>
> Instead of defer probing you can defer component binding, or if you like
> challenges you can implement dynamic sink binding :)
>

I have something working that doesn't require this patch.. although it
does require CCF to export a function to check if clks are enabled so
the driver can detect if the display is already enabled.  (Well, there
kind of is, __clk_is_enabled().. but currently in clk-provider.h)

So we can drop this patch.

BR,
-R

>
> Regards
>
> Andrzej
>
>
>
>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi.h         |  2 +-
> >  drivers/gpu/drm/msm/dsi/dsi_host.c    | 30 +++++++++++++--------------
> >  drivers/gpu/drm/msm/dsi/dsi_manager.c |  9 +++-----
> >  3 files changed, 19 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> > index 53bb124e8259..e15e7534ccd9 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi.h
> > +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> > @@ -171,7 +171,7 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
> >  struct drm_panel *msm_dsi_host_get_panel(struct mipi_dsi_host *host);
> >  unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
> >  struct drm_bridge *msm_dsi_host_get_bridge(struct mipi_dsi_host *host);
> > -int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer);
> > +int msm_dsi_host_register(struct mipi_dsi_host *host);
> >  void msm_dsi_host_unregister(struct mipi_dsi_host *host);
> >  int msm_dsi_host_set_src_pll(struct mipi_dsi_host *host,
> >                       struct msm_dsi_pll *src_pll);
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index 1ae2f5522979..8e5b0ba9431e 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1824,6 +1824,20 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
> >               goto fail;
> >       }
> >
> > +     /*
> > +      * Make sure we have panel or bridge early, before we start
> > +      * touching the hw.  If bootloader enabled the display, we
> > +      * want to be sure to keep it running until the bridge/panel
> > +      * is probed and we are all ready to go.  Otherwise we'll
> > +      * kill the display and then -EPROBE_DEFER
> > +      */
> > +     if (IS_ERR(of_drm_find_panel(msm_host->device_node)) &&
> > +                     !of_drm_find_bridge(msm_host->device_node)) {
> > +             pr_err("%s: no panel or bridge yet\n", __func__);
> > +             return -EPROBE_DEFER;
> > +     }
> > +
> > +
> >       msm_host->ctrl_base = msm_ioremap(pdev, "dsi_ctrl", "DSI CTRL");
> >       if (IS_ERR(msm_host->ctrl_base)) {
> >               pr_err("%s: unable to map Dsi ctrl base\n", __func__);
> > @@ -1941,7 +1955,7 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
> >       return 0;
> >  }
> >
> > -int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer)
> > +int msm_dsi_host_register(struct mipi_dsi_host *host)
> >  {
> >       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> >       int ret;
> > @@ -1955,20 +1969,6 @@ int msm_dsi_host_register(struct mipi_dsi_host *host, bool check_defer)
> >                       return ret;
> >
> >               msm_host->registered = true;
> > -
> > -             /* If the panel driver has not been probed after host register,
> > -              * we should defer the host's probe.
> > -              * It makes sure panel is connected when fbcon detects
> > -              * connector status and gets the proper display mode to
> > -              * create framebuffer.
> > -              * Don't try to defer if there is nothing connected to the dsi
> > -              * output
> > -              */
> > -             if (check_defer && msm_host->device_node) {
> > -                     if (IS_ERR(of_drm_find_panel(msm_host->device_node)))
> > -                             if (!of_drm_find_bridge(msm_host->device_node))
> > -                                     return -EPROBE_DEFER;
> > -             }
> >       }
> >
> >       return 0;
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > index ff39ce6150ad..cd3450dc3481 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -82,7 +82,7 @@ static int dsi_mgr_setup_components(int id)
> >       int ret;
> >
> >       if (!IS_DUAL_DSI()) {
> > -             ret = msm_dsi_host_register(msm_dsi->host, true);
> > +             ret = msm_dsi_host_register(msm_dsi->host);
> >               if (ret)
> >                       return ret;
> >
> > @@ -101,14 +101,11 @@ static int dsi_mgr_setup_components(int id)
> >               /* Register slave host first, so that slave DSI device
> >                * has a chance to probe, and do not block the master
> >                * DSI device's probe.
> > -              * Also, do not check defer for the slave host,
> > -              * because only master DSI device adds the panel to global
> > -              * panel list. The panel's device is the master DSI device.
> >                */
> > -             ret = msm_dsi_host_register(slave_link_dsi->host, false);
> > +             ret = msm_dsi_host_register(slave_link_dsi->host);
> >               if (ret)
> >                       return ret;
> > -             ret = msm_dsi_host_register(master_link_dsi->host, true);
> > +             ret = msm_dsi_host_register(master_link_dsi->host);
> >               if (ret)
> >                       return ret;
> >
>
>
