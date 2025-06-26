Return-Path: <linux-arm-msm+bounces-62581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47215AE95FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 08:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D9F61C416EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 06:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6308823B62C;
	Thu, 26 Jun 2025 06:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tnsp22j+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E02B230D35;
	Thu, 26 Jun 2025 06:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750918413; cv=none; b=j7dGwuOAgrAS95G30Dx9HHMJDydv712HFSDGSTFCqXiIvIQLgMYUIBgk1URgQvF50nYqfYuNNgbhp7UB2Ic8dkn5rxQsOknZJO+qw58kNC8SdsaymDpTIjd3SdsXmHlmRBn2NyE/O1qSNvw2J77XGxZLeKyjHrC4U1joYloHCkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750918413; c=relaxed/simple;
	bh=kQewIcHxcZZzUysSl/BZpgfpwvZeD8Ca8Hj0O8Cl/Hs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EC0+7N3XcWK285REhxDEeMTzSZQRhQWZM29fAtu2erKwmGl0kHLK12KPmqLwBW7TVEsIrdF9681qI7Ske1Z3DGIa3OJm0MVPt2aagV5a6IJ/zTG4xPEGPpmwj+B4Od4QHtMawFXqcsZ5q2nms74SSKD+c6eqbPYD1XWbnTt7dzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tnsp22j+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0AAC4CEEB;
	Thu, 26 Jun 2025 06:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750918412;
	bh=kQewIcHxcZZzUysSl/BZpgfpwvZeD8Ca8Hj0O8Cl/Hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tnsp22j+vp13zbP1mtxwo5fvGrZk9OQB+FnMpG7f7tdgVJEdEi2t9HN6iQeuDpvAz
	 0Q5lIZdkzCyOei98grEUK24Lrz63XwYeOVBfIHZ2t1/jBYAAR24L7+Rg4MPwPva4yF
	 Ddwz7wS1OR8YUrviNlvTwJqwGTm9oH/IX+T0BwzW+cGGUUH1rbZjigGdnOSrRNXKSV
	 CEctUr8kA6PBrbZD9Z/R9E9rKFAvyp+DQiGpyb6nck9qv9KOOTS0dV+vo1IRlcMEPn
	 IAAjnUUn28C30O/yg4IuffIrNYoMT/DouM/0LKfCYgAWKBug6/z4EF9nXZ1Hbl6PWb
	 p8SWOtSxImdvg==
Date: Thu, 26 Jun 2025 08:13:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: sound: add bindings for pm4125 audio
 codec
Message-ID: <wcmalvywoginosy5pp7wskgdzjbwbydividmk4dtwguoltiobf@muw5lzkvgu5c>
References: <20250626-pm4125_audio_codec_v1-v1-0-e52933c429a0@linaro.org>
 <20250626-pm4125_audio_codec_v1-v1-1-e52933c429a0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626-pm4125_audio_codec_v1-v1-1-e52933c429a0@linaro.org>

On Thu, Jun 26, 2025 at 12:50:29AM +0100, Alexey Klimov wrote:
> The audio codec IC is found on Qualcomm PM4125/PM2250 PMIC.
> It has TX and RX soundwire slave devices hence two files
> are added.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../bindings/sound/qcom,pm4125-codec.yaml          | 147 +++++++++++++++++++++
>  .../devicetree/bindings/sound/qcom,pm4125-sdw.yaml |  86 ++++++++++++
>  2 files changed, 233 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..1b6ce8d4397b4c1c048899bd2cc4d02318cc46c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-codec.yaml
> @@ -0,0 +1,147 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,pm4125-codec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PM4125 Audio Codec
> +
> +maintainers:
> +  - Alexey Klimov <alexey.klimov@linaro.org>
> +
> +description:
> +  The audio codec IC found on Qualcomm PM4125/PM2250 PMIC.
> +  It has RX and TX Soundwire slave devices.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,pm4125-codec
> +
> +  reg:
> +    description:
> +      Specifies the SPMI base address for the audio codec peripherals. The
> +      address space contains reset register needed to power-on the codec.
> +    maxItems: 1
> +
> +  reg-names:
> +    maxItems: 1
> +
> +  vdd-io-supply:
> +    description: A reference to the 1.8V I/O supply
> +
> +  vdd-cp-supply:
> +    description: A reference to the charge pump I/O supply
> +
> +  vdd-mic-bias-supply:
> +    description: A reference to the 3.3V mic bias supply
> +
> +  vdd-pa-vpos-supply:
> +    description: A reference to the PA VPOS supply
> +
> +  qcom,tx-device:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: A reference to Soundwire tx device phandle
> +
> +  qcom,rx-device:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: A reference to Soundwire rx device phandle
> +
> +  qcom,micbias1-microvolt:
> +    description: micbias1 voltage
> +    minimum: 1800000
> +    maximum: 2850000
> +
> +  qcom,micbias2-microvolt:
> +    description: micbias2 voltage
> +    minimum: 1800000
> +    maximum: 2850000
> +
> +  qcom,micbias3-microvolt:
> +    description: micbias3 voltage
> +    minimum: 1800000
> +    maximum: 2850000
> +
> +  qcom,mbhc-buttons-vthreshold-microvolt:
> +    description:
> +      Array of 8 Voltage threshold values corresponding to headset
> +      button0 - button7
> +    minItems: 8
> +    maxItems: 8
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-io-supply
> +  - vdd-cp-supply
> +  - vdd-mic-bias-supply
> +  - vdd-pa-vpos-supply
> +  - qcom,tx-device
> +  - qcom,rx-device
> +  - qcom,micbias1-microvolt
> +  - qcom,micbias2-microvolt
> +  - qcom,micbias3-microvolt
> +  - "#sound-dai-cells"

