Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1B0E7465E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 00:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbjGCW7q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 18:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbjGCW7p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 18:59:45 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36B7E59
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 15:59:43 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-c11e2b31b95so5527556276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 15:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688425183; x=1691017183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bv0PY9VcAwjIieAMvlnZw/0FpPWp9AXm3TQJRoukoAI=;
        b=dHf9Uh5kfXrxyhNTH7HzArkL3ABEeb/R3ILHnvzBL8BQCiPGhzNmMR6PBLz9QgYoc5
         ag2MtjgyN3KeJrYhw/n8C5COtHsNz8tKcY5hwMnh/gUttDvvVdSELCHLCXldhNslOnRM
         JO8k5LpgLl0zSa0pPdBy518JmB05/bvUuRK+DLOrlEqJPdD7KZJwl+Vx627o08UlOQdF
         kfjEqXe0rU7h4HV9u52CywwH0uyfCJyLo+7hVP9/icjk6tw3P8MXIz6j0tk3Tn6Ugnen
         uFszDJz+tN4ooW4GrL81Y9qBTwSSbWebZ79y6K9yuMqdCqQyM9KE1wV5S7mYHm/PHX/i
         2TsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688425183; x=1691017183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv0PY9VcAwjIieAMvlnZw/0FpPWp9AXm3TQJRoukoAI=;
        b=B7p1cI/HFpo7o1fOfoOdMRbHkFUoxZ/R4tTk750MrulEbWDTT7n/T2o6VUdB9vPcgb
         077n1swEGH1WQ/JxWTqVCUZoFDMhFWzgToYG2z9p1HzGHHkniRez9K4aHOCtBpth6xO9
         u6UKA01o9bW7C8DzkHJxvMV9vQ+SmjTx4Ow3/M793rrxE3Yee54Fqfn/K1jtlAWiY+qU
         EPTzeR5H+N2vYOc0N0DaD6120rLq74CFNKGxUAiisdeZ/N9PHB6exUwp+tUM8GeX+ZoP
         L5buH1fT8Bp1tGDKF0y1/DINQjCzEcSlwwaMzeNKXMDU45gNILoAc6l5hABIPV5/imci
         Y4iw==
X-Gm-Message-State: ABy/qLb7K5+7CwmyafSYL+l02rLOKo8GvseGbQy17NGZfPXUuargLVsu
        vkPKa88WHUepRfbhqd+R+JEo2uEIXKJucrxkhS/BCA==
X-Google-Smtp-Source: APBJJlFhmtZqHoSfBbwPxK2jzBuAYgQ+6yNKLgvUh4TGVF1ctE3w979LCDrRMhF86lHf+dAOnxxBeRbSIO9VWg9x0DE=
X-Received: by 2002:a25:1486:0:b0:c15:da0b:15fb with SMTP id
 128-20020a251486000000b00c15da0b15fbmr10121384ybu.62.1688425183131; Mon, 03
 Jul 2023 15:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-8-dmitry.baryshkov@linaro.org> <b2499f3d-46d4-216e-9142-87d73e26781e@quicinc.com>
In-Reply-To: <b2499f3d-46d4-216e-9142-87d73e26781e@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Jul 2023 01:59:32 +0300
Message-ID: <CAA8EJpq43fKi=L11cyfBddcP+n994bhFchHcNprnR=Vu823BiA@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/msm/dpu: drop dpu_core_perf_destroy()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
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

On Tue, 4 Jul 2023 at 01:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
> > This function does nothing, just clears several data pointers. Drop it
> > now.
> >
>
> This will undo what dpu_core_perf_init() did when an error happens.
>
> Why can we drop that?

Because nothing will use this data in an error case. There is no need
to clean it.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
> >   3 files changed, 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 78a7e3ea27a4..f779ad544347 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -394,18 +394,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
> >   }
> >   #endif
> >
> > -void dpu_core_perf_destroy(struct dpu_core_perf *perf)
> > -{
> > -     if (!perf) {
> > -             DPU_ERROR("invalid parameters\n");
> > -             return;
> > -     }
> > -
> > -     perf->max_core_clk_rate = 0;
> > -     perf->core_clk = NULL;
> > -     perf->dev = NULL;
> > -}
> > -
> >   int dpu_core_perf_init(struct dpu_core_perf *perf,
> >               struct drm_device *dev,
> >               const struct dpu_perf_cfg *perf_cfg,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > index e8a7916b6f71..e1198c104b5e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > @@ -69,12 +69,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
> >    */
> >   void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
> >
> > -/**
> > - * dpu_core_perf_destroy - destroy the given core performance context
> > - * @perf: Pointer to core performance context
> > - */
> > -void dpu_core_perf_destroy(struct dpu_core_perf *perf);
> > -
> >   /**
> >    * dpu_core_perf_init - initialize the given core performance context
> >    * @perf: Pointer to core performance context
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 6e62606e32de..4439147d2c35 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -1162,7 +1162,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
> >       return 0;
> >
> >   drm_obj_init_err:
> > -     dpu_core_perf_destroy(&dpu_kms->perf);
> >   hw_intr_init_err:
> >   perf_err:
> >   power_error:



-- 
With best wishes
Dmitry
