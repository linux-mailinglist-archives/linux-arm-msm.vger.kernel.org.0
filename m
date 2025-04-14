Return-Path: <linux-arm-msm+bounces-54153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C18A8788F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 09:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7318C1886762
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 07:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404192580C6;
	Mon, 14 Apr 2025 07:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ByBVFfBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0668B257AF7;
	Mon, 14 Apr 2025 07:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744615069; cv=none; b=j+ObMsTmy91wAQAbe+6yMlrvoLXL+J55ihbxwNvkMs5x8Pcto2qAj13FpznTjlQQwjD08j+XbfrpUL+AfgbDO4Z+DkEu4VPlsr6YrwxAqXad1eWGhDCuxPiQgPctt8VQWIE9XCIcf312loxPmwyoGeNxtBb0Tpq03VMdHhoQmS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744615069; c=relaxed/simple;
	bh=boozTliB7bYs9rUJdY0DioZxAqN1tNd+gw4KQY9xVJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyVaJd6EcZ8NU1dOp2b0JGhTRMwzNg42ctwLkAR0japMh9QyuApGAnBLnmGUZYlv0oAf02fSy0XpawAGP12KHyWXPm3NkxDZxPaKoQBFZY9zuA+D0OwFs2OXoYldiObimGZIuAiX0E7qQ0IEvk9grubJF8L7FhunsBM61UAiBeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ByBVFfBI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D953C4CEE2;
	Mon, 14 Apr 2025 07:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744615068;
	bh=boozTliB7bYs9rUJdY0DioZxAqN1tNd+gw4KQY9xVJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ByBVFfBIBlXtzPv5hLien3pIvMPuF4iKRCHwVIRLjxecR5XfVrU940qgXIh8zLq+V
	 TUtRXXgTkhU0tK0wIKISb+0JFOtBmjE5QR5nW7nc63S4kwj7/Ytj1EHtLkh+mZYf6D
	 tydV73OxZmf3+x+b2LrF0QUIgWwmqhPLBS4e8bHzElGdM31A+g1VnCcUxaoxKXoIQB
	 qStlv3nYNvhRp13U9sqZmDPjToTw2L8950wd3pBRz9KFc4361H5r+iGC8iWN/5E/z6
	 PBXbWOq4pJBsEy0EE9cN0MQGzm0d3M5ldcB0AUusaURgxUv3PUwFtatejS8dIZjnvi
	 Bkb26kpVKoxlg==
Date: Mon, 14 Apr 2025 09:17:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 01/10] dt-bindings: phy: add exynos2200 eusb2 phy
 support
Message-ID: <20250414-glaring-swallow-of-serenity-78edcb@shite>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
 <20250412202620.738150-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250412202620.738150-2-ivo.ivanov.ivanov1@gmail.com>

On Sat, Apr 12, 2025 at 11:26:11PM GMT, Ivaylo Ivanov wrote:
> Document the exynos2200 eUSB2 compatible. Unlike the currently documented
> Qualcomm SoCs, the driver doesn't make use of reset lines for reset
> control and uses more clocks.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../bindings/phy/samsung,snps-eusb2-phy.yaml  | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml

Please name it after compatible, so
samsung,exynos2200-eusb2-phy.yaml


> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml
> new file mode 100644
> index 000000000..09d3fdd4a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/samsung,snps-eusb2-phy.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/samsung,snps-eusb2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SNPS eUSB2 phy controller
> +
> +maintainers:
> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> +
> +description:
> +  eUSB2 controller supports LS/FS/HS usb connectivity on Exynos2200.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos2200-snps-eusb2-phy

I did not mention this earlier, but I think we should skip the snps in
the compatible. Using vendor name in device name is just confusing, so:

samsung,exynos2200-eusb2-phy

However the description should include it, e.g.

Samsung Exynos2200 eUSB2 phy, based on Synopsys eUSB2 IP block, ....


...

> +additionalProperties: false
> +
> +examples:
> +  - |
> +    usb_hsphy: phy@10ab0000 {
> +        compatible = "samsung,exynos2200-snps-eusb2-phy";
> +        reg = <0x10ab0000 0x10000>;
> +        #phy-cells = <0>;
> +
> +        clocks = <&cmu_hsi0 7>,
> +            <&cmu_hsi0 5>,
> +            <&cmu_hsi0 8>;

These should be aligned with opening <

With above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