Keep consistent quotes, either ' or "

> +
> +additionalProperties: false

This has to unevaluatedProperties

> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    spmi {
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +
> +        pmic@0 {

pmic {

> +            compatible = "qcom,pm8916", "qcom,spmi-pmic";

Drop, you have warnings here.

> +            reg = <0x0 SPMI_USID>;

Drop

> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            audio-codec@f000 {
> +                compatible = "qcom,pm4125-codec";
> +                reg = <0xf000>;
> +                vdd-io-supply = <&pm4125_l15>;
> +                vdd-cp-supply = <&pm4125_s4>;
> +                vdd-pa-vpos-supply = <&pm4125_s4>;
> +                vdd-mic-bias-supply = <&pm4125_l22>;
> +                qcom,micbias1-microvolt = <1800000>;
> +                qcom,micbias2-microvolt = <1800000>;
> +                qcom,micbias3-microvolt = <1800000>;
> +                qcom,rx-device = <&pm4125_rx>;
> +                qcom,tx-device = <&pm4125_tx>;
> +                #sound-dai-cells = <1>;
> +            };
> +        };
> +    };
> +
> +    /* ... */
> +
> +    soundwire@a610000 {

Drop this and next one.

> +        reg = <0x0a610000 0x2000>;
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        pm4125_rx: audio-codec@0,4 {
> +            compatible = "sdw20217010c00";
> +            reg = <0 4>;
> +            qcom,rx-port-mapping = <1 3>;
> +        };
> +    };
> +
> +    soundwire@a740000 {
> +        reg = <0x0a740000 0x2000>;
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        pm4125_tx: audio-codec@0,3 {
> +            compatible = "sdw20217010c00";
> +            reg = <0 3>;
> +            qcom,tx-port-mapping = <1 1>;
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..7241d2ab5dcf4a0d5f25a75acb33a335f93d3b5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,pm4125-sdw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SoundWire Slave devices on PM4125/PM2250 PMIC audio codec.
> +
> +maintainers:
> +  - Alexey Klimov <alexey.klimov@linaro.org>
> +
> +description: |

Drop |

> +  The audio codec IC found on Qualcomm PM4125/PM2250 PMICs.
> +  It has RX and TX Soundwire slave devices. This bindings is for the
> +  slave devices.

Last sentence is redundant and makes no sense. Codec has only slave
devices, so how this can be anything else than for slave devices?


> +
> +properties:
> +  compatible:
> +    const: sdw20217010c00
> +
> +  reg:
> +    maxItems: 1
> +
> +  qcom,tx-port-mapping:
> +    description: |
> +      Specifies static port mapping between device and host tx ports.
> +      In the order of the device port index which are adc1_port, adc23_port,
> +      dmic03_mbhc_port, dmic46_port.
> +      Supports maximum 2 tx soundwire ports.
> +
> +      PM4125 TX Port 1 (ADC1,2 & DMIC0 & MBHC)    <=> SWR0 Port 1
> +      PM4125 TX Port 2 (ADC1 & DMIC0,1,2 & MBHC)  <=> SWR0 Port 2
> +
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2
> +    items:
> +      enum: [1, 2, 3, 4]
> +
> +  qcom,rx-port-mapping:
> +    description: |
> +      Specifies static port mapping between device and host rx ports.
> +      In the order of device port index which are hph_port, clsh_port,
> +      comp_port, lo_port, dsd port.
> +      Supports maximum 2 rx soundwire ports.
> +
> +      PM4125 RX Port 1 (HPH_L/R)       <==>    SWR1 Port 1 (HPH_L/R)
> +      PM4125 RX Port 2 (COMP_L/R)      <==>    SWR1 Port 3 (COMP_L/R)
> +
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 2
> +    maxItems: 2
> +    items:
> +      enum: [1, 2, 3, 4, 5]
> +
> +required:
> +  - compatible
> +  - reg

rx and tx are excluding, so this should be here encoded.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soundwire@a610000 {
> +        reg = <0x0a610000 0x2000>;
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        pm4125_rx: codec@0,1 {
> +            compatible = "sdw20217010c00";
> +            reg = <0 1>;
> +            qcom,rx-port-mapping = <1 3>;
> +        };
> +    };
> +
> +    soundwire@a740000 {
> +        reg = <0x0a740000 0x2000>;

One example is enough, they are the same.

> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        pm4125_tx: codec@0,1 {
> +            compatible = "sdw20217010c00";
> +            reg = <0 1>;
> +            qcom,tx-port-mapping = <1 1>;
> +        };
> +    };
> +
> +...
> 
> -- 
> 2.47.2
> 

