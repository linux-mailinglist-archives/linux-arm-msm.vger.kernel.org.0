Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8531E79460F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 00:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245000AbjIFWRG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 18:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjIFWRG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 18:17:06 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7016419AF
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 15:17:02 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-500a398cda5so479779e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 15:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694038621; x=1694643421; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvVwhpnlwNzr+usIzIqnD3cRa6Q/AiTqXgbhLyI/lno=;
        b=T9vUmrdFSw9ydBi1cySN+xslMkxeocaFmsydQ+XvlnWO64ipo9q7Flyq46GqenRt3z
         U8codEwYjlz/cSqDaK/L1QtrNYg1uEcN5JmxzIxtyHVlMXkBD2VVUMOh6lzMoAHKC+b9
         3tuGTGzpGDwhUmZaBC7IutpwgU1YcUY9M4bK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694038621; x=1694643421;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvVwhpnlwNzr+usIzIqnD3cRa6Q/AiTqXgbhLyI/lno=;
        b=NEnW8bPakwJ09t7CESOMgE4VqeBsp00eExuXu7wEHFqkZVwtsBaQBxWSsHXXo7nsBn
         MmzAR1yWSA8vnAacsyb3h90BKPekj2IYHmH3H0kW4fjMY7ErF8z4p3P5Wvm4neIkTaQi
         77qWTKNzv3FM6EELQ2TJ7soMLDUNmeATlsw7B57AsXMtiREoDy5NAugZi9KA+jHRc4Ue
         2dll36rJkcZ72+CiHHEnEraZxuemHhxygLxa7mhO+4OWBhF7i1j3m3v90cbAp2kHki/F
         YuQKeB7v246NpqzSv4Dx1mf4SsAZLF8e9tdIJzYcY7dmR44eWUZs1EQqUalusSGD4r2N
         kSAQ==
X-Gm-Message-State: AOJu0YwEZaXPT8TsYCABVgxsnqA92FNtp3azBG79/lYGCqu9nh+AGA2o
        zG2c8sbsVVeOjLciUjMXQt2Un5dLcqeaxCQ5GryHxw==
X-Google-Smtp-Source: AGHT+IF0QN7CGrq5HjfoeEiLhMpFc/07tVOfGRJGFDdL6rXW2yk02UxhV34jvxb2uoMeKNEwmc97DMzMIp4V3NTlM9w=
X-Received: by 2002:a05:6512:3489:b0:500:c4f1:6bb6 with SMTP id
 v9-20020a056512348900b00500c4f16bb6mr3151846lfr.61.1694038620631; Wed, 06 Sep
 2023 15:17:00 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:17:00 -0500
MIME-Version: 1.0
In-Reply-To: <20230905174353.3118648-4-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org> <20230905174353.3118648-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Sep 2023 17:17:00 -0500
Message-ID: <CAE-0n509t5hFfKMEHL=3muvn-qo7qZhauzgohgOxDto1oPj2qA@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/msm/dpu: support binding to the mdp5 devices
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-09-05 10:43:50)
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index 59d2788c4510..9d0d76f3a319 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -50,6 +50,24 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
>         return clk;
>  }
>
> +void __iomem *msm_ioremap_mdss(struct platform_device *mdss_pdev,
> +                              struct platform_device *pdev,
> +                              const char *name)
> +{
> +       struct resource *res;
> +       void __iomem *ptr;
> +
> +       res = platform_get_resource_byname(mdss_pdev, IORESOURCE_MEM, name);
> +       if (!res)
> +               return ERR_PTR(-EINVAL);
> +
> +       ptr = devm_ioremap_resource(&pdev->dev, res);
> +       if (!ptr)

devm_ioremap_resource() returns an error pointer. Too bad we can't use
devm_platform_ioremap_resource_byname() here.

> +               return ERR_PTR(-ENOMEM);
> +
> +       return ptr;
> +}
