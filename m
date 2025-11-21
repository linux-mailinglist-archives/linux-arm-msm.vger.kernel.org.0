Return-Path: <linux-arm-msm+bounces-82779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF6AC77CDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 09:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 23D022CCE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 08:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F21C3376A7;
	Fri, 21 Nov 2025 08:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XaQbK5g7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Faqdqz5l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA3531A07F
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763712693; cv=none; b=o5f0jTJ+YB29DslOH8mJ2Uk6GcIr5I7ohzuZ2Yo9f0mDGMhgeNFQKjBFk6rA1btvSkVx/5DYyKKoBlRpXRq/HqfPeyytm8MtQmfHBeb1iPSSHs9Apb3FQE+LryRtnUlGKAYDH1bnP4LdlZ1PikHkzIOecsRXNxiEq7RQbLRPSjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763712693; c=relaxed/simple;
	bh=KcJktsy4rWjR7RysDuDNP6xdH8+Qlnk83GyDNML9TtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RKPF/npXjFSTtKo2T/Uy6/hoW4ACm7gY7zl9+nvjF99YKhCKjxBnV9luvqcRI3PVXgnEZy0JcwMWigOHoLRmwmxQIH2VYl/tXx0qZkyYiFq0uKicEWPhgEyx4Zlv3yHfgTURqmx/GUdcuG+9XSTuo0sjkT0Q0DqSu7iP+Uj88sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XaQbK5g7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Faqdqz5l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL53oLe2840662
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KcJktsy4rWjR7RysDuDNP6xdH8+Qlnk83GyDNML9TtY=; b=XaQbK5g7HC+YWWxT
	/2t1e/RCrJRd4o42peRCXzeJtBzIHyTTP/OTUqOM1o16rInvA51rS+UImck8Ux5w
	G47wSDeEr1mhHVYBKLVj7Ep9it25XOmSWH0EaioY3zJoAfUbAvjCj4nKMYHdrSDx
	EK+BSg3hEtU+u6WiP+EDTPS7MPlhpolPIqw7zjlOOKSKZw1EpuGp+OK74FMSlYsE
	BhdvPed2zvg0XjqIX/3Y8pR+5jz/Ko4Lx6MCsdsTenK+hGveGtl3ovf/iLhVHvj8
	7UFKdxpNwGhPaEqalcKTNd12ZN0NUUjl+K92NxrfTaxm1HhRPh2fQJAOgqxw/yVu
	pLTKNg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkvgfpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 08:11:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-295595cd102so45456345ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 00:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763712688; x=1764317488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KcJktsy4rWjR7RysDuDNP6xdH8+Qlnk83GyDNML9TtY=;
        b=Faqdqz5lnuHk+aRC+cIwI0Brlc9nnoPYX0tghZUWSNR3ISr38/0q3k8LnR36OSCBRl
         06Y3Iyo7RLlaUB9+4Z6WwClAKDhq0cjoTPU+6WZKSArnp4w14Unwvol9EaOo+x6I5okZ
         iR+rfVZomTKExZYj+VpyHoaDzSL+lg95D8624EuKKTWqlNyJc3qXd36BEP2k8eeMzMPI
         oLt7Cc74HIOFJxSi5Qvuc+Pya0sVavk3ovw3LKKA2y8Q98dQKSBlcEVZ2eYp5P6k7ZjT
         JmmuUj54MX0MYWYqTgIYLj4376w9bT/gFMP60fz+bpa136FIS5jUCx7k3RenpuA/ePsC
         ksvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763712688; x=1764317488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcJktsy4rWjR7RysDuDNP6xdH8+Qlnk83GyDNML9TtY=;
        b=tC45Yr8o1LKaPCEywVd5pP/nvLJaokSWDB3Ywdpre78CF6sEwM+yKQlEi5ApEYoxGs
         qT1Zv2Z/Bwc0Jc1eH0OZUymBjMVns9UkVbs4v1ukN+3IuNTXf7dzLWjpUqdlnZp/UZhS
         5kf+WdoosPVrBPujI/Lqg1mcn4cY+OXbEEZP7X/XjC5z3wvxIzFvzHBMblFD60R2L3ie
         sHBbcgTqiGnTDyelYbxyFoc1O2qo3FrWAjrlQHrowojONYZw5hpJa351ugRRcv4LEDtR
         b+ZCMgg6r91Nn8vy4rhkhHpLzAEXj0bCv6xgT3abztRS8xTxi7kLzVeGKjS3v1ImP8VD
         sElw==
