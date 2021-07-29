Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD233DA7A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 17:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbhG2PeB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 11:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbhG2PeB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 11:34:01 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB17C061765;
        Thu, 29 Jul 2021 08:33:57 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id m12so2660406wru.12;
        Thu, 29 Jul 2021 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+XB1M3t3M8k1eQ/n7Sjx7eW0C7/iAoR2L9BAyqD9QUw=;
        b=jUh13tpv9BS/iFw4vr4vVAfl3IRI9ZluhAKMhTlGvVtmc6cpkLal7184KvEhsH9VYe
         fpDqJQrwf0nUXyYu7A2QXEEcYbaWfIJDpofEZA13RzEvoVMMdDTAh7L/1IYT8wdrVRfw
         tBU06Luaz1ara8i1fHgW6gMnY3Wg1EDwPV8DwITIYvFkvD3NLDLs5JvcejkmUzcpsLqU
         N6m++cSPrDPpg5hrb4Oy2wcqCTg2ULu+uya82uj6BLNNUfBM1ftbMEdo1sPCTumMyjVT
         OKtVh0lsrc4m9xo8s5zUi8sdRpsRRNRWdPRPHLWXCxrylvyHIvW6a2S+XCrZ0plWehrJ
         1bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+XB1M3t3M8k1eQ/n7Sjx7eW0C7/iAoR2L9BAyqD9QUw=;
        b=OZc/0sb/0+4gf7cizp9H1M/hpiFOPeBeLUEabeklUNT2pUiiq5IzOKNx/DGK/WF/Vs
         oE6wp9xVeiQqVlAKn1mCMsR+ySGOiBxtRm9Ud/fRjVcFY6wEVD0nHF7GIyHyVzD72Qxc
         pnhx8Zs00YbGVkKEQpTotPQotAAASkb7c5jSBIoB9Q/z4Rroqf5w3EIe7dKi5zJTSNxp
         ZHxNHHiV1EtbmunnjSpFDmfBseHjxeyb4+zKqpGzU99f/kOuuNcihF+tMTV+vL3M/xhS
         8NWKpekHcUNiCWT8c5DegNdff1YXvxFDbsAjVk4R9BbVBsIA5umJ3Lnkwhv0TsYJZ4AO
         aQMw==
X-Gm-Message-State: AOAM5336SKaZHJJW3ri1H4nm+5r73M62ieTywwmsn0nsKTOprIVma311
        qIKBsKofJyKPMCqlhnyigGNDUvB/SFLWbBHg6JU=
X-Google-Smtp-Source: ABdhPJw/c8uRnT+ZWmwRuRQ7K7vX8DirOvRhyX1WQILGxbqZ95WM8X0o/ce/9Xgo/5FRq0irAIICvytu6o6MALon6PI=
X-Received: by 2002:adf:e3c7:: with SMTP id k7mr5291858wrm.327.1627572836041;
 Thu, 29 Jul 2021 08:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <1627572036-28289-1-git-send-email-akhilpo@codeaurora.org> <20210729204922.v3.3.I610377db0934b6b7deda532ec2bf786a02c38c01@changeid>
In-Reply-To: <20210729204922.v3.3.I610377db0934b6b7deda532ec2bf786a02c38c01@changeid>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 29 Jul 2021 08:38:04 -0700
Message-ID: <CAF6AEGvtPq5C6xhmCa49_eYqgjrQPW=1QQ1H=YLO7hVXObt7Qw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/msm/a6xx: Add support for Adreno 7c Gen 3 gpu
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
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 29, 2021 at 8:21 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> This patch adds support for the gpu found in the Snapdragon 7c Gen 3
> compute platform. This gpu is similar to the exisiting a660 gpu with
> minor delta in the programing sequence. As the Adreno GPUs are moving
> away from a numeric chipid based naming scheme to a string, it was
> decided to use 0x06030500 as the gpu id of this gpu to communicate
> to the userspace driver.

s/gpu id/chip id/ (and in the cover letter too)

