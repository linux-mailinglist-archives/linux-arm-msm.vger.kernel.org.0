Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F08A4CCA33
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Mar 2022 00:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233902AbiCCXpD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 18:45:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231986AbiCCXpD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 18:45:03 -0500
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com [IPv6:2607:f8b0:4864:20::733])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6342D13DE0F
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 15:44:16 -0800 (PST)
Received: by mail-qk1-x733.google.com with SMTP id b13so5219558qkj.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 15:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ItdoEJtj9zjZYWGiW1lW0yBEjXjqVdFml5DfD9umqaI=;
        b=J/hBx5WYUZmVSlCRRaLBicJAHyg8XJ5XIPfWce7YT2VyURvm1AM8cw8nrxtKvSkNpp
         prRmDYzsL6pSd11su+tw62J1FowvLNze/q/+dlFVj5CvIyu6PNf3QF9/KFfi6TAfu6b8
         +4EZuTUknOKMBqW1Qgw7hw3upBT/HnKoCv38fuIXjGGDlqHBzRTt3V/szncIuWVOTmUq
         FA4WmzlC+N9kc8P6jdlDlXSOXV7IW7gecfzNrtC4B0O9Njf/xf7gNJKYEqGnkNOP15VV
         9/pLOqDD3s7HyYyxU+udK+HiSSKbzn2gciIc+oMRSI67oyZNHsF6GPVZbEG3pki58yfB
         UpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ItdoEJtj9zjZYWGiW1lW0yBEjXjqVdFml5DfD9umqaI=;
        b=IKD7leLEIA+Vkkzkika9S5wX7/25XnEf5b/vN/Cp0Jj7kMxe0iJXMiws6onVRVp0Ul
         i8FBPWtcAN0sHhjFzIhECOgFCIcrX61P+FXiJadSCK4GevCt6qj8Ydf7C0HdY6Xc5IXK
         FvEgepfyNRGpOnx899i2SZAJvq+HAcazQO0CTZDDFDTtjoCgojeHCSrwcyzcRi24tD6Z
         4DeG7DW1HTwOJhiLT5mx5g+FYBfnzCVunCqspf8Tm7YZVD6PjjYFnzqxG6SBV9vRGF1I
         OAUFHblEYokebvH3ycfvGa8zLgIfarfDRN21lVqFUg611oy011xz44g+NNt/K5gVDGXs
         My/w==
X-Gm-Message-State: AOAM533Ftg5dlTFoh1LUysEgNjnrgQdY/2GAPEfRVabfHH8iWC7oQUAz
        cKLBLv5KKpw+YYdXWY2Qet5GJQMaRvXnDhaorHfDBQ==
X-Google-Smtp-Source: ABdhPJxJO+KCmM4Hjc8qhnEGGjI+t24ab51EgjVhBiPnsrIH6bD4ba37GDxRkz/qOxkjwsmpq+tsrxxV7q0PEMYatdA=
X-Received: by 2002:a05:620a:1392:b0:60d:d76a:5073 with SMTP id
 k18-20020a05620a139200b0060dd76a5073mr1025852qki.59.1646351055546; Thu, 03
 Mar 2022 15:44:15 -0800 (PST)
MIME-Version: 1.0
References: <20220119224005.3104578-1-dmitry.baryshkov@linaro.org>
 <20220119224005.3104578-3-dmitry.baryshkov@linaro.org> <CAE-0n51MFCFedPR4H__ousJGsatRWJKJpoo8rHUmJ4qdea22pw@mail.gmail.com>
In-Reply-To: <CAE-0n51MFCFedPR4H__ousJGsatRWJKJpoo8rHUmJ4qdea22pw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 4 Mar 2022 02:44:04 +0300
Message-ID: <CAA8EJpo6o8TZKqHx+eCKSWAshKV=MjYYVt2dVdCpf=w1gBOHmQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/msm: remove extra indirection for msm_mdss
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Fri, 4 Mar 2022 at 01:54, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-01-19 14:40:03)
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index be06a62d7ccb..f18dfbb614f0 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -1211,19 +1212,32 @@ static int msm_pdev_probe(struct platform_device *pdev)
> >
> >         switch (get_mdp_ver(pdev)) {
> >         case KMS_MDP5:
> > -               ret = msm_mdss_init(pdev, true);
> > +               mdss = msm_mdss_init(pdev, true);
> > +               if (IS_ERR(mdss)) {
> > +                       ret = PTR_ERR(mdss);
> > +                       platform_set_drvdata(pdev, NULL);
> > +
> > +                       return ret;
> > +               } else {
>
> Drop else
>
> > +                       priv->mdss = mdss;
> > +                       pm_runtime_enable(&pdev->dev);
> > +               }
> >                 break;
> >         case KMS_DPU:
> > -               ret = msm_mdss_init(pdev, false);
> > +               mdss = msm_mdss_init(pdev, false);
> > +               if (IS_ERR(mdss)) {
> > +                       ret = PTR_ERR(mdss);
> > +                       platform_set_drvdata(pdev, NULL);
> > +
> > +                       return ret;
> > +               } else {
> > +                       priv->mdss = mdss;
> > +                       pm_runtime_enable(&pdev->dev);
> > +               }
>
> This is the same so why can't it be done below in the deleted if (ret)?

I didn't like the idea of checking the if (IS_ERR(mdss)) outside of
the case blocks, but now I can move it back.

>
> >                 break;
> >         default:
> > -               ret = 0;
> >                 break;
> >         }
> > -       if (ret) {
> > -               platform_set_drvdata(pdev, NULL);
> > -               return ret;
> > -       }
> >
> >         if (get_mdp_ver(pdev)) {
> >                 ret = add_display_components(pdev, &match);
> > diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> > index 2459ba479caf..0c341660941a 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.h
> > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > @@ -239,50 +228,44 @@ int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_data **c
> >         return num_clocks;
> >  }
> >
> > -int msm_mdss_init(struct platform_device *pdev, bool mdp5)
> > +struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool mdp5)
>
> Ah I see it will quickly become not static. Still should have static
> first and remove it here.



-- 
With best wishes
Dmitry
