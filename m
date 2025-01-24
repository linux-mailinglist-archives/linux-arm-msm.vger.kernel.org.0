Return-Path: <linux-arm-msm+bounces-46101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE7CA1B959
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 16:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3574916FFFD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 15:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA1A1CCEEC;
	Fri, 24 Jan 2025 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4A738mc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3AE165F18;
	Fri, 24 Jan 2025 15:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737732406; cv=none; b=oR/ocYq33wMI1fKCkow0/jZg1pXo5EX1HZMX3awImTZt4ohsbfEKeg4khuuVID8E8+ukwcTzhFXLPXKJDJX3TnGevYjz/Xw/7N+l1O51pjcyJfElLZ0IErqlvof9lfZgoRYQRn73W2qE5BD26DRX7p3z+XLPVYRHhPYI3bPZ4KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737732406; c=relaxed/simple;
	bh=I4B5vKu/OpviD5xTex6t7kYbehRnv7GHY2vV2m5BMRg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=oadxx3N9FOqKfLlqhjguK6jlBkpBNy85+vwqnsLB680jukauM2AJp3BdZHo9j1ZzQF6EArWaGUvVWzCg6Du+6nyWaxCzlbWG+s2ypkA3jCzq6Wmx+fHoBYs6iVHb3bvpF15HGuMD30axAQ2Sllg3l7XRSPppb+HDQJ9+E+1m8h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4A738mc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28016C4CED2;
	Fri, 24 Jan 2025 15:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737732406;
	bh=I4B5vKu/OpviD5xTex6t7kYbehRnv7GHY2vV2m5BMRg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=U4A738mcAAEIs7r19RonddZcsikZAB02tsGwV+vgsHqOIr1CJKvcbqYBt6HZ7H3Ae
	 kvZyZ03DkiKpdbj24Z7WAnY+NfQSccmUKRFoo+5yIeUQfgsqx63YqKllghGVxCrzlv
	 xPCdeJHmED5PeUfhQ8fUxr0sQbD9VROBp0Tczs4eaa1HLgWz8ZaVw/k1kr7mc4WQyp
	 h365gT01aFavd/RRG9zB7O5hJwNXYKB4LRlJPFHQk3ByWuCCbXKxEhkJ3qSAq2iJb0
	 W3WCGsk2lWslbpVkmGLq1bOxRHE+1LIIXRdnobP866laWLObhWQ3O5KKO780+W7SCB
	 t1SawWHHG7jww==
Date: Fri, 24 Jan 2025 09:26:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: andersson@kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, quic_jprakash@quicinc.com, 
 quic_kamalw@quicinc.com, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
 konradybcio@kernel.org
To: Rakesh Kota <quic_kotarake@quicinc.com>
In-Reply-To: <20250124070200.3969230-1-quic_kotarake@quicinc.com>
References: <20250124070200.3969230-1-quic_kotarake@quicinc.com>
Message-Id: <173773232224.1805161.13299626383351520341.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcs6490-rb3gen2: Add vadc and adc-tm
 channels


On Fri, 24 Jan 2025 12:32:00 +0530, Rakesh Kota wrote:
> Add support for vadc and adc-tm channels which are used for
> monitoring thermistors present on the platform.
> 
> - Add the necessary includes for qcom,spmi-adc7-pm7325 and
>   qcom,spmi-adc7-pmk8350.
> - Add thermal zones for quiet-thermal, sdm-skin-thermal, and
>   xo-thermal, and define their polling delays and thermal sensors.
> - Configure the pm7325_temp_alarm node to use the pmk8350_vadc
>   channel for thermal monitoring.
> - Configure the pmk8350_adc_tm node to enable its thermal sensors
>   and define their registers and settings.
> - Configure the pmk8350_vadc node to define its channels and settings
> 
> Signed-off-by: Rakesh Kota <quic_kotarake@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 114 +++++++++++++++++++
>  1 file changed, 114 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250124070200.3969230-1-quic_kotarake@quicinc.com:

arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2: pwm:nvmem: [[346, 347]] is too short
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm: nvmem: [[346, 347]] is too short
	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@0: adc@3100: 'oneOf' conditional failed, one must be fixed:
	'#address-cells', '#size-cells', 'channel@103', 'channel@144', 'channel@146', 'channel@44', 'pmk8350-die-temp@3' do not match any of the regexes: 'pinctrl-[0-9]+'
	'#address-cells', '#size-cells', 'channel@103', 'channel@144', 'channel@146', 'channel@44', 'interrupts', 'pmk8350-die-temp@3' do not match any of the regexes: 'pinctrl-[0-9]+'
	'pmk8350-die-temp@3' does not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'
	['qcom,spmi-adc7'] is too short
	'qcom,spmi-adc7' is not one of ['qcom,pm8226-iadc', 'qcom,pm8941-iadc']
	'qcom,spmi-adc7' is not one of ['qcom,pmi8998-rradc', 'qcom,pm660-rradc']
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: adc@3100: 'pmk8350-die-temp@3' does not match any of the regexes: '^channel@[0-9a-f]+$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/iio/adc/qcom,spmi-vadc.yaml#






