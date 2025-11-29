Return-Path: <linux-arm-msm+bounces-83840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A9AC93B2B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 10:22:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 073994E169A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 09:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F0427602F;
	Sat, 29 Nov 2025 09:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aAgQ3lLF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3537275864;
	Sat, 29 Nov 2025 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764408118; cv=none; b=Vh3R5qdBdSnmwSORBK7dfWuns5IhpuCVz8MXLt6wPEbHfDuwk8CSGy8AxcHroLZrPvZaX/lIPzUi21hUaRwdB7m7qxhzstxi6GahyQ51lqSdi5OcFH1Xs9po4FFBDgAQkZPQg7DUpXJYpWmDSgskEyRjchn+hg4+CSuOjboC8XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764408118; c=relaxed/simple;
	bh=AIxxNjxm6vN2BypuJM4xQOvaeA8Px9VqpKHLawNEZvU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=twjkfwr3XpUwvuPW4NER5/QgG8KU7/0ePaElXegD/b5ol9q3Fih9JHeZ4CIFAe5fKEdv7IAea8/Bd40AmvuCYCnvw/qF4HaIaWwFv51drmXs+bUouiMaMFPcqY2yf9itHgRZrD2frETUGo1JazEh7zclt/8dvAzygiWJpSFwqcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aAgQ3lLF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62FCCC4CEF7;
	Sat, 29 Nov 2025 09:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764408117;
	bh=AIxxNjxm6vN2BypuJM4xQOvaeA8Px9VqpKHLawNEZvU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aAgQ3lLFLxRHg3pJxjAUFy40/C4MSJrVqeTy6tnea0wIFCbgzNQqtps8cK/yTUiLR
	 gKk8KimzUZMK/fZ+oLuWiKbbnze1K3GgbUtji+qIxtX+aS4phuHC/cW1jzBkUOuJ/1
	 s6nQpd9J/6QsOMYlD63YkVCpJBRGosIi9CNUSvdWm/IU81BdXPThfGfRJtAws6CO9/
	 O01VU3Rsct7KHsMTSn9Qm4ovTnTmWjh5hdpokxgGEL1fI1Xgpja0IooFuLpG45WJh4
	 MuuHVqngEJHIyj1ZeHabmXokrXQ2cnqMwbPlDcfDAMcmmUIlL2OuBlMnmzV1VDFHbp
	 k+tZx1WwMfpdg==
Date: Sat, 29 Nov 2025 03:21:55 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Antoine Tenart <atenart@kernel.org>, mwojtas@chromium.org, 
 netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, 
 Herve Codina <herve.codina@bootlin.com>, Eric Dumazet <edumazet@google.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-arm-msm@vger.kernel.org, 
 thomas.petazzoni@bootlin.com, davem@davemloft.net, 
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org, 
 Romain Gantois <romain.gantois@bootlin.com>, devicetree@vger.kernel.org, 
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, 
 =?utf-8?q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>, 
 Tariq Toukan <tariqt@nvidia.com>, 
 =?utf-8?q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Simon Horman <horms@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20251129082228.454678-2-maxime.chevallier@bootlin.com>
References: <20251129082228.454678-1-maxime.chevallier@bootlin.com>
 <20251129082228.454678-2-maxime.chevallier@bootlin.com>
Message-Id: <176440811455.3523222.6418355134728802633.robh@kernel.org>
Subject: Re: [PATCH net-next v21 01/14] dt-bindings: net: Introduce the
 ethernet-connector description


On Sat, 29 Nov 2025 09:22:13 +0100, Maxime Chevallier wrote:
> The ability to describe the physical ports of Ethernet devices is useful
> to describe multi-port devices, as well as to remove any ambiguity with
> regard to the nature of the port.
> 
> Moreover, describing ports allows for a better description of features
> that are tied to connectors, such as PoE through the PSE-PD devices.
> 
> Introduce a binding to allow describing the ports, for now with 2
> attributes :
> 
>  - The number of pairs, which is a quite generic property that allows
>    differentating between multiple similar technologies such as BaseT1
>    and "regular" BaseT (which usually means BaseT4).
> 
>  - The media that can be used on that port, such as BaseT for Twisted
>    Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
>    ethernet, etc. This allows defining the nature of the port, and
>    therefore avoids the need for vendor-specific properties such as
>    "micrel,fiber-mode" or "ti,fiber-mode".
> 
> The port description lives in its own file, as it is intended in the
> future to allow describing the ports for phy-less devices.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  .../bindings/net/ethernet-connector.yaml      | 57 +++++++++++++++++++
>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251129082228.454678-2-maxime.chevallier@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


