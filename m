Return-Path: <linux-arm-msm+bounces-80414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C1EC34B1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 10:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3846A341106
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 09:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20D32C21F6;
	Wed,  5 Nov 2025 09:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CeGv7ysD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QYgG/wr8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BED261B64
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762333780; cv=none; b=DUex7SM0AiTklWDTy1bmlGvL9VH3QCoOQ0PmIAjKBtVA80BRemzpVJ0d3Xk26srRwjqv84zBM1N+KeoqCQn+QG6vnX1+l8G/qEuPv7+FDqDjV8Bu0GJGhXfd0/RQLgZZoRT4ViBTY34DrvTvP8h/aBVuz9WyaZocpIFh0H3CP0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762333780; c=relaxed/simple;
	bh=DuyibBwlS16eTmbuqE4VFLviK3weahnDnhuDAdd587E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXvmoTiWkI9b7hr3iGBewn9HlmQ/ZuXnfntaOw6UPOVxV17o6soIAEMLUnohWt2jwo0gqsci9C2rQJJJBJoGFJr3nb/boAWBhW8DgzJO4lO2aPIy6O/Up87pHTwRkT+xxQEbE4HRCxDIiqW1ktmYfjCTHQ0DHNY+urNKuN9Vz70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CeGv7ysD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QYgG/wr8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A571dYp051269
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 09:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nK7DC1IMtSjbTQ9eM6xGUT/x7vNfyLmo7q+p1AF+pTc=; b=CeGv7ysDx9vEl5Fj
	aMqMyyM4ecNJjpH+EvWJxm1G2o3tj49/ZmygOxzBHGwLTngNabXrJkMnmPPhv9bn
	+7wPceXBWfc3szHNzKWmrAqUfz+epWnW87KuCD1uMRsrQec5Pe18ClnrVtasJPhS
	d8YVjWl02vHQ3qjnhBJsqAy3NgUHzkTeYxy12JwNGy/U+NRgripwa6JVUKFO6Fb2
	TdcAQAC1Zco251JsuBWWnsKo4lUnhH2rGUBIkBZ9e3SQmZE7M/81VO1EmKaB4Qk3
	Tk1+sD7uX2DxVYQ0007knodvUWBT0Tbfo4O84h4j2qybyu+thCdDaflJ/inngERe
	Xxh+ig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a81u0gbqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 09:09:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-826b30ed087so20348026d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 01:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762333777; x=1762938577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nK7DC1IMtSjbTQ9eM6xGUT/x7vNfyLmo7q+p1AF+pTc=;
        b=QYgG/wr8ApOnyM+VlAzE183l7DBU2Jd+ikGKKLnMoBi9/qPgTqL06K+sXBKT9gF5e/
         0v2hl9BhTIwCfa/ye+iSO74urb/1ZT33Iig3AC2VGuJzlEwKVhcMCX8cRr6/1s52yN1u
         BfcjOdLq1Rtuj455d4Zw07rt4EpOmmVlLCdM4y4Bx2vyIJWLbUPGmXiaZZMbPm/ACimG
         oVpHLSI4VHlRTN5LtBmUCLybuvxwt0Zkh1o2DM+QRqECbB05djDADoKE8LUn/ybhYSZq
         EwjACtuOIZzYgKd27Visy8z+ARZYEoNNmVpm3Mw5jB794LitrPmDAJ5LvS+qFIs7W5c3
         9Aag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762333777; x=1762938577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nK7DC1IMtSjbTQ9eM6xGUT/x7vNfyLmo7q+p1AF+pTc=;
        b=hnNGi8vhigXVo8OLE3KubDebHfgDsD4RfpGdiuBqfRPJfPQ2gtGb+HM//l2PkAOPsL
         uLLEoPwVaYj0jUI74p90hm8tK3gGvQyaKa915IZU4d8/DCFVXNuz5fXzaMlbuPmb2aD5
         CjhCCnX3Fnp3A8MEOtKlm/GsM81esv9V4Cn2cUtTTWwHsV2ntVnaDzuHk62lOpyeLruC
         kguGVcivCvAXKz7A+gmIUf5DtYA93+TZWs0xU2QK9fi5pay7USuubLSuaZGHXUEvajXh
         NNsxwqlMV4NkNkS2lYN3agDQ6ViBKGGHvJDrRhPU2yD/ejAK3rGHaV8FrZXODDplOpwc
         BzKw==
X-Gm-Message-State: AOJu0YwFflIaM78RGBRDLtxqtwV1HA0L6fYkbHf4RgLNt2wR5JhgK9VO
	rIy6h4kl4I/Al8bS3d1wP3U5rcXaY9hyZooGy6f31dEuDigA91M3sF0mphRBfCgk8KYLNf2Jkxk
	zEykUY6wEnNhrA2w+MR04D6TeVYUb3vCy46dsE3JCJdjN6OqyqWCE+n/XRecTRJSNxMbf
