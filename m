Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB7AE505E57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 21:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347619AbiDRTVr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 15:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347612AbiDRTVq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 15:21:46 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776CF35275
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 12:19:06 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-e2442907a1so15160028fac.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 12:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=i5wl56LotTiojun33tWHx/7uuv8PC5pAOqdx69tKaaM=;
        b=IrBO3HYKrCyj8BpxZJPl52AA7PNRk7cYMbyJAbdSWuQXLHzjL7QbrMJB94/Dn+xCWs
         M77uDtGevI5J2vY1vpOwBTPztIAZM4Pp6g5la85cZxmhCyck9gTUr6otIWl7HQb0mMHY
         SXrPPX1NWp97pWRQ38S8Do2rWKfx1C7R9VFnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=i5wl56LotTiojun33tWHx/7uuv8PC5pAOqdx69tKaaM=;
        b=3zsRmbBhHKUp0kLqnNHpYLL/S9CquKUQj5AWyb9luwVfFtT0BaTd2qdSYqt4IyOOz2
         s+WmFdzLk4ursS25wuuZ0jOCZI08GGrTGAJ/Tf1P086lESAKQGsNhi5gKt0Jx0cbFAsP
         aduToBKNDSA2lwuz1XMU7mFlh3orJnhhcGqPSjFAV2H4XBVBgMYVecTOlAZJCmzTG11O
         6YXa+0CcTmjA9NP1okhPx46ncFoOB1oA0D6hlfuXCRNywozN5sCVK97BoYRd25tloesE
         Qau6MRAPgh9bb4JnuD+SKgRiovh12dXRJkzS4CNc28DAI0Yzd7dNOwQT97AQjytETByC
         x14w==
X-Gm-Message-State: AOAM530AMau8xQMig8zvPlBAxRGCvG+OrGihImFTKInOuc+ekqTMTY96
        eAVCS/wJ39zfw3XB/8sGGqWThBv9DD1WNTU2J/hBGA==
X-Google-Smtp-Source: ABdhPJy36I60SuKJQk1lAs2Wj4Aw91ozGFrNZzaJBTHE9jWCmMfEyKPfI8GyfHWmpkDQ6UzS6OnJiPVDUMtglnY/4Os=
X-Received: by 2002:a05:6870:3907:b0:e5:a6fd:4047 with SMTP id
 b7-20020a056870390700b000e5a6fd4047mr4740339oap.193.1650309545749; Mon, 18
 Apr 2022 12:19:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Apr 2022 12:19:05 -0700
MIME-Version: 1.0
In-Reply-To: <1650066445-18186-1-git-send-email-quic_khsieh@quicinc.com>
References: <1650066445-18186-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 18 Apr 2022 12:19:05 -0700
Message-ID: <CAE-0n505HQEu0Wmt17Y_AfTG+arD76kL7wpEFgeJKz6RRcQBxw@mail.gmail.com>
Subject: Re: [PATCH v9] drm/msm/dp: stop event kernel thread when DP unbind
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-04-15 16:47:25)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..5b289b9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -266,9 +269,18 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         }
>
>         rc = dp_register_audio_driver(dev, dp->audio);
> -       if (rc)
> +       if (rc) {
>                 DRM_ERROR("Audio registration Dp failed\n");
> +               goto end;
> +       }
>
> +       rc = dp_hpd_event_thread_start(dp);
> +       if (rc) {
> +               DRM_ERROR("Event thread create failed\n");

One thread DRM_ERROR()

> +               goto end;
> +       }
> +
> +       return 0;
>  end:
>         return rc;
>  }
> @@ -1132,12 +1149,19 @@ static int hpd_event_thread(void *data)
>         return 0;
>  }
>
> -static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv)
>  {
> -       init_waitqueue_head(&dp_priv->event_q);
> -       spin_lock_init(&dp_priv->event_lock);
> +       /* set event q to empty */
> +       dp_priv->event_gndx = 0;
> +       dp_priv->event_pndx = 0;
> +
> +       dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +       if (IS_ERR(dp_priv->ev_tsk)) {
> +               DRM_ERROR("failed to create DP event thread\n");

And another thread creation DRM_ERROR(). Can we just have one please
instead of two lines for something that probably never happens?

> +               return PTR_ERR(dp_priv->ev_tsk);
> +       }
>
> -       kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +       return 0;
>  }
>
>  static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
