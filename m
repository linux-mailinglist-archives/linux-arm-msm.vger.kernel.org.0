Return-Path: <linux-arm-msm+bounces-63859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D51ECAFA62C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 17:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CAAD189B2C9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jul 2025 15:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224FA287240;
	Sun,  6 Jul 2025 15:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iq5x2Ava"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A2520E710
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Jul 2025 15:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751815344; cv=none; b=q5q6E0p6pglmO1G+pYROnJ2Acy+r7o2cHEmTU1FVYdUD8PdJh3vBbsVPRvieW5xAtijCzLfHK/zDfcY+c/g+3BpWx1DqsmPcmE7s7PHVwoBrX3LF7dGU67X1nJA+lJJAw8Ix4Jz5QVpEgHpeirobq52ZKAzVNZ6t8DdNgD3manU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751815344; c=relaxed/simple;
	bh=ezpW7ldJRIC7Zg98MoY/zC+5fz3i6rhShxcE+Y3sVFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qpgh8ts52TfszKYfSyjz8Puz7xbROTUWmtRnlMnY8lnsT9FbgjF9k03fOkLJibYTaKM5EAXNBq8McLNo2SfpoLbG1C7WS8vm+xhPsojXlULiU/Z99dMuOVby1Gv8WzoMHXYQ8qLyd/g/YPA2dcoDzgNiPYslHwUAI2baHHrdbUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iq5x2Ava; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566EbWUl015008
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Jul 2025 15:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=P7a2bjEwtLaeZv6/yuv6VWE4+I4liPfgiifrZIyyTIU=; b=iq
	5x2Ava7fg/Abq2+gXbabN1H2M8WGVoy/wY/lgL55PSd40jJVxI/OkDwcKvXDgC48
	uXLuFdJ8smq3AXiB07OBeoBC6vonR01VS+Qrbs2HCONFUUXSUPPCaKDtIoH+17pk
	wt3HuCUTn8nrx4h8s7oEVwpH2oUalcK/K9H15OAQei/DtmqhGtmvhbwz0xMCuSxx
	d2C3PFUh11q8ekBxQgOnwBeb/qHknHNYsrAsamzddZ9MyU7gI2u8+ypNm9MmNMm2
	cH925qy8ijBMO5DGJ0VOCDTBQK5NgKo/DY+0r/6mWvcY5LEGX/bYmau2czI/CKy8
	TsC2Sqxf/adf02cBen1g==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2an225-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 15:22:21 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-40b9377347fso2238832b6e.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 08:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751815340; x=1752420140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P7a2bjEwtLaeZv6/yuv6VWE4+I4liPfgiifrZIyyTIU=;
        b=jgu6JnO3YQWQPLSYNE7LcOShkdyx4gSrXFcMVUngEHYqQe2zkOgu19/X/rGET0J04V
         Y1J5QyjjZaQ9atS2b+pCUFZ7FOAB2fe3Gg3X0x53zTDiPokFJSwx9P7VdcSXnveJUW3N
         /6akJC7uo5wutrl5szma79+LiaBV74p+V0ZCSPnjn9rBt4TOZ6PYbb5dSn6U3JaJzoVw
         rFg1nIfL8krjWnBQ2bcOgMOPicLo4yXqPxFpGPISatvT0qivlSPP1KU6kNfmSfSVYfGN
         vPwS0q92Dxk+H2rd+eOQJTQy7oO9KAzTjGGFxvxlAeX1Zp808BH6OzqGgQy4Oy3xiPED
         oe8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4TUYxhtSo6sG9EEwgUNM8xApcCa4A7g3t2oTjc51b58VwrPhN2occEjAwqkbiB6tmWz/8rhOH8bYnsuj+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5pfy5Uglossqad+zJLYSlPNfx8keA4O535/GAwYY65EYfSIaV
	l1amlXF2zrLmOPE6hHMmjyrXKOJ6zeiO6tierY4ieCBejnLUc7ik1tr2XV0xm35Wbbg5UNK4foL
	tD0W+QxayM4dPiCgawYyuS0E2P91Xr1f29AqeIcQErpIyZjjd1FiCbqkaWgoK6EQukAEx7Q1Lgg
	KfNeaG2o3dAIncPJMuCX476v1VEEaWtSVQsBh4obxhEl4=
X-Gm-Gg: ASbGncvwQFFoawgvkMGeHN/fysKAZsNVb9gBeeXLCbE17mLRLxKGXXuSRPcpfZ/58Cu
	8NiEKuumm/7JyWgDd/DT90KR0gCXmlTS1zX+yRg0HYV2JQdVD/DpCW/bTtmW/K//Rjbz2fTX0Cy
	ufv2EXSNL352sSwkM8MoR19CIFGc0QVTW0OQI=
X-Received: by 2002:a05:6808:171a:b0:408:fb4c:859e with SMTP id 5614622812f47-40d0408029dmr6005851b6e.6.1751815340289;
        Sun, 06 Jul 2025 08:22:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxN5stcqiqcPo2g1epxKXVWRAu9xnt9wCI/M+/z8cfp/TkVVmdNUI7ChAXSQYRZd9Fm0WeEV9i0r3aCpJJxjA=
