Return-Path: <linux-arm-msm+bounces-78293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 95061BFAF61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 10:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 64C82505514
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457B130BBB7;
	Wed, 22 Oct 2025 08:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEYPPFcY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EDC30DD2F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761122700; cv=none; b=ZFBj7JsZoEPKXd0yBWyRa4S0WmG48HoPKmGWBNPG9mrESoZzHFiZlOdmBS/84vik7qo0xO5puu69LZONKBsH5nwMY7PTUVsDXCUBkLYxHUESs5FKlsxnP+/Ub8GtqsMyoUqpcyI2u4vJDzq3g3i/gXeXI7wY23j1Lq1+vw0FV54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761122700; c=relaxed/simple;
	bh=IJoyUmfW/Iq/I7TDBxnbdg5/OO2KKWRIyzb6EPKEmqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mt2EFVT8OulRqcC6Tm24rrfdF/rWngJGzKkbdBb0IciqnteyrRix0oXrFOeYVfDDswk02z9NaXNLFIu5wNHfNjAcwIrTwfxOOo6SIclmU/L3Xl8TRyzsHsz1CPh2RtSbHyM2oqfYFb03AWi7ZJyodpRkcbvWmQqnOEu8JeEtRmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEYPPFcY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3d9Na027488
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Fqs3VCh8yc+MC9pZJHM6nKy
	Xi4+WkuALoZolH7c+Qw=; b=CEYPPFcYf6vr9360F+UE9BbL3krnCBe+oQrsRahK
	5EYyEFg4ArF3XHrGQrg4XSUUsoniAOp82kR7djTQzIo7wJP+SDDHqIpLpTp6KhaX
	+2N2MkZPoSlawMWcvlnEhJehVbxr8cdZewmGa8hLcCKledU0tdHPW6hfG2OTxKps
	FGlf9SfBfkK256az+XBPaD4Aa17AUT1s29ouNxqsuMR8yTCjXqLExf1exYID7eLc
	x9rl26C395DPNAgGu9sRPZgvCBSjKKhVUnpR1JqncmpNy24exz5OcvWCtzf19VPG
	9KHs1u2mLndn/H+q9eLZakswy1S8FyX1yr5DwUH8GRDXnw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j3wte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:44:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e88d99b569so23701111cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 01:44:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761122696; x=1761727496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Fqs3VCh8yc+MC9pZJHM6nKyXi4+WkuALoZolH7c+Qw=;
        b=UvQUYuwU0Aj9JdgKXcUo2+fZLht7c/Pm/35dxUuwcSbkujV/Dptbw3UWEbZ/X8iVj5
         Y5n6VjMwlpwxNujSDgT1Qy81kYOR9r0Zh23LnhH8xb05qO0lzppJEOWA/2VltFt6LbWj
         PNmWorr8ZAOjA0q9KwUsSH+oxZPOwqNwbsTMoSNARqfMEJw7mYpTRZb7ESgubXGfUKBe
         thxskovQXlerHBPoGjA9xU6ftRx9y/jikQ2bMX12JIyfw/TVYHW+hjEM6l0+PHGwCjyt
         9BOD502QalexsuRF1n3Pyw+XGXr7l85n1Mv8Oh+q6M3yaj4MXHYqugyT5s6Ig9uiqy8D
         WmWg==
X-Forwarded-Encrypted: i=1; AJvYcCWo46Axa3WeE+8fLg4aJr5ou5hd976P98VcVymjW71tEyx9PbM9mUzFz/DhXps8wO5/NCTsCEYG9T9NPsWJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxYlvFC2Cc/1weUT6YQzJRR67AFf1RdqM5wJ6SvNh1mHtrOLb65
	TVsLaJr6F8W5FP5cbNtsUSS5OAYJnVprbeYHaZon33A3pdKeKYJjhZMNGcSSMSCOY4R9GIrgqXY
	CV+yGMm7x4k8fd0ceGYFlLboOPmKH3KI2/ev3UOIKbS3x2gDa7cm+YkrQ+qToAtkK4RzZ87bRJ/
	RN
