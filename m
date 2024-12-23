Return-Path: <linux-arm-msm+bounces-43126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 313E49FADEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 12:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F40A188401A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2024 11:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF061A0B08;
	Mon, 23 Dec 2024 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n4XXPxTb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646A91A3A95
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 11:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734954825; cv=none; b=irxrFoXYPWeMVz253gtwy9s9XEXFfzrZjq1w1vEIgXAnCury6mSkRQGn/PiA7nllVknMhWBOgr6ecc9LmWZ/OL1+2pnezbARre0b8WzgKgzlgfZ90DQbkeRB4nbQe4Fkv5lfeYpWXZ7niZmMtvPQsReLvf5V4cGaQ1IeiwHcDLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734954825; c=relaxed/simple;
	bh=1ycumVNb8nk/epHANWIeKyCAD7iNPvQGYRpxxtnZL/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W7hBY/9kJFm0Yfb7kRee1TxbLO2/JMxcPrxkbgSiZaYCYBFtPpe54cWQik5IpJ4SxZAiwldFfCEht/GlfXS3G0mQ6MoIAJy6PMISTJyvWGshu+i8dNoSeJrnsfDWIcpuhifM4+D+uuO0D5fc2KMLL/uKnZlYtnJRMLrJ7BMeQLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n4XXPxTb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNBVdfS002805
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 11:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5VlwP00xboXyME99V7gzV/NXrPnL3LL4izNHIkbQDc=; b=n4XXPxTbLSPuj21w
	GhFZ9RQQ626VdBwh6a0OcDcXp0QXEojdBSHmsiRD2Fv2M5+vCLrp87lRS9eXvVW3
	5XL3USKiIuJgnPYdoYG5W1g+Tf5NFRdeuarsNNlyn86Ds3lJlrD2jD8k9yUATWXN
	G4nfuoszy8lOHRn78svAH6aUA5lPM7bfkpVvH4SAuH691aeivuSBAhSUJ7NlVTAE
	4vaJU6aT66VfLv+T7QjtFngW3TdHS2PibkYYWFIn4PQRyFq5rHopypOi1oG0S0oD
	L6iJLbad54CFoGdAI8lAuGBA4YYEWgL45lDLydqV0llHSA1waxx6AQBeBd4cJQ1T
	5aAEhQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43q72mr1by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 11:53:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d880eea0a1so15081796d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 03:53:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734954822; x=1735559622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5VlwP00xboXyME99V7gzV/NXrPnL3LL4izNHIkbQDc=;
        b=kqb+0V7A6CvXOOz4UTGdC/MqBAFE2n3LESBhbwDci3+MKQmTmFa2x4874t8G0ypGOd
         PxFyuzLmSeNceSiTajuyOmPSOBf8rpx1j7V1cSVaPczHD8+3tyGNdSxY/XNLSTET6tnF
         OdHNqyQZQcfyWL0gF6T8AM/M/Iz0d+7cbyC5qpfHINy502B25RyX7gysNkWg0DS1Fkzq
         HWmsmpHxAtMVv+9IlGoZEeGsEMbAu+eX8n8xwqlVpiHucOMhihc1EHPl15xLEgYYmrvP
         8NuP/l3tIXJblamTTpOmOststUDyGwxrpM6HSlXgXuDr0Nmn2XQhhNzDYNkKbfa19zLj
         YftA==
X-Gm-Message-State: AOJu0YyCT74y//d58wthXNfTa3/4i6TkARBxcNxaQWtNRxwruTdT7Frk
	stbnrxDkIwKa/Nf90Cxj27Q/4txWsnyee6L9XshpAtBh0ZwrInBR4NjJOGeeM4gN1+7fxB/Iqpe
	HsnHCzoYjzJjRBJdam60i/QROZ+s47LpcKWatxJNqyRFucYNW4GN8pyzlJKFZZT8o
X-Gm-Gg: ASbGncsI3dCXH3m8HduQdcMarGSusC5o6Xxz5YhvTd1AVJxoQ3FpOunHwp3ncfA043O
	OQQrhTmld1kL16DfegtWTjH5+rNwfLisT7d5Wm03HLNUCAh82XqQgcax714YcgBNlVmS0ud8BNR
	43zRUK5iwlKurqsE2gZC88sUtYhm6s0n3HuacdaUeh3mrPL4EZoLI5EgHofMJfjjUOUwkixiogq
	IzsSFMBU3urToYgFZ+TSkDH8utsos+j0wXvKIJ7RLwq98A/DwP5IjEI2PCt8CNcYc3znurWyioP
	ggqMegmusnyHpRooSQAABPqvJmT6JrKoCRE=
