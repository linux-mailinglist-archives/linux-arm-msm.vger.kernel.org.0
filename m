Return-Path: <linux-arm-msm+bounces-82089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CE860C6403C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1A367341D18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901F1280330;
	Mon, 17 Nov 2025 12:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPNavtyC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pz3tcILG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010A12571B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763381875; cv=none; b=NYlwie2NturYLeun0CM8fLBDCMof8APaUZ++xVD3RAZcVy6ZQZL5prtEwhLkNImoVlueo0EUwMpsKrppLSRBjl/7l/Rd2SHaIAFCFwZZaUAQaz/2MhG6BjMUkItwCQ9ZD6h4K06c6i9J0YdY5cW6lJiYPRwAfI1Owf2bjmJfAuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763381875; c=relaxed/simple;
	bh=IrgtLqlGGVjEzW+WJHI2/2f6uAkIPVkL0cGzY+IXApk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AELj1+g3x4MqQjr0/Pekppgy5iZahDV8JL2590WiGic+BM2oRrYtfA9r9o14LMwMDuKzLJDUN1J3yGLhDrXhb7AbG6r/lG/lJd1L2qcNTtACfARtgprx0skAdW+yby7oXvwpEnTxFaPDVd5wZ1LeepH+SFdGICKwWOa3rIOWaB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPNavtyC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pz3tcILG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHAKNCt3932608
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kOssYp9IR5bSzooHWmQsQCCHXQc/n4leNi0bBhT2X2A=; b=UPNavtyCkoBmfG8Y
	kV8DGkfb3EHZhHlLswDD+U5E8DWfq4IuPenvQ3eNyIS4xAwNkMyC0csy3d99wthY
	G8fiOXqKCNbCQ8X2sfZEL89ImxymQLCUAiRdJgi44PaePSvzZz+/fBJLDz+d7Fe/
	Zen8bPlK184ahZdvk7VCQD1WmWxg8X8nhRqNFJHtGVqAbbW5zZHuNT4OXcI2Hqcg
	LJsAPe8l40xCFn2u2YxenRkNmAfFfYtwTP7QNrByTw5XoXUXI3aEyWwNz1dm5DqI
	fAMHVMWStbY91geTwyPNsB4xxvf+i4zj71+1k6FqnAXHC3AHPkTCn6tAelcXximS
	6FPAvQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag1v90aeh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 12:17:52 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee0440a771so1866391cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763381872; x=1763986672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kOssYp9IR5bSzooHWmQsQCCHXQc/n4leNi0bBhT2X2A=;
        b=Pz3tcILGiT4ss1GW96UtEIhP2ML2U+XLSo8n8UnJ7rvSGYdc/eB/m6eXJ1nmVX7+fw
         PD3+PAnGLqPHjvWOUW3lF+dacYQUJ5VEaDpZL/m8K5OFl1EaBG3B/RMoOFo7XFJGqRQX
         IbWzxbGyiCWLJqfegebNDlLpAkP15v4Owuh+GgUkfjWW7GbMHXZ+ID5GZ3lB55CVlMNT
         H6vmAIiBpgLEjyLnZdTWGkkZDa3S36V4u5VBF4ggD4riM06Gv3lHsRQjFLNmRaVYlouU
         EjS1Oj1I8vrC6yGuzQC2mLdBe6mWNGxehrklCktf9y/HbY9FvAogrxiyP8tYHuavlTqK
         Fqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763381872; x=1763986672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOssYp9IR5bSzooHWmQsQCCHXQc/n4leNi0bBhT2X2A=;
        b=hkzlTA4yfa5Z03W+0HfjvAgLDwpQqxQLLwgSuToJx3rR3hUqfexv41wcTxss6+6IZ6
         eTJ1c4tirk6hoAEsAhAVoUns6u4D34YT3RgEbhN24exIw7TkI42lDRT1tcw5VwBsdEh2
         kgtb3tVJMOUSzMLYfiS+Zc2Q5AtZmuqvqJogNSJkUnVzGnQ06PGlSOEK5PN80wD5BRw5
         /wT2idxZrqNfPWt7vTw+mI2IEGjogNTJWVgbA7gAsS76VESB3g4Jn0isa4bsMM73CviR
         jo50Ze+2X9wn2AYKqwhZDXdKHNFHoBa/TX68t6s5NZeFnzvPDwh/v3T8k7v7rl4i4Q7F
         7AuA==
X-Gm-Message-State: AOJu0Yy1uFLd+k4UIaTNF7H1OmmPn2BT+4yeILoFFNhNCWr4MCxtRwKM
	DBOihLJ9aHf1p8coXMTCy3IK4hpjboQIRWrcqLoHZ61ggnj3UM5zrBDBnmiPFgt57icmMQCpaWA
	d78GbZlqa9SLaHK8+jj9zquV05E5hFIICELYRxojLYexGYi+vjDSJmTjxEVNKRf8ppT9j