X-Gm-Gg: ASbGncvLxcKTkC6OVLr0aCTt3hjl5q8rC+YJd2c/ZlKMuzqkm6kRryaq6cr1ueVn9JG
	UOQh4PTiHId8VHnH8oFkQym73Nx8qsjlJhiZmGpHNGqkt5lC41xmuX9K7Pq/NIKFp+Gz1GIl5jV
	WtYwQbSqj7wQR4s0RC9AojAQ0WgRy5eZvQofP+OUJbj6IACNlyWitkb2Ip9R0Dhk/ov91M3Tl3E
	atdiMONX+/UqYz5fjrptlo18Aear5BcEMu7JICaOM59Y8IsEAdpCBzqFUibsa3F4Yi5eh+p4tve
	HXfgAO0KioF8cSDJKnLKsAxvAOmuyWlvyffA9u9DAnUGpJaC5h66586RvMdeJSbqvK16Nzn8n/W
	mcduHvScAqWoQvLnyx2wL71DZYRFjLSFNGvzd7VZLJcudFyvWVwXScE+7GDFVJuiqx7PGlRRbxh
	P62EkIz0A0/sI=
X-Received: by 2002:ac8:5fd6:0:b0:4e8:a376:4345 with SMTP id d75a77b69052e-4e8a3764648mr206381031cf.43.1761122696503;
        Wed, 22 Oct 2025 01:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtfeLvPBUYx/OMKTojfmm6wZmeHWO7eZ456Avbu6mhNcWgXFGtSexxWbZLyk+APWBqPsIjjQ==
X-Received: by 2002:ac8:5fd6:0:b0:4e8:a376:4345 with SMTP id d75a77b69052e-4e8a3764648mr206380801cf.43.1761122696021;
        Wed, 22 Oct 2025 01:44:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f1d2d0d6sm159633e87.49.2025.10.22.01.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 01:44:55 -0700 (PDT)
Date: Wed, 22 Oct 2025 11:44:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] regulators: qcom-rpmh-regulator: Fix coding style
 issues
Message-ID: <pldvmkjm7muflwti25rc24so3jbkxgyg3uhk2btuzpimjv5emc@62wz5dyksjr4>
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-4-5c7a8e4df601@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022-add-rpmh-read-support-v2-4-5c7a8e4df601@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX5LweNFcCM9nu
 yJokTASesGKWNkKDT26dbQ4Vn/zREDIYSbJocL4NDdOqoWiWLzBWJQseJWmrvBnPPuJf8dQF/oy
 UTiBai63tp6Fzq2B5HomdlmygS0TvDCxc4JVRdCPObQF4ODFhkBhr00AruL9ZaYP0hEWCHNu03u
 kDjsFtRkRHWoSsTMAqUtZQEfxcYrDO6aMvGObG0jMXR4W+nT58BjZLUp/s35ZtmJ0OJySwQowjJ
 nT+qQ/A/x/cYllFIfgUGD51fAMjL9eqgR2Bp30zP2KPwilBVsaJqP3bYHJgrWBxQac5ejfIOl8h
 TWp7KU/M8bd7vuCKc0NUsbG1zDadaC00y/8LFLRBviOmDazpH0GPckD+Kwgf7mUnCtzXbdXus8l
 RTp+IBloMb/vABX2uUROedIR7S4QBQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f89989 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=gAYjBv6TkpC_2adqZ5sA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: ulE7Jdl0SMKnP8tYfKNoitsg4o4EzZlI
X-Proofpoint-ORIG-GUID: ulE7Jdl0SMKnP8tYfKNoitsg4o4EzZlI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

On Wed, Oct 22, 2025 at 02:38:56AM +0530, Kamal Wadhwa wrote:
> Fix the code style/format issues reported by checkpatch.pl
> script.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-rpmh-regulator.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Why are you fixing a patch that was a part of this series?

> 
> diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
> index 9f693043cb87aa77a7a529b5b973323450db80be..6a36ef967d5d9e32c005e79a12099ebef824842f 100644
> --- a/drivers/regulator/qcom-rpmh-regulator.c
> +++ b/drivers/regulator/qcom-rpmh-regulator.c
> @@ -109,7 +109,7 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
>   *				regulator
>   * @ops:			Pointer to regulator ops callback structure
>   * @voltage_ranges:		The possible ranges of voltages supported by this
> - * 				PMIC regulator type
> + *				PMIC regulator type
>   * @n_linear_ranges:		Number of entries in voltage_ranges
>   * @n_voltages:			The number of unique voltage set points defined
>   *				by voltage_ranges
> @@ -387,7 +387,7 @@ static int rpmh_regulator_vrm_set_mode_bypass(struct rpmh_vreg *vreg,
>  		return pmic_mode;
>  
>  	if (bypassed) {
> -		if(!vreg->hw_data->bypass_supported)
> +		if (!vreg->hw_data->bypass_supported)
>  			return -EINVAL;
>  		cmd.data = vreg->hw_data->pmic_bypass_mode;
>  	} else {
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

