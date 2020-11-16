Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95D902B4AD4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 17:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731878AbgKPQWb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 11:22:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731874AbgKPQWa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 11:22:30 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03BE4C0613CF;
        Mon, 16 Nov 2020 08:22:30 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id j7so19316924wrp.3;
        Mon, 16 Nov 2020 08:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=27B/z7ecHug/NOPj3+EmOeHAQ0G+MSNmKH5jQjoCjsw=;
        b=AGMRUfJYts6+ZcpHSbV7iXKub0ruhz7ruVbTPza3Qo/ahFNRu1HhaBRV2v5ab6cmdt
         DiGtvxjignlOiTriIVwBOYWGvNGNgeqq2Rl91vcQlNn6XwfbUHq4Y1dsygTs6nDdurvk
         /n/YI6pkcjdPH3KPXPIBPP/cD8JpGD1qEDNmu+ZW+XsBZhOr2VtxzTJR+EKE7cPA7r3I
         UDJg/c3bVBFcNWeeSOvK7T6NzFZNe7xleqmVAFY6jz19aaEGUcWtmnX49zprb3Ib2e/b
         Tw1Vvl5N0V3jBGmkPReeFpaQIgkFmcDbAIBVD5/iZBRvcPSO2iVS34PfZBHAkbd1siyS
         gu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=27B/z7ecHug/NOPj3+EmOeHAQ0G+MSNmKH5jQjoCjsw=;
        b=PdtuXDHWciUsBrLwXsd0F0kIdUlzuzuuSGhofNbj8zdug8zZ31PEhYRUloRcydSbZU
         MrsfIBJc2BjjwBKrXMvTZNmywTocbaFien2+q1Xl3hVKVPPTgdcSVYjl3tOvZT00nGgC
         ui+qMkI32CMXxtnvbwkU+md0ewi23WJBxueO51Ubg6fVSbDbC2Z+Rd2Y46RpTXIP4KMP
         XuudCp2sw3I2kgu7zvFY9SVGW1d8+jLTQyzdO5rluFDo4yGARSHiAbT6CgyhH90V0k+I
         k4MjJEntdCWf/i2l8NaB3mDxT/++RoHOYUxRtL+FWcgs1ylcNv3wTBFEnhz8oxzwZfBq
         hb/g==
X-Gm-Message-State: AOAM5325VYIyz1lZeeSTieQqPLJI/MV2GCHqr7l0y0yvyBHB6/XLuiae
        7/uW27ERjTXVofpuRJUXrKqdHjJCXLb0q156hRQ=
X-Google-Smtp-Source: ABdhPJzk8ENudQ8LQ655SjK55pl2buTE8lmQR0ImkjpybO2pKZIkMBMrjqovp/o5fn1y+rN/CziHoG9D+Hj3J40DagY=
X-Received: by 2002:adf:a3c1:: with SMTP id m1mr19747707wrb.28.1605543748618;
 Mon, 16 Nov 2020 08:22:28 -0800 (PST)
