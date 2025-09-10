Return-Path: <linux-arm-msm+bounces-72991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C10B5180D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 15:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48A491730C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B4B30DEBC;
	Wed, 10 Sep 2025 13:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPtWYkdO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4315F1494CC;
	Wed, 10 Sep 2025 13:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757511515; cv=none; b=dCvzRHYdTuMR0ZhA1cYL0uAEw1Bba/BVk3EdTUkbLrF1q85oQJPulABdOXRg5K7xURsVXHbFqYI5QvsSj3pVoJ3tHg7aF3LNGKDv77AVjRuAEHagNdFe+Z2gkbOq7deFMnTcamWT7fwjhRSG3bNrh72ClyJE2K2P2GzaE4muLbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757511515; c=relaxed/simple;
	bh=a040r4eM2yhSWfXdg58fzda5OZ7oGB0lS6HGqRV+5gQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=odj3APKAuKgbUr4JgDaIuolluAO+nIzG/+/K3H2vxKUFqcjGEdB4djZu3u3PsCYyPiEIwFKWT1IGWGKIEtohR++SRTFJ//dVXXqYkan61EEfQfaTNL2ygUu4gZdV/wSoh2k0gKPqU+Lav1h5Yv7Pj78y01LD/Za/mIjtpX9yaNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPtWYkdO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8CFEC4CEF0;
	Wed, 10 Sep 2025 13:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757511514;
	bh=a040r4eM2yhSWfXdg58fzda5OZ7oGB0lS6HGqRV+5gQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=HPtWYkdOO487YPncRRA10m+CcLPt0C/2M4I2IfM/F1LoV9p4Y8+e3F53OFIrEtm5A
	 uM2We3Zb9Gnr9/gicHy/kKJ1gBkfBDyaUfEmxugkONkn0XFDdSUwvULqtP4PcFjW15
	 7d3NweIe78LkdubkgleqTHGnGCtw11S+/vR4d5YB/OaoRBjsApNJNHG15ZOtU6NT2d
	 Le/7x0gAo5DMzMNtgyh/vhIZzcVVGpEgKwgSDfSJyoPmUDQuzi4fseAda+XHDC4Bpq
	 zy4ylspGlOINlNJLyaSHpAxAVtj2oijUQSOcHMSE44GPKzQlygoDVhLjt9+nxwPOv6
	 dLcaeOUn5K4pQ==
Date: Wed, 10 Sep 2025 08:38:34 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Eric Dumazet <edumazet@google.com>, 
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Vinod Koul <vkoul@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 devicetree@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>, 
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
Message-Id: <175751081352.3667912.274641295097354228.robh@kernel.org>
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems


On Wed, 10 Sep 2025 10:07:39 +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> properties here differ a lot from the HLOS-managed variant, lets put it
> in a separate file.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   4 +-
>  MAINTAINERS                                        |   1 +
>  3 files changed, 105 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac): power-domains: [[4294967295]] is too short
	from schema $id: http://devicetree.org/schemas/net/renesas,rzn1-gmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac): Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-names', 'interrupts', 'phy-mode', 'power-domains', 'reg', 'rx-fifo-depth', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fifo-depth' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/renesas,rzn1-gmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac): power-domains: [[4294967295]] is too short
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): power-domains: [[4294967295, 4]] is too short
	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): Unevaluated properties are not allowed ('mac-address', 'phy-mode', 'reg', 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): power-domains: [[4294967295, 4]] is too short
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


