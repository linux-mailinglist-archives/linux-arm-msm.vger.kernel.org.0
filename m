Return-Path: <linux-arm-msm+bounces-83447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14605C898D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 12:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C10CB3AA795
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 11:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16359322C7F;
	Wed, 26 Nov 2025 11:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z3t49/jM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/1LcrOl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7352A322C77
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764157024; cv=none; b=U6oo6bTti48Tbu+LhbW0WX6zdtcTn9gWbDr3m66vNkKiJgVMKWMpZqLTzWlfMo6hcdwJ0RiR6zq9exmI8Nal087A6/5HWcbIlUxB/HSANSlUQzcShjrzOEJWjPM8h/lYyeG7aTnAd177VMwGh9thP06etjs5ioicbZ1Z/bnSI1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764157024; c=relaxed/simple;
	bh=OroEQxNuErxkPdcefyp6oQgjJWcJq4lHntV0hjVk3Hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sdLtiqyDhJiLIagfRAzOOE6C5bJYfw9rFOqoozU9YBR7J4GHeC1ocW3n7wxAIZybbymBrk7nVu3wL3E3rykXDyMbz9ofhdJdlo2OP/IA3TzsVAuWwgxcPmoyo/QbtYZTaDoks1OTZDkVOCkU84Tb09QQM4Ue9Y1odNhQ7/nFRP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z3t49/jM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/1LcrOl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQ7gh3h1235443
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 11:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n7wL86qO0oKaO/DjZXseg3w5mkQK3ruQ3+V4DE+9KOg=; b=Z3t49/jMrsKcJdlm
	Htc7/UAbA3Icdtkgo2A5+gdO7IFEpaUxkuOsAfjgIwis8MOd5DMNlvUwcmPG+VLz
	qFxe4Xyi9gHbYRtordCxbeSawPZN/8O63qTvg9EbpsP8wpNK+6cgU+tpdf4TgBG3
	XiPcgQML8hqllTl4tbm6SY+tFEgZp/U8Qt4aU9S3sJy2ukKDhtyK+eGgGPxh3Lru
	LVmSAvy8fGjggl+AkSgOWfAXyxh7iYMLf2HT6SeDFcZiBVL0DKGWTdGJ2R5cQfY+
	BcsiMErlygjjDUUJFDUVj/MHh6MfBPDxKr/LWFAeDcbtew6AMm0HihV5EtWUiAuh
	03sBcw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anwd40q60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 11:37:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-299ddb0269eso82673775ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 03:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764157021; x=1764761821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n7wL86qO0oKaO/DjZXseg3w5mkQK3ruQ3+V4DE+9KOg=;
        b=H/1LcrOlQXD8EQQBonIds6Jl5zY8siZeKzOy1CTZh/n8kIhZUxtUgUSl8ZNP8Gw6nM
         lMO467yHA5tJNco1nnHCQIPI6IU6Fisk2XTXubkFb5nSml3sb6+uauRsQL7KgV26m6oD
         w9lFWxnqzIV/qRabZ3j+G/L+eFcu1Sv4L0tLvemRebv3UBClDWFmicvnawqcoMK4P/Xr
         ydWUnZwHqHiRtfHEvuz8F2lXqaoe5rzk5jhYEDQ9bbAQwUxaaveQAd5M6/vJIxBMOrjK
         qyXtGzTMZlfGLMtrr5pd0N2seGDjiBGkXux7gXqiDzcf21p470qpIg8fJfhhgzkjxC+a
         /QJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764157021; x=1764761821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7wL86qO0oKaO/DjZXseg3w5mkQK3ruQ3+V4DE+9KOg=;
        b=fAFwDwmN0THhGAWz8OHYRCUrEKsU8ejb/pEzUa6A27ltRyrlpr/oEjC0DrgRF8IFZF
         ZZaMaM8C2z0x2mMnG7e9vYS40w7HfV0ISF0B98/Pb7LgzFyCox/4qanpnp7mY7nEZg/x
         iHDxjceyZLA8N9JWM90A0szBsqTO17XuefkxFYNL4LInq53kFVFqprQV6sQDRq8+u1d/
         BBCuuj8I43W/L+Z7t4Um3S/CnWo/GosFTBbpD5Ak0ElwZEW5zIUFvOlzSN+3mkQekuh8
         Kvdz5UvRK+t99gsMaDAOMDuNOYKQMiqxjjbX5mr6xHQJaGJrL1zaHDYOC1dpHz4RjNgx
         DVyA==
X-Forwarded-Encrypted: i=1; AJvYcCUtTi3SmqxzZVH5iQoPzXRx4aLbkTOX1xFtQTuaTzWwTnHhj3jU6W+uKtBEFgXe1nbsvENqYN8XlYsFtLdm@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyl7h1OJVQuVYSqygxJKQ5IvNpkoMBTeCYqW/r5fyfxeteVQ0S
	r4VJlGg143NESTPUX7hnA7hyHkgmGP0lYyo7li5gV1LpRKlpu0ouNjQZKF6tXuME5D+1ACRv3aC
	QAqnvqN7jZf9e7zXFmXdhTmDnebrxb7/BN8AXS/B307ryDB4mrsepEGhMqlXhm35z25yq
