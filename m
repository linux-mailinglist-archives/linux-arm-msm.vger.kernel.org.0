Return-Path: <linux-arm-msm+bounces-63858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2453AFA62A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 17:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3941D16BD54
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 15:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A112874F7;
	Sun,  6 Jul 2025 15:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXT/UdV3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0168523815F
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 15:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751815234; cv=none; b=hnd94C69tW1fkNHJ7eagpQj+Gn81Wdj6cDd7LW71CwpiS/Hubu8wFmbHEHVQqUxsdagqDCX3d5EpG9wb2N2qQvLuHN5Rf+Srpt+WyJVRo6UirRTIFKm/g2e/Gh3n2a7tT20nkUs0ig1jXSbrobis28Tog1kBfmuvWFGGQoB7Xx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751815234; c=relaxed/simple;
	bh=+z1wjg10ZMq9xbw7PHPnNseuKsBQ72DoDrEYmBvqDy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BTvim9xn2G7mc+0qdxbq1aheMAqVGrwSWwsRyqMTil2X2rPTrr5K447+sGl/6MfIkAqq9p2LIWuVk3+191sLmi9IgBxLlVjCd8JMmiFEPTV71Ada+0momiKDD+8QAk/WA0XtDpkEPYKe+eGESjH2qJRRVhd1PoGCXcxbansWvWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXT/UdV3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566Ds3bY016877
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 15:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=dLFAbZ9MMfXUGoM7SgNEwHVpWiLq2JEVpU4msHTUWsw=; b=OX
	T/UdV3HYwYj0Ws0XuBFaj7YM6bc16bVP4VclQN+0EXkqPsQgFvHeAVoznuZi7pgs
	+B9ur+s0e//caRQ1yp2Nvy9UyjCbmy+32YGVNfitc0L3J6LZSXoXiacu+QQDMfyo
	gLBjZdSoY/xFGbMr+qTAXnKOCOo5JEmLDrJWyWF+MjQ4vvUiC/eeFrHFB4Ua0Lgi
	3vrAJt9wKZiCO05Z2V9r2oazm73Hqt4b/cp3e/z4DZs9wCY5/vKknb4YeC40+VHN
	qKwcuDO40vkYc6q45Iex+iugOznNb+gTWdpsXmwDJPBj0ufeEHvMxSKC3aMSvbMT
	wX9NmNU4mRWnSAmLODKQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q4q5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 15:20:32 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4067aeea8c0so607196b6e.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 08:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751815231; x=1752420031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dLFAbZ9MMfXUGoM7SgNEwHVpWiLq2JEVpU4msHTUWsw=;
        b=wxLiUWwFWc1zQX5qociZKMGP8vFx3C7fZevprDiLG85j+4yOXx4vFDHZzbtzE+SpP5
         yeHp4Uyjk8hvfZoITv11vumPzY7rPzwzHnCrt1JPzu8lHkAR6IefQMWydX/WnXceW/V7
         9DSb9RbAhZ86f7k7lK0s5aRrRilzY4O41AOlf/fHnRHsZlLv+eQxfZw9i7ZXtTczVwnm
         ztbQxe0vdfKz/ycbHMenwPrwW7SW42rnruv/RcFmkz2/w4NqsIAq4JSz0U/S0fhTJRoQ
         jEtF7frRuLKGlJXsrELEcOqBvLWyLm+CluMTvTuO8WDC89+PU6pKyxEcnUbu9iLB3gHj
         uhzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU62dB48sLYOC3/jls2t/Kyk5l6IPxUjKjB/ion5Fdjxau0vDaBOrxaiWm/ex1kggLsP2PtGVx+VG0/JCRa@vger.kernel.org
X-Gm-Message-State: AOJu0YwkSfNUvzG377KF/YA6pDMdTwxOy3BGZHyVH2CFuFKvmwvNzmCl
	IAQhJw2SX4Kp6/ISFEzginVDhEhu0sILZvZi9DdCvz73rCYLJdJwYE3QxUJiWxnm4eV3GmaQtsj
	MjCY/kTNTWjzOQZtn/vjWEE9gN9/z5rf1imADhkDU7wXgeJn8xLbibZAWqf3/Mgv0ej4For3Ll1
	zXoUF0Gl/hDDqdup33zxi77m1gBB8ZOvpsLR6MNRpq/b+kQ33a3g8=
X-Gm-Gg: ASbGnctdx4Q+46vlXqUT+x50CADqdFvc9f6uAypOv1GC2IkShxNLEqJMvyywjItRKnF
	woSsDdDKruNoKpy+/41vIfa14RWdn/X1yJo3x77CRFZDFZWHCNfnqjJTB10i2ysIQ+azTKRUkIa
	oJthwZRM5dCbTohlPZgp3YwG1SEvT/f+7+GvM=
