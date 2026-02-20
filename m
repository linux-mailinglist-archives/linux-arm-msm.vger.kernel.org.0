Return-Path: <linux-arm-msm+bounces-93445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qICvHdfvl2mA+QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 06:23:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD317164C1D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 06:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 195F93029E52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 05:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5975C2C027A;
	Fri, 20 Feb 2026 05:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ea4sOkFt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GEYh1IVE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F266239E88
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 05:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771565004; cv=none; b=kx/5L1fzWPI9bruVWV/gaVqLuLFc9pQbrBh3KRrEH2UwlwMPj6WUr+SdhTZqsCbG8h5KU4oT8IDDS1jn3wplD0E2EDYuVjNjIUmPYngBKr4d6x1OTTpUysR1X/p+DejHU2tIqVRPc/R7paw/JkPL7aPybdqNhExl+C5B4RcD12I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771565004; c=relaxed/simple;
	bh=btlmM1i703Qb+9ci86UF1U05cSSsh30mwRlzXNKGjKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZzbNtOCiRctga3+sm+CRdms9ImiToh/6mmejjR1X+PTZIRmNLwEsweEfou3GcFS0zZwqLwTsgmBPOjAH29tZotXO0gIm3MA/hI9yvYNiG+71aXr2j8yl9yjDNSRaVr4MD04CFsb+acYsARIoJGoH1MXi9z9yDVs3ONR2bBrUPhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ea4sOkFt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GEYh1IVE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K1rQqc3420057
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 05:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZG7xQJa5yk328pgJFK7vJDo1fz0mK+T6pF/CMJ5or6k=; b=Ea4sOkFtfiS82gRQ
	yx8lQl5r7+LJ86+XqyHlPtQyV5v/vq0TSEv9v9RXGQiLelmpGTziV0eC6tNDpZXW
	fOWnfwzIT0l2MWnBbuZpLjICfeAWFucpuSo5LzJh2gJOHkovTeLaCnTAM7CElQSM
	Nrqd4ZERnjKQGEf3iI/1bNVgmEXFGeGpTi2LvsEvpjSjWIEP00hM+5AOeQu0ORp9
	dumgZZjECnfEbHhub3aDv0o/FwTM5n6YoiPN07ecSb7r9Z889xjHbdPx7h8XgjXr
	qxoRKCCz1U4wQ62TWmMIWUxIRn34cfTMP4HSGXFna21nt1wPZSoowupMCGgOBqwA
	wLS2gg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce2ghtr0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 05:23:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ad147cdf07so17459335ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 21:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771565000; x=1772169800; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZG7xQJa5yk328pgJFK7vJDo1fz0mK+T6pF/CMJ5or6k=;
        b=GEYh1IVERd2djgEd3rbDffaGivN2ke3aFcSkR5OXbExdOZCO7agmF4ATQqBK7xCsOe
         EYg2W3p5zPVOiGQy5UnLPqXo1pcKHLOn85Zq/euB/BWnLLe90Hq4U2SZIMHDwhJQt9iz
         9Z4M2mfHtELzITPHGNWR238J6yzeBto6/pNa97r1JquhdrL8kKYI0V6QtkQivrFElz94
         HmvHsbVxE80+Nbq9lUykahdA19xsmK1xaw5W+uYTTesdB9VjfVSrEsKMjkM1NoBfEc6b
         HWuVtwHgfgnlXuUf9G7bV5Q7elsGDOzcBrvLk4oBmg3NHa8X6L1tIgtv2eltHkRhsZA/
         GhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771565000; x=1772169800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZG7xQJa5yk328pgJFK7vJDo1fz0mK+T6pF/CMJ5or6k=;
        b=hRAYFhwd56dKR2U1DvPR7MRZKal5v6WtXCDVGyJcwk4+lvEeFM+FufF3CDKNkOSJTS
         CvKObIoymQztryhbb8kRiAKnckJPUOcz/bYXtNRDEnn0Wxe/6JNZuumVI541NeCfGjWq
         3hzCI12TPsChqWzHxCCVosx+8NGpeaAfQxyStoSunitauKSgbsk1Yfx729ZXnI0CvCxA
         kCvd3gK9jzAg/mad8S8xo02TaHeKQyGuLfCck9aBIg2vPQOXjHROjWzf5Cf/CmshXupv
         zOmF6vH0TNCGtDMxWctnYqFXjgxjsdAFU7+cxi1yE9oPmwOVlUjLM/RbCHa57roW+s3d
         OYrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/AvHwVeZBxsh5dht6ikwSkA9svv5RsExaKrhfr0YgEm/eFc5L4xLiWz+MSnZ1bF3d5HZ52lSiJ+xrJTjx@vger.kernel.org
