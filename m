Return-Path: <linux-arm-msm+bounces-8441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A450C83DC1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 15:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C97E31C20D7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 14:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E44E1BDF8;
	Fri, 26 Jan 2024 14:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t8wZtZtR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8F01C298
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706279830; cv=none; b=SNobFRioiYcdwnLiVIW4ES6/U7aYlNKvRdt4ShnjLGl4h8g9+eC5WmJH8OZHL+X0CZC16NiWfbO91pfuWkzgkiKQc5idyESnNJ5K6zBpi0V2yRUTCTo0jtggdzA8ic8j6JXyAvNairUAngv2KL5g++KgGuEF6TSHU0cghKd4WWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706279830; c=relaxed/simple;
	bh=aFY8y40n4sXeS2ljcZoWoVB1dwzaVGLoVGtpSHl78t8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIVRtTzO4gWbLJu+Tx5CmhqwYmdLE2nwMSCmeX5mW9vvtt6xwEB4zLnKVPKey0mU1VJ901kA9ghKkFj3c9wC2wueSp5nZs5Nq2ziQB3kczejr0MYpu8AkUQ1QAhEAVuzOkDa1LTr1qH29/qtG+aqawSSLk7cvIPUzuWQLszTAcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t8wZtZtR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40eacb6067dso9363015e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 06:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706279826; x=1706884626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gIElliFYd6UvMHIfcgImKqiD/HyMTyjhftkGcP6yJKM=;
        b=t8wZtZtRsG5AffI9CmujVbB+FIjk3dDI+FfNtFcRTdyKkpt2yIVl/FBKwuQuP/1Tgh
         XXi3acl7JimcB4IkO0K+3gIIKo1KGL/C1WoavQfObaVP6DuGwQkexS8NhGg6VaGHAdtR
         /yaj6vgYDMg12d0cVFM4yfZhMQlGUtZYt+UyB2qU2/cHX1OHOAWtGJxmGNOC9+pBJwDc
         GZQ+pAc1wCbTbA2Yjw+9mcYZ8Ts55SEEbO/wbVpK5pOsGqYx7WPG8/oI9RrpB8SrKZAF
         kmOzylJoRoY12i0RbQ6j6exCTfq/eOqFEN3Wz1cd54JClZQ825OxPZKWRehdtTo3HbDB
         mUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706279826; x=1706884626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIElliFYd6UvMHIfcgImKqiD/HyMTyjhftkGcP6yJKM=;
        b=BcMeu39uGs0PK0HVCckfeC/1MUXBsN4hyWkQ7sg/TUYLggdQVlCYBdYOx3xDdplOF3
         af7kP38I+NdzCB9qHk9tjrlmcW7Xeuk5nsSU2viMqhfUDAGxIkSHVFYzFB8eNZZAhQgf
         cf+p6/k7j+ZVrOInkbOYwztaeGEaX9kGs5AQTk7k/0uwreT4sAfKJJNit/8RriLfuRMS
         ZItsihS2hL1xq//1+ITyq4sJmpColDzFX6XNWnlV8wqHQRJqoXVGpN0JGIHZ6Yz7wuo1
         qN7Si8YNwO1ESOR5CvRQWkd++KzROdzNC79pleV0dcOzAe4l+gukPNC1UdL6B68y9Coh
         WBng==
X-Gm-Message-State: AOJu0YywXfW2xJEQ51Vl07YXvmjcNHmgcV5rSoGssRcAwlkC17RJlaN2
	fW5mREEuseNd+1v2Cj0IqYFlZx2xq1KTbzV/1Pt9oKl7acsHosLXiSfy9NbL1GM=
X-Google-Smtp-Source: AGHT+IFWmdkrtlL2A3Ih8oaB1KbhFnAt/lrHxwSzFC7r64minL26nGFZfdUeS4pu8LbcM+Xff2dwyg==
X-Received: by 2002:a05:600c:204b:b0:40e:6b7b:a343 with SMTP id p11-20020a05600c204b00b0040e6b7ba343mr553118wmg.223.1706279826129;
        Fri, 26 Jan 2024 06:37:06 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id ko20-20020a170907987400b00a28fd9607a8sm689119ejc.81.2024.01.26.06.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 06:37:05 -0800 (PST)
