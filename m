Return-Path: <linux-arm-msm+bounces-88088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 376A1D02F90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 14:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F2012300C9BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 13:22:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4842A3563F9;
	Thu,  8 Jan 2026 13:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g3UVz6ea";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0Kc4aAI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0964D4E3761
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 13:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767877625; cv=none; b=Ua4/4xyCdZuZsW4BzZ/kbdrB+ZnEX1hYrecje6Up7YaH85YpcWqKior4XXT+nQTO8p5ncSB/DQ1//mLpahME6KCCmu3d/gKp8frGqTgCIRY4yM7Vanfbx2e/nIof0WMUMxAT8sWC0hMF7F8vDH8gA9vZJxyb+jNsDTNiBUEiark=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767877625; c=relaxed/simple;
	bh=K0Oaiww/Rg8fxiU1jZGdWZ1S6VmMWvN3JDKS1k4AXiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S867eHj4oKhy1eB/BiAWXSeedF6Aaq7lAmKv0VPxrR28qeZMb1hxdmP8OVxzCffKsnbms6smXcnAWn9XSahp3wWum8rXc6t2y0//inVki3U7JL6Sr0qnesgIXGF+ZYZXndNtArfUUuP6ZmRKVIM8HHOjk/mz8d2RF4utDqs3VRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g3UVz6ea; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0Kc4aAI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6088fh0K474505
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 13:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUn6Ua0irq2W5sHxLwtBxmGIU513ahneP6yzFFKlGqc=; b=g3UVz6eask8qZSkv
	nLynJ+gSRz5l7kP/WS6hAn2QcXOV196VO8nkeaDp4gW9j7OinDicCQSw5fZipY5k
	TO5TQCXpNb7oADx6Jn0ATqkd9zctiJh8WpgCs4g/Yz202cNRrYh8hjumzOii0+A+
	XLM17IdX7YHTWFPu7AdHJ+AV+WceZQjtYD5q8/Dd4w2ZdCa9IldaJ2kCeubSMoza
	TnLEUYoQk8vFSkFCuQJa6KwHcfIFXWSJlOFFuL93lmIaKLs/AUxv6/exOALwJHe3
	glqqXWhiowQC0dDAsUVxgRkfGvamQ2HsvzliO9eh3zHn4XpYZ0QHyvxy9wW6HH/I
	ApwurA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuy735uq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 13:06:59 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5634c1f3f94so240890e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 05:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767877619; x=1768482419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TUn6Ua0irq2W5sHxLwtBxmGIU513ahneP6yzFFKlGqc=;
        b=R0Kc4aAIQE42ONqmU2Msl7Q8bqQNSs6GewCAM7MeCxd3t/WeZ1SNargEzSaThXT1JX
         5cK2bd6uxi9uQHRCNcMugSbxO3zDMuTnQEHK4r4S7wZ1YCH0OWNiEDK3liP1y6u6ajz0
         G/UWsxp91zyLC3S/tVTVGvSKHiRosvxlv0OHwAD91odfe6/s8UKYHkZzUzBywTlccMMe
         X/Uf/cxKeiIZDvETR8TPIwThlTZKlfFIpiaMHGtmbIqdq+KRtHsdQNlmKkDAludf7Q45
         K9pC0fHYFyAcydxfOkHaKV1aGAJe6gSJHRggOllOsL9ywK84J4Os9g8hzPjF2gltePY7
         oU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767877619; x=1768482419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TUn6Ua0irq2W5sHxLwtBxmGIU513ahneP6yzFFKlGqc=;
        b=EXymHMWHfxUxfF5Ww6ML+nrdVmZ9EZFxoBd7fXksXw3MdSJOeCZ5yk49ivrKVZphLh
         f4nqxszkQRRmH897ALhUZm7K1LhOWT33I1lLxSmHJ53Wjh02MqhVZL6fFibmgJjaCGlp
         FBKlkn9JC3UhlQxWRtkmYL3g9zznHdmywCtI4TSx+nkZRe5QlQzQsyCKDA5yces+e0l7
         thToFawETVyf4bC36gbW0P4qeAwG24GPpKbJm552o72t6VJOdk6CNAbqCfXM+TNVHo4D
         jNYQ6n9MAMyVvkGlStFEu0tOU6QixKfaUVcT/zTLLqKcy/Ob6EoPqXu99MyCR60lkbPV
         aytA==
X-Forwarded-Encrypted: i=1; AJvYcCXBN1AK0H/3EcOKdupBxlfdFD0czi+It5X/i7MnIzVi+4PNTggbRwk6hyh+m/7kre4K0G02IN7p/YlaLtgZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw837IOlB7nxwm684YZZEofSIuHKVFuzsgzlzsLKoLKTVXqh5mv
	1fyMSUW0aLdwzZ/aoAynRUyFAbCJhQ7D6zMA4/3Ru5M5b7VyAjBl0ZQvHY1P2U7O3fpHkBv8C2F
	vu0CJa3MiHRXMs7JKhe0LcFZHlbZFtHek8WkvLUM5oTVg5bR8+HIE5q7kmHuckMSg3Vef
X-Gm-Gg: AY/fxX6xeo4LRjUAASZGYycgl+/magefD87RVZDDHsWICMFDOqFcOFKpagUDSmstxPE
	OvR1a/Adcmq8lWQotds7u16y3eR5Gaz5oqgWMSNpfuurm1a8WulXmwYHOusq6oBG0oqjK+tj4Ux
	MC4ZW6h2xWTU0j5JaZscDiSy7jpKEmXxltEll5XDz6yLvzD9I7ZlJFovprUpubwzRZV29WXdxKg
	OIXS4CyXi1vrH2sH4KRrw+vmkOMNwQlPe0v2/mVW3RhXBtzA+88NqbwjtzS3sINkEmRjA0Wb9HL
	+Y0teUgPMpfT/b9fP+zs9JV7BtnK8jxUdZbZ8t0AaEfL0YtwY0lm6bCrd1wgAd5Lh6CjX6RtDDd
	jqMKYLqT1j1EVpXpw2FvqKDnUkefSVFXliNtpfNDcMNhHg3qSAkeG6xfEGqS7rme5MpQ=
