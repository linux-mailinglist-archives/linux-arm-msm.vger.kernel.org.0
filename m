Return-Path: <linux-arm-msm+bounces-85802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3169BCCF1DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 10:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CA7130198F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 09:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DD623F422;
	Fri, 19 Dec 2025 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCDgLARS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQmNVoFV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7A827B4F9
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766136265; cv=none; b=IqdVSLzLmwF0KtNIlS7ViWCOLYXiGNGgHMGG9fPs+nSJVcC9Q+smkNBkNlEJ37smoU+CjVF5GxswTyw2ZMHtKF3ekuW2aUZwbmLv9VHJXKiOSNvedkBYgVXaSXL2S10iywpF1Bt2/W3/+OEyBLgfPxPsRmb54m7Jbbqpg0z1LA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766136265; c=relaxed/simple;
	bh=LgbFen8QkJa57MlcXSSYnglkQbLSOclS8v20wXODME0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WdCcwQfIGbnvSDeDzvkgDQRKdpNSEucdTXqMa/idr/lwHqZUSBeIF6bSyytLXqmwrk7DH8A63m54DZDJTauOO/323d/aj4GV8lS8Vr6BTIn9/zAqWAemyj7wPDp63dgkqalJ8yuj94BTj7GTGmGUoaSeWM3RoeWDYCmkAgrq1GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCDgLARS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQmNVoFV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cl0c4000448
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DOfwEI0tIm3WYzjLDVlBlTv1S+vqhrY0X0rRzcUt1/4=; b=aCDgLARS3jQj54UJ
	L6gWb/8+Zn7EWzsA7zGPjFEF3ux+FijNYfSxC4l2oKnQwQxGYdvkbhvsQgEcshMA
	QkeCjd/Y4XPtQiWgTcNNXXZXNQ8wP5IU0H1BwcKpQOmDGWlAkxYlKrx20IyjwFe8
	osd94TAxaIuWEimju+EcXFw9676ozmgchZpJz9HYI2AAEQxFs69fKv0ns+tI8n4c
	FS9UPWhrNDBeHovozQtlVc2tKeiZWURJR/B5h2xyaboUe64N5kI1BfP7VQtMuDSm
	Dy6hSmq1+YNwYx8XjAUxdtp/GBtlI2zn1DNiCOJ6D1NInVSc3zaG2/13xxPlq4YR
	ww9Y4w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r29j442-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 09:24:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34ab8aafd24so1915298a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 01:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766136263; x=1766741063; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DOfwEI0tIm3WYzjLDVlBlTv1S+vqhrY0X0rRzcUt1/4=;
        b=NQmNVoFVKf+yCJaXTU1X/PdLg1cFs7j64GdJjalFY2jIP4LPXHQR7F2qwnErNyULz+
         Nm70ZEnFNqsGbEjU3JkjIWtJd7KysVxJso+iVj/Y+x7BfVoSmW9dY7x46evl2x3j/5j0
         sGSAUv3up15DvVRuW+souOal+oTPdWP4loqlGUgyYw9YK502qPDDUdSLN1O3xQIWEOrA
         wjHIVHiWGri0pPtlsrwpsfczKWFrr8t8vQmNwUFjRfFYdGVADcKu8Hfvm+lUUehgV9Dd
         46PcB2fluT6Lz8T1P4V0GgmGaDkMDJ3h3VATQCBEKSgqT05YA0p5q3BkjZdnwMK3mwzr
         wVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136263; x=1766741063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOfwEI0tIm3WYzjLDVlBlTv1S+vqhrY0X0rRzcUt1/4=;
        b=f4KmXlAfWiFBZBqlsRf6S9+2WBOuh6yPj/6ZICYb/Js1Ws8xmR07aNbt0y+VUUzC+5
         6U2+W1WUL24ooSn1gM50ATGc6a3n7btMg8xgeHYlI1/34t87AOSFwra7XRIkhBRRoS/h
         Z3qVFOAj/deXN+fzQE6FZRi0nLJndtN/XAVYsHyEwWC+MFTDEbFT2Fkg9dNoVVtH/RSi
         ucIdiBGMLJFqW9O7nHajET8vosAX0/dl3kY8x4uQgj7UEQtCZhlwoOKSSXeHQwDre+gf
         hETNZExVoZ0xiH657OXCJ/b0iO31Wu4SiS9+U56Z+1gI7RpHd7NlEgDLo1xS2oQgYRgW
         wNtA==
