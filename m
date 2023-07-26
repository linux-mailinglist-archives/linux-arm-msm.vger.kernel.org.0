Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6535A764246
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 00:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjGZWxb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 18:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjGZWxa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 18:53:30 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B57E271B
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 15:53:28 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5222c5d71b8so337402a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 15:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690412007; x=1691016807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmsccF+7VAmjozdohJ3YAw4vJUXuNsVRwLC2fDydgEU=;
        b=FlsIhRLBaH0AJoMHBdsZYH4APmXteUQ0aeziVyoDnVf9i8UUa8H/y1+YwPcyx5MMqe
         h3JuId/ovFeelW5eiVNSpdKLmJXtEFHnut6t7Al6dMDNZP5ZC6zK8hUIqvZjML5C59Pa
         TR3gRqtw/BxChT/mzgWh8Oh98GK8wcrePYLxFNG6KxF8G7gF7cFZc/o65FbDfoLNGVd5
         ARaX/jyINtH0bix4jitPvkeTL6w1/s1zfODGk1B3cQIiywj7391NceoUi/Q3t4yDKo2O
         4xuj86meYHA/YRDwGh7dZl0ShzUUbEpF8MFbR7G86blymj7yzpn4FnrIhlleT4h2nwgg
         NrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690412007; x=1691016807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MmsccF+7VAmjozdohJ3YAw4vJUXuNsVRwLC2fDydgEU=;
        b=lLSa7oCbvdcYePYSkY4qlOQXjfezVqQP+SYdau5rhYX+ybR/U1M7JGd2Xunb0qXc8K
         oYOuBrMBvkaKultWlk88wwI2pJj3oJfxquRWWuqW3xaMFZdQW65FfPBW7S3BFGNRj9kK
         307Zc0Ekrcbg0EGaJtLW0i6/RnmmEt0uETWWXRMeEDGypOolY7pFhoTh5gkKbBy8Phfg
         fCP9fUfve1Mc5TFl7bWft6ui1+f46crhDczPAzVIRz1TO7OonIFEa43D6H7MS0JVXX+2
         UDUFVQizjSIkxquAkUr1WLOXLkXJ6qH5YkB1Xw7WuCnGb4f19bJHOl0fS9fGgoiZ4/po
         VyAA==
X-Gm-Message-State: ABy/qLZvhO81AvbhZkxFyH3MK2ttJIn7SFphNXUu21qHsuhwrYg2Xulo
        ecLPbIdX3+NsGy4D0DQwTqXxNyPLRB1+V77maNc=
X-Google-Smtp-Source: APBJJlENtj1Z1HRIps5MjnxPrjt85WXeDNBaJ0ZE2Wzv7t7s9HbSYpQAxR5XrBSC/7R2qPS2HOkMpbbLm6aUl17hWcA=
X-Received: by 2002:aa7:dd0f:0:b0:522:7c12:8092 with SMTP id
 i15-20020aa7dd0f000000b005227c128092mr358495edv.2.1690412006494; Wed, 26 Jul
 2023 15:53:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com> <20230706211045.204925-7-robdclark@gmail.com>
 <ccbe9ed4-7def-b0d1-2d1c-e2550d212943@linaro.org> <fpwpc7oyxzbfndojr2o2rkv2i66is4ylrtxh4equms7eyu4afc@cwyfgqanhlbo>
 <CAF6AEGt+qnUBAq3CHS4eTO1YQsbLjj3Urtt2LuSwRJ7XpzPBww@mail.gmail.com>
 <CAA8EJppJNrcXp8yswDycqA5HuK6bDCKrAkT4ttkGJvsWqD_YMg@mail.gmail.com>
 <CAF6AEGtLcwKRCMGgLAuABEbSR1CeYKF+D=ffsQLRo-f1BiprbA@mail.gmail.com>
 <f58998c9-82d3-d2fe-6f1c-801e616467be@linaro.org> <CAF6AEGu4_9kWyHCV0TOOU0vCqLBmrtEZDm9fAeMHNeDei7K8aQ@mail.gmail.com>
 <CAA8EJpr7Ed3ZBXfFxPV4u0t5obsP8yL5h3vwPMZSHjAMDQaA9w@mail.gmail.com>
