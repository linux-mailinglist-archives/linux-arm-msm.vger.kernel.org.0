Return-Path: <linux-arm-msm+bounces-80325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 240B5C31936
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 15:41:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 41EFF4F5840
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 14:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8271494CC;
	Tue,  4 Nov 2025 14:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLxzbp6p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CFCj6eFa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D0D32F746
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 14:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266913; cv=none; b=uBNvDoXrroDQw90214gLc74gAmKpXBHNZCc68bWkk6OeFVl7rrm4xTVPFbQl9naN/ZPNpfo4PMyS0NgUIzQS7cMyITTCy2PxxqcTSB8/Hl0NIYhAfZYmmhKSHy8LKyMrSceEK5mJ5//RcpX7dOY7iD4VQYyOy9maYfGdee3bxHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266913; c=relaxed/simple;
	bh=eJOwZZlKALtaagzRqBufBHXC1+5j5XJaugc6j/OpDmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBZ6fMxe+Pmx/3hkhZ1hWAZXsM07yp/Y0KzuB/Ti2IorWyicmegqifLmQhi5zkwwo3L0zvE9C/M2TEh5Ukf3mMoEZhq00jI4VAJo4N/JmN/bLLEBzwwEEL0gbc8d+7JvtOn91xz923NXRocjJMwIQuC5pnXuFw8+B4HtbDX6pT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLxzbp6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CFCj6eFa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4CfwHn2062017
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 14:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K072T6HPRjWjuMsTp0+7aI7AP9Wh/nbTI4zMnE9UlUk=; b=SLxzbp6psmmLL0hH
	tUfIizOt1naDCPDnhbZmgE8JgppE5vzPm4mfO8J/1nVPvlQV/3kc45JhVf7MfNDc
	ebS4CNbBlMoxw+Y+p0imsXBJlFsLmb9oP48+lTOdG3w6oac6WkuqqLTz++WPx3DW
	DPYrP/tibu3K3iOXTzWCSiISohl1kGBocBpa37jJuRAdDNXqxQq5hV3pTubPT4Qp
	bX5h7Dz3MKKAGQsk5050UuO2h7DrzVtZwHRpxK1WRNpnSP39yUu0Yi8hdRQXj/eZ
	BWYHLQxZnrTmqTzsanU5du96Pm74lMxQvwIIScU92d/OvHCYP/SwKuuDr8lTrcRd
	e9k4aw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7ex7rrty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 14:35:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b10c2ea0b5so40261385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 06:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762266910; x=1762871710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K072T6HPRjWjuMsTp0+7aI7AP9Wh/nbTI4zMnE9UlUk=;
        b=CFCj6eFaqtrSWxq+lIEASLwWwcb2xCEfbX6mh7+QD3YfUuzMwSMpbibUg0EqpUjMo4
         FQGaAhaBrmoyJXlvo0JW+UNI6ZbCuSFMSbElYLyvdxJd+6JzBBcfIKi9RZX+u4Z89doh
         Kadyc1VHWhu7a6CJrdGItYJqBIM8rbC3ydcbtR4DuCHC+f+6mpnBVSlqwsp4jOjyGmr/
         ivGqBu6VDPkPF4+wK0oojdeKUUBD56TIsBHuRUlwhDoqi25Wg96XtqyAJa9J/fWURiv1
         IasjUnDpCV5C5A0pHtBPLr6OgPXjLTTgBat+Ebg6yqyemcESmzrKy8o1fMgkGf/yW5Qp
         6kXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762266910; x=1762871710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K072T6HPRjWjuMsTp0+7aI7AP9Wh/nbTI4zMnE9UlUk=;
        b=iVs7Jklp8xdX+ahscIkpM/N+oJ7gQjG2T6JMq5NYMExNLlay5ev15NmL2wUd/KhXAz
         42nL72fw0hfgLIvvgsAFuun0o+CsI/yKuRDsa7QJYr3gyVBZG0SSeSLhLfUp7Vpkc0b1
         1MfrYuGpofcQZgLfRhBCHNXF1FhMsh3wxymR2ZpBqGc8n8lkUgLklHyC2edAr95UfjbC
         KKkS25KBENphJS3a60jNBBp5KaZcc7Ta24cto91GsDfxb+Z2vSnE0tIaK4aCyvXUrK/A
         asqaDj0rK98ThRjEU4X6N0Fz/DNY07UoS8DnfBZgYS4T3dQ8i2Ev0x6zAbl1rd4Eblu/
         JO4g==
