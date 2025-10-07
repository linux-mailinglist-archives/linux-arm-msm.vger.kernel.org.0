Return-Path: <linux-arm-msm+bounces-76199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5553CBC13F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 13:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E6BB189D620
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 11:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BD1C2DAFD5;
	Tue,  7 Oct 2025 11:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HEJZ7KTG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586462D9EE4
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759837345; cv=none; b=GEO6L8uTHt2Y57RYIoGr4Bbp/jeda3yMPoS3eIbEzKbQ5v6TxJLeDakoRI4n3sb+G92FbWa7Kf5uFdyi78P40GEgluP3unGvgmYIw3EYYmQZS0ZCNGeMhwNNaC3YJqG1OFtmlWi/G+cN3lD1MAxwdw0xD5yZtZol31RdtPfPOgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759837345; c=relaxed/simple;
	bh=v0istXODWIHL1ltiHYtAZ8N5d97LsN0HcUB5gpH3dT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aG2Vk3CxQfJU0TvzWvN6m+HTtdzwULw98/sdMDXb9zchxIjZeYLwGtloGUMEiYOBYFhEhXXqdlq24CM5KiwKVntMmnTAJ5YwAU8DQ81UHIJG0Ev6ofjOTAOgxfAbMHQZqvJSNd2p9UKciNbQop3ikie309OxEVn4KI35NnI+x3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HEJZ7KTG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5977d0EZ018046
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 11:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQGXZvj+fHOBfHt2M7ZMsptXc4V1NWsTLPFuu0fCYV4=; b=HEJZ7KTGYM02TND8
	zMyYndX8ElSYmYg2eI1B6ARKpshVPejHauwn59rDm825JkFKqVrjy4rQC6S6pbER
	nPtBDdVhUhVUOomfFaQsaU+VVvSIMLXWFUFPxMKw+TiigzTqeina2fgfCzAfixoq
	qF/RRHGVofaf1SK51BnkRi22q4NARM1EgvuLgcK+YkjlD6drPgIxAZr1IRXfDVLs
	n3nw8cOgnv0BVHm6j0aOFub3cN5rFoRKfXPCU+DSYK3t0QklcYGnyAhwuYSaXiFY
	b1DzFXnZu4RKDcCnEPMNuzcJPPkP3MDb9AfNvnFIbHtLnSLTsDRlu7C7qfO32fOL
	OLr+ug==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mnkpswkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 11:42:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7abea94d621so14414656d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 04:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759837340; x=1760442140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQGXZvj+fHOBfHt2M7ZMsptXc4V1NWsTLPFuu0fCYV4=;
        b=w/UfQHhJAYt5ufPm4+Hw2TcuEi6D7HnxqnuiBslcnGW35p1C+NNEbPn0WriGezuhEF
         RCY5FXCDLm5LPkFEm8fcxXIMR5VYEt/fIrF8zt5AoT8mAwqSsWacGxZk8ABBDRiyUCj2
         oNC+tBrtkXrMIZs1akZWvpA17bcEqUI8eDHqeULN934ad833DKT8zo0HWcYgSxU07qQo
         qUaZrTBMGnA6nJrwTflD4gFeg+tWFfxfkbdp9QzeQn/77lP/KLHVxC/6e6wdulMcp4AX
         npko4P8beRdKuh5Rg7Hf1XSiYEffLkgpKkObG1CAiJzv6HWM9dj7gXHz6FTot57s2Fwz
         +EVA==
X-Forwarded-Encrypted: i=1; AJvYcCXQWxA1ELtuZhWR7BjWn0aEED67gJfvYFa+k9TwLjgVy1w8U+w/MNPYNIrfjn5mSXGd/prn65QKWyHrUY6y@vger.kernel.org
X-Gm-Message-State: AOJu0YwA4VqxhmqecFFr14LMs9ZvJskO6AeydRJ2sDqLHlNUAMsMhlnr
	AwKV0AbMDkABPK6RCPqMMiItZ6Of3mHygB8DiTCVurbgW0D+/NFQaHYHAP/F2OmOruDaYq2v49a
	h+dnSjojWsO2AdJxKciu7P2FiIV/23kVLZLCaAL8wJ/jt9YsYGO0ISAPdkCFxcxAYimzz