>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Introduce adreno_is_a660_family() (Rob)
> - Remove revn for 7c3 (Rob)
> - Remove CPR register programing since they are not required for 7c3
>
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  8 ++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h      |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 32 ++++++++++++++++++++----------
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c      | 32 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 27 +++++++++++++++++++------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 18 ++++++++++++++++-
>  6 files changed, 98 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index b349692..70ba3bf 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -519,7 +519,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>         if (!pdcptr)
>                 goto err;
>
> -       if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
> +       if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
>                 pdc_in_aop = true;
>         else if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
>                 pdc_address_offset = 0x30090;
> @@ -933,6 +933,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>
>         /* Use a known rate to bring up the GMU */
>         clk_set_rate(gmu->core_clk, 200000000);
> +       clk_set_rate(gmu->hub_clk, 150000000);
>         ret = clk_bulk_prepare_enable(gmu->nr_clocks, gmu->clocks);
>         if (ret) {
>                 pm_runtime_put(gmu->gxpd);
> @@ -1393,6 +1394,9 @@ static int a6xx_gmu_clocks_probe(struct a6xx_gmu *gmu)
>         gmu->core_clk = msm_clk_bulk_get_clock(gmu->clocks,
>                 gmu->nr_clocks, "gmu");
>
> +       gmu->hub_clk = msm_clk_bulk_get_clock(gmu->clocks,
> +               gmu->nr_clocks, "hub");
> +
>         return 0;
>  }
>
> @@ -1504,7 +1508,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>          * are otherwise unused by a660.
>          */
>         gmu->dummy.size = SZ_4K;
> -       if (adreno_is_a660(adreno_gpu)) {
> +       if (adreno_is_a660_family(adreno_gpu)) {
>                 ret = a6xx_gmu_memory_alloc(gmu, &gmu->debug, SZ_4K * 7, 0x60400000);
>                 if (ret)
>                         goto err_memory;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 71dfa600..3c74f64 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -66,6 +66,7 @@ struct a6xx_gmu {
>         int nr_clocks;
>         struct clk_bulk_data *clocks;
>         struct clk *core_clk;
> +       struct clk *hub_clk;
>
>         /* current performance index set externally */
>         int current_perf_index;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 0da1a66..1881e09 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -652,7 +652,7 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>                 regs = a650_protect;
>                 count = ARRAY_SIZE(a650_protect);
>                 count_max = 48;
> -       } else if (adreno_is_a660(adreno_gpu)) {
> +       } else if (adreno_is_a660_family(adreno_gpu)) {
>                 regs = a660_protect;
>                 count = ARRAY_SIZE(a660_protect);
>                 count_max = 48;
> @@ -694,6 +694,13 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>                 uavflagprd_inv = 2;
>         }
>
> +       if (adreno_is_7c3(adreno_gpu)) {
> +               lower_bit = 1;
> +               amsbc = 1;
> +               rgb565_predicator = 1;
> +               uavflagprd_inv = 2;
> +       }
> +
>         gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
>                 rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
>         gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
> @@ -787,7 +794,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>                 DRM_DEV_ERROR(&gpu->pdev->dev,
>                         "a650 SQE ucode is too old. Have version %x need at least %x\n",
>                         buf[0] & 0xfff, 0x095);
> -       } else if (adreno_is_a660(adreno_gpu)) {
> +       } else if (adreno_is_a660_family(adreno_gpu)) {
>                 ret = true;
>         } else {
>                 DRM_DEV_ERROR(&gpu->pdev->dev,
> @@ -941,7 +948,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>                 gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
>         gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_1, 0x8040362c);
>
> -       if (adreno_is_a660(adreno_gpu))
> +       if (adreno_is_a660_family(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_CP_LPAC_PROG_FIFO_SIZE, 0x00000020);
>
>         /* Setting the mem pool size */
> @@ -950,10 +957,10 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         /* Setting the primFifo thresholds default values,
>          * and vccCacheSkipDis=1 bit (0x200) for A640 and newer
>         */
> -       if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
> -               gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
> -       else if (adreno_is_a640(adreno_gpu))
> +       if (adreno_is_a640(adreno_gpu) || adreno_is_7c3(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
> +       else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
> +               gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
>         else
>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
>
> @@ -990,13 +997,15 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
>         /* Protect registers from the CP */
>         a6xx_set_cp_protect(gpu);
>
> -       if (adreno_is_a660(adreno_gpu)) {
> +       if (adreno_is_a660_family(adreno_gpu)) {
>                 gpu_write(gpu, REG_A6XX_CP_CHICKEN_DBG, 0x1);
>                 gpu_write(gpu, REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x0);
> -               /* Set dualQ + disable afull for A660 GPU but not for A635 */
> -               gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
>         }
>
> +       /* Set dualQ + disable afull for A660 GPU */
> +       if (adreno_is_a660(adreno_gpu))
> +               gpu_write(gpu, REG_A6XX_UCHE_CMDQ_CONFIG, 0x66906);
> +
>         /* Enable expanded apriv for targets that support it */
>         if (gpu->hw_apriv) {
>                 gpu_write(gpu, REG_A6XX_CP_APRIV_CNTL,
> @@ -1434,7 +1443,7 @@ static void a6xx_llc_activate(struct a6xx_gpu *a6xx_gpu)
>         /* On A660, the SCID programming for UCHE traffic is done in
>          * A6XX_GBIF_SCACHE_CNTL0[14:10]
>          */
> -       if (adreno_is_a660(adreno_gpu))
> +       if (adreno_is_a660_family(adreno_gpu))
>                 gpu_rmw(gpu, REG_A6XX_GBIF_SCACHE_CNTL0, (0x1f << 10) |
>                         (1 << 8), (gpu_scid << 10) | (1 << 8));
>  }
> @@ -1779,7 +1788,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>          */
>         info = adreno_info(config->rev);
>
> -       if (info && (info->revn == 650 || info->revn == 660))
> +       if (info && (info->revn == 650 || info->revn == 660 ||
> +                       adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), info->rev)))

Use adreno_is_7c3() here

>                 adreno_gpu->base.hw_apriv = true;
>
>         a6xx_llc_slices_init(pdev, a6xx_gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 9194337..1451c2b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -382,6 +382,36 @@ static void a660_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>         msg->cnoc_cmds_data[1][0] =  0x60000001;
>  }
>
> +static void adreno_7c3_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +       /*
> +        * Send a single "off" entry just to get things running
> +        * TODO: bus scaling
> +        */
> +       msg->bw_level_num = 1;
> +
> +       msg->ddr_cmds_num = 3;
> +       msg->ddr_wait_bitmask = 0x07;
> +
> +       msg->ddr_cmds_addrs[0] = 0x50004;
> +       msg->ddr_cmds_addrs[1] = 0x50000;
> +       msg->ddr_cmds_addrs[2] = 0x50088;
> +
> +       msg->ddr_cmds_data[0][0] =  0x40000000;
> +       msg->ddr_cmds_data[0][1] =  0x40000000;
> +       msg->ddr_cmds_data[0][2] =  0x40000000;
> +
> +       /*
> +        * These are the CX (CNOC) votes - these are used by the GMU but the
> +        * votes are known and fixed for the target
> +        */
> +       msg->cnoc_cmds_num = 1;
> +       msg->cnoc_wait_bitmask = 0x01;
> +
> +       msg->cnoc_cmds_addrs[0] = 0x5006c;
> +       msg->cnoc_cmds_data[0][0] =  0x40000000;
> +       msg->cnoc_cmds_data[1][0] =  0x60000001;
> +}
>  static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
>         /* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
> @@ -432,6 +462,8 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
>                 a640_build_bw_table(&msg);
>         else if (adreno_is_a650(adreno_gpu))
>                 a650_build_bw_table(&msg);
> +       else if (adreno_is_7c3(adreno_gpu))
> +               adreno_7c3_build_bw_table(&msg);
>         else if (adreno_is_a660(adreno_gpu))
>                 a660_build_bw_table(&msg);
>         else
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 6dad801..7b9d605 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -8,8 +8,6 @@
>
>  #include "adreno_gpu.h"
>
> -#define ANY_ID 0xff
> -
>  bool hang_debug = false;
>  MODULE_PARM_DESC(hang_debug, "Dump registers when hang is detected (can be slow!)");
>  module_param_named(hang_debug, hang_debug, bool, 0600);
> @@ -300,6 +298,17 @@ static const struct adreno_info gpulist[] = {
>                 .init = a6xx_gpu_init,
>                 .zapfw = "a660_zap.mdt",
>                 .hwcg = a660_hwcg,
> +       }, {
> +               .rev = ADRENO_REV(6, 3, 5, ANY_ID),
> +               .name = "Adreno 7c Gen 3",
> +               .fw = {
> +                       [ADRENO_FW_SQE] = "a660_sqe.fw",
> +                       [ADRENO_FW_GMU] = "a660_gmu.bin",
> +               },
> +               .gmem = SZ_512K,
> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +               .init = a6xx_gpu_init,
> +               .hwcg = a660_hwcg,
>         },
>  };
>
> @@ -325,6 +334,15 @@ static inline bool _rev_match(uint8_t entry, uint8_t id)
>         return (entry == ANY_ID) || (entry == id);
>  }
>
> +bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2)
> +{
> +
> +       return _rev_match(rev1.core, rev2.core) &&
> +               _rev_match(rev1.major, rev2.major) &&
> +               _rev_match(rev1.minor, rev2.minor) &&
> +               _rev_match(rev1.patchid, rev2.patchid);
> +}
> +
>  const struct adreno_info *adreno_info(struct adreno_rev rev)
>  {
>         int i;
> @@ -332,10 +350,7 @@ const struct adreno_info *adreno_info(struct adreno_rev rev)
>         /* identify gpu: */
>         for (i = 0; i < ARRAY_SIZE(gpulist); i++) {
>                 const struct adreno_info *info = &gpulist[i];
> -               if (_rev_match(info->rev.core, rev.core) &&
> -                               _rev_match(info->rev.major, rev.major) &&
> -                               _rev_match(info->rev.minor, rev.minor) &&
> -                               _rev_match(info->rev.patchid, rev.patchid))
> +               if (adreno_cmp_rev(info->rev, rev))
>                         return info;
>         }

Other than those couple small comments, and moving adreno_cmp_rev()
extraction into the previous patch, this looks pretty good.  When
doing patch surgery (ie. splitting changes out into different patches,
etc), it is a good idea to do an interactive rebase and make sure
things compile at each step.

BR,
-R

>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 8dbe0d1..6f8e7cc 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -42,6 +42,8 @@ struct adreno_rev {
>         uint8_t  patchid;
>  };
>
> +#define ANY_ID 0xff
> +
>  #define ADRENO_REV(core, major, minor, patchid) \
>         ((struct adreno_rev){ core, major, minor, patchid })
>
> @@ -247,15 +249,29 @@ static inline int adreno_is_a650(struct adreno_gpu *gpu)
>         return gpu->revn == 650;
>  }
>
> +bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
> +
> +static inline int adreno_is_7c3(struct adreno_gpu *gpu)
> +{
> +       /* The order of args is important here to handle ANY_ID correctly */
> +       return adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), gpu->rev);
> +}
> +
>  static inline int adreno_is_a660(struct adreno_gpu *gpu)
>  {
>         return gpu->revn == 660;
>  }
>
> +static inline int adreno_is_a660_family(struct adreno_gpu *gpu)
> +{
> +       return adreno_is_a660(gpu) || adreno_is_7c3(gpu);
> +}
> +
>  /* check for a650, a660, or any derivatives */
>  static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
>  {
> -       return gpu->revn == 650 || gpu->revn == 620 || gpu->revn == 660;
> +       return gpu->revn == 650 || gpu->revn == 620 ||
> +              adreno_is_a660_family(gpu);
>  }
>
>  int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation.
>
