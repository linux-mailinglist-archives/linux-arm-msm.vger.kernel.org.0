Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6955F4F958B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 14:21:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235469AbiDHMXg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 08:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233011AbiDHMXf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 08:23:35 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C7A233D0F4
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 05:21:31 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id ke15so7304177qvb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 05:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YRo7o4btpESJNDRm1Sx3TiY7NQIcJDsdvvXgFQ9NGKc=;
        b=fC4YVY0voFTb7xf7jGHf5z4ClA2JWzzjJAJk/eJAafLPDNcd51omB5oEC5gIAPs+mb
         9vwV+W+ZpWER1jaHI/z80OUDSzO11ylNsDJh1oPo2W/tegkiykV45tyH+zyV8TRB4lrM
         SQcT6so8RswTm3LdtHFeJsdwz0qW0J+J8t21nI24qlqYvkUY+jnggPRjnnVTWz0Eh0an
         rNCxcXVQG4PloCSVuG3qvJp8sc7syNWTI0oQ719vT9lY704ztiYvv0xb4WmfkyFyLKWd
         jess8X1HhbxeJdjhmgoM8zkWQQ9+//RUAemVGiLaC5mggO/ishyKoOgv6ycLk5TSKHFt
         kUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YRo7o4btpESJNDRm1Sx3TiY7NQIcJDsdvvXgFQ9NGKc=;
        b=TgxG9iOfZpSib0Eau0oyyqKAj91o3kDgHWAzSgQ6iuffJlMhsHkauhesZnUzxj9mb9
         oUzYKIPfWwfrgd92xj+CdUQvyaFUjHPSDYc111Kxoex2wx8+xoCWPlvlwhMnL5am5kP3
         yI0pxugx1IwfT83FFIjXPYxB5cAr4MsnflVrGamZjurB8cU6cO8jDRT3HiGRkTJmUZlD
         rgwlIvtMvJ4FX7MZV8rUqrsgAVkXkpISkTuNnVPiwa64JSFSp2YvhgU892FkkJxQSuNv
         Wmj/2zxbDGWNXlno+s454QlxTiOcblO+vKrrZfewvDTIKnENZHOGnn12lm9c3ZZhOjMe
         HgNA==
X-Gm-Message-State: AOAM532HSLTLZqTN2uUL3HDRigQbe8HBMzUxt7WGe+FzMtjz0+7Ak93i
        dE/lKrnGjACop+zAk8tFCxGy5Uy6JdGh+YEuvrRjuw==
X-Google-Smtp-Source: ABdhPJzyPvV2EX3O5x5qzKd7QrCWD7nwrriMxeUbFZZ/oV9CoHBlI4Bman5yBlnB8oOnR72ONhBZO5Vt7RuHEAXJx9g=
X-Received: by 2002:a05:6214:921:b0:443:ce3d:577b with SMTP id
 dk1-20020a056214092100b00443ce3d577bmr15918452qvb.122.1649420490768; Fri, 08
 Apr 2022 05:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220407202836.1211268-1-robdclark@gmail.com>
In-Reply-To: <20220407202836.1211268-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 8 Apr 2022 15:21:20 +0300
Message-ID: <CAA8EJpqfoPwmsJcwMvFgz1KL7sE5XahFGV4WoJ=Eg9Sr8R39RQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix range size vs end confusion
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Apr 2022 at 23:27, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> The fourth param is size, rather than range_end.
>
> Note that we could increase the address space size if we had a way to
> prevent buffers from spanning a 4G split, mostly just to avoid fw bugs
> with 64b math.
>
> Fixes: 84c31ee16f90 ("drm/msm/a6xx: Add support for per-instance pagetables")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 17de46fc4bf2..80d57608b34a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1742,7 +1742,7 @@ a6xx_create_private_address_space(struct msm_gpu *gpu)
>                 return ERR_CAST(mmu);
>
>         return msm_gem_address_space_create(mmu,
> -               "gpu", 0x100000000ULL, 0x1ffffffffULL);
> +               "gpu", 0x100000000ULL, SZ_4G);
>  }
>
>  static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
