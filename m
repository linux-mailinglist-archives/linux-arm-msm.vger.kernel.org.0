Return-Path: <linux-arm-msm+bounces-40594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 638909E5C99
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3090916B3A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:11:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558F3224AFA;
	Thu,  5 Dec 2024 17:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HnDIWsCH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BA0221475
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 17:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733418714; cv=none; b=nlyM5oVkAWeTxe263juQHE5d1OeBjVt1atG0PHGvByHrQ2Ih1sOayo+elYYeI5FNO2rFL7dVaio6RzCEXGQ3JboMR0CwwTYbBOLz40556RlBo3D/B59y6N3Z0GWKi5MALqSWbK93YbjSZpc0kojcX5RP3aquif8TkJqciJ5gL/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733418714; c=relaxed/simple;
	bh=dCs69MV7Zl13hYC0C6jT1S77qqNojSyJoi8ckLIfCco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fn20LLvYKEXn1cLelzOCQ+h3jUfxm032hKNbW8+nIzbzZAZgnhNF1YMj38p2JSrJpnDqCMOlTltBpIT/CZ+xcNYs8N/Wu95gwWegcfkLVu2uv98UTWVAm78HcaZgV3FxJo7rkeSBqF6Ws5wiBXkeT6QTpfx+T0RQshQKE9cCFu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HnDIWsCH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B59wx0S031218
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 17:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iISSlmHBhud/xihnWsovVA8IVHWDvju+1GFNeF5yZcs=; b=HnDIWsCHk8Mj4dMC
	zBkODNviAiZQbWf/PfJO1Iw2IbgvjJjiBH+cUbz/Bmn84/BBo9HtmhbFo5WVBe7Y
	1aumpqeZ4eCBZ/QektCuk4X3LYCUeP8FxaOZ+2EmMHwd8XKNd+SDuOnzExwS/BvG
	xLX2hUBSsLUnrppLn+kG7owiCdEP0ATBpcxnCryfGYpd0nnTPXXWjbzfDiyqoTV4
	Ka4+L4FQBbn5ztUvshlSq7af30qG+70nyreIYLoDB+KZVUX3exoGVp4cB+tvqBE7
	aMnPOplEigw5zTBM08hkclodM0IJ/iOx6AumlIHXIV3vU0gRzDrF3KCUqNnJwpsb
	iuRD9g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba1416ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 17:11:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-46680667b3aso2766691cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 09:11:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733418711; x=1734023511;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iISSlmHBhud/xihnWsovVA8IVHWDvju+1GFNeF5yZcs=;
        b=KRxctkTjKmIUm8OfqvigLOt2fQcWvBhg4UuRmxlsMp08K2sGBNgZZ0nuIOv2UtBPZQ
         6Edc0RFJdruVN11dFUgeJ+82F7MJyNdKpZWm+5xuYWNDQnLBt5+HT9pxi0jdYaRge9tF
         HectZAhHB011o08pHOL83H1QSW+HAAZ1t2qtXK2GT5Fep/0iYVZ5lBe09YoUW64yjmIk
         uVbNSGL54iEWmTgaZe3teinYNn2sh+iqi+UcbBZA8fxx57x5couJCcPNU1e42+7c8VjD
         3ubqIkBWg9GT4TWxVaRK9z5Zu63iZnhUa/VToaDWgjBmEgu+iixPyzudGRUESVkezVD8
         svFg==
X-Forwarded-Encrypted: i=1; AJvYcCWMgWMDYQTSVjxa3Sfp6QZA4XZVifudw75W+4XsoVMcwR3NhGlol6rH9XMNCTp4ejbYnhmpW2wr4eyfcJkS@vger.kernel.org
X-Gm-Message-State: AOJu0YwnZS7126e8t+OXlTGLgpEa20yZ5YXuVwkBXM9RFUbYHI4vazLS
	e0QF7fyH2+Zwh+rCQq2XPycFsCrsbk+nyClScea1qGekvRmmQyVGpPQdtXKuEw2kACtJV5fgPQG
	oWDDG9uPIfxXZ8kBj02ZNwHze0islSe8HiY1/05Ccl3II0BH/bGkN2vK/IY1wAEnb
