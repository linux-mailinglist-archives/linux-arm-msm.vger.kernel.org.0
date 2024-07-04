Return-Path: <linux-arm-msm+bounces-25268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7639274E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 13:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77081289C09
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 11:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B8A1AC427;
	Thu,  4 Jul 2024 11:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dqWUEaIt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E561ABCC0
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jul 2024 11:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720092218; cv=none; b=Vn42m1iQnCKD7VrlOwGGJbZ68q+7FvKZOEV9511HmiyN08QCAODRTOXElRroQFpw4bX+ZK7DVvT+beC0Hpitau37Zy+MTc3kSkK+LPai4d6GRD8cirsh8+C/ygUVWSBChrKA18GZb+KnGuQu5y9ahVLVNTlrY8TKVSdyHt0Cdnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720092218; c=relaxed/simple;
	bh=SMB+igqj6n9++aWRLyA03Vj9yqGMmTygj1Y2j40KYuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLBXo3hZFeViLL/7hE/eB9FS9ArUQtW+CaDlRUkr6PpYgDNu1uDW/GAxkVfqA77w45ZdFNlCT9WFZz/NbhAcBcpz2jKqluxeByNZo/hLORM0J9uCNlZO1tK6yujJLOgWm5QfpreltJFmEEsW7fCJWvcAMmBfmP/QD+d7ypKbSPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dqWUEaIt; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-64b5617ba47so5017217b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jul 2024 04:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720092215; x=1720697015; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fu5k71EftNN7Y1CDQiusnOVRLjdoJgBCPaoKhdRlLMQ=;
        b=dqWUEaIt6WD9pVNSbWWUNANEOSK9EBnmRCbB83EA6RIjcxi4pUqln19w3XWeeXQB74
         gMgDvrwc/YZXxS+CzMnwiamkNJkVm8hJKyiacnKsbcp3cxVO5c9bWgEltEPVYu8CVnH+
         t84YBnHNzaUmG28TwIREJ8ybVRe6I20LFoGYL3OUSi19QqwKQgTg5T29GcB3KNvPN+RV
         iOfAH6qvD9XFYTgjUcM2kZbCr8O9uFbxPfQZIRcLu8puFCvtK7tXT1lB1wHTsiCsMpRt
         vBPjz93pit9QbrlL00tKyBD4ToRighcZn6hM853VMvzpNeQ0Jt6+nBu9DARLsp8PCYKM
         uK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720092215; x=1720697015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fu5k71EftNN7Y1CDQiusnOVRLjdoJgBCPaoKhdRlLMQ=;
        b=vV/QvbHH72Y+YWM3Dv8P4TkDJZBEi7w7n9vniH/Fa5xX34AMIMx9u2Zx8pPXj5ypqc
         1JBi4p7p9sP6sVP4B2VlPsWYPyWuQOWeS/Ow+QUSYx4lNXHKkx00uf0YaGAWmjlHFgA6
         PngM9Upc/FTwxG2HH8gB8tnOkNu159PpRwlpqhdlY7L3LpRhQbkZuckmhL/f8yNvFq78
         muaYPQdET16BMT5ODnO5fZRD30B2YyWauC3P11C5WvG8mZx+53lDu4ov+bO6TT+i6/yu
         ZjFikwptu9aSoSbzR4AY7817r7dWRSM5lZfXTWqE6u4jM2u4lv26FX9mWCRrY4xyIw8Z
         fULA==
X-Forwarded-Encrypted: i=1; AJvYcCXmkWB70aD8zxvVUI7z6GqJ7lTi8YoP7hkXCcHr0At+Ge/5GllFG1WJNcdrnDyT9/tesSLyulhEqz6mgXA2vVtoKeEPCmd2VVuTT0aUnA==
X-Gm-Message-State: AOJu0YyN4ycpFfg2T7ZMKyBJ9PkkDEOoXTDGwWL2CLNvUQr9KdGQfecl
	mxf59FUc6QeLoKJ9b4jeqXM7dEzothl2IG1tqvITR0Yt/XpbtrTRLmGheKPqxlXHDt4HhptKiF8
	hGbHoyY/IXbBhM38fbyd8Vq/Sm+uZP5y0DyyCug==
X-Google-Smtp-Source: AGHT+IFsWPFr8p78DsaOJ4IVt+skDa7EL1Ymt4GtJo1evSDlcMH/wDnYhG+FUPuv3o6FilN6Lhm6EDdd6fD4yyh2xpM=
X-Received: by 2002:a81:920f:0:b0:61b:33e1:9641 with SMTP id
 00721157ae682-652d582166amr12390047b3.13.1720092215000; Thu, 04 Jul 2024
 04:23:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628140435.1652374-1-quic_bibekkum@quicinc.com>
 <20240628140435.1652374-5-quic_bibekkum@quicinc.com> <ueuhu5xfzp2rnuxzeqqd6cho476adidztgx7oq2tbiufauv6h4@obblpxvqwnno>
 <6da77880-2ba4-4b02-8b3e-cb0fbd0a9daf@quicinc.com>
In-Reply-To: <6da77880-2ba4-4b02-8b3e-cb0fbd0a9daf@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 Jul 2024 14:23:23 +0300
Message-ID: <CAA8EJpqXfqKSi-j3NsAzQA4hOLndFZSPAiL1YpwnxMgbgrWokA@mail.gmail.com>
Subject: Re: [PATCH v13 4/6] iommu/arm-smmu: add ACTLR data and support for SM8550
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, 
	konrad.dybcio@linaro.org, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jul 2024 at 15:15, Bibek Kumar Patro
