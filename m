Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A895F54FED2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 23:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359700AbiFQUwr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 16:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383562AbiFQUwp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 16:52:45 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D2592703
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:52:42 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id u9so6696067oiv.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=zfdMPFQLtynymEdExqfgDNO6jYr15Yc2szC/qTvNqXc=;
        b=FLRtbfnbWLQS1vb5eeDTBn1ifXwUDQZG1/XVUVl1FLOIJykhQJyfn+uWbH2XnzdCz6
         Ad+r59Zb4HpRB9uujT3zdjbqaYFVz9zPIm0Jkmu6Zo6vvu5Ky7sa+FObdEm1jGb/itZG
         EU+O9JqCUuVSS8JRea+QvCWY70lIFU/BSv6Tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=zfdMPFQLtynymEdExqfgDNO6jYr15Yc2szC/qTvNqXc=;
        b=Z4Jg/lCsvuc2Jg9Wrt1smUSwJ6CFY8gw/6veIHk4C4+UbCEFhupl0rXXiTbi2p1dMJ
         fPer9ZlWUqgq+vj857FjzT1cMzsi7qoBUecuVllwSaKkpcatF+etdJ/zFXxxQU4QrnvP
         pAvqrx13LJ0oNWBtnwzkXNNfUhh3vN72KaHVVOjHd/S1JyuAZu+Fs2RnjpeycllbIMWK
         n1ldYHRe4VAOwgfjxzNj3IUQ1eAafwYQkJMMSMEieukOAz7abbQrB1A2MVoh63x64mnh
         TlmTqGNHMUM5idymDp5sNLvBV+kTj58yM0RLA3WONJPLoecAzSdlHd+mcq8POd9ZOwlK
         DLBw==
X-Gm-Message-State: AJIora8EtxPM1hN+8+cjIPeIyp7wOienkFhBR7RXtmLqYYpODQ/Pfuqb
        GTZRCtKwl0qBIf4x2bWD9c25IEn7GrCHylS19j7FKA==
X-Google-Smtp-Source: AGRyM1suSR453qA+5dSch0ZvpRtGfqRjnHNr1SDHaTA+0o2m1rKfJMVWy6hbx0LHhvgcM97D2zccNi9b/DSwV0+EihY=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr6052910oib.63.1655499161401; Fri, 17
 Jun 2022 13:52:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:52:40 -0700
MIME-Version: 1.0
In-Reply-To: <20220617191429.1087634-4-dmitry.baryshkov@linaro.org>
References: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org> <20220617191429.1087634-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 17 Jun 2022 13:52:40 -0700
Message-ID: <CAE-0n51vBRdNNM3BH90uG5TH=Gr51rX9B527L4U2yXh1YXYiQQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drm/msm: stop storing the array of CRTCs in struct msm_drm_private
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
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

Quoting Dmitry Baryshkov (2022-06-17 12:14:29)
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 44485363f37a..567e77dae43b 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -427,20 +428,23 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>         ddev->mode_config.funcs = &mode_config_funcs;
>         ddev->mode_config.helper_private = &mode_config_helper_funcs;
>
> -       for (i = 0; i < priv->num_crtcs; i++) {
> +       drm_for_each_crtc(crtc, ddev) {
> +               struct msm_drm_thread *ev_thread;
> +
>                 /* initialize event thread */
> -               priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
> -               priv->event_thread[i].dev = ddev;
> -               priv->event_thread[i].worker = kthread_create_worker(0,
> -                       "crtc_event:%d", priv->event_thread[i].crtc_id);
> -               if (IS_ERR(priv->event_thread[i].worker)) {
> -                       ret = PTR_ERR(priv->event_thread[i].worker);
> +               ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
> +               ev_thread->crtc = crtc;
> +               ev_thread->dev = ddev;
> +               ev_thread->worker = kthread_create_worker(0,
> +                       "crtc_event:%d", ev_thread->crtc->base.id);
> +               if (IS_ERR(ev_thread->worker)) {
> +                       ret = PTR_ERR(ev_thread->worker);
>                         DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
> -                       ret = PTR_ERR(priv->event_thread[i].worker);
> +                       ev_thread->worker = NULL;

This wasn't set to NULL before, so is it necessary to set it to NULL
now?
