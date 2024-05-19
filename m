Return-Path: <linux-arm-msm+bounces-20033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FE58C95BA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 20:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28E35B216E6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 May 2024 18:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2437F5029B;
	Sun, 19 May 2024 18:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A686X+ci"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99FE1F5FD;
	Sun, 19 May 2024 18:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716141615; cv=none; b=oCVyqywLgSBuQccRVZzyCGoVx/5IVYqQ8Bz3H8x0RjxY5VogYGlsRK4f3oF2sGusDZR9FY8iTedOUJGuokbzbScLeJs7ghpcsnN3HmtWHgAsV1/jlPJP0yp/zjT+1bWcEzIAVelwGK+1ve5m08orQhCDZDor3Ic/rLnjp1FSFNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716141615; c=relaxed/simple;
	bh=IDSiFykW0taZ632l5viikw7AmB4aSHraGMUKEA3Fehw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gs/RKRCGEIkgQM8WZmQ+Ew40IDlDeMXhavcBbKS4lZ7g0MdohMXfOQiGvX2+JP58R4K3uCbE3T3n2xNHWy1XOpvx423PrE2H3cUE5Et8GVziAUFxYluD2BGi/22iXxjczMS4uPnpRYv2QFb9unXAnZYfQgmx6YDwsNhYkfcPSc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A686X+ci; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A46C32781;
	Sun, 19 May 2024 18:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716141614;
	bh=IDSiFykW0taZ632l5viikw7AmB4aSHraGMUKEA3Fehw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A686X+cizeZiLE+4JI83E7j/BvF61nmJ6EnC05sRPeeGtWTVDmj993e3011RvijEd
	 MD1DzjQ9sf75bv+I6i5SqjLe+UejCKpYZeGH2NJ5QRRC5D91/FIAI21Blc1wYKfCWW
	 CHuhAjpVG4C7Mj8f5VpmM3QeKrfeMZRxfCIdPdHRxV1qI8u97ZGzkpsoMlRzX3fTS4
	 xx3RBY/ZfJJuv8hYu02fWBDuzg4pqEqOwUwQnS7uoWvFgNlolvtbqK3fA0T3EoM5Sx
	 K6uekFyC0yIHfpMQvJGTjFfMpjsPPVrOaWrKnocUnspFUo6v1KK/9EsLE2cTXnmHTF
	 ya0TlYluPKsqQ==
Message-ID: <ff003cb8-460b-4a97-b4f7-990244781209@kernel.org>
Date: Sun, 19 May 2024 20:00:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] ASoC: dt-bindings: document wcd937x Audio Codec
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 quic_pkumpatl@quicinc.com
References: <20240516044801.1061838-1-quic_mohs@quicinc.com>
 <20240516044801.1061838-2-quic_mohs@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240516044801.1061838-2-quic_mohs@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/05/2024 06:47, Mohammad Rafi Shaik wrote:
> From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> 
> Document the Qualcomm WCD9370/WCD9375 Audio Codec and the
> Soundwire devices than can be found on Qualcomm QCM6490 based platforms.
> 
> The Qualcomm WCD9370/WCD9375 Audio Codec communicates

Thank you for your patch. There is something to discuss/improve.

> +
> +  qcom,tx-port-mapping:
> +    description: |
> +      Specifies static port mapping between device and host tx ports.
> +      In the order of the device port index which are adc1_port, adc23_port,
> +      dmic03_mbhc_port, dmic46_port.
> +      Supports maximum 4 tx soundwire ports.
> +
> +      WCD9370 TX Port 1 (ADC1)               <=> SWR2 Port 2
> +      WCD9370 TX Port 2 (ADC2, 3)            <=> SWR2 Port 2
> +      WCD9370 TX Port 3 (DMIC0,1,2,3 & MBHC) <=> SWR2 Port 3
> +      WCD9370 TX Port 4 (DMIC4,5,6,7)        <=> SWR2 Port 4
> +
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 4
> +    maxItems: 4
> +    items:
> +      oneOf:

oneOf here is not needed. Previously used enum should be fine.


