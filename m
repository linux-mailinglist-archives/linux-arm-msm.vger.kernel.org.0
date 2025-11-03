Return-Path: <linux-arm-msm+bounces-80077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C37C2B14C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 11:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 293433B4380
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 10:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51AE2FDC4E;
	Mon,  3 Nov 2025 10:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hUEkTrmw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jpJeNCdq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1152FC86C
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 10:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762166033; cv=none; b=pR0cDtkk95e287TLA04nyMNl9jFAVxr3l32Cuqj432Lb7wg78fK/FqZJqX6xRwMGK7zs8h8A78r4QbxS/+CDdIcTomiGWUYzMoAOCn6zztWekdyAHsd848ex7BDetKd0UTPJ4ktk3XO9zYMtVT5F4vEb3J6Kpz6dS+b0BXjw/M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762166033; c=relaxed/simple;
	bh=Hld3A20ypq7EfrSD1xxAy8u3Il974vGYXEhaVccKVbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LocXyedSRVQqNplUd3D4MoaoEXJq+7ubC47VxdaZLIvLm0/yBzn1yzT7EeKQVoQ4/yiIhyuRCwo1u5cXxgA4xF0njIi9k7UfzFZifWlS7abIW8sXR0rug1p00n4G4DY9gGpzyuq4zCPj68634uM0A6nb8xSvrpjlO1dmvj4QUGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hUEkTrmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jpJeNCdq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A36IgmB2247230
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 10:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rn1LUOBG2CbQbe/cqiBEL/Tz9s8YyLm1nNaeiZPfffg=; b=hUEkTrmwENBVDoHQ
	pO0Coo5l/1RMKfRpy1fMRc8Ms6HswuFzIXv/MOAIeR4GFj5p+YpQYGm8lI7iRWjd
	Ngdw14JMh5TpMWMClvp6flnUxdD0RsCa4/KiabBdgPHPjJgssLTCxMZ/jurDWrHE
	jRVO4aXIzaRuKalV1BNl//l/iMax683Y4aHdC9ZkIcfvqwHQCF7mhMVclmNW8tq+
	ijQ4lg7+P78Jg/RsdaiLpSbpFAN0kcVnRZQyt+V20amvEBgwBgnzGSkEl8qtjYLD
	zl7/wbIO2TE1Ymrd76Cw6ceJhVlAL7LsZ4jXaE6GYJiDYXAcsE4J4NqwOM9ghPrH
	C8a2bQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6q0ygtea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 10:33:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2956510d04cso17148225ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 02:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762166031; x=1762770831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rn1LUOBG2CbQbe/cqiBEL/Tz9s8YyLm1nNaeiZPfffg=;
        b=jpJeNCdqnaOIgeca2Se4ubNFY0s1hFVXvg3r/aSGPzEgS7hwEnWgI8qMq8F1jP3Wru
         2LJABikgfghCDEOrwn0tjetruKUiNIX1VOnnEs0lzI3IWvBmm/3EZlOZ3oX0rTYynsD0
         FMbL/Mk8/1wRL/5qmrbNOvhckRWG7aT8YUiYSKHpUJfVCC69GoVJFgdkcBU1pnIVHPxZ
         Ll+TBPNihiR21+kBV1h3zpndnvnWs1mcrZG4Yy5x+qVMWO41NCEzkIIjZCbnu4tb9KSE
         5BREKxSe3w1zXz8CxSqqeswrgnHGknO4cTiAumykImFRZv0KoRn5soiZTGVkE/DOfQDU
         9qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762166031; x=1762770831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rn1LUOBG2CbQbe/cqiBEL/Tz9s8YyLm1nNaeiZPfffg=;
        b=QBRw8ZXgfxXMC2W1vGm7VIczasR2FmWJeNGPlhQ9utACFC9Ut/f206uxEsqkc8mfkd
         4aL4SbDGcbKd/VaTtnRrWUSy/J4/88CetFq9OTLgKjv9UC56nqopk0ynUu+nN0vQD36r
         30ExAM/pgyd7ZDcNdeCB9pEfWLULM4J/LGO3taBK51kUnwVeTARUrB4Mf7hVH4LA1O6B
         yLj1lTYyZ3CDM5iUdn2Ild9JpYnncAphfM8a+ju8K8iKeTd4I3Yo9DKOHYkbQTkwyCgR
         OZ+5XeDMfbtOvixSw+W081Hp2P6OKMFduaYmuNXXJng47XMqQPh0C2BJy+VoNy0yoNLB
         bjNA==
