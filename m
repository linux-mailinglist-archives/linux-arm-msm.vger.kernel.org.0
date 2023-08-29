Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7BEF78C78D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 16:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236776AbjH2Oak (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 10:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236928AbjH2OaP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 10:30:15 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9195F12D
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 07:30:12 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-794cd987ea6so75103839f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693319412; x=1693924212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Li72CkXM16Ln9NW3SPhtKIIZifBFJt90AY2kX9Azf5I=;
        b=Jnx5M6bNanT9jKvTXo4B/6KQpx9DZGN/gL7USk9V2Ephg9WkVe/1pFuSAazCAfH4e2
         0t0dko42o9F6+nunniwbsMLZuJQ+suy0fNN/rsUQ7Sdx2sL4sD3DIa5z1aPkhYUuF9UP
         /OX1yZx2v9YktyZDjlcJK+iG0ONrHuZ3J6a88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693319412; x=1693924212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Li72CkXM16Ln9NW3SPhtKIIZifBFJt90AY2kX9Azf5I=;
        b=R0cZUn+mRiGOwqQSaj78qdnFG9/OopjTJ/vgGOBaUu9FdM1jxWqsfDLBByLgE2cF5w
         y73hgBTHrSjNFfIDmfSlGBosSQvDta89S2XIPMGw84migjAF+LLBVhE8g8pJ5w5WsejN
         cUPUPhZft7Kd4fHt3Ts7wqIrZX12ZUut4e6ZCWGjZraE78Dh7C31hbipvQ9NVqNJKKWS
         q4vx1bUnp/W6+FvbZPuoo6aNoKwLPtfSsGzKhTdrcKvSkuPH9hN1vlz5QbsdfJPu3idx
         wT+nNbut4PAEcQDtL11JWxFHSOAl0KDD92RP2PAsJGpCjAxeO48S0e9TJGAi3mLWGCGF
         h+5w==
X-Gm-Message-State: AOJu0YzUXDFjzpooJ/fnClYQBM7iTRvKk02zZPVWBKDTzLjOHbuwpqnf
        5Da8p+iaYVR2SiRFsHgTNaWv6HvF4WCIZi2R7RwRSA==
X-Google-Smtp-Source: AGHT+IGO4I5Tjwq0xJwAXsidjN2LFdllCHmzJnVKdXqiUOEZhZjIq+GyLgok+D/dPf4otxt2I7zDEUOXnnCkwaI6NGc=
X-Received: by 2002:a5e:aa0f:0:b0:791:385c:f8b0 with SMTP id
 s15-20020a5eaa0f000000b00791385cf8b0mr20800696ioe.3.1693319411828; Tue, 29
 Aug 2023 07:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230816225509.11070-1-quic_aprasann@quicinc.com>
 <CAJs_Fx7132o3iHDH0ZR7L9G69o2YV2-jC0v15shQcEhH6=-6RA@mail.gmail.com> <c06a31fd-e3b5-1f58-9e4f-7fafd8aa3f28@quicinc.com>
In-Reply-To: <c06a31fd-e3b5-1f58-9e4f-7fafd8aa3f28@quicinc.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Tue, 29 Aug 2023 07:30:01 -0700
Message-ID: <CAJs_Fx464vFbfLaaWWs2Y0pTmhXrJS=AWFTwEyQjifJoU72rCQ@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: NULL pointer check for driver data
To:     Aravind Vijayakumar <quic_aprasann@quicinc.com>
Cc:     will@kernel.org, joro@8bytes.org, robin.murphy@arm.com,
        dmitry.baryshkov@linaro.org, quic_bjorande@quicinc.com,
        konrad.dybcio@linaro.org, quic_eberman@quicinc.com,
        quic_psodagud@quicinc.com, quic_rvishwak@quicinc.com,
        quic_saipraka@quicinc.com, quic_molvera@quicinc.com,
        marijn.suijten@somainline.org, mani@kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 28, 2023 at 2:35=E2=80=AFPM Aravind Vijayakumar
<quic_aprasann@quicinc.com> wrote:
>
>
> On 8/16/2023 6:01 PM, Rob Clark wrote:
> > On Wed, Aug 16, 2023 at 3:55=E2=80=AFPM Aravind Vijayakumar
> > <quic_aprasann@quicinc.com> wrote:
> >> The driver_data is NULL when qcom_adreno_smmu_init_context()
> >> is called before the dev_set_drvdata() from the client driver
> >> and is resulting in kernel crash.
> >>
> >> So add a null pointer check to handle the scenario
> >> where the client driver for the GPU SMMU device would
> >> be setting the driver data after the smmu client device
> >> probe is done and not necessarily before that. The function
> >> qcom_adreno_smmu_init_context() assumes that the client
> >> driver always set the driver data using dev_set_drvdata()
> >> before the smmu client device probe, but this assumption
> >> is not always true.
> >>
> >> Signed-off-by: Aravind Vijayakumar <quic_aprasann@quicinc.com>
> >> ---
> >>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iomm=
u/arm/arm-smmu/arm-smmu-qcom.c
> >> index c71afda79d64..5323f82264ca 100644
> >> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> @@ -231,6 +231,9 @@ static int qcom_adreno_smmu_init_context(struct ar=
m_smmu_domain *smmu_domain,
> >>           */
> >>
> >>          priv =3D dev_get_drvdata(dev);
> >> +       if (!priv)
> >> +               return 0;
> > could this -EPROBE_DEFER instead, or something like that?  I think you
> > patch as proposed would result in per-process gpu pgtables silently
> > failing
> >
> > BR,
> > -R
>
> Thanks for the review comments. Returning -EPROBE_DEFER wont work
> because the probe of the client driver (which sets the driver data) will
> never get triggered. However, the probe of the client driver succeeds if
> we return -ENODATA. would that be acceptable?

I _think_ so.. I need to page back in the sequence of how this works,
but I do have some warn_on's in drm/msm to complain loudly if we don't
get per-process pgtables.  I'd be interested to see the callstack
where you hit this issue.  From what I remember the sequence should
be:

1) before the client dev probes, arm-smmu probes and attaches the
dma-api managed iommu_domain (which IIRC should be an identity domain,
and is otherwise unused).. at this point drvdata is NULL
2) the drm/msm can probe
3) at some point later when GPU fw is avail the GPU is loaded, drvdata
is set, and we start creating and attaching the iommu_domain's that
are actually used (one for kernel context and one each for userspace
processes using the GPU

I guess maybe if you are hitting this case of NULL drvdata, then you
aren't getting an identity context for the dma-api managed
iommu_domain?

BR,
-R


> Regards,
>
> Aravind
>
> >> +
> >>          priv->cookie =3D smmu_domain;
> >>          priv->get_ttbr1_cfg =3D qcom_adreno_smmu_get_ttbr1_cfg;
> >>          priv->set_ttbr0_cfg =3D qcom_adreno_smmu_set_ttbr0_cfg;
> >> --
> >> 2.40.1
> >>
