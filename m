Return-Path: <linux-arm-msm+bounces-83523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3047AC8CEAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 07:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 61F834E31FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 06:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA753112AD;
	Thu, 27 Nov 2025 06:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NoS+ifXH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jagbbY4M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37894A0C
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 06:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764224791; cv=none; b=mfVoGzLX4DWWCEUL5K8i9M9KOvRuuhcBtVBsXePvCw5QlXDS4e3L3hz1ntVuxkFk8KDz7g4PdvZiy0B7gt46LI0E/pvsnIuFEHUl3UhKSrzZ8cYKN9Wm/Stf8fhUiNJmlvcoz2DkCbNUqeDz+gKc6TbpLwoj2vhtNOKGAXkQY9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764224791; c=relaxed/simple;
	bh=QZfRN5EL7HcjaNcqCfhqBeD4PYZh7aTpR3OI6puE9gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eDrkvpl7jBJz3jiDkb+OZoqknI9rWYXd0C3Cr7bbScs3CKhXI5qfVxfwEFCphZigM7gHYfWQ2GzM1ESYRR4wloM5YMVrcvqd+EQ297R4ZUCb8UlRCd89bZDsqSVXdXhOK9YjNwiZ2AwIICxqKXJO1mNSxWSlGMdpKuACwQ35U5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NoS+ifXH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jagbbY4M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR3kGam1457048
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 06:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QZfRN5EL7HcjaNcqCfhqBeD4PYZh7aTpR3OI6puE9gU=; b=NoS+ifXHSqZK+kzG
	dKKbcqJlt6wgMK5g4RzGe9KeLPpX63bLkeRYNLXAnse/1RfDYdYN26qgmgRLoHKz
	aHV6yZaDmchLdAFStAq470l72lTnXPnAieuvVMytqKgBuGA5gfHK3LucZqLtjQZq
	d16nEknY3hxn5/U4WGijVdiT2zjc6I3Iowp2+XQ0f+zTZfhaWErn5E1cAHWTHq0x
	eBghblPi+svfDSU335QahmaUSAL65XCTlqw5ZijBe/CdUjcFCgxlUmj0b7NtHhLA
	qS9wDWKQLSzv2X6kTpSjQw+wC3ZNM9Cl6jOeLg2DZPRrk4Vuhg/kNsb1orficqHO
	al3ylg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvked3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 06:26:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7ba9c366057so1462873b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 22:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764224786; x=1764829586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZfRN5EL7HcjaNcqCfhqBeD4PYZh7aTpR3OI6puE9gU=;
        b=jagbbY4MlHbaKUafBhy3nplrnBoMMyhqY+AqZwuDfS8p6n5O7FvGUNxhTP4PxTAgh7
         u2wQUj4jr4ST87NIhwMHS6ieAH8QyHq0HzTHtR0A/JsVduNMZgbfeftVqi9OJXXxVBl3
         WEdybYYu0iITI+ml/2xxolwVkdgw6xUMc0VUQTbTKAzS45RR4kRPEWmyxOh0/5eSQ99O
         2IafONQnVsHJ3sDtm1rKXbIyb0aOz086Z0EE0OXA2SUx0/VauUqRRUKw2NPNKMsLsCSJ
         8bnfSKHjLk8HEJj2gkij7CuUwU+mmb/PithXB8QMFKB+sJ48fomdLK51BUuwYOuNRbTO
         85dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764224786; x=1764829586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZfRN5EL7HcjaNcqCfhqBeD4PYZh7aTpR3OI6puE9gU=;
        b=iCc21JTXTpCjt4TyqrLIendopS00wfbH8/iv0C2NcMczS9ECc/5dx02WkgEVxKtehM
         m2gmggqg90WMUVNZCUAQMOx6WI2aDEg+JGnT19Z/r4ock7Ti6einP7jTtc1s672GLsVi
         /rwUa+1oiLNZXd07B3XBF7btNAxSGv9m+x3wkEbeRaUApMfjzWjutvX0aCXqYxdKy719
         q/S2HtjcVmtLwCD5eqCo25NT0tnCqG1sSsuu5482Ag3MIWxKDEQXEmdSqEgC6Ir7d3r3
         wj3PjUsHoBys73fLMGxaZT7g1s926Lm7tx2Cwe8zlXDmFdITaNX593MfnAH7j6SwWjBI
         ZZiw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ5XPeXXIWxgqvoxFh59ukpIxUM6OABGNHirCqjsIfiUtyu3v2tIfvh9mYjzwavWv6HLJ5nB8YHxf/bijG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/NMrqGGQuvViMnmRLzV/yequbQhNSPpRgQWiO3GyAk66+3B67
	fC+clram/h+ujbQ0iVAEmqIpi1ponCIgko1y2ciak1TP75DedcQG3Iz5MpjYPVX9MmTeHghmOQ/
	+mE4SXfBP0GzNlAlEAx54cIaM2X6wUPJp3/rRrI2yS51wA2bKm9YBdF51GMwfy8iXdBjY