X-Received: by 2002:a05:6808:171a:b0:408:fb4c:859e with SMTP id
 5614622812f47-40d0408029dmr6005840b6e.6.1751815339964; Sun, 06 Jul 2025
 08:22:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250705-iommu-fix-prr-v2-1-406fecc37cf8@oss.qualcomm.com>
 <c20a9713-6f8d-4c20-a031-dc448404d073@oss.qualcomm.com> <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
In-Reply-To: <CACSVV02ioJfDyYLj6ASeQwH91n5CGcz+GW0wsupWJaUkJyFmqQ@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 08:22:08 -0700
X-Gm-Features: Ac12FXxI38B9CTHaEggfS4VF8kbtpv5xLzWFy9U-kVeIYoAB-mrVEghY5jOxv98
Message-ID: <CACSVV01acTdzQxu3nKYWPzgJhBkfZa9_jvhSVMHRBDH2=wOHog@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA5OCBTYWx0ZWRfX9AIaPD7uewbT
 9mfMXxHH6b8sMouYv4rJWKgm3Gi6Sy8MdnyUMD+6+KEEGj11sxIX9a3VZciiclRL3saI1uJp//p
 pXA7U+d+JT6x0YJurY1jiN8hulYt8Sp4tQcx42znBdGQGFt1E177s0tXBWj/+F9iO9AIz4fM3s2
 68QX/p/TPCE0QBKQk/FQZvqR76qAAenw6ZQSiYkSK+qxUiI1D39OJ22NEWuEc4ZBAHY2WH36op9
 5wQXto/Aw1GfE2zMehcdMCfyP6TdPgoxsYMrak1oNvPjSQHe+A87C6xvSWENOM0ShLs45sOgmbO
 0zY08kJrVfJwGnsG3EaTU4ulA3+j6IVMBIvAn7wRM7HAK42Tu7p3CqLlO+jfI4rjwB4/ZAMjhge
 w0JBENwpqwsHFGVryQ9zxw4+lGg7tKRIeVsLBHH6otWZs8q0hBvSNVFGWFdfEYa295xLmB4F
X-Proofpoint-ORIG-GUID: 3yeO5iOyDGKkF6Hx6m3H7vw_HaIlbenO
X-Proofpoint-GUID: 3yeO5iOyDGKkF6Hx6m3H7vw_HaIlbenO
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686a94ad cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TsQm3OvnAaa48CA-nDgA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060098

On Sun, Jul 6, 2025 at 8:20=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.co=
m> wrote:
>
> On Sun, Jul 6, 2025 at 7:22=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualco=
mm.com> wrote:
> >
> > On 7/5/2025 9:38 PM, Dmitry Baryshkov wrote:
> > > On SM8250 / QRB5165-RB5 using PRR bits resets the device, most likely
> > > because of the hyp limitations. Disable PRR support on that platform.
> > >
> > > Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >
> > Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >
> > Unfortunately, there is no way to detect firmware support for PRR safel=
y
> > from KMD.
>
> I still am a bit curious about whether it is the ACLTR write that
> trips the fw out (doubtful, since we write other bits in that reg
> AFAICT) or the PRR_CFG_LADDR/UADDR write that does it.  In the latter
> case we could potentially use a reserved-region for the PRR page,
> instead of dynamically allocating it (if we knew what values are in
> LADDR/UADDR.. I guess 0x0?) to avoid reduced vk functionality on these
> devices.  AFAIU the vk extensions that depend on PRR are required for
> vkd3d.

oh, and if it wasn't clear, that is something we can pursue, if
viable, after this patch is landed.  We kinda need this patch ASAP to
unbreak sm8250.

BR,
-R

> BR,
> -R
>
> > -Akhil.
> >
> > > ---
> > > I currently don't have access to other devices from these generations=
.
> > > It might be necessary to apply the same workaround to other platforms=
.
> > > ---
> > > Changes in v2:
> > > - Simplify the workaround as the issue seems to be limited to SM8250
> > >   only (Rob)
> > > - Link to v1: https://lore.kernel.org/r/20250705-iommu-fix-prr-v1-1-e=
f725033651c@oss.qualcomm.com
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iom=
mu/arm/arm-smmu/arm-smmu-qcom.c
> > > index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..53d88646476e9f193a627=
5d9c3ee3d084c215362 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > @@ -355,7 +355,8 @@ static int qcom_adreno_smmu_init_context(struct a=
rm_smmu_domain *smmu_domain,
> > >       priv->set_prr_addr =3D NULL;
> > >
> > >       if (of_device_is_compatible(np, "qcom,smmu-500") &&
> > > -                     of_device_is_compatible(np, "qcom,adreno-smmu")=
) {
> > > +         !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
> > > +         of_device_is_compatible(np, "qcom,adreno-smmu")) {
> > >               priv->set_prr_bit =3D qcom_adreno_smmu_set_prr_bit;
> > >               priv->set_prr_addr =3D qcom_adreno_smmu_set_prr_addr;
> > >       }
> > >
> > > ---
> > > base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
> > > change-id: 20250705-iommu-fix-prr-600451b1d304
> > >
> > > Best regards,
> >

