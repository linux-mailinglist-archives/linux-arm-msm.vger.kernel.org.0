Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6496D2D0E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2019 23:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfE1VVi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 17:21:38 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:51545 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbfE1VVi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 17:21:38 -0400
Received: by mail-it1-f194.google.com with SMTP id m3so170129itl.1;
        Tue, 28 May 2019 14:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=E8v5+EuR+OzevO5VrvC8NUWHNNFoEIwMFK6SXtiaiMY=;
        b=Sa504xvoFQu7A54OfDsba6Rl99JPwAQZmry2bf6Lt/bJMMms/uUiIP5TMTDIPlbos0
         1RhtdLJqVO4hDZ4/9QCVwu0hn7/zNQft1XPqKQ9ja8E9sShz/NaMQqvYdcgVFMcdrn1e
         dOKY5tQQtsw7fMMf08sU4BR0rOv6KX74H3Bh8d7FU2saTbK4GbiRZuUR3KNXYhbPLRYl
         IQ8wbMDhIWddnTPd4Z3ITqZs0t+iO4XfOOfoPuwuWpgdFcJL86QUotDEiPc4TjxSLB6J
         9f671MtuDvkGGq3E6a/LshgWmxOGjtAj1cgX0BbadmZDQ6bD1lCdvIO1x0w/vsgM6XIi
         dzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=E8v5+EuR+OzevO5VrvC8NUWHNNFoEIwMFK6SXtiaiMY=;
        b=d1ScDnfCgmV6ZlkdFmCt03W8xFYk6DFdwxqtQyHM9GL6/HsxFojan3+s+CYINqRmZw
         N2D5dX0ClYLsB/DhacvmmzDL3yCneCTsMJSJ2vUcjjsVp6Bqy9XM8GpGHMyyJL/v/2DR
         nRFGiDND1U0+bYFsAsmsIemwg+gDqRzw+6UsHq1hu6IX5talIjjOgzqKSiC252RPGt08
         52VNP7T+fMx237hWWl09VymOzdU0G37h/iVJHXl4uWesl78tIRWs+Q3x2yoI9GAgDIy8
         1hFaunDKh6xhOZfG3Nr0bgFzbXmQQE0U2qggDKKCgXGK1gycrNqhT3Xk6Xz6fHi6pL1I
         qzYw==
X-Gm-Message-State: APjAAAXhKldbJN5SHzFl4hPACi80sXjDzetM/flLUlfdbiYyonMrBc6v
        1/lUjJykJu9t4Gh1bfbQh1vEHUYvavI1B6kN+Cs=
X-Google-Smtp-Source: APXvYqyTFeOz8KR+0J5TzMWqQm6LzkFqSlwbxdr8qH0IIqiq+Lli6gbwKbMmT/8nTWunJpLfQ2UOow/5F2mngvy3PMo=
X-Received: by 2002:a24:6c4a:: with SMTP id w71mr5021130itb.128.1559078497108;
 Tue, 28 May 2019 14:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190528170612.39003-1-jeffrey.l.hugo@gmail.com> <20190528204505.GC23227@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20190528204505.GC23227@jcrouse1-lnx.qualcomm.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 28 May 2019 15:21:27 -0600
Message-ID: <CAOCk7NoUZXZSr6szZ4ObOrqE00pkbuCi1BFu9EZHsxpAa-iwmw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add A540 support
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, Daniel Vetter <daniel@ffwll.ch>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 28, 2019 at 2:45 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Tue, May 28, 2019 at 10:06:12AM -0700, Jeffrey Hugo wrote:
> > The A540 is a derivative of the A530, and is found in the MSM8998 SoC.
> >
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 22 +++++++
> >  drivers/gpu/drm/msm/adreno/a5xx_power.c    | 76 +++++++++++++++++++++-
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 18 +++++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++
> >  4 files changed, 119 insertions(+), 3 deletions(-)
>
> This is awesome.  I'm glad we can finally check this off the list.

Thanks for the quick review.