X-Forwarded-Encrypted: i=1; AJvYcCWHOPMNNq2NJdCkPq40tVzYh2Xuiuw8iAEctSq6cBVRDFeK8/cg4LVqrzjukGKi+OmEje1JsQRZocq26III@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9rfYQA8AVvuf/km7zXKUmSCmd2Yi7R505RS8dgmbSGXcydeBA
	DpPAMVEdBjeSutHNDz7ytxSUblR0dQLEM0QNBfiBSDuzjEWFSPg/vdaF1kMR1zmWDL58CEau/oi
	r+XXF1hdLntbYakx5GIvbswtZkF9UAXsF1ORt+6t/Qsb2osLredF994nEKVbn7EteoYk0
X-Gm-Gg: ASbGncvyQlVlybyfyCp1cN4BrjAPZIPBYgQ5vG3O2bCwTSeeFTzwtoLhZYWuUZ98K+V
	dPwdRS4J4kXVZG0Bkeu1zQO/zKJ8iFzCYJqeQZ6QIbuW0vgiaz3bfD6/vw7eN42ueF1mWnPftu2
	dkG6+g9QfH4NscZIrNqovvZCN0E30FPwehSAz9laD2rjZGvtaVGbTm0VDmqPWkgIhbY504pJ1LJ
	g5d5Ss3rhZSDP/ktNVVg1e+8WEDt47PLKz2fSUp9sTQoSsp9i3/fGCyATOwaSkWmBCDIUh1Qc7H
	fe4yCf2IPZsjMZdUBH841YHXKe4U5k/xOO+LT8jNsZa3NPupn3b52gBLZGnwzaOvaTMh7o9VZfn
	ytcGBmPyXyrcsGF3zPSfHK66832XTmmtpYtTZLtDemK+aHEkV/Npjd2FugpYxE+Abjifk/IZ/Vu
	nb5pnttINaljfOG2bfX/RPqA==
X-Received: by 2002:a17:902:ec86:b0:295:b46f:a6c2 with SMTP id d9443c01a7336-295b46fa745mr32601175ad.37.1762166030480;
        Mon, 03 Nov 2025 02:33:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuzMJXftYovpjYt4udUUg3xGT7FWWThDT/vHq5zHRYdVP1AK/845Nocr0Dh94zZj1rYIPw4w==
X-Received: by 2002:a17:902:ec86:b0:295:b46f:a6c2 with SMTP id d9443c01a7336-295b46fa745mr32600815ad.37.1762166029930;
        Mon, 03 Nov 2025 02:33:49 -0800 (PST)
Received: from [10.190.211.199] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341599676d6sm589527a91.9.2025.11.03.02.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 02:33:49 -0800 (PST)
Message-ID: <40a6395e-26f6-4bad-88af-d89479b6fc28@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 16:03:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Neil Armstrong
 <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
 <nnq34bfbbi3satxiqzaouy5pgi3obyqp76avh2ipyqxx6w67td@e7eqehjq7iww>
Content-Language: en-US
From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
In-Reply-To: <nnq34bfbbi3satxiqzaouy5pgi3obyqp76avh2ipyqxx6w67td@e7eqehjq7iww>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NYbrFmD4 c=1 sm=1 tr=0 ts=6908850f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Oglo4aDHNYH22b3EH6wA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: axTUJfo_wtFNW8sTLy-cgdTQFS1tDHzO
X-Proofpoint-ORIG-GUID: axTUJfo_wtFNW8sTLy-cgdTQFS1tDHzO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA5NiBTYWx0ZWRfXzc8EbuKfu/cc
 h2TlBL0ZebZD4DqVjIqflD3WqwCSC8dPbgbf/9AGH+32HfGYVANGH4v/ulf78w/nA0yqvd/M5TH
 O9kEBesnC0Xw0D+/NW9uZ1aITekuSaz8scMoBMP0T6aJgHrMBNUg++KDaRo8py1F/xC9Yb9+p9M
 7nyqyZef6D9D6SpyvOtFUhO3NgBctXAWhg/6P9oAhziHk8tNbJVYVGDRIv0R3uWhwXYIc+uqB6Q
 ULqNBc+Hm1OJSCK/9pxLnCoWfZIDTykMWC9wq8CS7SFp3cAOQYxZPR8YxfGpV5/Sk3KGwlUTnAh
 ChpbkmY9xIZ5y1TgUvCO7PEtCHSqj7Z6OOUGIsYdkQsevPG8AzGBG5c4y3ueZ3spxo78OIqUh2h
 8SHMVIbpVjyX6+bq1N1VKoylTrjbbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030096


