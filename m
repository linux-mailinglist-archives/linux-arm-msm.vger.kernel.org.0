Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF872789259
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 01:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230263AbjHYXbZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 19:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbjHYXay (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 19:30:54 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D312109
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 16:30:52 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d74a012e613so2047551276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 16:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693006252; x=1693611052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ey6d5gZX4O+5Ormvdw+/edKbvFqUfGvPPdAwBns5XZ0=;
        b=YHweFZN6GWWe9k+V0XvG5rYvHDivYVgMTQvoLW7JqGs9V57KqEMh6nTzyqMyJL6+/c
         s140AfjtRqHCG1/0hCF6C9gMhAY+tEA2aYYkowHtj1IKRtu5k7c40MK1YyUtqmVqZAYF
         VDBXC2/ohxwnd83Z1nFnA2SIed4XNoM918BSHyBRJNkUQQXXB/AeV7anRnURqmWmj5oB
         DkFvwRIu8uavah6wkkOOelblaW4sDJRrCAVmX+IApCje0g0Myy2CIMg4fMoaVli9w6eh
         a4EZZyD/MlvDAiYn2i+hOeIIAgxn+ctWAVAlg9j4LiE7bmAxEmPctT1CsDKNdLFJKodV
         bgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693006252; x=1693611052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ey6d5gZX4O+5Ormvdw+/edKbvFqUfGvPPdAwBns5XZ0=;
        b=OyxIr2tshmedq6S36yeXiPtAn7bUw8mmf49Da+ZKcJzODKY7gUU/yM9fqzT2CusVHF
         uFCcep2GHc4GAx0p5vHZk+8CyJSHlMxHyDS9Vmp1oAg4BFt0ZjvGLeuseDB0rb29P3jN
         hrucbR4ZAgBS/BdHZtSzpH15nQfdjmhLm+1oDh26UwiI4nIBY3YN2S4QS0A+1K0mjtYK
         W5RuDtjZSi5unTK5DwHUdbSEdJvAWc8CVRD7fd7ubRfO2YqM2xiJqLOLD7/A6ZLLJ8CP
         SBnmdbwOV1Zn5DUNAQd9/lqqAH5x8RqEuICZtoO3UZA4oJqUaj/GJqzdDyd7jTDt7NGi
         k4jA==
X-Gm-Message-State: AOJu0Ywq/yLYhVsdcwc5eNa/3lkmZE19CoZDLUugdJUfKOT9L4x/4eh9
        K4QRJczJbZ+lvNjnTxv7RIV9i3Qwb4XA1KJeJ2GEvA==
X-Google-Smtp-Source: AGHT+IH96iZdBFBpub3t9rZ+AHNDzp0KpWqQfScrAOFxIgwNDRNv8otji8p9J6NWQaVh/hdaQCLvseVk6BJ7yxkTnWk=
X-Received: by 2002:a05:6902:185:b0:d4b:a962:76a3 with SMTP id
 t5-20020a056902018500b00d4ba96276a3mr14239474ybh.29.1693006251979; Fri, 25
 Aug 2023 16:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230825230109.2264345-1-swboyd@chromium.org>
In-Reply-To: <20230825230109.2264345-1-swboyd@chromium.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 26 Aug 2023 02:30:40 +0300
Message-ID: <CAA8EJprmvczug0zxuhrHuK2kBYtnkLfkZmYwS78hdVRe8waDXA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Add newlines to debug printks
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 26 Aug 2023 at 02:01, Stephen Boyd <swboyd@chromium.org> wrote:
>
> These debug printks are missing newlines, causing drm debug logs to be
> hard to read. Add newlines so that the messages are on their own line.
>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Fixes: 601f0479c583 ("drm/msm/dp: add logs across DP driver for ease
of debugging")
Fixes: cd779808cccd ("drm/msm/dp: Add basic PSR support for eDP")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 42427129acea..6375daaeb98e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1090,7 +1090,7 @@ int dp_link_process_request(struct dp_link *dp_link)
>         } else if (dp_link_read_psr_error_status(link)) {
>                 DRM_ERROR("PSR IRQ_HPD received\n");
>         } else if (dp_link_psr_capability_changed(link)) {
> -               drm_dbg_dp(link->drm_dev, "PSR Capability changed");
> +               drm_dbg_dp(link->drm_dev, "PSR Capability changed\n");
>         } else {
>                 ret = dp_link_process_link_status_update(link);
>                 if (!ret) {
> @@ -1107,7 +1107,7 @@ int dp_link_process_request(struct dp_link *dp_link)
>                 }
>         }
>
> -       drm_dbg_dp(link->drm_dev, "sink request=%#x",
> +       drm_dbg_dp(link->drm_dev, "sink request=%#x\n",
>                                 dp_link->sink_request);
>         return ret;
>  }
>
> base-commit: 706a741595047797872e669b3101429ab8d378ef
> --
> https://chromeos.dev
>


-- 
With best wishes
Dmitry
