Return-Path: <linux-arm-msm+bounces-114828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I/PLEB/9QWoJyAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:05:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 893196D5F7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:05:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mcgo6nzT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kWn0xzqa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114828-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114828-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 342E7301349D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31FF3382E1;
	Mon, 29 Jun 2026 05:05:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFB03358AD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:05:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782709532; cv=none; b=DaC0aJbUy9Nl1F0S4ZgFU2pLI86cIpgMgwRW4VxDNGnbRKty46duEhikBXmejNfbfOskdG4JCnZGsLXVK4834t54VnhDTACURv3rF5dHV7mou6cmHb+68ntS9fC4bONSjOxTxwDneq1FqDuq5oS6XiV0smnuo9o2Tfn+BGsSNIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782709532; c=relaxed/simple;
	bh=8aOJRHKBmfc1+7Rwpqn2N1sXUGdR14XHUpIhVnxAONc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G7W0TeP/S51WTQ0CpSh05KipBAxonuLM1qyngx2ivk434hfSvwFg6Zab1KHzMPL9u3F0IJ+2MoaHI0/x76WPSPxJ/NZv4l6zvhBF/TJ2zKRjbjpw9lrKnnyimRFP7uA+MR2ihLQEiii3UlwsJ5uN1SSPRcxSo9LzoAI/SJVSve4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcgo6nzT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kWn0xzqa; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHNL1787649
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nO3s3VCHHewstNRZJ4t4fpECAVq2VYK9td73k2+GiRw=; b=mcgo6nzTLpNWQlQk
	H0WYlKlFw4NrefmbGgQJsCcX5te9uZxZLwvK5rSWDIN3OoX7sWFzkHZByEzkBAwh
	CIfB1Cec+02ejRvAC9sgBkBVSvmsTSba2MzGDObdG6qhWfNqxllCT70C2x47DVa2
	4sogiU8RIWZfgY1QXcZ9kQKLW8qfL+YeNOHwviiucsrhjzPVS6SuCt7B/jekd64R
	Fr+zlGiYZSPhtONknfPBLO1fvH6k9uHvibKkKK5NK3ybL16OkqdPE3HtOapgDvFp
	9q/R9kf6M1z7pDuuvnAjUJ0IGvHKt3ZapYY05DSLbOpDVz7WBCJnphPAJZQ0d7jB
	mG/4+w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tuvjg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:05:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c9bd8b9c7so3449478eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782709529; x=1783314329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nO3s3VCHHewstNRZJ4t4fpECAVq2VYK9td73k2+GiRw=;
        b=kWn0xzqay+rIQu58h4/EotDFhTR9DNsMwgT6T4bn0xED4Lm/K8vtPxxMmINQnqcOmN
         9mfzEFNoMpRw4/Gzn+I57HYQRCjuAgdsb+Et+1G2vEoxOc94O0MPIAIfAJ74x9uFz5je
         kdx8N7n3RRaLgGCcO+9E0oyyEs/u6pl9ZsHNqmT3nRWHul1qA6+N0ZTdFK7tcF094VA+
         REjjLolHzg+3rMFp+WZc6eTN4LQPpu5p7aoQqOm1rktNcMkj+DzzJXyV8mb6tsNQfA0F
         zXg7z4jWYPYuFAkhWdQZx3lAf+H/Kyh31jQVg7zy6ebwNaWwBj5eeBZE2Vr0DSM7B4GD
         sfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782709529; x=1783314329;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nO3s3VCHHewstNRZJ4t4fpECAVq2VYK9td73k2+GiRw=;
        b=EKThCMr1/o9caDoASM2NfrfRnhc+uaEYzYYL+QtAbn7XnA9N7lDOEXiJVNHihTbIzX
         pQ8rCgYipB7Gpe/0f3P2YKCJqq8Se9stDsGEqNmYGkKMH72bCFpLpQnHVWpq+X7G+SlN
         d11foRWMlvHuJZ3pZoFO3vonc4/Sr4NPkt6sTIjnwRwf1WnSZhye31ApGIterCEBB0mf
         63Vgpymjym55OmvYl9Ix4TXiPCVeXhzYnMEWt/ObL22WvbceGFbKJ15CCtF8mg+bxv2K
         7wDoWuHdjPIhUgIDCyv4YGet4HNNeD4TnWl07uDDrN54Ez9MPzAQO2MtvzpDXn7bnSCe
         5SeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpk+uA/RbyNr9HcibDd46K4BtTxJBtUD0oyVII1XmD9nM4/2lPC10BHjKm6to3k4YrWCgatogXrUP157rzE@vger.kernel.org
X-Gm-Message-State: AOJu0YxiaSHWb4uukSWmfHVsYDkZX003aP0Y1nJh67acCSvwSL4Kogwd
	Bl7CqQIlrUrFOmvcCfmrM4MyEApi3HgkHNZYsl6LLSblkTrJb4maCgkwiVy3z3Ae7Nz3/gZMEPE
	qF0F9Y3x39lHSc9E18ntynhSlmmC5e2iWtfGdnArwwLAZNxXbnXJKL2gWxatoAoYGCyM/
