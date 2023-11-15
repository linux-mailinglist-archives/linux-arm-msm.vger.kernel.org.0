Return-Path: <linux-arm-msm+bounces-695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C9F7EC35A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 14:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92E2A1C20B7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 13:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134481A591;
	Wed, 15 Nov 2023 13:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cGUHsfFQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A3F1A596
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 13:11:12 +0000 (UTC)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A61FD12C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 05:11:09 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a7af52ee31so78529807b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Nov 2023 05:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700053869; x=1700658669; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nUQCAFuaxTyoLD7UNNjsKWWroEqjiHXlZ64gbEbsUu4=;
        b=cGUHsfFQPjDmVBE9UCW+TvfNyGl3fMLzZmUaGfYP4QYefxaUUhSOHLoTuGxnVmHORA
         bli2Qosi7Bg3s+8o2F2o1C457YGtLkJwOvn8u3h6PbILr6dbr/xVNCPL+gi+CN8ud1Ue
         7cYFj/Hxy/Xstd2AmQu1THkgcxy40i/5XQsAxrvyp5Wz7M400ncN8JQIU+PmNKxie+ty
         d/qBJhB8ZRuhhuFiKsaoOeda2Zl8rd4wAu7WlrpgVluOVxPaFlmSOHbaquxpW9UG3/Vr
         kBUzWWUvhjfLADddfInZtgpe89ylqRPNKtIGw15HXvVon6tGTqBitPcp51yhaJ/gF8UV
         ZgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700053869; x=1700658669;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUQCAFuaxTyoLD7UNNjsKWWroEqjiHXlZ64gbEbsUu4=;
        b=i6ChI+6Kg2KRjHXbCrJSF1mS1AHT9Dfd9Gw5Jsy5zgBDtJvceJjioNr49SnP2dm5iZ
         BMSeNv7q+9G4bkyxUXcou0Zc5rX7dQfuya0BJwiv4ggw2FRyPAC/5Q6pgrblqvwb54iv
         mnwvxD6NcZfs039npk1FxM4Wddc1JXtrml+Ma+MpSFRpDm4UeJ0zr2SV+kx/FhxHKrGK
         odJAY7R/a7mnC8M02+z+a+DIOVP5xr8U2O/rrS/y3R3XTkYhl7vCgFW7y++bDIxaaE+3
         M+qWOxW4picisTl8koKHmbuW9SCrFr1D/C8MxI9YM9EggrqCvhiEIaflAPGt3cJD71dF
         pkBQ==
X-Gm-Message-State: AOJu0YzIRo8LiHsoyHBvN25KKlGNIqZ/9cv38ktAr+YWNWGXMGfk5Fpu
	cWufTRzLXY36itPQt8izpk6UBdfOIHQL2dZr1ENFEA==
X-Google-Smtp-Source: AGHT+IE27QoHAd9yPBCePxIWbaxkxONJy9FLcjaOoJ9YA8XjjrnCyqh9x8JdYwE8Cvx7AQpmB+AOGFCj1489G09wQjk=
X-Received: by 2002:a81:a504:0:b0:5a8:204c:5c9b with SMTP id
 u4-20020a81a504000000b005a8204c5c9bmr13301987ywg.18.1700053868675; Wed, 15
 Nov 2023 05:11:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com>
 <20231114135654.30475-3-quic_bibekkum@quicinc.com> <CAA8EJpr1NzqiuNVZ0YcLpJ=yeOYFbLouAFgN9VMOiKpmoGVdtQ@mail.gmail.com>
 <7edad996-f148-42d5-8e72-0334d3b9101f@quicinc.com> <CAA8EJpqzEvC-LEjJrOk6Ed8utFNnqgP=qkb0mq-dOfMZd5ij4Q@mail.gmail.com>
 <dba223a1-0456-40b8-b295-ea960867dcf9@quicinc.com> <CAA8EJpqvXb_Zdmq0O0KEA8mn5UkSriCZ02w16dts7Gd84R30oQ@mail.gmail.com>
 <aebdf7f6-48b7-43d3-95af-83859ddc593f@quicinc.com>
In-Reply-To: <aebdf7f6-48b7-43d3-95af-83859ddc593f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 15:10:57 +0200
Message-ID: <CAA8EJpp6=EGd4j7w+P5v0_PCzUdtty4p30q0bAD2rc2oCWnwfQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] iommu/arm-smmu: add ACTLR data and support for SM8550
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, a39.skl@gmail.com, 
	konrad.dybcio@linaro.org, quic_pkondeti@quicinc.com, quic_molvera@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	qipl.kernel.upstream@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Nov 2023 at 14:49, Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 11/15/2023 4:15 PM, Dmitry Baryshkov wrote:
