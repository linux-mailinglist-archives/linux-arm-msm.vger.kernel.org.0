Return-Path: <linux-arm-msm+bounces-30420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C987968B95
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 18:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0BE31F213C8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 16:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED661A303A;
	Mon,  2 Sep 2024 16:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cgHR+blr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CB41A2653;
	Mon,  2 Sep 2024 16:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725293261; cv=none; b=HLMdPYaBF0akSYpjBbOKnwZOTcKaXqNPR2omXk6AX18c+DGMm5lGl9CxNKQjwEZCO9sfiPa3cqPRAqvbSaVw3+UuWqfNr+Am3BcuYr1iOtphx+IAjaXBvVYHKg2JlSt/7xhpm+11dCIL5iBpNIXbXBpcd0h66Fj7LjSO5qFp0lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725293261; c=relaxed/simple;
	bh=VvHmQGZKkX2eGFQymZ0Kewqry4twUgs0EDXwzaCavc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A82tl2o3l3SkPg4eukRC/T8JYLC/crLa+oRIHp6RXMUxraSPaLt3twGbsyWorV1kYkC7JiiB0aM/I4uba/RZHMgBnsm/5dYu5Q87g120snGPVLISNz7TICtsKzm/KdqJ1wDERPHh1F73izz04obj9UFzxvOFj4LlmUEkeXeujo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cgHR+blr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53EE6C4CEC2;
	Mon,  2 Sep 2024 16:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725293260;
	bh=VvHmQGZKkX2eGFQymZ0Kewqry4twUgs0EDXwzaCavc4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cgHR+blrzPmmrfoyw+1IdBot0rHFwRpSVJOz8H8XTx9mN3IE+hRbQUX4sEtel9Gyc
	 7oVcZ12Ej0NV0Wc9YN/eUg/+SCwfXtKCsq0ZFpX2LKvZY55zSKAdnGwHGUkcnZmQsK
	 u/q8QRX1FfD4IeHoG3KGedDiNwRzPb4rZOaShmGepVogLxPQWaWRD2xrMrhBBvzEJK
	 cDuS/1MBoyrNXR/p5CEbq4jr0MCrVKsVUBnJq99UHZWpIsfNzwkWujZJpYAT13W8Op
	 BkwFRDVkCOcKQ8Ts1d3W432kqKMomUZmf+gz4xH05qkrlw1spAV6YbN/OP99IKSXVV
	 trPIh3hxNfKxg==
Message-ID: <eb17ba5c-d7b4-4463-a0a3-95ab584988f6@kernel.org>
Date: Mon, 2 Sep 2024 18:07:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-romulus: Set up USB
 Multiport controller
To: neil.armstrong@linaro.org, Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>,
 20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org
References: <20240902-topic-sl7_updates-v1-0-3ee667e6652d@quicinc.com>
 <20240902-topic-sl7_updates-v1-2-3ee667e6652d@quicinc.com>
 <925061d3-9894-4332-8c2a-e494ad22c66b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <925061d3-9894-4332-8c2a-e494ad22c66b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2.09.2024 6:01 PM, neil.armstrong@linaro.org wrote:
> On 02/09/2024 16:50, Konrad Dybcio wrote:
>> From: Konrad Dybcio <quic_kdybcio@quicinc.com>
>>
>> The USB MP controller is wired up to the USB-A port on the left side
>> and to the Surface Connector on the right side. Configure it.
>>
>> While at it, remove a stray double \n.
>>
>> Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
>> ---
>>   .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 59 +++++++++++++++++++++-
>>   1 file changed, 57 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
>> index 5419d0b02785..ac2acf949b70 100644
>> --- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
>> @@ -572,7 +572,17 @@ &i2c5 {
>>         status = "okay";
>>   -    /* Something @4f */
>> +    ptn3222: redriver@4f {
>> +        compatible = "nxp,ptn3222";
>> +        reg = <0x4f>;
>> +
>> +        reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
>> +
>> +        vdd3v3-supply = <&vreg_l13b>;
>> +        vdd1v8-supply = <&vreg_l4b>;
>> +
>> +        #phy-cells = <0>;
> 
> It's unrelated to mutiport USB-A, should go in a separate change,
> and also probably in a bigger change enabling usb-c features using
> the retimer.

No, this chip converts between eUSB on the PHY and USB on the port

Konrad

