Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B08E65ACC7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 02:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjABBkA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Jan 2023 20:40:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjABBj7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Jan 2023 20:39:59 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCBC92196
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Jan 2023 17:39:57 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id r2-20020a9d7cc2000000b006718a7f7fbaso16705257otn.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Jan 2023 17:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xoVvMXphc/SXKzYDr9NRNdOZvsFIrre0zLtyjQhD54s=;
        b=e85zvQZpz2zbZhUIJgpMcPOEkMSOxf6/0RQGoqP8pIW3Kvrs2Xx/zha4mUTmXc6HQk
         Gg77O+2RMyOH3CudW2zTCBhRqskxqiszxjPcBF/Dv7TFxitLUDx8M+4BJ0IyadBcmK4C
         L+5DBK65ZOqmV2AjEZoL47S9FglVAmR73sBNQhTvEe6EE8eupo4/hp2cUxWhjFA4UU91
         MyC+AGw27NlhZvt+WCVQ1gN+HRjH7jJU3QovPyY0DVllnTSpczbM719FrqfrU4asX7ih
         VS9P+DueCVUxFhcPhQfUn2VzjCkEd9TFeoke67/dV0O1KctKhlQfv2KW8yw6qKbrvmF4
         EMkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xoVvMXphc/SXKzYDr9NRNdOZvsFIrre0zLtyjQhD54s=;
        b=3uhgtecFoeNQD02ygs5CZgOIY0DPOPBx0nEMU8ZL796rO35nlZT/ennUo8Ga1VnJW3
         rGKCPlhtwW70B3ETjEP4oGg0pnmeMHUC9rdHKsK/7PtGXha2riZAfmqM3lvxWAR10hTu
         j9klvRffz9ov2N43qo9Bx7C1p4jh7l7u+hyG10vOgSDTLKArFOhFxmOPIng+DTQ2xMLz
         1DUCLkq1JtsIdPbj/8i8KBe8DSslfRSoE3iud+uwyk/0FxxC5aBwcxLrUuuJtaD/We+G
         ZLw+9rGnt+a0w4GbgZ7xl041Y4Bx6qBomxJw6caam3GHFSctyENuxHyj0Q9iSUQmoNHB
         9r7g==
X-Gm-Message-State: AFqh2koQIuSQqQsJ8XfF4dQbQDRqIg8qydx0YUMGQL+fz/z+cK76hayP
        JUMaGg3999N6SD36VKxcQ1piqXdnoyMVeJ40Ra2R5yyq
X-Google-Smtp-Source: AMrXdXv9jAX0MMNb9GVNkuUXevGJiRXiTGf0djUWUTVFFgtAWmoGGcc4UoSAPUQgnijspPmaE986LkaKRtLke9VJLPg=
X-Received: by 2002:a9d:17e9:0:b0:670:82d5:fde3 with SMTP id
 j96-20020a9d17e9000000b0067082d5fde3mr2406053otj.22.1672623597006; Sun, 01
 Jan 2023 17:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20230101155753.779176-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230101155753.779176-1-dmitry.baryshkov@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 1 Jan 2023 17:39:44 -0800
Message-ID: <CAF6AEGvG9UJzvjvvfBeO6tC+APqOStAHBgeRwsuHUFSozyE8oA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a2xx: support loading legacy (iMX) firmware
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 1, 2023 at 7:57 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Support loading A200 firmware generated from the iMX firmware header
> files. The firmware lacks protection support, however it allows GPU to
> function properly while using the firmware files with clear license
> which allows redistribution.
>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c | 27 +++++++++++++++++++++++----
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.h |  1 +
>  2 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> index 6c9a747eb4ad..c67089a7ebc1 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
> @@ -53,6 +53,8 @@ static void a2xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>
>  static bool a2xx_me_init(struct msm_gpu *gpu)
>  {
> +       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +       struct a2xx_gpu *a2xx_gpu = to_a2xx_gpu(adreno_gpu);
>         struct msm_ringbuffer *ring = gpu->rb[0];
>
>         OUT_PKT3(ring, CP_ME_INIT, 18);
> @@ -84,15 +86,20 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
>         /* NQ and External Memory Swap */
>         OUT_RING(ring, 0x00000000);
>         /* protected mode error checking (0x1f2 is REG_AXXX_CP_INT_CNTL) */
> -       OUT_RING(ring, 0x200001f2);
> +       if (a2xx_gpu->protection_disabled)
> +               OUT_RING(ring, 0x00000000);
> +       else
> +               OUT_RING(ring, 0x200001f2);
>         /* Disable header dumping and Header dump address */
>         OUT_RING(ring, 0x00000000);
>         /* Header dump size */
>         OUT_RING(ring, 0x00000000);
>
> -       /* enable protected mode */
> -       OUT_PKT3(ring, CP_SET_PROTECTED_MODE, 1);
> -       OUT_RING(ring, 1);
> +       if (!a2xx_gpu->protection_disabled) {
> +               /* enable protected mode */
> +               OUT_PKT3(ring, CP_SET_PROTECTED_MODE, 1);
> +               OUT_RING(ring, 1);
> +       }
>
>         adreno_flush(gpu, ring, REG_AXXX_CP_RB_WPTR);
>         return a2xx_idle(gpu);
> @@ -101,6 +108,7 @@ static bool a2xx_me_init(struct msm_gpu *gpu)
>  static int a2xx_hw_init(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +       struct a2xx_gpu *a2xx_gpu = to_a2xx_gpu(adreno_gpu);
>         dma_addr_t pt_base, tran_error;
>         uint32_t *ptr, len;
>         int i, ret;
> @@ -221,6 +229,17 @@ static int a2xx_hw_init(struct msm_gpu *gpu)
>         len = adreno_gpu->fw[ADRENO_FW_PM4]->size / 4;
>         DBG("loading PM4 ucode version: %x", ptr[1]);
>
> +       /*
> +        * New firmware files seem to have GPU and firmware version in this
> +        * word (0x20xxxx for A200, 0x220xxx for A220, 0x225xxx for A225).
> +        * Older firmware files, which lack protection support, have 0 instead.
> +        */
> +       if (ptr[1] == 0) {

I don't really have a good enough picture about all the possible fw
versions floating around out there, esp back to the pre-qc days, to
know if this is a good enough check.  But I guess we can go with it,
and in the worst case later add an allowlist table of fw checksums (or
similar) if this doesn't turn out to be sufficient, so the overall
approach isn't painting us into a corner.

Reviewed-by: Rob Clark <robdclark@gmail.com>

> +               dev_warn(gpu->dev->dev,
> +                        "Legacy firmware detected, disabling protection support\n");
> +               a2xx_gpu->protection_disabled = true;
> +       }
> +
>         gpu_write(gpu, REG_AXXX_CP_DEBUG,
>                         AXXX_CP_DEBUG_MIU_128BIT_WRITE_ENABLE);
>         gpu_write(gpu, REG_AXXX_CP_ME_RAM_WADDR, 0);
> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
> index 02fba2cb8932..161a075f94af 100644
> --- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.h
> @@ -15,6 +15,7 @@
>  struct a2xx_gpu {
>         struct adreno_gpu base;
>         bool pm_enabled;
> +       bool protection_disabled;
>  };
>  #define to_a2xx_gpu(x) container_of(x, struct a2xx_gpu, base)
>
> --
> 2.39.0
>
