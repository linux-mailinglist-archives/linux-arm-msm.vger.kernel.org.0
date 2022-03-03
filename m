Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAF2F4CCA3B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Mar 2022 00:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbiCCXrB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 18:47:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231986AbiCCXrA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 18:47:00 -0500
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C61C92AC6B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 15:46:13 -0800 (PST)
Received: by mail-qv1-xf33.google.com with SMTP id jv12so5389251qvb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 15:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MjKm7F3fBUzV/OI769/flWEfqS5eaSxFhJNrrAihLYc=;
        b=kRAG6I+gzSjDisjS/YXfwm4+Gt4f3LiITuFvNn5DpLjUn6v153odUWYPs3PD8Nc18G
         yfd9cgm6PZpDhNmOL7GR7s2mAzA5phqr1uqdi/qUqiwA8TIcSko9DzQqfS+jTbqM/YDR
         6/qYQSv4LcDu0fr1O2NqKuUtSH6t7/FRZ78IMPR7h63i/rUQ2KoOI7YHCem++OEEVS45
         XhjG3cLl01jJ47dW+pbbF8mDkGA9rylIUmAbl013+N3S2opMm0qTxxIaSAE6yjEKNbKt
         TdJo/lcqP8s8d+rjZc9iofuPCuOv27RScU1h1S5L9qSN0Yddn6a/MKKsc2Yy3WqqzyL/
         r4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MjKm7F3fBUzV/OI769/flWEfqS5eaSxFhJNrrAihLYc=;
        b=HvHqle5RRPHPccyoK6KlPwX1vmekZudlknE+sITdp2xoRkay/3N+qckMiiFJGd2YbQ
         kowwNgrB97MIyffjHojOy144p81yMf9CGzXicE+M02UCZRgFvLfM5GFEV7K4/7FIWoBX
         BOrkgLtv36hZs+qCkdEeI0UYO6Ck8h4TIfZftvLufy4D2AJq2QdVSdWLVRGJDsxcBjDL
         MV0DQ8/UAYMq5yxAJWFRYz85fM5L1IGO3b7YJlN5TK+ExkMEllpsz+8V6Qy7LUp+dV6V
         QrUzysC9yZFTpFf1dgIyp+J/dWsyqu2M95wP0WrW8qWPPOutM6eHBuFswRa2E28FGdA6
         xW0g==
X-Gm-Message-State: AOAM533olKLbdtQoIrbbF/pr6kc5mhoyaoWElPr4Og8u3IrESk8EnflM
        E8DMf7MzvBk2vYr9xJ04Ul8uQ8QqNVdFMLnwM8IHOA==
X-Google-Smtp-Source: ABdhPJxnpA1gQl+gPXiPpTWnOlH0DhiNAigdtXwDybk16fwOFj9QkMUts7kPEoT4T4iZ7F45fL391MZiO8CO6LFzShQ=
X-Received: by 2002:ad4:5769:0:b0:435:41db:9bca with SMTP id
 r9-20020ad45769000000b0043541db9bcamr2576718qvx.73.1646351172908; Thu, 03 Mar
 2022 15:46:12 -0800 (PST)
MIME-Version: 1.0
References: <20220119224005.3104578-1-dmitry.baryshkov@linaro.org>
 <20220119224005.3104578-4-dmitry.baryshkov@linaro.org> <CAE-0n53q35UOFUuuLTkx1pcHaAEL9L5X_u8T7SeXQh0+vrqNgA@mail.gmail.com>
In-Reply-To: <CAE-0n53q35UOFUuuLTkx1pcHaAEL9L5X_u8T7SeXQh0+vrqNgA@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 4 Mar 2022 02:46:01 +0300
Message-ID: <CAA8EJpruv1T204_Ox_t41adDCKgyadimJveVWEXnvu3Uc26V2w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm: split the main platform driver
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

