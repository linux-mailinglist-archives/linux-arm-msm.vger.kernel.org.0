Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 773C1570E50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jul 2022 01:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229754AbiGKX35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 19:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiGKX34 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 19:29:56 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB06304
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 16:29:55 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id p6so5191317ljc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 16:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2g/SRedCTGa3FW1fDb+EmyQOw6AOS/KFbwj3cy8GxXM=;
        b=fAXlbz7CXR4/Kg6TafHz6Jq1ObQFjoGNWKETyL5sK1ogIAZ7eh86yG8EZsMgg7dLi9
         i4WwRk7mJjU5ORPXarDHnJ6nA7DhMcGY5zkpAGZAjIj2sF0ZoSiyOfhWy3cqaB77JJH2
         dTkyj2oPvErEYbjlvTsVHSPFBKhF6aamfznp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2g/SRedCTGa3FW1fDb+EmyQOw6AOS/KFbwj3cy8GxXM=;
        b=hBE27+DKoW/wPNOL/Fj7MsTkdCaO3MpCOv63VO+W6QIHIufINpbmKEv5+LE3CRcCOh
         kB2iXfW4Ob175haJh7Lp7cPQDf9/mkB0NAYWYRs9OFBakPQAYneQeU7y7mTeyOGrnrnc
         VOhg9NiwrLF2UB4UQ56whTbLx8uCyYHoc/ybK/4+ZBrEN9J4A3XyFWBiwcvoUMg4UId5
         1zu+dyJa+uJGlOFv6DfkTo7udrNTJDsHVYUfy58iW8ZWkILhj/w4PMeP28TqQf04VeQ8
         zEMbf6N/feKrAIYs1GvtosOvLKPq1mMg4t2DP2M+v6k4ZqKdF5/PHYKqMYTx8KQ4O5um
         nmXQ==
X-Gm-Message-State: AJIora9cLlGsTJTeyhLJ6XCQfZtuAAvKziuQSNp1yVnX5GLhocCHUYad
        DtDnRk08yB1zBUdSJYbmA5D9evjTcGN1ihj71Uk=
X-Google-Smtp-Source: AGRyM1sp8BE4ElCBLFztMqmmnxeLPHKZ+ph1LxmXHGNhBrb7F095+RHAi6Gl9/mPkGPCj+Nsmlbb5w==
X-Received: by 2002:a2e:be0e:0:b0:25d:5d33:1783 with SMTP id z14-20020a2ebe0e000000b0025d5d331783mr9653124ljq.517.1657582193894;
        Mon, 11 Jul 2022 16:29:53 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id x3-20020ac24883000000b004793240041esm1798414lfc.277.2022.07.11.16.29.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 16:29:53 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id y11so4659024lfs.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 16:29:53 -0700 (PDT)
X-Received: by 2002:adf:d1e9:0:b0:21b:c8f8:3c16 with SMTP id
 g9-20020adfd1e9000000b0021bc8f83c16mr18888013wrd.659.1657581756957; Mon, 11
 Jul 2022 16:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com> <20220709112837.v2.3.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
In-Reply-To: <20220709112837.v2.3.I4ac27a0b34ea796ce0f938bb509e257516bc6f57@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 11 Jul 2022 16:22:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U=J+yf6Qu0VgJ8A5Lhs_s8Fszw=Oa0XUny5XT-5z56xQ@mail.gmail.com>
Message-ID: <CAD=FV=U=J+yf6Qu0VgJ8A5Lhs_s8Fszw=Oa0XUny5XT-5z56xQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] drm/msm: Fix cx collapse issue during recovery
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sean Paul <sean@poorly.run>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 8, 2022 at 11:00 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> There are some hardware logic under CX domain. For a successful
> recovery, we should ensure cx headswitch collapses to ensure all the
> stale states are cleard out. This is especially true to for a6xx family
> where we can GMU co-processor.
>
> Currently, cx doesn't collapse due to a devlink between gpu and its
> smmu. So the *struct gpu device* needs to be runtime suspended to ensure
> that the iommu driver removes its vote on cx gdsc.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++++++++++++--
>  drivers/gpu/drm/msm/msm_gpu.c         |  2 --
>  2 files changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 4d50110..7ed347c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1278,8 +1278,20 @@ static void a6xx_recover(struct msm_gpu *gpu)
>          */
>         gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
>
> -       gpu->funcs->pm_suspend(gpu);
> -       gpu->funcs->pm_resume(gpu);
> +       /*
> +        * Now drop all the pm_runtime usage count to allow cx gdsc to collapse.
> +        * First drop the usage count from all active submits
> +        */
> +       for (i = gpu->active_submits; i > 0; i--)
> +               pm_runtime_put(&gpu->pdev->dev);
> +
> +       /* And the final one from recover worker */
> +       pm_runtime_put_sync(&gpu->pdev->dev);
> +
> +       for (i = gpu->active_submits; i > 0; i--)
> +               pm_runtime_get(&gpu->pdev->dev);
> +
> +       pm_runtime_get_sync(&gpu->pdev->dev);

In response to v1, Rob suggested pm_runtime_force_suspend/resume().
Those seem like they would work to me, too. Why not use them?
