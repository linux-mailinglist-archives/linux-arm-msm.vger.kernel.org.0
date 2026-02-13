Return-Path: <linux-arm-msm+bounces-92776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OzFJF4Sj2khHwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 13:00:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B395D135EA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 13:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B27B2300B8C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 12:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444B335E547;
	Fri, 13 Feb 2026 12:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVWusH1c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="el4iMATa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF4A359FB8
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770984025; cv=none; b=UabCxFS3ULoqtcmp3XWIuw6RIcGAAU7y7YjAD1aTS5LuDQ0g2MpbrI71kaM7fh3VZkqveC3xVG8yu86pMz83UGgwn/j7YxHX/zsHniRo6Fdro+737N+FKRyCuEXx+jG5lYmyTNZjOnG0VQLb2C+0okCgk7vd0sDNyie7D1yvgLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770984025; c=relaxed/simple;
	bh=OSvJKuP6dgZ4Wha7nT0kEvQYfBniuU9cyWrZ/6/n0Cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hyTiZ2lTM+46IIuD//w9niI3X/DbLsxn18l4+l10riF19lyfy1EnPcHvaGofWdjPM9eFBken01k7vsDbeVl2uueTuXZbdasjUl6wnrX4ny/WjaYEUOh1DkqjNFjEdjF5t69QEnbWzfWs92Q9bOviS/0E4xGWNgWSbRoCPhjYMfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVWusH1c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=el4iMATa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D8jk1Z053305
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 12:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OSvJKuP6dgZ4Wha7nT0kEvQYfBniuU9cyWrZ/6/n0Cw=; b=cVWusH1cLDLvSgTd
	wCVpvSKoBeylXV8QrScOSTBW6FZZAcgKEGRRk5+qrADiI5GYJwt52FahfAXD6slV
	F6ll+p/rrJK9Y3qXQI3CTJluA14xN33QVYHNAgFYVbuR16fzcHEzj1H5JBTPLeqj
	8Zt9/kTQs+CMoBLLzSa57njkBjvoNJLNIBSb/YMkqXxQhum5dTMrWl1/pZrKRwC4
	oLrzdEd/CJRSizouGVLdnxfc1A3DTbtny9/lJ9cw9SAQjy5idsCSnJoLAU6cKvte
	huWWNmsMNUHHHvldmSUxwz0ig2fIqOTs3a6vT7qrnqUVQjiEXQpYFZYu02ifboLx
	i88TZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9jgbbsrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 12:00:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a8c273332cso36851475ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 04:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770984022; x=1771588822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OSvJKuP6dgZ4Wha7nT0kEvQYfBniuU9cyWrZ/6/n0Cw=;
        b=el4iMATa4Mwk1ImzEZGCKyktzExrkW3DOZjK5FVxn0LNxGAWcM5DunafrIubklIL34
         1h5XjrhMqM/4M8q+0lLVfQca3q0m8/i+NWuffhNpakXUqY6jewwBeqZl4QuZSucn8UMx
         htKhglphjZnuiocV9lMzctEavds28TMrKmo/aCv5PpKNLsqhEmtnb8il6H1gjrO399lT
         G1pVgK+l9v5DxNltsDIZ/zLujR+kwrhY0iS1V5P33MnO3/DgjyDOcZWyP3QMKn62jEXg
         q7xLDSx8Eh6673xgSCWsYmvjGdyS2B0mKEPOhzsPL2FMlsBQQsjHFyw8uq4NkKK9YBHJ
         ld+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770984022; x=1771588822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSvJKuP6dgZ4Wha7nT0kEvQYfBniuU9cyWrZ/6/n0Cw=;
        b=v+q3WeRnboZ76eXIeGzPrxd8GU6zz1ycf/81z7k/MiRODFudXG2TgdBu4vasuJh93T
         JJqoOBqC0Vl+QKnvwdcEp55Yvg38euNvEmGe0MkydfdpCUeFTr6akzUbbprlI+lDAaQv
         ASdRcGXbCcjxRIfSK0ZsuPYP39+K2jpwr/5eJ7eQ7tAaBLAo2R0JmSsgCcvMSW6jrl4F
         dX2Aze/RUfdXz0ikrnkp0ly9dqRshu4H3OBcCfZHGavXzy4b5RfqjFiMw6KVtd1TQZ2F
         qNuVYnAtNJRDjCQ9xKYYmW9rzDmfh08GPLtkv0bye0uERVaoBhbgzhiH4UHMdknQrn3u
         EtxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAP+qrlAjs8SEJzQdFVm+dNQY+WMTGAdpdCpwKXyR1o8cGqHV9dpmjW6TIj/faAhloHe6H0XDtPuEOBCpv@vger.kernel.org
X-Gm-Message-State: AOJu0YyE1a901E3TnAg0gUBNjCKDn4EnCGKdqSJ9aYrBYrJfsAFTUN5r
	PsMW7tyJbyvDKvugaO0MUys9ZP98AQkPWMqBA/GvRJsZt2rJJ4f/DVXfq5m1YzJp301iDvC+fTo
	tW6UuffdRcHYzQHEnWfJLTn/SX5nwRn2GUZPCXaWL/6Fv0n8N31XE9zjN/PvnNmHN0MP0
