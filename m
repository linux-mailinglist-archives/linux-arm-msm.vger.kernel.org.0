Return-Path: <linux-arm-msm+bounces-81320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E017FC4FA0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 20:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9933F189C9F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 19:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646C8329E6C;
	Tue, 11 Nov 2025 19:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dOGWTEhJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XbB5gJsq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0975329E6A
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 19:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762890134; cv=none; b=swaY8OCbh1Tnkgp7Hst4bXcH6xaZra/0ToEwBgC07zuBMzJGoHsJNEx8U6Z+5kFUCZL0sfzwUvzluJkGvfztn/LUr4eVosf7YetGHcqRkf8ppr7FPXV4kRJAg+an7UFjWecScurH8BsI4zXJWVAJ0HzVMQBPNbnk9bpWE95Bio4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762890134; c=relaxed/simple;
	bh=6+fEFdBoDJ+pdMIGdNf08YV7MOBxSDXwgZvR6IbTh2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SuEJ1LyAHVxaVDzzWgApz5zfIqA1+x8iHAwYoARubzLdRP7cBpizMdqoyq0DMNxWef5uXw0moszyzRTQTcsHuGVdhbCWnsjYqvNq0QGPum3PSM1RfI39hCg37A4K8B12l+um6g0lxjAteDcKkFF4ooBFbvT4PgZ1W0G12GBPGR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dOGWTEhJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XbB5gJsq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGQFr2027740
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 19:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aqnoVw51UCIsT26Oa4weRLY+7NAvoYQK7MEQUSq3sb4=; b=dOGWTEhJr5/jhzIH
	+FhylHABGhJ9Sp9IyfG2pgavk1/MZLBJEvj5y3515gXq/7kX4axiiNLHLDTUXw9i
	k8w4tmj95DulWiWDdcoJg4bYn3VuA+hVX7JotI2Awj1PiaWwy1ZJjJv3AVbGGicP
	d00J28g0FMRh3wZgTKcYymCcqFacCSPedxEaDLGSY48LPnndwet/lu0bl1CKhWvl
	H6TwuXZZ2Sz4k32sh0Ua2vU/3yLhSKaukKwJVu+tqR2J3+oKK8szpb9yYw/iFCBP
	fVz6SfOmRDzYWP5wM2zGMufkQb0xd5hyn7aVTAxK6fuAvbFl0aQSPE37DjzI8Uw4
	2LEM5A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abxqw2gc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 19:42:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29848363458so1228705ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 11:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762890131; x=1763494931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqnoVw51UCIsT26Oa4weRLY+7NAvoYQK7MEQUSq3sb4=;
        b=XbB5gJsqvNAPtDpddSQr1A5Tk98kWlG+8ebLkDKbR141ax4Kmids6VexYGdKelW1IT
         o+2kKi4B4FM8QR5gPzMahAqjQx0vo1he/TgrCZihl3Wku0tx1zehq6u5dkei3mb+BUCM
         j7jYnl4HhAPSRbRtxnu+GjfEEJ6u6TGPZwzT78o5sQrXGYDdKtk10+4fFI7WZXySHm9i
         k4SUE+dknBtBRMB5lZlfVxAOnneGA1L5OLWGsCFGaTMCTsQHsWojEr9nqcB0sZIUP5AS
         2SxQ1MRQOqu0QaFfo/nq3J2EoyRxsZDmriUGMLJMk/up9K16q7rzLoJb9zcuCcjw/0jT
         Z++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762890131; x=1763494931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqnoVw51UCIsT26Oa4weRLY+7NAvoYQK7MEQUSq3sb4=;
        b=rBl+3xY3HoFy6EPSleXfCQ77NkT89SWiZSV2+0lMODlTuURjrsZrp6wUyBjZMwEGfC
         YIIpA4DkkzGwX0PrqK95McP7xa4waNjU8tiStJ7sgiScct7bBdCG8512vs7kTE3RACo2
         Hlv3QSVr5SQGo1ZZeQIFtkuUSk5OB+u61H7WuueRVRsvJ+VrqCxX8+xSNd2KKYh7VNnf
         mcT66sbJZwJ3G50Y3lIsq5zzagGgYc0eAD2whqfOoxrqYLRNUEwAjIHPHZ3Ss0XxNWUz
         akpCnp5pp5xwD0ru+LzxSsbW3pHebADpciT3WWOHGUXpnO1E/WWDT79maYgxLsOrq0K+
         ZNpg==
X-Forwarded-Encrypted: i=1; AJvYcCXdQ+ZlT0ESZjVcE13BFLHoYjFDmx/L9rIpFjEil52zRZgg0Sv/WEfZZ2wiaLDfrlHLzMUkCtUBxPfk8nLN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0YGVdX7dLHwEWCoghp1/qL7vi7CLuILKDey5jjl4diGb4LhWe
	1SCp5erF933NWybFFcPcKJe9O5X49XkrhFwYrMGQIO5jzoaxVoLwIyPlcQlDCgfExMXOb2MAik4
	kbno3FgTXWOC1tmehH8shzFbpjhgimBErlwOp7pTs7OKl+AxQHEiofmESibUMwhGbA8CvxJ/O7G
	CRDA==
