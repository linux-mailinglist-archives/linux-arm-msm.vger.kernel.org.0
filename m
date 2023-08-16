Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C48177DB19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Aug 2023 09:28:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242402AbjHPH1n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 03:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242404AbjHPH1i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 03:27:38 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96AE910C0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 00:27:37 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d71c3a32e1aso220298276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 00:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692170857; x=1692775657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SxcpWQGGsvXKRVaQmxo6aCUssS2kbI1VLGd3gkTsK3M=;
        b=D5Onr1ekvya8MTyI8sWR3upT0H4FtopHKS1JD29nqIWpphlnRHfHeA+hlqmF826h9e
         g5EdDxuQVawtLKUd+2Jg27eZOESQ47j6pIulyimj4GL+nD9qugt9O2yo/Jx1V3QxQDeG
         gWIRneb4h7FRgX+MRUnNKw/zwnjRRur5sDLAjy/+fwZyLC73PDMq4EMeV8CYIlWErzvl
         B91QW1lXhrRd/eKUdf/OPTjvV0WlVuqFHUyy6sduXe/oE3HgtMwtOjo9gFpEJ43cv9Jt
         F9SuKpa076A9rNzPI5MeelArn97X/DW+Ix/pDFwP5j30Lbb7MEORtgTcVdiL46HhLPjd
         +xNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692170857; x=1692775657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SxcpWQGGsvXKRVaQmxo6aCUssS2kbI1VLGd3gkTsK3M=;
        b=eKQtjmq0sNGsC3TpJOIUDrCF6q7Dp3Dyo3PQ9iZMKoGnxHFN+Dya234FzokA53P5/I
         08GXL/sHyURNIeMrOHM36tust0+g3dVR2w9kvp50SHIwI9csTqnnNGbLujZt+ZRvXPTv
         oTEOPYH7pcZ8/KZtAaF57/sgN0lRkeC0++T15L2+3EiG4V2beylQ+gqTE69sW0YenQWD
         yyJ49Y2YAUvLT5NPfSQ5g+QWP6J8jyOdsLgIyG1FmP13OUc78SqLOoJCnLauwxtfvMsh
         L/KsoeyP62hnHP0lOAK3BlFOnJPYzdmQ2BbapL4CVU8iNiTlw3/yZfwo5MNFkvf2b055
         LhxA==
X-Gm-Message-State: AOJu0YwF9oLuZINAsqnCCEgFybc+FfzIIpnHtgynCSDToCmW6vlT9Xkk
        DiW2uvL5drK2ZNa/Jtr+OM2fPu5QYe2Q+DS/zNKyK86LNBb1HfDe
X-Google-Smtp-Source: AGHT+IFX1EPd/m5YbFbdqy2uo1nuq3KWKj0+3PazzKku1AL1qo2++373ieN2NL/y5N17zNzSVlyrt+ajTCeqRYrWEwo=
X-Received: by 2002:a25:8751:0:b0:c5d:1407:f2bc with SMTP id
 e17-20020a258751000000b00c5d1407f2bcmr945122ybn.17.1692170856772; Wed, 16 Aug
 2023 00:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230730011920.354575-1-dmitry.baryshkov@linaro.org>
 <20230730011920.354575-6-dmitry.baryshkov@linaro.org> <4212982a-e5fc-c7f2-1b4f-96f2e1848a74@quicinc.com>
In-Reply-To: <4212982a-e5fc-c7f2-1b4f-96f2e1848a74@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 16 Aug 2023 10:27:25 +0300
Message-ID: <CAA8EJpqENCCohr+GpiqWA_DzgKUoXRWe=+B8v51mLDFWweYp3Q@mail.gmail.com>
Subject: Re: [PATCH v3 05/13] drm/msm/dpu: use devres-managed allocation for
 MDP TOP
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jessica,

