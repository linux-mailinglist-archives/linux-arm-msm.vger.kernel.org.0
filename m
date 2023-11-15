Return-Path: <linux-arm-msm+bounces-687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4CF7EC112
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 12:04:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 480CD1F26B99
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 11:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4538F154B7;
	Wed, 15 Nov 2023 11:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h16MTw/C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C810156D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 11:04:11 +0000 (UTC)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02AEE92
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 03:04:10 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5a84204e7aeso77070887b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 03:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700046249; x=1700651049; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=naTuhSl69LmFBC+TpFtD+Qgn0vKBo/uscYCgy85Lk+g=;
        b=h16MTw/CzEh3U9vn2wlgSU6Kh+N1Q4ukLCSTtDwn9INHcuoaRBajvj/XfTn69vO+8W
         6yHhHPlIl7eqcJqP7g4dJGrQgbdz0PGsuDifQPJ3aHX3LNBItrDqNAHqzOdt6ni/fAnz
         sK/tBlnSKxn0t9gg/FPdwGdaMhHI7c4vZpta1z4ianK3+FIHL209g7bmkVnjXhlZ9J8E
         hv0Xjd4N7jSj1etKr9jz5pOrrB4eDnFAf8IG6IMj68EHdLUmXHaEkoajuaa9nN9m0CEg
         0P7U3OVlxb8eRMGAHv4UEwJERu7cuCZkpqKvPPKukRxBgF6fES3caBfT/3R4Q+PoE/V1
         AIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700046249; x=1700651049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=naTuhSl69LmFBC+TpFtD+Qgn0vKBo/uscYCgy85Lk+g=;
        b=oIXQ58hgsfQJccFl0y71UhbCATu4N5g2DDQyKUSdjcuhtzbuMnQFMlsyA7ny54TKQe
         VUWhM1RyymExkIZOSeOBzHdXGUQSqI2drZui2xA5kUV1ldgrccd9kNveRqoXdA0BcucP
         ymDc3dRRzMefmAo4tG/qOnoEdOu0jQEvy8nNhPeFf/N+aoFx8/lgDJ+XRv/NHUxl9TvP
         S7vR3BWwk5AXxu6I/pKFA+xUodRl3Z5pqlPSdMnqP6Ob4hLO6YR7n5R9RNKMlZ4eNTbm
         WvMnijqymwAZ3l+53a9Hky9ISY5zOAAPctz1PC55EPQGaiV+Me6wXA2NUXIj1Klh42nh
         G6sQ==
X-Gm-Message-State: AOJu0YxYAgvYAd5oleS/uT6hNOohRI47luCYjx1eD8MQZjpsHzzzmn93
	YtllzXczImGL/u5EOp3GSHbnw32UxYV4BzEY2H/gt7u9/FPoOTLs
X-Google-Smtp-Source: AGHT+IEr2PGPjbSKTkTzH1/sICNyy5m4ckXBm6eCcrurokOSqbFt2CeaPrvTeBNYrypV1H0PIIom5bkymgTTKPBOHZA=
X-Received: by 2002:a81:8357:0:b0:5ad:cd52:d6f0 with SMTP id
 t84-20020a818357000000b005adcd52d6f0mr13994365ywf.45.1700046249148; Wed, 15
 Nov 2023 03:04:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com>
 <20231114135654.30475-4-quic_bibekkum@quicinc.com> <CAA8EJpoRmm42aAvyX61o3tMWXszUZmfFvJEtnNDEfYdDqy4Y0g@mail.gmail.com>
 <72b30354-0497-45cf-8b71-e4f265eb0005@quicinc.com>
In-Reply-To: <72b30354-0497-45cf-8b71-e4f265eb0005@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 13:03:58 +0200
Message-ID: <CAA8EJprPE=z2VN5LkaUyLyvYpx6i1eF9dyxOzN_L86pi5tmU-Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] iommu/arm-smmu: re-enable context caching in smmu
 reset operation
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, a39.skl@gmail.com, 
	konrad.dybcio@linaro.org, quic_pkondeti@quicinc.com, quic_molvera@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	qipl.kernel.upstream@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Nov 2023 at 11:45, Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
