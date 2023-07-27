Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D76DF764E6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 11:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233442AbjG0JAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 05:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232066AbjG0I7u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 04:59:50 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 623EAA80E
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 01:39:50 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-bc379e4c1cbso601524276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 01:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690447189; x=1691051989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wgN0VjxxpDsrSYHjTuYqCjPAhSfsJO7/sDhzjAuj65w=;
        b=lQLppDxnd0CLjyHkNspslLE9x02vB+VLGLZsLvNG/7nmnjx+mhmbAMEGjAZq8mAfVS
         +wVozFUYZ5FfHvu+gwbsux/UVHMY0Xrqqn0F52nJUseYX3dDHXD4QZZ/SpjK2ejukZMV
         pP7UNL9Avkei+VDFh+08EvwNFsGFlWNWAl2KlUceg5bH7dbhB6rWXVuH5xJz1serjzb0
         SHFbExqZBOu4kVzYvtSh5BgDHAWMkqBCN0IgvlfIC5Zh/l+3wQ5B85O5QxzMfU6ntD+K
         LOcCQkkvfpchl+3oC0rOR0BSQkVWlSUdAAByUm3sIj2V4KQVBKixLxYM+qFdos83yG/m
         ATyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690447189; x=1691051989;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wgN0VjxxpDsrSYHjTuYqCjPAhSfsJO7/sDhzjAuj65w=;
        b=LL+HsocVdpHchHwCUJ4arrtlq8DhJc0acKdZXPVwpxfn/U7r0cKsteRrhRwZr5vByL
         u+pI9pat3aN4jzwXgtIJBPfvQumyaWMNL/4hFf2fgU2v95B8bgcUFd89VFiya6RbHNDa
         /An8GvRWThg4zYcZeEMxMtVyud5lEVUrAlKrlq0r1UNTZ9+Kswz1sW3yCDWC7kAUeY4F
         vWm0RW5216cb6Dl4/akLLmIRBytbHOoGTjLJ+HurnDlzPayYq7ZIoTuoumn+SLS+vwti
         8KGNy1/472Yi5HQC0AFL/dRW6tTeAlFxLRUstuOwsGI0zgFYpDbU3CArai6d0w0ANG7k
         ugbQ==
X-Gm-Message-State: ABy/qLboZbNl4V0SYWxMKHkxjdX/k/w/GNrwiqa1oeW7APAC896gXS+A
        RouRTt2hJWri5FcBxK1og0MoO2xg08UhVCj+CJaUD4U+Aajfxecl
X-Google-Smtp-Source: APBJJlGvck9mQomrNVScrpD2jy2qOkFGXX07oiFGn+n8FgYK+LyWyz1vsVVvtrANKe+MQMHtZws6ni0z0fJ6PKvb1rI=
X-Received: by 2002:a25:9105:0:b0:d12:ab1:d88a with SMTP id
 v5-20020a259105000000b00d120ab1d88amr3922290ybl.40.1690447189498; Thu, 27 Jul
 2023 01:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-6-dmitry.baryshkov@linaro.org> <4e35dabb-640e-8de6-d98a-619b2f80cfb6@quicinc.com>
In-Reply-To: <4e35dabb-640e-8de6-d98a-619b2f80cfb6@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 27 Jul 2023 11:39:38 +0300
Message-ID: <CAA8EJpoYc5M7GpTAUggjDhs+UQ8GcFcW7Y7xNs_zrNNN3Th-7A@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/msm/dpu: use MDSS data for programming SSPP
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
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

