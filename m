Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D20434D229E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Mar 2022 21:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242939AbiCHUcJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Mar 2022 15:32:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234922AbiCHUcI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Mar 2022 15:32:08 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9889E50E1D
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Mar 2022 12:31:11 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id q189so481061oia.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Mar 2022 12:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ggKE+QQN96ACgccKsgFkOnubBkvwOfbXHtYWYxkQBiY=;
        b=ChyVvEiI6i2Y5+AJDxTMK0DvaXspW10L04xc7T3dBzWFVLrvr/QoeFenREIvCdo6a6
         9R7dWKbI7LjPm/hsNp7oZBDMlDQvVHw6DBtblOF/PkcJZIipiktXOCmSy3AcX323Ulwe
         tVpUezHz9kUATYgbAc2FC4LycF9VnfQYUOreQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ggKE+QQN96ACgccKsgFkOnubBkvwOfbXHtYWYxkQBiY=;
        b=WyPmKwCvTOxG4OiuiYA9BYZVLHm6OmYSZ73MGWHCC1VgBSu8aw46sbvguf1jas7Myi
         vLq/CbsPG1/zaSuyQ7yeMX3MDMqL3e2ddnQ0ym25XsALQYtsiqjEra6+QNztrZkMhs/s
         TWIXw9DJpX+t089JCQwiTt4BzCewz7ygozmc6VrD6ntbyubuWeKnak8YuVH+GklTr3c3
         3JLvuYM33JLPGNxETRWJvGKngDvVcn12v2BtZWcgTt5riIqLeIQMSUqT0LkPJ3qCGcRi
         KmQePfTiBStxiwvNm+HRc8NHjEFxpZk/skS0g72dth9uXw5/LXi/n6QvhF9kskJPCgKY
         RQ8A==
X-Gm-Message-State: AOAM530PORJG3kk9xxm2UYOTifaZAeO5AX72EIkEt8qnhVovLSJf3RuJ
        6ofhQluIWlpQIg8BpDBu7G/B18LjGLxbHkaovjYddg==
X-Google-Smtp-Source: ABdhPJw4rTppu+6vf/ZU341j6fzv5vxD9Y57pMhosx4Tq2+tN5qUwZzja6HMzrdn+PktqJlByzAZ+pahasDpswzJwa0=
X-Received: by 2002:a05:6808:220d:b0:2d4:99cb:3849 with SMTP id
 bd13-20020a056808220d00b002d499cb3849mr3860939oib.63.1646771471006; Tue, 08
 Mar 2022 12:31:11 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:31:10 -0800
MIME-Version: 1.0
In-Reply-To: <20220304032106.2866043-4-dmitry.baryshkov@linaro.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org> <20220304032106.2866043-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 8 Mar 2022 12:31:10 -0800
Message-ID: <CAE-0n509i4o2vWp_Ukms3Uswqpk73JiCN3_Q3DC8qSVbp4P8ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] drm/msm: split the main platform driver
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-03-03 19:21:04)
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 857eefbb8649..c89de88ed2d1 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -255,3 +258,170 @@ struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
[...]
> +
> +static int mdss_probe(struct platform_device *pdev)
> +{
> +       struct msm_mdss *mdss;
> +       struct msm_drm_private *priv;
> +       int mdp_ver = get_mdp_ver(pdev);
> +       struct device *mdp_dev;
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +
> +       priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, priv);

Is this set here so that msm_mdss_init() can use it? Can we pass 'priv'
as an argument to that function if so?

> +
> +       mdss = msm_mdss_init(pdev, mdp_ver == KMS_MDP5);
> +       if (IS_ERR(mdss)) {
> +               ret = PTR_ERR(mdss);
> +               platform_set_drvdata(pdev, NULL);

Is this platform_set_drvdata to NULL really necessary? It would be nice
to skip it so the mental load of this probe is lower.

> +
> +               return ret;
> +       }
> +
