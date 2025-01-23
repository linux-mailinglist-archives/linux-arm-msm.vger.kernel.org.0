Return-Path: <linux-arm-msm+bounces-45965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DCDA1A3AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:59:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B71B18819A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27BE520E306;
	Thu, 23 Jan 2025 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DCozjR71"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A186229B0
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737633581; cv=none; b=BgUOC1OQ9t+H9QPDYAN/9UIth0ZafvmLC78T5no6tXCY3ELrRlQlt80azWMNYyE7tjJzC64IIOWFd5XZaKIzyBrz2p5r0urBt9tPCuzObYS2tH9+TMGyD0wSwXXSgAeizlBq1LWEsC22uu3XSY0QRuS2YXLkwvVsHgO6B2aGkpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737633581; c=relaxed/simple;
	bh=lQiYTjEY3RXRkLXX0bIfEPjtCykBnhhJXIG9IIm2IEo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N6U30xub2bEAKcNWWR062nNVsnOiBAxWEMTz6OzH+Ube4O7HF+ciLSGInqO9dtAusPXY+ddTaiTBfe30w7Zk5SHhHMNaSVuPRb98iJP0emgEoxSx+vIrmPw2PGRkeOnUQURIKnLqK2/kurahJen1gi/go+haVBEd981i2uSUOGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DCozjR71; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NA7h5G010919
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXGd4w7cLYLsVkVkk1t8XotN4LpsoRfXv7P5SgJ0Zs0=; b=DCozjR717wo0iRWC
	ygObWPDSrnNO7hn+Ku/H2CiwQLgFOpczLPU99s/qZexZarO+u48jdneM0rgRVc6i
	w9v9+jQl0F1zn9JSYqd1AddVA5HltM9FNDnAin35cvAZsOcFCuzL90SZId9kPaOs
	WEN4aUAGsGBsDOtrvAeHQ7YtdkRa4/nLZ0VVXp/jbT8PZi9lIue+csRM9MVM/tSl
	p0AwskVBDJd1bTWPMogoYXN3FYld9uT1XI2SNOYTbltE4485nOCtNn1Lx+3yuTyB
	EJBwkCw9Q7s6N/8R77ONEI5lG9ZExOEaGXzno6daevr0E+M9f3q8rTas5EvGMeh8
	LPj1Ig==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bkr8g8fg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:59:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d881a3e466so1128346d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 03:59:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737633577; x=1738238377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXGd4w7cLYLsVkVkk1t8XotN4LpsoRfXv7P5SgJ0Zs0=;
        b=j2GJv8iu2YYNhDdL1ush2DqORInphGozDQ4+TtGWqgGEx/u6Qi0NX7XkGbbswYgj7+
         cTZaD5FmIWTsd6e1Iqb15nn3JyUQukdQH40q/vOfetoVZSQslTW00L4kSHqjpAXuIaOO
         Kc/RpO36xOIZe0kQcXAPF1VWlgsi7gSywjR2mkpSJZyl3DAqnIjtbWPSKntvlFCtNWoR
         hB/JM+o7y6n4HbWMESlL7AHaJFkFZm5NQD+sTJTH8dRw3XfYKdIafTb5HbNFD0DsGGov
         xAqFLwXlrkflC4ovkXLprgzcTB0ATquEA3I/voGavyAxU1I+dqan99znbSBTDQCJrZKI
         4bvA==
X-Gm-Message-State: AOJu0YyKoa9C+BhERjlddaqiZgDiF2kB16b1qSvlktMtxxiXCmfninSc
	IFa4j/+r+NvZH/GqRnLXKGtjcvfiT1DZpPSraKmM2s8C5+p17+YK2yPP+FWvuX4eFu1BPLDrjWY
	cs+YA79ZeIhzw7k3axVtxxFOfQcjwIicOajyphgTAjR4Ds/Zied1X6cZKbRes8xEfritmPB+L
