Return-Path: <linux-arm-msm+bounces-46272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F54A1D88F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 15:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 344421631B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FE431F957;
	Mon, 27 Jan 2025 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9l5Upco"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9157C3D64
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737988830; cv=none; b=lJrtp5m03jMY0+4s1SpRv5J+YT3EIF0LCBdJ9m/YZPbSkG4lcapkgikUuDCF11p82sYnNrqg1R2UzivtYK0UJEn661OEyc27fh0oonyL2e1W9wDb8jDmsWYpPsvFZLTbfW5Lo2DZScXBVk1ri9uZgHQdtvm98Qw+EDbLQrHAmGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737988830; c=relaxed/simple;
	bh=XCuwwPpwNHaso4f/We58QgAX+P74MXMk8okJSiKhnYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OEJrQsrA0iI/5n/vF9+JGUg2jR4dHSCqnBI8/dlO1OHvVd/EZuTxOUofrNO3Q/U93UYjcHgdeWE7IMBy6CE/+HewMOzObZY61Qriy4nd96Uh9KnOFxKvl00H2GItZCZplG3XWonyR+VF1yVefBpXyR2T9rmsKNg1keXRDWUwjbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9l5Upco; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RCigCu009738
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 14:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RPkIgots0pbMhl+JSUZMZ4MYf8G99bd6y5VP+rDeF6Y=; b=e9l5UpcoUP3ewewm
	JfWDprbdFLnu/Or61gDN+jHrjuYsIAN80Fp9gjfJntvVUDe6LtryY8vYocjp7yK5
	yLRAXR0KObaM3SUPO7dd5AfRQ1odL+Oiwb1yYb5ipd8o63lzoRNw+cnoRY5JPsau
	tEModkmXAO1utJwesZ1RArRYu23QsxyqV8qwznkaXLSpYTjEHDl36DGyOuomqP6t
	CDrUAlzE/ATB8q9jBy+8FFOOKDGZ2Wj/S/aYy5sPkpljHs2VsqL7OC3FixtqqUgH
	3mR6Jt2UryeGrxH97m67diw+4uylK4YLIU8WnY542ODERKeLL0gemMNiPwdNnQSS
	eIzZSg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44eadvr78d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 14:40:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8e7016630so10511986d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 06:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737988826; x=1738593626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPkIgots0pbMhl+JSUZMZ4MYf8G99bd6y5VP+rDeF6Y=;
        b=kk9wY39CFRRzeUEH1GMkYbQqvNcuw3QG+XfMgqLnJa0jTSs+kW3nCklQJ1QIxsOLkQ
         a00nJhalIa/B+oRveQsfIkf7dNr3Ex8Pa2yJ7bcxM5UMXBIB06H1LqQkn1EBS8xO+8uz
         S0vn6aCOVhWm5p9LMN+SE+gtQC/x+SuWV4lj8JOsm2KihcfaTKaSHj0CB8Ylz0mfes5z
         /tEkBKqmIYWU/FVnwEJfSbD+KNgUa2MveLQSyq5q3kHSoDWlWkfkv6PE/idInNkuGPKb
         D7nwx65NqFbyFqtYxLc3fqQqTChXxEmPpLLA8MEGuGE3NonyG/7i7emtyQSsrz+9ENzN
         dCcA==
X-Gm-Message-State: AOJu0YzWXpArWN8bNM/Ww2QkCdGIA4lktT7c7ao4z6VxMSGmKmMbQO+9
	SFO/LQzibYYZPJh3VV/U3461WuHB6LaYB7MreDSFlbLjwmOOvtlITd2VzZVqSgqes6FdZt4tgr0
	lhjhS+JbjciZBp22LHMnDrsIa7vT2riGs9NWc9ny8cscuOz2/3bET0Gj+WnskH2Vh
X-Gm-Gg: ASbGncsF8GGnqIkqXg9DfCylWR+Y32Xvf6im/MjqVl3VSuRgu/UPCbR0TrgY131sSyt
	NyVlfUAbQmw4Zt9pj3WsFgVqW0qt0D6lUFz6axdLOEdzy1Fs4WOKzY95CW+SGNkQ4xIWur0KKd6
	n8PMXZnGOtLgL6GODP/wFYL0BjOX8g7/mUTa1Q0Od4UeUrhSW/rXC5HC1GofeExduj5mblPyCkb
	Sg2kf6hbJl62KnTcfT6w54xjJMS2nyYHV5zXJREbYpxziVM5XLpd/L3s5OCrJSmVikEO51yY4A3
	owFXi6DApokNxdUS0OUMj/TWgfOvVAgGvzNAjQ9Venm4sxGFbvt0QEVphp0=
X-Received: by 2002:ac8:5814:0:b0:46d:e2b9:c4c with SMTP id d75a77b69052e-46e12a15fe4mr242073441cf.3.1737988826411;
        Mon, 27 Jan 2025 06:40:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFB5QSW6Vl9WIoBikGlKqgJprzNBrhUbANmTuFMlk3hctUFIAzozH7WKpPXAFk/5uF1MvjFcw==
