Return-Path: <linux-arm-msm+bounces-76803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 563BCBCE288
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 19:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E256719A3585
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 17:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC0D2FC895;
	Fri, 10 Oct 2025 17:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYSntg7k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387142FC881;
	Fri, 10 Oct 2025 17:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760118602; cv=none; b=ng83Vpj1Aq9ERTqFA02LNqMyrLgav6Rvi203+QP58U7UaVbJdupvH839jrFZlzvm/mqH3KdgeORXKtgNzlsWCqMiitFIwBPL8Fa3lNOSzHIGCajjrLtP61PmJF9WCMjcgOtQjDqEo3YJLW/tyR1AeJ4ldMgv9+++oDAuOF8I0WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760118602; c=relaxed/simple;
	bh=dMh8GBD4EAIQyzaGwyEd2ZtNzCl7oE20APdIRhgCkgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcRrbdQLuHiCqb/9yb04+j7i950eXvx+pRRsuiZa547bOy9iEXLTKa/9uAo/uxhqEQBZ6uDlobprYc1Ff+WeZBStZVrJzQTUefwnRllF3ZJ/fYTB6e7R/2JJUod8AcKD+rVuBiyMfm7QQWN+7XA3u23vgyO9Z/kyX/sdKBZ0cgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYSntg7k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92498C116C6;
	Fri, 10 Oct 2025 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760118601;
	bh=dMh8GBD4EAIQyzaGwyEd2ZtNzCl7oE20APdIRhgCkgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RYSntg7krxRyForxuUI1r3H41ecE3Iq3vwl3eTPg581hTVTOgAfGnum8VXzSmfr4V
	 jSvMhAAxNj/TpSoXZeZHOZ9DVDgiV0ffpEWSqTy/2QTQ5pBgZdjCJBYcuP4SPK1boA
	 FXB32PHfjCXbPgw36axYILpbGouI9kslTYsgBLu39Tpgt4cx0CCo3Gq+T58FduLVzY
	 PULLq5xKcNDSXDwj/41sy8SuiljheHTAyEEaUWn5hT65z8yV8/9IrGRvWL3nhMQlxA
	 /LQrzxJY8z8N21wD2JceFIeuuTW64mbNgM+UovCvMsLtFeVXTVLxCbKq4+iIdw+c0H
	 DjsfedyCQPJ7A==
Date: Fri, 10 Oct 2025 12:49:59 -0500
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: net: qcom: document the ethqos
 device for SCMI-based systems
Message-ID: <20251010174959.GA502249-robh@kernel.org>
References: <20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org>
 <20251008-qcom-sa8255p-emac-v2-1-92bc29309fce@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-qcom-sa8255p-emac-v2-1-92bc29309fce@linaro.org>

On Wed, Oct 08, 2025 at 10:17:48AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
>  MAINTAINERS                                        |   1 +
>  3 files changed, 106 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0a9cc789085e8bc94d44adc9da982b66071d1e79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos-scmi.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/qcom,ethqos-scmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Ethernet ETHQOS device (firmware managed)
> +
> +maintainers:
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Konrad Dybcio <konradybcio@kernel.org>
> +  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +
> +description:
> +  dwmmac based Qualcomm ethernet devices which support Gigabit
> +  ethernet (version v2.3.0 and onwards) with clocks, interconnects, etc.
> +  managed by firmware
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8255p-ethqos
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: stmmaceth
> +      - const: rgmii
> +
> +  interrupts:
> +    items:
> +      - description: Combined signal for various interrupt events
> +      - description: The interrupt that occurs when HW safety error triggered
> +
> +  interrupt-names:
> +    items:
> +      - const: macirq
> +      - const: sfty
> +
> +  power-domains:
> +    minItems: 3
> +
> +  power-domain-names:
> +    items:
> +      - const: power_core
> +      - const: power_mdio
> +      - const: perf_serdes

I would drop power and perf. I don't want to know about the abusing of 
the power-domain binding.

Rob

