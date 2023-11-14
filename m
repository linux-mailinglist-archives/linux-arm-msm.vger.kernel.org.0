Return-Path: <linux-arm-msm+bounces-636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 982717EB1A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 15:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51380281180
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Nov 2023 14:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B69405CA;
	Tue, 14 Nov 2023 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P+0IKMnJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C15405DB
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 14:12:54 +0000 (UTC)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A24610D
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 06:12:47 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5a82c2eb50cso58772847b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Nov 2023 06:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699971166; x=1700575966; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wLybn58tnV4LODh5eqWQ7D0RxurjyyUSi/kfw3mvtg0=;
        b=P+0IKMnJx5vvSOysbq8GPDEU0b0GBYu3pXNqaEbLI5CwCuGzEdv6oVXsZKkTF5eEOz
         7pGfGXxmPZ1fBZBeX2719aIatwQVSKauLjQYxxi0UJRRhmk5C+8FHw5rTXMkDVyheP8k
         WGNWBjIm6jBXN3xbyjQgmIER6vC6zQj7dfMKc9TwUM+JUpzNpN7vltCpxamYbE15ACRV
         ZfQAERaioFHCzbJpgRmHy1AiZXaongZxL9B933YVw2veuHgYiiNnjmcpfL9h61YH9Jbl
         nQ45uTIf5pHoy1wMsaiI4A1vsxIjQumosOxXQSmtJj3Z1wccfh5OmjhDla9Ft7Ag8GzQ
         bwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971166; x=1700575966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wLybn58tnV4LODh5eqWQ7D0RxurjyyUSi/kfw3mvtg0=;
        b=SJKHpqTeA9tSWZsFJEnrNTYPavQ4NAdIq5NqNU+ZK13O1b/ZljM+GnARNKwWdOVdi+
         Hq7LTdRWlD7NwTx27Ur/XxV36JhdieMcDNUFuE6UbuP4K4oLG9sah6Ashccr2KEAbFh5
         AAIwmqmbPEyTVuk1i1ioAOBC6ZZs1Fwtl4eq1nouD0TkIMAcEGP0uauJpTOj4fzIEeFB
         xKgvOSuJY6R1QTZo0kQWJ7ZDF4lzAFkEr8KoKx0G0DmZI4Xec0H4/wsRqioiuvR2Q88a
         P5ZFcAlDXzYbrYwIjKxVw67izeqD4AESSXrJLiMATz9bpvD++8bbgJwQ6yVliPqIL7pC
         OUig==
X-Gm-Message-State: AOJu0Yy7hq8WREKsq1t2ozoWg+m/Uz/pM/Tw8YSOfJG/zKvKUvTqHdY/
	9fWm5n7blAGd4PfJ5PuPMOd/QjztsvZn8jjMbXxknw==
X-Google-Smtp-Source: AGHT+IEtJgclugQVkDkziAKKvd96n/skukIzxkLqvzXlhYme19UyrdpKZBFuBXt8UQtSWsp61/DTGuSAR2X2whvMw6A=
X-Received: by 2002:a0d:ea85:0:b0:5a7:e4d9:f091 with SMTP id
 t127-20020a0dea85000000b005a7e4d9f091mr7598356ywe.25.1699971166047; Tue, 14
 Nov 2023 06:12:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114135654.30475-1-quic_bibekkum@quicinc.com> <20231114135654.30475-3-quic_bibekkum@quicinc.com>
In-Reply-To: <20231114135654.30475-3-quic_bibekkum@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Nov 2023 16:12:35 +0200
Message-ID: <CAA8EJpr1NzqiuNVZ0YcLpJ=yeOYFbLouAFgN9VMOiKpmoGVdtQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] iommu/arm-smmu: add ACTLR data and support for SM8550
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, a39.skl@gmail.com, 
	konrad.dybcio@linaro.org, quic_pkondeti@quicinc.com, quic_molvera@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	qipl.kernel.upstream@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Nov 2023 at 15:57, Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
> Add ACTLR data table for SM8550 along with support for
> same including SM8550 specific implementation operations.
>
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 92 +++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 578c662c7c30..0eaf6f2a2e49 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -25,6 +25,70 @@ struct actlr_data {
>         u32 actlr;
>  };
>
> +#define PRE_FETCH_1    0
> +#define PRE_FETCH_2    BIT(8)
> +#define PRE_FETCH_3    (BIT(9) | BIT(8))

What is the difference between PRE_FETCH_3 and PRE_FETCH_2? And
PRE_FETCH_1? Are these real numbers that refer to some amount / count
or just dummy names?

