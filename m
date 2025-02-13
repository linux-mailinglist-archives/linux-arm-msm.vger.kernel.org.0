Return-Path: <linux-arm-msm+bounces-47907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9461A34946
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 17:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 976B33A9AF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 16:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A88D1DE4C1;
	Thu, 13 Feb 2025 16:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkCVqolH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7481E766F
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 16:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462795; cv=none; b=u1XJ9sQMHTSFvTGgf65AZcFvFvBov2K116x1oJay28WBthLz+bVe92zsIDcBhagG2dpAmbrS7rWWUvIrJ2hMeIc801URcUB6F1u/ZUfcwc59HrSKUSyzkh89UWAAC6hP3d7oSvGwIOlNI5qQY99WSSb8LFuQKy5ZO1MmXa8QidI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462795; c=relaxed/simple;
	bh=KV2aEWLH2R/7cx6mRKbYbSOD5vnG/4sMS3Ly1eh+Ego=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ix7VfTOs89EiqbAzvNwks953WrzLNPr064rGKZN5Bld0VEhSZzjlu+JVah0LH53niva1eQ1QTBzc9p8O03dUqeQDK+iKJsLH2Oowl+zEJUyHC+Y/iGVajtwUX7jccBn803CUwXazIyx7QNQb6zsozGj8640mNy5H2G3KMiHo+Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkCVqolH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D7Ds68012187
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 16:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VvHTiRUGdcHb5nqZ7XMr7+ruBS1SNJejca7slWkyh80=; b=MkCVqolHd7LKp6Q8
	OdSDa/PFar4rFnwNagNmhSsZ544DLKvwfZvQwr/wHW6z9GAtTdfEeCGlrixQUYQO
	ilyJuyZTTcARd2mLFvTJ6g1TmmyRWpxix2dJJn3jfIo2y8Dw5wHGC3ky6j84TwCX
	mkgy2jsMPO0dxZIR9cyCN6t/tbsQbQY5o4GZN1YuKEYdWNW/Hrnpdhsmo43Kcum1
	zrbQRRJZZs/REAUOLPGMd8IuyisnL4m0+K9aTkJBMUXeQkuUIAxGX2kIt1SFePRH
	hGKJuaO/ZScQOBmh4eZCVYY1bhN19ouwxHkW19cEFvn7JdD5egxTLi/uwHKESYyG
	2dovrA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sc5u9d1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 16:06:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-471cafec353so635671cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 08:06:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739462790; x=1740067590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VvHTiRUGdcHb5nqZ7XMr7+ruBS1SNJejca7slWkyh80=;
        b=D5PmP/TkL4btrC9m6FEstpIfSHBXm7vNylocwqZBU9EyGlzpol7rHI6vfhevmlJFVs
         IjOStjm+nykpg5H8QCyebLOUJLYpn+rCPbLB60BXfRysWsR9m9CVP3jkRykF7RUrf+84
         w8K/tApilNS6re26jnd192PC0F/SXeofngopoFZaNv2hj7RSYf6rjSoORuwrnPPefume
         1Yza/s5EYkirOvPpdd21coNEkm7q5RVQ3+0FxXNc6gNLp9Lgde6LEgw2gDCq6u1MoI5P
         oa0hnJ0i7mScMwI3gG+tcXDLk2Si5zHn0WPXbl78BmALljN8lHsWXsK2VsnAMlAVL/pl
         hNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0UgUCBqoj8LRwhGJ/gPqiNP5OFlpkYkcuKwjW13F02VoHMcWodWGzeV1OTQRQ6Uhtv5GjL0l4pKlDLsiq@vger.kernel.org
X-Gm-Message-State: AOJu0YwDVIegGGrLlDSPHOg6ddBBSf4ssp4ptwck/VLmpV+DD4n1jEt0
	fjHqeCfJY7EU5kjzIg5i2HmVrZceEki85ML/kINMeY47SF+woqD/dozk/avcz02Edn6zu3gzTPt
	JIO3BMW+vID77g7KHCh8iHuEpurVet0f8Xtrbhz119vjnJRVgkxnT5QpdrzK85YUN