In-Reply-To: <CAA8EJpr7Ed3ZBXfFxPV4u0t5obsP8yL5h3vwPMZSHjAMDQaA9w@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 26 Jul 2023 15:53:14 -0700
Message-ID: <CAF6AEGsHw2pkROZoBf=ucMUyk5B_nudHLM0hOJiJbYcawTFNdA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 06/12] drm/msm/adreno: Allow SoC specific gpu
 device table entries
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        dri-devel@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 26, 2023 at 3:33=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 27 Jul 2023 at 01:04, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Wed, Jul 26, 2023 at 2:43=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On 26/07/2023 23:11, Rob Clark wrote:
> > > > On Wed, Jul 26, 2023 at 1:00=E2=80=AFPM Dmitry Baryshkov
> > > > <dmitry.baryshkov@linaro.org> wrote:
> > > >>
> > > >> On Wed, 26 Jul 2023 at 21:28, Rob Clark <robdclark@gmail.com> wrot=
e:
> > > >>>
> > > >>> On Thu, Jul 13, 2023 at 1:26=E2=80=AFPM Akhil P Oommen <quic_akhi=
lpo@quicinc.com> wrote:
> > > >>>>
> > > >>>> On Fri, Jul 07, 2023 at 05:34:04AM +0300, Dmitry Baryshkov wrote=
:
> > > >>>>>
> > > >>>>> On 07/07/2023 00:10, Rob Clark wrote:
> > > >>>>>> From: Rob Clark <robdclark@chromium.org>
> > > >>>>>>
> > > >>>>>> There are cases where there are differences due to SoC integra=
tion.
> > > >>>>>> Such as cache-coherency support, and (in the next patch) e-fus=
e to
> > > >>>>>> speedbin mappings.
> > > >>>>>
> > > >>>>> I have the feeling that we are trying to circumvent the way DT =
works. I'd
> > > >>>>> suggest adding explicit SoC-compatible strings to Adreno bindin=
gs and then
> > > >>>>> using of_device_id::data and then of_device_get_match_data().
> > > >>>>>
> > > >>>> Just thinking, then how about a unique compatible string which w=
e match
> > > >>>> to identify gpu->info and drop chip-id check completely here?
> > > >>>
> > > >>> Ok, I think we could do this, so something like:
> > > >>>
> > > >>>    compatible =3D "qcom,sm4350-adreno-619.0", qcom,adreno-619.0",=
 "qcom,adreno"
> > > >>>
> > > >>> ?
> > > >>>
> > > >>> It looks like we don't have gpu dt bits upstream yet for either s=
m4350
> > > >>> or sm6375, so I suppose we could get away with this change
> > > >>
> > > >> I think we can even skip the 619.0 part in the SoC compat string.
> > > >> So it will be:
> > > >>
> > > >> compatible =3D "qcom,sm4350-adreno", qcom,adreno-619.0", "qcom,adr=
eno";
> > > >>
> > > >> In future we can drop the chipid part completely and handle that a=
s a
> > > >> part of SoC data:
> > > >>
> > > >> compatible =3D "qcom,sm4350-adreno", "qcom,adreno";
> > > >>
> > > >> With the driver knowing that sm4350-adreno means ADRENO_ID(6,1,9,0=
)
> > > >>
> > > >
> > > > I don't think we can do that, there are cases where the same SoC ha=
d
> > > > multiple revisions of adreno.
> > >
> > > Is that the case for the production versions of the SoC? In other
> > > subsystems what we usually do is that we add support only for the lat=
est
> > > SoC revision (which would probably mean the latest GPU patch revision=
).
> > > Previous GPU revisions can be added in the following way (pure exampl=
e):
> > >
> > > qcom,sm4350-adreno -> 6,1,9,1 // assuming v2.0 or v1.1 is the commerc=
ial
> > > sample
> > > qcom,sm4350-v1-adreno -> 6,1,9,0
> > >
> >
> > My recollection was that nexus4 shipped with an early version of 8064
> > which needed userspace workarounds that later 8064 did not.  Not sure
> > if that is the only such example, but it is one that userspace needed
> > to be aware of.
>
> Good question. I don't have nexus4, and both nexus7 and ifc6410 work fine=
.
>
> And this is a perfect use case for "qcom,apq8064-v1.1-adreno" compat stri=
ng.

I no longer have a n4 that boots.. but if I did both it and the later
ones should work properly if they expose the appropriate chip id

I do still prefer parsing the chip-id out of the compatible.  It
avoids needing separate table entries just to have a different
chip-id.  Maybe the scheme that is used elsewhere makes sense when it
is only the kernel that needs to be aware of the device-id.  And maybe
we could just done matching based on compat-id in userspace as well,
but (a) msm and freedreno pre-date dt, and (b) that ship has already
sailed.

BR,
-R

