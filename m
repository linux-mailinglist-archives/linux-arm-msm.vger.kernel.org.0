Return-Path: <linux-arm-msm+bounces-62910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 653C9AEC7EC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 16:52:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C0A43BF22B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Jun 2025 14:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3147253920;
	Sat, 28 Jun 2025 14:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJLHSA01"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBE3247291
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 14:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751122257; cv=none; b=ZUUzitYtdSo0uRtqzd9rBKKtMBlTKbEGJhPcKLKeV9qL0WrZWweKBehqL6HU8LxOhmE58F7lLvdChHnDhaT5V6L3eFN09wSoJ36E14nmbra6cSjKwS/i7X2pDp7i9DrWzLT5Rm4YyIRLp7QfxrOoS6D3vlLs7dhNF8Zw6b3QgpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751122257; c=relaxed/simple;
	bh=Xos9O20zb2Et6svoO+8sqQIklPD/u4XqcxNOP5O6gGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/Psq8IYE3PDIEOyempvqb1LkLZ1JdJ+xGjqZzrfy6iY2KKyrMs61GtdRF7iN83zpbdSQc0ZXKEA+BDt0P1vRz9Yewazge54mAd0Gcox6B1hXb57rtaBAvXlU8ztyvLEg6JPUfg8ca18LFLIyaQcEEP29coLoB1Ct0E5/n0azT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lJLHSA01; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S4lmMF031397
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 14:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4ZHuVoDQqcSiKZpcYlkHvG4d
	z+Aqe3P5LxxO2P06acI=; b=lJLHSA01cAR49QjeCee0z0kJL1m3UPZmQMsyveL6
	Nkgo/Mkmn8HAd3g2BZQazP/q4moY8TkltYKwgLRhGiSI/VdsxfPkfkSFGqyQqSy0
	57No2BbyVDFuqQCI4N7dIdJaGzd/BJql/2I4Dj3OqqPEMkbjOdKCNzmNNwrl7vlJ
	Ufjv5pTYV2Y1HrvNBdblobEkuWazQ0tXSUnQVuhjYIRZ/oztQrdI0zPOC+r6QOac
	WjpEgnFXOxArY+fbxyNqe8PKMxy0RoCfOJqdiBjlJYPKywGyDEI68b5Lm1FlUjed
	+T3PPQx1sG+A1nLCH2uYdCWy3Eae7I6lZrIBCCBG9ihvIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcgpgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 14:50:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d099c1779dso97764785a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Jun 2025 07:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751122254; x=1751727054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZHuVoDQqcSiKZpcYlkHvG4dz+Aqe3P5LxxO2P06acI=;
        b=W/l9CBZOILRs/sDqyxevE8hKDsD2fq9FOgAEOUg0bY7u0bxWi5l/Uk98KxYgpDk4iv
         Y9qjyuMn707Xd6lo77hvqAkIjr4dTPfGxC5k1nc1Q28jKveKUWUckSFeYi9JivWnvbGW
         UoHOA+SuzkZBhmWDLRU7OuthXmfvOGDSr/KF1+VTtEpTa/h4J0/7wALyPdvC23hXP7BJ
         XASeTlgQnf5/iIrZ+bZPAm/vv/cKCa/rb46mvHyZ/0AiPkRLptQxBs5F7iJ84VGj6sXC
         cwMh5zCr9vfMq5G4eBz1qhYMHPws1cLee1ySueTSxSXffXctuJedZAmy3SsV8F0PwMVk
         qEfA==
X-Forwarded-Encrypted: i=1; AJvYcCWIVeo7WBIKaf1/GIK2N+uejcB9IIHq5bTcBnu7DsfOYQEVQa5aUBM0WghQmoyWdq5TWBs+uQ8UqM4V2NJB@vger.kernel.org
X-Gm-Message-State: AOJu0YyO+P0NWac5FbtLlTxM2S0RY9ImhjwKIjgMU+csDp5nYDjBIfp0
	uVM/YAmxqseNSExXesqI6mrxI1LaamKrhbH8dlnTqW6z5987b8KHs/ySN0DcUy3TxZJeMQtqY67
	GmZfkChZtKKfnLQmfGReah8Rp67EhN9ND1lGI4rHbomK9fbq/t4K0fjh8RRPpVsaybTwp
X-Gm-Gg: ASbGncvtzocuJvfTqkfsI1S2DLP7SR5JO1JoONWWUdX/EHN8JuuJZQDuXOTm6VoTlv2
	OlCcgn1usjhywKfVpsEiVuqdE182kA+rnIOld0Q2WF3IZIodG6RZaWT3UTCOAo05VAxqYtf4Sri
	Q9XkSQ+hBl0K+XG9rkaB2BIMfEepthujWzMBz57pi8lwrhVvXO1Qm+DwVQvWjT6iiY46AOOsjK0
	pNd9ArUixGA2m3G0iU8Is0875zfOUWeT2wIMnFt2WWFD2Gl+r4dDLKWU3nAyPXUNLuQijDSuTeo
	TXOzY98/tq4iYeigyora3StRroNLWhwOUkhcjlhbGpBnHaIC4mIWwgmVheaCa/sSkB47H2FHkJD
	Nhg4IjDHHZ95KaAbyK5DjSPUDcvu93eJDM8c=
