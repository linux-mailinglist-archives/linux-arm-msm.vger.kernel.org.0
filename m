Return-Path: <linux-arm-msm+bounces-85378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50359CC3C20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 15:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 555D1303262E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 14:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D9534CFAC;
	Tue, 16 Dec 2025 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l52Ekt3/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RQpJS5lV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904F634CFBB
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 14:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895570; cv=none; b=luBNSCDdPrA8bP8ZB7m+K0I3+PNx7+iJlWrtPdf1QMop0WRnp147Vi0iN0/vz7BvsE1HDvlu3Xd+yYcNdr5tJRi2AD8q6Dm7IL8xlY6L70XCBnLmqKOVUeoO2BoZs8Ju8p5i+hpg1cBmEPKajbJ0T+jp0iI9nmJfaP3YQpQGG6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895570; c=relaxed/simple;
	bh=LQFNapVMCQ/JalvfgYjYQfiqmX6OJbnFjF63HzBCz58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2LkqqlmdENMocv2nVAg3fdqTRtMAMb4lCQkTAp7jAlJMRmfPks662ffnhv7C+XN4zw1B+B4t4Q9Ii8B5vrkLB0P1FuIZ1JSu0tQjulCLJof5lYp4AlitPNm4k3Sh05A6bvH9yuHCh8cLyaHghEROKYK1tZ/CqPu/96MsSqmC98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l52Ekt3/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RQpJS5lV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGD2mtA2573310
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 14:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sSSMICGICe2f0YIccl2tqHqDQh0xExPvbuAKbmzyLo4=; b=l52Ekt3/3tztiqwG
	gVwiPPv7VlpREtpqvlh+JR4YQIKRXVgsl88qyfDFPt12ZTOjlfN5AA9jXn1Iq6kt
	UnlEGkX5kemeL+qfmIY+CzLK+ZE/zCZAXTIuOO7IsLnhJjZdzciHhcw2GaMcdfdS
	x48nkxLCX4zvGJJSEVk8Mw6wnQ1UQiRpzNGIZrn5zzU5EwzwH8W59EGWehMlzvv9
	6U/Qk4IdbXbdQdJqzIYM+FONRucm04VVmDXNa1ac05LWk/38iB7KZjMUdd1TwsdE
	vxkW16kHscGUYs5HMVlKxdoJe8nnmHBzGyNvxosPwSUCEJUH9lypLw09kziVWvas
	pSOhlw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b33thsgh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 14:32:48 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5e53b3062c9so3268205137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 06:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765895568; x=1766500368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sSSMICGICe2f0YIccl2tqHqDQh0xExPvbuAKbmzyLo4=;
        b=RQpJS5lV8i83cmun5YDgvjIDrsRG5B6jm9S2XFtwKxKWo2FLYiarLkxJ/ePrS44HoL
         cWY5ayrGBZGbSvehZmiFwm9G7gRTNADrPzjhchPJ8qzPAh9o+0ns47RO6ufgjYR9cHA1
         gUMQcWyeE1mHxGRVgLE+BWMFXwGxSRV1NwRRQIEID+P3STSEUv0lZLEUylPKLFuO3sLW
         W3OWwZfwRVPIOYSuMi9brhJoiLU8LnQXRRECATJWxVyL+Rb8A6/MCd3oYQesaIu3yma4
         8pSuXl2DHfH6kcVvzylz47ucyfZAQIaEbmalVF2roc4rCBBlBp4NxfQqhmAqOsacA/dr
         pg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895568; x=1766500368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sSSMICGICe2f0YIccl2tqHqDQh0xExPvbuAKbmzyLo4=;
        b=Qj0Gj2XI27GXZZheWR6T0CeaaAt5IrACq5uLYkH4J9Reqi7eZQ7f6emuO/frlXddnR
         JGG6UuUzu8qcOyKOf2DZp76zzkSvZ6zbhZAV2JsRHD/fTFk5IPtt6fzkLmwkrT4kaQfW
         YSmoPXuV0/LoY/qCRpgSGkSpZXpFsFC1THOiPpx1zjbRcjpoIvFjvHYerpoAQe3Rg/48
         HTeHMP+hekCg9+kDEVxtNup/3L29aNRsuaKkSjQx7ZdL0sd1+iOMh7h8a4faWKZpbTAY
         wpDBEJiscD2a4bid33/YS0CULljWgEXw+0DPRyh/i53Qn8WRD38LgXRenKQNcL+guUOE
         uPxA==
X-Forwarded-Encrypted: i=1; AJvYcCWYuKTQcIM7zoiQtwANgutYDUT4/1z1+hHadp5dGmBJi0M901sCJ4GQNUatuOJ+S9btEz+BsGFT38dlnvpX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+6FmojSiDchu0dFja9bvfMytIoWMyHLM/eKgPB8Al3hs0wzfv
	WqFzFBhyf7uPNHHVUMRgZIB5e8AVUF3swJ9DRJ3pNC6zWVOukib8lnwtKOyDlzI1D70mkenrKSt
	f7g8mPHgqaU7gpfn/Ax66g9IDgIt1pQslLwGcTzWgEWIyAOx8tElEliTei0tmkxjOaboI
