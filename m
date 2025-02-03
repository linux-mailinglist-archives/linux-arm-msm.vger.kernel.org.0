Return-Path: <linux-arm-msm+bounces-46745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9775CA25A59
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:08:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44C777A1A76
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6796204C1B;
	Mon,  3 Feb 2025 13:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oR2NBUKQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283E01FECDF
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588080; cv=none; b=ZsGsw8igcY5V9j3OdS68T0K7FlXDU6wgRv3erAxSDmqJ8F1RP1CPDSSHIs4FDtpU4LVpj0FgOMLGXrKBVgO9zTGj2GuGIQ5n87MYMluyJugE/fWLRPJ0vEbRZUqQrsuLEEg91xCZTrwcd466PENWj+BDs29hqFeH3p8tSEpWMW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588080; c=relaxed/simple;
	bh=WWw+K9LAmi9SdlLNI+IAamnYBiiIiqnarRUibDNdU+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u4UgfBAk9KHu/n6q5QjCT9CGTcHOh6DW3b7qLx2HD8zzv3aRYxk4aqBFow5xG9IUx/d362O3q+kAyZN6No9qo98JeJWwAnvaWAYre3kxOdUMfRse5Y5xEugAuZw1mn505G3d9fAVSeZQEp4GHrSPb/1UkDtV7tioK1DhtJtjXwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oR2NBUKQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5132aatX016442
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Feb 2025 13:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HHQbos0F5o8aVGN+bxdm35249+HKbFkE1Tu5vGmxSwg=; b=oR2NBUKQ7/7OVoEz
	75Z3S7Zi+G+LZmrUzGcpm86o+ATl/EufZiB0ZgLofGPG1yyLZiKL71K3kds4BD1b
	io5BosJk90tr2DaGkCLxHIk0fSSOZD1FLWIkjgq7SdRiuuJxAV1bUIb7PRqVTNmZ
	HgnhRWO7xsvt/2zjnkz3M/WbSF545hG/I/CRZmtuhPnEMC2rF9AY582TwJvqQtK3
	ulKJnUFQ3kYGUM/997y11W5t/wAxZ/5Vb6DOnYGGUVeEjF2j/1WP5nLv26CtfBDO
	3/EoGPka/7COUwWhQlCpimrd6gFwctpRzAlPU9TwpjXrEaYHu+78LcxuefK/4omZ
	ZV+zhw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jn5vhbkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 13:07:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e20cb2ce4bso15252826d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 05:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738588077; x=1739192877;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HHQbos0F5o8aVGN+bxdm35249+HKbFkE1Tu5vGmxSwg=;
        b=FwEBdp1jYA6yEt5MPLraL1RYuL8JV47cPPR6ReFXU4LAhOf5lS14HWTQYOA8HQ1w+Y
         q+zfacJW2xw4hRH/MTvIocaeqZtpmcvi61sKUARGhE73R1oehzEK2gpiPVRO7WnF5ksF
         t5V1hzI66q7aQtPGvH4bGqCm3F93qJ+KR/VS+EIPs5dt1IM6Qn/yRqzHpaPLVf9vikLR
         sj+Z/Adgc/BzCpfZkae1AGcZEx0MbLTFNFaL+XONmzdhhX1UqGuaLOBk1hXGqSJ9h5kY
         kY0GQoRdut/LOnSR+zIVK3/+/ioJf7m7dF7vKPIrRtqKb3isvpqHwad/Y96uhV2wr7P1
         wNpA==
X-Gm-Message-State: AOJu0YwjHmt6TOG0IIsozFEfBYnJTcpXsoq0x8Hm9r4sB+Vkjoz+jFpJ
	QNEKtZUd0ZttaPdWUHyVWxLRQegdg8Pa7eYZy8AZvi1IwpCTqtVkL5OdAC06tjyPGS5hx/OpmWu
	88qFkB9GYRbiD6xRY707naPcKj6SEW/uvSk0SJbZr959QzoN2k/o03ycHEu88w+fR