X-Gm-Gg: ASbGncvuHp9kTiRF/n3HXR7feEH5GgSZRxC5uJEoBlCbAA+bJDF03JZEuyZ6logiPFC
	c6SLszpf/gcVj0fjOVUoe7gNeBPwSZ440XufEsBYIjVwRj0dH44a4uO8QG6DUgOwcezYSHfIdkq
	ha7octcOg3VyV0EqbiE3HiZPczGS7AEey0pxObIMv0GIp16BBCFeViU3aJoTLcFYJiFYp16/nb/
	u2lvE7Dt1dAQCw06MmFF/+PVv6RKEMf0gJHGzgyzUWEvB6qQt8KbVOLEsFu1zIQ0+9nB2rK0NG1
	k5NnMPBt8pqQsgny8p++sVb9fSG4qjCBm9y1bsvii9sVixXv/KD1w59S0rA=
X-Received: by 2002:ac8:59cd:0:b0:467:6283:3c99 with SMTP id d75a77b69052e-471afe447e5mr41969451cf.4.1739462790105;
        Thu, 13 Feb 2025 08:06:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGb1zpiJ7/1vpWuWkMOIVM1WBTQ2n0pQfryZ0ZNgISaCgGMemx6vczCYX77koJMMdKAblp4Tw==
X-Received: by 2002:ac8:59cd:0:b0:467:6283:3c99 with SMTP id d75a77b69052e-471afe447e5mr41969181cf.4.1739462789646;
        Thu, 13 Feb 2025 08:06:29 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1d3619sm1384641a12.36.2025.02.13.08.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 08:06:28 -0800 (PST)
Message-ID: <7f0bb7ce-92ee-4b22-8692-a851adf756a4@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 17:06:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] dt-bindings: dma: qcom: bam-dma: Add missing required
 properties
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Md Sadre Alam
 <quic_mdalam@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
References: <20250212-bam-dma-fixes-v1-0-f560889e65d8@linaro.org>
 <20250212-bam-dma-fixes-v1-7-f560889e65d8@linaro.org>
 <22ce4c8d-1f3b-42c9-b588-b7d74812f7b0@oss.qualcomm.com>
 <Z6231bBqNhA2M4Ap@linaro.org>
 <d674d626-e6a3-4683-8f45-81b09200849f@oss.qualcomm.com>
 <Z64OKcj9Ns1NkUea@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z64OKcj9Ns1NkUea@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FNw77ExqACUGNufGac0WSFTBbN2G1_TP
X-Proofpoint-ORIG-GUID: FNw77ExqACUGNufGac0WSFTBbN2G1_TP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502130117

