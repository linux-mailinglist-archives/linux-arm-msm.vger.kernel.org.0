Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A12D54FEB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 23:02:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbiFQU55 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 16:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356425AbiFQU54 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 16:57:56 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D191A11814
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:57:51 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id t16so3131575qvh.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 13:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hDtLYPm2MMigLAt4hK4D4gopZVE7gxxmAJsjtSbkquo=;
        b=KvM+zOwenoPEZEM+sD4rQlX4KI0rJiZLzzuMqiBInkMRR3KmfTvp3Nl9FdrppYdBNQ
         pkH2Fti9wP76em/NLAoOXqszBPVd3nRZZ5lGFwww8wQ0gPjHzXERYaG439cSG1fCHWVZ
         vaj8dTD0wenZ/QhWn3mN0AoDigjMjKp6EtyMXBWRb1opO2ySIXiHp4B6QqCU3/n2zAQ3
         zKQqbPQeQT5Yg9ASShFaMZMdzaEKy4lD+EdLWD+seeGLdhTSlZAnKA2J+99HU8B6bCyw
         ot7cFhnLPrmexoYtntm+pVCTb0LNJPt6dWvvNURP+IZkp8h3cl9wqEJevyXJPEeRzlPA
         SESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hDtLYPm2MMigLAt4hK4D4gopZVE7gxxmAJsjtSbkquo=;
        b=VGQ0Kwl3qlJrvc3oZdtL/s+QoJGyUqUrFj/HuTI/CF5oMQszshoj+nKOKp/VzdG112
         YTWmt+Vg2lq3D1Y7Z4gXVufsYqSP3dyg0n8he9srSx6U0pY5H80+nQZ7SW4QsAFxOPvp
         nkvPSPhSr4qULFjsTQ4kQ+sSRwbdxr/ixhQNN5KcByv6df4XZq9aR6Vs5VLhWuchv+f8
         VUAeb0X4w9+XZbd9s7Zcpz/DhvU2JLaG7HIIbvYOKYljKRzARdo8Cz0ulghceL8vaKId
         p0dkrlPi/QOxaEg2uZ67OudxDWnKPARqKaTWmQxDg2LwmYV8Q5pUgAdPTU697lQQzKiY
         gCxA==
X-Gm-Message-State: AJIora+pYvBu4EPY+xw8HycfPc1zH52ASi94Neh1/3+h/crrCD+ZgdWA
        uNPr9tiFsDBieagHYE3190cGni3oqTbdzHHDwPZaHA==
X-Google-Smtp-Source: AGRyM1vCXUo2pwCd9vh+yQdc3TauvRb4LW5fVuO1WIW1usW/rP7ntYxG+OndbFZDUC4+ETvTVr4fsiXrD/4xePRqfqU=
X-Received: by 2002:a05:6214:5488:b0:46b:b272:f7d1 with SMTP id
 lg8-20020a056214548800b0046bb272f7d1mr9978782qvb.73.1655499470989; Fri, 17
 Jun 2022 13:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
 <20220617191429.1087634-4-dmitry.baryshkov@linaro.org> <CAE-0n51vBRdNNM3BH90uG5TH=Gr51rX9B527L4U2yXh1YXYiQQ@mail.gmail.com>
In-Reply-To: <CAE-0n51vBRdNNM3BH90uG5TH=Gr51rX9B527L4U2yXh1YXYiQQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 17 Jun 2022 23:57:39 +0300
Message-ID: <CAA8EJpq0P+pyfspMQp6ed7kcsmjFPEUCn36rdDWDVO5SQ6vL9A@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] drm/msm: stop storing the array of CRTCs in struct msm_drm_private
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
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

On Fri, 17 Jun 2022 at 23:52, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-06-17 12:14:29)
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 44485363f37a..567e77dae43b 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -427,20 +428,23 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
> >         ddev->mode_config.funcs = &mode_config_funcs;
> >         ddev->mode_config.helper_private = &mode_config_helper_funcs;
> >
> > -       for (i = 0; i < priv->num_crtcs; i++) {
> > +       drm_for_each_crtc(crtc, ddev) {
> > +               struct msm_drm_thread *ev_thread;
> > +
> >                 /* initialize event thread */
> > -               priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
> > -               priv->event_thread[i].dev = ddev;
> > -               priv->event_thread[i].worker = kthread_create_worker(0,
> > -                       "crtc_event:%d", priv->event_thread[i].crtc_id);
> > -               if (IS_ERR(priv->event_thread[i].worker)) {
> > -                       ret = PTR_ERR(priv->event_thread[i].worker);
> > +               ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
> > +               ev_thread->crtc = crtc;
> > +               ev_thread->dev = ddev;
> > +               ev_thread->worker = kthread_create_worker(0,
> > +                       "crtc_event:%d", ev_thread->crtc->base.id);
> > +               if (IS_ERR(ev_thread->worker)) {
> > +                       ret = PTR_ERR(ev_thread->worker);
> >                         DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
> > -                       ret = PTR_ERR(priv->event_thread[i].worker);
> > +                       ev_thread->worker = NULL;
>
> This wasn't set to NULL before, so is it necessary to set it to NULL
> now?

The msm_drm_uninit() will loop over the event_thread array and try to
cleanup workers. However if the ev_thread->worker contains the error
code, then we risk getting an oops.

Let me take another glance onto this code and split this into a
separate fixup patch.

-- 
With best wishes
Dmitry
