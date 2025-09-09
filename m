Return-Path: <linux-arm-msm+bounces-72739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE39B4ABA0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 13:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2B2E1C62D64
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 11:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34CE321421;
	Tue,  9 Sep 2025 11:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="isSJbq0u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026262F0661
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 11:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757416886; cv=none; b=UpGY52r4HthgacfxXZ4mEVX9YrMHQSBWj/NnUWFgOX31Lsg0dl5C3vbJiZUmMKkVp3GU8OnRlCJL5pCmHdYXSm+6DIJ3X5LeDocHlvLNfYijcNGZSZgh5inqyE82zQbLoo+4pIeG6zi7PZTkMrCIimE2YNIPxtJOFcsUivo9fnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757416886; c=relaxed/simple;
	bh=bKfd83EGW+aiNvmlRY0fMI0vO1ztB5ex52PNFvOrP0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Di1KzSEEDG+fHwQs1RsAxNqf98jTL/vYvgCrj320QUajsFX65oMKs9+A5/LAuNUdPZWzjbydmZWnYE6yTdWldwIH/fsJyg2F/NYIkW4RqlNlYoJN/k9a3vuVaCOWC9jcKRWEJ9BFgC2axR6Lk088rDf92A4MK2J7+8pZKLwtS6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=isSJbq0u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LSQ6003616
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 11:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HIY+rDS/Ojh2ctDZQPuEjHteQ4Q9hFu4Pzq36e8Lb/g=; b=isSJbq0uSQPg7bI1
	J++DRhdfA1wMOKF8wC6+yo/pPFQu3k4CDwUcXSoc5ObmLQXl9E70sk4RKnMFIGOc
	olmaXQZVPuuXBaefCSMrROSjUV7kmskNtYCTgigLdAtrq6xWYz9LRwOH3HSrvZWQ
	4GHVfkxuzav8yKD9+689rK8hMQ/0DMmNoZXAzq/q55n02/QZU/qq71qqFispxdQL
	IRa/n2AkajKGlR/tHHG6ujXwZ5E4dkK1o8DgnvnxLHk3D9kklXWlPfRldA34IBkU
	vVXxSS5eoIDnNoBlexLLMQexZ4T61Z2+ZRJx2JSxwPv3GKtpCN5adCIrsTLxN+Cj
	d+oCNw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapga70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 11:21:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-819d2492a75so27956985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 04:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416883; x=1758021683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HIY+rDS/Ojh2ctDZQPuEjHteQ4Q9hFu4Pzq36e8Lb/g=;
        b=JK2F7lUxNjn4mRoyncqojjuAttxqfzhujrPvdKD2WFq3sctJSyk+gNWHgKbgfHB668
         NipF0XcAhJrlEKH1dygpBfdBGmIwpSBdUN1Rfn4JC3J6cV2KQq178yqPjmlKX5JUk9rL
         9rJuCm/PrYATipoVoVHgH/I4KmA4VSdpgCykhI7LcwG7izVllLe/qtCS5tSLEnMPB9F3
         0LL0HUZ7KU69I8ZvauvK+WqXLyxV0SQCTl+jUqVnOKSGiPCir2WgcY6RG7h008RjwDui
         JcaiONu8K6noSbhIZWlsaYJ0rqqTV4iYLA7iBi3YxD8/SeUxlb2l19m4/fnZ7VG1GVT4
         qjmw==
X-Forwarded-Encrypted: i=1; AJvYcCVlhQ5w/58W8/v75cztjKyQWk/Xj5rpqzJhY24XTtCptmv1+aAxheKxlim/JGFZaY4Rj6xOdIdUz7ILDJGm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8jMh7ggzrXJ2IumOdaBY7flyO1/4p10aOHVk5FdO7U0ATVXNw
	bmCEsA3RMWKBZIik+x/K1Glr4LlChWd6/OzyagpVhpaohcNszkYMuGmkMR4a0gtrd9C8Xgb35u7
	vTXEYEHmyPXltr8dCi50hMzJ9KAIAcbIgjtXP65Pb83tqFH+3bSrTfCI/beF0CkS37Rnn
X-Gm-Gg: ASbGncuZzaaFNYRLehGVwJPYw//ruAmsXjJiKYeuok8SOixzhjsp5QQ+ct7I/adKuqa
	r3ASQud9jVQ0OurUlVoVlGzr3ndvS3+oTTAC75Lf5tForh06FnAPE4g9/sUkwGOIv5EvTbuOS0O
	E4yacptKnPsbpJA0oH7Usgd26U1IYDUwlHj20YZ6zyzlTWg/JmPN38id83ld5XZsTC5v33o2ZR5
	CDHzdyqtlmAepN4O6EKB8dJqq7TCpkeyUQmRwYv6TdRaOcWP2WEuCl7JJf49GfmJK0rWE3MdTkn
	ZwJDedyJ8P0caSWCH8ouEhQeqfOYG8J0CmT6QDCQX/PsF6B/rAMMF8aosrlmv0L7BxjOzepUuKI
	WW3w1M0Datzg5bajPcLo1fg==
X-Received: by 2002:a05:622a:488:b0:4b5:f0d8:c265 with SMTP id d75a77b69052e-4b5f83570d6mr84970001cf.2.1757416882891;
        Tue, 09 Sep 2025 04:21:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqTKupwZi6BVen7gNsper3VxyomXaAVS6ZWiqIWE5W+J094ukf4dWiZ+B5kiS4EVU2QEVOjQ==
