Return-Path: <linux-arm-msm+bounces-50528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D86A54ED5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 16:22:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53A6A17497A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 15:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C707158520;
	Thu,  6 Mar 2025 15:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="dxnQCWqB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7096B1624C8;
	Thu,  6 Mar 2025 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741274551; cv=none; b=WLUJVcwWSv2Pqujkwo6pT9/Wy+9cvOrKC7YQOUb+Uqd2uhA3aiKuYjKlOqeFA1AAa5YnsL8lEOgbNyYxmg/vC0xANrgPIP37FZuvuPluYJVgB/w+3+++G2JEwjwWZyCYVqKWxTyg6THqCdgHx2wX8EY2fcCh+ggrPFAglNkFU08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741274551; c=relaxed/simple;
	bh=SPwTqU1FQuydEUYFS8l2kMBpEKRE4wRRl01iyIDM5mQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXMEqgY/TqulrY1NBthONqQzOV1dP06R4QaWF+fYvl6YqihC0qfRZQeWngzZyzwOYKcGmjwFf2uAlaSXU+7Isizc/bpUZhuGWsPIXYqhAzD0kzZgYQf76wJUstT5kOB2H6LqeKGEVeA2s1JsUWLi7Oq8zpj6aSC+4oLIbvm8sjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=dxnQCWqB; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.76] (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id C96782FC0048;
	Thu,  6 Mar 2025 16:22:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1741274545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xi3cMLXECUOiOsPb3EvB2cc73af22xJrE8sr9a/N9is=;
	b=dxnQCWqBc2gkM3N72XgL9j3bdEvSKu1LBfLXf6gwU5d8BuJkqKDcvCitHzg1RDmoBzIjRl
	9tYb1TpSblY6Op92xhbdPZZhbQf+oxlQADUHaVOBKSZwLx4WIFgtfGkEzUCWZZXvJ5wOot
	Sfsf744jbPzHDLPph0s8fZCAWIwnk0E=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=g.gottleuber@tuxedocomputers.com
Message-ID: <58d6c774-2976-43ef-aa04-b339df4b6ff1@tuxedocomputers.com>
Date: Thu, 6 Mar 2025 16:22:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for TUXEDO Elite 14
 Gen1
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Georg Gottleuber <ggo@tuxedocomputers.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wse@tuxedocomputers.com, cs@tuxedocomputers.com
References: <57589859-fec1-4875-9127-d1f99e40a827@tuxedocomputers.com>
 <5e72992c-170c-48b9-8df4-2caf31c4ae44@oss.qualcomm.com>
Content-Language: en-US
From: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>
In-Reply-To: <5e72992c-170c-48b9-8df4-2caf31c4ae44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



Am 06.03.25 um 13:50 schrieb Konrad Dybcio:
> On 6.03.2025 1:25 PM, Georg Gottleuber wrote:
>> Initial support for TUXEDO Elite 14 Gen1 based on Qualcomm Snapdragon X
>> Elite SoC (X1E78100).
>>
>> Working:
>> * Touchpad
>> * Keyboard
>> * eDP (no brightness control yet)
> 
> in case your panel as a PWM backlight, you will need to set the PWM
> output pin function explicitly, see x1e80100-microsoft-romulus.dtsi

Thank you, will check this.

>> * NVMe
>> * USB Type-C port
>> * WiFi (WiFi 7 untested)
>> * GPU (software rendering)
>>
>> Not working:
>> * GPU (WIP: firmware loading but output is jerky)
> 
> Please tell us more

Oh, this is already an older thing: with kernel 6.10 loading
gen70500_gmu.bin and gen70500_sqe.fw leading to partly slow and
stuttering video output. Sometimes it rendered black edges / borders to
KDE menus. Surely I did something wrong.

I have just tried to reproduce the same setup, but I couldn't get it to
work just now. If you are interested, I can try it again with a
new/current kernel. (which is preferred? linux? linux-next?)

>> * USB Type-A (WIP)
>> * Suspend with substantial energy saving
>> * Audio, Speakers, Microphones
>> * Camera
>> * Fingerprint Reader
> 
> If it's connected to the multiport controller, you should be able to
> just enable it, like on the T14s, similarly to the Type-A port

sounds promising

> [...]
> 
>> Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>  .../qcom/x1e80100-tuxedo-elite-14-gen1.dts    | 798 ++++++++++++++++++
>>  2 files changed, 799 insertions(+)
>>  create mode 100644
>> arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 140b0b2abfb5..f0a9d677d957 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -298,3 +298,4 @@ dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-lenovo-yoga-slim7x.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-microsoft-romulus13.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-microsoft-romulus15.dtb
>>  dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-qcp.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)        += x1e80100-tuxedo-elite-14-gen1.dtb
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
>> new file mode 100644
>> index 000000000000..86bdec4a2dd8
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
>> @@ -0,0 +1,798 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2025 TUXEDO Computers GmbH
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>> +
>> +#include "x1e80100.dtsi"
>> +#include "x1e80100-pmics.dtsi"
>> +
>> +/ {
>> +       model = "TUXEDO Elite 14 Gen1";
> 
> Please use 8-wide tabs instead of spaces

Sorry.

>> +       compatible = "tuxedo,elite14gen1", "qcom,x1e80100";
> 
> You'll need to define a new vendor in:
> 
> Documentation/devicetree/bindings/vendor-prefixes.yaml
> 
> [...]
> 
>> +       vreg_edp_3p3: regulator-edp-3p3 {
>> +               compatible = "regulator-fixed";
>> +
>> +               regulator-name = "VREG_EDP_3P3";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +
>> +               // EDP_VDD_EN_GPIO54
> 
> C-style (/* foo */) comments are preferred, but these ones can be
> removed, as they repeat what the code says

I have overlooked this. Sorry.

> [...]
> 
>> +&gpu {
>> +       status = "okay";
>> +
>> +       zap-shader {
>> +               firmware-name = "qcom/a740_zap.mbn";
> 
> Are the laptop's OEM key/security fuses not blown?

I'm not sure. How can I verify this?

Regards,
Georg

