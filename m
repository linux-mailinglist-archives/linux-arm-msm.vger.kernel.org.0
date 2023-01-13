Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94ACF668F68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 08:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233845AbjAMHnk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 02:43:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239679AbjAMHn2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 02:43:28 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F8133D66
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 23:43:27 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-4a2f8ad29d5so273228557b3.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 23:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pveQvC9geXlggGUH8DRbGtxihrfhzHOD5orQIAIGKxk=;
        b=Lq3l68ot5VTZ6ll8/03xKza+baaM0UgNRu/0tY7i6lkUu5JBeAlVmaLCAAUWMteZAo
         mJQN7YMRmgn8m1DDT67ixQ1GdpYagExV3tM2C7ixRYeuedLp6x6ExeWel2HckxxKDcz0
         tDYw2vBAS1LnjD52lHxBhkC4XLDty6LhTfYIYAJy4kzR+dG3FRG3NKC5v6dDgYsCqUti
         fb1lsFMm7cLMa43PLWMEh2cca3vCRCI9PNFTlGKLk0YS/3NBvBNEDNdWsh60GVu1YVLJ
         rgGr9Um1itaxM1/bYh84dCk7eBp3T3+fjNp7SP+T48jPkZk6m8keCq8fWOhGZXvcmb6Z
         e0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pveQvC9geXlggGUH8DRbGtxihrfhzHOD5orQIAIGKxk=;
        b=kEUtFw54kp6tD9VgKVXHlFh0RBJiCecwfZ+z3sDyl9QtAHEulEwwTwDi90hc1QSzmf
         vYFJGMvCKd67CTrWBhgpRfFIppCisuQNboZKXSk0SQT1J+PtJFih1aB5Aytx53tjIYlw
         TyXNwWLhgMP+7XEbwzi9cP/Hp/UhTwxKJzUg/BZVu0DtJM8/44KHKgvIN2w1NGAVpWcG
         PIIOs0D6nUOY30vlz5RwNK55STrD2bcA8s6+Ng+ldIqI4IDciER4Hn4fuCHV6/r/buZ+
         Ypar73ywEtNANTeYMXZdPYINDU2pxDnD9WL0j2DKxNn1WzFPG3xSb/1MQbxm665CrmYK
         rnRw==
X-Gm-Message-State: AFqh2kot8DVpcuXUiYqk9IEJKe1z9s2akXcbwzrtUVljQWzFdvErL3Oi
        j0xlCTxXLl3dzc+sTuNraltUSE9500TFY5CVRCNPjQ==
X-Google-Smtp-Source: AMrXdXvDkAaLaJn6GdgMumVLjytQQimVCYwyF9Bwvi9MSJ39/s6JbyBUZzOaGWRSm7m+xqcf/HaHDYy9b632smNadQ8=
X-Received: by 2002:a0d:cb0b:0:b0:370:4c23:eacc with SMTP id
 n11-20020a0dcb0b000000b003704c23eaccmr2939965ywd.127.1673595806343; Thu, 12
 Jan 2023 23:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20230112154247.1532202-1-dmitry.baryshkov@linaro.org> <20230113071218.kzlb5rdbdipopr2o@fsr-ub1664-121.ea.freescale.net>
