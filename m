Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE2E4594A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 19:21:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239472AbhKVSY3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 13:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236375AbhKVSY1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 13:24:27 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C237C061574;
        Mon, 22 Nov 2021 10:21:20 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id u18so34394860wrg.5;
        Mon, 22 Nov 2021 10:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M3R7Ah7v4Rr9hJ2F7y7P1NHczQAvAeLrZtb3xrSTvSw=;
        b=Dd2lmodlCnZAmHh/Jk5buwYJwNC7YcmFq2W7QnY/HgdowtpIC5MG0rszi9FMzSCA+j
         zXRdraqkPy3aBxHIUTQBkFhixdsB5bWojMAUt/FGJhKLDce7A2eFi2pyDYzIDRv1mt7F
         xvAdjfhBQjGA+OikK7KGNH90BrQ0k6vcbZSEo8mJkhJjCCFggBkcKiQLeHveQ28nX8ts
         g7BhQP2uPMpp4xGjk4bU+Edyk1DIuLA06buaDbybwfV0dXm8Z0o09L+RHfE5VTpd5jyY
         7Ej24dF6/0CbzoLFjO29zSyb5rwD5IhoQCPn5UbCrkEQ2XSpUOm+PEwWv7vHK9yk6Wt+
         pfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M3R7Ah7v4Rr9hJ2F7y7P1NHczQAvAeLrZtb3xrSTvSw=;
        b=dq/eBqzzdLQDNx0ac7jp+mLyq59DFSkXHVM4fFuTTG8X+nYmuzx3PQjLM+SjYr4zry
         sV0pUYIlX98kglsot98S7kRbKCw+WPMsGpJqURLGT8pmc/syEDi615s8SkYW2qvIS5ma
         fmz1M/G0OEcdiwnn0384dVjUmIzBWssvoMBYySUQxrbx248/zFRsSbAxaQa1idYaJx2F
         iFntcqrwWDZuizSC+X489WCXR1HlBy+AvbaM2N46Xzx98t4M+pL9Sxx8+pEmUmh0p74d
         MbJ8yzQ4SDR4bqf0ItFAIqe/dLQJ90twXxBsnvEsvC7rjH+YEDY0s7IPevpN/6uS+OQs
         4c3Q==
X-Gm-Message-State: AOAM531ideNqT75t0esVYO1sRfydKKmu906LG5EKc6Me6Nz9w9b6M1V+
        gs1XXaYZYt5I7G4rIU+PhXa1IqSmKiTP411oQVs=
X-Google-Smtp-Source: ABdhPJwKiBP37FLlFnszVHPNp1PhZEMQd9KjLp8zLoa1TfQ9To1a4f9pwJufWpOfZMS8zRdD55Mo5cLSaD01d69Pr7k=
X-Received: by 2002:a05:6000:1acd:: with SMTP id i13mr41483102wry.398.1637605279111;
 Mon, 22 Nov 2021 10:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20211118154903.1.I2ed37cd8ad45a5a94d9de53330f973a62bd1fb29@changeid>
 <20211118154903.4.Ibb71b3c64d6f98d586131a143c27fbdb233260a1@changeid>
In-Reply-To: <20211118154903.4.Ibb71b3c64d6f98d586131a143c27fbdb233260a1@changeid>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 22 Nov 2021 10:26:22 -0800
Message-ID: <CAF6AEGvxgVHXuz=W0_r=4EakV8XKVjdMeofZbuBYuz0Vep2BfA@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/msm/a6xx: Capture gmu log in devcoredump
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee.jones@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 18, 2021 at 2:21 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> Capture gmu log in coredump to enhance debugging.
>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 41 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  2 ++
>  3 files changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 7501849..9fa3fa6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -42,6 +42,8 @@ struct a6xx_gpu_state {
>         struct a6xx_gpu_state_obj *cx_debugbus;
>         int nr_cx_debugbus;
>
> +       struct msm_gpu_state_bo *gmu_log;
> +
>         struct list_head objs;
>  };
>
> @@ -800,6 +802,30 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
>                 &a6xx_state->gmu_registers[2], false);
>  }
>
> +static void a6xx_get_gmu_log(struct msm_gpu *gpu,
> +               struct a6xx_gpu_state *a6xx_state)
> +{
> +       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +       struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +       struct msm_gpu_state_bo *gmu_log;
> +
> +       gmu_log = state_kcalloc(a6xx_state,
> +               1, sizeof(*a6xx_state->gmu_log));
> +       if (!gmu_log)
> +               return;
> +
> +       gmu_log->iova = gmu->log.iova;
> +       gmu_log->size = gmu->log.size;
> +       gmu_log->data = kvzalloc(gmu_log->size, GFP_KERNEL);
> +       if (!gmu_log->data)
> +               return;
> +
> +       memcpy(gmu_log->data, gmu->log.virt, gmu->log.size);
> +
> +       a6xx_state->gmu_log = gmu_log;
> +}
> +
>  #define A6XX_GBIF_REGLIST_SIZE   1
>  static void a6xx_get_registers(struct msm_gpu *gpu,
>                 struct a6xx_gpu_state *a6xx_state,
> @@ -937,6 +963,8 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
>
>         a6xx_get_gmu_registers(gpu, a6xx_state);
>
> +       a6xx_get_gmu_log(gpu, a6xx_state);
> +
>         /* If GX isn't on the rest of the data isn't going to be accessible */
>         if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
>                 return &a6xx_state->base;
> @@ -978,6 +1006,9 @@ static void a6xx_gpu_state_destroy(struct kref *kref)
>         struct a6xx_gpu_state *a6xx_state = container_of(state,
>                         struct a6xx_gpu_state, base);
>
> +       if (a6xx_state->gmu_log && a6xx_state->gmu_log->data)
> +               kvfree(a6xx_state->gmu_log->data);
> +
>         list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node)
>                 kfree(obj);
>
> @@ -1191,6 +1222,16 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>
>         adreno_show(gpu, state, p);
>
> +       drm_puts(p, "gmu-log:\n");
> +       if (a6xx_state->gmu_log) {
> +               struct msm_gpu_state_bo *gmu_log = a6xx_state->gmu_log;
> +
> +               drm_printf(p, "    iova: 0x%016llx\n", gmu_log->iova);
> +               drm_printf(p, "    size: %d\n", gmu_log->size);

fwiw, that wants to be:

 +               drm_printf(p, "    size: %zu\n", gmu_log->size);

with that fixed, r-b

BR,
-R

> +               adreno_show_object(p, &gmu_log->data, gmu_log->size,
> +                               &gmu_log->encoded);
> +       }
> +
>         drm_puts(p, "registers:\n");
>         for (i = 0; i < a6xx_state->nr_registers; i++) {
>                 struct a6xx_gpu_state_obj *obj = &a6xx_state->registers[i];
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 7486652..7d1ff20 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -630,7 +630,7 @@ static char *adreno_gpu_ascii85_encode(u32 *src, size_t len)
>  }
>
>  /* len is expected to be in bytes */
> -static void adreno_show_object(struct drm_printer *p, void **ptr, int len,
> +void adreno_show_object(struct drm_printer *p, void **ptr, int len,
>                 bool *encoded)
>  {
>         if (!*ptr || !len)
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 225c277..6762308 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -306,6 +306,8 @@ void adreno_gpu_state_destroy(struct msm_gpu_state *state);
>
>  int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state);
>  int adreno_gpu_state_put(struct msm_gpu_state *state);
> +void adreno_show_object(struct drm_printer *p, void **ptr, int len,
> +               bool *encoded);
>
>  /*
>   * Common helper function to initialize the default address space for arm-smmu
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation.
>
