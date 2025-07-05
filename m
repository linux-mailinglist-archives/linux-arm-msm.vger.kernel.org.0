Return-Path: <linux-arm-msm+bounces-63821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72557AFA065
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 16:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF0B33B23DE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 14:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5351C2DB2;
	Sat,  5 Jul 2025 14:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FFrIZmK9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740BF19F127
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 14:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751724579; cv=none; b=V44iPSHovMXty5AIsojkeDLzQgpzvw97/6ts3qiW4KVvXum5IDja3hmYZr/JyjxVgSYRATsnKvgjvCung1REPdgol2BudpILEAnHocR3N+tViTRdmIvJIiCgadKRwrRFsu/8NAfAl16zfWZR1VLvXjJEnynNrE57hBJh3BceoPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751724579; c=relaxed/simple;
	bh=yOeiKu4mBtr8VePwwU0rZXUhI1GOxOg8XAX7p3WgG6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=acspSmaotXWQwECCtp6mzIsktHMIf8Hwk96tSGnQnfg3CMu06FNVvNLaXTTs6RYEGRSOIAKEHFkpFlvkbH+89ZH9n+0x7F+wgr6KUkcst671U+O1IcPSa8/Y1ibIlpHaV+wruWj7VKbBCNkIGNXSCPRUxkQVF5vFZ3n3H6MzonI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFrIZmK9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565BSstU002901
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 14:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=+R5R9I2nJrR2QShZ+dop4SkxfXqvIouFXsGw6h1onwA=; b=FF
	rIZmK98gOrDFTgLpU9cYQ6OJaKD7SMjEijqzCCkcnWOo/d1sJ/4HiX224ZtEUo0w
	OPrNiZj418+PzDvvDYjaV6JFPTocuepmeydVVG6y/PPNSlA8iyokzw+2L6gmolnA
	jN/IQlRu7CS9nN/G1mtzbXBHPctrCfm/R4YzAdbC1tT8bbPxcb6ZIemYHxHp2iC7
	GQu8c0SCvA7vUhza9RacY1pmkgvMSEN8KCh3sigeQe7eKReZBPQDTbzQuzHFPZJ3
	efbVo67SqtJHs0jlypt14J8w142X4hlGj3Te/RcjIn+oBhXfFvnZ+G7+S3Tzu8t5
	mGJ8/PLGQ5SnfkLA/DFg==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv9713v6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 14:09:36 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-40b27a33cd8so1707636b6e.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 07:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751724575; x=1752329375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+R5R9I2nJrR2QShZ+dop4SkxfXqvIouFXsGw6h1onwA=;
        b=kln26PtbeeghEqaIeONW1S9G3SzK44x2RQWLnzgM9eD0CKAAj4KzgVwhXvFspyMccq
         x3ZS5+RVNfleIP2d1zVj4ym+nWaPdeAfHTdvZt6sBSTdq97gg77Fcy2U3PIIKfYtk9c2
         /R8nTaNt2AoWKEkDzfhyTQdquPQuEEZEUQ5R0Be9ZYsehjTgrxHJq4m7kJlo9GlxyJYv
         yeMqV5Q7qcGF17aKU0y8F8MUHCMiAPF4QC0S6kr66I1ImAxFarAeS99/BRPTuAmy/5wL
         Cvzv66S2nereydMMSEkcMY7xai7Xap2VobcoxmQRZ8iq0n4RCk5aAbHV5mOAQtSQ7TwI
         h8yA==
X-Forwarded-Encrypted: i=1; AJvYcCVy3/9L/vZImWaG3afEVyR5TT9iGYwp41BxZiYFUoQDVOxw2cpMBo2Ld8XA2SifO+GxEzfb6zbhcwSl1oNO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4EVrQfqFF9eA5/LF6e2J+41yFssqAy4jTrrtUCVvO6MQ6EhcH
	vbu5Ls/gbuauA/PG1cYHtAPOmZEcOa1SL2gVdnBSXEmTIi9gqfCacmw2ip77sXPBcBOp6D2JBWW
	nDS96/g2LXQkJsiUHr+pioLS21qN6GmipId79aolVpKk+/f+Vto4tfN85Q2NphBcsQOYSyUxYvL
	f1Un9exkMJvXHAGSjRBNiBr+1PpguQLCF3mbMuOVO/bAU=
X-Gm-Gg: ASbGncsTRmTa5yS/6w548fXKhcTYIMNRSCenhHLT+V9+zQWySx7rKIGqr4sd1HOWUwY
	tBF9ZZdZVI6b2Qh1r6BM+sHtuuCXGSZ0rMpSq5cfNcJFXhRfVnKTT/7iLcs+/ccSo49XXyB5OmI
	AP8fRLg+9Ca2uVTavWWRgH5bCVqYDPq8gfhKs=