X-Gm-Gg: AfdE7cmISRgHqBLFRsEt6mTSfgL8G+KrQCX3JXkrZnXsLinGP4xe2JppzLyv3yMORgs
	Kydqr+Q8pr6SG27dwkug59dVUiG7lRAj9PG5QxYbMYmB3RgVdOJtZ8ShOW3G1h+LfR9kgFucHOf
	s4lZzhBQWckLlsNcI1vz57o0/3F6soDUQZ0UZXyVraaGqhqQWjqQvmbSwfk/C5iNsJ6ndkWSWBN
	h98PzyUHgmLAr5m60uUdn5DEjPAqD+Ek9WCsQpNccwVmOtYJ7IbExZFlYpPlMangkthQ9zfPKBV
	cqbziw4/1HTrh/CT7x3sTh7y0kv05fU9xhel8oVlnFV5P/Qf+/wqzdJbfbFwo/closp27iEeb+L
	mxB5WxMQIsZt/4usmhoB1OjxhaCMv4BD7U9EjNgsmNfd2rr90xw==
X-Received: by 2002:a05:7300:d0c:b0:30b:a257:3a2d with SMTP id 5a478bee46e88-30c84fd07e6mr13311457eec.26.1782709529452;
        Sun, 28 Jun 2026 22:05:29 -0700 (PDT)
X-Received: by 2002:a05:7300:d0c:b0:30b:a257:3a2d with SMTP id 5a478bee46e88-30c84fd07e6mr13311436eec.26.1782709528887;
        Sun, 28 Jun 2026 22:05:28 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ca5f15024sm31653192eec.17.2026.06.28.22.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:05:28 -0700 (PDT)
Message-ID: <49d60b9a-127a-4f3f-84b2-ebf365257b8f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:35:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
References: <20260616201315.2565115-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260616201315.2565115-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <41118d35-2b3a-4f49-8add-bf501bb93040@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <41118d35-2b3a-4f49-8add-bf501bb93040@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfX/GMUmV8ll8yL
 PjySNiWVl5wxFsjyFxpi8JeCZv/M87dCNh/2+yUwiv7nkQYRxU9KiuqL5QTbQYUgo3dOKDiHYTQ
 4PHDPIy6v+ahc+iC7IGLIpFceV3jKfM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfXw/12LQZsNpOQ
 MtamwJHVvx6hMEXswpQkHDNXeobiTkf/PjmVbj+8s4hGVxSHBV/xhCtmY0k8tcQ27bcl4mPBF3t
 7ntCt5LCH3MPE1Loi3HwwlweHaQGjrZg8Y3O1DDtybcwerq2McWDybE3KHEQjVPqlVPZiRL+Cz6
 p2qeWnOxMxcZjvpXUyMNAoh/Wm5BXkr5kY0NZbuT6kjrjlWHC/z6BtbTCRc21yGQ2UKmf1g1CUW
 HkI2Rt/Wse+/Tgka/jMj4FpchHMqnZWD8fb6kHmKRJKBlczJeENEnvWCnAUv6UD9DTNPq0xvnba
 40jUw1oFpEv/xKM2R+QwBbLLgy9OrsFHeB9zzOm+KQFDYDlt3JdXLG8L4IZ6yCaN1nXaOcThUH1
 3cvf0kfRCFXbxD9vPn76H207LYZEcp+3VmuyB20FemfcLf1Wtm6RHu6P32kXD/GH1vu1WtVirzP
 22vMgyCM/UX6FYEhoRw==
X-Proofpoint-GUID: URfxpQLPJz7ogX4o-DgEt6os8ByYPhDF
X-Proofpoint-ORIG-GUID: URfxpQLPJz7ogX4o-DgEt6os8ByYPhDF
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a41fd1a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VdTWikP8Db9nZ3PMghEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114828-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:srini@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:harendra.gautam@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 893196D5F7A



On 6/24/2026 1:50 PM, Konrad Dybcio wrote:
> On 6/16/26 10:13 PM, Mohammad Rafi Shaik wrote:
>> Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
>> front-end links to backend codecs.
>>
>> Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
>> the QAIF block. Keep the node disabled at SoC level; board dts files enable
>> and consume it in subsequent patches.
>>
>> Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
>> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 46 ++++++++++++++++++++++++++++
>>   1 file changed, 46 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index bc4ad2bcbbec..e58c87fc8cb0 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -2017,6 +2017,52 @@ dispcc: clock-controller@5f00000 {
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		qaif_cpu: audio@a000000 {
>> +			compatible = "qcom,shikra-qaif-cpu";
>> +			reg = <0x0 0x0a000000 0x0 0x20000>;
>> +
>> +			interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH 0>;
>> +
>> +			clocks = <&gcc GCC_LPASS_CONFIG_CLK>,
>> +				<&gcc GCC_LPASS_CORE_AXIM_CLK>,
> 
> Please align the <s and "s
> 

sure, will fix.

Thanks,
Rafi.

> Konrad


