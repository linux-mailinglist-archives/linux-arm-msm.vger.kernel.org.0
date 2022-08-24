Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA7459F543
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Aug 2022 10:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbiHXIaK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Aug 2022 04:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiHXIaI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Aug 2022 04:30:08 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC43630B
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 01:30:03 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id l5so7558071qvs.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Aug 2022 01:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=lXgnOAXBrxxj2w0yjUYGD9COtuXV48cnV56Vy6CXruk=;
        b=lvy293hWDNSAVPaTOH/yzVsEQSE22DilCvXvLbCQnDkosmtLJqQArIO9n2dYW7W//4
         jJLj40wpAbMhwMAcIWaJe0YKnXGdc+yWJHlW4I/yHiw1als3KbdbgLeZuguyDGYIqQLt
         ggk8a0oAtpkrBg6QmeM5+6Qxmn5qBVYPp0q/6yaVR9fy7fAK769JIP6h3LOodnkj00BW
         d6oBX/oIJoShEHiVZjoAMlvumbW/3su/Kw0FfAHVp5gCi3MYOAY3uL3Xz7GDGoJZsRbo
         RY+vmXP8mLjxShC50WTXRS0D743S2qa+N/6narY4Di2reXCj9aQnZKin5dr6/lN97NKs
         4A8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=lXgnOAXBrxxj2w0yjUYGD9COtuXV48cnV56Vy6CXruk=;
        b=eGm8+l/B1Fv0/1xz09zdxnW0BRwIU+TcLJ42B893pYMvf3wiKK24vRlD0KQju4Ohlo
         nj4y5pryyYI9FyaHwD3kg9lKK3jZ5D2x92a5LiQpBFV7lQP4+T/dr42HeLh4nlKTv1R5
         iFgU1VJcCoW6HNkJM3XFFlMGbm1P5KDs1nm9GQmgE9cLzPxokS5h1+wfDOs9Gr4DTfSX
         zxD5jYRTxzG5WQHdHzaNH7+DYlIVGK7eqtn4oAaefkJMro1ylvyGcqKP4D+s9xuAaZMl
         nzMkmit8KMiLTY7Q2/GIi6osaqf//ErCdOVSCLQFBjQ6Dyyn6E1uhWXISen7xwY8KFCY
         92NQ==
X-Gm-Message-State: ACgBeo3yNcAXBfFgfswOhEyJRdadm5HzRVNnK3HnbSUsmDgN/BYdGH8g
        fFDhbOf0QpKKp92uIe8IpQ40QpMULQsT6N+sjyJ/rJyfTvg=
X-Google-Smtp-Source: AA6agR4PFGlUmWrSndGaFBPWCzCuLvo3D0eA+iwqu92YSadl6GsFrlujyHWIhnsAWDk7vIoq4xgSDGc+CpmWiAxS1+I=
X-Received: by 2002:a0c:a907:0:b0:496:cf4f:2426 with SMTP id
 y7-20020a0ca907000000b00496cf4f2426mr15597412qva.119.1661329802772; Wed, 24
 Aug 2022 01:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220620213054.1872954-1-dmitry.baryshkov@linaro.org>
 <20220620213054.1872954-2-dmitry.baryshkov@linaro.org> <251f0ce1-05cd-548e-9253-82adbc1038ce@quicinc.com>
In-Reply-To: <251f0ce1-05cd-548e-9253-82adbc1038ce@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 24 Aug 2022 11:29:51 +0300
Message-ID: <CAA8EJpogK9BbrSzgJp+Rb_Op2+JBFsTdQHxpTFz28c2biE8AUw@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] drm/msm/mdp5: stop overriding drvdata
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 24 Aug 2022 at 04:25, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/20/2022 2:30 PM, Dmitry Baryshkov wrote:
> > The rest of the code expects that master's device drvdata is the
> > struct msm_drm_private instance. Do not override the mdp5's drvdata.
> >
> > Fixes: 6874f48bb8b0 ("drm/msm: make mdp5/dpu devices master components")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Is this just for consistency across mdp5/dpu drivers?
>
> What issue was seen if mdp5's platform data is overwritten?

I think there was a crash in mdp5_destroy, but I did not capture the
log at the moment.

As you can see, the mdp5_destroy() expects to get mdp5_kms pointer
from the drvdata. However the msm_drv_probe sets the drvdata to
msm_drm_private instance. Boom.

>
> > ---
> >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 19 +++++++++----------
> >   1 file changed, 9 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > index c668a4b27cc6..daf5b5ca7233 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> > @@ -203,7 +203,7 @@ static int mdp5_set_split_display(struct msm_kms *kms,
> >                                                         slave_encoder);
> >   }
> >
> > -static void mdp5_destroy(struct platform_device *pdev);
> > +static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
> >
> >   static void mdp5_kms_destroy(struct msm_kms *kms)
> >   {
> > @@ -223,7 +223,7 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
> >       }
> >
> >       mdp_kms_destroy(&mdp5_kms->base);
> > -     mdp5_destroy(mdp5_kms->pdev);
> > +     mdp5_destroy(mdp5_kms);
> >   }
> >
> >   #ifdef CONFIG_DEBUG_FS
> > @@ -651,9 +651,8 @@ static int mdp5_kms_init(struct drm_device *dev)
> >       return ret;
> >   }
> >
> > -static void mdp5_destroy(struct platform_device *pdev)
> > +static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
> >   {
> > -     struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> >       int i;
> >
> >       if (mdp5_kms->ctlm)
> > @@ -667,7 +666,7 @@ static void mdp5_destroy(struct platform_device *pdev)
> >               kfree(mdp5_kms->intfs[i]);
> >
> >       if (mdp5_kms->rpm_enabled)
> > -             pm_runtime_disable(&pdev->dev);
> > +             pm_runtime_disable(&mdp5_kms->pdev->dev);
> >
> >       drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
> >       drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
> > @@ -816,8 +815,6 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
> >               goto fail;
> >       }
> >
> > -     platform_set_drvdata(pdev, mdp5_kms);
> > -
> >       spin_lock_init(&mdp5_kms->resource_lock);
> >
> >       mdp5_kms->dev = dev;
> > @@ -915,7 +912,7 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
> >       return 0;
> >   fail:
> >       if (mdp5_kms)
> > -             mdp5_destroy(pdev);
> > +             mdp5_destroy(mdp5_kms);
> >       return ret;
> >   }
> >
> > @@ -975,7 +972,8 @@ static int mdp5_dev_remove(struct platform_device *pdev)
> >   static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
> >   {
> >       struct platform_device *pdev = to_platform_device(dev);
> > -     struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> > +     struct msm_drm_private *priv = platform_get_drvdata(pdev);
> > +     struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
> >
> >       DBG("");
> >
> > @@ -985,7 +983,8 @@ static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
> >   static __maybe_unused int mdp5_runtime_resume(struct device *dev)
> >   {
> >       struct platform_device *pdev = to_platform_device(dev);
> > -     struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
> > +     struct msm_drm_private *priv = platform_get_drvdata(pdev);
> > +     struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
> >
> >       DBG("");
> >



-- 
With best wishes
Dmitry
