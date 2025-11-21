Return-Path: <linux-arm-msm+bounces-82895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 44660C7B119
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 18:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E691F4E334B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 17:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8A82E8B83;
	Fri, 21 Nov 2025 17:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S4NFyHh1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="im+lyigp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41AD2DC350
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 17:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763746003; cv=none; b=sCFzgB8FhyzN52f1uAjPfqaBgsI1KdLplGrfJ89m+LY20APS1324UFcHnzEF2zzMVuqis8Utdd07OPZIOSwXSR9/zounj1eq9j550Q9nKISldDL2zj3nJCq8rEaa9Ykj/TCpt0/thR2/rWUAaDfBz0JopGA0KyvMOXVv5/5GpH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763746003; c=relaxed/simple;
	bh=nOOq1hUExeYezHE2FAs+O6DXeKAXq0URUtz+DS2qY1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GP/FTFMcFjZSl6HhaL3GT6lhh3nGCIhryQoHX1BVuC80HCg3JiFJzS/ufpMCl4vK5SALsRjLT+T4onUWbnsISATcEljd6c9vGJJX2jrpCNH3+nnD6+Oz7qaJWEMDZYPHmTsTqb2Abu0mQPF+p+KZ0Q01jDuhnTYerJ5jlVpe1sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S4NFyHh1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=im+lyigp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALB4HGh3911581
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 17:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IQMIdaU08keuK05Zt/9Ybw5dGtW3CDvmzUEYJZmZs9I=; b=S4NFyHh1INEaGcf1
	ad4772oL1jgph4z8umDq12unyDoOH23zehDK037lWDajk/DZ8OMwscRjNl3hYavo
	IAm2Box/bABHLZqpPT05Trb1ss4g1nMMsDhaosl83l9k5FIQKsmMnj1rqT4/ud8w
	8B1Cvag07EdFZs0VFzyvHbwDTVu4N1VoE87FE+rjI18vrxQdeZqaujiHhW+cWm1z
	Lm8/NBqTAv/aaGuATfjIJcEOJEWc4YFQGHDt6uwuXitfmfdl3aOyPkEmeY6D5azY
	ufGNlJiNHtOSjgrnwUiM10Tgb9K2RJwuvaPVvbsiaHDLhdl+NXNUZnxws6nY41+R
	/DHtjg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajpvsh6rh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 17:26:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b9090d9f2eso5125589b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763745999; x=1764350799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQMIdaU08keuK05Zt/9Ybw5dGtW3CDvmzUEYJZmZs9I=;
        b=im+lyigp7GJIxvN7tboVKvl9Q7sjCWI9bGlqnpfCvWcQKJv9qbnLLHLcjpC/A31ZH+
         Scp/sM8fpGKY+cqsNa8o8BQ4LG5691DYFPnPdj/YYB2hB2iN8TMq37CAA2G7F+B2np7z
         Jxd3XWp5e0tx1Kusq9bkLXo8w1uBacO0KzJeD4t7J1nmZhOkBsjqB9NcXifDSaIDN+yn
         MYZ4Mdx7tVU6h3uM84ONaIjn9yND+K0UTHEuoAV63HQk9lMsDDvT3+4z2RxDdXVTyEU4
         jSJ3CF8f4htjK7jUfiLm82lfTyOfbO3vURHNNn9Y5eX0FKUuBFffrJ36iIetMEHCFilD
         ojFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763745999; x=1764350799;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQMIdaU08keuK05Zt/9Ybw5dGtW3CDvmzUEYJZmZs9I=;
        b=pJTxTmLibJ/mH8gkVMC/uxGEMoWuXz+bvZ43BhG7NDljgRvMRC74t581OokUQy7sBY
         kqArt5Yp2H2oASgYPVanajax/xHKumTRpXqSkk+hotV2cMG3uW56Jn37k8PeEHP+Bifx
         alnxM0sf6dW77U6xnBDoMrDii0eZ/LsMKRrLPH83MCYwOCFjnr6rMqdLm1zl8y9qy9Js
         LDuSCC4Pg7MOUhGPA3GvLkSmtQ5ytViOamYy4W803WxWeOEJKFVDCBvVZJyc+T0hJ8Z7
         bn/5sn9YLeo5KZtAix+yzhkwR3imkERIWu6OcNLfBOx/UiLQ06nlexy1SEa5IFSTqvet
         PDaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6C+W8gzNKv5sdzVm2VGSIH969hHphYqAeLu88YdPJ0heinrpV3b2TcOHeG+Pr+zQiCeDv5wJVOOJ2a84h@vger.kernel.org
X-Gm-Message-State: AOJu0YxVjcineuVqtsWuEfvwVGD17Jpspy8vxBizRLq+klwUizrID3YB
	S5e2mYhTTYBPYionB5kZUoydpBXgkbUNOWxfFe6y48EYhq3TctEpGxQbTa5gIYiscgSsG43loGp
	yhMekSqMsnjukNpYqe9/mqNH/roPeNRjhMUtj9Wnh5FvE/1UPr1FIQ9aUddaTYSv//xQg
