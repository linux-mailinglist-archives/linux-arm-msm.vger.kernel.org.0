Return-Path: <linux-arm-msm+bounces-36691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2569B9B8C76
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 08:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9D8E281035
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 07:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39766155C82;
	Fri,  1 Nov 2024 07:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REaLF6yu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064E1155725;
	Fri,  1 Nov 2024 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730447851; cv=none; b=BTEggnxfWtWmdTIxtBfYFveQGlRHykGcFzkDjxsl5dXmJp2vg2UnEw+LzNi9a88YMCTBESgmuA5s+pM1zXR9nHMQcESYU2LO7Sj5McNtdHyaGXLMH9t9j9XLyzondbYU5S65Qgao9dgQ9+pL6iC3NA0zr5n/N9pGyEVsu3zIzno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730447851; c=relaxed/simple;
	bh=PYjzJ6oc/cUDYE5XVnoHQwrMOeHNxGpbqiucsAvpusY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2mJtBud2qI6or7kxxbk14JaT+PFEQzrvqGooHbUCE/cTkwYqHGPyGCed4hSMuPChPW4NY4B30nAm2lrsMfqf9Y1NX8DRpcTlQNBahGXHznOZ9I3Qo7DbcAPgCwUHylI/VveW6iOV+vb973wUuSjBgb2hN6J0UyeOZs7sw860Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REaLF6yu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA5EC4CECD;
	Fri,  1 Nov 2024 07:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730447850;
	bh=PYjzJ6oc/cUDYE5XVnoHQwrMOeHNxGpbqiucsAvpusY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=REaLF6yuTOcF/q/w1W6jwYgNo96dzkqs0vqWmxK/pGygMJBQqVNMrjfLqm2icAQNJ
	 2Ob9e2yATJ0TS6+EMsDnSlMGpCBg5VciXXUSgOUS71ggpJFt9STZy5SgxNgcsmRfti
	 6rO8lgeri5v7cfge+o8Lxa9tyhva+luT3iAKx7xOiH4Ql7gYfK1RedK/7MtdJk1hW7
	 +zq8PnyhrWc6b18np34+IjLLsySI3L4sWEDJyoiJXu6PWz9tUIMENiN+hlIVW92VZ3
	 fmwjESl+F8RtkLaz77WJf6ZTnUpvGlFfr5P0byBSuebzbxSPLhqNPSzgwUM2I1Ej4E
	 vqRAbz9QiuVVw==
Date: Fri, 1 Nov 2024 08:57:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, konradybcio@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, srinivas.kandagatla@linaro.org, 
	tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 06/10] ASoC: dt-bindings: add wsa881x-i2c binding for
 analog mode
Message-ID: <woeeh7cosv47z4ckqbomfc3rqqxfolyfycgcz32do2yadg7xdj@geqank3dp55t>
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
 <20241101053154.497550-7-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101053154.497550-7-alexey.klimov@linaro.org>

On Fri, Nov 01, 2024 at 05:31:50AM +0000, Alexey Klimov wrote:
> Add binding document for WSA881X family of smart speaker amplifiers
> that set to work in analog mode only and configurable via i2c only.
> Such devices are found in Qualcomm QRB4210 RB2 boards with
> SM4250/SM6115 SoCs.
> 
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../bindings/sound/qcom,wsa881x-i2c.yaml      | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml
> new file mode 100644
> index 000000000000..51b040b134d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x-i2c.yaml

Filename must match compatible.

> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,wsa881x-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm WSA8810/WSA8815 Class-D Smart Speaker Amplifier in Analog mode
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +  - Alexey Klimov <alexey.klimov@linaro.org>
> +
> +description: |
> +  WSA8810 is a class-D smart speaker amplifier and WSA8815
> +  is a high-output power class-D smart speaker amplifier.
> +  Their primary operating mode uses a SoundWire digital audio
> +  interface however the amplifier also supports analog mode and it
> +  can be controlled via I2C. This binding is for I2C interface.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,qrb4210-wsa881x-i2c-codec

qrb4210 is a name of a board, not codec. i2c is redundant, codec as
well. 'x' is not allowed.

This is qcom,wsa8810 and qcom,wsa8815 compatible with it.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: Master clock for WSA amplifier
> +    maxItems: 1
> +
> +  clock-names:
> +    description: Master clock name

No, this has to be constrained. Please look how other bindings do it.
Anyway, just drop names, not really useful for one entry.

> +    maxItems: 1
> +
> +  powerdown-gpios:
> +    description: GPIO spec for Powerdown/Shutdown line to use
> +    maxItems: 1
> +
> +  mclk-gpios:
> +    description: GPIO spec for mclk
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - clocks
> +  - reg
> +  - powerdown-gpios
> +  - mclk-gpios
> +  - "#sound-dai-cells"

Keep consistent quotes, either ' or "

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +
> +    i2c0 {

i2c

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      wsa881x@e {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "qcom,qrb4210-wsa881x-i2c-codec";
> +        reg = <0x0e>;
> +        clocks = <&q6afecc LPASS_CLK_ID_MCLK_3 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> +        powerdown-gpios = <&lpass_tlmm 16 GPIO_ACTIVE_LOW>;
> +        mclk-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_HIGH>;
> +        #sound-dai-cells = <0>;
> +      };
> +    };
> +
> +    i2c1 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +

That's the same example, drop.

Best regards,
Krzysztof


