Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B176E4AEBF8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 09:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233248AbiBIIOx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 03:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiBIIOw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 03:14:52 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08ADFC0613CA
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 00:14:56 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id v5-20020a17090a4ec500b001b8b702df57so4391479pjl.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 00:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5hlB8ZPr2GmnOnu8XFX1J5eiSeUsGyxYZJFE5meB+UQ=;
        b=tz3WWxKU/OCdED3uW7gqo6ktT8sPjqnN6U9Lcx7wSBKugly429InseScj+oWW6U2EJ
         qwKmgbM0zXeXb2knpGBqAf39ij+53BR53KkhWnpsDi8qFdlUJ2diJNUynC3rQRm0KNzk
         dfmMIFndoaf/l/eM5KX158rSMeBmO4BWqlPjSpzSZiPUeVAqCZBpaj0NdhNXjMvf3TzI
         ckZrdLYGbTcxlJ8DngY6k9kteHHTH+FQRvz1PluczWr+XvrmT7cTfbTY2AVp7gbN7o8B
         LFiIviZAk7zU6xIwG+bdV+dzeSbtdUDY4cKnI8JJXgGpB9RGqwzMna0P8XzuQP1gJwL3
         crog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5hlB8ZPr2GmnOnu8XFX1J5eiSeUsGyxYZJFE5meB+UQ=;
        b=EgUwm0ZBSWlgNPjP1xCG74kV5Zh2h9AzhHDsRQ/AKoi829rKxpg16PZAbNQlbJeQ+e
         aJka7hegsoimlagt3px9Sq86Tn8pTZI1S11RY8F6xP1KlYrpqD4csIErtgy0n3PhHGYe
         /XfEkcBdXChguE/zRnBGsj57ny2hv32RMS6o5bv5CyMsH2DcwhaBCplxaBTyv5GZ7q7R
         74yWLryPbGhBypa4RcfeJw6KESyRf8LqupQ/jMwwmWNeyj/fh8T9qsL0JN/TagAxXfu8
         ga0Yiq9GQc5iNgNpqsDmPElPnxl8wbhQGFgu34mNrLlFrsWIW3caKexVW2MgvhutEXY6
         57eQ==
X-Gm-Message-State: AOAM532aQ6bZ68RzRYvtn9GLkDfZP7YcKK/UoHvJktDVtoVVSkXMrlFE
        jQm68QBSDSFPgMKTzyPZ8sFNReGl0QixGCgSgARD0A==
X-Google-Smtp-Source: ABdhPJxkfTTgnxcfbaV5e3D0l5htHMfOT0/u5skd8z6zuh2S5sSKg0TzxX7M1ivJyqyWJj8sqruPumL/Tnen9ChdGIY=
X-Received: by 2002:a17:90a:7a82:: with SMTP id q2mr1293297pjf.40.1644394495280;
 Wed, 09 Feb 2022 00:14:55 -0800 (PST)
MIME-Version: 1.0
References: <1644346272-3403-1-git-send-email-loic.poulain@linaro.org>
 <1644346272-3403-2-git-send-email-loic.poulain@linaro.org> <9a25cdaa-7f2c-3f85-0560-26684295731f@linaro.org>
In-Reply-To: <9a25cdaa-7f2c-3f85-0560-26684295731f@linaro.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Wed, 9 Feb 2022 09:14:19 +0100
Message-ID: <CAMZdPi-A+z0igny79gNhbp1WcFV2g0RCwM1_f7vZVFQAzcY98A@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dsi: Add support for qcm2290 dsi controller
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     robdclark@gmail.com, sean@poorly.run, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Tue, 8 Feb 2022 at 20:00, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 08/02/2022 21:51, Loic Poulain wrote:
> > Using exact version of the block as compatible string.
>
> It would be nice to add a few words here, why is this necessary.
> If you provide a paragraph, I'll insert it when applying the patch.

Thanks!

--
QCM2290 MDSS includes a Qualcomm DSI controller v2.4.1. Since this
controller version is not SoC specific, and already assigned to sc7180
for auto configuration, we rely on DSI block specific compatible
string "qcom,dsi-ctrl-6g-qcm2290", and use the device's data to point
to the right dsi config handler.
--


>
> Other than that:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dsi/dsi.c     |  2 ++
> >   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 23 +++++++++++++++++++++++
> >   drivers/gpu/drm/msm/dsi/dsi_cfg.h |  3 +++
> >   3 files changed, 28 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> > index 06a9008..bed8b24b 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> > @@ -4,6 +4,7 @@
> >    */
> >
> >   #include "dsi.h"
> > +#include "dsi_cfg.h"
> >
> >   struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
> >   {
> > @@ -171,6 +172,7 @@ static int dsi_dev_remove(struct platform_device *pdev)
> >
> >   static const struct of_device_id dt_match[] = {
> >       { .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
> > +     { .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = &qcm2290_dsi_cfg_handler },
> >       {}
> >   };
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > index 96bbc8b..2c23324 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > @@ -213,6 +213,24 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
> >       .num_dsi = 1,
> >   };
> >
> > +static const char * const dsi_qcm2290_bus_clk_names[] = {
> > +     "iface", "bus",
> > +};
> > +
> > +static const struct msm_dsi_config qcm2290_dsi_cfg = {
> > +     .io_offset = DSI_6G_REG_SHIFT,
> > +     .reg_cfg = {
> > +             .num = 1,
> > +             .regs = {
> > +                     {"vdda", 21800, 4 },    /* 1.2 V */
> > +             },
> > +     },
> > +     .bus_clk_names = dsi_qcm2290_bus_clk_names,
> > +     .num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
> > +     .io_start = { 0x5e94000 },
> > +     .num_dsi = 1,
> > +};
> > +
> >   static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
> >       .link_clk_set_rate = dsi_link_clk_set_rate_v2,
> >       .link_clk_enable = dsi_link_clk_enable_v2,
> > @@ -300,3 +318,8 @@ const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
> >       return cfg_hnd;
> >   }
> >
> > +/*  Non autodetect configs */
> > +const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler = {
> > +     .cfg = &qcm2290_dsi_cfg,
> > +     .ops = &msm_dsi_6g_v2_host_ops,
> > +};
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> > index 41e99a9..fe54a99 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> > @@ -60,5 +60,8 @@ struct msm_dsi_cfg_handler {
> >
> >   const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor);
> >
> > +/* Non autodetect configs */
> > +extern const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler;
> > +
> >   #endif /* __MSM_DSI_CFG_H__ */
> >
>
>
> --
> With best wishes
> Dmitry