X-Gm-Gg: ASbGncvNrVJcuTe3B3cKHtqbjSkg516PjBpCsqt4+6nEFBaMzUSg9jeKJacU8dQ5NAn
	CZkJ9FGEttRmEKBO23d6ig2hwUCM50tvBzi/V+AuVvR7ZZcYG0YK9JSBBRdMcGwWZCfOBBtuRAw
	171ydXKVMxrsuwdhR3Tc/KV6nH+iN4iWVAgUtmwZog0EUx+Cjoy/k3YZ52MW576MeB9Rzh3U03h
	5oUfj3U7BiPL7wYvBk6LhpLo3DLHvshIt5Jyd+1n04B7wC/HjqnIMtqT1Xrwb4MF2egiHnxURwb
	CFygu0U4eWgSd8jh1/fgQdfhhxPhm2azLnLagprqiTHWge4rxVt+tR5MYbcZ9/DtFET3sN86Mh/
	76j+GfLFnAcmGmLpOQZIVtVFStIhGct8Y1umTgw==
X-Received: by 2002:a05:6a00:2f08:b0:7bf:5011:d1e0 with SMTP id d2e1a72fcca58-7c58c4a7988mr2586452b3a.2.1763745998951;
        Fri, 21 Nov 2025 09:26:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH56aTpsA3S0hWTXDgIt1z8Y3LX8eB9/2cGmDjNKQmmX/1ntjarn0bWDJ53np2JIBkBlsDUng==
X-Received: by 2002:a05:6a00:2f08:b0:7bf:5011:d1e0 with SMTP id d2e1a72fcca58-7c58c4a7988mr2586414b3a.2.1763745998433;
        Fri, 21 Nov 2025 09:26:38 -0800 (PST)
Received: from [192.168.0.195] ([49.204.24.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f02423f6sm6634689b3a.39.2025.11.21.09.26.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 09:26:37 -0800 (PST)
Message-ID: <a4ac2816-0a39-4d35-8136-6a4f38122219@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 22:56:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] clk: qcom: Add TCSR clock driver for Kaanapali
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
 <20251030-gcc_kaanapali-v2-v2-5-a774a587af6f@oss.qualcomm.com>
 <71e0d879-63ed-49e7-9bfe-c5cd8e0ca8ba@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <71e0d879-63ed-49e7-9bfe-c5cd8e0ca8ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: I42u1yEREoMW1sz5RTmSq2WnOfQgzZ0G
X-Proofpoint-ORIG-GUID: I42u1yEREoMW1sz5RTmSq2WnOfQgzZ0G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDEzMCBTYWx0ZWRfXwSIPhxJolAdz
 nTa+xA3HpkuH6NC+QSkt5ECjbdY2Kl8U9T+zFEcEpz8mst11nwpxJoIkYSJfguZDauDIpnI9988
 3v2DEW17mGzMCst1gWP8yYSLPuYVN4hTLK2MNGmEVTumfyAY5FKogALQd1CB1qbKfKRRpXPzAsg
 7a9xX35Npc2KvnFM3girdugJGmjJaDnX7LwChU7uaUBacF70XAD3en57gdrcjSSxs4TsHzHvJGY
 F2F5oB8p7LioS4sFI+nY0qIjp0h0n8+Rcj+Va6y9HMRtGlJFkhfxDqDrsihwV/TPtLZHEzYoX7X
 QvyYx/v7Ambr2R5k19kgfSGoINcSZKI2oY7+op64RK265GISK8PP1qnAUkJHy2vfy4i9+fbWeYf
 oaBbKv8KZ4nDhu3/Tr/alOA6GDZC0Q==
X-Authority-Analysis: v=2.4 cv=MqFfKmae c=1 sm=1 tr=0 ts=6920a0d0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JNCjnJIMGS+pfmg2DM0HVg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RaHAS9VqNI6p-X5hwAwA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210130



On 11/18/2025 12:14 PM, Jingyi Wang wrote:
>> +
>> +static struct clk_branch tcsr_pcie_0_clkref_en = {
>> +	.halt_reg = 0x0,
>> +	.halt_check = BRANCH_HALT_DELAY,
>> +	.clkr = {
>> +		.enable_reg = 0x0,
>> +		.enable_mask = BIT(0),
>> +		.hw.init = &(const struct clk_init_data) {
>> +			.name = "tcsr_pcie_0_clkref_en",
>> +			.ops = &clk_branch2_ops,
>> +		},
>> +	},
>> +};
>> +
> Hi Taniya,
> 
> Here is a discussion for tcsr in this thread:
> https://lore.kernel.org/all/01de9616-825b-4fbb-83cf-
> e0bf91e8cf39@oss.qualcomm.com/
> 
> As TCSR_CLKS is a part of tcsr block, we should merge it as one node, the address
> should be start at 0x01fc0000 instead of 0x01fd5044, so offset need to be added in the
> tcsrcc reg configuration.
> 

Yes, the next patch will incorporate the changes in offsets of the
clocks and the device tree node needs to be updated.

-- 
Thanks,
Taniya Das


