Return-Path: <linux-arm-msm+bounces-41903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB329F0613
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 09:11:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DB76188A3A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 08:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724981AB6CB;
	Fri, 13 Dec 2024 08:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXKaIOHd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463931A7270;
	Fri, 13 Dec 2024 08:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734077455; cv=none; b=gCI/jzasxYURhQaQT9gH8L3y2AR0i60mzGHdAEOvAKmePGFZkgvB0sRfKM+YWgz4w6SWIHmjWoxpB2LxqvXvYGu2cqWwlRUuzEM6I97kcXGwOUXQ8OM0LN3Z/r2T5w4dHU+n7Z9HamFUFXZxWB66Vk79kN6I9FrDP1cU43twdoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734077455; c=relaxed/simple;
	bh=Aom1UMzrOBOqk2LYfiZr6r1pt5xBSVA3BVftJnNAVFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rr4EX1Q+AgM1dEgDAwY0wgpTxzK1ij8moVXX7UTsxiWwGN0EbEvM+eI2sjte4s/pTYacUC4+X/uKInWe/wzyytGzkQaIAFBpgAkQgNltK1Mdma4gnTdDu6G9RA7iZzBMjmB/auOUQLgKoJSehjK+57ldwAWwrr01uN8IEEKPpe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXKaIOHd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992E1C4CED0;
	Fri, 13 Dec 2024 08:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734077454;
	bh=Aom1UMzrOBOqk2LYfiZr6r1pt5xBSVA3BVftJnNAVFI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=dXKaIOHdtDcWY750RYj0T+FcJWOBC+B6ltV5WHrJsnQ+HPVESxMxHuNrx1lqJ7kGP
	 1yY2KbdZOovz6ZrZnWj27M2CdJw9u7aTVIoY0QdwunpnVB3WvsUaDqrCulNoyehMHU
	 5aHgeG3uIdTbC7PmWHWj2s61j61XiS+uSy6iPJnYJFXwKSGfDqsXt+jwuh9Spy2xej
	 AnKzDDHRqhsMz/Njn/u2xkk+q0E/1H0qz+8Spvpy+9b2yRx198sjKr0YX/p5N7mEvI
	 4/gwap9MJ0Aw6/K2LgTBeRRTCNrPKOaDxWS4UqFaNtXmyf2939wuEdv2ZlGMDx9Qdi
	 TB/WglcnT/tdA==
Message-ID: <bd86def5-46d7-4121-9477-d54a5b7014fc@kernel.org>
Date: Fri, 13 Dec 2024 09:10:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine:
 Add industrial mezzanine
To: Sahil Chandna <quic_chandna@quicinc.com>, kernel@quicinc.com,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, quic_nkumarsi@quicinc.com,
 quic_akdwived@quicinc.com, quic_kkotecha@quicinc.com
References: <20241206065156.2573-1-quic_chandna@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241206065156.2573-1-quic_chandna@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2024 07:51, Sahil Chandna wrote:
> The industrial mezzanine kit enhances the capabilities of QCS6490
> rb3gen2 core kit. Add support for industrial mezzanine board.
> 
> Signed-off-by: Sahil Chandna <quic_chandna@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |  3 ++
>  .../qcs6490-rb3gen2-industrial-mezzanine.dtso | 44 +++++++++++++++++++
>  2 files changed, 47 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6ca8db4b8afe..6fe5a5ccd950 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -111,6 +111,9 @@ dtb-$(CONFIG_ARCH_QCOM)     += qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs6490-rb3gen2.dtb
> +
> +qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo

I don't see your finial overlay being applied.

> +
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs9100-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        += qcs9100-ride-r3.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> new file mode 100644
> index 000000000000..74f2f782d166
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> @@ -0,0 +1,44 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/*
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include "pm7250b.dtsi"
> +#include "sc7280.dtsi"
> +
> +&pm7250b_gpios {
> +        gpio5_tpm_dig_out {

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).


> +                gpio5_dig_out_default: gpio5_dig_out_default {

Please follow DTS coding style.

> +                        pins = "gpio5";
> +                        function = "normal";
> +                        power-source = <1>;
> +                        output-high;
> +                        input-disable;
> +                        bias-pull-up;
> +                        qcom,drive-strength = <3>;
> +                };
> +        };
> +};
> +
> +&qupv3_id_1 {
> +        status = "okay";
> +};
> +
> +&spi11 {
> +        status = "okay";
> +
> +        st33htpm0: st33htpm@0 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +                compatible = "st,st33htpm-spi";
> +                reg = <0>;
> +                spi-max-frequency = <20000000>;
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                pinctrl-names = "default";
> +                pinctrl-0 = <&gpio5_dig_out_default>;
> +                status="okay";

Drop

> +        };
> +};
> --
> 2.17.1


Best regards,
Krzysztof