> >
> > Anyways, future things, it sounds like we'll be able to read the id
> > from the hw/fw.  I'm not really a fan of breaking dtb fwd/bk compat,
> > so I don't want to change any of the existing compat strings.
>
> I think so too. Current compat strings should stay.
>
> >
> > BR,
> > -R
> >
> > > >  We could possibly do that with future
> > > > things where we can read the chip-id from fw.
> > > >
> > > > What we _could_ do at the expense of making the compatible parsing =
a
> > > > tiny bit more complex is something like:
> > > >
> > > >     compatible =3D "qcom,sm4350-adreno-619.0", "qcom,adreno"
> > > >
> > > > BR,
> > > > -R
> > > >
> > > >>>
> > > >>> BR,
> > > >>> -R
> > > >>>
> > > >>>> -Akhil
> > > >>>>
> > > >>>>>>
> > > >>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > >>>>>> ---
> > > >>>>>>    drivers/gpu/drm/msm/adreno/adreno_device.c | 34 +++++++++++=
++++++++---
> > > >>>>>>    drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
> > > >>>>>>    2 files changed, 31 insertions(+), 4 deletions(-)
> > > >>>>>>
> > > >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/driv=
ers/gpu/drm/msm/adreno/adreno_device.c
> > > >>>>>> index 3c531da417b9..e62bc895a31f 100644
> > > >>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > >>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > >>>>>> @@ -258,6 +258,32 @@ static const struct adreno_info gpulist[]=
 =3D {
> > > >>>>>>              .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > > >>>>>>              .quirks =3D ADRENO_QUIRK_HAS_CACHED_COHERENT,
> > > >>>>>>              .init =3D a6xx_gpu_init,
> > > >>>>>> +   }, {
> > > >>>>>> +           .machine =3D "qcom,sm4350",
> > > >>>>>> +           .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > > >>>>>> +           .revn =3D 619,
> > > >>>>>> +           .fw =3D {
> > > >>>>>> +                   [ADRENO_FW_SQE] =3D "a630_sqe.fw",
> > > >>>>>> +                   [ADRENO_FW_GMU] =3D "a619_gmu.bin",
> > > >>>>>> +           },
> > > >>>>>> +           .gmem =3D SZ_512K,
> > > >>>>>> +           .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > > >>>>>> +           .init =3D a6xx_gpu_init,
> > > >>>>>> +           .zapfw =3D "a615_zap.mdt",
> > > >>>>>> +           .hwcg =3D a615_hwcg,
> > > >>>>>> +   }, {
> > > >>>>>> +           .machine =3D "qcom,sm6375",
> > > >>>>>> +           .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > > >>>>>> +           .revn =3D 619,
> > > >>>>>> +           .fw =3D {
> > > >>>>>> +                   [ADRENO_FW_SQE] =3D "a630_sqe.fw",
> > > >>>>>> +                   [ADRENO_FW_GMU] =3D "a619_gmu.bin",
> > > >>>>>> +           },
> > > >>>>>> +           .gmem =3D SZ_512K,
> > > >>>>>> +           .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> > > >>>>>> +           .init =3D a6xx_gpu_init,
> > > >>>>>> +           .zapfw =3D "a615_zap.mdt",
> > > >>>>>> +           .hwcg =3D a615_hwcg,
> > > >>>>>>      }, {
> > > >>>>>>              .rev =3D ADRENO_REV(6, 1, 9, ANY_ID),
> > > >>>>>>              .revn =3D 619,
> > > >>>>>> @@ -409,6 +435,8 @@ const struct adreno_info *adreno_info(stru=
ct adreno_rev rev)
> > > >>>>>>      /* identify gpu: */
> > > >>>>>>      for (i =3D 0; i < ARRAY_SIZE(gpulist); i++) {
> > > >>>>>>              const struct adreno_info *info =3D &gpulist[i];
> > > >>>>>> +           if (info->machine && !of_machine_is_compatible(inf=
o->machine))
> > > >>>>>> +                   continue;
> > > >>>>>>              if (adreno_cmp_rev(info->rev, rev))
> > > >>>>>>                      return info;
> > > >>>>>>      }
> > > >>>>>> @@ -563,6 +591,8 @@ static int adreno_bind(struct device *dev,=
 struct device *master, void *data)
> > > >>>>>>              config.rev.minor, config.rev.patchid);
> > > >>>>>>      priv->is_a2xx =3D config.rev.core =3D=3D 2;
> > > >>>>>> +   priv->has_cached_coherent =3D
> > > >>>>>> +           !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT=
);
> > > >>>>>>      gpu =3D info->init(drm);
> > > >>>>>>      if (IS_ERR(gpu)) {
> > > >>>>>> @@ -574,10 +604,6 @@ static int adreno_bind(struct device *dev=
, struct device *master, void *data)
> > > >>>>>>      if (ret)
> > > >>>>>>              return ret;
> > > >>>>>> -   priv->has_cached_coherent =3D
> > > >>>>>> -           !!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT=
) &&
> > > >>>>>> -           !adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
> > > >>>>>> -
> > > >>>>>>      return 0;
> > > >>>>>>    }
> > > >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers=
/gpu/drm/msm/adreno/adreno_gpu.h
> > > >>>>>> index e08d41337169..d5335b99c64c 100644
> > > >>>>>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > >>>>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > >>>>>> @@ -61,6 +61,7 @@ extern const struct adreno_reglist a612_hwcg=
[], a615_hwcg[], a630_hwcg[], a640_h
> > > >>>>>>    extern const struct adreno_reglist a660_hwcg[], a690_hwcg[]=
;
> > > >>>>>>    struct adreno_info {
> > > >>>>>> +   const char *machine;
> > > >>>>>>      struct adreno_rev rev;
> > > >>>>>>      uint32_t revn;
> > > >>>>>>      const char *fw[ADRENO_FW_MAX];
> > > >>>>>
> > > >>>>> --
> > > >>>>> With best wishes
> > > >>>>> Dmitry
> > > >>>>>
> > > >>
> > > >>
> > > >>
> > > >> --
> > > >> With best wishes
> > > >> Dmitry
> > >
> > > --
> > > With best wishes
> > > Dmitry
> > >
>
>
>
> --
> With best wishes
> Dmitry