<quic_bibekkum@quicinc.com> wrote:
>
>
>
> On 7/2/2024 12:04 AM, Dmitry Baryshkov wrote:
> > On Fri, Jun 28, 2024 at 07:34:33PM GMT, Bibek Kumar Patro wrote:
> >> Add ACTLR data table for SM8550 along with support for
> >> same including SM8550 specific implementation operations.
> >>
> >> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> >> ---
> >>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 89 ++++++++++++++++++++++
> >>   1 file changed, 89 insertions(+)
> >>
> >> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> index 77c9abffe07d..b4521471ffe9 100644
> >> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> >> @@ -23,6 +23,85 @@
> >>
> >>   #define CPRE                       (1 << 1)
> >>   #define CMTLB                      (1 << 0)
> >> +#define PREFETCH_SHIFT              8
> >> +#define PREFETCH_DEFAULT    0
> >> +#define PREFETCH_SHALLOW    (1 << PREFETCH_SHIFT)
> >> +#define PREFETCH_MODERATE   (2 << PREFETCH_SHIFT)
> >> +#define PREFETCH_DEEP               (3 << PREFETCH_SHIFT)
> >> +
> >> +static const struct actlr_config sm8550_apps_actlr_cfg[] = {
> >> +    { 0x18a0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> >> +    { 0x18e0, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> >> +    { 0x0800, 0x0020, PREFETCH_DEFAULT | CMTLB },
> >> +    { 0x1800, 0x00c0, PREFETCH_DEFAULT | CMTLB },
> >> +    { 0x1820, 0x0000, PREFETCH_DEFAULT | CMTLB },
> >> +    { 0x1860, 0x0000, PREFETCH_DEFAULT | CMTLB },
> >> +    { 0x0c01, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
> >
> > - Please keep the list sorted
>
> Sure Dmitry, will sort this list in reverse-christmas-tree order
> in next iteration. Thanks for this input.

Why? Just sort basing on SID.

>
> > - Please comment, which devices use these settings.
>
> As discussed in earlier versions of this patch, these table entries
> are kind of just blind values for SMMU device, where SMMU do not have
> idea on which SID belong to which client. During probe time when the
> clients' Stream-ID has corresponding ACTLR entry then the driver would
> set value in register.
> Also some might have their prefetch settings as proprietary.
> Hence did not add the comments for device using these settings.

Please mention devices that are going to use the SIDs.


>
>
> Thanks & regards,
> Bibek
>
> >
> >> +    { 0x0c02, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x0c03, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x0c04, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x0c05, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x0c06, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x0c07, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x0c08, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x0c09, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x0c0c, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x0c0d, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x0c0e, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x0c0f, 0x0020, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x1961, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x1962, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x1963, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x1964, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x1965, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x1966, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x1967, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x1968, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x1969, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x196c, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x196d, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x196e, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x196f, 0x0000, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x19c1, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x19c2, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x19c3, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x19c4, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x19c5, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x19c6, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x19c7, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x19c8, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x19c9, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x19cc, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x19cd, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x19ce, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x19cf, 0x0010, PREFETCH_DEEP | CPRE | CMTLB },
> >> +    { 0x1c00, 0x0002, PREFETCH_SHALLOW | CPRE | CMTLB },
> >> +    { 0x1c01, 0x0000, PREFETCH_DEFAULT | CMTLB },
> >> +    { 0x1920, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> >> +    { 0x1923, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> >> +    { 0x1924, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> >> +    { 0x1940, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> >> +    { 0x1941, 0x0004, PREFETCH_SHALLOW | CPRE | CMTLB },
> >> +    { 0x1943, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> >> +    { 0x1944, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> >> +    { 0x1947, 0x0000, PREFETCH_SHALLOW | CPRE | CMTLB },
> >> +};
> >> +
> >> +static const struct actlr_config sm8550_gfx_actlr_cfg[] = {
> >> +    { 0x0000, 0x03ff, PREFETCH_DEEP | CPRE | CMTLB },
> >> +};
> >> +
> >> +static const struct actlr_variant sm8550_actlr[] = {
> >> +    {
> >> +            .io_start = 0x15000000,
> >> +            .actlrcfg = sm8550_apps_actlr_cfg,
> >> +            .num_actlrcfg = ARRAY_SIZE(sm8550_apps_actlr_cfg)
> >> +    }, {
> >> +            .io_start = 0x03da0000,
> >> +            .actlrcfg = sm8550_gfx_actlr_cfg,
> >> +            .num_actlrcfg = ARRAY_SIZE(sm8550_gfx_actlr_cfg)
> >> +    },
> >> +};
> >>
> >>   static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
> >>   {
> >> @@ -606,6 +685,15 @@ static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
> >>      /* Also no debug configuration. */
> >>   };
> >>
> >> +
> >> +static const struct qcom_smmu_match_data sm8550_smmu_500_impl0_data = {
> >> +    .impl = &qcom_smmu_500_impl,
> >> +    .adreno_impl = &qcom_adreno_smmu_500_impl,
> >> +    .cfg = &qcom_smmu_impl0_cfg,
> >> +    .actlrvar = sm8550_actlr,
> >> +    .num_smmu = ARRAY_SIZE(sm8550_actlr),
> >> +};
> >> +
> >>   static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
> >>      .impl = &qcom_smmu_500_impl,
> >>      .adreno_impl = &qcom_adreno_smmu_500_impl,
> >> @@ -640,6 +728,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
> >>      { .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
> >>      { .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
> >>      { .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
> >> +    { .compatible = "qcom,sm8550-smmu-500", .data = &sm8550_smmu_500_impl0_data },
> >>      { .compatible = "qcom,smmu-500", .data = &qcom_smmu_500_impl0_data },
> >>      { }
> >>   };
> >> --
> >> 2.34.1
> >>
> >



--
With best wishes
Dmitry

