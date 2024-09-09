Return-Path: <linux-arm-msm+bounces-31276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BE39715EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 13:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84ECE283E49
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 11:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2281014A09E;
	Mon,  9 Sep 2024 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HACmMaWR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E025D15EFA1
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Sep 2024 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879641; cv=none; b=gR4nEcyj7f5OPs62Apnudx8+20iF/oEoUwo99Twifp6Xb5xrVQAUVsz07uB/Xd6n4ENquEdiYbVl3kuBb1CcfcockHEyBwrLS4UqGmzl/YknNoAlJ+ZpViHUqEtz/gC0bEhlucIDd+TzatNU4G9X6Pxi49U/wXHuh7CTg4aBHlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879641; c=relaxed/simple;
	bh=rhjdZESyPbnoEGFTozGxVtPljNvsXOUZcQ7npHRG4yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iz2ZtEFlFYhcqJvX+MjAvAMFwkboCL4a+Oc1FBp39YBRjCYfnAZCQUnjJg6JoqFlQoLsKQiOM9Mca5IqRSycHHisi1wQlgo1w7o8x+QHDoS3k76G/CtC8p+7D+Pacu+exh5Ckt7+9a/H+yautSkmd9r5ZGB5Jr2hYHXjliV09+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HACmMaWR; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5365928acd0so3405123e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Sep 2024 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725879636; x=1726484436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QryQQYMcf5nlV444ZLB6Z8wN7xIF3K24tduKGQQTFPc=;
        b=HACmMaWRJWcfg6Z+16LzxEdP+n8hFFx5h796+Bk4v5MCbw4YOtBEbY16pD80T6NDeN
         zRXrW0LqmbDMdmP4gwIJaOL079IPne3670aqx10gr5XJXUpOMqlFSl4ktqAcrnoH+h+h
         Y1P4D3vtV6gv15X1JF22gnt4jTFoPJ0rm9oRVxJaqtcXqQGvgT2nq74B6Oc0moHfcwQG
         JLHVZlEZpGNxNpeqSKKPALwdCXSydLHffYubjsYc3cQWIcnldAH+lKPCHlmAHAifKP+G
         0+qR21nKeo9liU8Z9+xWz4BTxACykePWS5Q/YBkjYn9mGXzMeSs8GNK2X2UegdDXHP/X
         jdPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879636; x=1726484436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QryQQYMcf5nlV444ZLB6Z8wN7xIF3K24tduKGQQTFPc=;
        b=hk79IwIZY0ebtoZcna+dhkNQfaipS3/3viUuMQ5slqIG0MgyShP1nhnVoHt9Mt1ZPp
         8K5K4eZKWSTbkKMpoRPd/TNS/7AVWzDqeQ0/3DtA0yDxyFlTy28UapvxFRqYGcDgh0cR
         FQZAnzz1hpkDm9u2qnnc2dD9IrOYRL0rMwwTWFoHuxsfxcl0xaX6dzikA2my0pag6fwT
         C0CvLEOsUPk65VhoAnaZTxMZsIES7lHHhG5EiH59PChUQg3K+XCFKp1D8CtSckWEVdQ5
         iGcgzK4VK7LLbKyX2jLKKJSKf3Hza64VvlC3745B03Sj3p6fvNH/zoQp8myOds3QR8Kj
         9mgQ==
X-Gm-Message-State: AOJu0Yy+QdeMYZspm+MvwtRjjPv/ARysWUfmRVgbZyXOw58qQa3JE9Bo
	GA9HL1x3QA5Uz7dccuLIsz2y7DZO0MClxHI8fZYNk1ypeBgTfxm7SvJyqlsLxo28vuEfIIwCGtP
	W
X-Google-Smtp-Source: AGHT+IFpnNdEwL/mWLHVFvrgHmCqsvFKvaduKWsA/kVPdUwZfhYUnUDbP/spk10mNuXR3nsRdQ4BOQ==
X-Received: by 2002:a05:6512:3d8d:b0:52c:d626:77aa with SMTP id 2adb3069b0e04-53658816644mr7676796e87.58.1725879635728;
        Mon, 09 Sep 2024 04:00:35 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::8db? ([2a02:8109:aa0d:be00::8db])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25835a76sm324544866b.39.2024.09.09.04.00.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 04:00:35 -0700 (PDT)
Message-ID: <98222e56-d382-409c-9c17-a99cab08ec94@linaro.org>
Date: Mon, 9 Sep 2024 13:00:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qcs6490-rb3gen2: describe secondary
 USB port
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240904-b4-rb3gen2-usb2-v1-0-b858e681195e@linaro.org>
 <20240904-b4-rb3gen2-usb2-v1-3-b858e681195e@linaro.org>
 <01ec1a78-4fe9-42d9-9ed2-8f6b8cb2e8fa@kernel.org>
 <7f98c987-0f9a-4ff5-9296-c6fdfc37e4c1@kernel.org>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <7f98c987-0f9a-4ff5-9296-c6fdfc37e4c1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/09/2024 14:11, Krzysztof Kozlowski wrote:
> On 05/09/2024 14:05, Konrad Dybcio wrote:
>> On 4.09.2024 1:16 PM, Caleb Connolly wrote:
>>> The secondary USB controller on the rb3gen2 is routed directly to a
>>> mico-USB port where it can be used for EUD debugging or in OTG mode.
>>>
>>> Configure the controller to prefer peripheral mode (as this is almost
>>> always more useful) and describe the connector, vbus supply, and ID pin.
>>>
>>> OTG/Host mode is untested as I don't have micro-USB OTG cables to hand.
>>>
>>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 69 ++++++++++++++++++++++++++++
>>>  1 file changed, 69 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>> index 513d5265bb13..fe66f589cb5b 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>>> @@ -62,8 +62,30 @@ hdmi_con: endpoint {
>>>  			};
>>>  		};
>>>  	};
>>>  
>>> +	connector-usb2 {
>>> +		compatible = "gpio-usb-b-connector";
>>> +		vbus-gpio = <&pm7325_gpios 9 GPIO_ACTIVE_HIGH>;
>>> +		id-gpio = <&tlmm 61 GPIO_ACTIVE_HIGH>;
>>
>> I don't think this is right, what's the revision of the board you have?

Still don't have schematics, this is based on downstream Qualcomm Linux.
> 
> For sure any 'gpio' property is NAK and there is no way this passed
> checks...

ahh, gpios not gpio right?

sorry, should have caught this.
> 
> Best regards,
> Krzysztof
> 

-- 
// Caleb (they/them)