X-Gm-Gg: AZuq6aJ65FF1nEPq1quYd3f5MS3YeAK9vqEaI6rHDFxgyHoaeNj9jjYoUcYngT91hYG
	46uqbTugG8kWn7hxX7cjDkNul52HHFl4Dp1el6jMachOAmh9EGGWU1FflzQlUGAqyiHl1ObVMgK
	0fibpTaX/eEIkdETIfVIyo9jGcqispRx5ZMgxrOwH/9rAuDkNdFzpM4lQ4+5+jcZ3E/q7jjKx0d
	D+GZ4bePiTaG5zHxgAwIu0iXPUuWylkYftvnBT1D08KjBBJcPZzFv6KTymU4NW2qhuE6cmxXVMh
	KlvV0Cu95EHfXbGPzQLyo2Gkzx75wTYTo+eUGR5nAiY5rXVgYqrxMMRxTxMczzp4Ugn9vnxb3px
	gHde0as7IfCqamG4b9JpSIR1qWVumN5lz5Z+vQa0aDwEP52JVsc73DlGKuQ==
X-Received: by 2002:a17:903:ac5:b0:2aa:d7fe:8611 with SMTP id d9443c01a7336-2ab50568010mr18240505ad.27.1770984021511;
        Fri, 13 Feb 2026 04:00:21 -0800 (PST)
X-Received: by 2002:a17:903:ac5:b0:2aa:d7fe:8611 with SMTP id d9443c01a7336-2ab50568010mr18239755ad.27.1770984020748;
        Fri, 13 Feb 2026 04:00:20 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2997bf86sm84627445ad.74.2026.02.13.04.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 04:00:20 -0800 (PST)
Message-ID: <8420d839-cc1f-4d03-a3ee-725d944577ec@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 17:30:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: hwmon: Add qcom,bcl-hwmon yaml bindings
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-1-7b426f0b77a1@oss.qualcomm.com>
 <ae2802d8-2eb4-4dcf-8212-d8f2a41a7185@oss.qualcomm.com>
 <15fe2128-5a88-4140-8aba-0e8d73350df9@oss.qualcomm.com>
 <a4cfbe52-51cd-4851-8a1a-2830886c4dfc@oss.qualcomm.com>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <a4cfbe52-51cd-4851-8a1a-2830886c4dfc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA5MiBTYWx0ZWRfX1suxWN4kyi1x
 yJm8GyvVEureulb1EgE9pXTA7ntV6zoCzxClECBEj+J8+SfG4kZgFNdX4BuKSNlAfj8Ow35c/oR
 oBDaTGZ2d0VBsU7cKclQmFtfdMF8Roh+hXzoLV+QMeE7KRBW8EzprJnhMu4XPiAxbeevQRpZZ1v
 818+OxYKu/ca5HIVTIh9jkE7ZnPo5qf0vFgZ9aJJpmdOYCCYGS1XOFEveJP2yiWdADygGhIhcm4
 k8HUjvVlB3ClpozU9Noa7o+XPWnVhLlHDgYsg2Ppl/LxQpAi4X62dELZzf/Jf9Ioj0KCKRObV8K
 gNZHtNox5NBENYi01L/8F9XR1SmsmUrxE+OhNJMdXfhoukfvNF4a6YvRm4h6jEMJBH18aFOOPJ7
 x4sAMEDV18qf5cITSpFOUZoeY6PZ2gqz4jfHfmrwXTdhzn9hECpHbszytlSGpXAvijGeaS1dRJj
 L+i/RdDTJMZNmknCvtw==
X-Authority-Analysis: v=2.4 cv=ArzjHe9P c=1 sm=1 tr=0 ts=698f1256 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=eFyIGa5nQRDKMWRvKKsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: YSC_6NJWHaFLmTTd1OlSGu0qbo8-Olq_
X-Proofpoint-GUID: YSC_6NJWHaFLmTTd1OlSGu0qbo8-Olq_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_02,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92776-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manaf.pallikunhi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B395D135EA5
X-Rspamd-Action: no action

Hi Konrad,

On 2/13/2026 4:11 PM, Konrad Dybcio wrote:
> On 2/13/26 7:04 AM, Manaf Meethalavalappu Pallikunhi wrote:
>> Hi Konrad,
>>
>> On 2/6/2026 2:38 PM, Konrad Dybcio wrote:
>>> On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>>> Add devicetree binding documentation for Qualcomm PMIC Battery Current
>>>> Limiting (BCL) hardware monitor. The BCL hardware provides monitoring
>>>> and alarm functionality for battery overcurrent and battery/system
>>>> under voltage conditions.
>>>>
>>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>>> ---
>>> [...]
>>>
>>>> +properties:
>>>> +  compatible:
>>>> +    oneOf:
>>>> +      - description: v1 based BCL
>>>> +        items:
>>>> +          - enum:
>>>> +              - qcom,pm7250b-bcl
>>>> +              - qcom,pm8250b-bcl
>>>> +          - const: qcom,bcl-v1
>>> I see that e.g. PMI8998 has a BCL block, would that also be 'v1',
>>> or something else?
>> I added support for pmic 5 bcl design from v1 to v4 in this series. PMI8998 is older pmic design(pmic 4). As of now, we don't have any requirement to enable it
> Right, but then you never mentioned "PMIC5" anywhere in the compatible
> or the binding, so this wasn't obvious at all. With the request from others
> to shift towards PMIC-specific compatibles that won't be an issue
Sure, will move to pmic specific compatibles.
Thanks,
Manaf
>
> Konrad

