Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64474958EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jan 2022 05:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbiAUEaY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jan 2022 23:30:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233630AbiAUEaY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jan 2022 23:30:24 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD485C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jan 2022 20:30:23 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id g205so12020860oif.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jan 2022 20:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=LYTEoc7rHyCXH1oH9BtjH0WArodUqZMGF/Aa2JALJcg=;
        b=jAuD4Q4d0AYZ/PEDXtbz04htFL1EN6grlsqGnAIkDVE2E4pO7M/1oqZYiMPi2SvG5v
         iJPsX46rPq+RVPYyPhX9ofHmWWtOugLIVyRKnZeGldfGzx3X5m4HMzbXt/xHEpYRzKei
         USuN1Cw0SThUY1CAkZK+oIWKE/6I7c9tJPnkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=LYTEoc7rHyCXH1oH9BtjH0WArodUqZMGF/Aa2JALJcg=;
        b=Lo24MNXzQSTBIf/DaQeTgUNn+lz4rX0VdbvF5S0wq7iT0WV2/RMjZeaeNdgakaRv7E
         FEg+BOeRAI7fqFRA7umBFW99rE1SomIGfgtBLmGequDBpLZHVOmuNC6EQAn8/R9gykax
         V7rvH5HK9XfoQTPAQ7NmvCr5dbEOfl7nIDP4S3vv9ElW4Yb79ilw3x9w/VLojNnaisPU
         lV3tqKtei6Lz1I9SBxZMYItYO/I/3u4QRITxBNfF97nKXmhrIU23bDFmDCTODlxCwtzq
         JWtJzenHMX7dInB2P40qs2pBAM0dD8LkPLKAcPNG+W8ptQ9Jddoycxi/z58szYWr84Ab
         cXQA==
X-Gm-Message-State: AOAM533FaI7/ZsPJy3Svolgd3hXOiXoBBO8uqj8eujSTN/efes0QwJSU
        YFkdUqLegTtwn30ohQhtl/pa57+wR7ZUh/OXNVziBg==
X-Google-Smtp-Source: ABdhPJy29RK3pnK83q6mbJuyMkA8rNx2S0loo1Mj2IuzvYlvMss7+Mu29C5GZPkKe7ElF4wm5ZCKgzQaRd232lKC8xU=
X-Received: by 2002:a05:6808:cc:: with SMTP id t12mr10524563oic.32.1642739423002;
 Thu, 20 Jan 2022 20:30:23 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 20 Jan 2022 20:30:22 -0800
MIME-Version: 1.0
In-Reply-To: <20220119221616.3089119-3-dmitry.baryshkov@linaro.org>
References: <20220119221616.3089119-1-dmitry.baryshkov@linaro.org> <20220119221616.3089119-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 20 Jan 2022 20:30:22 -0800
Message-ID: <CAE-0n53=vj53a_u-5rUmrhV79_-c=F5gtjbejoVs+=PR=hc1Nw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/msm/dpu: simplify clocks handling
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
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

Quoting Dmitry Baryshkov (2022-01-19 14:16:15)
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index 7b504617833a..5533c87c7158 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -5,6 +5,8 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>
> +#include <linux/clk/clk-conf.h>
> +
>  #include "msm_drv.h"
>
>  /*
> @@ -47,6 +49,54 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
>         return clk;
>  }
>
> +int msm_parse_clock(struct platform_device *pdev, struct clk_bulk_data **clocks)
> +{
> +       u32 i, rc = 0;
> +       const char *clock_name;
> +       struct clk_bulk_data *bulk;
> +       int num_clk = 0;

No need to assign and then reassign before testing. Same goes for 'rc'.

> +
> +       if (!pdev)
> +               return -EINVAL;
> +
> +       num_clk = of_property_count_strings(pdev->dev.of_node, "clock-names");
> +       if (num_clk <= 0) {
> +               pr_debug("clocks are not defined\n");
> +               return 0;
> +       }
> +
> +       bulk = devm_kcalloc(&pdev->dev, num_clk, sizeof(struct clk_bulk_data), GFP_KERNEL);
> +       if (!bulk)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < num_clk; i++) {
> +               rc = of_property_read_string_index(pdev->dev.of_node,
> +                                                  "clock-names", i,
> +                                                  &clock_name);
> +               if (rc) {
> +                       DRM_DEV_ERROR(&pdev->dev, "Failed to get clock name for %d\n", i);
> +                       return rc;
> +               }
> +               bulk[i].id = devm_kstrdup(&pdev->dev, clock_name, GFP_KERNEL);
> +       }
> +
> +       rc = devm_clk_bulk_get(&pdev->dev, num_clk, bulk);

Use devm_clk_bulk_get_all()?

> +       if (rc) {
> +               DRM_DEV_ERROR(&pdev->dev, "Failed to get clock refs %d\n", rc);
> +               return rc;
> +       }
> +
> +       rc = of_clk_set_defaults(pdev->dev.of_node, false);

Why is this needed?

> +       if (rc) {
> +               DRM_DEV_ERROR(&pdev->dev, "Failed to set clock defaults %d\n", rc);
> +               return rc;
> +       }
> +
> +       *clocks = bulk;
> +
> +       return num_clk;
