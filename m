Return-Path: <linux-arm-msm+bounces-26078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3A9930536
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 12:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8430D1F22000
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 10:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FAB61FC7;
	Sat, 13 Jul 2024 10:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="dUm4CXng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A0C17591;
	Sat, 13 Jul 2024 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720867270; cv=none; b=FP50Lhs6bKFmOs7xRqxfEhUt6+DYyqlbLnvwBwZ7c8Cd7XA+bzvRoMFyb6dcp2uw4UjAhnpQsodiRMLs+P+J9UpT0AHtBe54sjtRsYOwnWA3EogTBpF3Y3kMttptphor2PmmFpS0msk7U0sICRi6OCluQfF12mqlqEeSKWoZT7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720867270; c=relaxed/simple;
	bh=snYcwqgjNbZYhMsfZCZ7IRMjR4RoGD/5afathPXm9aE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=ip5nC3JK9gbAtIaxWA+DAJu+bzb8Kc+rzfoOGJC04iExAXI+YJlwTw7tzPeXnNK9LMfzyDvnwBdv8IHnYYVhVYaNBYHzc8ePMn7m5LCIGKdbj7ouyGct4YFaP/vV86OF5pkKwi4eV006E0ukMYOg8WtSjg8xHuUSe+v3DlnC4z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=dUm4CXng; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 21F1542804;
	Sat, 13 Jul 2024 15:41:04 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1720867265; bh=snYcwqgjNbZYhMsfZCZ7IRMjR4RoGD/5afathPXm9aE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dUm4CXngF8p2X1wcypdGMBu7gIYGN6P1s7bhxgQbSYQfmrjoNz8OXl3xaoUVd8lBA
	 I0/3bVsw/ENtRLM4OOtXKbZsahezBxNSoA6Iwjjo5sSO7NN3GHB6bLaTb6heqwrCDf
	 Di8RS+13CzPKHTIFYyE9iGgTR4Gst32lBEsCcHQMcXMuYfu1/8LncXni2blKgTBs3I
	 8do069GaTfKrMX10lAci1f3hC88hERbXHDFwCXStB7Z0c8XWVZpGGvfRwbdG/CNz1P
	 29fnYKUwWmZI25kWAQwCbiK94KlB5rcLb4jvkvw428WD4PYWcectdm3LFynikXXpXe
	 cBOCIF9DTqbqA==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 13 Jul 2024 15:41:02 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, =?UTF-8?Q?Adam_S=C5=82abo=C5=84?=
 <asaillen@protonmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8939-wingtech-wt82918: Add
 Lenovo Vibe K5 devices
In-Reply-To: <2146ca56-6c2c-48a3-8e77-75aa04cb2b4c@linaro.org>
References: <20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru>
 <20240712-msm89xx-wingtech-init-v1-3-64f4aa1870bd@trvn.ru>
 <2146ca56-6c2c-48a3-8e77-75aa04cb2b4c@linaro.org>
Message-ID: <630834c52e6b958f92c52d61f9196081@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Konrad Dybcio писал(а) 13.07.2024 00:53:
> On 12.07.2024 6:04 PM, Nikita Travkin wrote:
>> From: Adam Słaboń <asaillen@protonmail.com>
>>
>> This commit introduces multiple hardware variants of Lenovo Vibe K5.
>>
>> - A6020a40 (msm8929-wingtech-wt82918hd)
>> - A6020a46/A6020l36 (msm8939-wingtech-wt82918)
>> - A6020a40 S616 H39 (msm8939-wingtech-wt82918hd)
>>
>> These devices are added with support for many features, notably:
>>
>> - Basic features like USB, mmc/sd storage, wifi, buttons, leds;
>> - Accelerometer;
>> - Touchscreen;
>> - Sound and modem.
>>
>> Note that "HD" variant of K5 is based on msm8929 which is a lower bin
>> of msm8939 SoC. A simple dtsi is added for this soc along with the new
>> devices.
>>
>> Unfortunately, despite the heavy similarities, the combination of minor
>> differences between variants make them incompatible between each other.
>>
>> Signed-off-by: Adam Słaboń <asaillen@protonmail.com>
>> [Nikita: Minor cleanup, commit message]
>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile                  |   3 +
>>  .../boot/dts/qcom/msm8929-wingtech-wt82918hd.dts   |  17 ++
>>  arch/arm64/boot/dts/qcom/msm8929.dtsi              |   5 +
>>  .../boot/dts/qcom/msm8939-wingtech-wt82918.dts     |  16 ++
>>  .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    | 254 +++++++++++++++++++++
>>  .../boot/dts/qcom/msm8939-wingtech-wt82918hd.dts   |  16 ++
>>  6 files changed, 311 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index fd4c7c41ddc4..48ec781fa1d8 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -58,10 +58,13 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-huawei-kiwi.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-longcheer-l9100.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-samsung-a7.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-sony-xperia-kanuti-tulip.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918hd.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-motorola-potter.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-daisy.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-mido.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts b/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts
>> new file mode 100644
>> index 000000000000..f9a358e852f8
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts
>> @@ -0,0 +1,17 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +/dts-v1/;
>> +
>> +#include "msm8939-wingtech-wt82918.dtsi"
>> +#include "msm8929.dtsi"
>> +
>> +/ {
>> +	model = "Lenovo Vibe K5 (HD) (Wingtech WT82918)";
>> +	compatible = "wingtech,wt82918hd", "qcom,msm8929";
>> +	chassis-type = "handset";
>> +};
>> +
>> +&touchscreen {
>> +	touchscreen-size-x = <720>;
>> +	touchscreen-size-y = <1280>;
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/msm8929.dtsi b/arch/arm64/boot/dts/qcom/msm8929.dtsi
>> new file mode 100644
>> index 000000000000..c3d1d1ace2f6
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/msm8929.dtsi
>> @@ -0,0 +1,5 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +
>> +&opp_table {
> 
> No way somebody called the gpu opp table "opp table"..
> 
>> +	/delete-node/ opp-550000000;
> 
> Looking at downstream, seems like there isn't a speedbin fuse for
> this :(
> 
> [...]
> 
>> +
>> +&blsp_i2c2 {
>> +	status = "okay";
>> +
>> +	accelerometer@68 {
>> +		compatible = "invensense,icm20608";
>> +		reg = <0x68>;
>> +
>> +		pinctrl-0 = <&accelerometer_default>;
>> +		pinctrl-names = "default";
> 
> interesting choice to stick pintrl before interrupts
> 

Hm, yeah... I will move it a bit down in v2.

Thanks!
Nikita

>> +
>> +		interrupts-extended = <&tlmm 115 IRQ_TYPE_EDGE_FALLING>;
>> +
>> +		vdd-supply = <&pm8916_l17>;
>> +		vddio-supply = <&pm8916_l6>;
>> +
>> +		mount-matrix = "-1", "0", "0",
>> +				"0", "1", "0",
>> +				"0", "0", "1";
>> +	};
>> +};
> 
> [...]
> 
>> +&pm8916_mpps {
>> +	pwm_out: mpp4-state {
>> +		pins = "mpp4";
>> +		function = "digital";
>> +		power-source = <PM8916_MPP_VPH>;
>> +		output-low;
>> +		qcom,dtest = <1>;
> 
> I think you meant qcom,dtest-output
> 
> looks good otherwise
> 
> Konrad

