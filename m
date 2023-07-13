Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C85D6752CFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jul 2023 00:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232438AbjGMWZs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 18:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbjGMWZs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 18:25:48 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E563B211B
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 15:25:45 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-56598263d1dso890810eaf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 15:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689287145; x=1691879145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yrMgnrOq8YoZ1fyFC4X0GmYtJswdpvDYlmQRdE3Wk8=;
        b=ULr8ROoF3EzlQKdgTM1+tdy5qL4xxCoLrep4q98bPjBMQ4J8vKxsCV0blcN2dxfwvw
         7cTF7EjSB0V26cEDKHVBKh9PkqdVwJ7+358kEu/jCjSjRUtkcuBKkLyA+JYGHdNFg4YI
         OrZPX7sXMayO4LiZelj05x/Dcfnbcxy7MzmdSVqbn3gpz4kVF2p1AXyCA/rYq2mjkmJ1
         SDfjq3QW9MFFQZRLEGf2r193fUeyThuhP9/A+VnAxGeTkZvXjNoqNXdoOW+G26tPGgMe
         QNqroEmGmKc8yd8PMJChFdPfnMISLgdXDJpmZKms49/ZfMbWNE0WttAkrEcNYaTlJQMU
         SBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689287145; x=1691879145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yrMgnrOq8YoZ1fyFC4X0GmYtJswdpvDYlmQRdE3Wk8=;
        b=Ptcde2bRRxQPrBOOpKD2HR3q9y9N9CXGBLBnmk73osEFZub+38T3oXgHliYkTqROUC
         yYXVIM0WfhsI/1Oj/N08nCY2Sean/SdIQjKHx+3jrI5/4bssTuf8iXVqtzessEkQD/ag
         N1Nzt8kcFBtTzawCVjhzeUEN/wuGq8jWfluUBVB8tArVcWhqTN26MuoBsCehvSN9ILNS
         qxC+7FfXJxL67Eob6xOyvpadpLSN9ps5Clqdahg3JdQsvRJ+si3iByqHIvX1TdFCmmhE
         33SjGiZV2O6VFWYPsMf5gU2+12mh0PR0r4KJDVxsFJqDTznSGIU9F7EFdhUarJlIecKc
         B+AA==
X-Gm-Message-State: ABy/qLZKP7LDJjMb7f5MG3q7ZYNi2OcffLmWeM9lPh1e7voobMq0viyp
        MCs7L8X9GIddhXn01AsYj+DfnUrSMr67YPJcd9k=
X-Google-Smtp-Source: APBJJlF4GeNA7uSMYR+ZAhGDVDHH70LHyPYUnTmXGVAhOUnBYa3Enj9DVwAptUEyvE5jOXLOC5Re9jLDhrFxeeZopAs=
X-Received: by 2002:a05:6820:51:b0:566:b483:ee00 with SMTP id
 v17-20020a056820005100b00566b483ee00mr2862635oob.5.1689287145043; Thu, 13 Jul
 2023 15:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com> <20230706211045.204925-6-robdclark@gmail.com>
 <m2r2klrcvgs2qiywx5eetcwwjph6suzjey4hhbon3bhqdsbg7t@lvwdvbhoaqaw>
In-Reply-To: <m2r2klrcvgs2qiywx5eetcwwjph6suzjey4hhbon3bhqdsbg7t@lvwdvbhoaqaw>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 13 Jul 2023 15:25:33 -0700
Message-ID: <CAF6AEGt73GpN=7tdHnsytZM4=WqKXMU2WSHpdkTOxVqi+wH1zA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 05/12] drm/msm/adreno: Use quirk to identify
 cached-coherent support
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 13, 2023 at 1:06=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On Thu, Jul 06, 2023 at 02:10:38PM -0700, Rob Clark wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > It is better to explicitly list it.  With the move to opaque chip-id's
> > for future devices, we should avoid trying to infer things like
> > generation from the numerical value.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 23 +++++++++++++++-------
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
> >  2 files changed, 17 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index f469f951a907..3c531da417b9 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -256,6 +256,7 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >       }, {
> >               .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > @@ -266,6 +267,7 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a615_zap.mdt",
> >               .hwcg =3D a615_hwcg,
> > @@ -278,6 +280,7 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_1M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a630_zap.mdt",
> >               .hwcg =3D a630_hwcg,
> > @@ -290,6 +293,7 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_1M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a640_zap.mdt",
> >               .hwcg =3D a640_hwcg,
> > @@ -302,7 +306,8 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_1M + SZ_128K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                     ADRENO_QUIRK_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a650_zap.mdt",
> >               .hwcg =3D a650_hwcg,
> > @@ -316,7 +321,8 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_1M + SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                     ADRENO_QUIRK_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a660_zap.mdt",
> >               .hwcg =3D a660_hwcg,
> > @@ -329,7 +335,8 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_512K,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                     ADRENO_QUIRK_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> >               .hwcg =3D a660_hwcg,
> >               .address_space_size =3D SZ_16G,
> > @@ -342,6 +349,7 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_2M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a640_zap.mdt",
> >               .hwcg =3D a640_hwcg,
> > @@ -353,7 +361,8 @@ static const struct adreno_info gpulist[] =3D {
> >               },
> >               .gmem =3D SZ_4M,
> >               .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > -             .quirks =3D ADRENO_QUIRK_HAS_HW_APRIV,
> > +             .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT |
> > +                     ADRENO_QUIRK_HAS_HW_APRIV,
> >               .init =3D a6xx_gpu_init,
> >               .zapfw =3D "a690_zap.mdt",
> >               .hwcg =3D a690_hwcg,
> > @@ -565,9 +574,9 @@ static int adreno_bind(struct device *dev, struct d=
evice *master, void *data)
> >       if (ret)
> >               return ret;
> >
> > -     if (config.rev.core >=3D 6)
> > -             if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
> > -                     priv->has_cached_coherent =3D true;
> > +     priv->has_cached_coherent =3D
> > +             !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
> > +             !adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
> >
> >       return 0;
> >  }
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index a7c4a2c536e3..e08d41337169 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -33,6 +33,7 @@ enum {
> >  #define ADRENO_QUIRK_FAULT_DETECT_MASK               BIT(1)
> >  #define ADRENO_QUIRK_LMLOADKILL_DISABLE              BIT(2)
> >  #define ADRENO_QUIRK_HAS_HW_APRIV            BIT(3)
> > +#define ADRENO_QUIRK_HAS_CACHED_COHERENT     BIT(4)
> a shorter ADRENO_IS_IOCOHERENT?

I prefer "HAS" to "IS".. maybe it is just me but "IS" sounds to me
like all dma is coherent, while in fact gpu mappings can be either
coherent or not.

I suppose it could be "HAS_IOCOHERENT" but we do use "CACHED_COHERENT"
elsewhere.

BR,
-R

>
> -Akhil
>
> >
> >  struct adreno_rev {
> >       uint8_t  core;
> > --
> > 2.41.0
> >
