Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9FD86DCE33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 01:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjDJXjA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Apr 2023 19:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjDJXi7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Apr 2023 19:38:59 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8597B2130
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 16:38:58 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i26so8632528lfc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Apr 2023 16:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681169937;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJ31ZihTsj7BqFMhLU8sqsCWE1qhH5SDejc9nQiQy+s=;
        b=hBkprc6F16wliwY1n352lea2LlV8B3ZWByS9Otf2VX5BRNrEgEmqyraV+yg1P29RQc
         YulzgqCfEvZBUMvbwbwJXhzAOyKEa/xr0+6qRrsz2/wPtAgF196JDvR4TNUnFaWbKxgD
         rzS0o9cXr4lmv1Ud/HgR+npppAdzedB+gEXEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681169937;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJ31ZihTsj7BqFMhLU8sqsCWE1qhH5SDejc9nQiQy+s=;
        b=RiDoGOQsOIzeIPpnzFMZGNq0CF8sQBXINZ0Cu5eP38Rq11GWANjZBXN7icBxuN38W1
         hK8hI5swRTUnZJyuGnmgVFu1V9nlOoSptSvYgPoF78AiyR3pma9BdR4P1sQgTCiKVeAd
         0ZXfQzDpKxXDAIUs6Ue/9KA7osh4BBfpmhqNT/zQv5cvqyeOFNnEZW3umlI9i8+IeXcq
         40T7E9lGtk2YJsfC2HOptlg5rnzSmyjDynEQTvb535Mzr3/8vMVCwmUd392MJPyKAvVx
         SFbb/jLAmfbxFEBMIJCuVaH55YFIxOM+4FIKG/GYa31/16UNslYs9Yu0zUSPtu92PGHF
         EMIg==
X-Gm-Message-State: AAQBX9eL3X5wblQ2j06iNrxcWaIxOV5D6TVxRwa2LW0hEFo4QyaTrHLn
        DJRmsP9q2E1euQpQF0na10rfrkYgpWXs40q4j/QhOA==
X-Google-Smtp-Source: AKy350YKBWAwplvBaUzF0rnPFrcqHdEcRGOoZtR0Ep8v4lU4JBnM3J5FVOHoKAMe6Fw+M1pWneNg6yBiNmIJpZKosgg=
X-Received: by 2002:ac2:4c14:0:b0:4eb:eaf:aa00 with SMTP id
 t20-20020ac24c14000000b004eb0eafaa00mr3474139lfq.4.1681169936786; Mon, 10 Apr
 2023 16:38:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Apr 2023 16:38:56 -0700
MIME-Version: 1.0
In-Reply-To: <20230410223836.442836-1-dmitry.baryshkov@linaro.org>
References: <20230410223836.442836-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 10 Apr 2023 16:38:56 -0700
Message-ID: <CAE-0n504Tt8MeWXF7xLeKoTMDciLEVsZagwC-t2nk+XGUc+v+g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: warn if chip revn is verified before
 being set
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-04-10 15:38:36)
> The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
> 510") tried to check GPU's revn before revn being set. Add WARN_ON_ONCE
> to prevent such bugs from happening again. A separate helper is
> necessary so that the warning is displayed really just once instead of
> being displayed for each of comparisons.
>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 63 ++++++++++++++++---------
>  1 file changed, 40 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index f62612a5c70f..47e21d44ac24 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -145,40 +145,51 @@ struct adreno_platform_config {
>
>  bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
>
> +static inline bool adreno_cmp_revn(struct adreno_gpu *gpu, uint32_t revn)

'cmp' in the name makes me think it's comparing. Maybe 'is' is better
because we're testing for equality.

	adreno_is_revn()

Also 'const struct adreno_gpu *' because it isn't changing?

> +{
> +       WARN_ON_ONCE(!gpu->revn);
> +
> +       return gpu->revn == revn;
> +}
> +
>  static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)

And then these can all be const in a followup patch probably.