> > On Wed, 15 Nov 2023 at 11:51, Bibek Kumar Patro
> > <quic_bibekkum@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 11/15/2023 3:08 PM, Dmitry Baryshkov wrote:
> >>> On Wed, 15 Nov 2023 at 11:22, Bibek Kumar Patro
> >>> <quic_bibekkum@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 11/14/2023 7:42 PM, Dmitry Baryshkov wrote:
> >>>>> On Tue, 14 Nov 2023 at 15:57, Bibek Kumar Patro
> >>>>> <quic_bibekkum@quicinc.com> wrote:
> >>>>>>
> >>>>>> Add ACTLR data table for SM8550 along with support for
> >>>>>> same including SM8550 specific implementation operations.
> >>>>>>
> >>>>>> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >>>>>> ---
> >>>>>>     drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 92 +++++++++++++++++++++-
> >>>>>>     1 file changed, 88 insertions(+), 4 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>> index 578c662c7c30..0eaf6f2a2e49 100644
> >>>>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >>>>>> @@ -25,6 +25,70 @@ struct actlr_data {
> >>>>>>            u32 actlr;
> >>>>>>     };
> >>>>>>
> >>>>>> +#define PRE_FETCH_1    0
> >>>>>> +#define PRE_FETCH_2    BIT(8)
> >>>>>> +#define PRE_FETCH_3    (BIT(9) | BIT(8))
> >>>>>
> >>>>> What is the difference between PRE_FETCH_3 and PRE_FETCH_2? And
> >>>>> PRE_FETCH_1? Are these real numbers that refer to some amount / count
> >>>>> or just dummy names?
> >>>>>
> >>>>
> >>>> No,these are not real numbers, but prefetch settings for a particular
> >>>> perfect configuration.
> >>>
> >>> Then I'd ask for some better names or descriptions.
> >>>
> >>
> >> Noted, PREFETCH_SETTING_n / PREFETCH_OPTION_n sounds like a better name
> >> in the following case. Would it be okay to use this name instead?
> >
> > Not really.
> >
>
> Any suggestion you have in mind, if not this nomenclature?

PREFETCH_something, PREFETCH_do_other_thing and PREFETCH_something_else

