Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC3D8765672
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 16:53:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbjG0OxS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 10:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232860AbjG0OxD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 10:53:03 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DAAF2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 07:53:01 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fe1489ced6so1875071e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 07:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690469580; x=1691074380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LnuWe64Q9tNi3Qqtc8m9M3hlzrjQ54xWguqRqN4jFE=;
        b=aEMRtXr+NhZdiVletlCheu9CmFOhmGyuwWZJiRAIc4m+VuPrpuY6ZjbRI6/EST3kwM
         4wkmO3hX259eOekJgwvZ0p0wHf5UChUUh2HujZG2jmVx2O3b21z7XyInLBnLOgF6E8mq
         onewKDssa6LlAt/Z78DCeIIbtLqY+9amyoqAb3nWu7gwsOHNQFLxQalNcqayArMaAadq
         dHsKmcV+coIN9iP4DE1YEN1yvyNq9sKNA+VLRlElBlbideTPTbayaJa6urj/rUD5UFq0
         j+Ys8Ll08LfL8VzU6fRBXfQhH+EwcA8hlv60l6JCNRmBmfnJbpk3VE8FMo72ibbVpiZz
         8QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690469580; x=1691074380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LnuWe64Q9tNi3Qqtc8m9M3hlzrjQ54xWguqRqN4jFE=;
        b=T6tlz+gFxcSUzJSkxTU2j8NfWVBVb5wOt5AcK5fzKcaIWFpU2+MpSkJjDam9NS9o6q
         ZzRBehX2urL2ZDQhH0Q+sfMEQXG/IXysUNUN4QN2xh6LmNVxaZ4omm0IRA1sQehpo4g1
         WPb4qxUP/Md8aUxnJRusrH5WAPzXKNhiB6GzSnBIqpo0cjVP63FcMbwoUEiBmN9vqVI8
         8O9GOj34cTKDFZy4TN3ZKG38KydFRT5mBAkQGAx3ZK/Mhd5jFWQXyXmNTyGkH5ySfZkD
         Hv3gdj/mQ04htgApMSEcMyLusKf6a2NfFDrn0Vg2zZBAp6wyRpTkA41er9751RwR+dya
         pYUw==
X-Gm-Message-State: ABy/qLaiJWgd8/v/oazHzetB4V/QN+xyhYd6GJqWUUrVyuAcCaZjNw+L
        p+iDm6Mrx+bc+njoDoNTaYT11ctvoYBYQStFPEBPDFBn
X-Google-Smtp-Source: APBJJlHWgDkt2GQ967pc0GBsJbfPJiidk45qBVH6tPB2o3LQqT9/D9ifhqG1Rtg09T1mGjLPwZNphDxTCkwjvme8YW4=
X-Received: by 2002:a19:d61a:0:b0:4f8:6a29:b59b with SMTP id
 n26-20020a19d61a000000b004f86a29b59bmr1726759lfg.64.1690469579986; Thu, 27
 Jul 2023 07:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com> <20230706211045.204925-7-robdclark@gmail.com>
 <ccbe9ed4-7def-b0d1-2d1c-e2550d212943@linaro.org> <fpwpc7oyxzbfndojr2o2rkv2i66is4ylrtxh4equms7eyu4afc@cwyfgqanhlbo>
 <CAF6AEGt+qnUBAq3CHS4eTO1YQsbLjj3Urtt2LuSwRJ7XpzPBww@mail.gmail.com>
 <CAA8EJppJNrcXp8yswDycqA5HuK6bDCKrAkT4ttkGJvsWqD_YMg@mail.gmail.com>
 <CAF6AEGtLcwKRCMGgLAuABEbSR1CeYKF+D=ffsQLRo-f1BiprbA@mail.gmail.com>
 <f58998c9-82d3-d2fe-6f1c-801e616467be@linaro.org> <CAF6AEGu4_9kWyHCV0TOOU0vCqLBmrtEZDm9fAeMHNeDei7K8aQ@mail.gmail.com>
 <CAA8EJpr7Ed3ZBXfFxPV4u0t5obsP8yL5h3vwPMZSHjAMDQaA9w@mail.gmail.com>
 <CAF6AEGsHw2pkROZoBf=ucMUyk5B_nudHLM0hOJiJbYcawTFNdA@mail.gmail.com> <111f5e38-6f6a-33bc-d17c-c85ae4a57aa8@linaro.org>
In-Reply-To: <111f5e38-6f6a-33bc-d17c-c85ae4a57aa8@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 27 Jul 2023 07:52:48 -0700
Message-ID: <CAF6AEGuN2D9EdO1JAneF1PqboQ6VGJgHviRyccmY71kUN9oZsg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 06/12] drm/msm/adreno: Allow SoC specific gpu
 device table entries
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
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

