Return-Path: <linux-arm-msm+bounces-84908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBBCCB33F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 16:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A04330006DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 15:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100962FFF8F;
	Wed, 10 Dec 2025 15:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jt5DK5Z+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/hhUTAv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E25A2F6173
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 15:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765379033; cv=none; b=rFMV+4vTLSUUovhXfDrDwiVhkfWIIxw7VjRztUAW7z4xJMeXNzOYJbxBvhJZe4c+K5UywaHi7I46ZktaC0LFnSwq32C0TQ8FbfWtSc5SB+XfaHcZ1q81Nv2udwWPqKMXwwJEZfZiGnbMLIifIqzrN0NV9wLin7gxxmMtmRe7x3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765379033; c=relaxed/simple;
	bh=BZ23x6fg6/A1juQGtK69JXPZ+EVEG9RA9Cm8GETlv4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCpw7L3E0GTyyHYbYC6L7ESZ2Z+sKOy73M+HiWBx3Azn2VaREDcn4QbhWBzfD1/KJRALQJxxNXuNAaTkq0Pp4+fgkrliCFVsDhfHVhhj8vIUKuRXQZVlOTnFt4ZDKqQlY0iw0DEZ8ivZhbyVKzVswOItHs8Pp2sCku6iSUNr++0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jt5DK5Z+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/hhUTAv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAAPgtp2303313
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 15:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tK3Xv3vQWW4oF9YbgGiQA1xH
	p79m8WjepgZN2LC+2sU=; b=Jt5DK5Z+4IT8tC97GoccuJk+FhM0HulOduVFmxpv
	DRXc7DqsZ+UgGx/cz1ywkevfBzUmiuiCq7hR03zOHWQRKksqzEgxEfjGZz5FQrMU
	dSTG5poToj7N/ZakSeKx1c0DMObjf9XaEBVzZm6RSX2q+CoiCDojZnB00rSwXRqF
	2/jGE/rW18m6LhZ0boxX+afJ/QTgAR9ZnfRRxhHAWJNKFhBYcTjjtrtYapSR3cxY
	OToDpzI3MSHi/Z/u8DM4CMjMkQaQ1OY1oo3c5TqIma3qoRNLWANuFMHiEPEyfmII
	VbLYjX7DBVa/fRnTm4XiJ+w92TJyqEVRKlha0xfJKRPqhQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay73rgq9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 15:03:46 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-93f1772e608so2155848241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 07:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765379025; x=1765983825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tK3Xv3vQWW4oF9YbgGiQA1xHp79m8WjepgZN2LC+2sU=;
        b=Y/hhUTAvrAdRQnWEeJhbr+FBvHVWXdrMG4MpjvAyYupTTcR2NfGw78GIh16uLybcOc
         XUx3Y8iIgygyOKnSy9cCoELQD+cpeFTuFngEH5b3JyqB3/0UzaD9zXmE0+OR/0TvxiaU
         ELb7e7NaLNns1B9qNYpEZdgn8Yd5pbm/AQ1GiPNnbPruvct3R7YlUs2/cV3JPSqkzxg+
         WJLJb4ByR2DximVOCj5G7+3pYcgs/Q4ndue7v40WGmUVvOErNqd1RFz2Bl2qWtL8yqsh
         NeiDEaKjh8PxJ5O8fH0ZmcdqldbWxtMxB8InwafHH4Mb4CqJz/0ASD3L9o/2yMZv44+i
         MMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765379025; x=1765983825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tK3Xv3vQWW4oF9YbgGiQA1xHp79m8WjepgZN2LC+2sU=;
        b=rNopE67It00l/2JtLRXcx0C2fZIQNM5lbU2m3JUKruYPtOfLCi4MxYNhX3x8kM2USB
         xXTWaz5C72VdxzmvEAuPQL6loyccyHpysFQ2s29lP/4Ew8yWWKvv6A4+3SPIDREh5lJL
         QHFgBDPuAa1pO7QgHnmVSecAoiLpZw7931uh/qh2/otaj4IfIT/oTpx2l+1z87sW6i1w
         OZPgY8cShyPEPfebeA6SqJ/eJUvyTKYfdx2aGdl1QgS9itT/FSZ8RhSaQDJ9g823iLaK
         JoxGJc6ZL6Wll34u1SupVe8Hd/hqQmRjrJCC4LR1kYE0vkDiaDNkVQZo9bovcr8PBEV1
         VO0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeIPTN+jlpFyEpnZzH+bfLt1tSo6zUM/gwqqldrO3c3hwrWlgXBOlAuxCtrIHqWDYoXpp4yVXAfevzhvTj@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1anjAMEQvRtvmcPaCbVhs47jCFR5JkArvv8u5C93MXv6DFTjm
	tVsFg/CBEEVwhZbHG5heJOnn8ZMYss1T6EA7Wm6ty/WVvqFMu0+lRlIF0Or/ESU1N66yTjVbeKW
	tIQlEbYGszb6eX+KzVC2dJB3LtwLddk9UW1i7RbcZO0O+7H7XZFiua7WzYjLNPOeBRURX
X-Gm-Gg: AY/fxX7w89rZwhVQkJ4suOrpUfP6UssjQc6yW4xtpSY11mcHT0fgQIJDSIx4vmpFPA6
	eyOfVGo1BIaUQAz34+sirJMaIjGCDoZW8V/ius63Io6NDpdl1Car+SCOBics5Xvc3F6U0zFNVX8
	p5f2Xc9t62mkXsu6+e5Y8Jz4XLSlKy4PV0LJbfyrF7gnrwbbwN6aijqnZLF4JVUO/91YSpNW3KE
	J7CKcTyRZBy+nvoZzlIvOqhS7z116V7WDtdVKu/dq5OvKE1U8V/jh2wgsO6zUMXegqOQW1ixWAs
	eoV1QRzIrGg7v7bY18sLVzMCvG0oFl8e+JZqAczI/Fy/M0F5G31fZ48P5ByZc7knPrKJfi1wdjc
	q3iFnuVZKoAn/VIF0cuj3pNAvRJKcVsREQM+nTrxeWeR/So2wzgtX9WkM9j4oTCUBs/s/nHAm8U
	HTOtzH/QvsSeqqd/UJMwHqakA=
X-Received: by 2002:a05:6102:5487:b0:5df:b31d:d5d9 with SMTP id ada2fe7eead31-5e571f401a5mr700749137.23.1765379024902;
        Wed, 10 Dec 2025 07:03:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHKMRhVeDjknLfBGTCmFBNMNNPgsmjkcNmaO+zZu81kkTsiq+AMmGeEjGRwLKr4o1r6y18zaw==
X-Received: by 2002:a05:6102:5487:b0:5df:b31d:d5d9 with SMTP id ada2fe7eead31-5e571f401a5mr700122137.23.1765379019773;
        Wed, 10 Dec 2025 07:03:39 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2acsm6554174e87.61.2025.12.10.07.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 07:03:38 -0800 (PST)
Date: Wed, 10 Dec 2025 17:03:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 4/6] media: iris: Move vpu register defines to common
 header file
Message-ID: <4pxuzfdcwr56gtt4rjgodvtmf6cgprpb3czyrqjktx6qk5kryb@njj7xwtnnjpi>
References: <20251210-knp_video-v4-0-8d11d840358a@oss.qualcomm.com>
 <20251210-knp_video-v4-4-8d11d840358a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-knp_video-v4-4-8d11d840358a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Ag2VNU4ruKdw7124GmGfWee96Wl1W_Pr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEyMSBTYWx0ZWRfX7s9cv8ar0v0J
 Nb4RlUvj2sDVI3TuFHipyHdIJ1I8Mgawq9W+R1wP/VEnL9rq/C5sXDQ9OaTcoq2AeD2Yka/Vin0
 9aF9d7NivjYXHUEI/VT0nQe1hJZg6etouff+xzNpLgL1ZdxOdC/POIsXCaRVT7I94uupDy9aqC3
 V2Cw4a9AbUZsGfKpLvgeMmpHERJ2XYKw5Y/7y6X8LCEfU02vhxaCwv7cyG/8ncW+IP4GaBtO3v3
 cv0PWrHwKY+jsvoDQO5OaA9Hey9C2vU1eQlT01nloD4docYQFdjDjpfmMPEmbS1I7UMoBy1yRsm
 TCw9irA3jCMmO21OaBGEca3knCiuOSFSuDYbRzMmvlMp7W8E3vnyaPPgFjo4mOraMOSngSpmHD7
 hs0PhpeUyN1ZLm9jE6hfi67FZxIwdQ==
X-Authority-Analysis: v=2.4 cv=McFhep/f c=1 sm=1 tr=0 ts=69398bd2 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=FRQO-4gtz3DVsKXuV7oA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Ag2VNU4ruKdw7124GmGfWee96Wl1W_Pr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100121

On Wed, Dec 10, 2025 at 06:06:02PM +0530, Vikash Garodia wrote:
> Some of vpu4 register defines are common with vpu3x. Move those into the
> common register defines header. This is done to reuse the defines for
> vpu4 in subsequent patch which enables the power sequence for vpu4.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

You have missed my CdB / SoB tags here.

> ---
>  drivers/media/platform/qcom/iris/iris_vpu3x.c      | 42 ---------------
>  drivers/media/platform/qcom/iris/iris_vpu_common.c | 43 ---------------
>  .../platform/qcom/iris/iris_vpu_register_defines.h | 61 ++++++++++++++++++++++
>  3 files changed, 61 insertions(+), 85 deletions(-)
> 
-- 
With best wishes
Dmitry

