Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDDEFCC3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 18:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbfKNR4b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 12:56:31 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:34082 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfKNR4b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 12:56:31 -0500
Received: by mail-io1-f68.google.com with SMTP id q83so7855855iod.1;
        Thu, 14 Nov 2019 09:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UgW4SMrfbhKMi9qgc5xZl0sjORDDULnrm3lI/5KuzN0=;
        b=BczWzv8BWuFkYr/ez120JhoXDON9V4jr1e7a7X3bdDZVaKAdeRUisMvpsO6UOKUThy
         WHcapILnkRuitE6uypIu0Rpz28ncsMLnRbIZMasKEHHY6UkhRcIaLLRFjZy3SxbVw9KO
         T5gkCjFGNPFk6GWgEiaR8f73EdzS3XnZ5u/mpYT9X/f5woxNI7V1v8yhKe9pIlhiVWL5
         7ftq3UhAgKkwCw8Hs0QSb7O97cFczFYDLGna7JMT3/cvPry3KXrx0bLnm8sCnun1SuyK
         FfbkaO7tj8Ig26mqxTqwYWUWr3V54VYodL/2keCogdeQtii18b5eerO78TBX8ZyQaH0+
         LvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UgW4SMrfbhKMi9qgc5xZl0sjORDDULnrm3lI/5KuzN0=;
        b=G1mBBMRdYFAG8eLNBU17mASEAs7S24jGv3IF7aIm4tyGjMZ5xfjXmosuiWD5sSWSNB
         SW+cqavtG0H4pAo4BfsRXrfNq9/xQGdxZ6f5mrM8fX4qVA2ILA/bJHJpDIGu3vVW7xun
         93C1sjipa7AkekXDp1sMslRrI6sGL45/Tk2bdwEgv6f4Fl/shP+EPvk5MiwOZJJv9oQ6
         LYC1XqOkzasVWiqX2Fk0NmAEyv28NBWM1OaPSTat88cBPxRwdpsx99kYU6Ip1nPEQvUl
         ZMf3QuG3bMyZMV5tLWgKqA64uLMU1bh8WviVUDxIcKQvnF4Weve6uQzvQMmwczWjFbyT
         IvtQ==
X-Gm-Message-State: APjAAAVJ7oOpf1Y7D3bGvv3e121sISG01yQ6cX0pRYwhkt1V1v9F6NY2
        8E/aZDuNSwr1Z6ARv/PaYS0rRSrtrCFaizgOj2s=
X-Google-Smtp-Source: APXvYqw/g3NqxOMX1Y/5RG0gnLKeBCaPRdyjqw6TZ9tiex96r00vefgQDZsKLpLgHA+e/Cm+l6/QF1d2um7ELXwke5s=
X-Received: by 2002:a5e:8a04:: with SMTP id d4mr7856754iok.42.1573754190499;
 Thu, 14 Nov 2019 09:56:30 -0800 (PST)
MIME-Version: 1.0
References: <1573726588-18897-1-git-send-email-harigovi@codeaurora.org>
 <1573726588-18897-3-git-send-email-harigovi@codeaurora.org> <CAF6AEGurmTxwhBeWf1Q2U7_jSwmofBq49G5dsZN0qRmAFfvDNQ@mail.gmail.com>
In-Reply-To: <CAF6AEGurmTxwhBeWf1Q2U7_jSwmofBq49G5dsZN0qRmAFfvDNQ@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 14 Nov 2019 10:56:19 -0700
Message-ID: <CAOCk7Nrap3y_NS8RMuqeLr+E5CP94xyqEBZfHBCtvocaTM1VVA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v1 2/2] drm/msm: add DSI config changes to
 support DSI version
To:     Rob Clark <robdclark@gmail.com>
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 14, 2019 at 10:47 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Nov 14, 2019 at 2:16 AM Harigovindan P <harigovi@codeaurora.org> wrote:
> >
> > Add DSI config changes to support DSI version.
> >
> > Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
>
> Reviewed-by: Rob Clark <robdclark@gmail.com>

Can we fix the subject/commit text for this to indicate what DSI
version and/or SoC this is for?  This is a SoC enablement patch, but
at first I thought this was some bug fix or something.

>
> For patch 1/2 with the panel driver, probably best to split that out
> into a different patch(set), since panel drivers are merged into
> drm-next via a different tree
>
> BR,
> -R
>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 21 +++++++++++++++++++++
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
> >  2 files changed, 22 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > index b7b7c1a..d2c4592 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > @@ -133,6 +133,10 @@ static const char * const dsi_sdm845_bus_clk_names[] = {
> >         "iface", "bus",
> >  };
> >
> > +static const char * const dsi_sc7180_bus_clk_names[] = {
> > +        "iface", "bus",
> > +};
> > +
> >  static const struct msm_dsi_config sdm845_dsi_cfg = {
> >         .io_offset = DSI_6G_REG_SHIFT,
> >         .reg_cfg = {
> > @@ -147,6 +151,20 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
> >         .num_dsi = 2,
> >  };
> >
> > +static const struct msm_dsi_config sc7180_dsi_cfg = {
> > +       .io_offset = DSI_6G_REG_SHIFT,
> > +       .reg_cfg = {
> > +               .num = 1,
> > +               .regs = {
> > +                       {"vdda", 21800, 4 },    /* 1.2 V */
> > +               },
> > +       },
> > +       .bus_clk_names = dsi_sc7180_bus_clk_names,
> > +       .num_bus_clks = ARRAY_SIZE(dsi_sc7180_bus_clk_names),
> > +       .io_start = { 0xae94000 },
> > +       .num_dsi = 1,
> > +};
> > +
> >  const static struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
> >         .link_clk_enable = dsi_link_clk_enable_v2,
> >         .link_clk_disable = dsi_link_clk_disable_v2,
> > @@ -201,6 +219,9 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
> >                 &msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> >         {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_1,
> >                 &sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> > +       {MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
> > +               &sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> > +
> >  };
> >
> >  const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> > index e2b7a7d..9919536 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> > @@ -19,6 +19,7 @@
> >  #define MSM_DSI_6G_VER_MINOR_V1_4_1    0x10040001
> >  #define MSM_DSI_6G_VER_MINOR_V2_2_0    0x20000000
> >  #define MSM_DSI_6G_VER_MINOR_V2_2_1    0x20020001
> > +#define MSM_DSI_6G_VER_MINOR_V2_4_1    0x20040001
> >
> >  #define MSM_DSI_V2_VER_MINOR_8064      0x0
> >
> > --
> > 2.7.4
> >
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
