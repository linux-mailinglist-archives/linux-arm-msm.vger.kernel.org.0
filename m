Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD476B91B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 12:34:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbjCNLeb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 07:34:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbjCNLea (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 07:34:30 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A482A11654
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 04:34:24 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id u32so8394585ybi.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 04:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678793664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7sn1x82VonxdCN50JryyWnXZYhbsUZ9GIzo/+lVkZxY=;
        b=QE3qD2pRwc3eEvECC1fz9Tjv61evU8CZ97cRMEovyHjzF6BuMW8UOgaPB3D8EP/1If
         qufbg9paUvVpj4i2wnwP+J2GXgbwQ8O0vPbDcggC8YWhzwWsl30vnqq+GOfcnT3zf/7b
         PlUZACrbVGCMLiN51DY8z2GCasVeFkD4ETEF0kP+cd8AbCNe52/eIROgKGo2En8lnWZb
         vspha5TbK2vliKK0S9ie7nR7NYUVqgMlsCMhn0DOuQr6lLh8dUfrVdQEXQTphiVz6e2U
         JAowlfmVhNDpcNiUfoLkE33yiNXqZKCx8trvkK0e2qkbYdp1YikHbP6qXWLwxax70FBS
         QCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678793664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sn1x82VonxdCN50JryyWnXZYhbsUZ9GIzo/+lVkZxY=;
        b=tGYoK5mZD8yd5RDRBvvGe90OHUtgSbTWwDgOsTL9Ge37Di5H4Hg8Pn67S8JM1I6Ywo
         4ySq8bV9FQN5npGS0cCEMUqpvB1tjtTCWTE/BaUNaOVxqZu97dvurAA+R0kFlIXwr7u5
         MWUUg67eD5R51ASpokSNN7DymWA0yWgndwq/PNo1fMoB647x2H+7xu6i9oPS8gXWHGG9
         rxmVcNp6J6P6RnWbrUXIKishv2fHh/kHiXEvX0vzhBq8oRirx6QwRTw6tGwPwBpVtBAY
         xwmTDmTaxTLP5ux/AFTiXS1WpGiB6glkuWGpvLaWbCGNQkeb3fcdwG0joClR38ppfb99
         WIfw==
X-Gm-Message-State: AO0yUKUgBRUdS04+ubJ6fU1GBDZ/CUnCWnTG2qXKEZc/zRtTr6j2vGsq
        0OfaP1MionTccnY55KiYjzEAlO3snj9CmOIqD27LCQ==
X-Google-Smtp-Source: AK7set/32MHzGhOOXcTZmEd5hYEG4p1mHLaWtn49tTFw0EYcjdGdz8jQiVNCCRliLlp2jyQg7xzhs+qwnnQETxP3L28=
X-Received: by 2002:a5b:108:0:b0:8bb:dfe8:a33b with SMTP id
 8-20020a5b0108000000b008bbdfe8a33bmr23143766ybx.9.1678793663589; Tue, 14 Mar
 2023 04:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230223135635.30659-1-quic_sbillaka@quicinc.com>
 <20230223135635.30659-2-quic_sbillaka@quicinc.com> <CAA8EJprGzCBcWVkHHJxAtVOTuH5DeyYwKw-hHp+T1QvhvHXjsA@mail.gmail.com>
 <72b9c34357a443df8cbb55c6eddd8a21@quicinc.com> <5453e551-340a-ce98-1c8e-2ca32ff5b7c5@linaro.org>
 <60a96e55bb1048c4974f185bf4547fbe@quicinc.com>
In-Reply-To: <60a96e55bb1048c4974f185bf4547fbe@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 14 Mar 2023 13:34:11 +0200
Message-ID: <CAA8EJpoL15vW0MnW2af4RLsW9_G3PQAxBdJJb0rvFY7Jfv2uPA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/msm/dp: enumerate edp panel during driver probe
To:     "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
Cc:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robdclark@gmail.com" <robdclark@gmail.com>,
        "seanpaul@chromium.org" <seanpaul@chromium.org>,
        "swboyd@chromium.org" <swboyd@chromium.org>,
        "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>,
        "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
        "dianders@chromium.org" <dianders@chromium.org>,
        "Kuogee Hsieh (QUIC)" <quic_khsieh@quicinc.com>,
        "Bjorn Andersson (QUIC)" <quic_bjorande@quicinc.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "Vishnuvardhan Prodduturi (QUIC)" <quic_vproddut@quicinc.com>
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

On Tue, 14 Mar 2023 at 12:23, Sankeerth Billakanti (QUIC)
<quic_sbillaka@quicinc.com> wrote:
>
> Hi Dmitry,
>
> >>>>
> >>>> The eDP panel is identified and enumerated during probe of the
> >>>> panel-edp driver. The current DP driver triggers this panel-edp
> >>>> driver probe while getting the panel-bridge associated with the eDP
> >>>> panel from the platform driver bind. If the panel-edp probe is
> >>>> deferred, then the whole bunch of MDSS parent and child drivers have
> >>>> to defer and
> >>> roll back.
> >>>
> >>> No, MDSS has not been rolled back since 5.19. Please shift your
> >>> development on top of the current msm-next.
> >>>
> >>
> >> Okay, I will move to the msm-next tip.
> >>
> >>>>
> >>>> So, we want to move the panel enumeration from bind to probe so that
> >>>> the probe defer is easier to handle and also both the drivers appear
> >>>> consistent in panel enumeration. This change moves the DP driver
> >>>> panel-bridge enumeration to probe.
> >>>>
> >>>> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> >>>> ---
> >>>>   drivers/gpu/drm/msm/dp/dp_aux.c     | 149
> >>> ++++++++++++++++++++++++++--
> >>>>   drivers/gpu/drm/msm/dp/dp_catalog.c |  12 +++
> >>>>   drivers/gpu/drm/msm/dp/dp_catalog.h |   1 +
> >>>>   drivers/gpu/drm/msm/dp/dp_display.c |  80 ++++++---------
> >>>>   4 files changed, 182 insertions(+), 60 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c
> >>>> b/drivers/gpu/drm/msm/dp/dp_aux.c index
> >cc3efed593aa..5da95dfdeede
> >>>> 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> >>>> @@ -110,7 +110,7 @@ static ssize_t dp_aux_write(struct
> >>>> dp_aux_private *aux,  }
> >>>>
> >>>>   static ssize_t dp_aux_cmd_fifo_tx(struct dp_aux_private *aux,
> >>>> -                             struct drm_dp_aux_msg *msg)
> >>>> +                             struct drm_dp_aux_msg *msg, bool poll)
> >>>
> >>> What is the reason for working in polled mode rather than always
> >>> using the interrupts?
> >>>
> >>
> >> The mdss interrupts will be enabled and can be used after msm_irq_install
> >from msm_drm_bind.
> >> We want to perform aux transactions during probe. The aux data
> >> transmission is followed by an interrupt to indicate successful transmission
> >status and reply information.
> >
> >This is the price of developing on, let me guess, 5.15. Nowadays MDSS
> >interrupts are enabled and can be used during dp_display_probe() and
> >dp_display_bind(). If they can not for some reason, this is an issue that must
> >be fixed. Please reconsider your approach after rebasing onto msm-next or
> >6.3-rc1.
> >
>
> On the msm-next also, I see the mdss irq is enabled from bind (in msm_drv.c).
> msm_drm_bind -> msm_drm_init -> msm_irq_install

