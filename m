Return-Path: <linux-arm-msm+bounces-63922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97884AFB278
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 13:42:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 752864A075B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443952877D4;
	Mon,  7 Jul 2025 11:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kCak27oe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36DE1C5485
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 11:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751888541; cv=none; b=iRyd+5vBDBW9uMQlgr21jQnRb8lFa6oIMk+KOqOQwH1VRIh4qQLFRE+eoLRjAgXaaerHV4ukpvGpDB4d+lUDKkRymQUr6QYjE/JKGKZoNSNeQrgmusRhg3eM42VsoBRCbrsPPsFj6oB9kV9xZ+fnt5uAvQK73iHYwkplga4/UlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751888541; c=relaxed/simple;
	bh=SO2cOz0w28nDjmz/4KCVUhyYuZcYpM+EdXuWAg+c+MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QcceA2BPL/G26imM1AS62Ogdf0EOCPOKxPAXOWxsGYEAebHnqv0ba3Wkt4JAkdAZY+TvXfrO9sZgx/PDl+qwn90DGS9I2ufxk/UsnHoR1ryWspNg0a5onG/7FX1Dvj/PnYiEsHAH+hi8vsNnhpj9wZPlAXpETYqiEcQUOkZKads=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCak27oe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5679FTC2014188
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Jul 2025 11:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EPmD/mqlIvExS85dVMv30F8Iy5Y5MWP3RJHR3V0RmEk=; b=kCak27oehArBQbs7
	HuVS7QtbLw98lQGjXAIM1ZQbi91QEOJl470Erw1CPSFwbmpWoZJI8AhTW1ARWoHH
	VuLIiIr7gorBBzRs0Kf782/QHJZlApOyMg3563oHtd44/n5kw9VLPcaoSIrF9E/1
	sanKnuyOHFwzwft4XmBKJvDvkPh26v8obbfB8PIPOIPEsMPPhsvgOAlT3RCKYX7s
	RRKK85e9Y+B24cFwrPOIg9QpqL5p8ggllBIiE5df4ZHVvt+tzYKmmbPmYz0lFhWN
	YKe60w5hw/GScJNjYP84trOui3F/UQA5Dnc1Ik9sIV+Kt/utpy8D2CM6erN0ITQ6
	W8KgiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qc8s8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 11:42:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d094e04aa4so55736085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 04:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751888538; x=1752493338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPmD/mqlIvExS85dVMv30F8Iy5Y5MWP3RJHR3V0RmEk=;
        b=wYlRw9np5HluzXgNT5fPfXKiJkdoJ4V0AmrVgAQsNFfAttPDtzPdlP7+M+qyBSzu1H
         VozGIBodOtqg/CC7qF1owoVaGUG784niIg+9skGz7brxYj4/GdAkZVWLvlzsOBMg0/Fc
         X4V/cNgE/SGmD/RK9SKKX9d4SOIg8uAxsOxSGnRHVfJCI5oaz5CXjeUj81idL50Vma8p
         oBy1cWwbv9Z7o48/Uz26hZwi3bj68Gf08ToVMBwQb46vG3cNc5C2LSQP9bMXfuCXearv
         /eVzlHX5yjmRNtggx3ylYyn0EEKB7BC5DGYLNLBbnNxmxPMxyM6H1JSMTiAyrEfKpXud
         JXiQ==
X-Gm-Message-State: AOJu0YwX+96UTGPl6JVKRAJiKBSI3gwAtHgX6Gg2RotoQaTB4FkIdbFI
	Yc+P6SadNtZGb8iiqcaJoMPTLsMkCbftGp0onGK9p8v+RJ+/3LJpsQylWSCwpU1obBGo1wh8VeW
	7fgiE1GbELOTPz2o6N3z2yTjSM8sj1Jq3QQuDVwhE/eKY68ko4DzC2EJQ7OabDbypORvA
