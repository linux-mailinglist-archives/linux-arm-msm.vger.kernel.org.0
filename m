Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0877A6E8AE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 09:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjDTHHE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 03:07:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233926AbjDTHG5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 03:06:57 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D57049DF
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:06:56 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id dm2so4076374ejc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1681974415; x=1684566415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yb+yljt2qIh9YQj49hF4nCFbxARaf3XxP/2JpjBX4jk=;
        b=cZv/lPvpV7dzsklh5rJGSX/ctisD8YiKx4V2vuazNVRvycMDy2qY+JLXTxg9c8+GJB
         +p3GNccB/ffnSbUDxbMBcHRlsz/75SteAFuszpd9IGhEgV22AXdgPE0Q2Dk6z7RcVo94
         a618EgQpnQwii3jZshBVWOWOdDri9NiCMe3aT7AVQd4oIk5d3uLJnsTAXROcwEnsObAM
         Aa9SEKipB4kAaMvB/Ae7RXViYuxL1FbX7ern7o+EEXqL3bwwifuqPKpUSRsRU50abWw3
         xR0p39vKIcQL+tvpB3gRGx5iEUI1g/0/HFHJu62xP+PFTv/S0cPe02LokMdtufHwr+1Y
         extw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681974415; x=1684566415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yb+yljt2qIh9YQj49hF4nCFbxARaf3XxP/2JpjBX4jk=;
        b=UnDNEZkwFObE7g68y2z+feTsfz5CguLjkTdsjIkl+0jjQJTAkLqiV/40COuS24oZNB
         vSUM9qr9icoNMPpBYZshYSH+PQtUjnZ6KtJ4XX7l3i2ZsD65JCo9Roh253dWaW0Hrx4t
         VH7kuFHB7Ks44Z2FjAyi/OBFr4b6Ibj+kNlblUkKSpIkRCKK7oRRb9MYXVKXqZiiudoG
         w7jJcGCBq0nGp4ie0zqEdlfhrUHkPgQdoiiOelV2e4dWkIdTkuJpuahxI4b8S5uBab7b
         CFHPNt4EDH9g9/7Q8ag7tYzU5MoG8wyeE0yAdPP2J8Yu90f9ig1ENr87dQForVwU6XnX
         VjEQ==
X-Gm-Message-State: AAQBX9cUthJHFpU4TsHhHhNENEhuA1Ra+TSyi8Fy6zXqUGnYw2Ft/CQZ
        JiQR1NBB463I+/oRAkFdFnYwKCaLXYaS1BEyk2ZX
X-Google-Smtp-Source: AKy350a5nbAxpFRAe8GKYzKKw51dSoWmIC63OMzKer/o/NVstK/cdXnM4cTddEa7E1kqrQjHI9VhKy2gMGrrbDH4EuI=
X-Received: by 2002:a17:907:980a:b0:94f:c1f:6d09 with SMTP id
 ji10-20020a170907980a00b0094f0c1f6d09mr212498ejc.7.1681974414824; Thu, 20 Apr
 2023 00:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230419-dpu-tweaks-v1-0-d1bac46db075@freebox.fr>
 <20230419-dpu-tweaks-v1-7-d1bac46db075@freebox.fr> <405ff057-e4da-3f2f-b860-ce2eeacaab94@linaro.org>
In-Reply-To: <405ff057-e4da-3f2f-b860-ce2eeacaab94@linaro.org>
From:   Arnaud Vrac <avrac@freebox.fr>
Date:   Thu, 20 Apr 2023 09:06:44 +0200
Message-ID: <CAG9NU68aLLZ0KGNmsirzm5RtGw6CC_i=+kTwyfhy+bjSkRTO4Q@mail.gmail.com>
Subject: Re: [PATCH 07/11] drm/msm/dpu: add sspp cursor blocks to msm8998 hw catalog
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Le jeu. 20 avr. 2023 =C3=A0 01:10, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> a =C3=A9crit :
>
> On 19/04/2023 17:41, Arnaud Vrac wrote:
> > Now that cursor sspp blocks can be used for cursor planes, enable them
> > on msm8998. The dma sspp blocks that were assigned to cursor planes can
> > now be used for overlay planes instead.
>
> While the change is correct, there is more about it. Composers, using
> universal planes, will see this plane too. They have no obligations to
> use it only for the cursor. At the minimum could you please extend the
> plane_atomic_check to check for the plane dimensions for the CURSOR pipes=
?

Hum, I had assumed the generic atomic checks would already do this,
but it's not the case. I'll add the check when the pipe is of type
SSPP_CURSOR in another patch coming before, thanks.

