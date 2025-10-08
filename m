Return-Path: <linux-arm-msm+bounces-76381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB6FBC49B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 13:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FB473A868F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 11:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289012ECE8C;
	Wed,  8 Oct 2025 11:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCzS4wjP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD681DFE0B;
	Wed,  8 Oct 2025 11:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759924019; cv=none; b=UXgL0sOeWHUK2vDWplugINjIk5l2qIpcuoulk2834KdtlgbPpcpOzv6nUtjjqF6nEFR0C/xOdnzx4tASge/F8Rklwnjth6AuqRzuC8jHlLjblx+JqPNEv5sdftQ2bozr8ZyrL6VWneOe+RIuSTHKNNtc3pOQheIq29tyhXKnZCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759924019; c=relaxed/simple;
	bh=EpgdIB0VrKXe9RLfKIuBV1GtRp2U7rWH3b+xzvj9yP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNZHVsqAUj4INjByzZZlWzu6AVLugcfB320Nji60rjrkAxrxIZtaN5CFU1Jzr6PfmMuF//rw0qzL3gD8EigTCJA3AelWA1xcZirHKZLXnd6XolGC3j4B4r89uzd864yEIB7XC9Qkd1Dhr2QchvOyjtZCacIF29d8VuUTOmurZLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCzS4wjP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E298C4CEF4;
	Wed,  8 Oct 2025 11:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759924018;
	bh=EpgdIB0VrKXe9RLfKIuBV1GtRp2U7rWH3b+xzvj9yP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XCzS4wjPaNIks2gCKdcMpv8VZn0+DC3oGMu5Xuc1IAFbayT/Zunyil8BUnXVQPK2k
	 cq2mahgAuhQm7tTS9+Dic9luY8FzKII1afm0ECrLZPMoH8g4KPS/SX2Y3AHBQrF+EV
	 480TertJsVvSXOg5DJELQJm3nEU58BJkZCHa74RYpww6eGpiNyEL8eSC7sko5sCEk8
	 4gUxdA4dcdUv2+8suVKSDmhFGFfVgqrrT/j9Bmyp81nHucWbQ4i4UxKwdMIrguMcE/
	 fdqnHoF4nob3i0NeixW8Pw49Zt0wtsFBrd8sqHM/GROYz6psDkJXVHLawtCAvJaemV
	 GCCBPFi7R3YKQ==
Date: Wed, 8 Oct 2025 06:46:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	Abel Vesa <abel.vesa@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>, Li Jun <jun.li@nxp.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Fabio Estevam <festevam@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: switch: split out ports definition
Message-ID: <175992401654.3284722.6085529297622918555.robh@kernel.org>
References: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>


On Tue, 30 Sep 2025 19:17:21 +0200, Neil Armstrong wrote:
> The ports definition currently defined in the usb-switch.yaml
> fits standards devices which are either recipient of altmode
> muxing and orientation switching events or an element of the
> USB Super Speed data lanes.
> 
> This doesn't necessarely fit combo PHYs like the Qualcomm
> USB3/DP Combo which has a different ports representation.
> 
> Move the ports definition to a separate usb-switch-ports.yaml
> and reference it next to the usb-switch.yaml, except for
> the Qualcomm USB3/DP Combo PHY bindings.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/all/175462129176.394940.16810637795278334342.robh@kernel.org/
> Fixes: 3bad7fe22796 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/phy/fsl,imx8mq-usb-phy.yaml           |  4 +-
>  .../bindings/phy/samsung,usb3-drd-phy.yaml         |  4 +-
>  .../devicetree/bindings/usb/fcs,fsa4480.yaml       |  1 +
>  .../devicetree/bindings/usb/gpio-sbu-mux.yaml      |  1 +
>  .../devicetree/bindings/usb/nxp,ptn36502.yaml      |  1 +
>  .../devicetree/bindings/usb/onnn,nb7vpq904m.yaml   |  1 +
>  .../devicetree/bindings/usb/parade,ps8830.yaml     |  1 +
>  .../bindings/usb/qcom,wcd939x-usbss.yaml           |  1 +
>  .../devicetree/bindings/usb/ti,tusb1046.yaml       |  1 +
>  .../devicetree/bindings/usb/usb-switch-ports.yaml  | 68 ++++++++++++++++++++++
>  .../devicetree/bindings/usb/usb-switch.yaml        | 52 -----------------
>  11 files changed, 81 insertions(+), 54 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


