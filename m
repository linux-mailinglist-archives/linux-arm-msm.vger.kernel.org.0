Return-Path: <linux-arm-msm+bounces-49132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB13A417EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 09:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 887C716D7F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 08:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC772241CA2;
	Mon, 24 Feb 2025 08:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0KVRt9H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A62241695;
	Mon, 24 Feb 2025 08:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740387367; cv=none; b=Nj51zRijiwLymkWocZGIZ67zvKOLpmYvy4TrrxugPa+nQD4tPSojxam5x96apFaqE2ZDx6j6RPEESBZKbVcEy/AfsCKBRkt/rc5FzkrSeP9HDrYWSpzc/ewY8ZKkOX+9DT5VxnaqsfX5bZ4eElzZ0LCfa3hYw8bZfNMT3Oo41HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740387367; c=relaxed/simple;
	bh=xynIidDgpFBJhwX+rR7LTSuhkkTdXt9jQlEjIf656u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+gTEapFROb2+iHKnaa6b/ktgnsIykQ83cTSx4raw7dVd0Gul5IwR57MzHmw8sDmjznAMWf4Yjwfi0PulrlqbtE8c9GyV9gdCm+SuAcKSDBoJLXKMSrqrrGkmGGCl77S+VHKXzHRuLDzL2EcIOmh0t1guTQjrRmzjgXhr6NjlAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0KVRt9H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11564C4CEE6;
	Mon, 24 Feb 2025 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740387367;
	bh=xynIidDgpFBJhwX+rR7LTSuhkkTdXt9jQlEjIf656u4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0KVRt9H3ECd8N6iv+XzErxMGS+7KbCRuMJUu+bQMYbTnnPHwLcuWiUTIUxllT1QE
	 RNtw+Szf2Z0laWEeTI3RBd+YjTiMgOJpEkNatKEWUAsX8gPTlbVs+PJO+i2LHoKqgW
	 xRVb97fzyaAnQ3W7spRTcxyEEzpiTHGpCvQHcBkkJxhu4J7Z3GDJ5MWimoLpdibh+L
	 JeZd+LI4viRzL2Zc7a4wG9YVhyXHPpm/XJcfL14/Y117GDC+ExglNclxm12adh3E0x
	 VWtE/qavf6qxZzv+Afn4YFlss1vzH7k0IpmU5kX0X7J/QqALHccZ/eohy9ECzjfXAw
	 FQJrOswTPLMJQ==
Date: Mon, 24 Feb 2025 09:56:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/8] dt-bindings: phy: add
 samsung,exynos2200-usbcon-phy schema file
Message-ID: <20250224-curly-cyber-spaniel-efdc39@krzk-bin>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
 <20250223122227.725233-4-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250223122227.725233-4-ivo.ivanov.ivanov1@gmail.com>

On Sun, Feb 23, 2025 at 02:22:22PM +0200, Ivaylo Ivanov wrote:
> The Exynos2200 SoC has a USB controller PHY, which acts as an
> intermediary between a USB controller (typically DWC3) and other PHYs
> (UTMI, PIPE3). Add a dt-binding schema for it.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../phy/samsung,exynos2200-usbcon-phy.yaml    | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml

You have undocumented dependencies which prevent merging this file.
First, dependencies have to be clearly expressed. Second, you should
rather decouple the code from header dependencies, otherwise this cannot
be merged for current release (just use clocks with long names, without IDs).

> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
> new file mode 100644
> index 000000000..7d879ec8b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/samsung,exynos2200-usbcon-phy.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/samsung,exynos2200-usbcon-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Exynos2200 USB controller PHY
> +
> +maintainers:
> +  - Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> +
> +description:
> +  Exynos2200 USB controller PHY is an intermediary between a USB controller
> +  (typically DWC3) and other PHYs (UTMI, PIPE3).

Isn't this the same as usbdrd phy? see: samsung,usb3-drd-phy.yaml

I think there is no PHY between DWC3 and UTMI/PIPE. There is a PHY
controller (so the samsung,usb3-drd-phy.yaml) which we call here the
phy.


Best regards,
Krzysztof


