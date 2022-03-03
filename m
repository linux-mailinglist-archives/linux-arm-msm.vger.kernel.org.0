Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AED434CC9C9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Mar 2022 00:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231630AbiCCXFT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 18:05:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiCCXFT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 18:05:19 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A12941A398
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 15:04:32 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id s203-20020a4a3bd4000000b003191c2dcbe8so7496583oos.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 15:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=jZQpccdlXEVBV5XW48/HF6CSAPH1NUoB+GZhDpANl/I=;
        b=c/qUAjUweKw2rta2i7GR4qIr9spmKWqQxkGSY/VbfQLtOj3u9qkS+pxYMXypmV8idJ
         xCGueq1dZ1dGwfvzRR/Zfa5GbHQXBQYI9P2IlQdoPt9xeZH9lE6CTy/xWd4s573YBKnM
         g8n8ZF1rrZ9Y/t0b9ZxHyq1X76YF/yqafoqYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=jZQpccdlXEVBV5XW48/HF6CSAPH1NUoB+GZhDpANl/I=;
        b=FW4LDDcWg2Uq+EZ8dxPl57cwLLi7KCpVBI/E8U5rzUPLR5utDMoNW6HrprvnOkvJMl
         w1uxRyDRuW0v9PQagamauFh6N+pmAcoQwamIn4HuGGZZPDtuKdUf1IZethK/U/psNF3b
         K/TTI+rxqDrZBSyf7NKkU6/5guzCxJLvGhszqW38yrjcblOBuQI9uoqzdmgjSZ9xMQiS
         TL6zvvWDlaOBJqivGJsNo7Iy6H4+RXLnLHAg+bsa+2lBtpqWRLpgGkb6p5roWUYMMj0U
         0px4NCrPZfDZlII3XglXGm915jY3hESmZ5lX0A/+vtW9ItT0ffWZ2MKZWr+iVuBrUrL7
         2xgA==
X-Gm-Message-State: AOAM531+tKk4LajYwStNEXfWaUmvJA5y3iqBUxWW7EpjYVWExZjHtDsR
        BvM3BwmjDRB6i9QTcRtwq8jI6PwhjnpUTr6luHSpkQ==
X-Google-Smtp-Source: ABdhPJwtxRzTqJwjec3If3NOvx+suns7yeg8hgpj6o6n3vB3ZASvqDKWo0zR3tmGIuShX71IDVuArXoKwiJ4Dd2Jau8=
X-Received: by 2002:a4a:9821:0:b0:320:52bb:3806 with SMTP id
 y30-20020a4a9821000000b0032052bb3806mr6999481ooi.1.1646348671847; Thu, 03 Mar
 2022 15:04:31 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 15:04:31 -0800
MIME-Version: 1.0
In-Reply-To: <20220119224005.3104578-5-dmitry.baryshkov@linaro.org>
References: <20220119224005.3104578-1-dmitry.baryshkov@linaro.org> <20220119224005.3104578-5-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 15:04:31 -0800
Message-ID: <CAE-0n50KN-9G6ty40ZDwwLNMMn3xFPzDzkWVRDU+_rgz2UKsGA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/msm: stop using device's match data pointer
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

Quoting Dmitry Baryshkov (2022-01-19 14:40:05)
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 759076357e0e..f83dca99f03d 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -314,11 +314,11 @@ static const struct dev_pm_ops mdss_pm_ops = {
>         .complete = msm_pm_complete,
>  };
>
> -static int get_mdp_ver(struct platform_device *pdev)
> +static bool get_is_mdp5(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
>
> -       return (int) (unsigned long) of_device_get_match_data(dev);
> +       return (bool) (unsigned long) of_device_get_match_data(dev);
>  }
>
>  static int find_mdp_node(struct device *dev, void *data)
> @@ -331,21 +331,18 @@ static int mdss_probe(struct platform_device *pdev)
>  {
>         struct msm_mdss *mdss;
>         struct msm_drm_private *priv;
> -       int mdp_ver = get_mdp_ver(pdev);
> +       bool is_mdp5 = get_is_mdp5(pdev);

	is_mdp5 = of_device_is_compatible(pdev->dev.of_node, "qcom,mdss");

>         struct device *mdp_dev;
>         struct device *dev = &pdev->dev;
>         int ret;
>
> -       if (mdp_ver != KMS_MDP5 && mdp_ver != KMS_DPU)
> -               return -EINVAL;
> -
>         priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
>         platform_set_drvdata(pdev, priv);
>
> -       mdss = msm_mdss_init(pdev, mdp_ver == KMS_MDP5);
> +       mdss = msm_mdss_init(pdev, is_mdp5);
>         if (IS_ERR(mdss)) {
>                 ret = PTR_ERR(mdss);
>                 platform_set_drvdata(pdev, NULL);
> @@ -409,12 +406,12 @@ static int mdss_remove(struct platform_device *pdev)
>  }
>
>  static const struct of_device_id mdss_dt_match[] = {
> -       { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> -       { .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
> -       { .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
> -       { .compatible = "qcom,sc7280-mdss", .data = (void *)KMS_DPU },
> -       { .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
> -       { .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
> +       { .compatible = "qcom,mdss", .data = (void *)true },
> +       { .compatible = "qcom,sdm845-mdss", .data = (void *)false },
> +       { .compatible = "qcom,sc7180-mdss", .data = (void *)false },
> +       { .compatible = "qcom,sc7280-mdss", .data = (void *)false },
> +       { .compatible = "qcom,sm8150-mdss", .data = (void *)false },
> +       { .compatible = "qcom,sm8250-mdss", .data = (void *)false },

And then no data needed?