X-Forwarded-Encrypted: i=1; AJvYcCXZphpU0XHpE2XSmyrzOAcr3xxvg9kzm1uFoA32lIl2AQN8qTWwwz/dzL9+j+9OLlq15qz4pj3P8d3EC4LO@vger.kernel.org
X-Gm-Message-State: AOJu0YyeYx21jxSS4B9dUh4PG9iOniVQLL74XBlz3C4RkfERxidf4NmQ
	oZ2bITuWeQ+3ocAZ0059cv7q8i58to8pCiR4z6BANxaVyctEPTYK+wjTzLBQ4swSi5KUc6fLoWj
	eK5VzQr+kIrEH2NpJaQRl8wSLVl1l9SeDKJVzozOzJll0bqXzRY4d528a1tbZP7Ta6Fao
X-Gm-Gg: ASbGncshLb3S5Eeyad9gIXtwyMcbw7TO2z1GCRRu2Hd/ZIJki2aaVFn9IcTU42snECZ
	Ov2yMvRijIi3URY3vSyhDZ9lh/N+JHlBvpUfaBEKIIajPYK5Wye5m1Wsz9uHmZu0C3ZHOtOsMJI
	nRiDIbwxiHHevaZpbVbFfFSFvGm4wdsd6Wg4TK9vAnnsYfiuByXH44rguGTC8KLwiRmUNbGi6lQ
	/V5oZ7XyW1nk0hXGOnVsf7ECHRqNETia3Z/eJo9qbzN52pgD3eSviAB1IQbNTsv9fdnQQ0lLzF9
	QXUtw2Vpy9HOouRJBXDtShtO3A8N3jObP4Yxoha1MJcUSP4+JA95eQO8wyjcxsZa5yf0rKQgwJC
	3dXEoX67aFH7mMmyP/C1gS/MzqVNNVQ7iIS2xxU4MjWoZbV18x6ez36GO
X-Received: by 2002:a05:620a:1714:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8ab987f9141mr1481685885a.1.1762266909513;
        Tue, 04 Nov 2025 06:35:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1XzC3wbZ67GP0Nl0ebGlvlejXlA0B4O0jm0PW4QKewOgOItP0mbeyAej7UDqRG76Ml735vQ==
X-Received: by 2002:a05:620a:1714:b0:89f:5a1b:1ec9 with SMTP id af79cd13be357-8ab987f9141mr1481681585a.1.1762266908854;
        Tue, 04 Nov 2025 06:35:08 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa03d3esm238316566b.53.2025.11.04.06.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 06:35:07 -0800 (PST)
Message-ID: <9ee07db9-508e-4c08-8f79-6ccfd9b646ab@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 15:35:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251102-knp-soc-binding-v3-0-11255ec4a535@oss.qualcomm.com>
 <20251102-knp-soc-binding-v3-1-11255ec4a535@oss.qualcomm.com>
 <20251104-glaring-rebel-pillbug-a467ca@kuoka>
 <790ca394-cee2-412b-97d8-c6416b843010@oss.qualcomm.com>
 <b6717831-1840-4b9a-aade-ab2248e3f75d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b6717831-1840-4b9a-aade-ab2248e3f75d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEyMSBTYWx0ZWRfXzu09AUwBPA9f
 UK+haU3zCExjTUo+/XAM4ag7iPklCJczrjOlGVkfPZf9XwWb6udrqbX2WiHxNaxJKoHEn2V7FYL
 QJ5rgIe4LbUJgSIBa/cSnw2PM3LLKJK9ECFob5wxEyR9HfwmvjV3zF9lrotuNXBH0EecqIA7aKn
 UFru/2Fn4ciaiB8e8DQkcuH2d+5gmAJgZszRkFFDVj6DYVv76j+/OTUAz3oZzhCBMgDKLUsRe/7
 7PdPQV7UpdofNdHHtPUZQSKjNsBRP+N9ZHhvSWbs/FjhvxWVj3Nm+zDbdXEFII61GEatR4WrIx2
 mSfE8gy575ElHQPa23h+zHGvby1/7BEm/ZXWIAcdRtnp2DYIXvAIYMQER0n56y7OsxoWYXam5Ud
 4Kljw1NMO7nwbJNhHxQmpy2dlAtm1Q==