X-Received: by 2002:ac8:5814:0:b0:46d:e2b9:c4c with SMTP id d75a77b69052e-46e12a15fe4mr242073241cf.3.1737988825896;
        Mon, 27 Jan 2025 06:40:25 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e1367csm599033666b.16.2025.01.27.06.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 06:40:25 -0800 (PST)
Message-ID: <0e0d730d-66b9-4b00-a3ed-eb11ace9a79a@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 15:40:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: soc: qcom: eud: Add phy related bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Elson Serrao <quic_eserrao@quicinc.com>, andersson@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
 <20240730222439.3469-2-quic_eserrao@quicinc.com>
 <63cf3198-fb79-466f-b80a-024e970e400a@kernel.org>
 <5275651f-4075-4dac-bba0-da88f5836459@quicinc.com>
 <0b007a32-00be-40ae-9d96-d7a02b4534bf@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 JDZelR9Xqh8=
In-Reply-To: <0b007a32-00be-40ae-9d96-d7a02b4534bf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rYXz_Y1GIp4gN5Ify9CHH09oBukoGIJ7
X-Proofpoint-GUID: rYXz_Y1GIp4gN5Ify9CHH09oBukoGIJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_07,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270117

On 1.08.2024 9:45 AM, Krzysztof Kozlowski wrote:
> On 01/08/2024 00:23, Elson Serrao wrote:
>>
>>
>> On 7/30/2024 10:33 PM, Krzysztof Kozlowski wrote:
>>> On 31/07/2024 00:24, Elson Roy Serrao wrote:
>>>> Embedded USB Debugger(EUD) being a High-Speed USB  hub needs
>>>> HS-Phy support for it's operation. Hence document phy bindings
>>>> to support this.
>>>>
>>>> Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
>>>
>>> A nit, subject: drop second/last, redundant "bindings". The
>>> "dt-bindings" prefix is already stating that these are bindings.
>>> See also:
>>> https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
>>>
>> Ack
>>>> ---
>>>>  .../devicetree/bindings/soc/qcom/qcom,eud.yaml       | 12 ++++++++++++
>>>>  1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>>> index f2c5ec7e6437..fca5b608ec63 100644
>>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>>> @@ -29,6 +29,14 @@ properties:
>>>>      description: EUD interrupt
>>>>      maxItems: 1
>>>>  
>>>> +  phys:
>>>> +    items:
>>>> +      - description: USB2/HS PHY needed for EUD functionality
>>>> +
>>>> +  phy-names:
>>>> +    items:
>>>> +      - const: usb2-phy
>>>> +
>>>>    ports:
>>>>      $ref: /schemas/graph.yaml#/properties/ports
>>>>      description:
>>>> @@ -48,6 +56,8 @@ properties:
>>>>  required:
>>>>    - compatible
>>>>    - reg
>>>> +  - phys
>>>> +  - phy-names
>>>
>>> That's an ABI break and nothing in commit msg justified it.
>>>
>>
>> Hi Krzysztof
>>
>> Thank you for the review.
>> I see that the only user for EUD as of now is QC sc7280 SoC where phy property
> 
> Did you ask all customers and all users of Linux kernel?

Unfortunately, the PDF agrees - the current description is inherently incomplete
and the driver seems to have been upstreamed in a rather "i need this specific
part of it for my usecase" manner..

The driver must be aware of all USB state changes (as EUD is essentially a mux+hub
sitting between the PHYs and the USB controllers).

Additionally, AFAICU, all device-mode-capable USB ports may potentially be used
for debug purposes (one at a time), so it's not just a matter of a single
controller here. Plug events / their suspend state must be monitored to program
the EUD (which again, sits in the middle of all this) in a specific manner.

EUD is present on all non-ancient SoCs and by default it's on in bypass mode, so
you can ignore its existence. That is, unless you want to use the features it
provides, which we absolutely do.

>> is missing and EUD node is disabled. As described in my cover letter, HS phy
>> support is needed for EUD functionality and this is applicable to all SoCs
>> where EUD is to be enabled. Hence phy would be a required property.
> 
> Nothing in commit msg explained that, but I have a bit hard time to
> believe that this never worked. If that's the case, say it explicitly in
> commit msg - this was always broken.

Even if it does work, it does so on a specific class of boards, relying on
specific setup from a previous stage bootloader.

>> Given that the changes in this series are directly applicable to sc7280 as well,
>> I will re-enable/rectify EUD feature on sc7280 SoC first, by adhering it to this binding
>> requirement. That would address the ABI break. 
> 
> I don't understand what you are saying here.
> 
>> Once the base framework is set I shall extend it to sm8450 SoC.

tldr, we should fix both the bindings and the 7280 dt for it

Konrad

