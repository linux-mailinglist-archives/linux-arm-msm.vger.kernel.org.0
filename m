Return-Path: <linux-arm-msm+bounces-686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B257EC0E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 11:45:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6785DB20A4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 10:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1557DFBFE;
	Wed, 15 Nov 2023 10:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BNY3DK/r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F05114F60
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 10:45:28 +0000 (UTC)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B1B109
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 02:45:26 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a877e0f0d8so5682727b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 02:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700045125; x=1700649925; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4tMjpHymknIjwE2hE7SnQFQ2kYl/Ww1x/FcP4n9OE/g=;
        b=BNY3DK/rSRwHiRK6UI/8V9/EFaUniK45Pj9fscmJZFb0yJt31pbeO/aVdlaPgjvfFL
         rX7GJDDO1JgDkSYneTVlVJNhALv1/KkKHNZSoQ9lxhibmFV7hSm7Uaq5pwTgIbtqP34k
         323mPQvw42uB/BD/ICg7wQ7RbzXV3fTHNwECi6NJfHNCwUVkUFJkvCPYHnjI74wa56zE
         V8kfqK7z+PD575ildRmMXx+rjV8NnK+gLmHsJ22kMapKJNuMMaXV2G4h07wacJwWG1Cs
         Bg06gr6zXN7dI00JjNgYp1oJwQoieDMhu6jxBKgaj/bzFMkN43VYjtWY/10ig1BnBtLM
         PchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700045125; x=1700649925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tMjpHymknIjwE2hE7SnQFQ2kYl/Ww1x/FcP4n9OE/g=;
        b=nZXi/Z5JfQNkYJEhg9xhxy5qfVr+LelMqZNA1zplWQUGDm0GKj6A647Rb9l+hTcxS6
         EWHAvfz4i0dUV6SzaTPw25wc2bbdimjO7Nz4QROn8oSDjQBiubm1wZvnXv3rXikNUYIS
         fLiaJeurDxVw5Ac+OupeN9n9QLgIx+0ObGIMKQ6wRmGJRDyDoRwf1ogFqc9LnzifkD1b
         TQdGbcIPuoQBmXFyy6boyzB6bW5yDyuS4E7MVXjGBrl5y04Te09ri2eINUKQmIeDuYFJ
         qHTDFqFDoiYGJ8Ltb2YDWNxUHcFjXB6msIX+BiskeuvW8RsUn7MpxzRagNCbu4rv7qIK
         VGUw==
X-Gm-Message-State: AOJu0YyhjMi5VP33rYHD8DodFZoX4+muxWoj/VoaByUg9psADrZLOjPj
	gnU0aTeHzpo35EqwSYNnvALfB+kWJ+PnceubB8gAIw==
X-Google-Smtp-Source: AGHT+IHQcp+6p1x/gNHc8Re2et9RxCsmg/89emvtgK5Qeo5OKdn3Mc2rRm3rJ/1ibDMD7brPL+N6d5RE+gtweZi3j8o=
X-Received: by 2002:a25:c04f:0:b0:da3:6fa0:1afe with SMTP id
 c76-20020a25c04f000000b00da36fa01afemr3868592ybf.21.1700045125514; Wed, 15
 Nov 2023 02:45:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com>
 <20231114135654.30475-3-quic_bibekkum@quicinc.com> <CAA8EJpr1NzqiuNVZ0YcLpJ=yeOYFbLouAFgN9VMOiKpmoGVdtQ@mail.gmail.com>
 <7edad996-f148-42d5-8e72-0334d3b9101f@quicinc.com> <CAA8EJpqzEvC-LEjJrOk6Ed8utFNnqgP=qkb0mq-dOfMZd5ij4Q@mail.gmail.com>
 <dba223a1-0456-40b8-b295-ea960867dcf9@quicinc.com>