X-Gm-Gg: ASbGnctNKDmvuBwvbmRJfaQhUsqqOId8M2zTMXw/X9Lbe5O9ERqnvJECl7x2prMNWIb
	5SIo+Az8B9cAtGGnvkokSYEiikx5hk/5JxAt3xV2h4Egy+eNFrEUsAajcMZwY2Se9hEg81IOWlO
	0LpnjDRhOtDnOTY58Fd/3gs60AsF9n2AtIdF7IBAp/yZ72LyOcFQKDcJulgrtlgSLiTL3rjXRcZ
	vfmK4nY87CDOG7mvV46Vi8kqIE85282kKhjouAaxQzuy5qKv1MPGQsWq82t7NDtFD3mdwFSWirm
	QY+UD2SREFJtOGHASTLZG288L4EucS8b8dUJb8WUkdN0ulWhFzTBHuee23Sq8OE3nWVd8AQjjIO
	c0Zk=
X-Received: by 2002:a05:620a:198e:b0:7d5:d1b8:e02c with SMTP id af79cd13be357-7d5ddc509abmr651648685a.10.1751888537745;
        Mon, 07 Jul 2025 04:42:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9KOzB4zGkVpZwJx25vMl/UErrpqlqNGh0xSPchsvbG7/JV9ArfFw0uRjlumUIiFyMTjX47A==
X-Received: by 2002:a05:620a:198e:b0:7d5:d1b8:e02c with SMTP id af79cd13be357-7d5ddc509abmr651646885a.10.1751888537272;
        Mon, 07 Jul 2025 04:42:17 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6b5e6fcsm695212066b.146.2025.07.07.04.42.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 04:42:16 -0700 (PDT)
Message-ID: <6579c65c-877d-44fe-aa81-5b0e602b33f5@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 13:42:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm: Clean up split driver features
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
 <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA2OCBTYWx0ZWRfX65JWSwPiAheY
 k4KoKAW7uC01Kq4lBwf6tyAxtUi2fyh6C0J5OdqB1bLZyKuikWttpaHqAzYzVZfn4DUTOUdL99U
 hbEqljs28Mu3HzBlZM4ehwC6JYCUTtGiLzwD3riEkeUU1sP08l5fMjHp4++cqtjJ/ng0dOC+J9Q
 6m4RGwSqj9Nia1yLLb3nzwX8wCMgb9ge9Pd5RCXn3NjLCoNUBxf4fhV2H2SqTlUHDEUyHPUdccp
 tz5tvOoZcYa2RTq/B98qnVUN1rnQbULUfF//qG3sC5q0d0trO3KHiIynXPw/g0Ny+x/8heCwlkt
 0Sl6/b0WI4WLGHlRgXrX54ggPpA+rmZhaQGxR4AiRzmENfUUFar8Ku69zb2VbrBHk8ADS9rKcgp
 wYywOKi78DFO4HKrrIzCHSXJoEa8bxTcyUvtcooc+9xx7o4qBwfbkfeNwnaHMkmtBfD5pO5P
X-Proofpoint-GUID: RtEtFxx7sksR8Jao18qoQ_ZabJRPzCNL
X-Proofpoint-ORIG-GUID: RtEtFxx7sksR8Jao18qoQ_ZabJRPzCNL
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686bb29b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=By577mDeuySOoy4OwVYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070068

On 7/5/25 4:52 PM, Rob Clark wrote:
> Avoid the possibility of missing features between the split and unified
> drm driver cases by defining DRIVER_FEATURES_GPU / KMS and using those
> in the drm_driver initializations.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index b6efc5b9933b..5695de1bbae2 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -816,14 +816,21 @@ static const struct file_operations fops = {
>  	.show_fdinfo = drm_show_fdinfo,
>  };
>  
> +#define DRIVER_FEATURES_GPU ( \
> +		DRIVER_GEM | \
> +		DRIVER_GEM_GPUVA | \
> +		DRIVER_RENDER | \
> +		DRIVER_SYNCOBJ_TIMELINE | \
> +		0 )
> +
> +#define DRIVER_FEATURES_KMS ( \
> +		DRIVER_GEM | \
> +		DRIVER_ATOMIC | \
> +		DRIVER_MODESET | \
> +		0 )

Perhaps I'm missing some C lore, but do we need the "| 0"?

Konrad