X-Gm-Message-State: AOJu0YyBmoi89i1uk0G9YkrmeZ3auj6T6bqIB19yKRJWrM+dDrs2tdPW
	BuGfKAAWsoOs52aF9LdGhlHORn5iekwKBD+zo0/klf53htClOLWhw9H7cEogKrWe7+UFRPH/h84
	fzXcN8gRUO4ON+j0DjiIjKiuZR+pHUD/JSOqaJrFFN22ppQDWWrDgFVGKtBzPWXznTt7j
X-Gm-Gg: ASbGnctaDlIHN7yjAwd85aLRa76DsPzS/zaGyZLq0HrR0UpI+7/lXbHOoWgfwrynf24
	fRVhWyzhu8Hzwz5zMm5Le8KxgQy2erCEPV/b2hAFgzlcygjHM/vfXu29vwvsPLS6LgMxTqzzJES
	caZnc2A23K0AeR5W2Qde3wcRp07S96F5wAEx2lWd1WX7VZ6t3duzKtxOHtIDVYTPvrHIaje7kcr
	lBro+fhd9m8ZQ3I2JlcCvSrE/8lKfsOgoXCkSVYrD4hQrgpleNmCXlkN858nVY3mjTSLenD+ZV5
	iRiwKjsz2UAWRPkRzgcKpPCa7/RqII+lAdkbQQbt4sZAU80dy/CRjbg57Iy+Jk7eIRv8ookIvDi
	wnn49v3SO30YCe1PWxTede4pUMO+FTDHAIr9d7hU=
X-Received: by 2002:a17:902:d541:b0:295:9db1:ff32 with SMTP id d9443c01a7336-29b6bf5d676mr22230235ad.48.1763712687561;
        Fri, 21 Nov 2025 00:11:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQ0POECUYr8Xi+MCkibQlmUTDkwh9AnKtRjukTgJNxNGRyWixQQuO+kWBVp6BQj31NX1Uj1Q==
X-Received: by 2002:a17:902:d541:b0:295:9db1:ff32 with SMTP id d9443c01a7336-29b6bf5d676mr22229955ad.48.1763712687023;
        Fri, 21 Nov 2025 00:11:27 -0800 (PST)
Received: from [10.204.78.148] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075ddsm48324575ad.3.2025.11.21.00.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 00:11:26 -0800 (PST)
Message-ID: <be4e2715-882d-4358-8575-374187f7ee2f@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 13:41:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sdm630/660: Add CDSP-related
 nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux@mainlining.org, Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>