X-Gm-Gg: ASbGnctguxs/twvYLRG00Zyt5HafeIF5YjVD9ZW7+AmWN+14xDVLSi8t69qrpcRmyvL
	fxrx1CeNISGFgI1qc8pHtdH7so4IIQ13nVwcv5d1Z4tSpwIBTUTWgptsTwSWrs5bzWX92Em8NdK
	jUVuYF/bZv64tk9pPOaOt6aJVgUzSuQ2aF8A3GUZOpGMry4gP7G1FJlb+proVLwGUDCD+oOPOfc
	h/z2gcYVAc1Qany0rRf5Swoa1MLJ9xNgDfEbfHEhLaD4uYrACaaIwrWfaxbnN0DvVXN6oo9UjG9
	zJvXEJqj+kRZOnhIHJH/OIy+tyRYrqRw04bpgyZSRhDXP3RNRFH3yooD/ve4LfIOSFIpp1Uug8M
	O/j3bngL/tf4tcJ0LY6Z7fnVbfgD4vp6HV5w6fWz0MbLR+sPreANnaWQh
X-Received: by 2002:a05:622a:1a0a:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ed7233253bmr20208741cf.4.1762333777426;
        Wed, 05 Nov 2025 01:09:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ8qazVdRxb2HPWUGZnt0hJ3G3Yu31pg3BrDUWBi9VZDTTGHvUX8RIKyYz1xHi/Pys6k6MmQ==
X-Received: by 2002:a05:622a:1a0a:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ed7233253bmr20208571cf.4.1762333776901;
        Wed, 05 Nov 2025 01:09:36 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a5cb52sm4081058a12.23.2025.11.05.01.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 01:09:36 -0800 (PST)
Message-ID: <7affc5e7-14b9-4959-9943-40e416f64d92@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 10:09:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: enable ETR and CTCU devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com>
 <20251104-enable-etr-and-ctcu-for-hamoa-v1-2-af552cfb902c@oss.qualcomm.com>
 <25b7abfe-1881-41e5-914b-ee16ce63ed3e@oss.qualcomm.com>
 <8a7dd1b4-505a-4507-8cc1-75d955c706eb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8a7dd1b4-505a-4507-8cc1-75d955c706eb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gI4zzuke2gaCtRaoCQOYR41CNn5eQ2Be
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2NyBTYWx0ZWRfXyr+nKweEFnB0
 AQVlPJBJaFq+fnAAo/IvCwYfPq5djR+NHzpQmCi6fW6YKyxPeFGn4ipWjPU3DlwPaxs8EbDGR87
 T+Mogb3IS9dpZNCDDD9RhzKMhgL6x8BDp8kByfPBTn+P0hZEhrB+xVbJch+hZMsV1OemHKmMu/Z
 3wevBdWdiglSCaKUyYobjCqDVC4LPHpC8XZjQF/S0M4yNui0Aei64dxeBaK3aaBD8Sqk3bKQt7V
 NPI9FgsIvvvOQWy2me/Qm9oiDq7YLo5gjhnwsrz5gE+PhgfzOGw9KbTEk1t9ogL5ANei9GNKiiI
 HFGLbqaPL/UWYaKntAI9lMnAIsGCMFfWIt3/Lwxe2Z1uotRi0uwokZxefC8Lmbehj12OtfAB/dZ
 YRb6NQhDhys1q78nzOdbqU8CnZb3yw==
X-Authority-Analysis: v=2.4 cv=KaXfcAYD c=1 sm=1 tr=0 ts=690b1452 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qzgm85ZZqHKQ8I3g2P4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: gI4zzuke2gaCtRaoCQOYR41CNn5eQ2Be
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050067

On 11/5/25 2:14 AM, Jie Gan wrote:
> 
> 
> On 11/4/2025 8:47 PM, Konrad Dybcio wrote:
>> On 11/4/25 9:10 AM, Jie Gan wrote:
>>> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
>>> tracing data from source device.
>>>
>>> The CTCU serves as the control unit for the ETR device, managing its
>>> behavior to determine how trace data is collected.
>>>
>>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
>>>   1 file changed, 159 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> index a17900eacb20..ca4a473614ee 100644
>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> @@ -6713,6 +6713,35 @@ data-pins {
>>>               };
>>>           };
>>>   +        ctcu@10001000 {
>>> +            compatible = "qcom,hamoa-ctcu","qcom,sa8775p-ctcu";
>>
>> Missing space between after the comma
>>
>> no issues otherwise
> 
> sorry for the mistake. Do I need send a new version to fix it?

I think you do since Krzysztof made some comments

Konrad

