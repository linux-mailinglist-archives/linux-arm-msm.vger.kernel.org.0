Return-Path: <linux-arm-msm+bounces-88270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D2703D09191
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 12:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98E3D301C909
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 11:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD63532FA3D;
	Fri,  9 Jan 2026 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pgOMANCp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a4hBsQt3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657522DEA6F
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767959755; cv=none; b=bilgxgtW3KjWWNDWAiT5UI7pq1oXHCsEbpiQjQtlMKRk5wO1NLQmv/4j/3cmDswe2cF6ZpUjJu6tQI7+ICsADjWSpXtP7Oaidj0TUKkNALxEM5dWNNWsogpAIg3avySyDnQ50CKV+QKOXkXCEscDO9WU/5ErymIpT5PBe88IndA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767959755; c=relaxed/simple;
	bh=pDwg9PRB8e8a9B/DP3EG3dnkfyPIQV2Hdbw3wu1CuQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o4j5iG8lvKePwF+zLUKHwofoT5Q3mi3p2NvYGw+1PEF1wXQfX1+0RS7UeeNKdiDrpX5ahLdSU8CXckrZWfSBCDzMKFZpecbPFZbO0rQX2tt4rl4IESML4kvQOUDEyTdnC+/ZsaCd1+VHZGgxdjRo3IVHqyd8aGJVyly6SB345o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pgOMANCp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a4hBsQt3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098XOx0822825
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 11:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SSDrpISmvVn+NO6fRjyzCxGmtTWn0qHHaWxBnhLgTRw=; b=pgOMANCprkJwasRk
	eEd4MYHFC4D/oEu/AVhwCa1dujnPr5drXX2/kVVpOf62KZf213Gin9ckOPTP/50F
	OzNZIjM82mv8Jp4GHuzFDMlQtkVxcl+j17ouuouKvIST5Jat2kCq2LTZnn1/DUY+
	BE8o3ED2NOm2GuSSMVzIG7r2mZ652l814XxNwP04dkYNKQpJmGcQMBiN7xjkMlkw
	6gNhS3nMG1bojXL8zDJVIrGNFfaghK/891hcFHXq81ciAPNdle/PRrSybzTcawDp
	t7f6cOII/7gsKMn8CeOTF1vPvUurMvinVoDXt4ekafGLIUTJf7ZUPy8coM6TrKIc
	82E4tA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjx94gm3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 11:55:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c2bcf21a58so1120491885a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 03:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767959753; x=1768564553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SSDrpISmvVn+NO6fRjyzCxGmtTWn0qHHaWxBnhLgTRw=;
        b=a4hBsQt3LNhh2Oo9VCkfu/u70ZgXWu+gJH5rCS0QYMLJcGfIesr+JkHC9kculz/Yb/
         j7iHWcOORTbD8vCczBQUhgJUi776cEOMIWuYUlh+2qj6oMMbGSU9jRhHf7N/CZtPU0sI
         mPXSgJWvk3zfDtFtmvwewwpbK7DVbFi/iQx4wAnzl+cxSHvVVodIjRbzoPEtZ1ABJEba
         lOqpQttn5A6s+8Y4+OPotDblkWwKp4YzA6exPSjyn26bhwtQackeab3Hbif3LnLCyw5o
         y9R+vu+gbQVlVFcBUN+lZ/teUVx7m2+QM6IxAsngsMsXSwH+jmm1xWiY3UgDHaJT0UyR
         HqeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767959753; x=1768564553;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SSDrpISmvVn+NO6fRjyzCxGmtTWn0qHHaWxBnhLgTRw=;
        b=CYM9cqcICvmKe1D/DWVQtj91hjvXz4YqV13Jf23v4SLmJm8U37kFzf3fNh966A8UkV
         GnMd+kjc+JxbRLAi19xPoqA3YbU8kiZ7uCV8cP2q4RhUb2iJdzNhHP+9tVGLtuZiuJbP
         lW2xYxXIc0bWv4dQikcejrrGi0l2TpD4xB5xdjjuelf8YFvJ8HSvfXXjM3J8wePYL7QO
         BKhZNIhFvNeG4wTolPc6mTrrouqBRbKcnKuvYV8HiNCodELEFC1LyjybiZuix/FXzEAf
         dDhoX6KYZFEBgxOEgjBDtSE2cUv1HT3Mcmffpstrbs1kwh+K2gYeGzO0LknEE56iLCTz
         aeNw==
X-Forwarded-Encrypted: i=1; AJvYcCWX2XZflgvObhoRkgd1lBGQRMOxLcEEH05i9UvxzDBWWxWs9M8lMXWS4KR4h16erkT0AONRHpVX3vXlTVmP@vger.kernel.org
X-Gm-Message-State: AOJu0YxTZaVk4lDOnJlswXTGSAISh3iga/bW7um5qA1xm5bL3O4kLeOF
	bp5QdOMz54O2iSzzwvVtjkqqBAyQBC3XehUCStDEWH6oCcUk1igvlws/rZW6eU9jv+nFqpWs0j+
	V9oZxgVMmafh31okUsS8qhbYOSoiDZjtcugMw629EydxjB+5uNZLPuPcKdmnBJ/ZJU/Do