On 11/2/2025 12:15 AM, Bjorn Andersson wrote:
> On Fri, Oct 31, 2025 at 10:18:13AM +0000, Hrishabh Rajput via B4 Relay wrote:
>> From: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>>
>> To restrict gunyah watchdog initialization to Qualcomm platforms,
>> register the watchdog device in the SMEM driver.
>>
>> When Gunyah is not present or Gunyah emulates MMIO-based
>> watchdog, we expect Qualcomm watchdog or ARM SBSA watchdog device to be
>> present in the devicetree. If none of these device nodes are detected,
>> we register the SMC-based Gunyah watchdog device.
>>
>> Signed-off-by: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>
>> ---
>>   drivers/soc/qcom/smem.c | 37 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
>> index cf425930539e..40e4749fab02 100644
>> --- a/drivers/soc/qcom/smem.c
>> +++ b/drivers/soc/qcom/smem.c
>> @@ -1118,6 +1118,34 @@ static int qcom_smem_resolve_mem(struct qcom_smem *smem, const char *name,
>>   	return 0;
>>   }
>>   
>> +static int register_gunyah_wdt_device(void)
>> +{
>> +	struct platform_device *gunyah_wdt_dev;
>> +	struct device_node *np;
>> +
>> +	/*
>> +	 * When Gunyah is not present or Gunyah is emulating a memory-mapped
>> +	 * watchdog, either of Qualcomm watchdog or ARM SBSA watchdog will be
>> +	 * present. Skip initialization of SMC-based Gunyah watchdog if that is
>> +	 * the case.
> E.g. qcom-apq8064.dtsi doesn't define either qcom,kpss-wdt, nor
> arm,sbsa-gwdt, does that imply that it implements the Gunyah watchdog?


It doesn't implement Gunyah watchdog. For platforms like these we've 
kept a STATUS SMC call in the gunyah_wdt_probe().

The SMC Call is expected to fail on platforms which do not have support 
for SMC based Gunyah watchdog, which in turn will fail the probe.

Let us know if there's a better way to handle this.

>> +	 */
>> +	np = of_find_compatible_node(NULL, NULL, "qcom,kpss-wdt");
>> +	if (np) {
>> +		of_node_put(np);
>> +		return 0;
>> +	}
>> +
>> +	np = of_find_compatible_node(NULL, NULL, "arm,sbsa-gwdt");
>> +	if (np) {
>> +		of_node_put(np);
>> +		return 0;
>> +	}
>> +
>> +	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
>> +							 NULL, 0);
>> +	return PTR_ERR_OR_ZERO(gunyah_wdt_dev);
>> +}
>> +
>>   static int qcom_smem_probe(struct platform_device *pdev)
>>   {
>>   	struct smem_header *header;
>> @@ -1236,11 +1264,20 @@ static int qcom_smem_probe(struct platform_device *pdev)
>>   	if (IS_ERR(smem->socinfo))
>>   		dev_dbg(&pdev->dev, "failed to register socinfo device\n");
>>   
>> +	ret = register_gunyah_wdt_device();
>> +	if (ret)
>> +		dev_dbg(&pdev->dev, "failed to register watchdog device\n");
>> +
>>   	return 0;
>>   }
>>   
>>   static void qcom_smem_remove(struct platform_device *pdev)
>>   {
>> +	/*
>> +	 * Gunyah watchdog is intended to be a persistent module. Hence, the
>> +	 * watchdog device is not unregistered.
>> +	 */
> Why? I don't see why the code needs to encode such policy, please
> explain.


You're right, there is no such need. We're at wrong here. We had an 
incorrect understanding of watchdog drivers being persistent. We will be 
implementing the module_exit() for the Gunyah watchdog making it not 
persistent.


Thanks,

Hrishabh