X-Forwarded-Encrypted: i=1; AJvYcCUYU3IWkJnzwk/u6uTHSRkEKvaVp6j+wl5QDSt7S+ba2S56XLh8mQ/e2dvh1Ol+XveZAG834Vc0CUtGWPZ7@vger.kernel.org
X-Gm-Message-State: AOJu0YysjrPgVr279wX6RbNGVykc8RYBy41iY0YMQDJjU98wUyFHIk6g
	5lTOTK5JdkCgQGE2FKN7zXt5/Yoj+wJxSxsWsHm/DTwXpi0jYyw37Yc7nKIuP6YwgMjrvLSTfm8
	iRi6yVgRxo4s1GNJIkOTcRSJ6CteRvLaHhyjFqqka/mNZ7NS9/kLJ7lnmqmtwj3gH7Ho0
X-Gm-Gg: AY/fxX58uhzppv8Fi/wiz0klM5ZQ3BS9ujYrF43qjMreKsJv8DyLCQNyik4ggELKSz7
	E2kYxMyfpGiT47bfGS9bdqxIfacor6bBN0oJBf7Qi0PO0Iq+22auvgN5LiUKLcRaMXFHEK/jkZS
	NMcfc2hAc0JOpcUQ54zzXCXxMsdUQsFuhTFIRaenzPAzL+bf93ImFlhHJYBuWuFBgxHfpgCXhSB
	8wPX7ArEbHUsRFCNx0prH+iBIb/27vMp8UBliVAzV/mjaqqp/7rQilch7HSCcotVeJlZYd+K/PN
	b74fWy83fte/A2Z78t2C2Yg0CunRUNhAKOu2VB5EVzetC0UURizGAYnYbyhoO5Li22PKqRUHp3F
	jS6CX9MPhGXm33bqDK1oXKChooxh4HzY6Ds7x0kWSMnri7Y4fLbRvdlT+PsekxYPCOnezApJ+e/
	4=
X-Received: by 2002:a17:90a:c106:b0:34c:2f40:c662 with SMTP id 98e67ed59e1d1-34e71e2955bmr5077764a91.14.1766136262589;
        Fri, 19 Dec 2025 01:24:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaHhZUaMUo8PyEk/p7xL6WeDX8rPW0yBK8DGzdCz4GjR2TbHsdfsLYyys2Yz/uQfK3XDzmBw==
X-Received: by 2002:a17:90a:c106:b0:34c:2f40:c662 with SMTP id 98e67ed59e1d1-34e71e2955bmr5077738a91.14.1766136262041;
        Fri, 19 Dec 2025 01:24:22 -0800 (PST)
Received: from [10.133.33.174] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dbcb6esm4744373a91.9.2025.12.19.01.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 01:24:21 -0800 (PST)
Message-ID: <ac1dcd53-87f9-4b6e-ac95-dfe5fc972a89@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 17:24:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/8] coresight: core: add a new API to retrieve the
 helper device
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
 <20251211-enable-byte-cntr-for-ctcu-v8-2-3e12ff313191@oss.qualcomm.com>
 <dd043b78-d60c-4a79-85a8-9f352a4d89e1@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <dd043b78-d60c-4a79-85a8-9f352a4d89e1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P6c3RyAu c=1 sm=1 tr=0 ts=694519c7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=t5fKABB059AxcEZLcEgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: G9nifpCuPRnPh66d0y3A0GE9awCpUnfa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA3NiBTYWx0ZWRfX/9PO2ET4VauL
 56S5bd+RufbZh43xBj6TAnl4q1hiz/4BlRqGluFBfMPfvYFC7zX/b1Vw9qpR4LheBAkji7BeNDD
 k+ftD/VDTq9+G4xFjmgXbZcGMTkUmB+oVVwCWW8NMESe8aTAO5yrvvCFQOsq7DNnwhk5PIqfJ8B
 JD6elqv4DBnTRtdb6LWwcQeSEC3TRvUlfYby8aBHN75tsmDF7XKvqs5KtD5W85B++M7O075MvDd
 AS0nIme2KYYfiJEA6ovW5CTlCTmiU2C93A2zWd2HYs+yEdqx9YXjP9z6gKVMBvGz1XyQrhGte+U
 weuCA472vPwKocRd+hDQRFNs/qSqYKU6meQkVGWG6kSFhguk161EM4oF8XSgHlSMb5WreomaQFf
 Bf9rY3P37WlOeCHm0clETqJLVod2Bl/+VWhOY8uR7MrodUbJx7YnpAKml/ePwWewqh/x4Jx9xe7
 5gAex5CZ4UREbRWTSdA==