X-Received: by 2002:a05:620a:1a10:b0:7d4:4c7b:9701 with SMTP id af79cd13be357-7d44c7b971amr476429585a.35.1751122253680;
        Sat, 28 Jun 2025 07:50:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVzNKJ3G+C5nuBNakv+tEHELya1wSjC0Lp4djr17ccnTEiCjJcAEFkK1IFL24QOiOW61XH2w==
X-Received: by 2002:a05:620a:1a10:b0:7d4:4c7b:9701 with SMTP id af79cd13be357-7d44c7b971amr476426085a.35.1751122253252;
        Sat, 28 Jun 2025 07:50:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b93adsm828837e87.98.2025.06.28.07.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 07:50:52 -0700 (PDT)
Date: Sat, 28 Jun 2025 17:50:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 5/8] firmware; qcom: scm: enable QSEECOM on SC8280XP
 CRD
Message-ID: <hf66fa3pvm5jrw3qv57xoofmkoz74ds4g3nwzsdz7pip6e7nej@w3h7qn7qu457>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-5-aacca9306cee@oss.qualcomm.com>
 <e5e3e8f1-4328-4929-825a-3d8e836cf072@oss.qualcomm.com>
 <95c46d39-5b4a-46dd-aa73-1b3b9bf81019@oss.qualcomm.com>
 <aF6NUeNLPrR5vqEf@hovoldconsulting.com>
 <f55a057d-2cdd-411e-97b9-5ede1300a4e9@oss.qualcomm.com>
 <aF6Tkh75LRym8MQY@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF6Tkh75LRym8MQY@hovoldconsulting.com>
X-Proofpoint-GUID: iuxxSI8IXKta-VLSh6WxolwE5YKFDooP
X-Proofpoint-ORIG-GUID: iuxxSI8IXKta-VLSh6WxolwE5YKFDooP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEyNCBTYWx0ZWRfX4YOsl7W6+A0R
 4es869A7zIxOv9jCiuh5v0/V7LUov6r1g66NIKxk/PmFYiUOIOKZyYtd+SzcUYOkqksCoWXuv1v
 sjhjUu6VLVCNAJfMiqmiFuCqRDHluW9d8wYHxJKeegAOzhqVsFg3eDcYcPWNTe80DC2mBFWj2Xm
 5WZOQJ/oct8HNPrkb7Bz0yGWWKjkgVY9iz90nXscTJOEN7AwVR7hmxWtS+FQ2slh3DVDWqZzUbs
 95FQpp7sNK1m5UbtaqfWUv6txn9skBUdDZoCpVxKRlLZR6wV07V8ZiDW66EVbiMYRo2Rb7ach/z
 aApDi9M10UWDTzBLWHEgYvP+n1jzdskKQf2rEzznxSFeqXwwPpN5UIjdyOLDWL31Bbf/8ne1qh+
 TjBvPrFwN0ycgsSDDLV1QsitH9YBX0O+IEOoJIJKrD0LmjMocTHshjA9u3HPIJYQC7Uv3mhq
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6860014f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=38JWWdoTCtlzABMLL24A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280124

On Fri, Jun 27, 2025 at 02:50:26PM +0200, Johan Hovold wrote:
> On Fri, Jun 27, 2025 at 02:26:41PM +0200, Konrad Dybcio wrote:
> > On 6/27/25 2:23 PM, Johan Hovold wrote:
> > > On Fri, Jun 27, 2025 at 01:54:37AM +0200, Konrad Dybcio wrote:
> > >> On 6/27/25 1:34 AM, Konrad Dybcio wrote:
> > >>> On 6/25/25 12:53 AM, Dmitry Baryshkov wrote:
> 
> > >>>> As reported by Johan, this platform also doesn't currently support
> > >>>> updating of the UEFI variables. In preparation to reworking match list
> > >>>> for QSEECOM mark this platform as supporting QSEECOM with R/O UEFI
> > >>>> variables.
> 
> > >>>> +	{ .compatible = "qcom,sc8280xp-crd", .data = &qcom_qseecom_ro_uefi, },
> > >>>
> > >>> R/W works for me (tm).. the META version may be (inconclusive) 2605
> > >>
> > >> Looked at the wrong SoC META table.. the build date is 05/25/2023
> > > 
> > > Could be that my machine was not provisioned properly. Do you boot from
> > > UFS or NVMe?
> > > 
> > > My fw is also older: 01/10/2022.
> > 
> > The machine has UFS, NVME and SPINOR, however the boot log definitely says:
> > 
> > S - Boot Interface: SPI
> 
> Mine says:
> 
> S - Boot Interface: UFS

Is this META even supported? I think it's recommended to update
firmware to the latest releases.

-- 
With best wishes
Dmitry

