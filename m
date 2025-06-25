Return-Path: <linux-arm-msm+bounces-62483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4CFAE8633
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 16:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA9371896C16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 14:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FE5266B72;
	Wed, 25 Jun 2025 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lo11exSa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B6226529A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861230; cv=none; b=SSIzKNVXm9pj13V04B2uw2Jy4aw4iNDdTZpWAmMiCYkD62awfr8ms5vBHypZy5C7dS3xcsQdIQJCgrUbhFVsJPxfa7At+nyGu7+GBr1C3kPdFvNXFrcx6kOrElhJ6IlJtIQy0Qv58PReFj5AZVdHIcUEiDDjhnNz/27r4vlFB/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861230; c=relaxed/simple;
	bh=IX8IaLLBnV9g5/7hPrzkuQaSZUqxCxGVjz89dzM3wTM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Htjx+6T8tvb37XGeFpDbvdd4z3gwk963K9Hsyd/Cj6zx69kk5H7mzoIu/AJ7IQnXmvzWfAN3JdFAXZGluNPC6zWFXGyg6vMxh29nxczCMrRTbYOBmAXN+o3/lR8SYQ0ixA/M+1CYScZBUotvk9NXBar868aLCmEbjmA3/r14Sso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lo11exSa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PD4S8p014612
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hw1xBrAtM4Jso28awVzsgXTidcI+QFA8inWaDXtxLIQ=; b=Lo11exSavx8WkwvJ
	Yu/eEOo/18a6VbBNyjft8DbbujY8vPooLiTD40Mxq1dZcqOIblu10zSMk1kn9V2g
	nmx0LcLHHDmVgJ/CgywmrqGq89dlP8Qqjxhvc12zgBUQId97f2IYOm1ZBHTn/9h0
	7wLO5uUXr4I3XLjRouXfYeXZtxZWOm/yawkO37zIEXTwwBnbal+c6mw3advxHzSK
	pCp51tc3++hk988ja/7fAvCpjEKmTPyuD13+g6L5UjEAbV8BEmKBaX+rlsbY5ia3
	ftbpYRO1mG9qf8zuwGwSZoQl9UTBMQ8NhNA6hIk0N2AqyGUrAaXzBLOG1LInU5Cv
	bptfqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq0d4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 14:20:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d094e04aa4so196502785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 07:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861227; x=1751466027;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hw1xBrAtM4Jso28awVzsgXTidcI+QFA8inWaDXtxLIQ=;
        b=WElkJ7nMXSQGn9Qg6HNLPl7axO1nfRaEKCIfVMBXYl9zIuQ89RJfRNwsEieoUAI55H
         EQW9W76fJknyMnUIv8mlic3V/Jd9hN1fNi/BGVpT4P+y/W2t8K1C37vCpkzpTqX8Ttn4
         8F4YDiIs88wDYI/qGgJm89ansOPqDciPFhjX/LyyhnOI5aZpOzU5+Ab+EpCxZx1hHE/F
         /Z9OiITP4lIfiwNgfyLjeJlg0XDslOo73UDwfxx4iIuOyNqujo1nfofIxviHZovC19GM
         nqL7o7iRrwG1K+itMmoKrZoWvbzHjodcfMd8kC/8tY+WERcGVwQzcgt8k1UUWt2ebkX2
         5tUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmd1XQPIOPOfjfv1aZ+/0R22ZmaxLzpE1M4xPMGMqZ+ZyGMbaLwWJ5atnk9N4NIK4DZgpwSFwuwCnOiNYY@vger.kernel.org
X-Gm-Message-State: AOJu0YyxKk07V8L7Zy/4PY7Fhpl8HOngDccArz61E5Nvp3dsZ0T1FLrU
	2cwaRHNwIAvvIqsXGicHdC4tAvqsDRZBjSwGh3+YfWdB2c0D+zdg+Dqod4eHsfJucvjRzQMJ38I
	h3pO9SpDAV8/WnWgHXySCG6kbZZagsjK4K+Fm9WLbLEQbKbpYQDqwgMChvWpfLGUvx60P