X-Gm-Gg: ASbGnct7Wozt5S1WJeNEwbVwAifV4yFK6sdEZAdhXeo+CGafJx13CLO7BJFrDEonmEY
	QUNOV7HyjrQuFL9wnH/w6LY7Ueq7W8cxzeAyMWzjSJxilyUoB8oBkWGrJ+Y2Ofo9VSKgpSiy9vJ
	j4PqieJSTehNSJLajpYNFW/oSfBm6QZ1DncZpIwncQZFqO6ySi36eJM4z4yklP6enDbRWNNCyC6
	Xw+n1XOiBF+UVy2veMYSHHLim9YSi4WW9ZwUsU9Peasah6VOEbKwQM3D8IzMNYkzqFpqsi2HnKa
	H8iFYzbOQ/Mre1Ckubcn8RB0+RI6PkLN1vPwge0TZl90xA70i91IXVPSS0U=
X-Received: by 2002:a05:620a:2550:b0:7b6:d026:29f with SMTP id af79cd13be357-7c009afc404mr999176785a.1.1738588077086;
        Mon, 03 Feb 2025 05:07:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvZLxGFmUqIUuPB9CPetG+6orsrmU4X1UOL7phutO1KWwcJSP9Qy+xUEKLVon5cWbx4x4Pgw==
X-Received: by 2002:a05:620a:2550:b0:7b6:d026:29f with SMTP id af79cd13be357-7c009afc404mr999174385a.1.1738588076548;
        Mon, 03 Feb 2025 05:07:56 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a8268sm753013366b.28.2025.02.03.05.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:07:56 -0800 (PST)
Message-ID: <7fef1b3a-6b63-47fd-a3a8-346bded682c3@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:07:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8650: setup gpu thermal with
 higher temperatures
To: neil.armstrong@linaro.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250129-topic-sm8650-thermal-cpu-idle-v3-0-62ab1a64098d@linaro.org>
 <20250129-topic-sm8650-thermal-cpu-idle-v3-2-62ab1a64098d@linaro.org>
 <3db4b41c-0d29-468a-875b-eec3cced5aa5@linaro.org>
 <292ed7db-aa9a-4dd3-a887-70e0ccf346c2@oss.qualcomm.com>
 <82828c3a-ed8c-42b8-b603-bc73d3be7497@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <82828c3a-ed8c-42b8-b603-bc73d3be7497@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bmOyfuQBcQjdbVJP7rkzNPRoDnHsPr97
X-Proofpoint-GUID: bmOyfuQBcQjdbVJP7rkzNPRoDnHsPr97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030097

On 3.02.2025 9:23 AM, neil.armstrong@linaro.org wrote:
> On 01/02/2025 16:37, Konrad Dybcio wrote:
>> On 29.01.2025 3:41 PM, Neil Armstrong wrote:
>>> On 29/01/2025 10:43, Neil Armstrong wrote:
>>>> On the SM8650, the dynamic clock and voltage scaling (DCVS) for the GPU
>>>> is done from the HLOS, but the GPU can achieve a much higher temperature
>>>> before failing according the the reference downstream implementation.
>>>>
>>>> Set higher temperatures in the GPU trip points corresponding to
>>>> the temperatures provided by Qualcomm in the dowstream source, much
>>>> closer to the junction temperature and with a higher critical
>>>> temperature trip in the case the HLOS DCVS cannot handle the
>>>> temperature surge.
>>>
>>> Since the tsens MAX_THRESHOLD which leads to a system
>>> monitor thermal shutdown is set at 120C, I need to lower
>>> the critical and hot trip point, so please ignore this patchset.
>>
>> Should we make the "critical" trip point something like 110 or so? If
>> LMH triggers a hard shutdown at 120, the OS will not have any time to
>> take action. And 120 sounds like we're pushing it quite hard anyway.
> 
> 
> My plan is to harmonize and use 110 for hot and 115 for critical, and
> if available any passive cooling devices is available at 95C

sounds good!

Konrad