In-Reply-To: <dba223a1-0456-40b8-b295-ea960867dcf9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 12:45:14 +0200
Message-ID: <CAA8EJpqvXb_Zdmq0O0KEA8mn5UkSriCZ02w16dts7Gd84R30oQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] iommu/arm-smmu: add ACTLR data and support for SM8550
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, a39.skl@gmail.com, 
	konrad.dybcio@linaro.org, quic_pkondeti@quicinc.com, quic_molvera@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	qipl.kernel.upstream@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Nov 2023 at 11:51, Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 11/15/2023 3:08 PM, Dmitry Baryshkov wrote:
> > On Wed, 15 Nov 2023 at 11:22, Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 11/14/2023 7:42 PM, Dmitry Baryshkov wrote:
> >>> On Tue, 14 Nov 2023 at 15:57, Bibek Kumar Patro
> >>> <quic_bibekkum@quicinc.com> wrote:
> >>>>
> >>>> Add ACTLR data table for SM8550 along with support for
> >>>> same including SM8550 specific implementation operations.
> >>>>
> >>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >>>> ---
> >>>>    drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 92 +++++++++++++++++++++-
> >>>>    1 file changed, 88 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>> index 578c662c7c30..0eaf6f2a2e49 100644
> >>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>> @@ -25,6 +25,70 @@ struct actlr_data {
> >>>>           u32 actlr;
> >>>>    };
> >>>>
> >>>> +#define PRE_FETCH_1    0
> >>>> +#define PRE_FETCH_2    BIT(8)
> >>>> +#define PRE_FETCH_3    (BIT(9) | BIT(8))
> >>>
> >>> What is the difference between PRE_FETCH_3 and PRE_FETCH_2? And
> >>> PRE_FETCH_1? Are these real numbers that refer to some amount / count
> >>> or just dummy names?
> >>>
> >>
> >> No,these are not real numbers, but prefetch settings for a particular
> >> perfect configuration.
> >
> > Then I'd ask for some better names or descriptions.
> >
>
> Noted, PREFETCH_SETTING_n / PREFETCH_OPTION_n sounds like a better name
> in the following case. Would it be okay to use this name instead?

Not really.

