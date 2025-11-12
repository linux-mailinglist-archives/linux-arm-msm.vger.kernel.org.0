Return-Path: <linux-arm-msm+bounces-81418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBFCC5291A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 14:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 005D6189B291
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 13:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73EB222587;
	Wed, 12 Nov 2025 13:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="rdx9qIKi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AA721FF46;
	Wed, 12 Nov 2025 13:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955430; cv=none; b=fwsbNn0HdLvsizhctJ1UflB7XqV9uCMc0ss2pcuWjQ/CiycclP1gesY42mh3y8DxfTIlnKm9NPGvca0vJkA4/IBP5dqVkMAKntr5R3bfyOLEO7Ofj/PUgwuCMxmdhHjDqUIbvFiZKUsclmU/ODCZksffqvAHuQdXbQKgy7SytZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955430; c=relaxed/simple;
	bh=7cl7TuwskHAaFGU9JBvTcFPO3OAalOvjMP+B5Z4aFQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qoUnlgPsbB9sVnSxagKa4p7c7MOTkPkT2aJRCxdYzBFfclZpNPMPMjLl9THCXdNl5SfjzpHqfQaQ0fuox4ZL8SLsN1K8aJFS55Fsmtc2HdyxemijPKKpMqkY6JZPrxPktRh1ep8WBZ1IOlD+o0ScS70xCkLk3hYmlcwTaXFt0v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=rdx9qIKi; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.178.76] (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 4ACDD2FC0061;
	Wed, 12 Nov 2025 14:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1762955424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=EHEYMlfrKUZPNLYAQuLIe9g6EBuDE9wJaoXtifI+35s=;
	b=rdx9qIKibomwHkkNzEZDvd/QJQdYuC0VmnKv+I1XJCI+gemdY0gjO9vv4+zjk32Mayi5D6
	G5t0YF4fSVAZkKrtndooJyB+luRoC07RAtF2gmFE4jyL/JS3c+M4XEKehgDMx1i8008IBt
	Uq07Sp1evrjnhd+jYY5XNRyHH0GCAVY=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=g.gottleuber@tuxedocomputers.com
Message-ID: <fbd1a17a-937a-4b66-a1c7-5a3020e1332c@tuxedocomputers.com>
Date: Wed, 12 Nov 2025 14:50:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add device tree for TUXEDO Elite
 14 Gen1
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ettore Chimenti <ettore.chimenti@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
 wse@tuxedocomputers.com, cs@tuxedo.de
References: <20251105154107.148187-1-ggo@tuxedocomputers.com>
 <20251105154107.148187-7-ggo@tuxedocomputers.com>
 <aRHre28Nbyv6ShbU@linaro.org>
Content-Language: en-US
From: Georg Gottleuber <g.gottleuber@tuxedocomputers.com>
Autocrypt: addr=g.gottleuber@tuxedocomputers.com; keydata=
 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
 bsxTTcOuRnk=
In-Reply-To: <aRHre28Nbyv6ShbU@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



Am 10.11.25 um 14:41 schrieb Stephan Gerhold:
> On Wed, Nov 05, 2025 at 04:41:06PM +0100, Georg Gottleuber wrote:
>> Initial support for TUXEDO Elite 14 Gen1 based on Qualcomm Snapdragon X
>> Elite SoC (X1E78100).
>>
>> Working:
>> * Touchpad
>> * Keyboard
>> * eDP (no brightness control yet)
>> * NVMe
>> * USB Type-C port
>> * USB-C DP altmode
>> * HDMI-A port
>> * WiFi (WiFi 7 untested)
>> * Bluetooth
>> * GPU
>> * Video decoding
>> * USB Type-A
>> * Audio, speakers, microphones
>> 	- 4x speakers.
>> 	- 4x dmic
>> 	- headset
>> * Camera
>> * Fingerprint reader
>>
>> Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
>> Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>>  .../qcom/x1e80100-tuxedo-elite-14-gen1.dts    | 1486 +++++++++++++++++
>>  2 files changed, 1488 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 296688f7cb26..598bf4c6e84a 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -350,3 +350,5 @@ x1p42100-hp-omnibook-x14-el2-dtbs := x1p42100-hp-omnibook-x14.dtb x1-el2.dtbo
>>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-hp-omnibook-x14.dtb x1p42100-hp-omnibook-x14-el2.dtb
>>  x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
>>  dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
>> +x1e80100-tuxedo-elite-14-gen1-el2-dtbs	:=  x1e80100-tuxedo-elite-14-gen1.dtb x1-el2.dtbo
>> +dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-tuxedo-elite-14-gen1.dtb
> 
> Please also add x1e80100-tuxedo-elite-14-gen1-el2.dtb here (similar to
> the other lines), so that the EL2/KVM-specific DTB is automatically
> built and included in the installed DTBs.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
>> new file mode 100644
>> index 000000000000..0bfe5931434e
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts
>> @@ -0,0 +1,1486 @@
>> [...]
>> +	vreg_edp_3p3: regulator-edp-3p3 {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_EDP_3P3";
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&edp_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-always-on;
> 
> Does this need to be always on? It should be possible to enable/disable
> this supply together with the panel (and it is already set as
> power-supply for the panel).

Nice catch. I agree with you.

>> +		regulator-boot-on;
>> +	};
>> +
>> [...]
>> +	sound {
>> +		compatible = "qcom,x1e80100-sndcard";
>> +		model = "X1E80100-TUXEDO-Elite-14";
>> +		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
>> +				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
>> +				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
>> +				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
>> +				"IN1_HPHL", "HPHL_OUT",
>> +				"IN2_HPHR", "HPHR_OUT",
>> +				"AMIC2", "MIC BIAS2",
>> +				"VA DMIC0", "MIC BIAS1",
>> +				"VA DMIC1", "MIC BIAS1",
>> +				"VA DMIC0", "VA MIC BIAS1",
>> +				"VA DMIC1", "VA MIC BIAS1",
> 
> Please drop the two "VA MIC BIAS" lines, see
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b49e37de8e70bc433b526a9f4382f72b7ac6492e

Ack.

>> +				"TX SWR_INPUT1", "ADC2_OUTPUT";
>> +
>> +		wcd-playback-dai-link {
>> +			link-name = "WCD Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai = <&q6apm>;
>> +			};
>> +		};
>> +
>> +		wcd-capture-dai-link {
>> +			link-name = "WCD Capture";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&wcd938x 1>, <&swr2 1>, <&lpass_txmacro 0>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai = <&q6apm>;
>> +			};
>> +		};
>> +
>> +		wsa-dai-link {
>> +			link-name = "WSA Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&left_woofer>, <&left_tweeter>,
>> +					    <&swr0 0>, <&lpass_wsamacro 0>,
>> +					    <&right_woofer>, <&right_tweeter>,
>> +					    <&swr3 0>, <&lpass_wsa2macro 0>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai = <&q6apm>;
>> +			};
>> +		};
>> +
>> +		va-dai-link {
>> +			link-name = "VA Capture";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&lpass_vamacro 0>;
>> +			};
>> +
>> +			platform {
>> +				sound-dai = <&q6apm>;
>> +			};
>> +		};
>> +	};
>> [...]
>> +&remoteproc_adsp {
>> +	firmware-name = "qcom/x1e80100/adsp.mbn",
>> +			"qcom/x1e80100/adsp_dtb.mbn";
> 
> We need a custom ADSP firmware for the TUXEDO, so this needs to be a
> device-specific path (so that you can upload the correct firmware to
> linux-firmware). e.g. "qcom/x1e80100/TUXEDO/adsp.mbn"

Ack.

>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/x1e80100/cdsp.mbn",
>> +			"qcom/x1e80100/cdsp_dtb.mbn";
> 
> If you expect that production versions of this device will have the
> (firmware) secure boot enabled, this path should also be
> device-specific. If retail versions will allow loading arbitrary
> firmware this can stay as-is. 
> 
> Same for all other "firmware-name"s.

Ack.

>> +
>> +	status = "okay";
>> +};
>> +
>> +&smb2360_0 {
>> +	status = "okay";
>> +};
>> +
>> +&smb2360_0_eusb2_repeater {
>> +	vdd18-supply = <&vreg_l3d_1p8>;
>> +	vdd3-supply = <&vreg_l2b_3p0>;
>> +};
>> +
>> +&smb2360_1 {
>> +	status = "okay";
>> +};
> 
> You have just a single USB-C port, so I would expect that there is also
> only a single SMB2360 instance (for charging). Perhaps you can just drop
> this node?

Tested without this. Seems OK. Ack.

Thanks,
Georg