X-Gm-Gg: AY/fxX7MWE+yotuPHdbbRkhYNfcF8bUQ0Hcts0IAf6ayPlsjJfKZqRq6StBvVPdJoyP
	ilC27tGj5xqmIpe+tNi5tX9MYV0SRMS/5BM5IxEdn1M7PF09kgkNJ78a+jZwsXpkMB8E+q8Avrn
	N8Nzmt8fFlW4WKKdqTFc0HegrurImWd1bemguvIsOvUZfyXwZTSCZGEi3s8CGsvJOrx9Ee3qMq3
	KD3mNv+kntXoi9AtfDtfRrkYIaMtR3CkuV6xl3wP3oiyygd4DvxhJjFl8slq5VkZJhblfsiQG/g
	boNPbn1dCPEm6P+aCw32ziKNOHR8Fl8cjhe9Gqw0UwoUc1M7Fpkf4JdBHDEQzvVYWxlybsAxQli
	7zl2a+8bhBjPziKHH9CphyHiLO0WMM8EsDCI59IJjjtc+p+iAnyBgRbfBoaeErGiiGQ1Q
X-Received: by 2002:a05:6102:4487:b0:5db:f615:1819 with SMTP id ada2fe7eead31-5e827488c7fmr4127731137.3.1765895567567;
        Tue, 16 Dec 2025 06:32:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5bvKhIUfXMFuxDOHV/Y5m3VNAwV/RECgvjwhUnC/dgoHjCv0Ee4gAMKdHTBXr7UcOFJElvA==
X-Received: by 2002:a05:6102:4487:b0:5db:f615:1819 with SMTP id ada2fe7eead31-5e827488c7fmr4127698137.3.1765895566843;
        Tue, 16 Dec 2025 06:32:46 -0800 (PST)
Received: from [10.193.196.209] (82-128-196-119.bb.dnainternet.fi. [82.128.196.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da1a7d8sm954688e87.37.2025.12.16.06.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:32:46 -0800 (PST)
Message-ID: <0e9c0f8d-c1f6-4c84-b467-37e11837882e@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 16:32:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Enable support for eDP v1.4+ link rates table
To: Dale Whinham <daleyo@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Steev Klimaszewski <threeway@gmail.com>
References: <20251214-drm-msm-edp14-v1-1-45de8c168cec@gmail.com>
 <s43zm7ljm5cipjgkjllvplk6jcxrjo445rboirikivtr3n2alh@fvu66mkwkb5q>
 <2c1656ff-cba9-4122-a414-d22958f5857b@gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <2c1656ff-cba9-4122-a414-d22958f5857b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZIPaWH7b c=1 sm=1 tr=0 ts=69416d90 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=UP4AmmvVc3sGQHJQO2VA4Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8z4_Mw9kuIkUejV11uIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: hpSa1GZc2UZ7bIbCeabhH1e53lYf6AVr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDEyNCBTYWx0ZWRfX0/TanH3XJZVw
 F7WJWj+Ix4wfwSDr1vn6H1tb+Z6exHZ2ygS2JJBpm0alQGB5xt3N6Pppri7+48D9QFDS7vQLeb/
 uhrcwbzzx3ct0Gn8x+3842n7ePB2JmHsdYvRcrSIw7idLcmYbnz+nJqsKi+ry520X1g9osqG8iB
 5RN89zpiO+ThGTtEKnT3qtp5yPKfdO1i8C58SKT1Z7o41aII1f2ZnjrSk7MJt1stK0zX9ZF1ZxC
 KDFJUS5QDMQ4L6WEt8y8O+0cHqO83/1dGCbrWGuhLvw9RhQNeFYOTyh0wHvXmfdVvgpat1v+nfN
 yv/m70XUmY90oPJYKmRxzl1MCw6x3ZBroCE68+0eZdsnYxuQeXl79zCbiVbzzLU8Tn1p0d0Yj4P
 BTkV4OSu+zxJ7pFabwqHqcotTqOS+A==
X-Proofpoint-ORIG-GUID: hpSa1GZc2UZ7bIbCeabhH1e53lYf6AVr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160124

On 16/12/2025 16:31, Dale Whinham wrote:
> On 15/12/2025 22:15, Dmitry Baryshkov wrote:
>> I'd suggest following i915 and writing DP_LANE_COUNT_SET before
>> DP_LINK_BW_SET.
> 
> Thank you - made this change for v2.
> 
>>> +    /* For eDP v1.4+, parse the SUPPORTED_LINK_RATES table */
>>> +    if (link_info->revision >= DP_DPCD_REV_14) {
>>
>> No, eDP has separate versioning register. DP revision != eDP revision.
> 
> You're absolutely right, this was a mistake.
> Does something like this seem reasonable for v2?

Yes.

> 
>      if (msm_dp_panel->dpcd[DP_EDP_CONFIGURATION_CAP]) {
>          u8 edp_rev;
> 
>          rc = drm_dp_dpcd_read_byte(panel->aux, DP_EDP_DPCD_REV, &edp_rev);
>          if (rc)
>              return rc;
> 
>          if (edp_rev >= DP_EDP_14) {
>              // parse the rates
>              // ...
>          }
>      }


-- 
With best wishes
Dmitry

