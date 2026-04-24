Return-Path: <linux-arm-msm+bounces-104408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FXEF7k062nRJwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:15:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6513A45C026
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 11:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 024AC300F1BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 09:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385E836165F;
	Fri, 24 Apr 2026 09:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I95i7iP4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9fHW5ar"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEA831A556
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022134; cv=none; b=EMJWwKsFHplkb23krF8u8lD3h/KESm2I83DoQpHOHBTZvgIbc59SgSvXjuPGQCjXXiUR8WIBbKT5FUtMR0oWbfC9lSMc7ir0BZZ5c+nYFAUoEK6eQeKtD4Jksr2SMs109svERreMC+Vq4ZgRS1OXjoN3GE7mLWadRIOSPZ1z7mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022134; c=relaxed/simple;
	bh=pTBRVxO8jeuFs5lxPvnhQS20M92lgzCTdbJXvtYgC+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUlagiGijRZ1EEbcZ/I3KChaOVNb8WVR3hehBLlYuKgmqOOwVBlQ5RdTJBJ7BPhDFb+yHCNgh3IU9uHEQpRZnly6Wpry6jT636ZD9Hx0FYYxmJRitybjxPEen+CNSapKiq3/0npBAkcCRoaRlcLOYeuHJgUuGJBSdRE8RROaCUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I95i7iP4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9fHW5ar; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O7GNFX1822941
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hz4yBNWVXpTZtnTz4q00WtX2xc5Xp00z/onQNDMKC3g=; b=I95i7iP4oG+gGPFD
	JIS0uM78vwoDEbNLXCXPjonwPqWtwFGsqrszVOBwn54VZ6ujF0Y3NiwD11MB8FNQ
	4haObfgEtm7ME2hlNqcHFdKOgvRnmsNXRcwY2owjTj76M0CUMKVwGiOtpxdrw93i
	J8/WeFV3mHRDEg/W95kod0u4ptCODeXTZjZSCGkWo1XtDS2N2gK0F9oD4UjpTuat
	wuhPxl8SmY5unaHQMILWxrpV5C6SxQRM7rPXN9EA8vYdP81DR/VJDmiBBCqHQTvQ
	Xu1Gk8XcSAzst9iEzXoxc1bF+/dcbhmnd/QwNDH+E10wv0E9hfdE00Ijpin7hgh6
	aGIBjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqv5rt41f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 09:15:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ee2dfd63beso52985585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 02:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777022131; x=1777626931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hz4yBNWVXpTZtnTz4q00WtX2xc5Xp00z/onQNDMKC3g=;
        b=f9fHW5arvAECs/3Pe18+OF3htJEuaGZYZnE0VW9BPIT1yzNkbebkZlZc07vzDejA9O
         U04lxE2XZdDcSkx9TcLavMu7Y5g1NeOKsJIXsDzxItdjgWJCyS/hvMPpdd+doR6Fj3Et
         wTqyQGV4vl3qbBCZqk8fBsopGWmg/yBPTeNvO9gvuxDZkyR836G+KRd3DZEklIWoPeEu
         vB+cqHWRNxxzPc+vt+bvKKKSd1GvLwnSEVQuS0H7lKygYsBiRI55uDx/PFaxgNiU6WRZ
         deShNBc8kVRIFvZjU1ORn/lT/E2iB3bJJPHV1ACLBWgb//yemeEqXMH9Sn/1ZWwSLHQ2
         hm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777022131; x=1777626931;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hz4yBNWVXpTZtnTz4q00WtX2xc5Xp00z/onQNDMKC3g=;
        b=fOvtBKlB5bgTjQVKQ3tzL+4wvzNYBz65TJ8y/YRWBQKYY5r8TdbslbM0ejN0+3EL5c
         6XKTZRY+qWyd6dU66zD9vn1O4m6DOCa8kR7BN+enh6Kb6+wC7HNNjZQ44ky/EuUONBtq
         ACl9UUBbjDxz5pTBNpu9Nth540P7VYzKdBOnqeMRjieJTZuAkv2eKkyJVUiSbUkWfmks
         lTt4KroVqvboMM1T8lj0NoegjF+J5XsrNwd/9wNnZR5Wr55J4f4vAFE+dWj+jmda7ooA
         l3HzKH7hgMkT+/LyYYMhWOL/A5PmdCmGy/PtDY5de928M+joKAYFFZP/wrvQk/nO0X3/
         8F5A==
X-Gm-Message-State: AOJu0Yw+t5dRu9g9WISa3iHCCWViZ0Pt1AMz1g+j4c7EXI2kxGl5R2NE
	3VCa2k1/kakHvebN6+rGZtolLPSM3emgj5R4L/zE2VtTeG1cQ8DxpvXCHHzS+AMbM5ypp+tb8ub
	v4jzuZ1uYNu0/xZVLAI6PNld0UAG2Czgi3nqSunH3NfrRL4SRPSEUUwuegXcqUM2A3Dr8
