Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57A917477A8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 19:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbjGDRUK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 13:20:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231937AbjGDRUJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 13:20:09 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34C7210CA
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 10:20:06 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-c50c797c31bso3075386276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 10:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688491205; x=1691083205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yoK4H6nDlRDDhLrKCYHElhgk6WD3qdHNe/PnJeljUiQ=;
        b=OLeYoW5tLQwUeeBmQg/YUvzkIdEFQjDWA2se+/29g2kPN9DcLL8DWA+czO0slfDbUe
         egRIssEmEQQwMOjRBAzlRsl2mjnE4e0SsWdpzTBVvqxaTdDkaxpOTMsg92QCs0k+aM0N
         FU5DuGePCzhNmqpN68imusx27FRmvyWO16rVs3/ge4k0EFvUToqzDUwGvlbPrpTSCGf6
         9bQNl/ebxpa1mKa/MM4yovs8/6ab+gUtYwGpJLm61KATkefWCqoWjCMJCpV74fokVu4X
         oeCZ8N4pauaPMAFaRk/4J9gniu7gZWcTkXPlPZjBIH57IQCVKkRkPxntmYpjlrfEBjWm
         TrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688491205; x=1691083205;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoK4H6nDlRDDhLrKCYHElhgk6WD3qdHNe/PnJeljUiQ=;
        b=DiSKzCSJnbf+h6riCYZO8es5Xgy316U13Vf/rNLZbpG/RyV9ZXkdNESUmlFidDOdfI
         xHhVsi5Q6Lc2KOyAo7JrqZWB+VJxFysll4ROy1UDyj/355fMnx3aglhAlEgvbpfB/ojg
         socjh+EEjMRa4pR19hMTDh0i3s5XpnI97PBezrBKNgNzkrIk0wq7AIIF1D8klS9Is/UN
         ra0Kfa1T8fCq70rD09BFkxaO7qMcz3EyIqjhg4ac4HUklutKPAttqJth7RL7YDKGeXjp
         3bxaVmtIQr4iLlXDy/coF5jXpiOOy0nBeZly7aaX64MuStZa1JhcYD+JrandnzEphKR0
         rTCA==
X-Gm-Message-State: ABy/qLa4i2aW/aWBXSRoKj072gZhmcYN6zpaB5GBwbIdxCcNA3AEgNTO
        xaeBIh5NJuOBNrWJxe5pas7FZO96hGaqflgfk7uyXw==
X-Google-Smtp-Source: APBJJlEnJiKi2TvvTpP52xudCEw1PqsQzWEq3Xxap/aH09T5RErSQ3nB87eNWj863g3c2q2AuSGN2rLdKwdytZMdyu4=
X-Received: by 2002:a25:a441:0:b0:c1d:6508:3083 with SMTP id
 f59-20020a25a441000000b00c1d65083083mr14025995ybi.55.1688491205391; Tue, 04
 Jul 2023 10:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230704163640.6162-1-robdclark@gmail.com>
In-Reply-To: <20230704163640.6162-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 4 Jul 2023 20:19:54 +0300
Message-ID: <CAA8EJpoAZ7z2aURWHs1ouEuTzj2c0O-CypCHmocXO62EpuffsQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/adreno: Fix warn splat for devices without revn
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 4 Jul 2023 at 19:36, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Recently, a WARN_ON() was introduced to ensure that revn is filled before
> adreno_is_aXYZ is called. This however doesn't work very well when revn is
> 0 by design (such as for A635).
>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified before being set")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 65379e4824d9..ef1bcb6b624e 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -149,7 +149,8 @@ bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
>
>  static inline bool adreno_is_revn(const struct adreno_gpu *gpu, uint32_t revn)
>  {
> -       WARN_ON_ONCE(!gpu->revn);
> +       /* revn can be zero, but if not is set at same time as info */
> +       WARN_ON_ONCE(!gpu->info);
>
>         return gpu->revn == revn;
>  }
> @@ -161,14 +162,16 @@ static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
>
>  static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
>  {
> -       WARN_ON_ONCE(!gpu->revn);
> +       /* revn can be zero, but if not is set at same time as info */
> +       WARN_ON_ONCE(!gpu->info);
>
>         return (gpu->revn < 300);

This is then incorrect for a635 / a690 if they have revn at 0.

>  }
>
>  static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
>  {
> -       WARN_ON_ONCE(!gpu->revn);
> +       /* revn can be zero, but if not is set at same time as info */
> +       WARN_ON_ONCE(!gpu->info);
>
>         return (gpu->revn < 210);

And this too.

>  }
> --
> 2.41.0
>


-- 
With best wishes
Dmitry
