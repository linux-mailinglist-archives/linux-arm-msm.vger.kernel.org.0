Return-Path: <linux-arm-msm+bounces-86154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E6FCD510E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9DAA030056D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 880A02FF144;
	Mon, 22 Dec 2025 08:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pNwgeSWn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573D2209F5A;
	Mon, 22 Dec 2025 08:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766392389; cv=none; b=PR6prvLvUW1vCWTCsMVNLfyxwLOgRKL1oxMTxQc7YAenNq4Y4hPLVFzWLDdhR9LdI8i/zJFTLVlbqWmuGUCv5EekJ7IhAWeGpe9V4KRh4SAiiHEhfvBSgEgCk635cy6m98rjWgMm0XHOlVU8fiBVWZH8fMozsZ8bXNgS9lNQS0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766392389; c=relaxed/simple;
	bh=kUUnbAuGEjrmM//2x59uFgORJkzw0Ymx44NkugoSY00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVCm4v6ghWVHhwCSi89LsDiPoHdILHGu2NkHvtXXrfeZP3mMeFocqtYdal7wadhT5Wku5xfzZC6Ez4AIJGkZYEv/aLPgC7OMT4o+sOX9OKeKORB+zUkq8tJM8xe5pJpzDZ6hNNwv50inILFUlNDCkq3Pk1GS84MRRpAy6I156WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pNwgeSWn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0327DC4CEF1;
	Mon, 22 Dec 2025 08:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766392388;
	bh=kUUnbAuGEjrmM//2x59uFgORJkzw0Ymx44NkugoSY00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pNwgeSWnIM0d8102Pvyue1PQt9cIyxD54ZGU2UPczl4MJj7oY8aZx6apAqwNmd2kE
	 rZhoKzVtafA3TRAOXTiZ0u9qGs9vF8Fp8yAKHiQe4N8qKssH4Rei2PuJhd3l08kJIo
	 ZVZ00GYykkjVLHmgfPvqB3ZldmbSBsdSYtkhHwsvJALaphwUlRTytwP0jfhaH3KjRa
	 0z7miXIsVn+PWLyHnrQazf61OJJckWSJo68jpPnHohbdHH2edspqkvTq/K2SLiCJBR
	 WY4QORER8bSFjBQJMex5mNmhYGRIcN0UzsrZZVop7bkvDX4ZJyhFvNIALpGpPB6vUo
	 5yJ9ouIQB3Gpg==
Date: Mon, 22 Dec 2025 09:33:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 06/11] dt-bindings: display: panel: Describe Samsung
 SOFEF03-M DDIC
Message-ID: <20251222-godlike-mongoose-of-valor-3eeee0@quoll>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-6-82a87465d163@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-6-82a87465d163@somainline.org>

On Mon, Dec 22, 2025 at 12:32:12AM +0100, Marijn Suijten wrote:
> Document the Samsung SOFEF03-M Display-Driver-IC and 1080x2520@120Hz DSI
> command-mode panels found in the Sony Xperia 5 II and Sony Xperia 5 III.
> It requires Display Stream Compression 1.1 which allows the panels to be
> driven at 120Hz, even though a 60Hz mode is available too.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Your patchset has multiple white space warnings. Apply and see...

> ---
>  .../bindings/display/panel/samsung,sofef03-m.yaml  | 79 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 84 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,sofef03-m.yaml b/Documentation/devicetree/bindings/display/panel/samsung,sofef03-m.yaml
> new file mode 100644
> index 000000000000..5712eca2773d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef03-m.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,sofef03-m.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SOFEF03-M DDI for 1080x2520@120Hz 6.1" OLED DSI panels
> +
> +maintainers:
> +  - Marijn Suijten <marijn.suijten@somainline.org>
> +
> +description: |
> +  Samsung SOFEF03-M Display-Driver-IC found in the Sony Xperia 5 II (edo pdx206, amb609vp01
> +  panel) and
> +  Sony Xperia 5 III (sagami pdx214, amb609vp04
> +  panel) smartphones.  It is always programmed with Display Stream Compression 1.1 enabled.

Please wrap according to Linux coding style.

> +
> +  The assembly features a Samsung touchscreen compatible with
> +  samsung,s6sy761.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,sofef03-m-amb609vp01
> +      - samsung,sofef03-m-amb609vp04
> +
> +  port: true
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  reset-gpios: true
> +
> +  vci-supply:
> +    description: DriverIC Operation supply (3.0V)
> +
> +  vddio-supply:
> +    description: I/O voltage supply (1.8V)
> +
> +required:
> +  - compatible
> +  - port
> +  - reg
> +  - reset-gpios
> +  - vci-supply
> +  - vddio-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel@0 {
> +            compatible = "samsung,sofef03-m-amb609vp01";
> +            reg = <0>;
> +
> +            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
> +
> +            vci-supply = <&vreg_l11c_3p0>;
> +            vddio-supply = <&vreg_l14a_1p8>;
> +
> +            port {

Not tested :/


Best regards,
Krzysztof