X-Gm-Message-State: AOJu0YxB0uJUipC8J7+1piMecIPunrXdiyVQwUPNy/oifxxxk0JmynAz
	U3PdrJaAqQUXwJq7cFU5VMQ92KP+/Qv+jSkQOfsSmftQqLl0stAszSQYlsjwZop76q9w2LuYQq1
	DDiNpDIvPfYVmA/7V4uUygfXznHDoNR5zK863t4z/LclhN2IRwCol4GNW/kmBXIG3UXmP
X-Gm-Gg: AZuq6aINagVHm8CBr+9pmloyRWQM249+/EiaO9rsyf6Bq7VAzaa5gDz+8DP+h/CmlxH
	B9kGDLG+77s13KlZOiivcyy0sEI+CePvoi6TyWl4B00LUXRQtNHQjjEt9EJcW9h1+wGnD9AiAM8
	fLW2JT9xI1b3/0x8P68Hag1VyFNi6En6BjrWTQErzX3Cud3Z02zSfWhUSiuUYCO+r9rArzBK9qI
	LejjNPlN0s1gWr1TY8DLXBLlJSPSLicTVe0NGifY7rdSvD4eDW2Y8iEN/jaBE2swKCE7BlNDykS
	Z+B9LkWN5ULKwMbaSDd6QRVlGaUPvXxO9lgyQ0rd3OG4TzPXo6BmYhdwDZ5PrqZNJoRMyf5Y55R
	XxU5aFQ981tB0fm1C1ND6eJXvbg15WN2umVMdzx9l/x4JeJIWUijR8g==
X-Received: by 2002:a17:902:f681:b0:2a9:45ba:529e with SMTP id d9443c01a7336-2ad174800demr177419305ad.24.1771564999890;
        Thu, 19 Feb 2026 21:23:19 -0800 (PST)
X-Received: by 2002:a17:902:f681:b0:2a9:45ba:529e with SMTP id d9443c01a7336-2ad174800demr177418945ad.24.1771564999182;
        Thu, 19 Feb 2026 21:23:19 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358a2a3c04csm530812a91.3.2026.02.19.21.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 21:23:18 -0800 (PST)
Message-ID: <85bb3a9f-d54a-4b4c-8dbb-6d5461ebb037@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 10:53:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] soc: qcom: geni-se: Introduce helper APIs for
 performance control
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-7-praveen.talari@oss.qualcomm.com>
 <af0eba46-329f-4979-8b8a-fb5dbe2ad992@oss.qualcomm.com>
 <b918cfa9-1f40-4aee-ad91-d6425798bd07@oss.qualcomm.com>
 <24f967b5-0f15-4aed-a81f-ad54f8e541fa@oss.qualcomm.com>
 <92dc98b7-8047-420b-9743-4bcbc7e30fed@oss.qualcomm.com>
 <ac490ba8-18d0-47fc-a662-5a202c5ba95d@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <ac490ba8-18d0-47fc-a662-5a202c5ba95d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: z0N723XGW0ntUJjXn4EeQZpH2X-NLyry