X-Gm-Gg: ASbGncuoGoeEK2GTKts//wbpciSH2Q6B9TmTmexCHIiX+Z0nx7cggK0VEUDp5NVBSgJ
	mPXeUx169KlLKD6hwL1u616ysrilGpElwn4eaAju4vo/3g0aoB2PPjlLkTGerZ7IhTjLup4DnKB
	HUWTn3g334bxFZcdLvoRnQhVxEC1DiFOqo6fUQhNnvO5EZpL7mSB5nWUmqUdrOK5GNokL/zLBM1
	sUESYz6jxdmmAXFvxrwYTiieW4N4s1FycsoWAAcUm62EllqZK8U7SXAN7RTeGJJXwP7mrCEt5zx
	PAZLvon2aPYlXUDtG6m8x1MMyVcuodMC6bHDKP5HNQqsLHY+4qbrSHxAWnyJiNIlleD2HDNXd0w
	OOTTJJeoLfEpA8rmt3yX+y0WkOyioTjHrG7FT4VykPNJ/D1HzBF/l5XGENU7wkjbeFrCW/YGi
X-Received: by 2002:a17:903:2f88:b0:298:250b:a547 with SMTP id d9443c01a7336-2984ee2c611mr5010395ad.56.1762890130940;
        Tue, 11 Nov 2025 11:42:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWfumxVDHLJVJniJ5/kUPbPPfATDyVpTigTkiqrDKAayaaoggxw+dyqtCM41ZXJhxvIUxbTA==
X-Received: by 2002:a17:903:2f88:b0:298:250b:a547 with SMTP id d9443c01a7336-2984ee2c611mr5010145ad.56.1762890130404;
        Tue, 11 Nov 2025 11:42:10 -0800 (PST)
Received: from [192.168.0.74] (n1-41-240-65.bla22.nsw.optusnet.com.au. [1.41.240.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dc9fc6fsm5313105ad.73.2025.11.11.11.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 11:42:09 -0800 (PST)
Message-ID: <2ec200e4-cf28-4881-837b-4455da047619@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 06:42:04 +1100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tee: qcom: initialize result before use in release worker
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@linaro.org>
References: <20251110-qcom-tee-fix-warning-v1-1-d962f99f385d@oss.qualcomm.com>
 <aRLcO7dveqChPNb0@sumit-X1>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <aRLcO7dveqChPNb0@sumit-X1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDE2MCBTYWx0ZWRfXzCgrCDoIOsSE
 nPQit1mEyDlV3feBrWy8HOHc1q9E/aE0vrFdhd2fs5JDmQXVARwPMC35i5cti2aOlOGR0TTKDp0
 WvVebcu2DbioUTbAr3V3Q24nZAk+wNG/q2T51+9m01edPDI+ORT0suYViIVtEiN4wLXPQ7DeBlW
 BqJsMHwDlmjJBCxpJX5GUxC256hIGjM73+WLABa32LIMsAYVUD1gwazt5QLNuDKnNUs9z12xD0F
 mu2o89Hdz0PN6bvWxIQmAXEGPUe+RfgH/kzU9xZ9LAuMm7sQ1oiZpS7XaAKO34P7LahMtw0yB7Y
 9PHgHCjaElBUW8TriR7n3CZMta5z0xcJs7YfwWU4OpoSZSelaZ77dVldcDq3nUKjYCd3B+XK8ST
 SmSrlHi1Hjh8Ygg8IE5fVIJzUeWq4g==
X-Proofpoint-GUID: KKhk8g2Zq-5kSaR8Qd_SPzwRmnpTouuG
X-Proofpoint-ORIG-GUID: KKhk8g2Zq-5kSaR8Qd_SPzwRmnpTouuG
X-Authority-Analysis: v=2.4 cv=CeIFJbrl c=1 sm=1 tr=0 ts=69139193 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=hi51d+lTLNy/RbqRqnOomQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=i4atl9h2owgdAyLMJb8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110160

Hi Sumit,

On 11/11/2025 5:48 PM, Sumit Garg wrote:
> On Mon, Nov 10, 2025 at 01:28:32PM -0800, Amirreza Zarrabi wrote:
> 
> For the subject prefix lets try to follow the directory structure:
> 
> tee: qcomtee: ...
> 

I believe we previously agreed on using tee: qcom: based on the reviewer’s
comments. Currently, there’s no commit message with qcomtee:.

https://lore.kernel.org/op-tee/4rbfpubsaxgv2buksonfigbdkw6geas6l7pycxuukdymqfohga@ohd4hqzvra3w/

Best Regards,
Amir

>> Initialize result to 0 so the error path doesn't read it
>> uninitialized when the invoke fails. Fixes a Smatch warning.
>>
>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Closes: https://lore.kernel.org/op-tee/7c1e0de2-7d42-4c6b-92fe-0e4fe5d650b5@oss.qualcomm.com/
>> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
>> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>> ---
>>  drivers/tee/qcomtee/core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
>> index b6715ada7700..ecd04403591c 100644
>> --- a/drivers/tee/qcomtee/core.c
>> +++ b/drivers/tee/qcomtee/core.c
>> @@ -82,7 +82,7 @@ static void qcomtee_do_release_qtee_object(struct work_struct *work)
>>  {
>>  	struct qcomtee_object *object;
>>  	struct qcomtee *qcomtee;
>> -	int ret, result;
>> +	int ret, result = 0;
>>  
> 
> The change looks fine to me.
> 
> -Sumit
> 
>>  	/* RELEASE does not require any argument. */
>>  	struct qcomtee_arg args[] = { { .type = QCOMTEE_ARG_TYPE_INV } };
>>
>> ---
>> base-commit: ab40c92c74c6b0c611c89516794502b3a3173966
>> change-id: 20251110-qcom-tee-fix-warning-3d58d74a22d8
>>
>> Best regards,
>> -- 
>> Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>