X-Received: by 2002:ad4:5b89:0:b0:6d8:8db8:43a8 with SMTP id 6a1803df08f44-6dd2339fa9dmr68175776d6.9.1734954822254;
        Mon, 23 Dec 2024 03:53:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpP//k2SXtcSanh+gJXloSY1crcdD0Pn9uWGltwmt/yy81KzcgGiu0Pg0OqhN4qqveMbLaxg==
X-Received: by 2002:ad4:5b89:0:b0:6d8:8db8:43a8 with SMTP id 6a1803df08f44-6dd2339fa9dmr68175706d6.9.1734954821881;
        Mon, 23 Dec 2024 03:53:41 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaede7ef3cfsm77239966b.77.2024.12.23.03.53.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 03:53:40 -0800 (PST)
Message-ID: <bb178e94-2044-40b9-bbcc-1f31b9d4e8e0@oss.qualcomm.com>
Date: Mon, 23 Dec 2024 12:53:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: qcom: ice: Prevent UFS probe deferral on ICE
 probe failure
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241203024005.391654-1-quic_yrangana@quicinc.com>
 <5255398f-cc9d-4f85-8433-d6a4183dc449@oss.qualcomm.com>
 <24b2ae5b-aaa5-4c50-b919-5296db6f2217@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <24b2ae5b-aaa5-4c50-b919-5296db6f2217@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o2bDGQlGSYZeUAD84FLUsg1k8dFqfHRL
X-Proofpoint-GUID: o2bDGQlGSYZeUAD84FLUsg1k8dFqfHRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412230107

On 23.12.2024 10:20 AM, Yuvaraj Ranganathan wrote:
> On 12/5/2024 10:54 PM, Konrad Dybcio wrote:
>> On 3.12.2024 3:40 AM, Yuvaraj Ranganathan wrote:
>>> When the ICE key programming interface is unavailable, the ice create
>>> function fails, causing the probe to set NULL as the driver data. As a 
>>> result, when the UFS driver reads the ICE driver data and encounters a 
>>> NULL, leading to the deferral of the UFS probe and preventing the device
>>> from booting to the shell.
>>>
>>> To address this issue, modify the behavior to return an "operation not
>>> supported" error when the ICE key programming interface is unavailable.
>>> Additionally, mark this error in a global variable. When the UFS driver
>>> attempts to read the ICE driver data, it will check for this error and
>>> return it, rather than deferring the probe.
>>>
>>> Signed-off-by: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
>>> ---
>>>  drivers/soc/qcom/ice.c | 11 +++++++++--
>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
>>> index 393d2d1d275f..160916cb8fb0 100644
>>> --- a/drivers/soc/qcom/ice.c
>>> +++ b/drivers/soc/qcom/ice.c
>>> @@ -41,6 +41,8 @@
>>>  #define qcom_ice_readl(engine, reg)	\
>>>  	readl((engine)->base + (reg))
>>>  
>>> +static bool qcom_ice_create_error;
>>
>> So you could drop this..
>>
>>> +
>>>  struct qcom_ice {
>>>  	struct device *dev;
>>>  	void __iomem *base;
>>> @@ -215,7 +217,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
>>>  
>>>  	if (!qcom_scm_ice_available()) {
>>>  		dev_warn(dev, "ICE SCM interface not found\n");
>>> -		return NULL;
>>> +		return ERR_PTR(-EOPNOTSUPP);
>>>  	}
>>>  
>>>  	engine = devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);
>>> @@ -303,6 +305,9 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
>>>  		return ERR_PTR(-EPROBE_DEFER);
>>>  	}
>>>  
>>> +	if (qcom_ice_create_error)
>>> +		return ERR_PTR(-EOPNOTSUPP);
>>> +
>>>  	ice = platform_get_drvdata(pdev);
>>>  	if (!ice) {
>>
>> ..and check for || IS_ERR(ice) here
>>
>> if I'm reading things right
>>
>> Konrad
> 
> In case of failure, platform_set_drvdata is not invoked and it is
> causing ice to become NULL on platform_get_drvdata.
> Adding IS_ERR(ice) can't help unless we set the platform_set_drvdata
> even on failure.

Which we should be able to do, given the platform device exists by
the time we get there.

An additional parameter to create() may be useful to make sure we're
not overwriting UFS's drvdata in the legacy fallback case

Konrad

