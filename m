Return-Path: <linux-arm-msm+bounces-67675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 524CAB1A180
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 14:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 004BB3B0CFB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 12:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA79259C87;
	Mon,  4 Aug 2025 12:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZtNs9VJy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A072147EF
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754310903; cv=none; b=P5K2gd34qRVftuZVlYObpCgzo1dOUzJIyG50TPrO9m43LyB783NkuTk3HB93Hm0kyyN6XtGhacAs1nlxw19idxlbkcapZ2C5aVjCPgurOzgAYukbiZwiEssDS7uR9CZA/2qTAklhhbe3SEUUO6wC3ncIdaLPuxkNQ0Z/7V8Hzp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754310903; c=relaxed/simple;
	bh=YRYDKVDauPkLOuXYEKpWqHsQ3HBWS9IDem29DLnVCIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tbxe6nrsgr/NLTbwrrE1dv4U9yga2+11FaLWC4ze2YYh+adbbO+3INlf6WTAe1acTNqIb7A8nujaazhMIKu8X3cXUnfACScvcLZwwejKW9FpZIg3td6bZqq/6c4QnA3qq79/FeEBfX0RqG7f5fsRub7V8aNaLbzucCnFcm77VKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZtNs9VJy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748k0Vs017513
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 12:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6xG/kD+yzbRXWYpyoX5xhzwNnfOfzUQ+Z6gXVyD0j0Q=; b=ZtNs9VJyXPLi68V3
	Mm8edUQkOF1boQ5xxD+b33DR4ZlHjZJcSmL7GhY0kJoRRgrKsmK8TJbqkjpFqoH+
	4r8O4UtsL1kxNCo6UMVptmql4tWR0baNWKLZJWeBonsNhimtpbsFyMjvN+NftU5A
	VSJGexGjCrIa+NIwEfs1YpEhCw6TFumKn2sBzS2WFSHmZzD7D726/Fymjxn64MVr
	T+9mtCZUilop9m+pp+7ZQqxLee3fohZ2Vh/TymNECOFG/2PKHbWYgyEz/2TMIvNE
	vmVmdZUuQXEWKmg2Vel6bpQXd4+OUaLg3mm6Yh58Kn/FHhXKQmEebQh9h+s2qfBI
	nulsiQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc4wet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 12:35:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e698aaff5bso2161185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 05:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754310900; x=1754915700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xG/kD+yzbRXWYpyoX5xhzwNnfOfzUQ+Z6gXVyD0j0Q=;
        b=cscp6hb36Q+jkLSFvwrHERjcSnE/v4w0oLuDzbtv9FtffZHyQPR7YGGfFZwvGpmjJB
         DeNzUN9QCgHrkqjhyjloWYhmFvwn9XjcS/JayrmL493gaUCxU1hC66IK7X/xfRoYGmDJ
         TSFnIoxqa5RWTS2cvo3InRMDX/iAeTg3M8jnuGZvXeN/WWzciFfzGCzTaq0ffhRxD/tK
         9T9fQs2KaVL+vyb2Q74aB9lvieVYFCldoSxGHz7POIfhPYpLfJkapVYO9QosqTqoMl4B
         iqxI0RHdljKUuoYo4s6AOpXdgd40Yeq0EuJb8aaEIJiZ9NawL9Dj/3bEzSX+3g0FrLYc
         nvOQ==
X-Gm-Message-State: AOJu0YxJunU3sfin9CMjgjrEpyxcmDphsIjlMDc4aV7XpryCYbHwdMIw
	3W1NoqcSbk17Dfhc0CgAV85eluS5M5F6d0otWp6/edlLAlxcm8s6Mq/QL28ok/l3I1FrQpb/DeP
	fqvvWYaBqX7qmKFcGnCN8bVis5xq+mGRx07RiX1mBrn198ixpJ+nZtroFgXndu8ipxWjJ9t5f1K
	83
