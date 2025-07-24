Return-Path: <linux-arm-msm+bounces-66490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE1EB1082B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 12:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EA7CAE5315
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 10:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E61E26A1B5;
	Thu, 24 Jul 2025 10:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Blb8Kj50"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE1B269D06
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753354405; cv=none; b=aYbAU6l9pO3FYb6suWCjbGFWkWlvOk0umF9yFaGlajxGPJN2v3bmOoGyx1zVlGF8stBL9xB3uKhVK5rWnyB8y+bLGhnKONwpQ9szynKij60acGu6nxedHWkYc6sBiW5XMB9i8h3nThIy1z4jy0ZAkSrM18YPESen13GjacmS6X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753354405; c=relaxed/simple;
	bh=1wZs7rxeWc3sgu57R3Lf1DTsgdty7IOeDXASPHpx6s0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6hmxMdADgQ1IAvdOfoHkYB/UoFei5jSHW2cO0IsDHhnLbewxt0j4Xk87sPZmsC3CZv/TQnrqW9owPKK/egudBTgKtI1r4c9m7k+0mpqG5p0pLEyNBfc+dC7XkqKBxsCToV0/m2cZzS5L6B0WZkWViAKtU4+fPWiMGdhWlwlRlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Blb8Kj50; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9egPx031272
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 10:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tfq20BQzBqBOKeqnOoxB+tXfk+WnuVGMzxjMCsnx1/E=; b=Blb8Kj50nMFFi/or
	puTBWO8MOJR6G3bdE47snTXnn/O1LTwcVDZTK9AQ3uFuzsQzGb/hGYUGmK7wT5+Y
	5QpTmltsM3kWBwxdhaR9XmuD8xtL6xRazqRS0ylKQr34ariD6Q+faSWxnZSIucqv
	ekUFP8DF+OsvV97kxlA+mq/4tXwudHTUFMoRGp8NhHKzU0Wvn9UrYjfLdOdllrt8
	sDZz173i2hlkke5iOZl66nb29cp/DYrKuew05kCIujkfJYO9O3ZGUzUjxvYZBZkg
	XkVKTeBKvTuH8tV/wp6P5eR/qWjsQdD3aAhWLg9ljHDyliBF9n9paeeCEqbhQqv2
	UAtOLA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vespp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 10:53:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e34e28a640so11485285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 03:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753354401; x=1753959201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tfq20BQzBqBOKeqnOoxB+tXfk+WnuVGMzxjMCsnx1/E=;
        b=vHew/xQqYckPHXy9WoCXWgDEu3fRqGFMfyhuMBESbfgADmLURnoh67AEg+K7DvHh/N
         OGXSGjtHJkLYB5iH2lJ9hW17to075ko0inCgMvE/hStwPl5NT+yVMED6nqLPFnkmi3uX
         HacH5WfR1/S87muOGg98L0QFuAg4RjGYybqhMa3L+UITNaSSQdGK3VyeFEFmtL5yC0F8
         +qaLoja6MMc9htKL2xKNjeqNiYhIw3O3XoksF8ZcOBGXpCYa/+c5Nnt90QTQlTyorO1w
         KWwnYUkgOPmr2bxt8AdMpIaXfJadiYaitCKC026X3XJ1aB/TgRMS+GUxgzBts0NzANNM
         Vv3A==
X-Forwarded-Encrypted: i=1; AJvYcCXnWS/K0z8vywSo0O+fqe0/NVK7/OD7mDmwxvnABJ6ppD+wgMLPNIPr9NbGw+JWqZKmqgG41542T4qT6JaV@vger.kernel.org
X-Gm-Message-State: AOJu0YzRCJKGe8UsDRls6uDTvAnlJIivSPhqpdu3mN3xlSzxTOrOaltt
	FszdameQ/CSABHyaTOlW3kYCmjnLOycr5X8o2hWi1Ak5aY438W8FQp5rcdgj3WLEkC3N6TuNEFq
	V4S8cCv7LNcIF15tXfQjV3YRLp83+VAoXqft8K2bwQHYR6Olgac0LOy3YgwUO71CguzVR
X-Gm-Gg: ASbGncsNwdGZJjixHf7kDJQLnzBpFXOJzb7tWTTiP44gmqPVEtpYRRqRvYv6z5XLtYD
	tmaqgwgch+wXjRaGyxsCwQeozqJSAAwxjp4E/gKxJoJEY7GjvWIlSj6eOuYzsZ5EPbBJKZ1o+XT
	xHQHHj1ZTYK/Q8pDm0uLAtMBUnL3vRoTx/fi8aY77Tbh6WsJL1omhaN5wrkmBoGHBoRfiKEgPEE
	HRObmKf25JL/wxagsEW6Eatra8pZgNJGU0tiNQdviEwuPPatwc+AiOkYF0ZSr4MXuPiu9jERP0F
	ONjaRQYwr7iKaaV/MZUZrnF/xfhlTED/OLe4qTzEGGjjtrQJ+UfPFusxbgeenENa5kZinCkye7M
	tbXbNe5jamuB/abrdRQ==
