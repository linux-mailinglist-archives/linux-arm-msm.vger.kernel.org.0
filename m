Return-Path: <linux-arm-msm+bounces-86588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D18CDCB93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 16:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C2BC303F8A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 15:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB852DAFBA;
	Wed, 24 Dec 2025 15:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H87ZBlqg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VI9EVk9Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F029F2D7DC8
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766590644; cv=none; b=hEUMz1NmRmY72DktdMJp6+pAodjWxrlO66zEjZGnYtWKg91/JDweKj9lc1muzhCxBfOUtBwXm9NiC/swDI8uKZmNJPGylxataPRrrhILxOfMyUCocX4u+VeNkp/F1ObpI9E24y7ktAw62wa8XRQxLBcR9qAmzwylda42JsJRm10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766590644; c=relaxed/simple;
	bh=FO3veLHA/a0TtFgVtpO9oXnzOfCPEKvvuc/SGmnWLsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRrP1f1eBzS7Cp5q7xfoTklfU5CTCTJtCBSnMSmbKP+ESvJ9b9cUWg/Pj2AOcP93rp3/QzAoK3Mg/1tlfAHSZQlieYvEluSkUQkEjZX1uRDdLi1z132jfKC9RRbyAg0e7vuh5XZ0r7qZS8p/yWc3u0o7nWq7OkWqbUn5WY1k4B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H87ZBlqg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VI9EVk9Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8umCQ700762
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ahp6Ojr1T1dTzkCeHaWTBi7T
	SqRyKpSOmejJAEutSL0=; b=H87ZBlqgAWXj6rFxzzkDWk7THbA6HrG5RqoLPEB8
	0d5NHzKYbN9uWLZZ5yl92DU1m2T9e93KEsIaZAyG+u6NpWYMtTYsLoNqh3fUFGDZ
	k4MkC0Age8CGbSvXSBEJYJq+20GwJhFrW6LaA/ODMfbgrVuHA6x6CmIu/4z0tRQO
	9js2VX0nnBWiSRZvb1vCRLVy6Cd9gzpEduNcRfVIsL6z2mFkhhbVjc6WgibDlgAN
	xgp9eKDEDHO7SJeSNqlWDC4LDpAlXsdvXQU94kKDKoe5eOK9mvEPzEQSsOImu5US
	rRV4RTcDaA1O2Ktj1dYBB+8/+pgVSfQf6m5deFTKVV3ngg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jv2wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 15:37:18 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5dbcd452924so3571386137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 07:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766590638; x=1767195438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ahp6Ojr1T1dTzkCeHaWTBi7TSqRyKpSOmejJAEutSL0=;
        b=VI9EVk9ZeQ6lya+vjoLITnXpb0LOBw5+3RBBzjm8Kditx7wTldm1j5g0UVjCj1h+8v
         CPHi3owrttGQ9Pr+3+/+Sjr77uhLV/C58RNalUnEtYn/GK5vPga2DgcdxoaPjS3Hic87
         Ar86KepbiNlKMj6wD5pwwnmLImxEIyaTTAR896LhUzbbq0kdpFkE4MouQLkJ1TrPW7Wc
         bxPRfN+V2UMhjkvtYCm8wcylAwOzqGSdwGGT1Oib0PzY7/CHEU3N32v/XRkbhadgwaHQ
         jLc77iPm0Bl4eP9BN//Cix8Y9f5J3YJFYjdliWnQTtlVD/Tcy5k/vF+hfnoRHSjgqmj0
         iOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766590638; x=1767195438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ahp6Ojr1T1dTzkCeHaWTBi7TSqRyKpSOmejJAEutSL0=;
        b=dGNhky/hjrZDmkx30fpEJm8md8IHB9X54u3VTf9SLf9CmODzTtnE40cc5ywVmMCKxn
         p4dPOLYi0Ve+AY1K0qMDQZsbX38WK7ksZ2iUKwiIByS1yBwyrXulLHcriGSXLp0cc8aa
         mAhZKnNPlDxnSbfQM2Ns2VtdcYTKcRv/vQLLMgZTCGygySuKoFXSTspobbtAEQx3JYOf
         j9D6PuNlzGGDU0sNYIzcopL9Lqdhwr10kqttO8CGAoCwpIuA/bZ7TF7wmhn7m9DUBRt4
         oSpX55oWUGzbSZxL7Stz31UHABr5zi6hDKLt2FnTigMEEk2rvHjjjoHUbuJj/dgoaaSj
         t3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWlp/DT95tEi/Kg0UNAp4/T/521O2y5Z1Zzv4PIAPutttuVsAEV79mL9Xz6aWnqnbmJpAjDIgvLmbtEWlRi@vger.kernel.org
X-Gm-Message-State: AOJu0YxLF4E/3z+N/jJelnnyUlS7+9O022wJDgrh/VrC3Sn4KNvasyEv
	gZqpYV/3wMu3ypJrYMsUiAHaxOjrCtKjZHBFzPbJtx8KFKMzHmRdYZZMAC//0PigtYoeiiwTfJu
	N8Crai8WqvBPcz9bECgmCZF3CuwP5LBnzu03lrM+sFNL3f20QTeOSVAzCHr7evP0y6i0R
X-Gm-Gg: AY/fxX5NtCJyI4mbbDbUGCSN5OAkcTnjYnhO2vur4SB9bYAzQ/NTjyh2txhkTGvYANf
	eT68nHLlK7BdXOMIJAVB3NV5F3hCv8UUXwundNbf4bzeUODs2TtSq5WQhloeAkp3KNlfRIbUc93
	7lBeRZT1HHBcVbpBb7B2pCOTK6NRL3ky1lCbxk9v3T2iHZ9LxKO8OaITdQYGcl/f6dH5EdUHusj
	BDUE2njyBo7IGGsXnXzV/dpfEYNb+sVxBVI/swmWYTHzGVqtCqTPw/u3mSn4bvqekZAy8ocMNKy
	toxWyI40sJXsEQwDWnIrbaMkwhQzHxwHT6uZFb7L/3PnY9kS5m3G4U2uHDq9RdhfideeceyNqcO
	zRSDWXw4sDwG4/sGasAcOG/sgnvbLYVixdeKqS8yHG3IaTcUPevUgoIeT3ugVYzGxCzzA60jpiA
	j9C1uqDmiht0LAb1cjy+EEabQ=
X-Received: by 2002:a05:6102:3e11:b0:5d6:5e9:9e0c with SMTP id ada2fe7eead31-5eb1a634297mr4990677137.4.1766590638158;
        Wed, 24 Dec 2025 07:37:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJq3Jx5CPK5Yuo8d6I+bbObGv8XhlHpPoLVOWUH6L5Yi8bjzN0AKJz+ybPigDU2WS/GbMYzQ==
X-Received: by 2002:a05:6102:3e11:b0:5d6:5e9:9e0c with SMTP id ada2fe7eead31-5eb1a634297mr4990664137.4.1766590637652;
        Wed, 24 Dec 2025 07:37:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812251b2b0sm46356511fa.18.2025.12.24.07.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:37:17 -0800 (PST)
Date: Wed, 24 Dec 2025 17:37:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: veygax <veyga@veygax.dev>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/msm: Replace unsafe snprintf usage with scnprintf
Message-ID: <ob46kpwnd5maaffqesozu7fu5xqzozt5bpzdrxvxuiqfaca5z5@enazdt4gv7fn>
References: <20251224124254.17920-3-veyga@veygax.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224124254.17920-3-veyga@veygax.dev>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEzNyBTYWx0ZWRfX7oYtl4ZzRZ4h
 aLnF1tP1slJuR42zwMvrzsM7eaBuXcdG6tjxNEzr055qJT3nJCKdKM7x4PqR0md5fTHCBfRjKWC
 enEK49AvogSn1Gd0wJlQOx31VVz1bY3Vpy79uShSR7/GV1TAh8SUK9GWg0csUn0NDbYzLAEndNc
 p59vHy3WN8ODIRaeJEuj7YJ7CtqoLOfdljNDCG1jdBsQvjf+tx+t57gWVFUYhrebqsN17FlJcEW
 rJQSzLrnA28APvXCrLbtm6DjGw4HSWlP1QXpoOF1WQUhFsoe1UXxZSrKY3SSXfZuRHJppsMtE07
 qamEF4hBib99PUB799ygXNqZPIGpMbX/0twsM6lp8DuPeuNMHMPte/9riaIf2O5RW4W0GS6ZuUQ
 a6iYIHuB9q3IxOG/DlFmWcA8EuMMXDxFA7bTafQD67fnhQ74yyFpmIY7u1Rhqqbm9c7iUqPkiRz
 DwOMAKuWksez18OAFbA==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694c08ae cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EAWue8hiOrRKlVdnu9EA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: PyHtZCOWTkgu6LpXLDbGHeryeNsWjRJh
X-Proofpoint-ORIG-GUID: PyHtZCOWTkgu6LpXLDbGHeryeNsWjRJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240137

On Wed, Dec 24, 2025 at 12:44:22PM +0000, veygax wrote:
> From: Evan Lambert <veyga@veygax.dev>
> 
> The refill_buf function uses snprintf to append to a fixed-size buffer.
> snprintf returns the length that would have been written, which can
> exceed the remaining buffer size. If this happens, ptr advances beyond
> the buffer and rem becomes negative. In the 2nd iteration, rem is
> treated as a large unsigned integer, causing snprintf to write oob.
> 
> While this behavior is technically mitigated by num_perfcntrs being
> locked at 5, it's still unsafe if num_perfcntrs were ever to change/a
> second source was added.
> 
> Signed-off-by: Evan Lambert <veyga@veygax.dev>
> ---
> v2: Use real name in Signed-off-by as requested by Dmitry Baryshkov.

Thanks!


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
>  drivers/gpu/drm/msm/msm_perf.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

-- 
With best wishes
Dmitry

