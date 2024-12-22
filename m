Return-Path: <linux-arm-msm+bounces-43063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2659FA456
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 07:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ECA8188995F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 06:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D300913B791;
	Sun, 22 Dec 2024 06:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKjFThZi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40B6567D;
	Sun, 22 Dec 2024 06:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734849199; cv=none; b=fi9sNEcXtM5gvkBOkzQtV2gnAV97W14no2nFabl47tvNZ+CukUYZupWj9oPOfB9AFPByHY855SJedojJKHVHIA6mk/QA16frnJHfhh1b26k/dN6AHbQcqC9TtxXVXsF0kTi0RILFXEL2+k1F9jo3BS0DM9rM/4I3jeSLl6LWTR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734849199; c=relaxed/simple;
	bh=FfE61ElHDzjGHedV/Z5vJTcY0TEGbvvKpTRUegMgMR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYeK4z7j6EK/8XLnqqcJjnnPFFWILmuNdyvjjgbSUCRJMb+0kSx92PwZ97x5YB350g1zfDnrKhuhB4IZaRYU+BpUhx7Ce8wR4D57mtoa1DOzNhmfkCv/rdf/T9CvL2d/zTFyzgvFTRdgPfVmpKa5yn0gIXjBf9Qq7rHK10M68EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKjFThZi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41327C4CECD;
	Sun, 22 Dec 2024 06:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734849198;
	bh=FfE61ElHDzjGHedV/Z5vJTcY0TEGbvvKpTRUegMgMR0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HKjFThZiKgrYvomanu7WhU7je6GoEzpTmnobFEYsswEmQA/QEoPR3cfHqnIsojD07
	 h5sRlkSDDdj2NoGVAwHgpzFgPltZHW/ephvQCiK/gPrYY/xRz7IJmMJpzJuNkLIduW
	 xIHvagm+3l1/aD04dI15iOnEDpyvso7/RftKRKqi7tXQJUAb0thH/bpKfMlxczNkZu
	 rAGPXlQ/oo+zPWQfiMqCISjrznOWYYGvvU3HiXB0LHnNCHR8zoezrVDp+09KvQl8fk
	 QY31HG6ItYF4IUCmn9Tb4TvxMos84E4X1rWh1y42YYW3gS8mnvCNFAdCukLIl5HLjX
	 eDIU4fc4JdGng==
Date: Sun, 22 Dec 2024 07:33:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: platform: Add bindings for Qcom's EC
 on IT8987
Message-ID: <tma7q7lfskdr7myfoeene7o27g7nhc5ca66kpmnqvgksv5oxqv@ziefqqp5khic>
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219200821.8328-1-maccraft123mc@gmail.com>

On Thu, Dec 19, 2024 at 09:08:18PM +0100, Maya Matuszczyk wrote:
> This patch adds bindings for the EC firmware running on IT8987 present
> on most of X1E80100 devices

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  .../bindings/platform/qcom,x1e-it8987-ec.yaml | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml b/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
> new file mode 100644
> index 000000000000..4a4f6eb63072
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/platform/qcom,x1e-it8987-ec.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/platform/qcom,x1e-it8987-ec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Embedded Controller on IT8987 chip.

Drop full stop. Titles don't have them.

> +
> +maintainers:
> +  - Maya Matuszczyk <maccraft123mc@gmail.com>
> +
> +description:
> +  Most x1e80100 laptops have an EC running on IT8987 MCU chip. The EC controls
> +  minor functions, like fans, power LED, and on some laptops it also handles
> +  keyboard hotkeys.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,x1e-it8987-ec

That's not a SoC, so I don't understand:
1. referring to the SoC,
2. Having this alone and as fallback.

It does not look like you tested the bindings, at least after quick
look. Please run 'make dt_binding_check' (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.

Best regards,
Krzysztof


