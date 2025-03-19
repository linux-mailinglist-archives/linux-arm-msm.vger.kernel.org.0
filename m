Return-Path: <linux-arm-msm+bounces-52020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 529E0A6966D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 18:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0CAD19C2ECD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 17:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4031BEF7E;
	Wed, 19 Mar 2025 17:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lhCoWHCX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0245D1E8322
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 17:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742405333; cv=none; b=tmDvLLZxeTKM/W3hEXeXEN0IFLN1I8fiJZknkyn84ueLKysSOeWGWQTUCN7J15gJSWi1T50UQTbiWaMkupvULztT8GpQ30vNEo7mksMsIOJ6v4OfBs6x5HXxmkRc8DoAbUKQxxbbtRG2v1xvVhNSuOqvH8RkUKTu0y58KNlum6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742405333; c=relaxed/simple;
	bh=CWK+EArxHVvZhO9jSHqbQevs+LkkMH0t7GTRwoUCTc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uKBbG1tXK8QbvEahMS6hBg+M2X5x8AZg3FvG5zmMjeOxCPyltYrAWpbVlx9MeXgLfcjkeyxYgX37bVJaB5eWy8qciG8dB/YpQxd0gF1b5qwN4Q1ru8arcRUmd2JEGN6W+RVswp9A5TSYRusdHC4AWp+jidnu+N6poQNVca+uD+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lhCoWHCX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JDKfFV013137
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 17:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdbmtSFf9LsX0Hod50MXJ8Rpn1iGHT3/np5G+JKs7cU=; b=lhCoWHCX7qe+rVwX
	LqmV72JQOzvBnoG3aA8+g2N42668uUZSOLOtRgALRFXBdKuvzlehaeBL87CfUU2R
	9uV/p/CyV9n3uO+k43dNmm7407EQLpHQNDRofDYbfAa68XUJocbik36mmzVKfOLf
	dCz+XQIIBUz9smyQpuu0neKfMGend9fneY5Wie95bq/uYbzWpWqmOZmR3U1l/fuy
	dU2YRsc1lHIGw+Qo08MN3uBZ1uUezWZr3kjrCcPxU9/FcATI890F4qbCatEMrwri
	dcXLSIQ1yhr4BxpgXr+ToFKYV8NFpM43LoqCwljc93jZ20TZ3d8vqSoCgdQAMSEs
	uVi+PQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtpbut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 17:28:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eb07043f12so7418506d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742405329; x=1743010129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdbmtSFf9LsX0Hod50MXJ8Rpn1iGHT3/np5G+JKs7cU=;
        b=VR1GtvHgB7TP8MO6Va0fnQV5hvIlcAsx69wvrV/7vLMUUCJJBIhMHAvZ1AoFDRjoXG
         Gl1g/C8gVY/kMFTsGaRM0oWzkSOjDLim7KN0THt3r48F+yWMJ6/7WLQCtbraHe0KEekQ
         3CUCJPhZHKsD4xEuKpug5D7MeRejhzjmjPXdod9y8dYdLvKypuxHB4By4pbCPiy+G6Fi
         QirwFAeHB6LT4+EvpbiJ/wc3ScSNfbUDL1tGmIEq4y9eKPDjj9LZXPWsEcFJIPfG/ik7
         jlf8BFLv2hwwQUDpNHHE4TbdQbPpap62MH3x4DEspzH0wStEHyJOaysbPuJZ2Y7xdJ4b
         RXrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE1F7b9qYHWXSai60055JZQPYdS9ljoALW2uDtKNEFFijxTsAIytp7T6qtiFClIMwX5Hg9LuHnWT6W5C8A@vger.kernel.org
X-Gm-Message-State: AOJu0YwvgA5cLNt6J3GySDQ4XEVTWrUfr3ZakF+f8tC2IPEfdO1ioRM0
	mBjqm92T+XAw4bLkyjpWBPZvWkLrUXzUKeeOE+FUrKVPryfolTxTo69FFofu/rcAcUkEhBni0sp
	devviG5m6BHDOcYWI/HN8ppR43K69rcBLjuQdS2eLLZtlotSnJXazZ11L9q1EzMUN
