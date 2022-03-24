Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36CD54E6A35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Mar 2022 22:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241607AbiCXVZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Mar 2022 17:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356002AbiCXVZM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Mar 2022 17:25:12 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EA0A1AD
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 14:23:39 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-d4164acd34so6227515fac.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 14:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=u4jj/zOQzuXEovzke6K3cPdIWt6nW+CnDZ3+Of9Qdrw=;
        b=GogDieupr7LC079twCniLBZogLbYvk6MLpQzWbfxcPvpgRFa4/yCgsLpfmK7/AQsW6
         +nle0KfwUOxCwExyGe2tBuzsFHpI4rD4d85GD9NXAyelB1QygVh9bsgJlizXRbTBZjWV
         6fJTljnStNk5KsFtArSMzSjfFSLjJKq9iTSUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=u4jj/zOQzuXEovzke6K3cPdIWt6nW+CnDZ3+Of9Qdrw=;
        b=ykqUPTHAriHUs3TSd8VlzHcl0zG+F9aJWD9B4QjG1B+jTCpKf6jG+9h+FS88FeY4kO
         5nf11gK3n6c+xqenIkyR0vr4RJQKWDtc0ki28YIXeft0bU2/C67yhSeMOM9feeZLKSpm
         j1nxeyNbacpU01Ny56qNRNs2viySgib2jRvMZrx5gjGHH47pF7AEVTcHe4OKly/v/ux6
         lUUBhBFpFEE0uFqrWni2z6HMW1EQ0ve3eCaj0CG6w/fqvFragFVMiVU0Mwu/X/V5shYy
         FQcpoIm0MFWVzYwWE27hW7uuAtfDhSfWMdfc5Z2mCuy/GEHZRGL6PB00p9TiLgIeCGQg
         bbOQ==
X-Gm-Message-State: AOAM532vb5SdH7/qbEbsJ7R8Ff+d00Id1snfpndV+wPB94ZlaS7CN+jL
        XdHSc2f9IxYoCimvy9CSMqndDJjchyXtlb2dvVjAyw==
X-Google-Smtp-Source: ABdhPJyI4PlixBpMhpnkyqffokmmzaLmt4gtL9Qh8dX1otTTqY9VnE3Fm3AZyU5uMLAnZbxSES/qRj0yEKRGwRbt+2I=
X-Received: by 2002:a05:6870:46ac:b0:de:5d48:9d27 with SMTP id
 a44-20020a05687046ac00b000de5d489d27mr3497500oap.63.1648157018070; Thu, 24
 Mar 2022 14:23:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Mar 2022 16:23:37 -0500
MIME-Version: 1.0
In-Reply-To: <20220323092538.1757880-4-dmitry.baryshkov@linaro.org>
References: <20220323092538.1757880-1-dmitry.baryshkov@linaro.org> <20220323092538.1757880-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 24 Mar 2022 16:23:37 -0500
Message-ID: <CAE-0n52rraD2tDvEPn4gG0KzArm5e1cx=Z66vCwTvcY3hCwiAg@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] drm/msm: split the main platform driver
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-03-23 02:25:35)
> Currently the msm platform driver is a multiplex handling several cases:
> - headless GPU-only driver,
> - MDP4 with flat device nodes,
> - MDP5/DPU MDSS with all the nodes being children of MDSS node.
>
> This results in not-so-perfect code, checking the hardware version
> (MDP4/MDP5/DPU) in several places, checking for mdss even when it can
> not exist, etc. Split the code into three handling subdrivers (mdp4,
> mdss and headless msm).
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

With the match table fixed and the nit below

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> index 3cf476c55158..c5c0650414c5 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -569,3 +569,59 @@ static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
>
>         return &config;
>  }
> +
> +static const struct dev_pm_ops mdp4_pm_ops = {
> +       .prepare = msm_pm_prepare,
> +       .complete = msm_pm_complete,
> +};
> +
> +static int mdp4_probe(struct platform_device *pdev)
> +{
> +       struct msm_drm_private *priv;
> +
> +       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, priv);
> +
> +       /*
> +        * on MDP4 based platforms, the MDP platform device is the component
> +        * master that adds other display interface components to itself.

Just delete master. It provides no value in this sentence.

> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 62007a4f29a2..512708101931 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -255,3 +258,167 @@ struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
[...]
> +               DRM_DEV_ERROR(dev, "failed to populate children devices\n");
> +               goto fail;
> +       }
> +
> +       mdp_dev = device_find_child(dev, NULL, find_mdp_node);
> +       if (!mdp_dev) {
> +               DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
> +               of_platform_depopulate(dev);
> +               ret = -ENODEV;
> +               goto fail;
> +       }
> +
> +       /*
> +        * on MDP5 based platforms, the MDSS platform device is the component
> +        * that adds MDP5 and other display interface components to

Like here.