On Fri, 4 Mar 2022 at 02:00, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-01-19 14:40:04)
> > diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> > index 06d26c5fb274..6895c056be19 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.h
> > +++ b/drivers/gpu/drm/msm/msm_drv.h
> > @@ -451,10 +451,18 @@ static inline void msm_dp_debugfs_init(struct msm_dp *dp_display,
> >
> >  #endif
> >
> > +#define KMS_MDP4 4
> > +#define KMS_MDP5 5
> > +#define KMS_DPU  3
> > +
> > +void __init msm_mdp4_register(void);
> > +void __exit msm_mdp4_unregister(void);
> >  void __init msm_mdp_register(void);
> >  void __exit msm_mdp_unregister(void);
> >  void __init msm_dpu_register(void);
> >  void __exit msm_dpu_unregister(void);
> > +void __init msm_mdss_register(void);
> > +void __exit msm_mdss_unregister(void);
>
> Don't need __init or __exit on prototypes.
>
> >
> >  #ifdef CONFIG_DEBUG_FS
> >  void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index 92562221b517..759076357e0e 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -8,6 +8,8 @@
> >  #include <linux/irqdesc.h>
> >  #include <linux/irqchip/chained_irq.h>
> >
> > +#include <drm/drm_of.h>
>
> What's this include for?
>
> > +
> >  #include "msm_drv.h"
> >  #include "msm_kms.h"
> >
> > @@ -127,7 +129,7 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
> >         return 0;
> >  }
> >
> > -int msm_mdss_enable(struct msm_mdss *msm_mdss)
> > +static int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >  {
> >         int ret;
> >
> > @@ -163,14 +165,14 @@ int msm_mdss_enable(struct msm_mdss *msm_mdss)
> >         return ret;
> >  }
> >
> > -int msm_mdss_disable(struct msm_mdss *msm_mdss)
> > +static int msm_mdss_disable(struct msm_mdss *msm_mdss)
> >  {
> >         clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
> >
> >         return 0;
> >  }
> >
> > -void msm_mdss_destroy(struct msm_mdss *msm_mdss)
> > +static void msm_mdss_destroy(struct msm_mdss *msm_mdss)
> >  {
> >         struct platform_device *pdev = to_platform_device(msm_mdss->dev);
> >         int irq;
> > @@ -228,7 +230,7 @@ int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_data **c
> >         return num_clocks;
> >  }
> >
> > -struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool mdp5)
> > +static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool mdp5)
> >  {
> >         struct msm_mdss *msm_mdss;
> >         int ret;
> > @@ -269,3 +271,171 @@ struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool mdp5)
> >
> >         return msm_mdss;
> >  }
> > +
> > +static int __maybe_unused mdss_runtime_suspend(struct device *dev)
> > +{
> > +       struct msm_drm_private *priv = dev_get_drvdata(dev);
> > +
> > +       DBG("");
> > +
> > +       return msm_mdss_disable(priv->mdss);
> > +}
> > +
> > +static int __maybe_unused mdss_runtime_resume(struct device *dev)
> > +{
> > +       struct msm_drm_private *priv = dev_get_drvdata(dev);
> > +
> > +       DBG("");
> > +
> > +       return msm_mdss_enable(priv->mdss);
> > +}
> > +
> > +static int __maybe_unused mdss_pm_suspend(struct device *dev)
> > +{
> > +
> > +       if (pm_runtime_suspended(dev))
> > +               return 0;
> > +
> > +       return mdss_runtime_suspend(dev);
> > +}
> > +
> > +static int __maybe_unused mdss_pm_resume(struct device *dev)
> > +{
> > +       if (pm_runtime_suspended(dev))
> > +               return 0;
> > +
> > +       return mdss_runtime_resume(dev);
> > +}
> > +
> > +static const struct dev_pm_ops mdss_pm_ops = {
> > +       SET_SYSTEM_SLEEP_PM_OPS(mdss_pm_suspend, mdss_pm_resume)
> > +       SET_RUNTIME_PM_OPS(mdss_runtime_suspend, mdss_runtime_resume, NULL)
> > +       .prepare = msm_pm_prepare,
> > +       .complete = msm_pm_complete,
> > +};
> > +
> > +static int get_mdp_ver(struct platform_device *pdev)
> > +{
> > +       struct device *dev = &pdev->dev;
> > +
> > +       return (int) (unsigned long) of_device_get_match_data(dev);
> > +}
> > +
> > +static int find_mdp_node(struct device *dev, void *data)
> > +{
> > +       return of_match_node(dpu_dt_match, dev->of_node) ||
> > +               of_match_node(mdp5_dt_match, dev->of_node);
> > +}
> > +
> > +static int mdss_probe(struct platform_device *pdev)
> > +{
> > +       struct msm_mdss *mdss;
> > +       struct msm_drm_private *priv;
> > +       int mdp_ver = get_mdp_ver(pdev);
> > +       struct device *mdp_dev;
> > +       struct device *dev = &pdev->dev;
> > +       int ret;
> > +
> > +       if (mdp_ver != KMS_MDP5 && mdp_ver != KMS_DPU)
> > +               return -EINVAL;
>
> Is it possible anymore? Now that the driver is split it seems like no.

Yes, I'll drop this.

>
> > +
> > +       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       platform_set_drvdata(pdev, priv);
> > +
> > +       mdss = msm_mdss_init(pdev, mdp_ver == KMS_MDP5);
> > +       if (IS_ERR(mdss)) {
> > +               ret = PTR_ERR(mdss);
> > +               platform_set_drvdata(pdev, NULL);
> > +
> > +               return ret;
> > +       }
> > +
> > +       priv->mdss = mdss;
> > +       pm_runtime_enable(&pdev->dev);
> > +
> > +       /*
> > +        * MDP5/DPU based devices don't have a flat hierarchy. There is a top
> > +        * level parent: MDSS, and children: MDP5/DPU, DSI, HDMI, eDP etc.
> > +        * Populate the children devices, find the MDP5/DPU node, and then add
> > +        * the interfaces to our components list.
> > +        */
> > +       ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> > +       if (ret) {
> > +               DRM_DEV_ERROR(dev, "failed to populate children devices\n");
> > +               goto fail;
> > +       }
> > +
> > +       mdp_dev = device_find_child(dev, NULL, find_mdp_node);
> > +       if (!mdp_dev) {
> > +               DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
> > +               of_platform_depopulate(dev);
> > +               ret = -ENODEV;
> > +               goto fail;
> > +       }
> > +
> > +       /*
> > +        * on MDP5 based platforms, the MDSS platform device is the component
> > +        * master that adds MDP5 and other display interface components to
>
> s/master//
>
> > +        * itself.
> > +        */
> > +       ret = msm_drv_probe(dev, mdp_dev);
> > +       put_device(mdp_dev);
> > +       if (ret)
> > +               goto fail;
> > +
> > +       return 0;
> > +
> > +fail:
> > +       of_platform_depopulate(dev);
> > +       msm_mdss_destroy(priv->mdss);
> > +
> > +       return ret;
> > +}
> > +
> > +static int mdss_remove(struct platform_device *pdev)
> > +{
> > +       struct msm_drm_private *priv = platform_get_drvdata(pdev);
> > +       struct msm_mdss *mdss = priv->mdss;
> > +
> > +       component_master_del(&pdev->dev, &msm_drm_ops);
> > +       of_platform_depopulate(&pdev->dev);
> > +
> > +       msm_mdss_destroy(mdss);
> > +
> > +       return 0;
> > +}
> > +
> > +static const struct of_device_id mdss_dt_match[] = {
> > +       { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> > +       { .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
> > +       { .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
> > +       { .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
> > +       { .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
> > +       { .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
> > +       {}
> > +};
> > +MODULE_DEVICE_TABLE(of, dt_match);
> > +
> > +static struct platform_driver mdss_platform_driver = {
> > +       .probe      = mdss_probe,
> > +       .remove     = mdss_remove,
> > +       .shutdown   = msm_drv_shutdown,
> > +       .driver     = {
> > +               .name   = "msm-mdss",
> > +               .of_match_table = mdss_dt_match,
> > +               .pm     = &mdss_pm_ops,
> > +       },
> > +};
> > +
> > +void __init msm_mdss_register(void)
> > +{
> > +       platform_driver_register(&mdss_platform_driver);
>
> I'd like to go a step further and not even compile drivers in that we
> don't use. Can we get some Kconfigs for these new drivers so that the
> number of drivers registered with the system is reduced and memory is
> conserved?

Sure. I'll add them, but in the separate commit, if you don't mind.



-- 
With best wishes
Dmitry