MDSS IRQ domain is registered from mdss_probe() -> msm_mdss_init() ->
_msm_mdss_irq_domain_add().

Please note the difference between MDSS IRQs (handled by MDSS) vs
MDP/DPU irq (registered by msm_irq_install()).

> Currently, interrupts will not be available during the dp_display_probe.

I can not agree with you here.

> Is there a patch series which is enabling IRQs during mdss probe?

https://patchwork.freedesktop.org/series/98525/, merged for 5.19.

>
> >>
> >> As interrupts are not enabled, I took this polling approach for aux interrupts
> >during probe.
> >>
> >>>>   {
> >>>>          ssize_t ret;
> >>>>          unsigned long time_left;
> >>>> @@ -121,10 +121,16 @@ static ssize_t dp_aux_cmd_fifo_tx(struct
> >>> dp_aux_private *aux,
> >>>>          if (ret < 0)
> >>>>                  return ret;
> >>>>
> >>>> -       time_left = wait_for_completion_timeout(&aux->comp,
> >>>> +       if (!poll) {
> >>>> +               time_left = wait_for_completion_timeout(&aux->comp,
> >>>>                                                  msecs_to_jiffies(250));
> >>>> -       if (!time_left)
> >>>> -               return -ETIMEDOUT;
> >>>> +               if (!time_left)
> >>>> +                       return -ETIMEDOUT;
> >>>> +       } else {
> >>>> +               ret = dp_catalog_aux_poll_and_get_hw_interrupt(aux-
> >>catalog);
> >>>> +               if (!ret)
> >>>> +                       dp_aux_isr(&aux->dp_aux);
> >>>> +       }
> >>>>
> >>>>          return ret;
> >>>>   }
> >>>> @@ -238,7 +244,7 @@ static void
> >>> dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
> >>>>    */
> >>>>   static void dp_aux_transfer_helper(struct dp_aux_private *aux,
> >>>>                                     struct drm_dp_aux_msg *input_msg,
> >>>> -                                  bool send_seg)
> >>>> +                                  bool send_seg, bool poll)
> >>>>   {
> >>>>          struct drm_dp_aux_msg helper_msg;
> >>>>          u32 message_size = 0x10;
> >>>> @@ -278,7 +284,7 @@ static void dp_aux_transfer_helper(struct
> >>> dp_aux_private *aux,
> >>>>                  helper_msg.address = segment_address;
> >>>>                  helper_msg.buffer = &aux->segment;
> >>>>                  helper_msg.size = 1;
> >>>> -               dp_aux_cmd_fifo_tx(aux, &helper_msg);
> >>>> +               dp_aux_cmd_fifo_tx(aux, &helper_msg, poll);
> >>>>          }
> >>>>
> >>>>          /*
> >>>> @@ -292,7 +298,7 @@ static void dp_aux_transfer_helper(struct
> >>> dp_aux_private *aux,
> >>>>          helper_msg.address = input_msg->address;
> >>>>          helper_msg.buffer = &aux->offset;
> >>>>          helper_msg.size = 1;
> >>>> -       dp_aux_cmd_fifo_tx(aux, &helper_msg);
> >>>> +       dp_aux_cmd_fifo_tx(aux, &helper_msg, poll);
> >>>>
> >>>>   end:
> >>>>          aux->offset += message_size; @@ -300,6 +306,122 @@ static
> >>>> void dp_aux_transfer_helper(struct
> >>> dp_aux_private *aux,
> >>>>                  aux->segment = 0x0; /* reset segment at end of
> >>>> block */  }
> >>>>
> >>>> +/*
> >>>> + * This function does the real job to process an AUX transaction.
> >>>> + * It will call aux_reset() function to reset the AUX channel,
> >>>> + * if the waiting is timeout.
> >>>> + */
> >>>> +static ssize_t dp_aux_transfer_init(struct drm_dp_aux *dp_aux,
> >>>> +                              struct drm_dp_aux_msg *msg) {
> >>>> +       ssize_t ret;
> >>>> +       int const aux_cmd_native_max = 16;
> >>>> +       int const aux_cmd_i2c_max = 128;
> >>>> +       struct dp_aux_private *aux;
> >>>> +
> >>>> +       aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> >>>> +
> >>>> +       aux->native = msg->request & (DP_AUX_NATIVE_WRITE &
> >>>> + DP_AUX_NATIVE_READ);
> >>>> +
> >>>> +       /* Ignore address only message */
> >>>> +       if (msg->size == 0 || !msg->buffer) {
> >>>> +               msg->reply = aux->native ?
> >>>> +                       DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
> >>>> +               return msg->size;
> >>>> +       }
> >>>> +
> >>>> +       /* msg sanity check */
> >>>> +       if ((aux->native && msg->size > aux_cmd_native_max) ||
> >>>> +           msg->size > aux_cmd_i2c_max) {
> >>>> +               DRM_ERROR("%s: invalid msg: size(%zu), request(%x)\n",
> >>>> +                       __func__, msg->size, msg->request);
> >>>> +               return -EINVAL;
> >>>> +       }
> >>>> +
> >>>> +       mutex_lock(&aux->mutex);
> >>>> +       if (!aux->initted) {
> >>>> +               ret = -EIO;
> >>>> +               goto exit;
> >>>> +       }
> >>>> +
> >>>> +       /*
> >>>> +        * For eDP it's important to give a reasonably long wait here for HPD
> >>>> +        * to be asserted. This is because the panel driver may have _just_
> >>>> +        * turned on the panel and then tried to do an AUX transfer. The
> >panel
> >>>> +        * driver has no way of knowing when the panel is ready, so it's up
> >>>> +        * to us to wait. For DP we never get into this situation so let's
> >>>> +        * avoid ever doing the extra long wait for DP.
> >>>> +        */
> >>>> +       if (aux->is_edp) {
> >>>> +               ret = dp_catalog_aux_wait_for_hpd_connect_state(aux-
> >>catalog);
> >>>> +               if (ret) {
> >>>> +                       DRM_DEBUG_DP("Panel not ready for aux transactions\n");
> >>>> +                       goto exit;
> >>>> +               }
> >>>> +       }
> >>>> +
> >>>> +       dp_aux_update_offset_and_segment(aux, msg);
> >>>> +       dp_aux_transfer_helper(aux, msg, true, true);
> >>>> +
> >>>> +       aux->read = msg->request & (DP_AUX_I2C_READ &
> >>> DP_AUX_NATIVE_READ);
> >>>> +       aux->cmd_busy = true;
> >>>> +
> >>>> +       if (aux->read) {
> >>>> +               aux->no_send_addr = true;
> >>>> +               aux->no_send_stop = false;
> >>>> +       } else {
> >>>> +               aux->no_send_addr = true;
> >>>> +               aux->no_send_stop = true;
> >>>> +       }
> >>>> +
> >>>> +       ret = dp_aux_cmd_fifo_tx(aux, msg, true);
> >>>> +
> >>>> +       /* TODO: why is fifo_rx necessary here?
> >>>> +        * Ideally fifo_rx need not be executed for an aux write
> >>>> +        */
> >>>> +       ret = dp_aux_cmd_fifo_rx(aux, msg);
> >>>> +
> >>>> +       if (ret < 0) {
> >>>> +               if (aux->native) {
> >>>> +                       aux->retry_cnt++;
> >>>> +                       if (!(aux->retry_cnt % MAX_AUX_RETRIES))
> >>>> +                               dp_catalog_aux_update_cfg(aux->catalog);
> >>>> +               }
> >>>> +               /* reset aux if link is in connected state */
> >>>> +               if (dp_catalog_link_is_connected(aux->catalog))
> >>>> +                       dp_catalog_aux_reset(aux->catalog);
> >>>> +       } else {
> >>>> +               aux->retry_cnt = 0;
> >>>> +               switch (aux->aux_error_num) {
> >>>> +               case DP_AUX_ERR_NONE:
> >>>> +                       if (aux->read)
> >>>> +                               ret = dp_aux_cmd_fifo_rx(aux, msg);
> >>>> +                       msg->reply = aux->native ? DP_AUX_NATIVE_REPLY_ACK :
> >>> DP_AUX_I2C_REPLY_ACK;
> >>>> +                       break;
> >>>> +               case DP_AUX_ERR_DEFER:
> >>>> +                       msg->reply = aux->native ?
> >>>> +                               DP_AUX_NATIVE_REPLY_DEFER :
> >>> DP_AUX_I2C_REPLY_DEFER;
> >>>> +                       break;
> >>>> +               case DP_AUX_ERR_PHY:
> >>>> +               case DP_AUX_ERR_ADDR:
> >>>> +               case DP_AUX_ERR_NACK:
> >>>> +               case DP_AUX_ERR_NACK_DEFER:
> >>>> +                       msg->reply = aux->native ? DP_AUX_NATIVE_REPLY_NACK :
> >>> DP_AUX_I2C_REPLY_NACK;
> >>>> +                       break;
> >>>> +               case DP_AUX_ERR_TOUT:
> >>>> +                       ret = -ETIMEDOUT;
> >>>> +                       break;
> >>>> +               }
> >>>> +       }
> >>>> +
> >>>> +       aux->cmd_busy = false;
> >>>> +
> >>>> +exit:
> >>>> +       mutex_unlock(&aux->mutex);
> >>>> +
> >>>> +       return ret;
> >>>> +}
> >>>> +
> >>>>   /*
> >>>>    * This function does the real job to process an AUX transaction.
> >>>>    * It will call aux_reset() function to reset the AUX channel, @@
> >>>> -355,7 +477,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux
> >>> *dp_aux,
> >>>>          }
> >>>>
> >>>>          dp_aux_update_offset_and_segment(aux, msg);
> >>>> -       dp_aux_transfer_helper(aux, msg, true);
> >>>> +       dp_aux_transfer_helper(aux, msg, true, false);
> >>>>
> >>>>          aux->read = msg->request & (DP_AUX_I2C_READ &
> >>> DP_AUX_NATIVE_READ);
> >>>>          aux->cmd_busy = true;
> >>>> @@ -368,7 +490,7 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux
> >>> *dp_aux,
> >>>>                  aux->no_send_stop = true;
> >>>>          }
> >>>>
> >>>> -       ret = dp_aux_cmd_fifo_tx(aux, msg);
> >>>> +       ret = dp_aux_cmd_fifo_tx(aux, msg, false);
> >>>>          if (ret < 0) {
> >>>>                  if (aux->native) {
> >>>>                          aux->retry_cnt++; @@ -535,6 +657,15 @@
> >>>> struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog
> >*catalog,
> >>>>          aux->catalog = catalog;
> >>>>          aux->retry_cnt = 0;
> >>>>
> >>>> +       /*
> >>>> +        * Use the drm_dp_aux_init() to use the aux adapter
> >>>> +        * before registering aux with the DRM device.
> >>>> +        */
> >>>> +       aux->dp_aux.name = "dpu_dp_aux";
> >>>> +       aux->dp_aux.dev = dev;
> >>>> +       aux->dp_aux.transfer = dp_aux_transfer_init;
> >>>> +       drm_dp_aux_init(&aux->dp_aux);
> >>>
> >>> How do you use the aux adapter? It should not be used before
> >>> aux->drm_dev is setup.
> >>>
> >>
> >> The drm_dev registration happens during the bind. But we need to use aux
> >during probe.
> >>
> >> The kernel doc for the drm_dp_aux_init function suggested we can use
> >> the adapter before drm_dev registration. So, I used this function to enable
> >the aux usage during probe.
> >
> >Then please also change __drm_printk() to use (drm) ? (drm->dev) : NULL as
> >a first argument to dev_##level##type. Otherwise the first AUX transfer error
> >before aux->drm_dev is set will oops the kernel. See how
> >drm_err() is expanded.
> >
>
> Okay, will add this also.

Good.

>
> >>
> >> /**
> >>   * drm_dp_aux_init() - minimally initialise an aux channel
> >>   * @aux: DisplayPort AUX channel
> >>   *
> >>   * If you need to use the drm_dp_aux's i2c adapter prior to registering it
> >with
> >>   * the outside world, call drm_dp_aux_init() first.
> >>
> >>>> +
> >>>>          return &aux->dp_aux;
> >>>>   }
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>> index 676279d0ca8d..ccf0400176f0 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> >>>> @@ -258,6 +258,18 @@ int
> >>> dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog
> >>> *dp_catalog)
> >>>>                                  2000, 500000);  }
> >>>>
> >>>> +int dp_catalog_aux_poll_and_get_hw_interrupt(struct dp_catalog
> >>>> +*dp_catalog) {
> >>>> +       u32 aux;
> >>>> +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> >>>> +                               struct dp_catalog_private,
> >>>> +dp_catalog);
> >>>> +
> >>>> +       return readl_poll_timeout(catalog->io->dp_controller.ahb.base +
> >>>> +                               REG_DP_INTR_STATUS,
> >>>> +                               aux, aux & DP_INTERRUPT_STATUS1,
> >>>> +                               250, 250000); }
> >>>> +
> >>>>   static void dump_regs(void __iomem *base, int len)  {
> >>>>          int i;
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h
> >>>> b/drivers/gpu/drm/msm/dp/dp_catalog.h
> >>>> index 1f717f45c115..ad4a9e0f71f2 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> >>>> @@ -87,6 +87,7 @@ void dp_catalog_aux_enable(struct dp_catalog
> >>>> *dp_catalog, bool enable);  void dp_catalog_aux_update_cfg(struct
> >>>> dp_catalog *dp_catalog);  int
> >>>> dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog
> >>>> *dp_catalog);
> >>>>   u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
> >>>> +int dp_catalog_aux_poll_and_get_hw_interrupt(struct dp_catalog
> >>>> +*dp_catalog);
> >>>>
> >>>>   /* DP Controller APIs */
> >>>>   void dp_catalog_ctrl_state_ctrl(struct dp_catalog *dp_catalog, u32
> >>>> state); diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> index bde1a7ce442f..a5dcef040b74 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> @@ -275,13 +275,6 @@ static int dp_display_bind(struct device *dev,
> >struct
> >>> device *master,
> >>>>          dp->dp_display.drm_dev = drm;
> >>>>          priv->dp[dp->id] = &dp->dp_display;
> >>>>
> >>>> -       rc = dp->parser->parse(dp->parser);
> >>>> -       if (rc) {
> >>>> -               DRM_ERROR("device tree parsing failed\n");
> >>>> -               goto end;
> >>>> -       }
> >>>> -
> >>>> -
> >>>>          dp->drm_dev = drm;
> >>>>          dp->aux->drm_dev = drm;
> >>>>          rc = dp_aux_register(dp->aux); @@ -290,12 +283,6 @@ static int
> >>>> dp_display_bind(struct device *dev, struct device *master,
> >>>>                  goto end;
> >>>>          }
> >>>>
> >>>> -       rc = dp_power_client_init(dp->power);
> >>>> -       if (rc) {
> >>>> -               DRM_ERROR("Power client create failed\n");
> >>>> -               goto end;
> >>>> -       }
> >>>> -
> >>>>          rc = dp_register_audio_driver(dev, dp->audio);
> >>>>          if (rc) {
> >>>>                  DRM_ERROR("Audio registration Dp failed\n"); @@ -787,6
> >>>> +774,12 @@ static int dp_init_sub_modules(struct dp_display_private
> >*dp)
> >>>>                  goto error;
> >>>>          }
> >>>>
> >>>> +       rc = dp->parser->parse(dp->parser);
> >>>> +       if (rc) {
> >>>> +               DRM_ERROR("device tree parsing failed\n");
> >>>> +               goto error;
> >>>> +       }
> >>>> +
> >>>>          dp->catalog = dp_catalog_get(dev, &dp->parser->io);
> >>>>          if (IS_ERR(dp->catalog)) {
> >>>>                  rc = PTR_ERR(dp->catalog); @@ -803,6 +796,12 @@ static
> >>>> int dp_init_sub_modules(struct dp_display_private *dp)
> >>>>                  goto error;
> >>>>          }
> >>>>
> >>>> +       rc = dp_power_client_init(dp->power);
> >>>> +       if (rc) {
> >>>> +               DRM_ERROR("Power client create failed\n");
> >>>> +               goto error;
> >>>> +       }
> >>>> +
> >>>>          dp->aux = dp_aux_get(dev, dp->catalog, dp->dp_display.is_edp);
> >>>>          if (IS_ERR(dp->aux)) {
> >>>>                  rc = PTR_ERR(dp->aux); @@ -1338,12 +1337,29 @@ static
> >>>> int dp_display_probe(struct platform_device *pdev)
> >>>>
> >>>>          platform_set_drvdata(pdev, &dp->dp_display);
> >>>>
> >>>> +       if (dp->dp_display.is_edp) {
> >>>> +               dp_display_host_init(dp);
> >>>> +               dp_display_host_phy_init(dp);
> >>>> +               dp_catalog_ctrl_hpd_config(dp->catalog);
> >>>> +
> >>>> +               rc = devm_of_dp_aux_populate_bus(dp->aux, NULL);
> >>>
> >>> You should pass a real done_probing handler here, if you are going to
> >refactor
> >>> this piece of code. The done_probing should then shut down the
> >resources
> >>> and bind the component.
> >>>
> >>
> >> I removed the resource enabling part from probe in the next patch where I
> >implemented pm_runtime_ops.
> >> I moved the host_init, phy_init and hpd_config into runtime_resume and
> >calling pm_runtime_get_sync from aux_transfer.
> >
> >Next patch doesn't exist at this point. So, please, either reorder them,
> >or make this patch correct per se.
> >
> >Also, the key part is a call to component_add(). It should come from
> >done_probing callback. AUX bus probing is asynchronous. The kernel
> >registers a device and then it might take some time for the correct
> >driver to be loaded, etc. We clearly expect dp_display_bind to be used
> >only when the panel has been probed.
> >
>
>
> Okay, will add the done_probe function

Thank you.

>
> >>
> >>>> +
> >>>> +               dp_display_host_phy_exit(dp);
> >>>> +               dp_display_host_deinit(dp);
> >>>> +
> >>>> +               if (rc) {
> >>>> +                       DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
> >>>> +                       goto error;
> >>>> +               }
> >>>> +       }
> >>>> +
> >>>>          rc = component_add(&pdev->dev, &dp_display_comp_ops);
> >>>>          if (rc) {
> >>>>                  DRM_ERROR("component add failed, rc=%d\n", rc);
> >>>>                  dp_display_deinit_sub_modules(dp);
> >>>>          }
> >>>>
> >>>> +error:
> >>>>          return rc;
> >>>>   }
> >>>>
> >>>> @@ -1546,40 +1562,8 @@ static int dp_display_get_next_bridge(struct
> >>>> msm_dp *dp)  {
> >>>>          int rc;
> >>>>          struct dp_display_private *dp_priv;
> >>>> -       struct device_node *aux_bus;
> >>>> -       struct device *dev;
> >>>>
> >>>>          dp_priv = container_of(dp, struct dp_display_private, dp_display);
> >>>> -       dev = &dp_priv->pdev->dev;
> >>>> -       aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> >>>> -
> >>>> -       if (aux_bus && dp->is_edp) {
> >>>> -               dp_display_host_init(dp_priv);
> >>>> -               dp_catalog_ctrl_hpd_config(dp_priv->catalog);
> >>>> -               dp_display_host_phy_init(dp_priv);
> >>>> -               enable_irq(dp_priv->irq);
> >>>> -
> >>>> -               /*
> >>>> -                * The code below assumes that the panel will finish probing
> >>>> -                * by the time devm_of_dp_aux_populate_ep_devices()
> >returns.
> >>>> -                * This isn't a great assumption since it will fail if the
> >>>> -                * panel driver is probed asynchronously but is the best we
> >>>> -                * can do without a bigger driver reorganization.
> >>>> -                */
> >>>> -               rc = of_dp_aux_populate_bus(dp_priv->aux, NULL);
> >>>> -               of_node_put(aux_bus);
> >>>> -               if (rc)
> >>>> -                       goto error;
> >>>> -
> >>>> -               rc = devm_add_action_or_reset(dp->drm_dev->dev,
> >>>> -                                               of_dp_aux_depopulate_bus_void,
> >>>> -                                               dp_priv->aux);
> >>>> -               if (rc)
> >>>> -                       goto error;
> >>>> -       } else if (dp->is_edp) {
> >>>> -               DRM_ERROR("eDP aux_bus not found\n");
> >>>> -               return -ENODEV;
> >>>> -       }
> >>>>
> >>>>          /*
> >>>>           * External bridges are mandatory for eDP interfaces: one has
> >>>> to @@ -1597,12 +1581,6 @@ static int dp_display_get_next_bridge(struct
> >>> msm_dp *dp)
> >>>>                  return 0;
> >>>>          }
> >>>>
> >>>> -error:
> >>>> -       if (dp->is_edp) {
> >>>> -               disable_irq(dp_priv->irq);
> >>>> -               dp_display_host_phy_exit(dp_priv);
> >>>> -               dp_display_host_deinit(dp_priv);
> >>>> -       }
> >>>>          return rc;
> >>>>   }
> >>>>
> >>>> --
> >>>> 2.39.0
> >>>>
> >>>
> >>>
> >>> --
> >>> With best wishes
> >>> Dmitry
> >
> >--
> >With best wishes
> >Dmitry
>


-- 
With best wishes
Dmitry