X-Received: by 2002:a05:6808:118b:b0:406:794b:462 with SMTP id 5614622812f47-40d071d00d9mr3649975b6e.0.1751724575183;
        Sat, 05 Jul 2025 07:09:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA3q5wqh/EEUmvvZC73mDnOVowdgQnzs4lFfcQ936+1v/mgxLsm36MjdYRojGl9YJyJa80drv/pWEU7h6E+Pc=
X-Received: by 2002:a05:6808:118b:b0:406:794b:462 with SMTP id
 5614622812f47-40d071d00d9mr3649953b6e.0.1751724574700; Sat, 05 Jul 2025
 07:09:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v1-1-ef725033651c@oss.qualcomm.com>
In-Reply-To: <20250705-iommu-fix-prr-v1-1-ef725033651c@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 5 Jul 2025 07:09:23 -0700
X-Gm-Features: Ac12FXy3XxVN2bch22DCGw0GFR8wOdtcX4y80G4QjD1Fqf0Tx93RWyLsTzUvS5k
Message-ID: <CACSVV01nA4jbeUx-cbbKKvr0GPaLo=RtBJD-mYazFRnwbV0Wwg@mail.gmail.com>
Subject: Re: [PATCH] iommu/arm-smmu: disable PRR on some of SMMU-500 platforms
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=68693220 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=gUAwG1mKp6tzq-jN0zEA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA5MiBTYWx0ZWRfX2Bwk48mY2pqC
 fXXIgcXhOBGiTR94+56ASGeDA2BwdCj96wPmjE+1h7p8rIPJiAgzQV0Yp4t0CLl9PmOel+OoncD
 tB8VLqTFdOLEr4LaNGGOCvcaLFi3PpdIt8xg538RuWdlOSsgJz7V+P7JJg47UDSgqsLSEqjQwYG
 n8H/Y1r4kLlfeqWMiZCufV5m5ocKG3dS3KcOPARoE3VqJMLFI3Cankd+BREwF1b/wgi6ib+4bm2
 yrjORuJ8yHsn+/i8ksNWSSBxEtZrJ4uxjF+L0Y/5mcUCHjy4kNmSHm0rDxu6o3hQS/4XNduXFea
 FZkFNxNZzhm1oQ8qKXW1rmb3cZ9TSLmnZc7FTfz4qwolgoMJ1uuTAex4mkOTQYFMHPQ/AehavXA
 BhwwXipaGZKiWe24MeERZJ5UdJBntIn/YBRf7lxsvel8FkSM8/giaX6oz3DuwHfq/c10iObf
X-Proofpoint-GUID: 3XxHEatVZs9njc4_9Fsd3AsE7GtdlNdi
X-Proofpoint-ORIG-GUID: 3XxHEatVZs9njc4_9Fsd3AsE7GtdlNdi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050092

On Sat, Jul 5, 2025 at 2:55=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On some of the platforms (e.g. SM8250 / QRB5165-RB5) using PRR bits
> resets the device, most likely because of the hyp limitations. Disable
> PRR support on that platform. Instead of adding more compatible checks,
> set PRR-related callbacks through the match data, making it easier for
> other platforms to apply the same workaround.
>
> Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> I currently don't have access to other devices from these generations.
> It might be necessary to apply the same workaround to other platforms.

It appears that a650 is the one special one:

https://github.com/LineageOS/android_kernel_qcom_sm8550-modules/blob/lineag=
e-21/qcom/opensource/graphics-kernel/adreno.c#L1257-L1262
https://github.com/LineageOS/android_kernel_qcom_sm8550-modules/blob/lineag=
e-21/qcom/opensource/graphics-kernel/kgsl_iommu.c#L2657-L2671

so I think we can go with a simpler compatible check

BR,
-R

> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 134 ++++++++++++++++++-----=
------
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  11 ++-
>  2 files changed, 91 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..f1cb30cd99af6020a8b472f11=
d4999ad70d0bce0 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -55,6 +55,11 @@ static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_=
device *smmu)
>         return container_of(smmu, struct qcom_smmu, smmu);
>  }
>
> +static const struct qcom_smmu_impl *to_qcom_smmu_impl(const struct arm_s=
mmu_impl *base)
> +{
> +       return container_of(base, struct qcom_smmu_impl, base);
> +}
> +
>  static void qcom_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
>                                 int sync, int status)
>  {
> @@ -313,9 +318,9 @@ static void qcom_smmu_set_actlr_dev(struct device *de=
v, struct arm_smmu_device *
>  static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_do=
main,
>                 struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
>  {
> -       const struct device_node *np =3D smmu_domain->smmu->dev->of_node;
>         struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>         struct qcom_smmu *qsmmu =3D to_qcom_smmu(smmu);
> +       const struct qcom_smmu_impl *qsmmu_impl =3D to_qcom_smmu_impl(smm=
u->impl);
>         const struct of_device_id *client_match;
>         int cbndx =3D smmu_domain->cfg.cbndx;
>         struct adreno_smmu_priv *priv;
> @@ -351,14 +356,8 @@ static int qcom_adreno_smmu_init_context(struct arm_=
smmu_domain *smmu_domain,
>         priv->set_ttbr0_cfg =3D qcom_adreno_smmu_set_ttbr0_cfg;
>         priv->get_fault_info =3D qcom_adreno_smmu_get_fault_info;
>         priv->set_stall =3D qcom_adreno_smmu_set_stall;
> -       priv->set_prr_bit =3D NULL;
> -       priv->set_prr_addr =3D NULL;
> -
> -       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> -                       of_device_is_compatible(np, "qcom,adreno-smmu")) =
{
> -               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> -               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
> -       }
> +       priv->set_prr_bit =3D qsmmu_impl->set_prr_bit;
> +       priv->set_prr_addr =3D qsmmu_impl->set_prr_addr;
>
>         return 0;
>  }
> @@ -558,65 +557,89 @@ static int qcom_sdm845_smmu500_reset(struct arm_smm=
u_device *smmu)
>         return ret;
>  }
>
> -static const struct arm_smmu_impl qcom_smmu_v2_impl =3D {
> -       .init_context =3D qcom_smmu_init_context,
> -       .cfg_probe =3D qcom_smmu_cfg_probe,
> -       .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .write_s2cr =3D qcom_smmu_write_s2cr,
> -       .tlb_sync =3D qcom_smmu_tlb_sync,
> +static const struct qcom_smmu_impl qcom_smmu_v2_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_smmu_init_context,
> +               .cfg_probe =3D qcom_smmu_cfg_probe,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .write_s2cr =3D qcom_smmu_write_s2cr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
> +       },
>  };
>
> -static const struct arm_smmu_impl qcom_smmu_500_impl =3D {
> -       .init_context =3D qcom_smmu_init_context,
> -       .cfg_probe =3D qcom_smmu_cfg_probe,
> -       .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .reset =3D arm_mmu500_reset,
> -       .write_s2cr =3D qcom_smmu_write_s2cr,
> -       .tlb_sync =3D qcom_smmu_tlb_sync,
> +static const struct qcom_smmu_impl qcom_smmu_500_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_smmu_init_context,
> +               .cfg_probe =3D qcom_smmu_cfg_probe,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .reset =3D arm_mmu500_reset,
> +               .write_s2cr =3D qcom_smmu_write_s2cr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
>  #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
> -       .context_fault =3D qcom_smmu_context_fault,
> -       .context_fault_needs_threaded_irq =3D true,
> +               .context_fault =3D qcom_smmu_context_fault,
> +               .context_fault_needs_threaded_irq =3D true,
>  #endif
> +       },
>  };
>
> -static const struct arm_smmu_impl sdm845_smmu_500_impl =3D {
> -       .init_context =3D qcom_smmu_init_context,
> -       .cfg_probe =3D qcom_smmu_cfg_probe,
> -       .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .reset =3D qcom_sdm845_smmu500_reset,
> -       .write_s2cr =3D qcom_smmu_write_s2cr,
> -       .tlb_sync =3D qcom_smmu_tlb_sync,
> +static const struct qcom_smmu_impl sdm845_smmu_500_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_smmu_init_context,
> +               .cfg_probe =3D qcom_smmu_cfg_probe,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .reset =3D qcom_sdm845_smmu500_reset,
> +               .write_s2cr =3D qcom_smmu_write_s2cr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
>  #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
> -       .context_fault =3D qcom_smmu_context_fault,
> -       .context_fault_needs_threaded_irq =3D true,
> +               .context_fault =3D qcom_smmu_context_fault,
> +               .context_fault_needs_threaded_irq =3D true,
>  #endif
> +       },
> +};
> +
> +static const struct qcom_smmu_impl qcom_adreno_smmu_v2_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_adreno_smmu_init_context,
> +               .cfg_probe =3D qcom_adreno_smmuv2_cfg_probe,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_ba=
nk,
> +               .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
> +               .context_fault_needs_threaded_irq =3D true,
> +       },
>  };
>
> -static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl =3D {
> -       .init_context =3D qcom_adreno_smmu_init_context,
> -       .cfg_probe =3D qcom_adreno_smmuv2_cfg_probe,
> -       .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_bank,
> -       .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> -       .tlb_sync =3D qcom_smmu_tlb_sync,
> -       .context_fault_needs_threaded_irq =3D true,
> +static const struct qcom_smmu_impl qcom_adreno_smmu_500_noprr_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_adreno_smmu_init_context,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .reset =3D arm_mmu500_reset,
> +               .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_ba=
nk,
> +               .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
> +               .context_fault_needs_threaded_irq =3D true,
> +       },
>  };
>
> -static const struct arm_smmu_impl qcom_adreno_smmu_500_impl =3D {
> -       .init_context =3D qcom_adreno_smmu_init_context,
> -       .def_domain_type =3D qcom_smmu_def_domain_type,
> -       .reset =3D arm_mmu500_reset,
> -       .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_bank,
> -       .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> -       .tlb_sync =3D qcom_smmu_tlb_sync,
> -       .context_fault_needs_threaded_irq =3D true,
> +static const struct qcom_smmu_impl qcom_adreno_smmu_500_impl =3D {
> +       .base =3D {
> +               .init_context =3D qcom_adreno_smmu_init_context,
> +               .def_domain_type =3D qcom_smmu_def_domain_type,
> +               .reset =3D arm_mmu500_reset,
> +               .alloc_context_bank =3D qcom_adreno_smmu_alloc_context_ba=
nk,
> +               .write_sctlr =3D qcom_adreno_smmu_write_sctlr,
> +               .tlb_sync =3D qcom_smmu_tlb_sync,
> +               .context_fault_needs_threaded_irq =3D true,
> +       },
> +       .set_prr_bit =3D qcom_adreno_smmu_set_prr_bit,
> +       .set_prr_addr =3D qcom_adreno_smmu_set_prr_addr,
>  };
>
>  static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *=
smmu,
>                 const struct qcom_smmu_match_data *data)
>  {
>         const struct device_node *np =3D smmu->dev->of_node;
> -       const struct arm_smmu_impl *impl;
> +       const struct qcom_smmu_impl *impl;
>         struct qcom_smmu *qsmmu;
>
>         if (!data)
> @@ -639,7 +662,7 @@ static struct arm_smmu_device *qcom_smmu_create(struc=
t arm_smmu_device *smmu,
>         if (!qsmmu)
>                 return ERR_PTR(-ENOMEM);
>
> -       qsmmu->smmu.impl =3D impl;
> +       qsmmu->smmu.impl =3D &impl->base;
>         qsmmu->data =3D data;
>
>         return &qsmmu->smmu;
> @@ -686,6 +709,13 @@ static const struct qcom_smmu_match_data qcom_smmu_5=
00_impl0_data =3D {
>         .client_match =3D qcom_smmu_actlr_client_of_match,
>  };
>
> +static const struct qcom_smmu_match_data qcom_smmu_500_impl0_noprr_data =
=3D {
> +       .impl =3D &qcom_smmu_500_impl,
> +       .adreno_impl =3D &qcom_adreno_smmu_500_noprr_impl,
> +       .cfg =3D &qcom_smmu_impl0_cfg,
> +       .client_match =3D qcom_smmu_actlr_client_of_match,
> +};
> +
>  /*
>   * Do not add any more qcom,SOC-smmu-500 entries to this list, unless th=
ey need
>   * special handling and can not be covered by the qcom,smmu-500 entry.
> @@ -712,7 +742,7 @@ static const struct of_device_id __maybe_unused qcom_=
smmu_impl_of_match[] =3D {
>         { .compatible =3D "qcom,sm6375-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
>         { .compatible =3D "qcom,sm7150-smmu-v2", .data =3D &qcom_smmu_v2_=
data },
>         { .compatible =3D "qcom,sm8150-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
> -       { .compatible =3D "qcom,sm8250-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
> +       { .compatible =3D "qcom,sm8250-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_noprr_data },
>         { .compatible =3D "qcom,sm8350-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
>         { .compatible =3D "qcom,sm8450-smmu-500", .data =3D &qcom_smmu_50=
0_impl0_data },
>         { .compatible =3D "qcom,smmu-500", .data =3D &qcom_smmu_500_impl0=
_data },
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.h
> index 8addd453f5f1c9659fbfbc68a84a3ab1267b356e..e805ad604339463b706a43e35=
9ccca657d42a602 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
> @@ -24,10 +24,17 @@ struct qcom_smmu_config {
>         const u32 *reg_offset;
>  };
>
> +struct qcom_smmu_impl {
> +       struct arm_smmu_impl base;
> +
> +       void (*set_prr_bit)(const void *cookie, bool set);
> +       void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
> +};
> +
>  struct qcom_smmu_match_data {
>         const struct qcom_smmu_config *cfg;
> -       const struct arm_smmu_impl *impl;
> -       const struct arm_smmu_impl *adreno_impl;
> +       const struct qcom_smmu_impl *impl;
> +       const struct qcom_smmu_impl *adreno_impl;
>         const struct of_device_id * const client_match;
>  };
>
>
> ---
> base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
> change-id: 20250705-iommu-fix-prr-600451b1d304
>
> Best regards,
> --
> With best wishes
> Dmitry
>