In-Reply-To: <20230113071218.kzlb5rdbdipopr2o@fsr-ub1664-121.ea.freescale.net>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 13 Jan 2023 09:43:15 +0200
Message-ID: <CAA8EJpr2QZTZdD7-qCmz8LmwVbPXfT09ZegOdQ8JEuYToYm45A@mail.gmail.com>
Subject: Re: [PATCH] drm/probe_helper: sort out poll_running vs poll_enabled
To:     Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 13 Jan 2023 at 09:12, Laurentiu Palcu
<laurentiu.palcu@oss.nxp.com> wrote:
>
> Hi Dmitry,
>
> On Thu, Jan 12, 2023 at 05:42:47PM +0200, Dmitry Baryshkov wrote:
> > There are two flags attemting to guard connector polling:
> > poll_enabled and poll_running. While poll_enabled semantics is clearly
> > defined and fully adhered (mark that drm_kms_helper_poll_init() was
> > called and not finalized by the _fini() call), the poll_running flag
> > doesn't have such clearliness.
> >
> > This flag is used only in drm_helper_probe_single_connector_modes() to
> > guard calling of drm_kms_helper_poll_enable, it doesn't guard the
> > drm_kms_helper_poll_fini(), etc. Change it to only be set if the polling
> > is actually running. Tie HPD enablement to this flag.
> >
> > This fix the following warning reported after merging the HPD series:
>
> s/fix/fixes/
>
> >
> > Hot plug detection already enabled
> > WARNING: CPU: 2 PID: 9 at drivers/gpu/drm/drm_bridge.c:1257 drm_bridge_hpd_enable+0x94/0x9c [drm]
> > Modules linked in: videobuf2_memops snd_soc_simple_card snd_soc_simple_card_utils fsl_imx8_ddr_perf videobuf2_common snd_soc_imx_spdif adv7511 etnaviv imx8m_ddrc imx_dcss mc cec nwl_dsi gov
> > CPU: 2 PID: 9 Comm: kworker/u8:0 Not tainted 6.2.0-rc2-15208-g25b283acd578 #6
> > Hardware name: NXP i.MX8MQ EVK (DT)
> > Workqueue: events_unbound deferred_probe_work_func
> > pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > pc : drm_bridge_hpd_enable+0x94/0x9c [drm]
> > lr : drm_bridge_hpd_enable+0x94/0x9c [drm]
> > sp : ffff800009ef3740
> > x29: ffff800009ef3740 x28: ffff000009331f00 x27: 0000000000001000
> > x26: 0000000000000020 x25: ffff800001148ed8 x24: ffff00000a8fe000
> > x23: 00000000fffffffd x22: ffff000005086348 x21: ffff800001133ee0
> > x20: ffff00000550d800 x19: ffff000005086288 x18: 0000000000000006
> > x17: 0000000000000000 x16: ffff8000096ef008 x15: 97ffff2891004260
> > x14: 2a1403e194000000 x13: 97ffff2891004260 x12: 2a1403e194000000
> > x11: 7100385f29400801 x10: 0000000000000aa0 x9 : ffff800008112744
> > x8 : ffff000000250b00 x7 : 0000000000000003 x6 : 0000000000000011
> > x5 : 0000000000000000 x4 : ffff0000bd986a48 x3 : 0000000000000001
> > x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000000250000
> > Call trace:
> >  drm_bridge_hpd_enable+0x94/0x9c [drm]
> >  drm_bridge_connector_enable_hpd+0x2c/0x3c [drm_kms_helper]
> >  drm_kms_helper_poll_enable+0x94/0x10c [drm_kms_helper]
> >  drm_helper_probe_single_connector_modes+0x1a8/0x510 [drm_kms_helper]
> >  drm_client_modeset_probe+0x204/0x1190 [drm]
> >  __drm_fb_helper_initial_config_and_unlock+0x5c/0x4a4 [drm_kms_helper]
> >  drm_fb_helper_initial_config+0x54/0x6c [drm_kms_helper]
> >  drm_fbdev_client_hotplug+0xd0/0x140 [drm_kms_helper]
> >  drm_fbdev_generic_setup+0x90/0x154 [drm_kms_helper]
> >  dcss_kms_attach+0x1c8/0x254 [imx_dcss]
> >  dcss_drv_platform_probe+0x90/0xfc [imx_dcss]
> >  platform_probe+0x70/0xcc
> >  really_probe+0xc4/0x2e0
> >  __driver_probe_device+0x80/0xf0
> >  driver_probe_device+0xe0/0x164
> >  __device_attach_driver+0xc0/0x13c
> >  bus_for_each_drv+0x84/0xe0
> >  __device_attach+0xa4/0x1a0
> >  device_initial_probe+0x1c/0x30
> >  bus_probe_device+0xa4/0xb0
> >  deferred_probe_work_func+0x90/0xd0
> >  process_one_work+0x200/0x474
> >  worker_thread+0x74/0x43c
> >  kthread+0xfc/0x110
> >  ret_from_fork+0x10/0x20
> > ---[ end trace 0000000000000000 ]---
> >
> > Reported-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > Fixes: c8268795c9a9 ("drm/probe-helper: enable and disable HPD on connectors")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_probe_helper.c | 110 +++++++++++++++++------------
> >  1 file changed, 63 insertions(+), 47 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> > index 7973f2589ced..ef919d95fea6 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -222,6 +222,45 @@ drm_connector_mode_valid(struct drm_connector *connector,
> >       return ret;
> >  }
> >
> > +static void drm_kms_helper_disable_hpd(struct drm_device *dev)
> > +{
> > +     struct drm_connector *connector;
> > +     struct drm_connector_list_iter conn_iter;
> > +
> > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter) {
> > +             const struct drm_connector_helper_funcs *funcs =
> > +                     connector->helper_private;
> > +
> > +             if (funcs && funcs->disable_hpd)
> > +                     funcs->disable_hpd(connector);
> > +     }
> > +     drm_connector_list_iter_end(&conn_iter);
> > +}
> > +
> > +static bool drm_kms_helper_enable_hpd(struct drm_device *dev)
> > +{
> > +     bool poll = false;
> > +     struct drm_connector *connector;
> > +     struct drm_connector_list_iter conn_iter;
> > +
> > +     drm_connector_list_iter_begin(dev, &conn_iter);
> > +     drm_for_each_connector_iter(connector, &conn_iter) {
> > +             const struct drm_connector_helper_funcs *funcs =
> > +                     connector->helper_private;
> > +
> > +             if (funcs && funcs->disable_hpd)
> > +                     funcs->disable_hpd(connector);
>
> I believe this is not right. You probably wanted to use enable_hpd
> instead of disable_hpd on these two lines? Otherwise HPD would not work
> at all.

Argh. Too many refactorings. I'll check that it works correctly and respin.

>
> Thanks,
> Laurentiu
>
> > +
> > +             if (connector->polled & (DRM_CONNECTOR_POLL_CONNECT |
> > +                                      DRM_CONNECTOR_POLL_DISCONNECT))
> > +                     poll = true;
> > +     }
> > +     drm_connector_list_iter_end(&conn_iter);
> > +
> > +     return poll;
> > +}
> > +
> >  #define DRM_OUTPUT_POLL_PERIOD (10*HZ)
> >  /**
> >   * drm_kms_helper_poll_enable - re-enable output polling.
> > @@ -241,26 +280,14 @@ drm_connector_mode_valid(struct drm_connector *connector,
> >  void drm_kms_helper_poll_enable(struct drm_device *dev)
> >  {
> >       bool poll = false;
> > -     struct drm_connector *connector;
> > -     struct drm_connector_list_iter conn_iter;
> >       unsigned long delay = DRM_OUTPUT_POLL_PERIOD;
> >
> > -     if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll)
> > +     if (!dev->mode_config.poll_enabled ||
> > +         !drm_kms_helper_poll ||
> > +         dev->mode_config.poll_running)
> >               return;
> >
> > -     drm_connector_list_iter_begin(dev, &conn_iter);
> > -     drm_for_each_connector_iter(connector, &conn_iter) {
> > -             const struct drm_connector_helper_funcs *funcs =
> > -                     connector->helper_private;
> > -
> > -             if (funcs && funcs->enable_hpd)
> > -                     funcs->enable_hpd(connector);
> > -
> > -             if (connector->polled & (DRM_CONNECTOR_POLL_CONNECT |
> > -                                      DRM_CONNECTOR_POLL_DISCONNECT))
> > -                     poll = true;
> > -     }
> > -     drm_connector_list_iter_end(&conn_iter);
> > +     poll = drm_kms_helper_enable_hpd(dev);
> >
> >       if (dev->mode_config.delayed_event) {
> >               /*
> > @@ -279,6 +306,8 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
> >
> >       if (poll)
> >               schedule_delayed_work(&dev->mode_config.output_poll_work, delay);
> > +
> > +     dev->mode_config.poll_running = true;
> >  }
> >  EXPORT_SYMBOL(drm_kms_helper_poll_enable);
> >
> > @@ -567,10 +596,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
> >       }
> >
> >       /* Re-enable polling in case the global poll config changed. */
> > -     if (drm_kms_helper_poll != dev->mode_config.poll_running)
> > -             drm_kms_helper_poll_enable(dev);
> > -
> > -     dev->mode_config.poll_running = drm_kms_helper_poll;
> > +     drm_kms_helper_poll_enable(dev);
> >
> >       if (connector->status == connector_status_disconnected) {
> >               DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
> > @@ -710,8 +736,12 @@ static void output_poll_execute(struct work_struct *work)
> >       changed = dev->mode_config.delayed_event;
> >       dev->mode_config.delayed_event = false;
> >
> > -     if (!drm_kms_helper_poll)
> > +     if (!drm_kms_helper_poll &&
> > +         dev->mode_config.poll_running) {
> > +             drm_kms_helper_disable_hpd(dev);
> > +             dev->mode_config.poll_running = false;
> >               goto out;
> > +     }
> >
> >       if (!mutex_trylock(&dev->mode_config.mutex)) {
> >               repoll = true;
> > @@ -808,30 +838,6 @@ bool drm_kms_helper_is_poll_worker(void)
> >  }
> >  EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
> >
> > -static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
> > -{
> > -     struct drm_connector *connector;
> > -     struct drm_connector_list_iter conn_iter;
> > -
> > -     if (!dev->mode_config.poll_enabled)
> > -             return;
> > -
> > -     if (fini)
> > -             dev->mode_config.poll_enabled = false;
> > -
> > -     drm_connector_list_iter_begin(dev, &conn_iter);
> > -     drm_for_each_connector_iter(connector, &conn_iter) {
> > -             const struct drm_connector_helper_funcs *funcs =
> > -                     connector->helper_private;
> > -
> > -             if (funcs && funcs->disable_hpd)
> > -                     funcs->disable_hpd(connector);
> > -     }
> > -     drm_connector_list_iter_end(&conn_iter);
> > -
> > -     cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
> > -}
> > -
> >  /**
> >   * drm_kms_helper_poll_disable - disable output polling
> >   * @dev: drm_device
> > @@ -848,7 +854,12 @@ static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
> >   */
> >  void drm_kms_helper_poll_disable(struct drm_device *dev)
> >  {
> > -     drm_kms_helper_poll_disable_fini(dev, false);
> > +     if (dev->mode_config.poll_running)
> > +             drm_kms_helper_disable_hpd(dev);
> > +
> > +     cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
> > +
> > +     dev->mode_config.poll_running = false;
> >  }
> >  EXPORT_SYMBOL(drm_kms_helper_poll_disable);
> >
> > @@ -886,7 +897,12 @@ EXPORT_SYMBOL(drm_kms_helper_poll_init);
> >   */
> >  void drm_kms_helper_poll_fini(struct drm_device *dev)
> >  {
> > -     drm_kms_helper_poll_disable_fini(dev, true);
> > +     if (!dev->mode_config.poll_enabled)
> > +             return;
> > +
> > +     drm_kms_helper_poll_disable(dev);
> > +
> > +     dev->mode_config.poll_enabled = false;
> >  }
> >  EXPORT_SYMBOL(drm_kms_helper_poll_fini);
> >
> > --
> > 2.39.0
> >



-- 
With best wishes
Dmitry