X-Gm-Gg: ASbGnctbRVsLSpNxmFNtuWhujkimsjjr0c0pxYyhqOmQfKRPmi0lezS2ykgdYCdm7UJ
	N5nxaTgUMdD/LgQzFzJE5D7mZB6OQI1Z0/wKgD2puCqdk7zQuaQZ6Ptb6/A0D94k+2ivQEuBwBb
	1Zu4JgE87clZ6xF9Gt4hb0K25jg948W9HydqlDlY/KHU2n/0X5C6NSqyDK0a6fOTkNx9c0tcbqf
	WP+Far2ISn3FGeqiHl3htNjRiGNGX9uDHZHsZ717MQyMi0d2d6370boK9gEsh4C9/6JgtBX45Ks
	1uxzdaKycHfEm7Ii8Fjiv7LmIJQJaMejxL+ulXslvVyVrw1F/0O9dNrRA2s6R+/QB2MpOEInQRV
	UHwILZAcJX/q9Vhsm8yKWzKgTi47X76eRM/LIlrKp
X-Received: by 2002:a05:6a20:19a2:b0:33f:df99:11d6 with SMTP id adf61e73a8af0-3637db29755mr8355491637.10.1764224786327;
        Wed, 26 Nov 2025 22:26:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2U8pgYyv6GZs6z45zcClYAJnelJyY70thdkG1EnwouwQ2XTtUci8EGM2vHF32igx/AajgEA==
X-Received: by 2002:a05:6a20:19a2:b0:33f:df99:11d6 with SMTP id adf61e73a8af0-3637db29755mr8355460637.10.1764224785788;
        Wed, 26 Nov 2025 22:26:25 -0800 (PST)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be4fbb0094dsm778971a12.10.2025.11.26.22.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 22:26:25 -0800 (PST)
Message-ID: <bd19c2c7-7daa-4f19-b75b-d7de40113f8c@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 11:56:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
To: Nickolay Goppen <setotau@mainlining.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>
References: <a3cb6633-1595-41e7-8e87-ca48a98f822c@mainlining.org>
 <83c3aea5-764e-4e60-8b16-67b474f19357@oss.qualcomm.com>
 <d17548bb-ddce-4d60-8dc4-2c0633989299@oss.qualcomm.com>
 <f5c7eb1c-28b1-4cf1-afb0-b993384b7712@oss.qualcomm.com>
 <80836b8f-16a8-4520-ad11-5ca0abb3403e@oss.qualcomm.com>
 <99c22e73-797c-4a30-92ba-bc3bd8cf70f0@oss.qualcomm.com>
 <eddc16cb-d951-401c-8fb8-fccfcf600143@mainlining.org>
 <0b06f744-b695-43d9-8da3-4424e2b53a5e@oss.qualcomm.com>
 <24221ce7-24e4-4eaa-8681-ed9b4b9f2d6e@oss.qualcomm.com>
 <be4e2715-882d-4358-8575-374187f7ee2f@oss.qualcomm.com>
 <2h222ejvc37cldeno7e4qom5tnvdblqn2zypuquvadbcu7d3pr@765qomrwfvwl>
 <515191cf-a8b8-4487-989b-4c1736a67b2c@mainlining.org>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <515191cf-a8b8-4487-989b-4c1736a67b2c@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA0OCBTYWx0ZWRfXzO/mB/kNs6M7
 g6Sy6qGG6RQ3TriKP/MGaYNZ+mSy7256iwBLu0ST7VpQ0C3uEaZr8RsQiFMcAcCUAIeJvBoaWXT
 JgUf5ckej3S9BfxcnATVqxL3cbPFSwdXH2d6FwQDc2/Xa5QqA5ut2jaZlzbhDygfGi3XefvViOO
 KHShppd8rbzNoqfSz2e9vvYHI5dzzB6cVAq5G5mf5AbmhjEzeeLyhnCHSFqUrjMYYZT+lNgsK+K
 PpKeNEQEcZXO1lsGMr0IMjwYk3SKvl1eMM3bUtV9M8hJxWSHy3cDr9RW73Gql8gDqyEqID13PW+
 oXvWeVTYbi5lCkbDsoQYq5cbZxc5Xmogs2bV+3AkyMlQI8wTQIZGnm13O5G1W+xgXJX+wF2eVAG
 aLr3jrYvpDpTZlTQXeJ/lhBEhygh+A==