> +#define CPRE           BIT(1)          /* Enable context caching in the prefetch buffer */
> +#define CMTLB          BIT(0)          /* Enable context caching in the macro TLB */
> +
> +static const struct actlr_data sm8550_apps_actlr_data[] = {
> +       { 0x18a0, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> +       { 0x18e0, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> +       { 0x0800, 0x0020, PRE_FETCH_1 | CMTLB },
> +       { 0x1800, 0x00c0, PRE_FETCH_1 | CMTLB },
> +       { 0x1820, 0x0000, PRE_FETCH_1 | CMTLB },
> +       { 0x1860, 0x0000, PRE_FETCH_1 | CMTLB },
> +       { 0x0c01, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x0c02, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x0c03, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x0c04, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x0c05, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x0c06, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x0c07, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x0c08, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x0c09, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x0c0c, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x0c0d, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x0c0e, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x0c0f, 0x0020, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x1961, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x1962, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x1963, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x1964, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x1965, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x1966, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x1967, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x1968, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x1969, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x196c, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x196d, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x196e, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x196f, 0x0000, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x19c1, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x19c2, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x19c3, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x19c4, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x19c5, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x19c6, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x19c7, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x19c8, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x19c9, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x19cc, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x19cd, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x19ce, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x19cf, 0x0010, PRE_FETCH_3 | CPRE | CMTLB },
> +       { 0x1c00, 0x0002, PRE_FETCH_2 | CPRE | CMTLB },
> +       { 0x1c01, 0x0000, PRE_FETCH_1 | CMTLB },
> +       { 0x1920, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> +       { 0x1923, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> +       { 0x1924, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> +       { 0x1940, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> +       { 0x1941, 0x0004, PRE_FETCH_2 | CPRE | CMTLB },
> +       { 0x1943, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> +       { 0x1944, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> +       { 0x1947, 0x0000, PRE_FETCH_2 | CPRE | CMTLB },
> +};
> +
>  static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
>  {
>         return container_of(smmu, struct qcom_smmu, smmu);
> @@ -459,6 +523,16 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
>         .tlb_sync = qcom_smmu_tlb_sync,
>  };
>
> +
> +static const struct arm_smmu_impl sm8550_smmu_500_impl = {
> +       .init_context = qcom_smmu_init_context,
> +       .cfg_probe = qcom_smmu_cfg_probe,
> +       .def_domain_type = qcom_smmu_def_domain_type,
> +       .reset = arm_mmu500_reset,
> +       .write_s2cr = qcom_smmu_write_s2cr,
> +       .tlb_sync = qcom_smmu_tlb_sync,

What is the difference between this one and qcom_smmu_500_impl ?

> +};
> +
>  static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
>         .init_context = qcom_adreno_smmu_init_context,
>         .def_domain_type = qcom_smmu_def_domain_type,
> @@ -522,6 +596,11 @@ static const struct qcom_smmu_config qcom_smmu_impl0_cfg = {
>         .reg_offset = qcom_smmu_impl0_reg_offset,
>  };
>
> +static const struct actlr_config sm8550_actlrcfg = {
> +       .adata = sm8550_apps_actlr_data,
> +       .size = ARRAY_SIZE(sm8550_apps_actlr_data),
> +};
> +
>  /*
>   * It is not yet possible to use MDP SMMU with the bypass quirk on the msm8996,
>   * there are not enough context banks.
> @@ -545,16 +624,20 @@ static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
>         /* Also no debug configuration. */
>  };
>
> +
> +static const struct qcom_smmu_match_data sm8550_smmu_500_impl0_data = {
> +       .impl = &sm8550_smmu_500_impl,
> +       .adreno_impl = &qcom_adreno_smmu_500_impl,
> +       .cfg = &qcom_smmu_impl0_cfg,
> +       .actlrcfg = &sm8550_actlrcfg,
> +};
> +
>  static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
>         .impl = &qcom_smmu_500_impl,
>         .adreno_impl = &qcom_adreno_smmu_500_impl,
>         .cfg = &qcom_smmu_impl0_cfg,
>  };
>
> -/*
> - * Do not add any more qcom,SOC-smmu-500 entries to this list, unless they need
> - * special handling and can not be covered by the qcom,smmu-500 entry.
> - */

NAK, leave this in place.

>  static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>         { .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
>         { .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
> @@ -579,6 +662,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
>         { .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
>         { .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
>         { .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
> +       { .compatible = "qcom,sm8550-smmu-500", .data = &sm8550_smmu_500_impl0_data },
>         { .compatible = "qcom,smmu-500", .data = &qcom_smmu_500_impl0_data },
>         { }
>  };
> --
> 2.17.1
>


-- 
With best wishes
Dmitry