X-Gm-Gg: AY/fxX5FtrclTdpUcQgKTLbL8gCfD3OUb2btDtURNyAM9Huk27P0cwZueOkl3ErPb57
	EpGjt4OMuTUyt7T4Mmf+fFr4D0lCI8YDale5kNzMyoNjLl1yhjxUpV+WzC2VA/r8qs+bGy4SFqv
	1ok+dZoD4OOzP8RXu9rca3QCyoIy0UeU3DDDFiqZ4unQAOiGSOMYZoWFg5KrduGXy5bXh9tCecd
	S1AnsJ49BJCancONEN8K1iD25W+sFvPbXkBgQ4bHbi18IvtZdLUvvVbnj5IZcCYdGnoKjD61s3V
	l+3OLp7WXu3ILB1aZNhZX6u6kFP++yTWYiCrbKd6g4WtrN0CtaZoC9J8aO0n2Lxt/GQ30YfjvV/
	cnWRivlXZpWZVYoYdvh9SU3NVVvv0oApoQ5gH0w==
X-Received: by 2002:a05:620a:2686:b0:8b2:f269:f897 with SMTP id af79cd13be357-8c389409ddcmr1207345585a.41.1767959752714;
        Fri, 09 Jan 2026 03:55:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+067aZV0hc94pvEUtBhDJm9uD0GOXh7JwLSZyYZ8jclFPY800/XQwNVtwW9PmsF3O1oGaOw==
X-Received: by 2002:a05:620a:2686:b0:8b2:f269:f897 with SMTP id af79cd13be357-8c389409ddcmr1207342385a.41.1767959752208;
        Fri, 09 Jan 2026 03:55:52 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d1c6csm1074238366b.39.2026.01.09.03.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 03:55:51 -0800 (PST)
Message-ID: <ccebe9a6-34e7-4699-a4ff-1ee925f9c150@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 12:55:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] bus: stm32_firewall: Use scoped allocation to
 simplify cleanup
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
 <fe8bdea9-4bd2-4200-8b7c-3c231dc6dcb2@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <fe8bdea9-4bd2-4200-8b7c-3c231dc6dcb2@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RN2+3oi+ c=1 sm=1 tr=0 ts=6960ecc9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8 a=8b9GpE9nAAAA:8
 a=81cV5ACUyFlniFfumqcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 8svzNsx2CIS3lSCGxRjbzla9YTK35Gew
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4OCBTYWx0ZWRfX0QW+4gafdkKh
 zvFOfjhNA4bDlQ9ldjFwhqjqNPbwkRRfP+zYKSkatN1G22hMZY6KiaHpIlrs7/gaLYTSqXG6TFB
 FXHO2n5u8qx5wuB1vqSpL7C/zRXJ8/9EkMlHspVyj5qBgxMLU9JHvYWhfBUKJdcxZM7EiNW6bCI
 9Z/3dkTY8FCLrrVBbf3QyZ37CGOGznZAkjQq8iM2MPv5oaZxIJtUQ0bre8qGSxoJ2+MQ7qsKe2P
 ehLRVxjENnpORJSm4N16KY3hERLwfg9hx1Casu3daWlsTeQotCVUkMlSVLHiG6QIJsAdZbpe2hO
 7XO6dQSUkt0lNj6gQzvyAxDSoferx43SDAHd5Afc7ehv9MLKMjWrVCrwZJNNcfMxLGlXwLaT0VW
 QfkMO45fmx2ZHRFJbqXmmcNMyyagvTJdb+FkogghZeOTp3Ws6sYovyvZJTNLgjAFU/RkS0UZu+J
 5I2gCiRZmRk+nYJQLOw==
X-Proofpoint-ORIG-GUID: 8svzNsx2CIS3lSCGxRjbzla9YTK35Gew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090088

On 09/01/2026 11:37, Gatien CHEVALLIER wrote:
> On 1/5/26 15:37, Krzysztof Kozlowski wrote:
>> Allocate the memory with scoped/cleanup.h to reduce error handling and
>> make the code a bit simpler.
>>
>> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Changes in v2:
>> 1. New patch
>> ---
>>   drivers/bus/stm32_firewall.c | 10 +++-------
>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
>> index fae881cea9a0..92414a4c7bb1 100644
>> --- a/drivers/bus/stm32_firewall.c
>> +++ b/drivers/bus/stm32_firewall.c
>> @@ -240,7 +240,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
>>   
>>   int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
>>   {
>> -	struct stm32_firewall *firewalls;
>>   	struct device *parent;
>>   	unsigned int i;
>>   	int len;
>> @@ -257,15 +256,14 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
>>   		if (len <= 0)
>>   			return -EINVAL;
>>   
>> -		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
>> +		struct stm32_firewall *firewalls __free(kfree) =
>> +			kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
> 
> Hello,
> 
> I'd prefer to keep declarations separated.

Separated how? This is the coding style of cleanup (which is quite
explicit around other styles)? Or you meant one line without wrapping?

> 
> Otherwise:
> 
> Tested-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> 



Best regards,
Krzysztof

