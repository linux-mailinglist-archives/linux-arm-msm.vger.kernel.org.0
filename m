Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 756046B0734
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 13:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbjCHMf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 07:35:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbjCHMf1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 07:35:27 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7D7BCB9F
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 04:35:24 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id 82so14431933ybn.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678278923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Te0Wm1LBiLHbyjBQ4apLHzIYIeF5VCMITHqDeFoeL3c=;
        b=wjrI5GBxcLK2TpY/oAthDy4jtf1z+fsJuQ9xjcbxHaIlP6smp1deqrOVtdOkNnjFIA
         2UrygRCRUkSvYhYIP206gLrLjl0xPM+AD4S5GNdOAcW4d8tIqfe3pZYgXtRsu5Y6lGcH
         j16ROAYlk8/QmUFivnX7oGT1kpc1TF2IyACh3W9NPSJUUaFMKuOvXh7itExrkzx08ERc
         PyntbpEt932gCKkR86biuXCM/rCAdWH4X1ofg+KEsTel8id7WapS80VxZU77UhUOU/Rw
         e70eEtSpzO80RkRXAQg+49btgEFiOrqzTapKjhJrIL/0rBejgJQOCpfPh+HJmAmXw0Xc
         tW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678278923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Te0Wm1LBiLHbyjBQ4apLHzIYIeF5VCMITHqDeFoeL3c=;
        b=Uu4oE8hgfeCMWwpTrSRDZgrNtR/I7ss08B5J1cZvyEo6O4jnHO/5T5jCcZPwBe5EDF
         XaTVVoyMU24OiYRHTPE+izCdPSrdmgTdAm+n7ZMZrFiEAQw0PIhuKxVK1x1MI3Fb/Ihb
         /S6fDSTFAJiIqv6+FU3dG/+cy6vw4uUrkGsWI/tQcmHyJ3Mx9OK/WCKjIegUjuoLJJ3O
         MtVtSeqzp8lVt87UAe6CAWJ6KdPObg+pNEu3S08Vn+//3z80ur0QsaHDnl58/nwLpdpt
         KYpaGwpOY1U6rqpf4UsKvclsJ2Ht80NtP0oA7QOaULScA8hUsHYBfp67XuBgMrx2XY03
         lJXg==
X-Gm-Message-State: AO0yUKXd/OFl3ODOznoHKzJ9SZHlc1iloUxQkjOvoQwLliUwHuS0MLmQ
        9zRPueVdPSEbA9qHMSOS8chmbpOsZqc6zydoIpLfXA==
X-Google-Smtp-Source: AK7set+wT84PGBj+94QLZa9jjubNNjq68RKKqm41jG5BChuSqdm07c0307nCBlq5YlWDhnsqSvsRE1NW+v6KzhRiMcM=
X-Received: by 2002:a5b:70c:0:b0:a30:38fb:a0b8 with SMTP id
 g12-20020a5b070c000000b00a3038fba0b8mr11038426ybq.9.1678278923492; Wed, 08
 Mar 2023 04:35:23 -0800 (PST)
MIME-Version: 1.0
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20221102180705.459294-6-dmitry.baryshkov@linaro.org> <ZAhhrG6CliC83Oxr@hovoldconsulting.com>
In-Reply-To: <ZAhhrG6CliC83Oxr@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 8 Mar 2023 14:35:12 +0200
Message-ID: <CAA8EJprKDXYjd2zUdAGZkUEVt++XtA03RnCoYAfb-gJUz7tMsg@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
To:     Johan Hovold <johan@kernel.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 8 Mar 2023 at 12:20, Johan Hovold <johan@kernel.org> wrote:
>
> On Wed, Nov 02, 2022 at 09:07:03PM +0300, Dmitry Baryshkov wrote:
> > The functionality of drm_bridge_connector_enable_hpd() and
> > drm_bridge_connector_disable_hpd() is provided automatically by the
> > drm_kms_poll helpers. Stop calling these functions manually.
>
> I stumbled over this one when investigating a hotplug-related crash in
> the MSM DRM driver which this series prevents by moving hotplug
> notification enable to drm_kms_helper_poll_enable().
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/hdmi/hdmi.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > index 93fe61b86967..a540c45d4fd3 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> > @@ -348,8 +348,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
> >               goto fail;
> >       }
> >
> > -     drm_bridge_connector_enable_hpd(hdmi->connector);
> > -
> >       ret = msm_hdmi_hpd_enable(hdmi->bridge);
> >       if (ret < 0) {
> >               DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
>
> It looks like you are now enabling hotplug events before the DRM driver
> is ready to receive them (i.e. msm_hdmi_hpd_enable() is called before
> drm_bridge_connector_enable_hpd()).
>
> Could this not lead to missed events or is the state being setup
> correctly somewhere else?
>
> Shouldn't the call to msm_hdmi_hpd_enable() be moved to when HPD is
> enabled either way (e.g. by being converted to a hpd_enable callback)?

Eventually I'll get to it (hopefully during this weekend). There is
one item which needs to be investigated, see [1]. I have to check if
this is applicable to earlier generations, which also means
resurrecting the msm8974 HDMI PHY patchset posted ages ago. I think
the initial status is determined correctly using the .detect(). At
least I saw no issues with this patchset. However, thanks for the
pointer.

[1] https://git.codelinaro.org/linaro/qcomlt/kernel/-/commit/6ae2c308555f470ba63f90b7171519a242f96a67


-- 
With best wishes
Dmitry