>
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > index e5fcefa49f19..7ca8fde22fd8 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -318,12 +318,19 @@ static const struct {
> >
> >  void a5xx_set_hwcg(struct msm_gpu *gpu, bool state)
> >  {
> > +     struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> >       unsigned int i;
> >
> >       for (i = 0; i < ARRAY_SIZE(a5xx_hwcg); i++)
> >               gpu_write(gpu, a5xx_hwcg[i].offset,
> >                       state ? a5xx_hwcg[i].value : 0);
> >
> > +     if (adreno_is_a540(adreno_gpu)) {
> > +             gpu_write(gpu, REG_A5XX_RBBM_CLOCK_HYST_GPMU, 0x00000222);
>
> I don't think this one is needed - we can just go with the one two lines below.

I'll try without it, and see.

>
> > +             gpu_write(gpu, REG_A5XX_RBBM_CLOCK_DELAY_GPMU, 0x00000770);
> > +             gpu_write(gpu, REG_A5XX_RBBM_CLOCK_HYST_GPMU, 0x00000004);
>
> Both of these need the state ? <value> : 0x0 hack to turn off HWCG if requested

I see.  Will do.

>
> > +     }
> > +
> >       gpu_write(gpu, REG_A5XX_RBBM_CLOCK_CNTL, state ? 0xAAA8AA00 : 0);
> >       gpu_write(gpu, REG_A5XX_RBBM_ISDB_CNT, state ? 0x182 : 0x180);
> >  }
> > @@ -507,6 +514,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
> >
> >       gpu_write(gpu, REG_A5XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x00000003);
> >
> > +     if (adreno_is_a540(adreno_gpu))
> > +             gpu_write(gpu, REG_A5XX_VBIF_GATE_OFF_WRREQ_EN, 0x00000009);
> > +
> >       /* Make all blocks contribute to the GPU BUSY perf counter */
> >       gpu_write(gpu, REG_A5XX_RBBM_PERFCTR_GPU_BUSY_MASKED, 0xFFFFFFFF);
> >
> > @@ -592,6 +602,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
> >       /* Set the highest bank bit */
> >       gpu_write(gpu, REG_A5XX_TPL1_MODE_CNTL, 2 << 7);
> >       gpu_write(gpu, REG_A5XX_RB_MODE_CNTL, 2 << 1);
> > +     if (adreno_is_a540(adreno_gpu))
> > +             gpu_write(gpu, REG_A5XX_UCHE_DBG_ECO_CNTL_2, 2);
> >
> >       /* Protect registers from the CP */
> >       gpu_write(gpu, REG_A5XX_CP_PROTECT_CNTL, 0x00000007);
> > @@ -642,6 +654,16 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
> >               REG_A5XX_RBBM_SECVID_TSB_TRUSTED_BASE_HI, 0x00000000);
> >       gpu_write(gpu, REG_A5XX_RBBM_SECVID_TSB_TRUSTED_SIZE, 0x00000000);
> >
> > +     /*
> > +      * VPC corner case with local memory load kill leads to corrupt
> > +      * internal state. Normal Disable does not work for all a5x chips.
> > +      * So do the following setting to disable it.
> > +      */
> > +     if (adreno_gpu->info->quirks & ADRENO_QUIRK_LMLOADKILL_DISABLE) {
>
> This is a5xx only quirk but it applies to multiple 5xx targets so I think its
> reasonable to identify it as a quirk and use it as such to make it easier on
> future code porters.
>
> > +             gpu_rmw(gpu, REG_A5XX_VPC_DBG_ECO_CNTL, 0, BIT(23));
> > +             gpu_rmw(gpu, 0xE04, BIT(18), 0); /*REG_A5XX_HLSQ_DBG_ECO_CNTL*/
>
> You should define and use REG_A5XX_HLSQ_DBG_ECO_CNTL symbolically. We can help
> you do the envytools dance if you need.

Thanks for the offline explanation.  Will do

>
> > +     }
> > +
> >       ret = adreno_hw_init(gpu);
> >       if (ret)
> >               return ret;
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
> > index 70e65c94e525..5cb325c6eb8f 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
> > @@ -32,6 +32,18 @@
> >  #define AGC_POWER_CONFIG_PRODUCTION_ID 1
> >  #define AGC_INIT_MSG_VALUE 0xBABEFACE
> >
> > +/* AGC_LM_CONFIG (A540+) */
> > +#define AGC_LM_CONFIG (136/4)
> > +#define AGC_LM_CONFIG_GPU_VERSION_SHIFT 17
> > +#define AGC_LM_CONFIG_ENABLE_GPMU_ADAPTIVE 1
> > +#define AGC_LM_CONFIG_THROTTLE_DISABLE (2 << 8)
> > +#define AGC_LM_CONFIG_ISENSE_ENABLE (1 << 4)
> > +#define AGC_LM_CONFIG_ENABLE_ERROR (3 << 4)
> > +#define AGC_LM_CONFIG_LLM_ENABLED (1 << 16)
> > +#define AGC_LM_CONFIG_BCL_DISABLED (1 << 24)
> > +
> > +#define AGC_LEVEL_CONFIG (140/4)
> > +
> >  static struct {
> >       uint32_t reg;
> >       uint32_t value;
> > @@ -116,7 +128,7 @@ static inline uint32_t _get_mvolts(struct msm_gpu *gpu, uint32_t freq)
> >  }
> >
> >  /* Setup thermal limit management */
> > -static void a5xx_lm_setup(struct msm_gpu *gpu)
> > +static void a530_lm_setup(struct msm_gpu *gpu)
> >  {
> >       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> >       struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
> > @@ -165,6 +177,45 @@ static void a5xx_lm_setup(struct msm_gpu *gpu)
> >       gpu_write(gpu, AGC_INIT_MSG_MAGIC, AGC_INIT_MSG_VALUE);
> >  }
> >
> > +#define PAYLOAD_SIZE(_size) ((_size) * sizeof(u32))
> > +#define LM_DCVS_LIMIT 1
> > +#define LEVEL_CONFIG ~(0x303)
> > +
> > +static void a540_lm_setup(struct msm_gpu *gpu)
> > +{
> > +     struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> > +     u32 config;
> > +
> > +     /* The battery current limiter isn't enabled for A540 */
> > +     config = AGC_LM_CONFIG_BCL_DISABLED;
> > +     config |= adreno_gpu->rev.patchid << AGC_LM_CONFIG_GPU_VERSION_SHIFT;
> > +
> > +     /* For now disable GPMU side throttling */
> > +     config |= AGC_LM_CONFIG_THROTTLE_DISABLE;
> > +
> > +     /* Until we get clock scaling 0 is always the active power level */
> > +     gpu_write(gpu, REG_A5XX_GPMU_GPMU_VOLTAGE, 0x80000000 | 0);
> > +
> > +     /* Fixed at 6000 for now */
> > +     gpu_write(gpu, REG_A5XX_GPMU_GPMU_PWR_THRESHOLD, 0x80000000 | 6000);
> > +
> > +     gpu_write(gpu, AGC_MSG_STATE, 0x80000001);
> > +     gpu_write(gpu, AGC_MSG_COMMAND, AGC_POWER_CONFIG_PRODUCTION_ID);
> > +
> > +     gpu_write(gpu, AGC_MSG_PAYLOAD(0), 5448); //magic number?
>
> They are all magic numbers but especially this number.  530 has the same.

Whoops.  I forgot to strip that comment out.  Thanks for catching.

>
> <snip>
>
> Jordan
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
