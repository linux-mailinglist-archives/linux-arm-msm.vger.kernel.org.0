Return-Path: <linux-arm-msm+bounces-61137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82339AD789C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 19:03:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3600D17A075
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 17:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021B87263C;
	Thu, 12 Jun 2025 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ITyyuu3e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A9B223DD1
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 17:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749747793; cv=none; b=f3FIBpmrT/L9wfvac79lHpOgKGw42PoUrGWckoQKS5fy9idC0+b04SGUKDq9FJSmKKD7KC7hua2TloPATIhWrG5H6NbYYCzJlBDbUmXZ/0yWaBVdqpcpP+x6ZeieedpgkvxQ1WnKIjr+tCuaPj4bQbQWxv2cI/F3SIqU9PfBcMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749747793; c=relaxed/simple;
	bh=Uzulu6zrQEvHbRp6tiLTxSgfAnec6yLbNovF+/MqgSw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=L230rQ7dLi4XEPbqR+1cSF3nbywG6r4kKfgD3sHFTQImNyYSacJyc6frRtQHahUjNiQanqcuXqcxSFI2DxYaqOXqdPgR3DVAGWlwGsul+b6GF3H6qOioDuojc03P5VCLA8VDnQVcKt/rikqouJmmzhHQ2E+R5e2Uw+StFTYmjho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ITyyuu3e; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55367f03b0fso107344e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 10:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749747790; x=1750352590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SITDSWa0NPXWLuqPl1GawCzU6z/B2XGFHZuUqZFEKYs=;
        b=ITyyuu3eSqcZnB/ndID++a/8LddzeYj1/48I7GyIhsibz0h4mkHTiw/0yV/gt8M2hP
         gWuXd9zKa8nBVkw6NQE0+QQtPQBnFcGv7jK4v/FvvuZoDyG/3JAit51IvMhLes19xLeS
         fSk7tWK6iVViZ0+E6dSOwKndtX2XSC79YrwIEhHu1w1w6qQ4wibO+GpuWYMFjH2eHu5+
         smVfJGiGAgINaM/fIaoA+SOY0hvasSsuqBgWpFsw7Apbj1LWoElEhGDOp2j9ZhwGEqMV
         PM+pwi9NHYZ09fmQPk+AG4VantnxzMwPre5UcaXpuvVuyzZDnUEaxx8t/lQMAeGVeD7N
         cpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749747790; x=1750352590;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SITDSWa0NPXWLuqPl1GawCzU6z/B2XGFHZuUqZFEKYs=;
        b=IPt7iN7DtqLBjVfdNmYJ21RkfcrM8Cuq825Kr4vMZHP4plF1r8A1FGnC0p7v6Jqgo7
         wKYToqgvdjrB9AFm79tA+Wbzft6vkH0mJloSUHSni/4qUItu2dO12jyb0MIXbTr0eG76
         M8p3CnFK+2x9qXay9ay+VwNnwD9N8S02Ev428vKwXh19pKyOBnWSbAOT8jTELzIySaRY
         YkxvRdmDvaxQB/2ygd0vJJcOfRAwDMcOeOgs+2OK0Qf3omTLfBDFp0YaGdrApdpK5N4J
         qJe6PUsfphKdFphzasal4ed17p5YjfgLg8ZKzYuHMfF8lGNl6CjgohhmQXV29vrbBd9o
         a5lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhR+Taf+HDsJ0bf3mnjMhNJ0bKq0BjMJaK/vmK9l/c5/qNF3QOMy5p7PSqlh7ZmSRTmEwD6YOt2KW5S2+X@vger.kernel.org
X-Gm-Message-State: AOJu0YyCycNCcORqX7kJ5b+YR5q3UHQGjramehmpqKzdazFaknW68V76
	hkXbXQhlDBTmFnHYrMGYNpfPAeoGV1b6KaUHwYVzXGR+B0Wfuycuhi7xxFXlpECO1a4=
