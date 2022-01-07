Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98B32486FB2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 02:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344351AbiAGB1n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 20:27:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344075AbiAGB1n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 20:27:43 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1814FC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 17:27:43 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id s21-20020a05683004d500b0058f585672efso5072404otd.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 17:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=js8atf22LZ2E5jC1JSawXeSntda/NKccufPc65krxtY=;
        b=mEC7vPS5TCGs6eV1fpNRUln7/hyrdk36yWS/g33sqDr4/XwyVkqxbXGSd9fKIdAfMd
         ASWLNeX7JfjF9ehKRCeDDu966GIdoq9EgIvQjqemqQ2YQEVMdPbGdo09Y3SOzAftRR+Z
         IWFM0iZ8hKS29BHp4Y4WgrgRFSs5MjXzl3wXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=js8atf22LZ2E5jC1JSawXeSntda/NKccufPc65krxtY=;
        b=bW7jr6b7LWdiieriQ9pNvFJ/h0JrbgJF6okwwdFC5zxKsSTREJDua8SzhOTJVBVQnk
         tXZhtjaywBCwP3CqnPQadxaOfQh67H/NyC33KBIygBMx3Lxw4fpZ84whJmj76kIBo/ux
         05QiS3E6j+vCOTvOpHkH94Uqx1ETf0y0jr3jII3YClfdcLcg904MXjJO9hY/C+3/XMsp
         WZIfdl3WSSwcnEIqZqLzcDQNfUk912BmENtadwuHtnbLaBGLmjh2S1+6Zk6XFvhG6e+Y
         gPYb5V5uHsesmkhP6mNcf1VphlwIO/d9LVy1oBwHRUrJ/JKDl5CjXgHY35D91fsSqsrn
         XMWg==
X-Gm-Message-State: AOAM531oyjtVmXb6G3JQLblF5uFbht0+2x4EzwxQaUKhNHlgo57QUEHI
        z7kv3kf9AaNLaCtVAE5Fu2SPkuP3eLmcj52BuxmHtQ==
X-Google-Smtp-Source: ABdhPJwKfFHMBlJIJaY2hsxyem1OasEe1YK5DAXLA5bYWAjzbIzZYfCNh/D+Sq9/WeskQdSq2rBFMT/L0TS4FZx/DOg=
X-Received: by 2002:a9d:2243:: with SMTP id o61mr43194959ota.126.1641518862462;
 Thu, 06 Jan 2022 17:27:42 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 17:27:42 -0800
MIME-Version: 1.0
In-Reply-To: <20220105231031.436020-6-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org> <20220105231031.436020-6-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 6 Jan 2022 17:27:42 -0800
Message-ID: <CAE-0n505KAiLvza2WTRfk8w9qcAH-Z2W6kLMtrOxTNRbUnSJig@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/msm/dpu: move VBIF blocks handling to dpu_rm
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-01-05 15:10:31)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index bf4d72356a12..2301ac114920 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -78,6 +78,10 @@ int dpu_rm_destroy(struct dpu_rm *rm)
>                 if (rm->hw_intf[i])
>                         dpu_hw_intf_destroy(rm->hw_intf[i]);
>         }
> +       for (i = 0; i < ARRAY_SIZE(rm->hw_vbif); i++) {
> +               if (rm->hw_vbif[i])
> +                       dpu_hw_vbif_destroy(rm->hw_vbif[i]);

Maybe drop this check and pass NULL to dpu_hw_vbif_destroy() sometimes?
Then the check can be omitted and the braces dropped

> +       }
>
>         return 0;
>  }
> @@ -212,6 +216,23 @@ int dpu_rm_init(struct dpu_rm *rm,
>                 rm->dspp_blks[dspp->id - DSPP_0] = &hw->base;
>         }
>
> +       for (i = 0; i < cat->vbif_count; i++) {
> +               struct dpu_hw_vbif *hw;
> +               const struct dpu_vbif_cfg *vbif = &cat->vbif[i];
> +
> +               if (vbif->id < VBIF_0 || vbif->id >= VBIF_MAX) {
> +                       DPU_ERROR("skip vbif %d with invalid id\n", vbif->id);
> +                       continue;
> +               }
> +               hw = dpu_hw_vbif_init(vbif->id, mmio, cat);
> +               if (IS_ERR_OR_NULL(hw)) {
> +                       rc = PTR_ERR(hw);
> +                       DPU_ERROR("failed vbif object creation: err %d\n", rc);
> +                       goto fail;

If it's NULL then rc will be 0 and fail will return 0. Is that
intentional?

> +               }
> +               rm->hw_vbif[vbif->id - VBIF_0] = hw;
> +       }
> +
>         return 0;
>
>  fail:
