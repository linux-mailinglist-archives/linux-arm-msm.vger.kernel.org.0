Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 086794CC97B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 23:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbiCCWvi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 17:51:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbiCCWvh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 17:51:37 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFEA14EF72
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 14:50:50 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id x193so6260141oix.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=KeDmke7qScTaAmmjjyQpyutbM2DWizHtambCdZkz9so=;
        b=c7uNVxCrj7GWjWl8k15rd3NWuQMjPYmBmVx9kC/NvH/2mYFJpmqswTrYbwyAjtUVT0
         XC+Ya9MELFv9OKGEGj4MaSGRxQiuhylUuua9ECXenWnE0XYmPgg2+6oimoL7ONr4mh+E
         NhAyMHITEtLx0K0RbybO+ZHvp19uo/sYUII1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=KeDmke7qScTaAmmjjyQpyutbM2DWizHtambCdZkz9so=;
        b=nLV5Ur8hNH5hoDOEoa6HRMVtwMO8IRjdr68/hJVlCABCUKsSTB/MH2OSoOlMEQnneo
         yP+pmiZWPOp1OehddTJb47IbQs+7OEUwYuCIFPmn1kC003C1L4ZKsFlI5cnP1qcSAD28
         3UaXSxu0AkOjodNpfi/Yd3DN1/FSzjvB1tZnLM63BpIbuzIF0Yb4sxn2fBJ7WzOCa30x
         cnNzogAASbz7XM3Wmo3WOIKWARjkTmvF1D9vt3uOyIqs3rYzlCNwv9IItK213O6zDmul
         YM6crkuw0Jic0r0Gt2XSNYUS1B38Q/nLZDzH41Q4kUhgjNVptJOZBA912Uv/yqOrCwXi
         VD7A==
X-Gm-Message-State: AOAM532eekR01F74O8NUG0q/VuLeG4mR80lEp1uSiQCgnFWFmy3jVPba
        IxZQkjoNYGyaa4fyHbgEBT3DE/uwpnhyJ2oVRtUtxw==
X-Google-Smtp-Source: ABdhPJxA0gclpLTZ0n3tm36YIjXGwbHs5/bZqav5p1HszkHa+lfQd5VovmMf1U0kgnme3ZuS28Lh/1eE7rePS9rZovo=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr6732813oiw.64.1646347849504; Thu, 03
 Mar 2022 14:50:49 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:50:49 -0800
MIME-Version: 1.0
In-Reply-To: <20220119224005.3104578-2-dmitry.baryshkov@linaro.org>
References: <20220119224005.3104578-1-dmitry.baryshkov@linaro.org> <20220119224005.3104578-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 14:50:49 -0800
Message-ID: <CAE-0n526yEZzk8Yzje+HszN79MFPkovVFDKXPffMwL8sE9n_8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/msm: unify MDSS drivers
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

Quoting Dmitry Baryshkov (2022-01-19 14:40:02)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> similarity index 58%
> rename from drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> rename to drivers/gpu/drm/msm/msm_mdss.c
> index 9f5cc7f9e9a9..f5429eb0ae52 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -188,22 +182,64 @@ static void dpu_mdss_destroy(struct msm_mdss *mdss)
>
>         pm_runtime_suspend(mdss->dev);
>         pm_runtime_disable(mdss->dev);
> -       _dpu_mdss_irq_domain_fini(dpu_mdss);
> +       irq_domain_remove(dpu_mdss->irq_controller.domain);
> +       dpu_mdss->irq_controller.domain = NULL;
>         irq = platform_get_irq(pdev, 0);
>         irq_set_chained_handler_and_data(irq, NULL, NULL);
> -
> -       if (dpu_mdss->mmio)
> -               devm_iounmap(&pdev->dev, dpu_mdss->mmio);
> -       dpu_mdss->mmio = NULL;
>  }
>
>  static const struct msm_mdss_funcs mdss_funcs = {
> -       .enable = dpu_mdss_enable,
> -       .disable = dpu_mdss_disable,
> -       .destroy = dpu_mdss_destroy,
> +       .enable = msm_mdss_enable,
> +       .disable = msm_mdss_disable,
> +       .destroy = msm_mdss_destroy,
>  };
>
> -int dpu_mdss_init(struct platform_device *pdev)
> +/*
> + * MDP5 MDSS uses at most three specified clocks.
> + */
> +#define MDP5_MDSS_NUM_CLOCKS 3
> +int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_data **clocks)

static?

> +{
> +       struct clk_bulk_data *bulk;
> +       struct clk *clk;
> +       int num_clocks = 0;
> +
> +       if (!pdev)
> +               return -EINVAL;
> +
> +       bulk = devm_kcalloc(&pdev->dev, MDP5_MDSS_NUM_CLOCKS, sizeof(struct clk_bulk_data), GFP_KERNEL);
> +       if (!bulk)
> +               return -ENOMEM;
> +
> +       /* We ignore all the errors except deferral: typically they mean that the clock is not provided in the dts. */
> +       clk = msm_clk_get(pdev, "iface");
> +       if (!IS_ERR(clk)) {
> +               bulk[num_clocks].id = "iface";
> +               bulk[num_clocks].clk = clk;
> +               num_clocks++;
> +       } else if (clk == ERR_PTR(-EPROBE_DEFER))
> +               return -EPROBE_DEFER;
> +
> +       clk = msm_clk_get(pdev, "bus");
> +       if (!IS_ERR(clk)) {
> +               bulk[num_clocks].id = "bus";
> +               bulk[num_clocks].clk = clk;
> +               num_clocks++;
> +       } else if (clk == ERR_PTR(-EPROBE_DEFER))
> +               return -EPROBE_DEFER;
> +
> +       clk = msm_clk_get(pdev, "vsync");
> +       if (!IS_ERR(clk)) {
> +               bulk[num_clocks].id = "vsync";
> +               bulk[num_clocks].clk = clk;
> +               num_clocks++;
> +       } else if (clk == ERR_PTR(-EPROBE_DEFER))
> +               return -EPROBE_DEFER;
> +
> +       return num_clocks;
> +}
> +
> +int msm_mdss_init(struct platform_device *pdev, bool mdp5)

Maybe is_mdp5 so the if reads simpler.

>  {
>         struct msm_drm_private *priv = platform_get_drvdata(pdev);
>         struct dpu_mdss *dpu_mdss;
> @@ -220,27 +256,28 @@ int dpu_mdss_init(struct platform_device *pdev)
>
>         DRM_DEBUG("mapped mdss address space @%pK\n", dpu_mdss->mmio);
>
> -       ret = msm_parse_clock(pdev, &dpu_mdss->clocks);
> +       if (mdp5)
> +               ret = mdp5_mdss_parse_clock(pdev, &dpu_mdss->clocks);
> +       else
> +               ret = msm_parse_clock(pdev, &dpu_mdss->clocks);
>         if (ret < 0) {
> -               DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
> -               goto clk_parse_err;
> +               DRM_ERROR("failed to parse clocks, ret=%d\n", ret);
> +               return ret;
>         }
>         dpu_mdss->num_clocks = ret;