X-Proofpoint-ORIG-GUID: h4XHh8QVghct3I0CKBGnIDvpY5frP5k2
X-Proofpoint-GUID: h4XHh8QVghct3I0CKBGnIDvpY5frP5k2
X-Authority-Analysis: v=2.4 cv=auy/yCZV c=1 sm=1 tr=0 ts=690a0f1e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=L0PDfkbdR_nvDvRPFewA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040121

On 11/4/25 3:26 PM, Krzysztof Kozlowski wrote:
> On 04/11/2025 13:32, Konrad Dybcio wrote:
>> On 11/4/25 9:16 AM, Krzysztof Kozlowski wrote:
>>> On Sun, Nov 02, 2025 at 11:25:06PM -0800, Jingyi Wang wrote:
>>>> Document qcom,kaanapali-imem compatible. Kaanapali IMEM is not a syscon or
>>>> simple-mfd, also "reboot reason" is not required on Kaanapali like some
>>>
>>> I do not see correlation. Something is not a syscon, so you add a new
>>> generic compatible? No.
>>>
>>>> other platforms. So define a common "qcom,imem" binding and fallback to it.
>>>
>>> You did not define fallback to it!
>>>
>>> ...
>>>
>>>> +      - items:
>>>> +          - enum:
>>>> +              - qcom,kaanapali-imem
>>>> +          - const: qcom,imem
>>>
>>> I do not understand what this generic compatible is supposed to express,
>>> not explained in commit msg. Considering this wasn't before, it is a
>>> major and really undesired change. It also makes no sesne. There was no
>>> generic compatible before but "if not syscon" now this must have generic
>>> compatible, what?
>>
>> So IMEM (or SYSTEM_IMEM more specifically as opposed to BOOT_IMEM which
>> you can take your guesses what it's used for) is to the best of our
>> understanding just a piece of SRAM that's accessible by multiple
>> processors/subsystems on the SoC.
>>
>> A smaller region within it ("shared IMEM") is a little bit of a dumping
>> ground for various (incl. runtime) configuration and debug magic data
>> and that's usually what Linux is concerned with.
>>
>> IMEM is currently described as a simple-mfd+syscon, which it is clearly
>> not. The former, as we've established in the past, was used as a hack to
>> have something call of_platform_populate().
>>
>> I think that in turn is only necessary for the old arm32 DTs which have
>> a syscon-reboot-mode node under IMEM (and I think that's where the syscon
>> compatible comes from).
>>
>> Should we make the switch to mmio-sram and settle this discussion?
>> It would probably require convincing the sram maintainer to add that
>> of_platform_populate() call in its probe func and making syscon-reboot
>> not depend on a syscon (not like it's very hard)
> 
> This I got, but nothing here explains why you need generic compatible.
> To re-iterate: there was no generic compatible before, now there is.
> Writing bindings and numerous reviews from DT maintainers ask not to use
> generic compatibles.

OK so let's not worry about a generic compatible. IMEM exists since
MSM8974 and it only had major hw updates with SM8550. They don't
impact the software interface though, so qcom,msm8974-imem is OK.

There's a separate control/status register address space for each
instance of this IP (usually far apart from the actual SRAM pool),
which Linux doesn't have to care about.

Konrad