X-Received: by 2002:a05:6122:9003:b0:563:46b6:c012 with SMTP id 71dfb90a1353d-56347fcbbc0mr1231219e0c.2.1767877618988;
        Thu, 08 Jan 2026 05:06:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM6THmWwV2fR3KUg7yi7Oh9gT4bjUwDn9oFwUR+wc9NeBAAqLRuMtnsEY3gLURL0H9lTIGsQ==
X-Received: by 2002:a05:6122:9003:b0:563:46b6:c012 with SMTP id 71dfb90a1353d-56347fcbbc0mr1231199e0c.2.1767877618418;
        Thu, 08 Jan 2026 05:06:58 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a233fb3sm796969766b.12.2026.01.08.05.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:06:57 -0800 (PST)
Message-ID: <ebe6763c-4ea0-490a-8218-5e34a92b83bd@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 14:06:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: tessolveupstream@gmail.com, andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
 <20251230130227.3503590-6-tessolveupstream@gmail.com>
 <30ee8541-3ec2-49ac-8fe0-987cdc5b16e7@oss.qualcomm.com>
 <14613f89-6be0-4eb3-beb5-375ab008a313@gmail.com>
 <c3492b90-bb48-4584-99fd-b1b6832d22ff@gmail.com>
 <4d95232c-f59a-42c3-9eb4-934b58429d25@oss.qualcomm.com>
 <46fac652-e6bd-43c9-a57e-e76d66239407@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <46fac652-e6bd-43c9-a57e-e76d66239407@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fOb2nwk4Wa8rXwJ7OxxEAFn8yFUU8VTH
X-Proofpoint-GUID: fOb2nwk4Wa8rXwJ7OxxEAFn8yFUU8VTH
X-Authority-Analysis: v=2.4 cv=DZEaa/tW c=1 sm=1 tr=0 ts=695fabf3 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=Ehsfm6Wq_AdUf0OWRNoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA5MyBTYWx0ZWRfXysC8qD01Gp5Y
 cxaJhIjfDhSTAunp9Zv6Eg5/D8iST4eiYnlnIb7WpN6/IQqKQOa0o1BACPl4xGDEAntEf5Prg3w
 2Ysfi63PHIpqcxIw6JuV9nxqLSxhGl4xn+m687g6Nbl+A0aNW4SNcDJt7Yr3QunuGRMqfBqaG6o
 sVlR3+GqCfEpSN+h/PjBhfAJvn5Td3kRZg5Bv+rl19CwZrii5Wb1jf7KzbgNtdnbW2ZPBlNuHbo
 NZPOadhrbiegPHNrb809a0AFVxb+p2lOLK5Zqgo6LK+GdMfzE8DZECfnNUOubu97TCh+sz23FqR
 xvjHFGRhS9oJM1InoSL5MkZx/HX0cvgueOc0ir8yKnB6v8COnOqGR4WFOly+5AooIW02aH+ASbh
 elZMOpro8qPFBXI2nlKE/yl97Vv1YmEnlbfJupinnZcue65k4f3ahRVXMx8rvr87Pznq2aBXaJN
 mBZd+o1iBfBAbiS4wyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080093

On 1/8/26 2:02 PM, tessolveupstream@gmail.com wrote:
> 
> 
> On 08-01-2026 14:06, Konrad Dybcio wrote:
>>>>>> + */
>>>>>> +/dts-v1/;
>>>>>> +/plugin/;
>>>>>> +
>>>>>> +#include <dt-bindings/gpio/gpio.h>
>>>>>> +
>>>>>> +&{/} {
>>>>>> +	backlight: backlight {
>>>>>> +		compatible = "gpio-backlight";
>>>>>> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>,
>>>>>> +			<&tlmm 115 GPIO_ACTIVE_HIGH>;
>>>>>> +		default-on;
>>>>>> +	};
>>>>>> +
>>>>>> +	hdmi_connector: hdmi-out {
>>>>>> +		status = "disabled";
>>>>>> +	};
>>>>> This should be a &label_reference
>>>>>
>>>> Okay, will add it in the next patch.
>>> I noticed that in several existing .dtso files, the root node is
>>> commonly referenced as &{/}. In your comment, you suggested using &label_reference. Could you please clarify which specific label or 
>>> node you would like me to update here.
>> &{/} must be used for root nodes in a .dtso (for it to compile). I meant
>> using a &label_reference for hdmi_connector
> 
> Thank you for clarifying. I’ve updated the patch to move 
> hdmi_connector out of the root node and reference it using 
> &hdmi_connector instead of defining it under &{/} like below:
> 
> git diff arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,
> index 5393d1dc7fea..bd1cbfc866b7 100644
> --- a/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds-auo,g133han01.dtso
> @@ -15,10 +15,6 @@ backlight: backlight {
>                 default-on;
>         };
> 
> -       hdmi_connector: hdmi-out {
> -               status = "disabled";
> -       };
> -
>         panel-lvds {
>                 compatible = "auo,g133han01";
> 
> @@ -49,6 +45,10 @@ lvds_panel_out_b: endpoint {
>         };
>  };
> 
> +&hdmi_connector {
> +       status = "disabled";
> +};
> +
>  &i2c1 {
>         clock-frequency = <400000>;
> 
> Could you please confirm if this change aligns with your 
> expectation.

Yes, exactly :)

Thank you!

Konrad