Message-ID: <7f780a0b-5f70-480e-82fc-08bd89870d13@linaro.org>
Date: Fri, 26 Jan 2024 15:37:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: Fix hs_phy_irq for QUSB2 targets
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
 cros-qcom-dts-watchers@chromium.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 quic_ppratap@quicinc.com, quic_jackp@quicinc.com
References: <20240120191904.15408-1-quic_kriskura@quicinc.com>
 <20240120191904.15408-2-quic_kriskura@quicinc.com>
 <wqdqkzvni4roqulgsiqxzubxcblzxnoydcwvv2av2pobjjx5o6@b7kwl6lq7hij>
 <a4606673-64e9-4e16-8d9e-307fb37d8763@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <a4606673-64e9-4e16-8d9e-307fb37d8763@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/01/2024 15:14, Krishna Kurapati PSSNV wrote:
> 
> 
> On 1/25/2024 3:16 AM, Bjorn Andersson wrote:
>> On Sun, Jan 21, 2024 at 12:49:01AM +0530, Krishna Kurapati wrote:
>>> On several QUSB2 Targets, the hs_phy_irq mentioned is actually
>>> qusb2_phy interrupt specific to QUSB2 PHY's. Rename hs_phy_irq
>>> to qusb2_phy for such targets.
>>>
>>> In actuality, the hs_phy_irq is also present in these targets, but
>>> kept in for debug purposes in hw test environments. This is not
>>> triggered by default and its functionality is mutually exclusive
>>> to that of qusb2_phy interrupt.
>>>
>>> Add missing hs_phy_irq's, pwr_event irq's for QUSB2 PHY targets.
>>> Add missing ss_phy_irq on some targets which allows for remote
>>> wakeup to work on a Super Speed link.
>>>
>>> Also modify order of interrupts in accordance to bindings update.
>>> Since driver looks up for interrupts by name and not by index, it
>>> is safe to modify order of these interrupts in the DT.
>>>
>>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 13 +++++++++++++
>>>   arch/arm64/boot/dts/qcom/ipq8074.dtsi | 14 ++++++++++++++
>>>   arch/arm64/boot/dts/qcom/msm8953.dtsi |  7 +++++--
>>>   arch/arm64/boot/dts/qcom/msm8996.dtsi |  8 ++++++--
>>>   arch/arm64/boot/dts/qcom/msm8998.dtsi |  7 +++++--
>>>   arch/arm64/boot/dts/qcom/sdm630.dtsi  | 17 +++++++++++++----
>>>   arch/arm64/boot/dts/qcom/sm6115.dtsi  |  9 +++++++--
>>>   arch/arm64/boot/dts/qcom/sm6125.dtsi  |  9 +++++++--
>>>   8 files changed, 70 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>> index 5e1277fea725..ea70b57d1871 100644
>>> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
>>> @@ -418,6 +418,12 @@ usb2: usb@70f8800 {
>>>   					  <&gcc GCC_USB1_MOCK_UTMI_CLK>;
>>>   			assigned-clock-rates = <133330000>,
>>>   					       <24000000>;
>>> +
>>> +			interrupts-extended = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>>
>> interrupts-extended takes a reference to a interrupt-controller as well,
>> so this doesn't build.
>>
>> Did you mean "interrupts" here instead? Please update these and build
>> test...
>>
> 
> Hi Bjorn,
> 
>   Thanks for the catch. I was using DTC version 1.4.0.

v1.4.0? I am sorry, but what?

Isn't that like 10 years old? What systems are you using there? I am
asking, because maybe we should be rejecting DTS patches assuming they
were never tested (testing on ancient dtc counts like no testing).

> When I moved to 1.5.0, I did see these warnings. Fixed them up and sent v3.

Nope, you just moved from 10 years old to 5 years old.

Fix your systems and use the recent one. v1.6.1



Best regards,
Krzysztof