X-Gm-Gg: ASbGncvCR1EcJbe9jzxlOc84XqcZfGM0GmNMzrmliNxJWdbCMZbn2MBZZMApworfte6
	6GYd4hU8fONyvKYn0vC/+Jca023mMjJrV0qGCyySazdmkU2gIj9llKFstOSxlPJgfv8ussazdp/
	E0plR7oNwCoX0zGlcVaImqnUCv8o9ebkAaLTPk3VsKXO3rSDS5jS6yd1qHz904F8+6mNUHqUviD
	O1bXU46lUcQFJOpa7wymzGfhB1LpZEYcoDWSp1O6SrO5OlHUofyloJHsKBY9FNitcccWGuiCI23
	dr0nzpZIc/VVHya4vZiGTsTobvg7Z7w8shspUPCJVSVJsHeFFzDLHukPBcM+9JQsdHn5igUkU7b
	b/nt3uFvEsnm0HKgvE1MR7klsZ9dw6+TvP0u4Ew==
X-Received: by 2002:a17:903:298e:b0:297:f8d9:aad7 with SMTP id d9443c01a7336-29bab1c4637mr65576635ad.50.1764157021065;
        Wed, 26 Nov 2025 03:37:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQXyiz49GT5zKYdi/kZ0uOjBr42OLzEjIX7mTPnUd1lYdVYntNAehTvWuyqVwPOqP1KTldPw==
X-Received: by 2002:a17:903:298e:b0:297:f8d9:aad7 with SMTP id d9443c01a7336-29bab1c4637mr65576285ad.50.1764157020606;
        Wed, 26 Nov 2025 03:37:00 -0800 (PST)
Received: from [10.219.56.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b12f988sm192632605ad.27.2025.11.26.03.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 03:37:00 -0800 (PST)
Message-ID: <81cdefa8-9bc9-4fb3-ac7f-afb34f70e8de@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:06:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] iommu/arm-smmu: add actlr settings for mdss on
 Qualcomm platforms
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251124171030.323989-1-charan.kalla@oss.qualcomm.com>
 <6zyysrrq6mt447s6rg5sk5vy5w7ulzub4u5m24xw3xo7edguwu@73vtynhdp7nx>
Content-Language: en-US
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
In-Reply-To: <6zyysrrq6mt447s6rg5sk5vy5w7ulzub4u5m24xw3xo7edguwu@73vtynhdp7nx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qeOZgyMFMRuHNAEXVdux5hO3MjjSxf0H
X-Authority-Analysis: v=2.4 cv=feqgCkQF c=1 sm=1 tr=0 ts=6926e65d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=YkchOtpOlfnu4Q9Yy4sA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: qeOZgyMFMRuHNAEXVdux5hO3MjjSxf0H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA5NSBTYWx0ZWRfXz0W8TZdwk21M
 j9WiOHwDFhfhz9akqhfa5um6za782NWYsiS4soD+zIZ3e2T3jl1JDo767bqqvXL+RucYmTfqlH5
 Iu3Fl3IyHQXN4p9kcluSn9lrOJrjGEuP+K02KnkLTWvZu1vlZ5gyKHHAWRTyEwiigARKpAya2qO
 aaKcXjdcRoA5G6cYlCeqAbEoGjpT5WTMQBqVw1iCs+fS+gGrF4iJ9pqVGaa70TCQv945lstoH8z
 /f7ZgWofnTtU0ssoDcA2UQZWM42KqzVZIMGiqaZ4MUPehznorqqh/NaV8eLC93mvipiZfBe8MRb
 LymQEOMmjOYrET22uf26+HQphPpzXsqCUxm12i+fJPoFTemlOD9WdUhRcElVJH/KNWZicNrhvn6
 QuANSTvg/zQQwKzv0nR2rupa59LnlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260095



On 11/26/2025 7:21 AM, Dmitry Baryshkov wrote:
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> index c21a401c71eb..ead1a59d40ae 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
>> @@ -41,12 +41,34 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>>  	{ .compatible = "qcom,fastrpc",
>>  			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,qcm2290-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>>  	{ .compatible = "qcom,sc7280-mdss",
>>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>>  	{ .compatible = "qcom,sc7280-venus",
>>  			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
>> +	{ .compatible = "qcom,sc8180x-mdss",
>> +			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
> sc8280xp? sm6115?  sdm845? sdm660, msm8998?
8280 and 6115 is slipped....will update in next revision.

This Prefetch feature is not implemented for all the platforms, I
captured only to those that are implemented(to the best of my knowledge)
-- I will put this in commit message.

Thanks,
Charan





