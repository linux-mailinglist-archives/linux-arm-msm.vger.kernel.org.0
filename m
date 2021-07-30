Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010C43DB2B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 07:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbhG3FSX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 01:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236235AbhG3FSX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 01:18:23 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6D7C0613D5;
        Thu, 29 Jul 2021 22:18:01 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id m20-20020a05600c4f54b029024e75a15716so5523453wmq.2;
        Thu, 29 Jul 2021 22:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gcfjXHL9s8iq9c1a62B7oEoBNVKLn8vyy6R3qU8PH5I=;
        b=Hm9qtZRqm8jcpyPOrEzK134qLp7Z7Gcengx0cFcnIWh7hvHSaIfwnaYGsEJ2ZClZ37
         LszecmvsxuRcbcbdiYD8Id9lo0WtDTrFaXdVhlisZRmbqnOIaVhpi+IC16pTK9LkjpTt
         6CJIifPQQhqp5imTF8a5eoACfEWXtWuST8O/aHGXNCVfCMo2abuZYllpP4MKL09UD62T
         hSJz2TQn6k12ZAQXoweW4bS1eyNzHvHZxxX+MvfLGdBLdM/UG1Zi/1JgeoboQWZd/852
         G//XZOaIB5+uZiS98k3IV53IMYQBG4q7B43XFcc7lho46KfDOqIg7MFqSQ7wOLCHdIB1
         j9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gcfjXHL9s8iq9c1a62B7oEoBNVKLn8vyy6R3qU8PH5I=;
        b=tuaR+P/nxLteHuvxtrt9PymUNH74oTdlimBW83xArcbJruPdD5u9QcP0MtFlu8DOCS
         sygDXs+1NdUg5pa2XafDLLgMV3zEnCaE87Lg3+dsVSHN1HMxVgXypd+IL1mZpcmVpOGN
         xtX1dj2A/jizEEJHWxX0urQU8Iz+5prfPJOoizGso1MpEdxcSPkeNTPmze1v6YOmvkV7
         W+e02AaM3rgGaRdF6ysXzuc+EgXyYD5ndwQhyZYdnnLlylUsStk9RPd4TQbk6cDrzL5s
         ZAwBsYwUSYnOyph4XG4nIS4x1RXea2Kp3T+d0KaWBmzmYRch3/dpy81Qk1rwCTuIPotu
         HU7w==
X-Gm-Message-State: AOAM530YrTxsBSJtkPVBrbtglBc/ge3Gr+kLA+veBF2LZD3qj1e+0Cet
        yf98q7E5Vta+WhigO8Faz+waZINTY3dCwgOlzXg=
X-Google-Smtp-Source: ABdhPJz7A90qMFZqNp3xDuwFHlzZ0eiFyKaRKBuOxUeMrJu/Ha93+6+SI2mA/0ullnIbS/Vypku1xi7ALWlIzPK0RzU=
X-Received: by 2002:a05:600c:19cb:: with SMTP id u11mr768042wmq.175.1627622280139;
 Thu, 29 Jul 2021 22:18:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210725032002.3961691-1-bjorn.andersson@linaro.org>
 <CAF6AEGvADHz7YmOZQTX8g+ZRG1rp7sk9wevgBQsknQytH+eFSA@mail.gmail.com> <20412cce-df2f-6271-9284-611f6b2ef1c5@codeaurora.org>
In-Reply-To: <20412cce-df2f-6271-9284-611f6b2ef1c5@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 29 Jul 2021 22:17:48 -0700
Message-ID: <CAF6AEGv=+N-1SQH+g-B2-LHMFPOpz-hQW8F2NOFGgFDcxy+cRQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm: msm: Add 680 gpu to the adreno gpu list
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 29, 2021 at 8:53 PM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> On 7/30/2021 5:38 AM, Rob Clark wrote:
> > On Sat, Jul 24, 2021 at 8:21 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> >>
> >> This patch adds a Adreno 680 entry to the gpulist.
> >
> > Looks reasonable, but I wonder if we should just go ahead and add
> > adreno_is_a640_family() in a similar vein to
> > adreno_is_a650_familiy()/adreno_is_a660_family().. I think most of the
> > 'if (a640) ...' should also apply to a680?
>
> If there is no delta, wouldn't it be better to simply add a680 to
> adreno_is_a640?

Until we move to features flags (and if needed, other config table
params.. I know UMD needs more than just booleans but that may not be
the case on kernel side), I'd kinda prefer "_family()" to make it
clear that it applies to more than just a single gpu but a
sub-generation of a6xx.. I'd kinda assume the differences in memory
configuration (iirc dual vs quad ddr interfaces) have some small
differences between a640 and a680 that matters somewhere on the kernel
side?

BR,
-R

