Return-Path: <linux-arm-msm+bounces-79680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38127C1FEEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 13:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E07BA19C06FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBD43128A6;
	Thu, 30 Oct 2025 12:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="f+VYncrc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1297F2C2340;
	Thu, 30 Oct 2025 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761825842; cv=none; b=TyFy1aWQd7WXgQWSyizeHFMYOnPOzv2g9v0noycvCtnDdz4ObKoDZh1RNnL98Sf8Mxs3alrFatnbSAUyErzljhsaPvrBo1bRJOADLAuRvk6DVfJ533NVqBSQ6ndc0Mn4NBpPCpmDlmeTU7etnUsrcpSQ4cfwlbxpSDBc/c3RUIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761825842; c=relaxed/simple;
	bh=IL/RAuYRylzgjtXa31MWhQno7cUBCpBvvbUXdwM/9GI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dI6TA6ZqXdhmTHKKoOJeGHIxitFmNoGcp6jnWuG59VPT6AE+Z7URkI5D7OeyP9DJmCtQtSQFJggrMqeFOGVvb6yWBmFv8Jv6YTn5J2UUG24Dhbrn96iP9lnovjeGH6kl9udBsuQS0qNgt2JJb5u9hPopNAPd4r1U3rN764dQG5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=f+VYncrc; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [10.0.4.92] (unknown [213.235.133.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 5E075534126F;
	Thu, 30 Oct 2025 13:03:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1761825829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HCDJvVTDJefJzOa6Phkvo+tZTLtMHzdY0G2wDk5jBLI=;
	b=f+VYncrcbQzJTnkYgXqJE4t8guaTGUVwLz/1Fghih8F9r9C4oZZAHhpH4BPlmbLxNu8fIc
	uyAAp9z1F5ANkcbJiZniA8U0X42j8G3m4uCtREOK6mPw0m81zYphkeUCO4GL6f/T8ot4Rc
	41LFF+iKCr+9IfgdxmxtqYHR3zyXEHY=
Message-ID: <7f686f1b-7cc7-428d-941d-82883decee49@ixit.cz>
Date: Thu, 30 Oct 2025 13:03:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>,
 Casey Connolly <casey@connolly.tech>, Joel Selvaraj <foss@joelselvaraj.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20251030-pixel-3-v2-0-8caddbe072c9@ixit.cz>
 <20251030-pixel-3-v2-2-8caddbe072c9@ixit.cz>
 <8d32460d-894b-472a-a262-4c6a60fbcef1@oss.qualcomm.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <8d32460d-894b-472a-a262-4c6a60fbcef1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2025 12:32, Konrad Dybcio wrote:
> On 10/30/25 8:24 AM, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> This adds initial device tree support for the following phones:
>>
>>   - Google Pixel 3 (blueline)
>>   - Google Pixel 3 XL (crosshatch)
> 
> [...]
> 
>> +#include <dt-bindings/arm/qcom,ids.h>
>> +#include <dt-bindings/dma/qcom-gpi.h>
>> +#include <dt-bindings/input/linux-event-codes.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +
>> +#include "sdm845.dtsi"
>> +#include "pm8998.dtsi"
>> +#include "pmi8998.dtsi"
>> +
>> +/delete-node/ &mpss_region;
>> +/delete-node/ &venus_mem;
>> +/delete-node/ &cdsp_mem;
>> +/delete-node/ &mba_region;
>> +/delete-node/ &slpi_mem;
>> +/delete-node/ &spss_mem;
>> +/delete-node/ &rmtfs_mem;
>> +
>> +/ {
>> +	chassis-type = "handset";
>> +	qcom,board-id = <0x00021505 0>;
>> +	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
>> +
>> +	aliases {
>> +		serial0 = &uart9;
>> +		serial1 = &uart6;
>> +	};
>> +
>> +	battery: battery {
>> +		compatible = "simple-battery";
>> +
>> +		status = "disabled";
> 
> You added support for both non-proto boards based on this platform,
> there is no usecase for you to disable the battery, remove this line

Should I keep the status = "okay" in the board files or drop it too?

> 
> [...]
> 
>> +	reserved-memory {
>> +		cont_splash_mem: splash@9d400000 {
>> +			/* size to be updated by actual board */
>> +			reg = <0x0 0x9d400000 0x0>;
> 
> Don't define it here then
> 
> Normally the bootloader allocates a bigger buffer here BTW
> (although it shooould be reclaimable without issues)

Ok, I'll drop reg in next revision. Thou the reg is defined in the board 
files.

> 
>> +			no-map;
>> +
>> +			status = "disabled";
> 
> ditto
> 
> [...]
> 
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +		label = "Volume keys";
>> +		autorepeat;
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&volume_up_gpio>;
> 
> property-n
> property-names
> 
> in this order, please
> 
> [...]
> 
>> +&tlmm {
>> +	gpio-reserved-ranges = <0 4>, <81 4>;
> 
> Could you add a comment (like in x1-crd.dtsi) mentioning what these
> pins correspond to? Usually it's a fingerprint scanner or things like
> that

Sure, I looked into it, but I haven't found (so far) information about 
the assigned blocks. In next revision it'll be addressed :)>
>> +
>> +	touchscreen_reset: ts-reset-state {
>> +		pins = "gpio99";
>> +		function = "gpio";
>> +		drive-strength = <8>;
>> +		bias-pull-up;
>> +	};
>> +
>> +	touchscreen_pins: ts-pins-gpio-state {
>> +		pins = "gpio125";
>> +		function = "gpio";
>> +		drive-strength = <2>;
>> +		bias-disable;
>> +	};
>> +
>> +	touchscreen_i2c_pins: qup-i2c2-gpio-state {
>> +		pins = "gpio27", "gpio28";
>> +		function = "gpio";
>> +
>> +		drive-strength = <2>;
> 
> stray \n above
> 
>> +		bias-disable;
>> +	};
>> +};
>> +
>> +&uart6 {
>> +	pinctrl-0 = <&qup_uart6_4pin>;
>> +
>> +	status = "okay";
>> +	bluetooth {
> 
> Please add a \n above, to separate the properties from subnodes
> 
> [...]
> 
>> +&mdss {
>> +	/* until the panel is prepared */
>> +	status = "disabled";
>> +};
> 
> Is it not the same as on the little boy, except the resolution?
> (don't know, just asking)
It's completely different DDIC and panel. Generally, the DDIC has driver 
mainlined already (due being same as Samsung S9 DDIC), but I must extend 
support for the relevant panel.

Thanks for the review
WIP to v3 is here: https://gitlab.com/dhxx/linux/-/commits/b4/pixel-3

David

> 
> Konrad

-- 
David Heidelberg


