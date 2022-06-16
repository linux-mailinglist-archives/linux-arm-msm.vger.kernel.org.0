Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27BA554D864
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 04:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231406AbiFPCew (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 22:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbiFPCev (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 22:34:51 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A10D31228
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 19:34:49 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id s124so405671oia.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 19:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ZXzBYl7c4qhw0nAJ+Zs1jCGG0+YRodCryRVN6/4gvzM=;
        b=ggJmfGCPsbsopNVADBV2HKnPKfr9VRAHXlBBfNm/8YCMgP+0xJLx+S6W+EAH9wimOg
         JFnqPOJl3Mq1Gw2hIVLkfT2XCSJhbwydzaQl+QIZp+hadAtTrTqNsEdqknQcmn/DwqIY
         3ackF/HDy9VPD3bRAWdTXALtsPHsdsC9xMxAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ZXzBYl7c4qhw0nAJ+Zs1jCGG0+YRodCryRVN6/4gvzM=;
        b=Pzu0iM8MzERkYv8hueQ5x4yGGXOCxWa1srdCw5ZIZapyI1seW82ouTManLDqqsbwOc
         IrmYJCpjMgJ8LLt+HTREvPKs+QXtNjeVSXgIX31b9YrPvDG8VLcuBRiLyKdYWH28LtN8
         fqBAfXbM64UAGZU0owykYyQKq5E5iQaAhu4Pr3kbvhUnAPptEe5t+ohnO/9P5haa4dtR
         RSEvNCwg5olaX1jOwFmpdZCjLR2dplCsjQX0oDnBs7d0Py7KXFgQU4fzAPE422UtDdtP
         9Sp4kogUJ6eUyZeYxxBoB2vG8i8WJPB7X+4APfkvE3t2fXqilCgKjyD68WO/MYPOngHE
         GFdg==
X-Gm-Message-State: AJIora+7MuNpaKr+1pij1Z9Hf8ern5xGRTlaOU1mASHz2CnzcVEAx/VF
        26VX5hB36fq8njOG/7bt1VXPXgv1gQC+/Akru6P6Bw==
X-Google-Smtp-Source: AGRyM1sa6lplkMCFOipTd6Swl2l6u6vpT25FP3UquGCoDEY0DTPWPu6rIDvFT/FDYo/EvUHSAfEBD56GyD6Ms+JkhYQ=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr1497286oib.63.1655346888488; Wed, 15
 Jun 2022 19:34:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jun 2022 19:34:47 -0700
MIME-Version: 1.0
In-Reply-To: <20220505001605.1268483-5-dmitry.baryshkov@linaro.org>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org> <20220505001605.1268483-5-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 15 Jun 2022 19:34:47 -0700
Message-ID: <CAE-0n53nQS=m1SsGaYavtyTgJbO_uFqp51srexY2H1rK-hz0=g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/msm: move KMS aspace init to the separate helper
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-05-04 17:16:04)
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index a37a3bbc04d9..98ae0036ab57 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -262,6 +263,46 @@ static int msm_drm_uninit(struct device *dev)
>
>  #include <linux/of_address.h>
>
> +struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
> +{
[...]
> +       }
> +
> +       aspace = msm_gem_address_space_create(mmu, "mdp_kms",
> +               0x1000, 0x100000000 - 0x1000);
> +       if (IS_ERR(aspace)) {
> +               mmu->funcs->destroy(mmu);


> +               return aspace;
> +       }
> +
> +       return aspace;

This can be 'return aspace' one time instead of two.

> +}
> +
>  bool msm_use_mmu(struct drm_device *dev)
>  {
>         struct msm_drm_private *priv = dev->dev_private;