X-Gm-Gg: ASbGncsG02XRrwsC209MBxYj2UDFvJuEW6NtozRuL7x/JeyTWQ7AL/mS72HQz9ltj+p
	BcTMoTPZRCig8GDutHEuoEomk6ssnsJFi2QcYKqCGqdsUChtfuISoS3VD7+x2xJpNxxtLv4ELjK
	pyPX77qlEuj/0KFxV2OXjCu1sGSMKeYUk8bsQXzaaNY7YK6uP0Xn3CyUQZ5hZPhwPktrpgnHNhj
	rfftCe63k7xsrocZ6N6sLjb5SwbsdtzSNr7Kt7HKWi8L+nxIKYgKuNqM+5pUiHUgcCZjlTzqK/J
	hFTaVB/9Th9IEj1+eIqUUcYfXeS/uYQ=
X-Received: by 2002:ac8:5f07:0:b0:461:6599:b9a with SMTP id d75a77b69052e-4670c3742e7mr76002731cf.11.1733418710624;
        Thu, 05 Dec 2024 09:11:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAbHnaeccAVKfK59GB3HmCo3D97/mpGW0tfexIEEgnv0fxEIWEHBsUs05bec3U+1U+fCbf7g==
X-Received: by 2002:ac8:5f07:0:b0:461:6599:b9a with SMTP id d75a77b69052e-4670c3742e7mr76002491cf.11.1733418710144;
        Thu, 05 Dec 2024 09:11:50 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4eed9sm118085566b.2.2024.12.05.09.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:11:49 -0800 (PST)
Message-ID: <afd010c9-8c24-482e-a479-2396f08c972b@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:11:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC
 supplies
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Johan Hovold <johan@kernel.org>
References: <20241203-x1e80100-va-mic-bias-v1-0-0dfd4d9b492c@linaro.org>
 <20241203-x1e80100-va-mic-bias-v1-2-0dfd4d9b492c@linaro.org>
 <f65e1559-b409-4906-aabb-eb24b5b0fcf2@linaro.org>
 <Z1ATxAsXFhQraQwH@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z1ATxAsXFhQraQwH@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iO-G1miwD9nfzwJRfz2NmoaZl5ABAAVS
X-Proofpoint-ORIG-GUID: iO-G1miwD9nfzwJRfz2NmoaZl5ABAAVS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050126

On 4.12.2024 9:33 AM, Stephan Gerhold wrote:
> On Wed, Dec 04, 2024 at 08:20:15AM +0100, Krzysztof Kozlowski wrote:
>> On 03/12/2024 18:44, Stephan Gerhold wrote:
>>> The WCD938x codec provides two controls for each of the MIC_BIASn outputs:
>>>
>>>  - "MIC BIASn" enables an internal regulator to generate the output
>>>    with a configurable voltage (qcom,micbiasN-microvolt).
>>>
>>>  - "VA MIC BIASn" enables "pull-up mode" that bypasses the internal
>>>    regulator and directly outputs fixed 1.8V from the VDD_PX pin.
>>>    This is intended for low-power VA (voice activation) use cases.
>>>
>>> The audio-routing setup for the X1E80100 CRD currently specifies both
>>> as power supplies for the DMICs, but only one of them can be active
>>> at the same time. In practice, only the internal regulator is used
>>> with the current setup because the driver prefers it over pull-up mode.
>>>
>>> Make this more clear by dropping the redundant routes to the pull-up
>>> "VA MIC BIASn" supply. There is no functional difference except that we
>>> skip briefly switching to pull-up mode when shutting down the microphone.
>>>
>>> Fixes: 4442a67eedc1 ("arm64: dts: qcom: x1e80100-crd: add sound card")
>>
>> If there is no functional difference and this is just redundant, then
>> there is nothing to fix, so drop the tag. But the point is that users
>> might want the low-power VA. You claim they don't want... sure, I am
>> fine with that but there is nothing to fix in such case.
>>
> 
> The fix here is that two mutually exclusive power supplies for the DMIC
> are specified in the device tree. You can only have one of them active
> at the same time. The Linux driver handles that gracefully, but the
> device tree is still wrong and IMO deserves a fixes tag.
> 
> The functional difference is that we skip briefly switching to pull-up
> mode when shutting down the microphone. Users won't notice that, but
> it's not the intended behavior.
> 
> I don't claim that users don't want to switch to the low-power pull-up
> mode (VA MIC BIASn). However, we would need a different mechanism to
> give them the option to switch at runtime. "audio-routing" just
> specifies static routes, so the current description does not allow
> switching between the two modes either.

Is there no existing mechanism to alter this at runtime?

Konrad