References: <20251023-qcom-sdm660-cdsp-adsp-dts-v2-0-895ffe50ab5f@mainlining.org>
 <20251023-qcom-sdm660-cdsp-adsp-dts-v2-1-895ffe50ab5f@mainlining.org>
 <07066c46-4121-48da-846a-3a180d245589@oss.qualcomm.com>
 <47b40a91-8365-4431-9fd9-1e48fad2a4e1@mainlining.org>
 <a3cb6633-1595-41e7-8e87-ca48a98f822c@mainlining.org>
 <83c3aea5-764e-4e60-8b16-67b474f19357@oss.qualcomm.com>
 <d17548bb-ddce-4d60-8dc4-2c0633989299@oss.qualcomm.com>
 <f5c7eb1c-28b1-4cf1-afb0-b993384b7712@oss.qualcomm.com>
 <80836b8f-16a8-4520-ad11-5ca0abb3403e@oss.qualcomm.com>
 <99c22e73-797c-4a30-92ba-bc3bd8cf70f0@oss.qualcomm.com>
 <eddc16cb-d951-401c-8fb8-fccfcf600143@mainlining.org>
 <0b06f744-b695-43d9-8da3-4424e2b53a5e@oss.qualcomm.com>
 <24221ce7-24e4-4eaa-8681-ed9b4b9f2d6e@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <24221ce7-24e4-4eaa-8681-ed9b4b9f2d6e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -ooxF-NhumV4TAVnuGLZGcz40lROm4Xj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA2MiBTYWx0ZWRfXw0yXShmGSbIk
 giRyvPqyy5p4j4M/6Wt5Dh/8APvD/NDJaq0P/FwylLQfmTrIFwadpnGPxskqT+1MqHxkzCnJFLy
 O9mG/mZQewj+eH82+7/3TbP5LfgSkgQ7IsE4XdF1uuq/WANfUunbVy81q+lMlKGqiw5STG8XwFT
 nMtx46xnlQDT8QtK2xFDTq4USP5wBc3az0bitbW3FY1xS1h3y/JVj6EfavhLMXzot4H38sIrpfI
 YULtuUuvtcbUOdCJl40n6Lji9VGs4sZnOvxabgM6MVdyGtFk961HZD90+B7fAho6zH4/SGDw1W1
 tVpWaMJ7gCAymcq/nZKme8zDNM4mfCrxUHdluNkhTnZm9PGWVNAQBF+i7T3y8vu2+YB3B3y563G
 SRk/A8ZnGBNi6B2JpTTdaB2wmRjO3w==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=69201eb0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=D19gQVrFAAAA:8 a=OuZLqq7tAAAA:8
 a=-v0Gm8E9aN-zKP_vqnUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=W4TVW4IDbPiebHqcZpNg:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: -ooxF-NhumV4TAVnuGLZGcz40lROm4Xj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210062