X-Gm-Gg: AeBDiesrBlg7kbg3xZ21CF/IdLQH98NjFcV1KP70qwcVpD5MxBIBA/9TB6tQnmos1PW
	WV+gFTQy5uySaniEpWdrtJon9UUY6uejqq6Ng8LLT9/4I5paTaQLcUab30/jDGZOp+dBR0OYqVs
	b07ZGq2Gp+POevX/RB+DDhBA7L+eg284HP+gFUS0szIzKUPwhZN4UuXxsWeuZAj8Z7cTi9PHV/R
	6sh5D/2u8u7V/3kzKfz+MSQlEtCiit3tO+TeZXCSEDKK6Ym+JFbgYnD+/nIicGp7DTyhulO8ZkS
	NX5WSymEVuJGPK0fiyaF4ksHsd7eoxJ0mwBBkgo7bcaEespga/0X36nCVDeDa6o22T1VYUC/Tjy
	yM7o9t4085bab0eGBERBunouMNXcbLOp9yH+p5roPJOQwEhIXWYuR0KdiaUDcJtIm1BgCeJjABN
	+yWlsg08eIAKrgGw==
X-Received: by 2002:a05:620a:2304:10b0:8ee:a1d:bac6 with SMTP id af79cd13be357-8ee0a1dd0f2mr1120924485a.4.1777022131359;
        Fri, 24 Apr 2026 02:15:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2304:10b0:8ee:a1d:bac6 with SMTP id af79cd13be357-8ee0a1dd0f2mr1120923185a.4.1777022130819;
        Fri, 24 Apr 2026 02:15:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67316a69a46sm4653881a12.1.2026.04.24.02.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:15:29 -0700 (PDT)
Message-ID: <7bd0105f-7e99-4799-a778-56f0131ee79b@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:15:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: qcom: Support Motorola Moto G2 (2014)
To: daviewales@disroot.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423-device-motorola-titan-mainline-v1-0-e1813a028cc8@disroot.org>
 <20260423-device-motorola-titan-mainline-v1-2-e1813a028cc8@disroot.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260423-device-motorola-titan-mainline-v1-2-e1813a028cc8@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LqiiDHdc c=1 sm=1 tr=0 ts=69eb34b4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=OQN141zOAAAA:20 a=LpNgXrTXAAAA:8 a=EUspDBNiAAAA:8 a=QizVoDLDYLmPXa_Hf28A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=LqOpv0_-CX5VL_7kjZO3:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: V5vdaekjvqf3vNULqG9rFlUfxmFyP0Ou
X-Proofpoint-GUID: V5vdaekjvqf3vNULqG9rFlUfxmFyP0Ou
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA4NiBTYWx0ZWRfXzrH3yjy04r6O
 fA4XWiJ/NRjHSP4bvgLwD1p/AWhWSOFVFXqcC7XtfbpwochEa+1MNXTGy8THbiFvKTqvn9pKxrx
 egp+/hEc84InZnhWRyYe9c0uKl51/bX5HpRvTivrKvuDFa/9AWOXw1xgKxTwRhBAhspAfoX53Lr
 UnEIa0z+hPzVH0AK/HeqdxXyQZQiL1YnwB2mU1poEfEHIHxkJEN4mYMFwYavFZY1J0eFwT8Ffvh
 7CmSIn0L8Nz6sq4KWbvnv2gJIOYt7PtfPZvd1LhqZyT3btYlScE1pjGxRe4lkntpe2sD94OtDJW
 0hW1hxPgDPrdndxouv7PHpMhvEui9bj5XG1QYElaLlUqiQ4p01NONyCvPo0zzq8Mk6n9GGxWXT/
 f8XCdhwPy8unqsKdVisRaIikditzgeUsLLFGDBhad8vZY5LcU8QpCwc0E9miBtsmguUdWXMLbVX
 JGQJJBtWaybr1+2xqNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240086
X-Rspamd-Queue-Id: 6513A45C026
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,disroot.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104408-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/23/26 3:24 PM, David Wales via B4 Relay wrote:
> From: David Wales <daviewales@disroot.org>
> 
> Add device tree for Motorola Moto G2 (2014) (motorola-titan) smartphone
> based on the Qualcomm MSM8226 SoC.
> 
> Initially supported features:
>   - Buttons (Volume Down/Up, Power)
>   - eMMC
>   - Hall Effect Sensor
>   - Simple framebuffer display
>   - Vibrator
> 
> Based on device tree for similar device msm8226-motorola-falcon.
> Initial commit for falcon notes that dhob and shob reserved-memory
> regions seem to be related to a Motorola specific mechanism. [1]
> 
> [1] https://github.com/LineageOS/android_kernel_motorola_msm8226/blob/cm-14.1/Documentation/devicetree/bindings/misc/hob_ram.txt
> 
> Signed-off-by: David Wales <daviewales@disroot.org>
> ---

[...]

> +&tlmm {
> +	reg_lcd_default: reg-lcd-default-state {
> +		pins = "gpio12", "gpio13";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

This line will keep these regulators always-enabled, until (which
may perhaps never happen) the driver takes over, it should be
unnecessary

otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