>
> For this change:
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> >
> > Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> > ---
> >   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  8 +++--
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 34 +++++++++++++=
+++++++++
> >   2 files changed, 40 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/=
drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > index b07e8a9941f79..7de393b0f91d7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> > @@ -90,10 +90,14 @@ static const struct dpu_sspp_cfg msm8998_sspp[] =3D=
 {
> >               sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> >       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1ac, DMA_MSM8998_MASK,
> >               sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> > -     SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1ac, DMA_CURSOR_MSM8998=
_MASK,
> > +     SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1ac, DMA_MSM8998_MASK,
> >               sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> > -     SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1ac, DMA_CURSOR_MSM8998=
_MASK,
> > +     SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1ac, DMA_MSM8998_MASK,
> >               sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> > +     SSPP_BLK("sspp_12", SSPP_CURSOR0, 0x34000, 0x1ac, DMA_CURSOR_MSM8=
998_MASK,
> > +             msm8998_cursor_sblk_0, 2, SSPP_TYPE_CURSOR, DPU_CLK_CTRL_=
CURSOR0),
> > +     SSPP_BLK("sspp_13", SSPP_CURSOR1, 0x36000, 0x1ac, DMA_CURSOR_MSM8=
998_MASK,
> > +             msm8998_cursor_sblk_1, 10, SSPP_TYPE_CURSOR, DPU_CLK_CTRL=
_CURSOR1),
> >   };
> >
> >   static const struct dpu_lm_cfg msm8998_lm[] =3D {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/g=
pu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > index 8d5d782a43398..f34fa704936bc 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> > @@ -242,6 +242,22 @@ static const uint32_t wb2_formats[] =3D {
> >       DRM_FORMAT_XBGR4444,
> >   };
> >
> > +static const uint32_t cursor_formats[] =3D {
> > +     DRM_FORMAT_ARGB8888,
> > +     DRM_FORMAT_ABGR8888,
> > +     DRM_FORMAT_RGBA8888,
> > +     DRM_FORMAT_BGRA8888,
> > +     DRM_FORMAT_XRGB8888,
> > +     DRM_FORMAT_ARGB1555,
> > +     DRM_FORMAT_ABGR1555,
> > +     DRM_FORMAT_RGBA5551,
> > +     DRM_FORMAT_BGRA5551,
> > +     DRM_FORMAT_ARGB4444,
> > +     DRM_FORMAT_ABGR4444,
> > +     DRM_FORMAT_RGBA4444,
> > +     DRM_FORMAT_BGRA4444,
> > +};
> > +
> >   /*************************************************************
> >    * SSPP sub blocks config
> >    *************************************************************/
> > @@ -300,6 +316,19 @@ static const uint32_t wb2_formats[] =3D {
> >       .virt_num_formats =3D ARRAY_SIZE(plane_formats), \
> >       }
> >
> > +#define _CURSOR_SBLK(num) \
> > +     { \
> > +     .maxdwnscale =3D SSPP_UNITY_SCALE, \
> > +     .maxupscale =3D SSPP_UNITY_SCALE, \
> > +     .smart_dma_priority =3D 0, \
> > +     .src_blk =3D {.name =3D STRCAT("sspp_src_", num), \
> > +             .id =3D DPU_SSPP_SRC, .base =3D 0x00, .len =3D 0x150,}, \
> > +     .format_list =3D cursor_formats, \
> > +     .num_formats =3D ARRAY_SIZE(cursor_formats), \
> > +     .virt_format_list =3D cursor_formats, \
> > +     .virt_num_formats =3D ARRAY_SIZE(cursor_formats), \
> > +     }
> > +
> >   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_0 =3D
> >                               _VIG_SBLK("0", 0, DPU_SSPP_SCALER_QSEED3)=
;
> >   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_1 =3D
> > @@ -309,6 +338,11 @@ static const struct dpu_sspp_sub_blks msm8998_vig_=
sblk_2 =3D
> >   static const struct dpu_sspp_sub_blks msm8998_vig_sblk_3 =3D
> >                               _VIG_SBLK("3", 0, DPU_SSPP_SCALER_QSEED3)=
;
> >
> > +static const struct dpu_sspp_sub_blks msm8998_cursor_sblk_0 =3D
> > +                             _CURSOR_SBLK("12");
> > +static const struct dpu_sspp_sub_blks msm8998_cursor_sblk_1 =3D
> > +                             _CURSOR_SBLK("13");
> > +
> >   static const struct dpu_rotation_cfg dpu_rot_sc7280_cfg_v2 =3D {
> >       .rot_maxheight =3D 1088,
> >       .rot_num_formats =3D ARRAY_SIZE(rotation_v2_formats),
> >
>
> --
> With best wishes
> Dmitry
>