X-Proofpoint-GUID: O7KGGjZBEgc1A9IAOrHZG4S6YsTjwHXA
X-Proofpoint-ORIG-GUID: O7KGGjZBEgc1A9IAOrHZG4S6YsTjwHXA
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=6927ef13 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=D19gQVrFAAAA:8 a=OuZLqq7tAAAA:8
 a=m0NxkttUS1RG61Hf8JMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=W4TVW4IDbPiebHqcZpNg:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270048



On 11/26/2025 7:30 PM, Nickolay Goppen wrote:
>
> 21.11.2025 15:09, Dmitry Baryshkov пишет:
>> On Fri, Nov 21, 2025 at 01:41:21PM +0530, Ekansh Gupta wrote:
>>>
>>> On 11/20/2025 5:17 PM, Konrad Dybcio wrote:
>>>> On 11/20/25 11:54 AM, Ekansh Gupta wrote:
>>>>> On 11/20/2025 1:27 PM, Nickolay Goppen wrote:
>>>>>> 20.11.2025 07:55, Ekansh Gupta пишет:
>>>>>>> On 11/20/2025 1:58 AM, Srinivas Kandagatla wrote:
>>>>>>>> On 11/12/25 1:52 PM, Konrad Dybcio wrote:
>>>>>>>>> On 11/10/25 6:41 PM, Srinivas Kandagatla wrote:
>>>>>>>>>> On 11/3/25 12:52 PM, Konrad Dybcio wrote:
>>>>>>>>>>> On 10/31/25 12:30 PM, Nickolay Goppen wrote:
>>>>>>>>>>>> 24.10.2025 16:58, Nickolay Goppen пишет:
>>>>>>>>>>>>> 24.10.2025 11:28, Konrad Dybcio пишет:
>>>>>>>>>>>>>> On 10/23/25 9:51 PM, Nickolay Goppen wrote:
>>>>>>>>>>>>>>> In order to enable CDSP support for SDM660 SoC:
>>>>>>>>>>>>>>>     * add shared memory p2p nodes for CDSP
>>>>>>>>>>>>>>>     * add CDSP-specific smmu node
>>>>>>>>>>>>>>>     * add CDSP peripheral image loader node
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Memory region for CDSP in SDM660 occupies the same spot as
>>>>>>>>>>>>>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
>>>>>>>>>>>>>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
>>>>>>>>>>>>>>> cdsp_region, which is also larger in size.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
>>>>>>>>>>>>>>> related nodes and add buffer_mem back.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>> [...]
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> +            label = "turing";
>>>>>>>>>>>>>> "cdsp"
>>>>>>>>>>>>> Ok, I'll change this in the next revision.
>>>>>>>>>>>>>>> +            mboxes = <&apcs_glb 29>;
>>>>>>>>>>>>>>> +            qcom,remote-pid = <5>;
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +            fastrpc {
>>>>>>>>>>>>>>> +                compatible = "qcom,fastrpc";
>>>>>>>>>>>>>>> +                qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>>>>>>>>>>> +                label = "cdsp";
>>>>>>>>>>>>>>> +                qcom,non-secure-domain;
>>>>>>>>>>>>>> This shouldn't matter, both a secure and a non-secure device is
>>>>>>>>>>>>>> created for CDSP
>>>>>>>>>>>>> I've added this property, because it is used in other SoC's, such as SDM845 and SM6115 for both ADSP and CDSP
>>>>>>>>>>>> Is this property not neccessary anymore?
>>>>>>>>>>> +Srini?
>>>>>>>>>> That is true, we do not require this for CDSP, as CDSP allows both
>>>>>>>>>> unsigned and signed loading, we create both secured and non-secure node
>>>>>>>>>> by default. May be we can provide that clarity in yaml bindings so that
>>>>>>>>>> it gets caught during dtb checks.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> However in ADSP case, we only support singed modules, due to historical
>>>>>>>>>> reasons how this driver evolved over years, we have this flag to allow
>>>>>>>>>> compatiblity for such users.
>>>>>>>>> Does that mean that we can only load signed modules on the ADSP, but
>>>>>>>>> the driver behavior was previously such that unsigned modules were
>>>>>>>>> allowed (which was presumably fine on devboards, but not on fused
>>>>>>>>> devices)?
>>>>>>>> Yes, its true that we allowed full access to adsp device nodes when we
>>>>>>>> first started upstreaming fastrpc driver.
>>>>>>>>
>>>>>>>> irrespective of the board only signed modules are supported on the ADSP.
>>>>>>>> I think there was one version of SoC i think 8016 or some older one
>>>>>>>> which had adsp with hvx which can load unsigned modules for compute
>>>>>>>> usecase only.
>>>>>>>>
>>>>>>>> I have added @Ekansh for more clarity.
>>>>>>>>
>>>>>>>> --srini
>>>>>>> For all the available platforms, ADSP supports only signed modules. Unsigned
>>>>>>> modules(as well as signed) are supported by CDSP and GDSP subsystems.
>>>>>>>
>>>>>>> qcom,non-secure-domain property marks the corresponding DSP as non-secure DSP.
>>>>>>> The implications of adding this property would be the following:
>>>>>>> on ADSP, SDSP, MDSP:
>>>>>>> - Only non-secure device node(/dev/fastrpc-Xdsp) is created.
>>>>>>> - Non-secure device node can be used for signed DSP PD offload.
>>>>>>>
>>>>>>> on CDSP, GDSP:
>>>>>>> - Both secure(/dev/fastrpc-Xdsp-secure) and non-secure(/dev/fastrpc-Xdsp) devices
>>>>>>>     are created, regardless of this property.
>>>>>>> - Both the nodes can be used for signed and unsigned DSP PD offload.
>>>>>>>
>>>>>>> Note: If the property is not added for CDSP/GDSP, only secure device node can
>>>>>>> be used for signed PD offload, if non-secure device is used, the request gets
>>>>>>> rejected[1].
>>>>>>>
>>>>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1245
>>>>>>>
>>>>>>> //Ekansh
>>>>>> Does this mean that the qcom,non-secure-domain property should be dropped from both nodes?
>>>>> I checked again and found that unsigned module support for CDSP is
>>>>> not available on this platform. Given this, the safest approach would
>>>>> be to add the property for both ADSP and CDSP, ensuring that all
>>>>> created device nodes can be used for signed PD offload. I can provide
>>>> The property allows *unsigned* PD offload though
>>> I don't think I can directly relate this property to unsigned PD offload. This is just
>>> defining what type of device node will be created and whether the channel is secure
>>> or not. There is a possibility of making unsigned PD request(on CDSP/GDSP) irrespective
>>> of whether this property is added or not. If DSP does not support unsigned offload, it
>>> should return failures for such requests.
>> Which part of the hardware and/or firmware interface does it define? If
>> it simply declared Linux behaviour, it is incorrect and probably should
>> be dropped.
>>
> When I've removed the qcom,non-secure-domain property from cdsp and tried to run hexagonrpcd via this command:
>
> sudo -u fastrpc hexagonrpcd -f /dev/fastrpc-cdsp  -R /usr/share/qcom/sdm660/Xiaomi/clover/ -d cdsp -c /usr/share/qcom/sdm660/Xiaomi/clover/dsp/cdsp/fastrpc_shell_3
>
> It raised the following error:
>
> qcom,fastrpc 1a300000.remoteproc:glink-edge.fastrpcglink-apps-dsp.-1.-1: Error: Untrusted application trying to offload to signed PD 
This is expected. With the property absent, Signed offload is only allowed with /dev/fastrpc-cdsp-secure.

>
>
>
>>>>> a more definitive recommendation once I know the specific use cases
>>>>> you plan to run.
>>>> Why would the usecase affect this?
>>> I'm saying this as per past discussions where some application was relying on non-secure
>>> device node on some old platform(on postmarketOS)[1] and having this property in place.
>>> So if similar usecase is being enabled here, the property might be required[1].
>> DT files are not usecase-based.
>>
>>> [1] https://lkml.org/lkml/2024/8/15/117
>