X-Authority-Analysis: v=2.4 cv=dqzWylg4 c=1 sm=1 tr=0 ts=6997efc8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YzQrqTNV-x9tSoNouI8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA0NCBTYWx0ZWRfX4qeb/7tmDPGX
 y0O2sYmJtGe1ZPo2+7bsgG1Z06cAFLT7db4IchNkerq3DAl822Zj2PVMO8/B4JymguW+YiVIvCK
 ofeG2Rjut+A630HG+5qo8d1ES6QcnC93QCc9BkQBhHgK56Zl32r5d+rU4u2BkLBNwcmrR3Ndf+a
 h4A9LaKk1FB/IFF11V7HhGKW36rTnMU9F8vwwsO1ZjrOSxoUwmzR5ZWyvZ3S73+39Q8L+4AGSjZ
 yg+GRYTgJp0/RwNaFpWJLEz0hBnmEhbFAgB+pBHIJlRHbEI3r/9Jg0/nxfzjxIqaFXX4OH2fA6Q
 eMCqW9wdqfS+tDHuoST74dRlkpCI1CMi6+XBYJcVkn0S1WV98CcoBkD82r28qCRSDdVi/BFsB84
 QS4AnJSSIkRDcHbbcJ7HQfX4KJdpCJk63qO5ULZM72vao9ywzv40kQyjBhNU1Vtp07zRHQ+cPUa
 xLORPldjo2nnK8UEg1A==
X-Proofpoint-GUID: z0N723XGW0ntUJjXn4EeQZpH2X-NLyry
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200044
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93445-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD317164C1D
X-Rspamd-Action: no action

Hi Konrad,