MIME-Version: 1.0
References: <1605196144-23516-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGutT0M9mu2NhUnqnvrqSNEUEqYJKS6Mt0vXwV+mPyQGMw@mail.gmail.com> <0c872e78-0f2c-5771-979d-862c7c30b281@codeaurora.org>
In-Reply-To: <0c872e78-0f2c-5771-979d-862c7c30b281@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 16 Nov 2020 08:22:16 -0800
Message-ID: <CAF6AEGtysKTSdX_HmHs_fdvGLYYkQn4XmM_NWgSdBLK3JMF_zQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: adreno: Make speed-bin support generic
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 16, 2020 at 6:34 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> On 11/12/2020 10:07 PM, Rob Clark wrote:
> > On Thu, Nov 12, 2020 at 7:49 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
> >>
> >> So far a530v2 gpu has support for detecting its supported opps
> >> based on a fuse value called speed-bin. This patch makes this
> >> support generic across gpu families. This is in preparation to
> >> extend speed-bin support to a6x family.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> >> ---
> >> This patch is rebased on top of msm-next-staging branch in rob's tree.
> >>
> >>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 34 --------------
> >>   drivers/gpu/drm/msm/adreno/adreno_device.c |  4 ++
> >>   drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 71 ++++++++++++++++++++++++++++++
> >>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++
> >>   4 files changed, 80 insertions(+), 34 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> >> index 8fa5c91..7d42321 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> >> @@ -1531,38 +1531,6 @@ static const struct adreno_gpu_funcs funcs = {
> >>          .get_timestamp = a5xx_get_timestamp,
> >>   };
> >>
> >> -static void check_speed_bin(struct device *dev)
> >> -{
> >> -       struct nvmem_cell *cell;
> >> -       u32 val;
> >> -
> >> -       /*
> >> -        * If the OPP table specifies a opp-supported-hw property then we have
> >> -        * to set something with dev_pm_opp_set_supported_hw() or the table
> >> -        * doesn't get populated so pick an arbitrary value that should
> >> -        * ensure the default frequencies are selected but not conflict with any
> >> -        * actual bins
> >> -        */
> >> -       val = 0x80;
> >> -
> >> -       cell = nvmem_cell_get(dev, "speed_bin");
> >> -
> >> -       if (!IS_ERR(cell)) {
> >> -               void *buf = nvmem_cell_read(cell, NULL);
> >> -
> >> -               if (!IS_ERR(buf)) {
> >> -                       u8 bin = *((u8 *) buf);
> >> -
> >> -                       val = (1 << bin);
> >> -                       kfree(buf);
> >> -               }
> >> -
> >> -               nvmem_cell_put(cell);
> >> -       }
> >> -
> >> -       dev_pm_opp_set_supported_hw(dev, &val, 1);
> >> -}
> >> -
> >>   struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
> >>   {
> >>          struct msm_drm_private *priv = dev->dev_private;
> >> @@ -1588,8 +1556,6 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
> >>
> >>          a5xx_gpu->lm_leakage = 0x4E001A;
> >>
> >> -       check_speed_bin(&pdev->dev);
> >> -
> >>          ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 4);
> >>          if (ret) {
> >>                  a5xx_destroy(&(a5xx_gpu->base.base));
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> index 87c8b03..e0ff16c 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> @@ -18,6 +18,8 @@ bool snapshot_debugbus = false;
> >>   MODULE_PARM_DESC(snapshot_debugbus, "Include debugbus sections in GPU devcoredump (if not fused off)");
> >>   module_param_named(snapshot_debugbus, snapshot_debugbus, bool, 0600);
> >>
> >> +const u32 a530v2_speedbins[] = {0, 1, 2, 3, 4, 5, 6, 7};
> >> +
> >>   static const struct adreno_info gpulist[] = {
> >>          {
> >>                  .rev   = ADRENO_REV(2, 0, 0, 0),
> >> @@ -163,6 +165,8 @@ static const struct adreno_info gpulist[] = {
> >>                          ADRENO_QUIRK_FAULT_DETECT_MASK,
> >>                  .init = a5xx_gpu_init,
> >>                  .zapfw = "a530_zap.mdt",
> >> +               .speedbins = a530v2_speedbins,
> >> +               .speedbins_count = ARRAY_SIZE(a530v2_speedbins),
> >>          }, {
> >>                  .rev = ADRENO_REV(5, 4, 0, 2),
> >>                  .revn = 540,
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> index f21561d..cdd0c11 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> >> @@ -14,6 +14,7 @@
> >>   #include <linux/pm_opp.h>
> >>   #include <linux/slab.h>
> >>   #include <linux/soc/qcom/mdt_loader.h>
> >> +#include <linux/nvmem-consumer.h>
> >>   #include <soc/qcom/ocmem.h>
> >>   #include "adreno_gpu.h"
> >>   #include "msm_gem.h"
> >> @@ -891,6 +892,69 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
> >>                             adreno_ocmem->hdl);
> >>   }
> >>
> >> +static int adreno_set_supported_hw(struct device *dev,
> >> +               struct adreno_gpu *adreno_gpu)
> >> +{
> >> +       u8 speedbins_count = adreno_gpu->info->speedbins_count;
> >> +       const u32 *speedbins = adreno_gpu->info->speedbins;
> >> +       struct nvmem_cell *cell;
> >> +       u32 bin, i;
> >> +       u32 val = 0;
> >> +       void *buf, *opp_table;
> >> +
> >> +       cell = nvmem_cell_get(dev, "speed_bin");
> >> +       /*
> >> +        * -ENOENT means that the platform doesn't support speedbin which is
> >> +        * fine
> >> +        */
> >> +       if (PTR_ERR(cell) == -ENOENT)
> >> +               return 0;
> >> +       else if (IS_ERR(cell))
> >> +               return PTR_ERR(cell);
> >> +
> >> +       /* A speedbin table is must if the platform supports speedbin */
> >> +       if (!speedbins) {
> >> +               DRM_DEV_ERROR(dev, "speed-bin table is missing\n");
> >> +               return -ENOENT;
> >
> > Hmm, this means that hw which supports speed-bin, but for which we
> > haven't yet added a speedbin table, will start failing.  Which seems
> > not great.  Maybe it would be better to keep the DRM_DEV_ERROR() (so
> > people realize something is missing), but return 0?
> We can't because if the gpu opp table has "opp-supported-hw" property,
> opp driver expects us to call dev_pm_opp_set_supported_hw() to select
> the supported hardware. I think we can just pick a default one and also
> print a detailed warning, will that work for you?

That seems like it could work.. or maybe just skip all this if there
is no opp table?

BR,
-R

> -Akhil.
> >
> > Or do you think we could add the speed-bin tables for all supported hw
> > immediately?
> >
> > BR,
> > -R
> >
> >> +       }
> >> +
> >> +       buf = nvmem_cell_read(cell, NULL);
> >> +       if (IS_ERR(buf)) {
> >> +               nvmem_cell_put(cell);
> >> +               return PTR_ERR(buf);
> >> +       }
> >> +
> >> +       bin = *((u32 *) buf);
> >> +
> >> +       for (i = 0; i < speedbins_count; i++) {
> >> +               if (bin == speedbins[i]) {
> >> +                       val = (1 << i);
> >> +                       break;
> >> +               }
> >> +       }
> >> +
> >> +       kfree(buf);
> >> +       nvmem_cell_put(cell);
> >> +
> >> +       if (!val) {
> >> +               DRM_DEV_ERROR(dev, "missing support for speed-bin: %u\n", bin);
> >> +               return -ENOENT;
> >> +       }
> >> +
> >> +       opp_table = dev_pm_opp_set_supported_hw(dev, &val, 1);
> >> +       if (IS_ERR(opp_table))
> >> +               return PTR_ERR(opp_table);
> >> +
> >> +       adreno_gpu->opp_table = opp_table;
> >> +       return 0;
> >> +}
> >> +
> >> +static void adreno_put_supported_hw(struct opp_table *opp_table)
> >> +{
> >> +       if (opp_table)
> >> +               dev_pm_opp_put_supported_hw(opp_table);
> >> +}
> >> +
> >>   int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >>                  struct adreno_gpu *adreno_gpu,
> >>                  const struct adreno_gpu_funcs *funcs, int nr_rings)
> >> @@ -899,6 +963,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >>          struct adreno_platform_config *config = dev->platform_data;
> >>          struct msm_gpu_config adreno_gpu_config  = { 0 };
> >>          struct msm_gpu *gpu = &adreno_gpu->base;
> >> +       int ret;
> >>
> >>          adreno_gpu->funcs = funcs;
> >>          adreno_gpu->info = adreno_info(config->rev);
> >> @@ -910,6 +975,10 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
> >>
> >>          adreno_gpu_config.nr_rings = nr_rings;
> >>
> >> +       ret = adreno_set_supported_hw(dev, adreno_gpu);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >>          adreno_get_pwrlevels(dev, gpu);
> >>
> >>          pm_runtime_set_autosuspend_delay(dev,
> >> @@ -936,4 +1005,6 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
> >>
> >>          icc_put(gpu->icc_path);
> >>          icc_put(gpu->ocmem_icc_path);
> >> +
> >> +       adreno_put_supported_hw(adreno_gpu->opp_table);
> >>   }
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> index c3775f7..a756ad7 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> @@ -55,6 +55,7 @@ struct adreno_reglist {
> >>   };
> >>
> >>   extern const struct adreno_reglist a630_hwcg[], a640_hwcg[], a650_hwcg[];
> >> +extern const u32 a618_speedbins[];
> >>
> >>   struct adreno_info {
> >>          struct adreno_rev rev;
> >> @@ -67,6 +68,8 @@ struct adreno_info {
> >>          const char *zapfw;
> >>          u32 inactive_period;
> >>          const struct adreno_reglist *hwcg;
> >> +       const u32 *speedbins;
> >> +       const u8 speedbins_count;
> >>   };
> >>
> >>   const struct adreno_info *adreno_info(struct adreno_rev rev);
> >> @@ -112,6 +115,8 @@ struct adreno_gpu {
> >>           * code (a3xx_gpu.c) and stored in this common location.
> >>           */
> >>          const unsigned int *reg_offsets;
> >> +
> >> +       struct opp_table *opp_table;
> >>   };
> >>   #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
> >>
> >> --
> >> 2.7.4
> >>
>