X-Proofpoint-GUID: G9nifpCuPRnPh66d0y3A0GE9awCpUnfa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190076



On 12/19/2025 1:50 AM, Suzuki K Poulose wrote:
> On 11/12/2025 06:10, Jie Gan wrote:
>> Retrieving the helper device of the specific coresight device based on
>> its helper_subtype because a single coresight device may has multiple 
>> types
>> of the helper devices.
>>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 35 ++++++++++++++++++ 
>> ++++++++++
>>   drivers/hwtracing/coresight/coresight-priv.h |  2 ++
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 0e8448784c62..667883ccb4b7 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -585,6 +585,41 @@ struct coresight_device 
>> *coresight_get_sink(struct coresight_path *path)
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_get_sink);
>> +/**
>> + * coresight_get_helper: find the helper device of the assigned csdev.
>> + *
>> + * @csdev: The csdev the helper device is conntected to.
>> + * @type:  helper_subtype of the expected helper device.
>> + *
>> + * Retrieve the helper device for the specific csdev based on its
>> + * helper_subtype.
>> + *
>> + * Return: the helper's csdev upon success or NULL for fail.
>> + */
>> +struct coresight_device *coresight_get_helper(struct coresight_device 
>> *csdev,
>> +                          enum coresight_dev_subtype_helper subtype)
> 
> We have almost a similar function in coresight-core.c :
> 
> coresight_find_output_type(pdata, type, subtype).
> 
> Please could we reuse that, instead of adding similar funcitons ?
> 
> Please be careful about the mutex.
> 

Thanks for the suggestion. I reviewed coresight_find_output_type, and I 
believe we can reuse it to retrieve the CTCU device.

Thanks,
Jie

> Suzuki
> 
>> +{
>> +    int i;
>> +    struct coresight_device *helper;
>> +
>> +    /* protect the connections */
>> +    mutex_lock(&coresight_mutex);
>> +    for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
>> +        helper = csdev->pdata->out_conns[i]->dest_dev;
>> +        if (!helper || !coresight_is_helper(helper))
>> +            continue;
>> +
>> +        if (helper->subtype.helper_subtype == subtype) {
>> +            mutex_unlock(&coresight_mutex);
>> +            return helper;
>> +        }
>> +    }
>> +    mutex_unlock(&coresight_mutex);
>> +
>> +    return NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(coresight_get_helper);
>> +
>>   /**
>>    * coresight_get_in_port: Find the input port number at @csdev where 
>> a @remote
>>    * device is connected to.
>> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/ 
>> hwtracing/coresight/coresight-priv.h
>> index cbf80b83e5ce..8e39a4dc7256 100644
>> --- a/drivers/hwtracing/coresight/coresight-priv.h
>> +++ b/drivers/hwtracing/coresight/coresight-priv.h
>> @@ -157,6 +157,8 @@ void coresight_path_assign_trace_id(struct 
>> coresight_path *path,
>>                      enum cs_mode mode);
>>   int coresight_get_in_port(struct coresight_device *csdev,
>>                 struct coresight_device *remote);
>> +struct coresight_device *coresight_get_helper(struct coresight_device 
>> *csdev,
>> +                          enum coresight_dev_subtype_helper subtype);
>>   #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
>>   int etm_readl_cp14(u32 off, unsigned int *val);
>>
> 