X-Gm-Gg: ASbGncvPUsUki06FCKL1laCvzwfyZlKLPvCtAI3/B0ZtHKDLh9hbSfn+eT5QKjiyOXf
	6vRSAbn7krN1vwDM8EEr/aBPspMFhc0LLZ4LbdeyvviTpjJA67v1OMEA7LEpsxLDBiTzJruxhFX
	UOhlCPsAv4CY3BFFPTJplPHwNCvm5rOMmbLu6WwM9UDWdFBY0wMZPZ9ZRjR2UL6r6DXLNqzB/p8
	+KpNj1/WbSmmBm8n32Ht3gC1xj6wy4rrNwaNGFIuB0aUZWPhTfFcflbLyRrZLDXeuCWyMZ4gIud
	SZsMWW5OAGJ8cV4UnbwQ86BgueWLYzr2zySZH8LfoTx1M3YFKrMGrIVXr1t9KJ1vIqcN+JFarlV
	5ykw=
X-Received: by 2002:a05:620a:24cf:b0:7d4:289c:884f with SMTP id af79cd13be357-7d4296899bdmr175664085a.1.1750861226593;
        Wed, 25 Jun 2025 07:20:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcPG5c6FU6ZG+efM90I/kQ/p8jv4tpnX+CiGYwW0+TF/XyKO2wUFOFtKbHLtVfRKzlqQtqQA==
X-Received: by 2002:a05:620a:24cf:b0:7d4:289c:884f with SMTP id af79cd13be357-7d4296899bdmr175660485a.1.1750861225838;
        Wed, 25 Jun 2025 07:20:25 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a67a80a5sm331473366b.26.2025.06.25.07.20.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 07:20:24 -0700 (PDT)
Message-ID: <23ae6ddb-682a-4c4a-bd63-f0a1adb6f4f8@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 16:20:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] regulator: qcom-rpmh: add support for pm7550
 regulators
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
 <20250625-pm7550-pmr735b-rpmh-regs-v1-4-cab8ef2e5c92@fairphone.com>
 <bc27209a-e0f8-40bf-979f-3d747c501ae8@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bc27209a-e0f8-40bf-979f-3d747c501ae8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685c05ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=3wOqg-wJ11FJ_073BQQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEwNCBTYWx0ZWRfXyM1zWvXH+Tkv
 cq2o7Js6jKTBELOmbM0JfIsXYO8Ho0Bpal9Mr+/Q21ksLKhRzqqcDwnGPtvVhhBXPHkIWt0JhJx
 9sJTw49dV3o9OQzGkwiIdId9lJY3dW6r4e7A9QP35k8I9lLF83xBVVFQmyHNchHAvjjP2HyIOH5
 ssIJ9QmhQEcrUZfv3pMvrMsMX9SeGHO1Vhu/vWj8peQ35kDeVoTReho5LJ9dJz+Iwz8IIJ6R7nw
 pzGdfkLAtwFbym3Gck3jNneGBuh/idNP4E/4xZCXRjJsQ0KK52wWSEzt8T6JFKBKq5SFA7MH5QU
 EBsItMWxvSg/dlGxbvOQskZ5wZkb9/WSHLocYwhAi5kwBuCLC4iMkP5qcPRrYpId9NZmAvsu+R5
 NeTCbKkuDi+usUo50zgi8ii6ge/Uxt6ML4WdzmeCGxyDz6BuhKVJ+MBZABivVKbmXOuJUfr6
X-Proofpoint-ORIG-GUID: eVyChejL2vpS5DOxk3ys4wv6fauBh5fC
X-Proofpoint-GUID: eVyChejL2vpS5DOxk3ys4wv6fauBh5fC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=925 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250104

On 6/25/25 4:10 PM, Konrad Dybcio wrote:
> On 6/25/25 11:18 AM, Luca Weiss wrote:
>> Add RPMH regulators exposed by Qualcomm Technologies, Inc. PM7550 PMIC.
>> It has 6 FTS525 (FT-SMPS) and 23 LDOs with 3 different types.
>> L1-L11 are LDO515 LV NMOS, L12-L13 are LDO515 MV PMOS, L14-L23 are
>> LDO512 MV PMOS.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
> 
> FWIW everything you said in the commit message is correct, but I'm not
> 100% sure how to map these LDO types to the existing definitions

OK so found another page (also made sure that the supply maps are
indeed OK)

SMPS is OK
L1-L11 is OK
L14-23 is OK

L12/13 -> pmic5_pldo515_mv

so please update that and add:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