On Thu, 27 Jul 2023 at 02:20, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
> > Switch to using data from MDSS driver to program the SSPP fetch and UBWC
> > configuration.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 +++++++++++-------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  7 +++++--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 16 +++++++++++++++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  3 ++-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 ++
> >   6 files changed, 36 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > index cf70a9bd1034..bfd82c2921af 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > @@ -8,6 +8,8 @@
> >   #include "dpu_hw_sspp.h"
> >   #include "dpu_kms.h"
> >
> > +#include "msm_mdss.h"
> > +
> >   #include <drm/drm_file.h>
> >
> >   #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
> > @@ -308,26 +310,26 @@ static void dpu_hw_sspp_setup_format(struct dpu_sw_pipe *pipe,
> >               DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
> >                       DPU_FETCH_CONFIG_RESET_VALUE |
> >                       ctx->ubwc->highest_bank_bit << 18);
>
> Does this needs to be protected with if ctx->ubwc check?

Yes... And it should have been already.

>
> > -             switch (ctx->ubwc->ubwc_version) {
> > -             case DPU_HW_UBWC_VER_10:
> > +             switch (ctx->ubwc->ubwc_enc_version) {
> > +             case UBWC_1_0:
>
> The values of UBWC_x_x dont match the values of DPU_HW_UBWC_VER_xx.
> What was the reason for the catalog to go with DPU_HW_UBWC_VER_xx in the
> catalog for the encoder version in the first place? Because looking at
> the registers UBWC_x_x is the correct value.
>
> If we cannot find the reason why, it should be noted in the commit text
> that the values we are using did change.

Huh? This is just an enum. It isn't a part of uABI, nor it is written
to the hardware.

>
> >                       fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> >                       DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> >                                       fast_clear | (ctx->ubwc->ubwc_swizzle & 0x1) |
> >                                       BIT(8) |
> >                                       (ctx->ubwc->highest_bank_bit << 4));
> >                       break;
> > -             case DPU_HW_UBWC_VER_20:
> > +             case UBWC_2_0:
> >                       fast_clear = fmt->alpha_enable ? BIT(31) : 0;
> >                       DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> >                                       fast_clear | (ctx->ubwc->ubwc_swizzle) |
> >                                       (ctx->ubwc->highest_bank_bit << 4));
> >                       break;
> > -             case DPU_HW_UBWC_VER_30:
> > +             case UBWC_3_0:
> >                       DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> >                                       BIT(30) | (ctx->ubwc->ubwc_swizzle) |
> >                                       (ctx->ubwc->highest_bank_bit << 4));
> >                       break;
> > -             case DPU_HW_UBWC_VER_40:
> > +             case UBWC_4_0:
> >                       DPU_REG_WRITE(c, SSPP_UBWC_STATIC_CTRL,
> >                                       DPU_FORMAT_IS_YUV(fmt) ? 0 : BIT(30));
> >                       break;
> > @@ -793,7 +795,9 @@ static const struct dpu_sspp_cfg *_sspp_offset(enum dpu_sspp sspp,
> >   }
> >
> >   struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
> > -             void __iomem *addr, const struct dpu_mdss_cfg *catalog)
> > +                                  void __iomem *addr,
> > +                                  const struct dpu_mdss_cfg *catalog,
> > +                                  const struct msm_mdss_data *mdss_data)
> >   {
> >       struct dpu_hw_sspp *hw_pipe;
> >       const struct dpu_sspp_cfg *cfg;
> > @@ -813,7 +817,7 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
> >
> >       /* Assign ops */
> >       hw_pipe->catalog = catalog;
> > -     hw_pipe->ubwc = catalog->ubwc;
> > +     hw_pipe->ubwc = mdss_data;
> >       hw_pipe->idx = idx;
> >       hw_pipe->cap = cfg;
> >       _setup_layer_ops(hw_pipe, hw_pipe->cap->features);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > index 74b98b6b3bc3..8d4ae9d24674 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > @@ -351,7 +351,7 @@ struct dpu_hw_sspp {
> >       struct dpu_hw_blk base;
> >       struct dpu_hw_blk_reg_map hw;
> >       const struct dpu_mdss_cfg *catalog;
> > -     const struct dpu_ubwc_cfg *ubwc;
> > +     const struct msm_mdss_data *ubwc;
> >
> >       /* Pipe */
> >       enum dpu_sspp idx;
> > @@ -368,9 +368,12 @@ struct dpu_kms;
> >    * @idx:  Pipe index for which driver object is required
> >    * @addr: Mapped register io address of MDP
> >    * @catalog : Pointer to mdss catalog data
> > + * @mdss_data: UBWC / MDSS configuration data
> >    */
> >   struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
> > -             void __iomem *addr, const struct dpu_mdss_cfg *catalog);
> > +                                  void __iomem *addr,
> > +                                  const struct dpu_mdss_cfg *catalog,
> > +                                  const struct msm_mdss_data *mdss_data);
> >
> >   /**
> >    * dpu_hw_sspp_destroy(): Destroys SSPP driver context
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 0e7a68714e9e..a4293dc0b61b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -22,6 +22,7 @@
> >
> >   #include "msm_drv.h"
> >   #include "msm_mmu.h"
> > +#include "msm_mdss.h"
> >   #include "msm_gem.h"
> >   #include "disp/msm_disp_snapshot.h"
> >
> > @@ -1066,7 +1067,20 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
> >               goto power_error;
> >       }
> >
> > -     rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mmio);
> > +     dpu_kms->mdss = msm_mdss_get_mdss_data(dpu_kms->pdev->dev.parent);
> > +     if (IS_ERR(dpu_kms->mdss)) {
> > +             rc = PTR_ERR(dpu_kms->mdss);
> > +             DPU_ERROR("failed to get MDSS data: %d\n", rc);
> > +             goto power_error;
> > +     }
> > +
> > +     if (!dpu_kms->mdss) {
> > +             rc = -EINVAL;
> > +             DPU_ERROR("NULL MDSS data\n");
> > +             goto power_error;
> > +     }
> > +
> > +     rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mdss, dpu_kms->mmio);
> >       if (rc) {
> >               DPU_ERROR("rm init failed: %d\n", rc);
> >               goto power_error;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > index aca39a4689f4..797b4ff3e806 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > @@ -69,6 +69,7 @@ struct dpu_kms {
> >       struct msm_kms base;
> >       struct drm_device *dev;
> >       const struct dpu_mdss_cfg *catalog;
> > +     const struct msm_mdss_data *mdss;
> >
> >       /* io/register spaces: */
> >       void __iomem *mmio, *vbif[VBIF_MAX], *reg_dma;
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index f4dda88a73f7..9ee493465c4b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -100,6 +100,7 @@ int dpu_rm_destroy(struct dpu_rm *rm)
> >
> >   int dpu_rm_init(struct dpu_rm *rm,
> >               const struct dpu_mdss_cfg *cat,
> > +             const struct msm_mdss_data *mdss_data,
> >               void __iomem *mmio)
> >   {
> >       int rc, i;
> > @@ -268,7 +269,7 @@ int dpu_rm_init(struct dpu_rm *rm,
> >                       continue;
> >               }
> >
> > -             hw = dpu_hw_sspp_init(sspp->id, mmio, cat);
> > +             hw = dpu_hw_sspp_init(sspp->id, mmio, cat, mdss_data);
> >               if (IS_ERR(hw)) {
> >                       rc = PTR_ERR(hw);
> >                       DPU_ERROR("failed sspp object creation: err %d\n", rc);
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > index d62c2edb2460..2b551566cbf4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> > @@ -40,11 +40,13 @@ struct dpu_rm {
> >    *  for all HW blocks.
> >    * @rm: DPU Resource Manager handle
> >    * @cat: Pointer to hardware catalog
> > + * @mdss_data: Pointer to MDSS / UBWC configuration
> >    * @mmio: mapped register io address of MDP
> >    * @Return: 0 on Success otherwise -ERROR
> >    */
> >   int dpu_rm_init(struct dpu_rm *rm,
> >               const struct dpu_mdss_cfg *cat,
> > +             const struct msm_mdss_data *mdss_data,
> >               void __iomem *mmio);
> >
> >   /**



-- 
With best wishes
Dmitry