On Thu, Jul 27, 2023 at 12:51=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linar=
o.org> wrote:
>
> On 27.07.2023 00:53, Rob Clark wrote:
> > On Wed, Jul 26, 2023 at 3:33=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On Thu, 27 Jul 2023 at 01:04, Rob Clark <robdclark@gmail.com> wrote:
> >>>
> >>> On Wed, Jul 26, 2023 at 2:43=E2=80=AFPM Dmitry Baryshkov
> >>> <dmitry.baryshkov@linaro.org> wrote:
> >>>>
> >>>> On 26/07/2023 23:11, Rob Clark wrote:
> >>>>> On Wed, Jul 26, 2023 at 1:00=E2=80=AFPM Dmitry Baryshkov
> >>>>> <dmitry.baryshkov@linaro.org> wrote:
> >>>>>>
> >>>>>> On Wed, 26 Jul 2023 at 21:28, Rob Clark <robdclark@gmail.com> wrot=
e:
> >>>>>>>
> >>>>>>> On Thu, Jul 13, 2023 at 1:26=E2=80=AFPM Akhil P Oommen <quic_akhi=
lpo@quicinc.com> wrote:
> >>>>>>>>
> >>>>>>>> On Fri, Jul 07, 2023 at 05:34:04AM +0300, Dmitry Baryshkov wrote=
:
> >>>>>>>>>
> >>>>>>>>> On 07/07/2023 00:10, Rob Clark wrote:
> >>>>>>>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>>>>>>
> >>>>>>>>>> There are cases where there are differences due to SoC integra=
tion.
> >>>>>>>>>> Such as cache-coherency support, and (in the next patch) e-fus=
e to
> >>>>>>>>>> speedbin mappings.
> >>>>>>>>>
> >>>>>>>>> I have the feeling that we are trying to circumvent the way DT =
works. I'd
> >>>>>>>>> suggest adding explicit SoC-compatible strings to Adreno bindin=
gs and then
> >>>>>>>>> using of_device_id::data and then of_device_get_match_data().
> >>>>>>>>>
> >>>>>>>> Just thinking, then how about a unique compatible string which w=
e match
> >>>>>>>> to identify gpu->info and drop chip-id check completely here?
> >>>>>>>
> >>>>>>> Ok, I think we could do this, so something like:
> >>>>>>>
> >>>>>>>    compatible =3D "qcom,sm4350-adreno-619.0", qcom,adreno-619.0",=
 "qcom,adreno"
> >>>>>>>
> >>>>>>> ?
> >>>>>>>
> >>>>>>> It looks like we don't have gpu dt bits upstream yet for either s=
m4350
> >>>>>>> or sm6375, so I suppose we could get away with this change
> >>>>>>
> >>>>>> I think we can even skip the 619.0 part in the SoC compat string.
> >>>>>> So it will be:
> >>>>>>
> >>>>>> compatible =3D "qcom,sm4350-adreno", qcom,adreno-619.0", "qcom,adr=
eno";
> >>>>>>
> >>>>>> In future we can drop the chipid part completely and handle that a=
s a
> >>>>>> part of SoC data:
> >>>>>>
> >>>>>> compatible =3D "qcom,sm4350-adreno", "qcom,adreno";
> >>>>>>
> >>>>>> With the driver knowing that sm4350-adreno means ADRENO_ID(6,1,9,0=
)
> >>>>>>
> >>>>>
> >>>>> I don't think we can do that, there are cases where the same SoC ha=
d
> >>>>> multiple revisions of adreno.
> >>>>
> >>>> Is that the case for the production versions of the SoC? In other
> >>>> subsystems what we usually do is that we add support only for the la=
test
> >>>> SoC revision (which would probably mean the latest GPU patch revisio=
n).
> >>>> Previous GPU revisions can be added in the following way (pure examp=
le):
> >>>>
> >>>> qcom,sm4350-adreno -> 6,1,9,1 // assuming v2.0 or v1.1 is the commer=
cial
> >>>> sample
> >>>> qcom,sm4350-v1-adreno -> 6,1,9,0
> >>>>
> >>>
> >>> My recollection was that nexus4 shipped with an early version of 8064
> >>> which needed userspace workarounds that later 8064 did not.  Not sure
> >>> if that is the only such example, but it is one that userspace needed
> >>> to be aware of.
> >>
> >> Good question. I don't have nexus4, and both nexus7 and ifc6410 work f=
ine.
> >>
> >> And this is a perfect use case for "qcom,apq8064-v1.1-adreno" compat s=
tring.
> >
> > I no longer have a n4 that boots.. but if I did both it and the later
> > ones should work properly if they expose the appropriate chip id
> >
> > I do still prefer parsing the chip-id out of the compatible.  It
> > avoids needing separate table entries just to have a different
> > chip-id.  Maybe the scheme that is used elsewhere makes sense when it
> > is only the kernel that needs to be aware of the device-id.  And maybe
> > we could just done matching based on compat-id in userspace as well,
> > but (a) msm and freedreno pre-date dt, and (b) that ship has already
> > sailed.
> I think a per-soc dt would be the better approach..

The newer rev of apq8064 would need its own dt w/ compatible override
in either case.  But if we continue with the current scheme parsing
the compatible, we don't need an extra gpu table entry for it.

BR,
-R

> We could probably solve the revision issue with a socid readout of
> the silicon revision and override based on that?
>
> Konrad
>
