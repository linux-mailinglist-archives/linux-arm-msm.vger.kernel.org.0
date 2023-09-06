Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25F9579461E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 00:19:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244401AbjIFWTj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 18:19:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245035AbjIFWTi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 18:19:38 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6953010F7
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 15:19:35 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d7f0a60a159so283222276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 15:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694038774; x=1694643574; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Tnj8GJBcGOqoSNZE01aLcIiGwYJS0wicspbPN1sH9Q=;
        b=EoxRt0T/iNlV9vW3dhTEXj6voMgW910OaciXcZ+g1ew421BhkdqqwtZRr4Eat58dbu
         JBzlYm6z/yZIzcXbE1bulRIzxNSGUci20EAkVKA0PA+Tgwrvdc0KUT+4nvMyzs5ijxNJ
         rs48cOot7j3T5E3HoZqVELZjJ45ly70oYgZfmfEHXMkucCg3DtoNlW73hOKqi9EuCj7U
         9gJMKWZmIuQAGeQkhoV7DNtY9AiOK4hGVa+Bzo+ynA4aGP8mP7A5wCkWLnh7mGm1QHVi
         zCnGGnwhldg+XPSDeWXwdG+y02Ijp3wYAwKKVW7nqGrSsMU3uKOn8woeQDQMR6suSxZS
         HTMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694038774; x=1694643574;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Tnj8GJBcGOqoSNZE01aLcIiGwYJS0wicspbPN1sH9Q=;
        b=H/4DFnk3/0EiQ895cJbER4jnaApXySd1sGPtleROliRAlKX6AGMO5t15jcnjtWUB5t
         imykZUMLlvfvczaJfvVV1ev2NGJnedI81Fesnzdhfu58fMFrp3NHjIOmSla9I2JgVn81
         IaoLMHI2qddTsmXCavvuxEr1v3SmXc4NFyZ6UyemdY1nZV3/w4UzenXD9c+sbs60t76w
         hHLkuhGa4Q7vRJytZTvR0FeIzfKQ0rYYRRi8GhDwaEPIMZtnI7iDs2E7It4oyxRCe2et
         Gk5+4M2m9t9Y2pTFu7J8YeJ9gFO1XyhhCigt7+LsI6MX8xFpXOObvOjVEpaaBKpOUT7M
         Xzng==
X-Gm-Message-State: AOJu0YwcflticI17FBKfEZ881xz20CpWvTu5lTqqetlFPq1mGBSd4XRp
        m7yMFv8yr48GKuFtpe45hfi3I91sXCAxR++fEAmY+w==
X-Google-Smtp-Source: AGHT+IGnvVzqDyTaDQN1RRv9vQQEUFxQPYrxhhVQohIrfL86E3wNMufaAcRSF8iiMtJ+eOtngxBck7gdISwdKBFtedU=
X-Received: by 2002:a25:2d15:0:b0:d78:341d:9ae7 with SMTP id
 t21-20020a252d15000000b00d78341d9ae7mr18444235ybt.46.1694038774649; Wed, 06
 Sep 2023 15:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
 <20230905174353.3118648-4-dmitry.baryshkov@linaro.org> <CAE-0n509t5hFfKMEHL=3muvn-qo7qZhauzgohgOxDto1oPj2qA@mail.gmail.com>
In-Reply-To: <CAE-0n509t5hFfKMEHL=3muvn-qo7qZhauzgohgOxDto1oPj2qA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 7 Sep 2023 01:19:23 +0300
Message-ID: <CAA8EJprF1BZTi=Ar+D86W58w2byugA8vVpncKMARBfuSHopuLQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm/dpu: support binding to the mdp5 devices
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Sept 2023 at 01:17, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2023-09-05 10:43:50)
> > diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> > index 59d2788c4510..9d0d76f3a319 100644
> > --- a/drivers/gpu/drm/msm/msm_io_utils.c
> > +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> > @@ -50,6 +50,24 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
> >         return clk;
> >  }
> >
> > +void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
> > +                              struct platform_device *pdev,
> > +                              const char *name)
> > +{
> > +       struct resource *res;
> > +       void __iomem *ptr;
> > +
> > +       res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
> > +       if (!res)
> > +               return ERR_PTR(-EINVAL);
> > +
> > +       ptr = devm_ioremap_resource(&pdev->dev, res);
> > +       if (!ptr)
>
> devm_ioremap_resource() returns an error pointer. Too bad we can't use
> devm_platform_ioremap_resource_byname() here.

Unfortunately :-(

>
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       return ptr;
> > +}



-- 
With best wishes
Dmitry