X-Received: by 2002:a05:620a:9605:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e62a1cdfebmr291060385a.10.1753354401387;
        Thu, 24 Jul 2025 03:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7qKOYrLpCIrlnTO2mUs/Rb0oINk/80uFDk0zZCUvwLLte3sCMwPuLusZ+uDK6mZO6rgCmgA==
X-Received: by 2002:a05:620a:9605:b0:7e3:297d:ec32 with SMTP id af79cd13be357-7e62a1cdfebmr291058385a.10.1753354400954;
        Thu, 24 Jul 2025 03:53:20 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47ff43385sm95492466b.144.2025.07.24.03.53.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 03:53:17 -0700 (PDT)
Message-ID: <7d444f4c-fa1f-4436-b93a-f2d2b6d49de2@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 12:53:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com>
 <20250723-topic-8750_gpucc-v2-1-56c93b84c390@oss.qualcomm.com>
 <20250724-blazing-therapeutic-python-1e96ca@kuoka>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250724-blazing-therapeutic-python-1e96ca@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: C5GlKqS_YHsWb3BJWwSXUOhKNL_Yb-Sr
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=688210a2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=y9Hb3FDJ_D53AYP2N1gA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4MSBTYWx0ZWRfXziD81RuOpaOl
 TCwXA4WLzQtJJ2UpyKV5Y/ExeD7BZiMwCjGFX3wuTfMd82EUUwc4Io2subsya0bfvGwFRrlP4Zw
 a6oXZv8xufiz6kN6A3Z8oQWBkRkcJRhg3e4kUiPyz2mNYPrYksk8Uxq/Je/dnQ9wjV4e3ElVSUj
 R+MVnWFc9aihsrLqERhUNNBuN1yMLwbzQYYiyFRxVWi06SJTjNNTqdyQiyKX1P7uUjWAflfOJC+
 /MBhuMUTFi2PT6gHXuqBr6lI7M7R6LSU8DNYrWtrPilET43DrWLPKmQu02RUNQjykuQogO4BO4X
 AGvZyirHb5xWeWHIpWk95jOMwk7s/U9kKJJQrnPu+GX1Owt5oDGZ+aOruFwsvRkO99JIphN0Nkl
 6fetCs4sZkudgazU9PtHcPOfv7IKy1/VUievqoNI0lqqZyKys5heSg7flluEpSVEnX6UF7kM
X-Proofpoint-ORIG-GUID: C5GlKqS_YHsWb3BJWwSXUOhKNL_Yb-Sr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240081

On 7/24/25 10:18 AM, Krzysztof Kozlowski wrote:
> On Wed, Jul 23, 2025 at 10:38:48PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The SM8750 features a "traditional" GPU_CC block, much of which is
>> controlled through the GMU microcontroller. Additionally, there's
>> an separate GX_CC block, where the GX GDSC is moved.
>>
>> Add bindings to accommodate for that.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> ---

[...]

>> +title: Qualcomm Graphics Clock & Reset Controller on SM8750
> 
> There is no clocks nor resets here. Only power domains.

There are clocks and resets in this IP block (inside the register
space mentioned in the dt patch/example), but the OS is not supposed
to poke at them (it can in theory, but we have a uC - the GMU -
doing the same thing so it would be stepping on one another's toes..).
Not sure how to express that.

I could for example add #define indices in include/dt-bindings, listing
out the clocks and never consume them. Does that sound fair?

> 
>> +
>> +maintainers:
>> +  - Konrad Dybcio <konradybcio@kernel.org>
>> +
>> +description: |
>> +  Qualcomm graphics clock control module provides the clocks, resets and power
> 
> Also confusing.
> 
>> +  domains on Qualcomm SoCs.
>> +
>> +  See also:
>> +    include/dt-bindings/reset/qcom,sm8750-gpucc.h
> 
> reset or clock path?

Ugh, clock

> 
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,sm8750-gxcc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  power-domains:
>> +    items:
>> +      - description: GFX voltage rail
>> +      - description: MX_COLLAPSIBLE voltage rail
>> +      - description: GPU_CC_CX GDSC
>> +
>> +  '#power-domain-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - power-domains
>> +  - '#power-domain-cells'
>> +
> 
> You miss ref... or this is a bit confusing.
ref to what? qcom,gcc? I specifically omitted it, as that adds
requirements which you stated above.

Konrad

> 
>> +unevaluatedProperties: false
> 
> additionalProperties instead
> 
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,sm8750-gpucc.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    soc {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        clock-controller@3d64000 {
> 
> No, clock controllers have clock-cells. This cannot be a clock
> controller if it does not have any clocks for anyone to use.
> 
> Best regards,
> Krzysztof
> 