> On 11/14/2023 7:45 PM, Dmitry Baryshkov wrote:
> > On Tue, 14 Nov 2023 at 15:57, Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >> Context caching is re-enabled in the prefetch buffer for Qualcomm SoCs
> >> through SoC specific reset ops, which is disabled in the default MMU-500
> >> reset ops, but is expected for context banks using ACTLR register to
> >> retain the prefetch value during reset and runtime suspend.
> >
> > Please refer to Documentation/process/submitting-patches.rst and
> > rephrase this following the rules there.
> >
>
> Noted, will go through the description once and rephrase it
> in next version complying with rules.
>
> >>
> >> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >> ---
> >>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 25 ++++++++++++++++++----
> >>   1 file changed, 21 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> index 0eaf6f2a2e49..fa867b1d9d16 100644
> >> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> @@ -478,11 +478,28 @@ static int qcom_smmu_def_domain_type(struct device *dev)
> >>          return match ? IOMMU_DOMAIN_IDENTITY : 0;
> >>   }
> >>
> >> +static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
> >> +{
> >> +       int i;
> >> +       u32 reg;
> >> +
> >> +       arm_mmu500_reset(smmu);
> >> +
> >> +       /* Re-enable context caching after reset */
> >> +       for (i = 0; i < smmu->num_context_banks; ++i) {
> >> +               reg = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
> >> +               reg |= CPRE;
> >> +               arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, reg);
> >> +       }
> >> +
> >> +       return 0;
> >> +}
> >> +
> >>   static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
> >>   {
> >>          int ret;
> >>
> >> -       arm_mmu500_reset(smmu);
> >> +       qcom_smmu500_reset(smmu);
> >
> > Is this applicable for sdm845? For all other platforms supported by
> > qcom_smmu_500 implementation?
> >
>
> In arm_mmu500_reset operation drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> CPRE bit is reset for all SoC based on mmu500 platform, hence for all
> Qualcomm SoCs including sm845 we are setting back the CPRE bit.

The errata for the CoreLink MMU-500 requires CPRE to be disabled for
all revisions before r2p2. Do we know whether these SoC used CoreLink
MMU-500 and which version of it?

>
> >>
> >>          /*
> >>           * To address performance degradation in non-real time clients,
> >> @@ -509,7 +526,7 @@ static const struct arm_smmu_impl qcom_smmu_500_impl = {
> >>          .init_context = qcom_smmu_init_context,
> >>          .cfg_probe = qcom_smmu_cfg_probe,
> >>          .def_domain_type = qcom_smmu_def_domain_type,
> >> -       .reset = arm_mmu500_reset,
> >> +       .reset = qcom_smmu500_reset,
> >>          .write_s2cr = qcom_smmu_write_s2cr,
> >>          .tlb_sync = qcom_smmu_tlb_sync,
> >>   };
> >> @@ -528,7 +545,7 @@ static const struct arm_smmu_impl sm8550_smmu_500_impl = {
> >>          .init_context = qcom_smmu_init_context,
> >>          .cfg_probe = qcom_smmu_cfg_probe,
> >>          .def_domain_type = qcom_smmu_def_domain_type,
> >> -       .reset = arm_mmu500_reset,
> >> +       .reset = qcom_smmu500_reset,
> >>          .write_s2cr = qcom_smmu_write_s2cr,
> >>          .tlb_sync = qcom_smmu_tlb_sync,
> >>   };
> >> @@ -544,7 +561,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
> >>   static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
> >>          .init_context = qcom_adreno_smmu_init_context,
> >>          .def_domain_type = qcom_smmu_def_domain_type,
> >> -       .reset = arm_mmu500_reset,
> >> +       .reset = qcom_smmu500_reset,
> >>          .alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
> >>          .write_sctlr = qcom_adreno_smmu_write_sctlr,
> >>          .tlb_sync = qcom_smmu_tlb_sync,
> >> --
> >> 2.17.1
> >>
> >
> >



--
With best wishes
Dmitry