> -Akhil.
>
> >
> > BR,
> > -R
> >
> >> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> ---
> >>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  5 +++--
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 12 +++++++-----
> >>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c      |  2 +-
> >>   drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
> >>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
> >>   5 files changed, 29 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> index b349692219b7..1c0d75e1189f 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> @@ -521,7 +521,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
> >>
> >>          if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
> >>                  pdc_in_aop = true;
> >> -       else if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
> >> +       else if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu) ||
> >> +                adreno_is_a680(adreno_gpu))
> >>                  pdc_address_offset = 0x30090;
> >>          else
> >>                  pdc_address_offset = 0x30080;
> >> @@ -1522,7 +1523,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> >>                          SZ_16M - SZ_16K, 0x04000);
> >>                  if (ret)
> >>                          goto err_memory;
> >> -       } else if (adreno_is_a640(adreno_gpu)) {
> >> +       } else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu)) {
> >>                  ret = a6xx_gmu_memory_alloc(gmu, &gmu->icache,
> >>                          SZ_256K - SZ_16K, 0x04000);
> >>                  if (ret)
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> index 9c5e4618aa0a..5cdafc6c8bb0 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -683,7 +683,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
> >>          if (adreno_is_a618(adreno_gpu))
> >>                  return;
> >>
> >> -       if (adreno_is_a640(adreno_gpu))
> >> +       if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
> >>                  amsbc = 1;
> >>
> >>          if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
> >> @@ -757,7 +757,7 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
> >>           * a660 targets have all the critical security fixes from the start
> >>           */
> >>          if (adreno_is_a618(adreno_gpu) || adreno_is_a630(adreno_gpu) ||
> >> -               adreno_is_a640(adreno_gpu)) {
> >> +           adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu)) {
> >>                  /*
> >>                   * If the lowest nibble is 0xa that is an indication that this
> >>                   * microcode has been patched. The actual version is in dword
> >> @@ -897,7 +897,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
> >>          a6xx_set_hwcg(gpu, true);
> >>
> >>          /* VBIF/GBIF start*/
> >> -       if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu)) {
> >> +       if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu) ||
> >> +           adreno_is_a680(adreno_gpu)) {
> >>                  gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE0, 0x00071620);
> >>                  gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE1, 0x00071620);
> >>                  gpu_write(gpu, REG_A6XX_GBIF_QSB_SIDE2, 0x00071620);
> >> @@ -935,7 +936,8 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
> >>          gpu_write(gpu, REG_A6XX_UCHE_FILTER_CNTL, 0x804);
> >>          gpu_write(gpu, REG_A6XX_UCHE_CACHE_WAYS, 0x4);
> >>
> >> -       if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu))
> >> +       if (adreno_is_a640(adreno_gpu) || adreno_is_a650_family(adreno_gpu) ||
> >> +           adreno_is_a680(adreno_gpu))
> >>                  gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x02000140);
> >>          else
> >>                  gpu_write(gpu, REG_A6XX_CP_ROQ_THRESHOLDS_2, 0x010000c0);
> >> @@ -952,7 +954,7 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
> >>          */
> >>          if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
> >>                  gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
> >> -       else if (adreno_is_a640(adreno_gpu))
> >> +       else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
> >>                  gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
> >>          else
> >>                  gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00180000);
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> index 919433732b43..df8af237cf6a 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> @@ -428,7 +428,7 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
> >>
> >>          if (adreno_is_a618(adreno_gpu))
> >>                  a618_build_bw_table(&msg);
> >> -       else if (adreno_is_a640(adreno_gpu))
> >> +       else if (adreno_is_a640(adreno_gpu) || adreno_is_a680(adreno_gpu))
> >>                  a640_build_bw_table(&msg);
> >>          else if (adreno_is_a650(adreno_gpu))
> >>                  a650_build_bw_table(&msg);
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> index 6dad8015c9a1..799e4a35ca44 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> @@ -300,6 +300,19 @@ static const struct adreno_info gpulist[] = {
> >>                  .init = a6xx_gpu_init,
> >>                  .zapfw = "a660_zap.mdt",
> >>                  .hwcg = a660_hwcg,
> >> +       }, {
> >> +               .rev = ADRENO_REV(6, 8, 0, ANY_ID),
> >> +               .revn = 680,
> >> +               .name = "A680",
> >> +               .fw = {
> >> +                       [ADRENO_FW_SQE] = "a630_sqe.fw",
> >> +                       [ADRENO_FW_GMU] = "a640_gmu.bin",
> >> +               },
> >> +               .gmem = SZ_2M,
> >> +               .inactive_period = DRM_MSM_INACTIVE_PERIOD,
> >> +               .init = a6xx_gpu_init,
> >> +               .zapfw = "a640_zap.mdt",
> >> +               .hwcg = a640_hwcg,
> >>          },
> >>   };
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> index 8dbe0d157520..a7e843e81b1e 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> >> @@ -258,6 +258,11 @@ static inline int adreno_is_a650_family(struct adreno_gpu *gpu)
> >>          return gpu->revn == 650 || gpu->revn == 620 || gpu->revn == 660;
> >>   }
> >>
> >> +static inline int adreno_is_a680(struct adreno_gpu *gpu)
> >> +{
> >> +       return gpu->revn == 680;
> >> +}
> >> +
> >>   int adreno_get_param(struct msm_gpu *gpu, uint32_t param, uint64_t *value);
> >>   const struct firmware *adreno_request_fw(struct adreno_gpu *adreno_gpu,
> >>                  const char *fwname);
> >> --
> >> 2.29.2
> >>
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
