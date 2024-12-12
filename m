Return-Path: <linux-arm-msm+bounces-41673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1387B9EE090
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4D99161491
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 07:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2D81C303E;
	Thu, 12 Dec 2024 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jeeJEh7H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3400259483;
	Thu, 12 Dec 2024 07:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733989759; cv=none; b=ZcQeyTXCPFNtjQCSdjVsy6HOtO5BORwU8Z0VgDZ7vZ/RWo7b9PrXlbZRFnymSt74ahXvcV0eMXWZrHsmlrDlAck0eNAPofFRyOW2pEJkLmmhhVGaQIVIa7v8n/2oL12E9sBPSQwdlkXJbb0cK5VOMgwcd2B9HAPnlVy18hkhu9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733989759; c=relaxed/simple;
	bh=p3mVkGTYYw4PGCqBGsvh1X6A+H2Tkmbmuy1fUcgCET0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyAzvS92zQa99PG3DXp0cja0UIGJVitv9NE8KC28wDsO+QgjNv3xEXx5ai2jBtdTZbfY4XH7UOdHqaP7zLvvD7FH9SCWi3DqT5klZiZOmjS1L/UR5YtikUTlxPchO4h9j6dbLuTgktbwDOfOCnapoMUB6Zzc0HqHifE2VYRxyG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jeeJEh7H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C0EC4CECE;
	Thu, 12 Dec 2024 07:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733989759;
	bh=p3mVkGTYYw4PGCqBGsvh1X6A+H2Tkmbmuy1fUcgCET0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jeeJEh7H7efSdzzC+/3xdEAK5nrtYFU9Tw/8EPLZp1fF/HOTT7xgNmrCMxy8LULbz
	 /46JCmmXw5RNBddL1TOS80LGAsECHDBHRfvAC1kiYL8h1Kv3nfrAXe4hjgpSJY5y4p
	 Sq0pZ7whW9w5heMvGOmSfUXNYDP8AuNoX8HwFDun5E/VabsTugJTvw19D/qMO9zhmR
	 gheLC7DbiIShjJK87hAunhKT8TJJi4IVpKL2Ryeb2KH8J87d06BgU40almAvzHbosT
	 GYtxtY52CNXZ5Va1gdLDKWCq8PrDVhvyGXjKwjzds/eyV0URGKKrmfG/PzYr9gG0Wu
	 w2/ItbKqxkPTw==
Date: Thu, 12 Dec 2024 08:49:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: broonie@kernel.org, konradybcio@kernel.org, 
	konrad.dybcio@oss.qualcomm.com, andersson@kernel.org, srinivas.kandagatla@linaro.org, 
	tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@linaro.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/14] ASoC: dt-bindings: qcom,wsa881x: extend
 description to analog mode
Message-ID: <gzsjlaqdkn3ztc5mpfbdidr2vqxllnkdizzzfyy7t5z7vu3o3i@izzpix77yxik>
References: <20241212004727.2903846-1-alexey.klimov@linaro.org>
 <20241212004727.2903846-10-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212004727.2903846-10-alexey.klimov@linaro.org>

On Thu, Dec 12, 2024 at 12:47:22AM +0000, Alexey Klimov wrote:
> WSA881X also supports analog mode when device is configured via i2c
> only. Document it, add properties, new compatibles and example.
> 
> While at this, also adjust quotes.
> 
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../bindings/sound/qcom,wsa881x.yaml          | 75 +++++++++++++++++--
>  1 file changed, 67 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> index ac03672ebf6d..e482d9dc0de2 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> @@ -12,15 +12,17 @@ maintainers:
>  description: |
>    WSA8810 is a class-D smart speaker amplifier and WSA8815
>    is a high-output power class-D smart speaker amplifier.
> -  Their primary operating mode uses a SoundWire digital audio
> -  interface. This binding is for SoundWire interface.
> -
> -allOf:
> -  - $ref: dai-common.yaml#
> +  This family of amplifiers support two operating modes:
> +  SoundWire digital audio interface which is a primary mode
> +  and analog mode when device is configured via i2c only.
> +  This binding describes both modes.
>  
>  properties:
>    compatible:
> -    const: sdw10217201000
> +    enum:
> +      - qcom,wsa8810
> +      - qcom,wsa8815

You implement only one compatible, so does it mean they are compatible?
If so, make them compatible.

> +      - sdw10217201000
>  
>    reg:
>      maxItems: 1
> @@ -35,17 +37,60 @@ properties:
>    '#sound-dai-cells':
>      const: 0
>  
> +  clocks:
> +    maxItems: 1
> +
> +  mclk-gpios:
> +    description: GPIO spec for mclk

Do not repeat property name as description. Say something useful. "GPIO
spec for" is redundant, it cannot be anything else, so basically your
description saod "mclk" which is the same as in property name.

Usually clocks are not GPIOs, so description could explain that.

> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
>    - powerdown-gpios
> -  - "#thermal-sensor-cells"
> -  - "#sound-dai-cells"
> +  - '#thermal-sensor-cells'
> +  - '#sound-dai-cells'
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,wsa8810
> +            const: qcom,wsa8815

That's not a valid syntax. Either enum or const.

This was never tested.

> +    then:
> +      properties:
> +        reg:
> +          description:
> +            In case of analog mode this should be I2C address of the digital
> +            part of the device. The I2C address of analog part of an amplifier
> +            is expected to be located at the fixed offset.
> +          maxItems: 1
> +          items:
> +            minimum: 0x0e
> +            maximum: 0x0f
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,wsa8810
> +            const: qcom,wsa8815

Why are you repeating the if?

> +    then:
> +      required:
> +        - clocks
> +        - mclk-gpios
>  
>  unevaluatedProperties: false
>  
>  examples:
>    - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +
>      soundwire@c2d0000 {
>          #address-cells = <2>;
>          #size-cells = <0>;
> @@ -68,4 +113,18 @@ examples:
>          };
>      };
>  
> +    i2c0 {

i2c

Best regards,
Krzysztof