X-Gm-Gg: ASbGncsKJ0J4RSqZzzT03WnxRblmfMfRfoxhBuB8O7loM31p3Z/rnCvSccn+gXXg1xd
	9gLbsAkLegetpsJBMkx25Yble1zxzYPMBuXPNhkUuErE+Mm1Ml53y6KriM11dFyHOn2CRDDWNSB
	jyP3EW6FU5dPtBonBoFIXH/x09fJiPQ1HqRYkZwJQ6DqsS11XVIorNribhNLG/cxb/LoXeRZOZn
	ZPZJo+Tbp3Tu6nQfkhpDhtwgxm5UaqCfRri9U6fLNdiol72kf9qZEGzYxWmedbjjDJvRJl80QXQ
	QODc1N2lRch3qiZps98iI7vriKISO1zp4yfYK78fel5hsUUtaEB/Ab46p+mEBVay3hfr6w==
X-Received: by 2002:a05:6214:f0a:b0:6e8:fe16:4d42 with SMTP id 6a1803df08f44-6eb2b93945bmr16243076d6.1.1742405329514;
        Wed, 19 Mar 2025 10:28:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSxO9Ad8Gc8/z7Se2G1kFx5n0pPSkG+JyMNgf9vIXCx+1ZEU+MZgfslIX3i34qdI2GvBa3LQ==
X-Received: by 2002:a05:6214:f0a:b0:6e8:fe16:4d42 with SMTP id 6a1803df08f44-6eb2b93945bmr16242886d6.1.1742405329200;
        Wed, 19 Mar 2025 10:28:49 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147e9bbbsm1060035466b.54.2025.03.19.10.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 10:28:48 -0700 (PDT)
Message-ID: <05e082b5-6ae3-4d25-af81-f2c3b664ad7b@oss.qualcomm.com>
Date: Wed, 19 Mar 2025 18:28:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sc7180: Add specific APPS RSC
 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        Dmitry Baryshkov <lumag@kernel.org>, Arnaud Vrac <avrac@freebox.fr>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250318-topic-more_dt_bindings_fixes-v1-0-cb36882ea9cc@oss.qualcomm.com>
 <20250318-topic-more_dt_bindings_fixes-v1-2-cb36882ea9cc@oss.qualcomm.com>
 <l4vd2xmrowmmtefieb4cbirq6ntkvnwbhtpxcyzwdeok2vgtt7@zqgqndumgecv>
 <881655b5-30c0-42f3-863f-5b6606a3e2cd@oss.qualcomm.com>
 <rg377etwxv3yupth3acak4ycthahi7sennm54sbah55yqj2qdk@vip4xxkbsp7n>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rg377etwxv3yupth3acak4ycthahi7sennm54sbah55yqj2qdk@vip4xxkbsp7n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: basLPcpThpjAZ1W4MRViqQYb5N0YcqK1
X-Proofpoint-ORIG-GUID: basLPcpThpjAZ1W4MRViqQYb5N0YcqK1
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67dafed2 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=rhAqBTIILTDuOorn4egA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_06,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190118

On 3/19/25 6:25 PM, Dmitry Baryshkov wrote:
> On Wed, Mar 19, 2025 at 03:14:42PM +0100, Konrad Dybcio wrote:
>> On 3/18/25 10:30 PM, Dmitry Baryshkov wrote:
>>> On Tue, Mar 18, 2025 at 07:35:15PM +0100, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> SC7180 comes in a couple firmware flavors, some of which don't support
>>>> PSCI in OSI mode. That prevents the power domain exepcted by the RSC
>>>> node from providing useful information on system power collapse.
>>>
>>> Is this behaviour specific to SC7180 or only to ChromeBooks? For example
>>> TCL Book 14 Go or ECS Liva QC710, would they also use this compat?
>>
>> The hardware and firmware representation of the RSC is identical, but
>> I wanted to alter the bindings required properties based on the specific
>> possibly-chrome platforms.
> 
> Should we instead have a separate compatible (?) for ChromeOS platforms
> only?

No, the RSC is exactly the same. Quite frankly, the expected power-domains
entry is just a way that's convenient to Linux to signal the platform going
off between the drivers

I don't think there is much to overthink here.

Konrad