On 11/20/2025 5:17 PM, Konrad Dybcio wrote:
> On 11/20/25 11:54 AM, Ekansh Gupta wrote:
>>
>> On 11/20/2025 1:27 PM, Nickolay Goppen wrote:
>>> 20.11.2025 07:55, Ekansh Gupta пишет:
>>>> On 11/20/2025 1:58 AM, Srinivas Kandagatla wrote:
>>>>> On 11/12/25 1:52 PM, Konrad Dybcio wrote:
>>>>>> On 11/10/25 6:41 PM, Srinivas Kandagatla wrote:
>>>>>>> On 11/3/25 12:52 PM, Konrad Dybcio wrote:
>>>>>>>> On 10/31/25 12:30 PM, Nickolay Goppen wrote:
>>>>>>>>> 24.10.2025 16:58, Nickolay Goppen пишет:
>>>>>>>>>> 24.10.2025 11:28, Konrad Dybcio пишет:
>>>>>>>>>>> On 10/23/25 9:51 PM, Nickolay Goppen wrote:
>>>>>>>>>>>> In order to enable CDSP support for SDM660 SoC:
>>>>>>>>>>>>    * add shared memory p2p nodes for CDSP
>>>>>>>>>>>>    * add CDSP-specific smmu node
>>>>>>>>>>>>    * add CDSP peripheral image loader node
>>>>>>>>>>>>
>>>>>>>>>>>> Memory region for CDSP in SDM660 occupies the same spot as
>>>>>>>>>>>> TZ buffer mem defined in sdm630.dtsi (which does not have CDSP).
>>>>>>>>>>>> In sdm660.dtsi replace buffer_mem inherited from SDM630 with
>>>>>>>>>>>> cdsp_region, which is also larger in size.
>>>>>>>>>>>>
>>>>>>>>>>>> SDM636 also doesn't have CDSP, so remove inherited from sdm660.dtsi
>>>>>>>>>>>> related nodes and add buffer_mem back.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
>>>>>>>>>>>> ---
>>>>>>>>>>> [...]
>>>>>>>>>>>
>>>>>>>>>>>> +            label = "turing";
>>>>>>>>>>> "cdsp"
>>>>>>>>>> Ok, I'll change this in the next revision.
>>>>>>>>>>>> +            mboxes = <&apcs_glb 29>;
>>>>>>>>>>>> +            qcom,remote-pid = <5>;
>>>>>>>>>>>> +
>>>>>>>>>>>> +            fastrpc {
>>>>>>>>>>>> +                compatible = "qcom,fastrpc";
>>>>>>>>>>>> +                qcom,glink-channels = "fastrpcglink-apps-dsp";
>>>>>>>>>>>> +                label = "cdsp";
>>>>>>>>>>>> +                qcom,non-secure-domain;
>>>>>>>>>>> This shouldn't matter, both a secure and a non-secure device is
>>>>>>>>>>> created for CDSP
>>>>>>>>>> I've added this property, because it is used in other SoC's, such as SDM845 and SM6115 for both ADSP and CDSP
>>>>>>>>> Is this property not neccessary anymore?
>>>>>>>> +Srini?
>>>>>>> That is true, we do not require this for CDSP, as CDSP allows both
>>>>>>> unsigned and signed loading, we create both secured and non-secure node
>>>>>>> by default. May be we can provide that clarity in yaml bindings so that
>>>>>>> it gets caught during dtb checks.
>>>>>>>
>>>>>>>
>>>>>>> However in ADSP case, we only support singed modules, due to historical
>>>>>>> reasons how this driver evolved over years, we have this flag to allow
>>>>>>> compatiblity for such users.
>>>>>> Does that mean that we can only load signed modules on the ADSP, but
>>>>>> the driver behavior was previously such that unsigned modules were
>>>>>> allowed (which was presumably fine on devboards, but not on fused
>>>>>> devices)?
>>>>> Yes, its true that we allowed full access to adsp device nodes when we
>>>>> first started upstreaming fastrpc driver.
>>>>>
>>>>> irrespective of the board only signed modules are supported on the ADSP.
>>>>> I think there was one version of SoC i think 8016 or some older one
>>>>> which had adsp with hvx which can load unsigned modules for compute
>>>>> usecase only.
>>>>>
>>>>> I have added @Ekansh for more clarity.
>>>>>
>>>>> --srini
>>>> For all the available platforms, ADSP supports only signed modules. Unsigned
>>>> modules(as well as signed) are supported by CDSP and GDSP subsystems.
>>>>
>>>> qcom,non-secure-domain property marks the corresponding DSP as non-secure DSP.
>>>> The implications of adding this property would be the following:
>>>> on ADSP, SDSP, MDSP:
>>>> - Only non-secure device node(/dev/fastrpc-Xdsp) is created.
>>>> - Non-secure device node can be used for signed DSP PD offload.
>>>>
>>>> on CDSP, GDSP:
>>>> - Both secure(/dev/fastrpc-Xdsp-secure) and non-secure(/dev/fastrpc-Xdsp) devices
>>>>    are created, regardless of this property.
>>>> - Both the nodes can be used for signed and unsigned DSP PD offload.
>>>>
>>>> Note: If the property is not added for CDSP/GDSP, only secure device node can
>>>> be used for signed PD offload, if non-secure device is used, the request gets
>>>> rejected[1].
>>>>
>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1245
>>>>
>>>> //Ekansh
>>> Does this mean that the qcom,non-secure-domain property should be dropped from both nodes? 
>> I checked again and found that unsigned module support for CDSP is
>> not available on this platform. Given this, the safest approach would
>> be to add the property for both ADSP and CDSP, ensuring that all
>> created device nodes can be used for signed PD offload. I can provide
> The property allows *unsigned* PD offload though
I don't think I can directly relate this property to unsigned PD offload. This is just
defining what type of device node will be created and whether the channel is secure
or not. There is a possibility of making unsigned PD request(on CDSP/GDSP) irrespective
of whether this property is added or not. If DSP does not support unsigned offload, it
should return failures for such requests.
>
>> a more definitive recommendation once I know the specific use cases
>> you plan to run.
> Why would the usecase affect this?
I'm saying this as per past discussions where some application was relying on non-secure
device node on some old platform(on postmarketOS)[1] and having this property in place.
So if similar usecase is being enabled here, the property might be required[1].

[1] https://lkml.org/lkml/2024/8/15/117
>
> Konrad