>
> >>
> >>>> +#define CPRE           BIT(1)          /* Enable context caching in the prefetch buffer */
> >>>> +#define CMTLB          BIT(0)          /* Enable context caching in the macro TLB */
> >>>> +
> >>>> +static const struct actlr_data sm8550_apps_actlr_data[] = {
> >>>> +       { 0x18a0, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>> +       { 0x18e0, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>> +       { 0x0800, 0x0020, PRE_FETCH_1 | CMTLB },
> >>>> +       { 0x1800, 0x00c0, PRE_FETCH_1 | CMTLB },
> >>>> +       { 0x1820, 0x0000, PRE_FETCH_1 | CMTLB },
> >>>> +       { 0x1860, 0x0000, PRE_FETCH_1 | CMTLB },
> >>>> +       { 0x0c01, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x0c02, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x0c03, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x0c04, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x0c05, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x0c06, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x0c07, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x0c08, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x0c09, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x0c0c, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x0c0d, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x0c0e, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x0c0f, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x1961, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x1962, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x1963, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x1964, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x1965, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x1966, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x1967, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x1968, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x1969, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x196c, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x196d, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x196e, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x196f, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x19c1, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x19c2, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x19c3, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x19c4, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x19c5, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x19c6, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x19c7, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x19c8, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x19c9, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x19cc, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x19cd, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x19ce, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x19cf, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>> +       { 0x1c00, 0x0002, PRE_FETCH_2 | CPRE | CMTLB },
> >>>> +       { 0x1c01, 0x0000, PRE_FETCH_1 | CMTLB },
> >>>> +       { 0x1920, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>> +       { 0x1923, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>> +       { 0x1924, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>> +       { 0x1940, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>> +       { 0x1941, 0x0004, PRE_FETCH_2 | CPRE | CMTLB },
> >>>> +       { 0x1943, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>> +       { 0x1944, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>> +       { 0x1947, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>> +};
> >>>> +
> >>>>    static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> >>>>    {
> >>>>           return container_of(smmu, struct qcom_smmu, smmu);
> >>>> @@ -459,6 +523,16 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
> >>>>           .tlb_sync = qcom_smmu_tlb_sync,
> >>>>    };
> >>>>
> >>>> +
> >>>> +static const struct arm_smmu_impl sm8550_smmu_500_impl = {
> >>>> +       .init_context = qcom_smmu_init_context,
> >>>> +       .cfg_probe = qcom_smmu_cfg_probe,
> >>>> +       .def_domain_type = qcom_smmu_def_domain_type,
> >>>> +       .reset = arm_mmu500_reset,
> >>>> +       .write_s2cr = qcom_smmu_write_s2cr,
> >>>> +       .tlb_sync = qcom_smmu_tlb_sync,
> >>>
> >>> What is the difference between this one and qcom_smmu_500_impl ?
> >>>
> >>
> >> Noted, will remove this and use qcom_smmu_500_impl instead.
> >> Thanks for pointing this out.
> >> Since inititally the reset ops was different to reset CPRE bit only for
> >> sm8550 SoC hence sm8550_smmu_500_impl is defined, but now default reset
> >> ops is modified to set CPRE bit for all SoCs ([PATCH v2 3/3]) so it
> >> should be fine to use qcom_smmu_500_impl as there's no difference now.
> >>
> >>>> +};
> >>>> +
> >>>>    static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
> >>>>           .init_context = qcom_adreno_smmu_init_context,
> >>>>           .def_domain_type = qcom_smmu_def_domain_type,
> >>>> @@ -522,6 +596,11 @@ static const struct qcom_smmu_config qcom_smmu_impl0_cfg = {
> >>>>           .reg_offset = qcom_smmu_impl0_reg_offset,
> >>>>    };
> >>>>
> >>>> +static const struct actlr_config sm8550_actlrcfg = {
> >>>> +       .adata = sm8550_apps_actlr_data,
> >>>> +       .size = ARRAY_SIZE(sm8550_apps_actlr_data),
> >>>> +};
> >>>> +
> >>>>    /*
> >>>>     * It is not yet possible to use MDP SMMU with the bypass quirk on the msm8996,
> >>>>     * there are not enough context banks.
> >>>> @@ -545,16 +624,20 @@ static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
> >>>>           /* Also no debug configuration. */
> >>>>    };
> >>>>
> >>>> +
> >>>> +static const struct qcom_smmu_match_data sm8550_smmu_500_impl0_data = {
> >>>> +       .impl = &sm8550_smmu_500_impl,
> >>>> +       .adreno_impl = &qcom_adreno_smmu_500_impl,
> >>>> +       .cfg = &qcom_smmu_impl0_cfg,
> >>>> +       .actlrcfg = &sm8550_actlrcfg,
> >>>> +};
> >>>> +
> >>>>    static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
> >>>>           .impl = &qcom_smmu_500_impl,
> >>>>           .adreno_impl = &qcom_adreno_smmu_500_impl,
> >>>>           .cfg = &qcom_smmu_impl0_cfg,
> >>>>    };
> >>>>
> >>>> -/*
> >>>> - * Do not add any more qcom,SOC-smmu-500 entries to this list, unless they need
> >>>> - * special handling and can not be covered by the qcom,smmu-500 entry.
> >>>> - */
> >>>
> >>> NAK, leave this in place.
> >>>
> >>
> >> Ack, will address this in next version.
> >>
> >>>>    static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
> >>>>           { .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
> >>>>           { .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
> >>>> @@ -579,6 +662,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
> >>>>           { .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
> >>>>           { .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
> >>>>           { .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
> >>>> +       { .compatible = "qcom,sm8550-smmu-500", .data = &sm8550_smmu_500_impl0_data },
> >>>>           { .compatible = "qcom,smmu-500", .data = &qcom_smmu_500_impl0_data },
> >>>>           { }
> >>>>    };
> >>>> --
> >>>> 2.17.1
> >>>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