On 13.02.2025 4:22 PM, Stephan Gerhold wrote:
> On Thu, Feb 13, 2025 at 03:00:00PM +0100, Konrad Dybcio wrote:
>> On 13.02.2025 10:13 AM, Stephan Gerhold wrote:
>>> On Wed, Feb 12, 2025 at 10:01:59PM +0100, Konrad Dybcio wrote:
>>>> On 12.02.2025 6:03 PM, Stephan Gerhold wrote:
>>>>> num-channels and qcom,num-ees are required when there are no clocks
>>>>> specified in the device tree, because we have no reliable way to read them
>>>>> from the hardware registers if we cannot ensure the BAM hardware is up when
>>>>> the device is being probed.
>>>>>
>>>>> This has often been forgotten when adding new SoC device trees, so make
>>>>> this clear by describing this requirement in the schema.
>>>>>
>>>>> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
>>>>> index 3ad0d9b1fbc5e4f83dd316d1ad79773c288748ba..5f7e7763615578717651014cfd52745ea2132115 100644
>>>>> --- a/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
>>>>> +++ b/Documentation/devicetree/bindings/dma/qcom,bam-dma.yaml
>>>>> @@ -90,8 +90,12 @@ required:
>>>>>  anyOf:
>>>>>    - required:
>>>>>        - qcom,powered-remotely
>>>>> +      - num-channels
>>>>> +      - qcom,num-ees
>>>>>    - required:
>>>>>        - qcom,controlled-remotely
>>>>> +      - num-channels
>>>>> +      - qcom,num-ees
>>>>
>>>> I think I'd rather see these deprecated and add the clock everywhere..
>>>> Do we know which one we need to add on newer platforms? Or maybe it's
>>>> been transformed into an icc path?
>>>
>>> This isn't feasible, there are too many different setups. Also often the
>>> BAM power management is tightly integrated into the consumer interface.
>>> To give a short excerpt (I'm sure there are even more obscure uses):
>>>
>>>  - BLSP BAM (UART, I2C, SPI on older SoCs):
>>>     1. Enable GCC_BLSP_AHB_CLK
>>>     -> This is what the bam_dma driver supports currently.
>>>
>>>  - Crypto BAM: Either
>>>     OR 1. Vote for single RPM clock
>>>     OR 1. Enable 3 separate clocks (CE, CE_AHB, CE_AXI)
>>>     OR 1. Vote dummy bandwidth for interconnect
>>>
>>>  - BAM DMUX (WWAN on older SoCs):
>>>     1. Start modem firmware
>>>     2. Wait for BAM DMUX service to be up
>>>     3. Vote for power up via the BAM-DMUX-specific SMEM state
>>>     4. Hope the firmware agrees and brings up the BAM
>>>
>>>  - SLIMbus BAM (audio on some SoCs):
>>>     1. Start ADSP firmware
>>>     2. Wait for QMI SLIMBUS service to be up via QRTR
>>>     3. Vote for power up via SLIMbus-specific QMI messages
>>>     4. Hope the firmware agrees and brings up the BAM
>>>
>>> Especially for the last two, we can't implement support for those
>>> consumer-specific interfaces in the BAM driver. Implementing support for
>>> the 3 variants of the Crypto BAM would be possible, but it's honestly
>>> the least interesting use case of all these. It's not really clear why
>>> we are bothing with the crypto engine on newer SoCs at all, see e.g. [1].
>>>
>>> [1]: https://lore.kernel.org/linux-arm-msm/20250118080604.GA721573@sol.localdomain/
>>>
>>>> Reading back things from this piece of HW only to add it to DT to avoid
>>>> reading it later is a really messy solution.
>>>
>>> In retrospect, it could have been cleaner to avoid describing the BAM as
>>> device node independent of the consumer. We wouldn't have this problem
>>> if the BAM driver would only probe when the consumer is already ready.
>>>
>>> But I think specifying num-channels in the device tree is the cleanest
>>> way out of this mess. I have a second patch series ready that drops
>>> qcom,num-ees and validates the num-channels once it's safe reading from
>>> the BAM registers. That way, you just need one boot test to ensure the
>>> device tree description is really correct.
>>
>> Thanks for the detailed explanation!
>>
>> Do you think it could maybe make sense to expose a clock/power-domain
>> from the modem/adsp rproc and feed it to the DMUX / SLIM instances when
>> an appropriate ping arrives? This way we'd also defer probing the drivers
>> until the device is actually accessible.
>>
> 
> Maybe, but that would result in a cyclic dependency between the DMA
> provider and consumer. E.g.
> 
> 	bam_dmux_dma: dma-controller@ {
> 		#dma-cells = <1>;
> 		power-domains = <&bam_dmux>;
> 	};
> 
> 	remoteproc@ {
> 		/* ... */
> 
> 		bam_dmux: bam-dmux {
> 			dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
> 			dma-names = "tx", "rx";
> 		};
> 	};
> 
> fw_devlink will likely get confused by that.
> 
> At the end my thought process here is the following:
> 
>  1. BAM-DMA is a legacy block at this point, it doesn't look like there
>     are any new use cases being added on new SoCs
>  2. We need to preserve compatibility with the old bindings anyway
>  3. I trimmed it down to having to specify just "num-channels"
>  4. Everything else is read from the hardware registers, and
>     num-channels gets validated when the first DMA channel is requested
> 
> I think it's the best we can do here at this point.

Alright, let's go this route then.

Konrad