On 2/17/2026 5:55 PM, Konrad Dybcio wrote:
> On 2/4/26 6:42 AM, Praveen Talari wrote:
>> Hi Konrad,
>>
>> On 2/3/2026 4:44 PM, Konrad Dybcio wrote:
>>> On 1/30/26 5:54 PM, Praveen Talari wrote:
>>>> Hi Konrad
>>>>
>>>> On 1/30/2026 5:53 PM, Konrad Dybcio wrote:
>>>>> On 1/12/26 11:47 AM, Praveen Talari wrote:
>>>>>> The GENI Serial Engine (SE) drivers (I2C, SPI, and SERIAL) currently
>>>>>> manage performance levels and operating points directly. This resulting
>>>>>> in code duplication across drivers. such as configuring a specific level
>>>>>> or find and apply an OPP based on a clock frequency.
>>>>>>
>>>>>> Introduce two new helper APIs, geni_se_set_perf_level() and
>>>>>> geni_se_set_perf_opp(), addresses this issue by providing a streamlined
>>>>>> method for the GENI Serial Engine (SE) drivers to find and set the OPP
>>>>>> based on the desired performance level, thereby eliminating redundancy.
>>>>>>
>>>>>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +/**
>>>>>> + * geni_se_set_perf_level() - Set performance level for GENI SE.
>>>>>> + * @se: Pointer to the struct geni_se instance.
>>>>>> + * @level: The desired performance level.
>>>>>> + *
>>>>>> + * Sets the performance level by directly calling dev_pm_opp_set_level
>>>>>> + * on the performance device associated with the SE.
>>>>>> + *
>>>>>> + * Return: 0 on success, or a negative error code on failure.
>>>>>> + */
>>>>>> +int geni_se_set_perf_level(struct geni_se *se, unsigned long level)
>>>>>> +{
>>>>>> +    return dev_pm_opp_set_level(se->pd_list->pd_devs[DOMAIN_IDX_PERF], level);
>>>>>> +}
>>>>>> +EXPORT_SYMBOL_GPL(geni_se_set_perf_level);
>>>>>
>>>>> This function is never used
>>>>
>>>> it will be used by UART driver, not for I2C/SPI.
>>>
>>> Adding unused exported symbols is "eeeh"..
>>
>> I keep in mind for UART, i have added this API.
>>>
>>>>>
>>>>>> +
>>>>>> +/**
>>>>>> + * geni_se_set_perf_opp() - Set performance OPP for GENI SE by frequency.
>>>>>> + * @se: Pointer to the struct geni_se instance.
>>>>>> + * @clk_freq: The requested clock frequency.
>>>>>> + *
>>>>>> + * Finds the nearest operating performance point (OPP) for the given
>>>>>> + * clock frequency and applies it to the SE's performance device.
>>>>>> + *
>>>>>> + * Return: 0 on success, or a negative error code on failure.
>>>>>> + */
>>>>>> +int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq)
>>>>>
>>>>> I think with the SPI driver in mind (which seems to do a simple rateset
>>>>
>>>> APIs were added as generic interfaces shared across I²C/SPI which is specific to firmware control, not Linux control.
>>>>
>>>>> for both backends) we could do:
>>>>>
>>>>>> +{
>>>>>> +    struct device *perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
>>>>>
>>>>> Then, we can do struct device * perf_dev = se->dev;
>>>> I don't think, it is needed since this is specific to firmware control, not Linux control.
>>>
>>> My point is that it doesn't have to be specific to the auto usecase,
>>> further commonizing the code.
>>
>> This API will not useful for non-auto cases as well.
> 
> This is only because you make it so, with the above suggestion we could
> do without the .set_rate abstraction in the SPI driver which only does
> an opp_set_rate in the generic case

For the generic .set_rate path (which is managed by Linux), we do more 
than just call dev_pm_opp_set_rate(). The .set_rate callback also 
performs additional hardware‑specific configuration as part of the rate 
change.

SPI enablement on SA8255P follows this generic (non‑SCMI) path:
https://lore.kernel.org/all/20260112190134.1526646-5-praveen.talari@oss.qualcomm.com/

Below is the reference implementation of .set_rate used for the generic 
(non‑SCMI) case:

+static const struct geni_spi_desc geni_spi = {
+	.resources_init = geni_se_resources_init,
+	.set_rate = geni_spi_set_clock_and_bw,
+	.power_on = geni_se_resources_activate,
+	.power_off = geni_se_resources_deactivate,
+};


static int geni_spi_set_clock_and_bw(struct spi_geni_master *mas,
					unsigned long clk_hz)
{
	u32 clk_sel, m_clk_cfg, idx, div;
	struct geni_se *se = &mas->se;
	int ret;

	if (clk_hz == mas->cur_speed_hz)
		return 0;

	ret = get_spi_clk_cfg(clk_hz, mas, &idx, &div);
	if (ret) {
		dev_err(mas->dev, "Err setting clk to %lu: %d\n", clk_hz, ret);
		return ret;
	}

	/*
	 * SPI core clock gets configured with the requested frequency
	 * or the frequency closer to the requested frequency.
	 * For that reason requested frequency is stored in the
	 * cur_speed_hz and referred in the consecutive transfer instead
	 * of calling clk_get_rate() API.
	 */
	mas->cur_speed_hz = clk_hz;

	clk_sel = idx & CLK_SEL_MSK;
	m_clk_cfg = (div << CLK_DIV_SHFT) | SER_CLK_EN;
	writel(clk_sel, se->base + SE_GENI_CLK_SEL);
	writel(m_clk_cfg, se->base + GENI_SER_M_CLK_CFG);

	/* Set BW quota for CPU as driver supports FIFO mode only. */
	se->icc_paths[CPU_TO_GENI].avg_bw = Bps_to_icc(mas->cur_speed_hz);
	ret = geni_icc_set_bw(se);
	if (ret)
		return ret;

	return 0;
}

In geni_spi_set_clock_and_bw(), the driver not only programs the SPI 
clock, but also updates internal state and configures ICC bandwidth.

In particular, dev_pm_opp_set_rate() and dev_pm_opp_set_opp() serve 
different purposes and are not interchangeable.
dev_pm_opp_set_rate() selects an OPP based on the requested frequency, 
performs clock rounding, and programs both clocks and power supplies 
accordingly.

On the other hand, dev_pm_opp_set_opp() assumes that the target OPP is 
already known and applies it directly, without any frequency‑based 
selection or rounding.

Given these differences, replacing dev_pm_opp_set_rate() with 
geni_se_set_perf_opp() would not be equivalent in the generic .set_rate 
flow.



/**
  * dev_pm_opp_set_rate() - Configure new OPP based on frequency
  * @dev:	 device for which we do this operation
  * @target_freq: frequency to achieve
  *
  * This configures the power-supplies to the levels specified by the OPP
  * corresponding to the target_freq, and programs the clock to a value <=
  * target_freq, as rounded by clk_round_rate(). Device wanting to run 
at fmax
  * provided by the opp, should have already rounded to the target OPP's
  * frequency.
  */
int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq)
{
	struct opp_table *opp_table __free(put_opp_table);
	struct dev_pm_opp *opp __free(put_opp) = NULL;
	unsigned long freq = 0, temp_freq;
	bool forced = false;

	opp_table = _find_opp_table(dev);
	if (IS_ERR(opp_table)) {
		dev_err(dev, "%s: device's opp table doesn't exist\n", __func__);
		return PTR_ERR(opp_table);
	}

	if (target_freq) {
		/*
		 * For IO devices which require an OPP on some platforms/SoCs
		 * while just needing to scale the clock on some others
		 * we look for empty OPP tables with just a clock handle and
		 * scale only the clk. This makes dev_pm_opp_set_rate()
		 * equivalent to a clk_set_rate()
		 */
		if (!_get_opp_count(opp_table)) {
			return opp_table->config_clks(dev, opp_table, NULL,
						      &target_freq, false);
		}

		freq = clk_round_rate(opp_table->clk, target_freq);
		if ((long)freq <= 0)
			freq = target_freq;

		/*
		 * The clock driver may support finer resolution of the
		 * frequencies than the OPP table, don't update the frequency we
		 * pass to clk_set_rate() here.
		 */
		temp_freq = freq;
		opp = _find_freq_ceil(opp_table, &temp_freq);
		if (IS_ERR(opp)) {
			dev_err(dev, "%s: failed to find OPP for freq %lu (%ld)\n",
				__func__, freq, PTR_ERR(opp));
			return PTR_ERR(opp);
		}

		/*
		 * An OPP entry specifies the highest frequency at which other
		 * properties of the OPP entry apply. Even if the new OPP is
		 * same as the old one, we may still reach here for a different
		 * value of the frequency. In such a case, do not abort but
		 * configure the hardware to the desired frequency forcefully.
		 */
		forced = opp_table->current_rate_single_clk != freq;
	}

	return _set_opp(dev, opp_table, opp, &freq, forced);
}
EXPORT_SYMBOL_GPL(dev_pm_opp_set_rate);

/**
  * dev_pm_opp_set_opp() - Configure device for OPP
  * @dev: device for which we do this operation
  * @opp: OPP to set to
  *
  * This configures the device based on the properties of the OPP passed 
to this
  * routine.
  *
  * Return: 0 on success, a negative error number otherwise.
  */
int dev_pm_opp_set_opp(struct device *dev, struct dev_pm_opp *opp)
{
	struct opp_table *opp_table __free(put_opp_table);

	opp_table = _find_opp_table(dev);
	if (IS_ERR(opp_table)) {
		dev_err(dev, "%s: device opp doesn't exist\n", __func__);
		return PTR_ERR(opp_table);
	}

	return _set_opp(dev, opp_table, opp, NULL, false);
}

Please correct me if my understanding is incorrect.


Thanks,
Praveen Talari
> 
> Konrad