> +        - minimum: 1
> +          maximum: 4
> +
> +  qcom,rx-port-mapping:
> +    description: |
> +      Specifies static port mapping between device and host rx ports.
> +      In the order of device port index which are hph_port, clsh_port,
> +      comp_port, lo_port, dsd port.
> +      Supports maximum 5 rx soundwire ports.
> +
> +      WCD9370 RX Port 1 (HPH_L/R)       <==>    SWR1 Port 1 (HPH_L/R)
> +      WCD9370 RX Port 2 (CLSH)          <==>    SWR1 Port 2 (CLSH)
> +      WCD9370 RX Port 3 (COMP_L/R)      <==>    SWR1 Port 3 (COMP_L/R)
> +      WCD9370 RX Port 4 (LO)            <==>    SWR1 Port 4 (LO)
> +      WCD9370 RX Port 5 (DSD_L/R)       <==>    SWR1 Port 5 (DSD)
> +
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 5
> +    maxItems: 5
> +    items:
> +      oneOf:

Again, no need for oneof.

> +        - minimum: 1
> +          maximum: 5
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soundwire@3210000 {
> +        reg = <0x03210000 0x2000>;
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        wcd937x_rx: codec@0,4 {
> +            compatible = "sdw20217010a00";
> +            reg  = <0 4>;
> +            qcom,rx-port-mapping = <1 2 3 4 5>;
> +        };
> +    };
> +
> +    soundwire@3230000 {
> +        reg = <0x03230000 0x2000>;
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        wcd937x_tx: codec@0,3 {
> +            compatible = "sdw20217010a00";
> +            reg  = <0 3>;
> +            qcom,tx-port-mapping = <2 2 3 4>;
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
> new file mode 100644
> index 000000000000..5c76083691ea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm WCD9370/WCD9375 Audio Codec
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description:
> +  Qualcomm WCD9370/WCD9375 Codec is a standalone Hi-Fi audio codec IC.
> +  It has RX and TX Soundwire slave devices.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +  - $ref: qcom,wcd93xx-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,wcd9370-codec
> +      - items:
> +          - const: qcom,wcd9375-codec
> +          - const: qcom,wcd9370-codec
> +
> +  vdd-px-supply:
> +    description: A reference to the 1.8V I/O supply
> +
> +required:
> +  - compatible

I guess VDDPX is not really optional in the hardware is it?

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    codec {
> +        compatible = "qcom,wcd9370-codec";
> +        pinctrl-names = "default", "sleep";
> +        pinctrl-0 = <&wcd_reset_n>;
> +        pinctrl-1 = <&wcd_reset_n_sleep>;
> +        reset-gpios = <&tlmm 83 0>;

Use defines for common/known flags, like GPIO flags.

> +        vdd-buck-supply = <&vreg_l17b_1p8>;
> +        vdd-rxtx-supply = <&vreg_l18b_1p8>;
> +        vdd-px-supply = <&vreg_l18b_1p8>;
> +        vdd-mic-bias-supply = <&vreg_bob>;
> +        qcom,micbias1-microvolt = <1800000>;
> +        qcom,micbias2-microvolt = <1800000>;
> +        qcom,micbias3-microvolt = <1800000>;
> +        qcom,micbias4-microvolt = <1800000>;
> +        qcom,rx-device = <&wcd937x_rx>;
> +        qcom,tx-device = <&wcd937x_tx>;
> +        #sound-dai-cells = <1>;
> +    };
> +
> +    /* ... */
> +
> +    soundwire@3210000 {
> +        reg = <0x03210000 0x2000>;
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        wcd937x_rx: codec@0,4 {
> +            compatible = "sdw20217010a00";
> +            reg  = <0 4>;

Just one space goes before =
This applies to all places.

> +            qcom,rx-port-mapping = <1 2 3 4 5>;
> +        };
> +    };
> +
> +    soundwire@3230000 {
> +        reg = <0x03230000 0x2000>;
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        wcd937x_tx: codec@0,3 {
> +            compatible = "sdw20217010a00";
> +            reg  = <0 3>;

Best regards,
Krzysztof