X-Gm-Gg: ASbGnctiK2iVt05eFAMkMklOSuWUDCSncq4qeEgav9dR0MpalJggKCBrZJ4T9wrGYXp
	jzWe89Urm39dDcUebQkB8JV2STbKEmBn+7S2Iq/K3bGYDz2JOudx3aDNlLGAYy+/DkNzQoMD2si
	5IPlysXszy/2BvKZ/Le1H0WAd11SU+vk/l+NuNRv4S756+4iTr07/64O3V5pQZSbzntc0QtCyag
	7AK9lNMD3UQw6LRhui64F6x7/QQltl+c3HD6FWJnhSKQtWPi+7g8NlzsFegqQpaBmLpBJSzPsl9
	QTJ4TPR30g8BLXl+Ht9kgFQzpWY+dbNHzpaGxGAxjRjLe2MdPjGZ5xkpm8Ak4xQAjNhsUzpwH+j
	zRgj25BN3ZVpBHa7BQg==
X-Received: by 2002:a05:620a:448d:b0:7e6:3c48:408e with SMTP id af79cd13be357-7e695e99fdfmr682778785a.0.1754310899748;
        Mon, 04 Aug 2025 05:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD0/Y8gL2eHUJARk2TXvcmFivLsz63gHWgP39CLMNDuC7ltMBN1eSmehR27G12/9zxrhOWig==
X-Received: by 2002:a05:620a:448d:b0:7e6:3c48:408e with SMTP id af79cd13be357-7e695e99fdfmr682775985a.0.1754310899213;
        Mon, 04 Aug 2025 05:34:59 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a1251sm732151066b.30.2025.08.04.05.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 05:34:58 -0700 (PDT)
Message-ID: <a4b2a06c-31c5-427c-a618-1f1c3704781f@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 14:34:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: qcs8300: add display dt nodes
 for MDSS, DPU, DisplayPort and eDP PHY
To: Yongxing Mou <quic_yongmou@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250730-dts_qcs8300-v4-0-5e2dd12ddf6d@quicinc.com>
 <20250730-dts_qcs8300-v4-1-5e2dd12ddf6d@quicinc.com>
 <f3aeacf5-f178-4e61-b34a-60353f89daae@oss.qualcomm.com>
 <d6559256-81e7-475f-b91f-04ae237a92f1@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d6559256-81e7-475f-b91f-04ae237a92f1@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6P6lP25G9FJo4waHRBKpIITw3OcHyh6X
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=6890a8f5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=WACavYXBwHx1I8TtHWAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 6P6lP25G9FJo4waHRBKpIITw3OcHyh6X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA2OCBTYWx0ZWRfX9NZtfoR9zTQL
 Zucpaj+UqlI2yD3KeFbrZdIPJp05C8/JgQ11+BbNENaLikbB/sLui9xgM8QLU8TPridnysmgm/O
 D5aHKCP8q8w2cNQW33Pf7NyeCB52Z22X4hEU3Tu5x7ZZU2PmyrimvO8XqiCjMenrxhIMrvyBlbQ
 +7dY3xXiRxsUZzRIR/ueNtXti2ekJ5cRKoULRaXi8lIBXJ4HYhqpXe95+Sf8TXVmiF6Zxf0AxeO
 sgT/hRX5oDFmsy/iZwzcCPWR2XxQ55U0KxyAqHFFbp4Aw1QzIE7aE3EjhyzHyfBqrrWD4tCwsIu
 1BUra4CPCf4BhUKDBA0cw57EVwUoZ71RGhK3qgY6GkF7vId41GuKVTOg63rypaj8FqQKcvAuQ+W
 3PzXzp+J2Wb+NXs7z2y8Uc6RKDkIQS1tEqAK5MMO8WLOLvCNHOzDwoC7anpi1QfRfxyyMP4V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=887 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040068

On 8/4/25 6:39 AM, Yongxing Mou wrote:
> 
> 
> On 2025/7/30 18:25, Konrad Dybcio wrote:
>> On 7/30/25 11:49 AM, Yongxing Mou wrote:
>>> Add devicetree changes to enable MDSS display-subsystem,
>>> display-controller(DPU), DisplayPort controller and eDP PHY for
>>> Qualcomm QCS8300 platform.
>>>
>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>> ---
>>
>> [...]
>>
>>> +
>>> +                assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_VSYNC_CLK>;
>>> +                assigned-clock-rates = <19200000>;
>>
>> is this necessary?
>>
> Emm, i try to remove assigned-clocks and assigned-clock-rates here, device can still work.. here we just want to keep consistent with sa8775p.

Dmitry, do you remember whether this is some relic of the past that
was required at one point?

The driver lists 19.2 as the only possible frequency for the source
of this branch

Konrad