X-Gm-Gg: ASbGnctMHwTaHIsrXgkSgfQZENoBJdzevk8fFBQH6BY4+qFfPt8LG59TPNJ4TgTmzbj
	/3KNzQwgYJ/DrqnshOMt0hMHZ7CixmlO1UBRWEZkqIj6o8vg+qbp1IWtmORtKFu4i0zb4I+Iyeq
	gO8oYPCxnBHecXV3wtYANXZUCG0VZ6jivzxlAm6lPuGt40M1Z8PmdMVbTqfxnO/hQYeKkDe5ZHx
	ixZvJV3lU+Xbt1bOTO5aCZh39ilTlyYD8JdTsr0ttWmoftejhCNDvmbSIXJcd7WhhAiFqX8fQ2Y
	Q/BY3TbdyjFKUvHTgmfmHAl1dq5codnECTndAY0R7DhKjOnLXrUIgSeZHz4Gv/AeKul4Voofgce
	DIjdG7l9jNgLShZEh5DwgHzFj8lv1FhrLdCYsjF9GGu0ex6VXN5X+L+m2
X-Received: by 2002:a05:622a:7892:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ee13678a9emr46875621cf.5.1763381872249;
        Mon, 17 Nov 2025 04:17:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOHsMBY+vmfDDv0UFrDPhqHGh/pmvHwB4CxFSVYk9Ucz8EIShxdHNzm13AJ1olvUMCVmZ4pg==
X-Received: by 2002:a05:622a:7892:b0:4ee:1367:8836 with SMTP id d75a77b69052e-4ee13678a9emr46875401cf.5.1763381871805;
        Mon, 17 Nov 2025 04:17:51 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d8294sm10047574a12.3.2025.11.17.04.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 04:17:51 -0800 (PST)
Message-ID: <8faa0c8e-6f21-4025-bbdf-d4ec18eb7628@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 13:17:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: gcc: Add support for Global Clock
 controller found on MSM8940
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Adam Skladowski <a_skl39@protonmail.com>,
        Sireesh Kodali <sireeshkodali@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lanik <daniilt971@gmail.com>
References: <20251116-gcc-msm8940-sdm439-v1-0-7c0dc89c922c@mainlining.org>
 <20251116-gcc-msm8940-sdm439-v1-2-7c0dc89c922c@mainlining.org>
 <793d5039-0506-4104-b4ce-64bfa3cc00eb@oss.qualcomm.com>
 <5C7A10CF-910E-448A-8BFD-F2A46782D3B9@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5C7A10CF-910E-448A-8BFD-F2A46782D3B9@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8z19C4ky-mE-elKx0j5CT3VBHJmpQw6w
X-Proofpoint-GUID: 8z19C4ky-mE-elKx0j5CT3VBHJmpQw6w
X-Authority-Analysis: v=2.4 cv=acVsXBot c=1 sm=1 tr=0 ts=691b1270 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nxAZbQHxNLXoYmXW_74A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDEwNCBTYWx0ZWRfX4YdPNcad71GB
 YHJ1RvVML4QoQcokNsvYjY2DxgNI2MQ3R3mTBtrz7CSoRNjfdTegRVuJmte+J3m01ZTvyRYEhsN
 z3t1BsCfQIZvn45l8A5GuQkaOz0kD36upIQFV+ILlPJmMORcniMzfsxJ9cCoj/KN52RgChNYwfV
 2LinLgWVpcj5rK2at1m6gBAMMfQTbfYlbjn0ugU1QLECzDAQh2VuAYbPxLX+ZB+jspPUnNrEZJ5
 W8bY+JpRqKw38Dt1dQZWtZdEXuv0aZe/wBq+g8pxfJWqvYH9tfcM4yt7OjHNEEEKTcz8XgPrixy
 3dmFSrmuor8urUT5d6OH0Mdw9rBO/Py8Js/auMkM6MWz+qFetPBjx1jgDSTljjdTermOLGJ0OM2
 c34UPV/JkRphB0PT7W4nr7ALI+9DPA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170104

On 11/17/25 9:51 AM, Barnabás Czémán wrote:
> 
> 
> On 17 November 2025 09:03:53 CET, Taniya Das <taniya.das@oss.qualcomm.com> wrote:
>>
>>
>> On 11/17/2025 3:05 AM, Barnabás Czémán wrote:
>>>  
>>> +static struct clk_branch gcc_ipa_tbu_clk = {
>>> +	.halt_reg = 0x120a0,
>>> +	.halt_check = BRANCH_VOTED,
>>> +	.clkr = {
>>> +		.enable_reg = 0x4500c,
>>> +		.enable_mask = BIT(16),
>>> +		.hw.init = &(struct clk_init_data){
>>> +			.name = "gcc_ipa_tbu_clk",
>>> +			.ops = &clk_branch2_ops,
>>> +		},
>>> +	},
>>> +};
>>> +
>>
>> Is the TBU clock used on 8940 by a SMMU driver?
> As far as I know no MSM8940 is using same smmu driver and bindings like MSM8937.

On msm8939, the clock needed to be turned on for the GPU SMMU

See 5bc1cf1466f6 ("iommu/qcom: add optional 'tbu' clock for TLB invalidate")

Konrad

