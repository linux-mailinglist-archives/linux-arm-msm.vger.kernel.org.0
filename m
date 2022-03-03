Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 654AD4CC97E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 23:54:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235760AbiCCWzC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 17:55:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbiCCWzB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 17:55:01 -0500
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7085AECB15
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 14:54:15 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id w3-20020a4ac183000000b0031d806bbd7eso7464240oop.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=SWwr6PfQx9+FPyvTdo8KBfSMVcyO3fHRr3T3bQXm+ds=;
        b=QBW+znNKKa/bk/d9EArBF7hxjYyQk4nEwGsuQPFy4XkOyGaGnr2MqkogedjMGH6P6x
         IDtN+u+8Ykw/r3Mgxm1L+pc7zVn/aMdZjDLZ2isamgiU7xVKEAtCY7dXqnJkd5RQpCh+
         8Y5Yl4c26VGBMMpyT8YAIzoZVEcGktlM9tX18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=SWwr6PfQx9+FPyvTdo8KBfSMVcyO3fHRr3T3bQXm+ds=;
        b=imjpMN5RW2PjPFQ7XcRiDo8XGhEAkjP30GRuSyRHYFq5BAA7W2jsrzw2aPIyDqVaS1
         kOH5CTZk7u2P2HWfkNf7yboNRPAuGWihRJPYpFTrAneokZb0zJohhcRuqbzkI+hGayFd
         Ds2ZTaFe6qLPII5sFDLIzEQF593YkbPHa1MNz2Hw/4C7iFLexnHziML+AS/cgrzjNKza
         tL613iOW63PgU9PqMMCeE3+WQ+vgwAAp/fi4X9JTXtgMdyuI2pBFbUEoJquI92RRmqXz
         O6APeSDYxMgZ3YduL7i8nvXyoKFyLK/xdQSVCVB4zmsfZ1leEfTcQzr8I1185S9yKVt5
         Guww==
X-Gm-Message-State: AOAM531ZFv0p2DFKy/LNHygFdaQaPu+5Q6JI+a6Z2MGS9OZcFnCdijdO
        dVR9fklJnAQDrUu/v7PCpeJLvlmwkePdHSbt/xeUFQ==
X-Google-Smtp-Source: ABdhPJx/6Rxm4cp68BFJJFqy3CAujhE6UWDHQU3lHjqBYT+eQ18QrGqQbyqLY4SwEdptGIgYFgUpSCqce2VueXCbcBs=
X-Received: by 2002:a05:6870:14cf:b0:d9:a9ce:92a9 with SMTP id
 l15-20020a05687014cf00b000d9a9ce92a9mr5886672oab.64.1646348054835; Thu, 03
 Mar 2022 14:54:14 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:54:14 -0800
MIME-Version: 1.0
In-Reply-To: <20220119224005.3104578-3-dmitry.baryshkov@linaro.org>
References: <20220119224005.3104578-1-dmitry.baryshkov@linaro.org> <20220119224005.3104578-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 14:54:14 -0800
Message-ID: <CAE-0n51MFCFedPR4H__ousJGsatRWJKJpoo8rHUmJ4qdea22pw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/msm: remove extra indirection for msm_mdss
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-01-19 14:40:03)
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index be06a62d7ccb..f18dfbb614f0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1211,19 +1212,32 @@ static int msm_pdev_probe(struct platform_device *pdev)
>
>         switch (get_mdp_ver(pdev)) {
>         case KMS_MDP5:
> -               ret = msm_mdss_init(pdev, true);
> +               mdss = msm_mdss_init(pdev, true);
> +               if (IS_ERR(mdss)) {
> +                       ret = PTR_ERR(mdss);
> +                       platform_set_drvdata(pdev, NULL);
> +
> +                       return ret;
> +               } else {

Drop else

> +                       priv->mdss = mdss;
> +                       pm_runtime_enable(&pdev->dev);
> +               }
>                 break;
>         case KMS_DPU:
> -               ret = msm_mdss_init(pdev, false);
> +               mdss = msm_mdss_init(pdev, false);
> +               if (IS_ERR(mdss)) {
> +                       ret = PTR_ERR(mdss);
> +                       platform_set_drvdata(pdev, NULL);
> +
> +                       return ret;
> +               } else {
> +                       priv->mdss = mdss;
> +                       pm_runtime_enable(&pdev->dev);
> +               }

This is the same so why can't it be done below in the deleted if (ret)?

>                 break;
>         default:
> -               ret = 0;
>                 break;
>         }
> -       if (ret) {
> -               platform_set_drvdata(pdev, NULL);
> -               return ret;
> -       }
>
>         if (get_mdp_ver(pdev)) {
>                 ret = add_display_components(pdev, &match);
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 2459ba479caf..0c341660941a 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -239,50 +228,44 @@ int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_data **c
>         return num_clocks;
>  }
>
> -int msm_mdss_init(struct platform_device *pdev, bool mdp5)
> +struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool mdp5)

Ah I see it will quickly become not static. Still should have static
first and remove it here.