X-Gm-Gg: ASbGncuoW25LfFxg41KHkEDTjBusj+HzaxbuSYyzoHYwYAYMEP1g5MbX6O7O0hFVebD
	cb7pEZ8iQR2okCz9+FD7nrpz+Yn4SQKJwxZuxXyonTNLWKnq11Tucuq0VMyccxOjhqdh70HTpWY
	rMo53aibIXQtuHHWusazRMLZI61XJzVCazKU2QJq7aa4K9OfVjT05ZZvLJauQpcM+cYVafxlI2T
	i7ORZJpSUIjNJ0rN/91gF+o2gdpnJ5EvsONDkWhlXb8B6e8C5Pp3lNu7+fXZzjxgcwy9+73x6sw
	fvdcQy54xY3fTewhXXUkCVN8H79+pfgFFtIDGjakZKzL+hnwEyDvc9rkmZIKGMpYsZ8bTDjiC7n
	Z1rh/a2SlMZ+qKvx9zmx7VUsAVLFhmq53yqhRhbwoFbV/NBoeLAg=
X-Google-Smtp-Source: AGHT+IHBNlGFExNNCXER22K2I+rmkBd4bai+7wjdxAJR0qh3kxp4mSKVh18JVv1lOatKNdJNTNYcRQ==
X-Received: by 2002:a05:6512:3e1e:b0:553:2480:230a with SMTP id 2adb3069b0e04-5539c051370mr1023527e87.0.1749747789240;
        Thu, 12 Jun 2025 10:03:09 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac135c14sm166631e87.73.2025.06.12.10.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 10:03:08 -0700 (PDT)
Message-ID: <843772bd-711b-4d49-a5bc-096a1ab13747@linaro.org>
Date: Thu, 12 Jun 2025 20:03:07 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH 09/10] [RFT] arm64: dts: qcom: sm8250: extend CAMSS with
 new CSIPHY subdevices
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250612011531.2923701-1-vladimir.zapolskiy@linaro.org>
 <20250612011531.2923701-10-vladimir.zapolskiy@linaro.org>
 <dd6fd001-6209-4bd9-807a-4e9b5fc4cd5a@kernel.org>
Content-Language: ru-RU
In-Reply-To: <dd6fd001-6209-4bd9-807a-4e9b5fc4cd5a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 10:43, Krzysztof Kozlowski wrote:
> On 12/06/2025 03:15, Vladimir Zapolskiy wrote:
>> Following the new device tree bindings for CAMSS IPs introduce csiphy2
>> device tree node under SM8250 CAMSS, which allows to perform camera
>> tests of the model on an RB5 board with an attached vision mezzanine.
> 
> How the binding allows to perform camera tests? So camera was not
> working here at all? Then this is a fix, no?

Here the assumed testing is a regression testing on the selected and
well supported legacy platform SM8250/RB5.

>>
>> Note that the optional 'phys' property is deliberately not added.
> 
> Why? Your commit msg must explain that.
> 

Sure, will add it, just giving a short note here, 'phys' property
provides a list of wanted/enabled phys, and this is board specific,
thus, and if it is desired to preserve backward ABI compatibility,
when this property is just not present, I believe it makes sense
to add the 'phys' property to board .dts files only, like it's
done in 10/10 patch of this series.

>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>> For testing only, do not merge.

This.

>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index f0d18fd37aaf..401a32679580 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -4613,6 +4613,10 @@ camss: camss@ac6a000 {
>>   					     "cam_sf_0_mnoc",
>>   					     "cam_sf_icp_mnoc";
>>   
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +
>>   			ports {
>>   				#address-cells = <1>;
>>   				#size-cells = <0>;
>> @@ -4641,6 +4645,16 @@ port@5 {
>>   					reg = <5>;
>>   				};
>>   			};
>> +
>> +			csiphy2: phy@ac6e000 {
> 
> This will fail checks. You can run them, regardless of "RFT" status.

I ran "dt_binding_check" and "dtbs_check" with no errors reported,
something is screwed on my end, because "additionalProperties: false"
from qcom,sm8250-camss.yaml shall scream here... Or is it a child
device node is not a property?..

>> +				compatible = "qcom,csiphy";
>> +				reg = <0 0x0ac6e000 0 0x1000>;
>> +				clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
>> +					 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
>> +				clock-names = "csiphy", "csiphy_timer";
>> +				interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
>> +				#phy-cells = <0>;
> 
> This is also duplicating existing ports thus you have a mixed MMIO and
> non-MMIO children which is also issue to fix.

That's correct, there are mixed MMIO and non-MMIO children above,
there might be children of just any one type of two.

It's a valuable review comment and I missed the flaw, thank you,
and to be honest so far I don't have a good idea how to overcome
the issue in an easy way...

>> +			};
>>   		};
>>   
>>   		camcc: clock-controller@ad00000 {
> 
> 

--
Best wishes,
Vladimir