>
> >>
> >>>>
> >>>>>> +#define CPRE           BIT(1)          /* Enable context caching in the prefetch buffer */
> >>>>>> +#define CMTLB          BIT(0)          /* Enable context caching in the macro TLB */
> >>>>>> +
> >>>>>> +static const struct actlr_data sm8550_apps_actlr_data[] = {
> >>>>>> +       { 0x18a0, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>>>> +       { 0x18e0, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>>>> +       { 0x0800, 0x0020, PRE_FETCH_1 | CMTLB },
> >>>>>> +       { 0x1800, 0x00c0, PRE_FETCH_1 | CMTLB },
> >>>>>> +       { 0x1820, 0x0000, PRE_FETCH_1 | CMTLB },
> >>>>>> +       { 0x1860, 0x0000, PRE_FETCH_1 | CMTLB },
> >>>>>> +       { 0x0c01, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x0c02, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x0c03, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x0c04, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x0c05, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x0c06, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x0c07, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x0c08, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x0c09, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x0c0c, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x0c0d, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x0c0e, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x0c0f, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x1961, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x1962, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x1963, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x1964, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x1965, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x1966, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x1967, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x1968, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x1969, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x196c, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x196d, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x196e, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x196f, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x19c1, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x19c2, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x19c3, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x19c4, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x19c5, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x19c6, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x19c7, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x19c8, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x19c9, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x19cc, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x19cd, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x19ce, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x19cf, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> >>>>>> +       { 0x1c00, 0x0002, PRE_FETCH_2 | CPRE | CMTLB },
> >>>>>> +       { 0x1c01, 0x0000, PRE_FETCH_1 | CMTLB },
> >>>>>> +       { 0x1920, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>>>> +       { 0x1923, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>>>> +       { 0x1924, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>>>> +       { 0x1940, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>>>> +       { 0x1941, 0x0004, PRE_FETCH_2 | CPRE | CMTLB },
> >>>>>> +       { 0x1943, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>>>> +       { 0x1944, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>>>> +       { 0x1947, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> >>>>>> +};
> >>>>>> +
> >>>>>>     static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> >>>>>>     {
> >>>>>>            return container_of(smmu, struct qcom_smmu, smmu);
> >>>>>> @@ -459,6 +523,16 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
> >>>>>>            .tlb_sync = qcom_smmu_tlb_sync,
> >>>>>>     };
> >>>>>>
> >>>>>> +
> >>>>>> +static const struct arm_smmu_impl sm8550_smmu_500_impl = {
> >>>>>> +       .init_context = qcom_smmu_init_context,
> >>>>>> +       .cfg_probe = qcom_smmu_cfg_probe,
> >>>>>> +       .def_domain_type = qcom_smmu_def_domain_type,
> >>>>>> +       .reset = arm_mmu500_reset,
> >>>>>> +       .write_s2cr = qcom_smmu_write_s2cr,
> >>>>>> +       .tlb_sync = qcom_smmu_tlb_sync,
> >>>>>
> >>>>> What is the difference between this one and qcom_smmu_500_impl ?
> >>>>>
> >>>>
> >>>> Noted, will remove this and use qcom_smmu_500_impl instead.
> >>>> Thanks for pointing this out.
> >>>> Since inititally the reset ops was different to reset CPRE bit only for
> >>>> sm8550 SoC hence sm8550_smmu_500_impl is defined, but now default reset
> >>>> ops is modified to set CPRE bit for all SoCs ([PATCH v2 3/3]) so it
> >>>> should be fine to use qcom_smmu_500_impl as there's no difference now.
> >>>>
> >>>>>> +};
> >>>>>> +
> >>>>>>     static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
> >>>>>>            .init_context = qcom_adreno_smmu_init_context,
> >>>>>>            .def_domain_type = qcom_smmu_def_domain_type,
> >>>>>> @@ -522,6 +596,11 @@ static const struct qcom_smmu_config qcom_smmu_impl0_cfg = {
> >>>>>>            .reg_offset = qcom_smmu_impl0_reg_offset,
> >>>>>>     };
> >>>>>>
> >>>>>> +static const struct actlr_config sm8550_actlrcfg = {
> >>>>>> +       .adata = sm8550_apps_actlr_data,
> >>>>>> +       .size = ARRAY_SIZE(sm8550_apps_actlr_data),
> >>>>>> +};
> >>>>>> +
> >>>>>>     /*
> >>>>>>      * It is not yet possible to use MDP SMMU with the bypass quirk on the msm8996,
> >>>>>>      * there are not enough context banks.
> >>>>>> @@ -545,16 +624,20 @@ static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
> >>>>>>            /* Also no debug configuration. */
> >>>>>>     };
> >>>>>>
> >>>>>> +
> >>>>>> +static const struct qcom_smmu_match_data sm8550_smmu_500_impl0_data = {
> >>>>>> +       .impl = &sm8550_smmu_500_impl,
> >>>>>> +       .adreno_impl = &qcom_adreno_smmu_500_impl,
> >>>>>> +       .cfg = &qcom_smmu_impl0_cfg,
> >>>>>> +       .actlrcfg = &sm8550_actlrcfg,
> >>>>>> +};
> >>>>>> +
> >>>>>>     static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
> >>>>>>            .impl = &qcom_smmu_500_impl,
> >>>>>>            .adreno_impl = &qcom_adreno_smmu_500_impl,
> >>>>>>            .cfg = &qcom_smmu_impl0_cfg,
> >>>>>>     };
> >>>>>>
> >>>>>> -/*
> >>>>>> - * Do not add any more qcom,SOC-smmu-500 entries to this list, unless they need
> >>>>>> - * special handling and can not be covered by the qcom,smmu-500 entry.
> >>>>>> - */
> >>>>>
> >>>>> NAK, leave this in place.
> >>>>>
> >>>>
> >>>> Ack, will address this in next version.
> >>>>
> >>>>>>     static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
> >>>>>>            { .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
> >>>>>>            { .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
> >>>>>> @@ -579,6 +662,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
> >>>>>>            { .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
> >>>>>>            { .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
> >>>>>>            { .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
> >>>>>> +       { .compatible = "qcom,sm8550-smmu-500", .data = &sm8550_smmu_500_impl0_data },
> >>>>>>            { .compatible = "qcom,smmu-500", .data = &qcom_smmu_500_impl0_data },
> >>>>>>            { }
> >>>>>>     };
> >>>>>> --
> >>>>>> 2.17.1
> >>>>>>
> >>>>>
> >>>>>
> >>>
> >>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