X-Gm-Gg: ASbGncvtvykluOkFOuF0ea8j4joq2D/BWkHpXaVi1q3sNVotk10zRxNu0lwXbg7HkMW
	vNdPb3ZTkC+jxgxh9vXP/75T+l+EdTIYZ/G0fpDXs+psonrZeLJOGc39qM6lScmF2PpCGvDxArF
	GgNYZzkUkHBlzvLT4wXYDTn3OdkPV1G8fXNAsaKEi66yhXgp5oE8u42BODBYedb6ts7svKf6Xss
	QZ5zoBMT2lJzH5smcEtHfFbWivVekydc/p04CM+uFHlGFb+pk+KLPHbON+PsUwTLUvEDrtV8nP3
	i1nGWRT+pH9F0Vt6kpz5/Q33pJt9/hS4bJvBIeyduSQutNBb
X-Received: by 2002:a05:6214:528a:b0:6d8:a67e:b2ff with SMTP id 6a1803df08f44-6e1ee731234mr38969176d6.8.1737633577355;
        Thu, 23 Jan 2025 03:59:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8W42bndH+Tx3Rpbi9b1HXVwp/kXbpWQSwyBro1jIhQlIiJW0rfoo+cJ05uocTDr1+hfh0HQ==
X-Received: by 2002:a05:6214:528a:b0:6d8:a67e:b2ff with SMTP id 6a1803df08f44-6e1ee731234mr38969076d6.8.1737633577014;
        Thu, 23 Jan 2025 03:59:37 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f22c75sm1042610966b.88.2025.01.23.03.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 03:59:36 -0800 (PST)
Message-ID: <bc0f90e4-dc66-470b-a771-e52e451aaec4@oss.qualcomm.com>
Date: Thu, 23 Jan 2025 12:59:34 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8650: setup gpu thermal with
 higher temperatures
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250110-topic-sm8650-thermal-cpu-idle-v2-0-5787ad79abbb@linaro.org>
 <20250110-topic-sm8650-thermal-cpu-idle-v2-2-5787ad79abbb@linaro.org>
 <8fc3b958-5c2f-4c79-8dc0-d1eec9f5e47d@quicinc.com>
 <56023e4f-d60b-41c3-a3c9-ba768613e9b2@oss.qualcomm.com>
 <de6a6943-11eb-468a-b6c1-406929c576d3@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <de6a6943-11eb-468a-b6c1-406929c576d3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b4-dHqDH4S_7652ogin3tBVBk8i6Pi5E
X-Proofpoint-GUID: b4-dHqDH4S_7652ogin3tBVBk8i6Pi5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230091

On 22.01.2025 3:09 PM, Akhil P Oommen wrote:
> On 1/17/2025 2:50 AM, Konrad Dybcio wrote:
>> On 13.01.2025 11:28 AM, Akhil P Oommen wrote:
>>> On 1/10/2025 4:06 PM, Neil Armstrong wrote:
>>>> On the SM8650, the dynamic clock and voltage scaling (DCVS) for the GPU
>>>> is done in an hardware controlled loop by the GPU Management Unit (GMU).
>>>>
>>>> Since the GMU does a better job at maintaining the GPUs temperature in an
>>>> acceptable range by taking in account more parameters like the die
>>>> characteristics or other internal sensors, it makes no sense to try
>>>> and reproduce a similar set of constraints with the Linux devfreq thermal
>>>> core.
>>>
>>> Just FYI, this description is incorrect. SM8650's GMU doesn't do any
>>> sort of thermal management.
>>
>> What's this for then? Just reacting to thermal pressure?
>>
>> https://git.codelinaro.org/clo/le/platform/vendor/qcom/opensource/graphics-kernel/-/commit/e4387d101d14965c8f2c67e10a6a9499c1a88af4
>>
> 
> I don't think those TSENSE configs matters on SM8650 in production.

OK, thanks 

Konrad

