Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC234CDFE4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Mar 2022 22:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbiCDVsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Mar 2022 16:48:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiCDVsS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Mar 2022 16:48:18 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA353B5
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Mar 2022 13:47:27 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id bc10so8588744qtb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Mar 2022 13:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=07QUV/roAPX5T4vcJdRHGYdQI94K3C6oZepbJubN048=;
        b=ZyQ0k5CWcpdtr4eC0/7b4Rznt5zb4XDOsarVR6S+cR1VoJ6KfH1s56A5+EZ5tRASZZ
         aq/wddTwsm4FUsvSZKAsJALQCvCagM8jQ1E1K52lCcoGFEbInN7CTr0orGcbGAW7uCOW
         uy+L6y+GIzRI+1IHMDUv4XuJF7DfO+LvVFAJl+qtGHVcO4Sh5iCgobpjofpA94KxeKA8
         KFlJECZwlUrNgIRtpzLt35h8VGRxm7TFI07cLe4VcIcq9w7FUCghDT4L49vZl2Qn414R
         kt2CXu3c7zwgOJETW3d/HYBv9JvzvJO9JWIO7qJPPxzTRtP1Xnyw063zMJwt0qPhKwOZ
         fzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=07QUV/roAPX5T4vcJdRHGYdQI94K3C6oZepbJubN048=;
        b=M2OCJwfLlmL3PtE7/Cne538gGLSTOGmBu85DlMG5Zfxhu2tX3GWUJd/QCf7uARJx5E
         TjzXfkZyMmgSDvgHvHF77+yxWBtS3O0QvQ3jmmf20DzDNixRLitsgfjNKEQtFkKp0jdT
         Jfjti4nH3KdCmcxznD/NR10Wh3rY9k8Chqg6Vsh8nlZUetSr8Er7PpgXo/dKGQEfWag3
         f0tW5BOWJ0Gi8TU0z/rc8ujoryFce9ePYXiIMSalZAd4d8S9nwRzbm5qWYOV0USQk8VN
         gxy4Rj7ELRUk5F/uUhSPKj7oj2AzFWrctgoCSM+cGgbyr++1qXylutEknwUUaylmdhTW
         NivA==
X-Gm-Message-State: AOAM530GnKDN3lxzYtEKuU5TPsIaod8Aiz5m9VL7wFiV5bAn51SsO16C
        8QgsshU8I20bA192yuqGo50nrKpiXg6Vl6B0DhP0AQ==
X-Google-Smtp-Source: ABdhPJz79U1gHypq9yZMvIBnhQSWouY8E2jvQI7JMuB03UuB1XxnCs8Hf/wSBrxsG1zxreEQkdCnmKSY5cuJydinrzQ=
X-Received: by 2002:ac8:5b84:0:b0:2e0:234:73c1 with SMTP id
 a4-20020ac85b84000000b002e0023473c1mr784457qta.62.1646430446705; Fri, 04 Mar
 2022 13:47:26 -0800 (PST)
MIME-Version: 1.0
References: <20220304202406.846485-1-robdclark@gmail.com>
In-Reply-To: <20220304202406.846485-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 5 Mar 2022 00:47:15 +0300
Message-ID: <CAA8EJprik57F+t0KicoYaRm=oDOgcQHyHSBjJKbekBKjO_-=0A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Fix missing ARRAY_SIZE() check
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 4 Mar 2022 at 23:23, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Fixes: f6d62d091cfd ("drm/msm/a6xx: add support for Adreno 660 GPU")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
However see the comment below.

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 02b47977b5c3..6406d8c3411a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -687,6 +687,7 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>
>         BUILD_BUG_ON(ARRAY_SIZE(a6xx_protect) > 32);
>         BUILD_BUG_ON(ARRAY_SIZE(a650_protect) > 48);
> +       BUILD_BUG_ON(ARRAY_SIZE(a660_protect) > 48);

The magic number 32 and 48 are repeated through this code. I'd suggest
to define them and use defined names.
It can come up as a separate commit.

>         if (adreno_is_a650(adreno_gpu)) {
>                 regs = a650_protect;
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