X-Gm-Gg: ASbGncs6BRcbrEXSjY+tcP4aAyawssbPTgazB+gKs+rQzsFf3mgcNuwGzxUmApfoFHw
	zPpqSCSn7XT20LoI8NmiUmLDs4wn7kzHzYUu5hGmUjBStSgSlB9UMf3hyXi6mkjkrNBJkVz9ZyR
	c9PhsMCqPQxACwW1cVsZqSWmsoS6zo/FZaWu3CQ9PtFPtnUUlB2hAPan/t3q84y8xHLmfEimG21
	4YVK/6fMsziAprJkxuES2UE8j745FmcKmJUhe8NEQUIpMJK+w41yVpUNUllgYR0Yd9jEtosb18H
	RS/S1WX4Phxj9GFetrHAJyepD1RUmVlKiQaCmbsmhYW6/NZjtgKEuw3GW6tPrTstbiBrraX9Lmb
	7l0FhREy/53cD1TXCm2Xt3mWK0lA=
X-Received: by 2002:ad4:5d4d:0:b0:81f:3abf:dc1f with SMTP id 6a1803df08f44-879dc8e8b5amr134636776d6.8.1759837340062;
        Tue, 07 Oct 2025 04:42:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPO0pc61D7PrUDHek89IoEYYlLKOAWdzRK3cyRnVKS0r8C4VHw9zr6UpiSxFXAKmAVKcrTbg==
X-Received: by 2002:ad4:5d4d:0:b0:81f:3abf:dc1f with SMTP id 6a1803df08f44-879dc8e8b5amr134636436d6.8.1759837339372;
        Tue, 07 Oct 2025 04:42:19 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6397c9355c3sm5880830a12.0.2025.10.07.04.42.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 04:42:17 -0700 (PDT)
Message-ID: <1d052b98-4dfd-4ee3-b46f-ac043b406d58@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 13:42:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: mmc: Add dll-hsr-list for HS400 and
 HS200 modes
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>,
        Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
        quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
        kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
References: <20250929113515.26752-1-quic_rampraka@quicinc.com>
 <20250929113515.26752-2-quic_rampraka@quicinc.com>
 <20251006214830.GB625548-robh@kernel.org>
 <817f02aa-dfb8-a134-2fd4-fbdf8e8a714e@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <817f02aa-dfb8-a134-2fd4-fbdf8e8a714e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IZClZNJXPdAKjH-U_GxvuGfO2uBA9qhh
X-Proofpoint-ORIG-GUID: IZClZNJXPdAKjH-U_GxvuGfO2uBA9qhh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDE2OCBTYWx0ZWRfX4udLIYwCWxlE
 TsvfOdHVDXMxJiUoJY8471l/u9TYHhbnZ7AwiLLbZvf7ljqhSV7y/Mr4DUd53T4umuKLMluW1Qp
 akfAamR92sTH0GCrmjVbb9D0y92TFjtHdIeWB4JIwe3gfGZ6d++/B9jR011FvQzW8PBqaouDzqV
 YTS3YceSaI7cfhkkXAQwvRfzngvveZWwvq5Do5pOJchCr+n7T5Wnjranq19j6ucmTXkQKv4Qoj3
 9g+YVJL7VFiqpc4qAJtZKtw8D8j4UxycgmiSW6PExIrnoXGeTBlolA8y1A+RWooNzuu/JSFNr4t
 f5QGj28xPHoj+jzlGYq6wqSwyRBpKHizQAW9lYGZ+ZZr4VHxHgIvL7Wgev5gVz7n8HYjxHBP3Cc
 B0kMQeACe/nFTtX/eoZvq6aqJApkIA==
X-Authority-Analysis: v=2.4 cv=BuCQAIX5 c=1 sm=1 tr=0 ts=68e4fc9d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=Nkk5IEO714fOIWWTyTAA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060168

On 10/7/25 1:16 PM, Ram Prakash Gupta wrote:
> 
> On 10/7/2025 3:18 AM, Rob Herring wrote:
>> On Mon, Sep 29, 2025 at 05:05:12PM +0530, Ram Prakash Gupta wrote:
>>> From: Sachin Gupta <quic_sachgupt@quicinc.com>
>>>
>>> Document the 'dll-hsr-list' property for MMC device tree bindings.
>>> The 'dll-hsr-list' property defines the DLL configurations for HS400
>>> and HS200 modes.
>>>
>>> QC SoCs can have 0 to 4 SDHCI instances, and each one may need
>>> different tuning.
>>>
>>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>>> ---
>>>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
>>>  1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>> index 22d1f50c3fd1..a60222473990 100644
>>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>> @@ -137,6 +137,11 @@ properties:
>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>      description: platform specific settings for DLL_CONFIG reg.
>>>  
>>> +  qcom,dll-hsr-list:
>> '-list' doesn't add anything.
> 
> list was used as there are 5 dll register, but '-list' can be
> dropped, and it can be renamed to qcom,dll-hsr, I will update in
> next patchset.
> 
>>
>> What is 'hsr'?
> 
> Hardware Settings Reference

Maybe "qcom,dll-presets" would be more clear?

Konrad