On Tue, 15 Aug 2023 at 23:17, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
>
>
> On 7/29/2023 6:19 PM, Dmitry Baryshkov wrote:
> > Use devm_kzalloc to create MDP TOP structure. This allows us to remove
> > corresponding kfree and drop dpu_hw_mdp_destroy() function.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c | 17 +++++++----------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h |  8 +++++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    |  5 ++---
> >   3 files changed, 14 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> > index cff48763ce25..481b373d9ccb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> > @@ -2,6 +2,8 @@
> >   /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
> >    */
> >
> > +#include <drm/drm_managed.h>
>
> Hi Dmitry,
>
> Is it possible to put this #include in a common header? Since it seems
> that this is a common change for a lot of patches in this series.

I personally do not like putting unused includes into common headers.
Each file should contain includes that are used by the particular file
only. Header should include only the files required to process
definitions in this header.

>
> Thanks,
>
> Jessica Zhang
>
> > +
> >   #include "dpu_hwio.h"
> >   #include "dpu_hw_catalog.h"
> >   #include "dpu_hw_top.h"
> > @@ -268,16 +270,17 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
> >               ops->intf_audio_select = dpu_hw_intf_audio_select;
> >   }
> >
> > -struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
> > -             void __iomem *addr,
> > -             const struct dpu_mdss_cfg *m)
> > +struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
> > +                                   const struct dpu_mdp_cfg *cfg,
> > +                                   void __iomem *addr,
> > +                                   const struct dpu_mdss_cfg *m)
> >   {
> >       struct dpu_hw_mdp *mdp;
> >
> >       if (!addr)
> >               return ERR_PTR(-EINVAL);
> >
> > -     mdp = kzalloc(sizeof(*mdp), GFP_KERNEL);
> > +     mdp = drmm_kzalloc(dev, sizeof(*mdp), GFP_KERNEL);
> >       if (!mdp)
> >               return ERR_PTR(-ENOMEM);
> >
> > @@ -292,9 +295,3 @@ struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
> >
> >       return mdp;
> >   }
> > -
> > -void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp)
> > -{
> > -     kfree(mdp);
> > -}
> > -
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> > index 8b1463d2b2f0..6f3dc98087df 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> > @@ -145,13 +145,15 @@ struct dpu_hw_mdp {
> >
> >   /**
> >    * dpu_hw_mdptop_init - initializes the top driver for the passed config
> > + * @dev:  Corresponding device for devres management
> >    * @cfg:  MDP TOP configuration from catalog
> >    * @addr: Mapped register io address of MDP
> >    * @m:    Pointer to mdss catalog data
> >    */
> > -struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
> > -             void __iomem *addr,
> > -             const struct dpu_mdss_cfg *m);
> > +struct dpu_hw_mdp *dpu_hw_mdptop_init(struct drm_device *dev,
> > +                                   const struct dpu_mdp_cfg *cfg,
> > +                                   void __iomem *addr,
> > +                                   const struct dpu_mdss_cfg *m);
> >
> >   void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 6e0643ea4868..d4f4cb402663 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -820,8 +820,6 @@ static void _dpu_kms_hw_destroy(struct dpu_kms *dpu_kms)
> >
> >       dpu_kms->catalog = NULL;
> >
> > -     if (dpu_kms->hw_mdp)
> > -             dpu_hw_mdp_destroy(dpu_kms->hw_mdp);
> >       dpu_kms->hw_mdp = NULL;
> >   }
> >
> > @@ -1091,7 +1089,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
> >
> >       dpu_kms->rm_init = true;
> >
> > -     dpu_kms->hw_mdp = dpu_hw_mdptop_init(dpu_kms->catalog->mdp,
> > +     dpu_kms->hw_mdp = dpu_hw_mdptop_init(dev,
> > +                                          dpu_kms->catalog->mdp,
> >                                            dpu_kms->mmio,
> >                                            dpu_kms->catalog);
> >       if (IS_ERR(dpu_kms->hw_mdp)) {
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry
