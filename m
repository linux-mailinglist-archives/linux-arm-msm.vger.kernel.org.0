Return-Path: <linux-arm-msm+bounces-84511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C5ACA9499
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 21:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8214A3081802
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 20:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEC42C3268;
	Fri,  5 Dec 2025 20:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BdUEQcMu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KWZPvqTQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4602DE6F9
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 20:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764967436; cv=none; b=DpWqyHvT/st8Fls7ce7nW1pybTJNSAiLG1aIa0qadfEIhvTKWas1lgPb7AZXduRuQo+et9ddxTUcMn+3d/GZbmnrmkd6uTC+cd5wWMMLx23qg1AtRPa4xOmhpf4oWaHJqseLLMeNTwagGGAXFs7QQ+434q3a2+fSk511vL+hDuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764967436; c=relaxed/simple;
	bh=VoOi2K/cbszaXepLwMnREeww0innWvq5K1RAyARBa6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHd9YlR0Ys66LDQ9YwSpVBmjrA1qkJO861G8SDzylFqDCv1ufmyI2YYzjEIXudjl5hES0kKmaAxzj+6I48Wu3y3eVvYvy0/mXD2LJQZml6Nd+iZMr7P0LI/RWxDvIR8LeNJXtoIFaXaVQDHW/6YrBcyOAFYJGxJjM3n8mdeDDpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BdUEQcMu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KWZPvqTQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBONq1255907
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 20:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RpuXHuMZZPOjbjLtNGN2MsTj
	gbgJfqNWp+KGHQhwVvI=; b=BdUEQcMuQUymcYihVrq6KkL2pzmmgBpGRZ4DnZ6k
	sG0Znndy0ZxXPy49foj8D1QBr4YW3ve7btKGjoiCsaTNUIkXQtSOAS5nl7GaAeTF
	c3QjDqZu0pLwTxmms0X7OPlB97pLcsprhE7xizLk7UAlQkRVEqGRhSeNJDfSqj8j
	ETfltmmc+ahM4sk2uAGPBzJoT9OByTsmCLd/CvT/EiWt3KY2E2I83F2yS4Z2xtT1
	lPlf3MoXmLaGw81KIcrDrSCYlOpLR4vUUFkuS7AgH+VJgbWsr8TugKfTkAIQfIko
	kciH+Jl4TH5NPJP8A+sK2qOzHYiZgExv8axpCCivy8mSPA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aukmj3b4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 20:43:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b30b6abb7bso515307885a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 12:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764967433; x=1765572233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RpuXHuMZZPOjbjLtNGN2MsTjgbgJfqNWp+KGHQhwVvI=;
        b=KWZPvqTQeFS2BXp378h40YkEtXUp74yoojTrqygvMm2kCFAzVA0jCaASyqyUChAzuj
         13TNpEZMY376pJfR3bXIoA5zq+pbXyVFoVzfuwul4Y9LdOGH+puVAH1/cXWV8OCgJ6sD
         HuR0Q+UMOdkLqvHtLpioHH1gJgRqNU8iHvmRqBF3c4H/PeQ7TXChg6ajk1aqyrbGQDPm
         QZkDoxMJ0xVVnTKNC88oi6pRNlzXIjE2N6ytWmr2wsadcE86qCShNgkounz6DiOw50R8
         pREEaAkHxdwBdOgvid88SuO2U5/4VnGfOVOothkGfGEGS7B5zmVGyWzGbYDo0tPLUYNX
         80Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764967433; x=1765572233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RpuXHuMZZPOjbjLtNGN2MsTjgbgJfqNWp+KGHQhwVvI=;
        b=fb+CWYubz6iBqrYgH4fSuFDC0zD9IfjjrVAJe/opx2rhRj41lBgxssiwXd7ZS09Og3
         07ATQwStQBvynlgZlYhSt94Zasqi4TePzHm4El5AiO1pdmVwnRiStovT9r3qRlRoxeXr
         Ow1bNH3ye+dKfd1FEhGYXsg6WGH0v5whPptgvusLFiPJgZuTx7slvy2AGsiQlMIggX91
         qLnEHqU2yPOXz+YSV7q9Tpdsj0JASOT6x2tN0LZFUUYDCKyrnTsI5FybuUHuTC8CIxc8
         26a6fMcLPM8q+ApEkxXZJ+DnLx4P8JhxTdE5RoD4JP4xyZ0E6p2CVc5zNn0Da2P+RoWC
         v4Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWEVWpOMsUUK5LnAEjXtrrPR1eGAwB0eJLE05lhxplYfVP55cC3HNeNW9Xmk93rsrDHg3UMKyENpht1QTKO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy719CZgRCn1VPpvPceSzGIW8x+BpSJF5yjtCtQIwUzUjin1MSH
	96+YKMrq9Eri4fJQYCGQAtYLOKHc6bLa+Q9IrO0qQ0B5BCvfzv9Ze5t6Wv2X31euAv/fqNcSOOM
	iurDBIKkuOrPHUMJ9KdveDGfbU5QVJospXZW8gVhc+jv3kIzeJCFF83r3b4hLcr3xRLIN
X-Gm-Gg: ASbGnct+2fnVgHf5CnfSaVbkWgydjI1QSoJlqhrZAlijUcwavXhLDoRkyoKhgF8mffK
	5AcqsGlWQoTOrAVAMOGaPqV1hU0Xzcj6Sxw0vH7envJ07oV/Zr2aQhNs1RBbISde8TufurYs0Qo
	NMYLlemrt+Q9bf1fRki3EV5FaFTb57pMm1sGtK4TDnyfwuoFR1YkVarOUDvDuxxIwyTQdQ+oEZd
	KVS0FNTn9lwxpvFaNwgFtu/BCuAL2f+fFMZ3b/i6mhWDxyqs7IuVgnyUZJFwz43tjrXmVzOVdOv
	tEsnmgRy/qENocBMZhl+d3Lgby4OzRAY9e59T0+gJVX0WkxqWZD1JMI/2MvPRc8ZgvK81jYVt5Q
	VCU8+8tTNmqSv0G0yrol8/6jX3v3UhoDyXRkvnO0cgZVjEUZSbASHg6rS30oIcu77uii6g/Rq+4
	YsBPsGcOD8WOH7uGUFIE7RPtY=
X-Received: by 2002:a05:620a:d82:b0:8b2:e561:78c9 with SMTP id af79cd13be357-8b6a256c707mr57340485a.43.1764967432706;
        Fri, 05 Dec 2025 12:43:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdTGluYNok96o5CsAwUvPHomwuPCq9QOVmGcR/+77WdmlXegYB8Y0vUBjdTRA7zwLVUec88w==
X-Received: by 2002:a05:620a:d82:b0:8b2:e561:78c9 with SMTP id af79cd13be357-8b6a256c707mr57337385a.43.1764967432317;
        Fri, 05 Dec 2025 12:43:52 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37e6fe6be0dsm16521461fa.10.2025.12.05.12.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:43:51 -0800 (PST)
Date: Fri, 5 Dec 2025 22:43:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: longnoserob@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, david@ixit.cz
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable
 SLPI
Message-ID: <2xwvgzrt2wvftesjo2j7xy7btdtukkx5ypffo3m37bstsrnelz@5zhlz2nheczc>
References: <20251205-slpi-v3-0-a1320a074345@gmail.com>
 <20251205-slpi-v3-1-a1320a074345@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205-slpi-v3-1-a1320a074345@gmail.com>
X-Authority-Analysis: v=2.4 cv=bYtmkePB c=1 sm=1 tr=0 ts=69334409 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=2lFIOzg0C1QhAyL8J1gA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: pCEFCF2S2pOzsc9zTJ3HOJuzEcOkrpOR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDE1NCBTYWx0ZWRfXytxxTJZ1U+hb
 dpvmI0ftsLR7Ro95IOeZlJeSsCHAU6iBd7QG0FCA8vd0M36dYlPVJkOJzefzmCgLVNIv0WzvxOb
 zbcUbUAY/LzctK4bJAZDZtqfn20vkpSF2x7mVsmdJ1qgtOW3lZ1yq9Ee87aVdHeznOKKZpS9/X6
 bGadQy6ncVzX/O4WM+dp/XXz0zPezFfu/+GnZddcvL1Ct5SrDKnMlwKn1g8hgc8V6sMT9XbMZeV
 Z9beOGLmRtZ6ZE5+6EcjU/W/euAXG+jayUTEXfnbx6pDfgSerNC24cIbN3AL84lSacr+piExY3N
 NbQxflRW2MG3jOK8mnLFcI/0yqloOvf2sHHwBVJ1zAIbsY1l2Gw1iHjorFHh6UBA1lIewxNtsna
 GwnYZ4wgSqTsFlumqAJDCS1eWODfJA==
X-Proofpoint-GUID: pCEFCF2S2pOzsc9zTJ3HOJuzEcOkrpOR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050154

On Fri, Dec 05, 2025 at 10:58:59PM +0900, Robert Eckelmann via B4 Relay wrote:
> From: Robert Eckelmann <longnoserob@gmail.com>
> 
> Enable the SLPI dsp on the Xiaomi Pocophone F1 with Qualcom SDM845 SoC.
> 
> Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