X-Received: by 2002:a05:6808:4701:b0:409:c6:c147 with SMTP id 5614622812f47-40d2b4715f8mr3439873b6e.6.1751815231018;
        Sun, 06 Jul 2025 08:20:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQ19HjfWS2qJ+/2HG/poPWfm2s0tMKpeheNoz9fX/o+Q8VwG+3oADAA9x4xsA7IVI4FHzXquARSSMgABetSuE=
X-Received: by 2002:a05:6808:4701:b0:409:c6:c147 with SMTP id
 5614622812f47-40d2b4715f8mr3439853b6e.6.1751815230643; Sun, 06 Jul 2025
 08:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com> <c20a9713-6f8d-4c20-a031-dc448404d073@oss.qualcomm.com>
In-Reply-To: <c20a9713-6f8d-4c20-a031-dc448404d073@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 08:20:19 -0700
X-Gm-Features: Ac12FXyNtpZjdRENeNHXo5Q0MJXp9o0sqLqUTlypqwb-wsX2wlCghESA5aSIn6I
Message-ID: <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/arm-smmu: disable PRR on SM8250
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA5NyBTYWx0ZWRfXxIpcQnNy3jko
 kggH+GK5a5R0attCrxND8SxYzhFnbR1JHL+yecoT3gdjJOhIQ+6QwI6+FjKeKulXoiY3zvmwRvp
 o0xMjT1gz/Me2+eUaoScZ0VqGdDtDM084S4mRLaxt6M7dS3WnQXTDATlCjJOMXNEgkAWpDWn46n
 7f3p4Qjm7z4BFRfr4jfr9Ypz+DEYfV+El4O/GC9kcf2ASv0bdaqlXjsIJjco1KZ2sip9VVbADQL
 jsOl0LlBq1GJk7AiAjKeJA3oGa68ZjPnoAgvX7QRPvfDRaQi++CNmxHJgWmv0AoEs8ef1YiF2xa
 QZvFyJvRswqVWHpG288VtiYuLvhN2zPEcKQ0Lguxd+vawndv9MG3zXPawSoOr4HUkUH4ohwTEGy
 IAPHNO2WNrQ4u2VT/K51p1yjV2fQTTTj9YX8Z8rGIVxOfiza0PNczTFQPuZo9PUzQOJ2A5sj
X-Proofpoint-GUID: AX0hJc8MFk58WP9-H7s22tfSHEWttS1c
X-Proofpoint-ORIG-GUID: AX0hJc8MFk58WP9-H7s22tfSHEWttS1c
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686a9440 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=NKDI3HYFCsqCqSkob8kA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060097

On Sun, Jul 6, 2025 at 7:22=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcomm=
.com> wrote:
>
> On 7/5/2025 9:38 PM, Dmitry Baryshkov wrote:
> > On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> > because of the hyp limitations. Disable PRR support on that platform.
> >
> > Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>
> Unfortunately, there is no way to detect firmware support for PRR safely
> from KMD.

I still am a bit curious about whether it is the ACLTR write that
trips the fw out (doubtful, since we write other bits in that reg
AFAICT) or the PRR_CFG_LADDR/UADDR write that does it.  In the latter
case we could potentially use a reserved-region for the PRR page,
instead of dynamically allocating it (if we knew what values are in
LADDR/UADDR.. I guess 0x0?) to avoid reduced vk functionality on these
devices.  AFAIU the vk extensions that depend on PRR are required for
vkd3d.

BR,
-R

> -Akhil.
>
> > ---
> > I currently don't have access to other devices from these generations.
> > It might be necessary to apply the same workaround to other platforms.
> > ---
> > Changes in v2:
> > - Simplify the workaround as the issue seems to be limited to SM8250
> >   only (Rob)
> > - Link to v1: https://lore.kernel.org/r/20250705-iommu-fix-prr-v1-1-ef7=
25033651c@oss.qualcomm.com
> > ---
> >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu=
/arm/arm-smmu/arm-smmu-qcom.c
> > index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..53d88646476e9f193a6275d=
9c3ee3d084c215362 100644
> > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > @@ -355,7 +355,8 @@ static int qcom_adreno_smmu_init_context(struct arm=
_smmu_domain *smmu_domain,
> >       priv->set_prr_addr =3D NULL;
> >
> >       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> > -                     of_device_is_compatible(np, "qcom,adreno-smmu")) =
{
> > +         !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
> > +         of_device_is_compatible(np, "qcom,adreno-smmu")) {
> >               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> >               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
> >       }
> >
> > ---
> > base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
> > change-id: 20250705-iommu-fix-prr-600451b1d304
> >
> > Best regards,
>