X-Received: by 2002:a05:622a:488:b0:4b5:f0d8:c265 with SMTP id d75a77b69052e-4b5f83570d6mr84969561cf.2.1757416882146;
        Tue, 09 Sep 2025 04:21:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff08b86833sm2622560666b.48.2025.09.09.04.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 04:21:21 -0700 (PDT)
Message-ID: <da984d8f-85ae-44cf-8de4-208bfc9e292d@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 13:21:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy:
 Document lanes mapping when not using in USB-C complex
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250908-topic-x1e80100-hdmi-v3-0-c53b0f2bc2fb@linaro.org>
 <20250908-topic-x1e80100-hdmi-v3-3-c53b0f2bc2fb@linaro.org>
 <7dzfcuvr45h4iailtjutqjev7lofoqu7w6ob77gehgmy7mctpk@k7oob4wj3c7a>
 <14d58c6d-ca20-4349-8031-9906a4539fef@linaro.org>
 <c25kbb65aijgolxjzunydvhupt774pfmbcz5lvfvl5f74rrxtr@vboh347gdvdp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c25kbb65aijgolxjzunydvhupt774pfmbcz5lvfvl5f74rrxtr@vboh347gdvdp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c00db3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=iAPsCBKfci-S516yzPgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: _qZD1x4Av80bjQ5AKo674W3nA5YYm9fG
X-Proofpoint-ORIG-GUID: _qZD1x4Av80bjQ5AKo674W3nA5YYm9fG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX0jWJ710zChaG
 6nL3U2wbH/4Zdw7ua7olxlDD7pkTOqjQ6cBSey8F7bEjmBAwhKBs1oE7+8W4JnE7XITHogMzsdd
 XrFK0y4Xtm5suhHlgl+gSRpBwPTEG/IwpjdYAY9k0Ga7Yipr0++xQUDgweEnShsMTTwA4oZnXeJ
 Ls4znJ1CDg9IEaWRP3i28Yj7pKpmvT+pKbhplqmRko7Fmqet3kOFGPwZPSIsO7G6zYkeYH/7AuO
 oAFEXmqiW1Oa2HtDiwp+epT5Gy6fy//t6RyYHmeEHNxpKNBBPwL33AiRfsPDNHMUM2mI+VENUvs
 K66fnTbwOtwCq7sQmp0j1AJf38wUzJmECOy+MiC9Ww783V66sWTeCw5jbqnJh4ziHKztMLrk3gv
 6mDPdamY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_01,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

On 9/9/25 1:16 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 09, 2025 at 09:14:49AM +0200, Neil Armstrong wrote:
>> On 08/09/2025 23:14, Dmitry Baryshkov wrote:
>>> On Mon, Sep 08, 2025 at 03:04:20PM +0200, Neil Armstrong wrote:
>>>> The QMP USB3/DP Combo PHY hosts an USB3 phy and a DP PHY on top
>>>> of a combo glue to route either lanes to the 4 shared physical lanes.
>>>>
>>>> The routing of the lanes can be:
>>>> - 2 DP + 2 USB3
>>>> - 4 DP
>>>> - 2 USB3
>>>>
>>>> The layout of the lanes was designed to be mapped and swapped
>>>> related to the USB-C Power Delivery negociation, so it supports
>>>> a finite set of mappings inherited by the USB-C Altmode layouts.
>>>>
>>>> Nevertheless those QMP Comby PHY can be used to drive a DisplayPort
>>>> connector, DP->HDMI bridge, USB3 A Connector, etc... without
>>>> an USB-C connector and no PD events.
>>>>
>>>> Document the data-lanes on numbered port@0 out endpoints,
>>>> allowing us to document the lanes mapping to DisplayPort
>>>> and/or USB3 connectors/peripherals.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>   .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 59 +++++++++++++++++++++-
>>>>   1 file changed, 58 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>>> index 5005514d7c3a1e4a8893883497fd204bc04e12be..51e0d0983091af0b8a5170ac34a05ab0acc435a3 100644
>>>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>>>> @@ -81,10 +81,67 @@ properties:
>>>>     ports:
>>>>       $ref: /schemas/graph.yaml#/properties/ports
>>>> +
>>>>       properties:
>>>>         port@0:
>>>> -        $ref: /schemas/graph.yaml#/properties/port
>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>>           description: Output endpoint of the PHY
>>>> +        unevaluatedProperties: false
>>>> +
>>>> +        properties:
>>>> +          endpoint:
>>>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>>>> +            unevaluatedProperties: false
>>>> +
>>>> +          endpoint@0:
>>>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>>>> +            description: Display Port Output lanes of the PHY when used with static mapping
>>>> +            unevaluatedProperties: false
>>>> +
>>>> +            properties:
>>>> +              data-lanes:
>>>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
>>>> +                minItems: 2
>>>
>>> Nit: DP can work in a 1-lane mode. Do we nned to support that in the PHY?
>>
>> So the PHY already supports 1-lane, but the QMP Combo only supports
>> mapping 2+2 or 4, but nevetheless we can still decscribe 1 lane in DT
>> int both in & out endpoint and still should work fine.
>>
>> Do you think this should be done now ?
> 
> Do we support it in the PHY hardware?

I don't think the PHY cares if it's 1 or 2 lanes

Konrad

