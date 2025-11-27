Return-Path: <linux-arm-msm+bounces-83657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8D2C8FE18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D8CF234F7E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1CBC2FFDF7;
	Thu, 27 Nov 2025 18:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4GL01Qe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3362D060C;
	Thu, 27 Nov 2025 18:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764267387; cv=none; b=VIGd8reg8b6zj1Yi8mKZB/e6x/Ge5T9rdjMAYbdlCN2eGa4jNyCczFkoV6BLl13jvLRVaDzMFEgkbtDLEHwu08zPxd7ymPoBQWOW+vh3TfQQdfpdExh2o2v0+VTNmyrd356+Vg24HPU/oODujPcuRQe52UFDZhde0s1CCAopWXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764267387; c=relaxed/simple;
	bh=RflXuShl1SRrOVIWtn7ZMy5clte/Mu7DfNNyZaXZk10=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ikD+oOnXU8BqOcGu0XR/u/xrSxEgHwoqec8XD1mHv6ORFUqLksezdZehapjx5i186QfNWNqazQL9GGBwwbeY8o4xtSyRtB+maDzCUw56XmNLIJ9fxdF90iCrbvs6MtGf9jrgISwdGuDmPwPZUkTBG3pbxekJM+bGsdgjCzrKIOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4GL01Qe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76AEC4CEF8;
	Thu, 27 Nov 2025 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764267387;
	bh=RflXuShl1SRrOVIWtn7ZMy5clte/Mu7DfNNyZaXZk10=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=j4GL01QeOprmmJSFmPd2dZFMiM0pK6izCKVWFTOE++RtSa0S5Lf2PeduLh5wH5U1v
	 8PbfXD9YuMGE0twIhs/58Hkoh3gmWEEKT5mNJTajY5lxJ6nsYaVzW+j44krTJ0+aeX
	 //l6AyVF44R0mYell3wFGt6lieXoB9Fl/liAl8epT/guyO40whCtTRga1ogkFAqZsO
	 GGhUeDt2tlWXchuVtmsqaM2WgLp7dg4rqRHw/leCmWo7+QTbc3TZ3jJwKSflyIsh8j
	 L0ukfXmx2mAgSIyeUPrqjE03Wi1zPl6vSZNQvHzhgFb1GYkMIlCZzrXiNYKW2l44sb
	 +gKNhGghLsOkQ==
Date: Thu, 27 Nov 2025 12:16:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, davem@davemloft.net, 
 Daniel Golle <daniel@makrotopia.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, mwojtas@chromium.org, 
 Antoine Tenart <atenart@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>, 
 thomas.petazzoni@bootlin.com, Russell King <linux@armlinux.org.uk>, 
 Simon Horman <horms@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Eric Dumazet <edumazet@google.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>, 
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 devicetree@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20251127171800.171330-2-maxime.chevallier@bootlin.com>
References: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
 <20251127171800.171330-2-maxime.chevallier@bootlin.com>
Message-Id: <176426738405.367554.14295793625592890396.robh@kernel.org>
Subject: Re: [PATCH net-next v20 01/14] dt-bindings: net: Introduce the
 ethernet-connector description


On Thu, 27 Nov 2025 18:17:44 +0100, Maxime Chevallier wrote:
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
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-zones.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c263000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']
Documentation/devicetree/bindings/thermal/thermal-sensor.example.dtb: /example-0/soc/thermal-sensor@c265000: failed to match any schema with compatible: ['qcom,sdm845-tsens', 'qcom,tsens-v2']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251127171800.171330-2-maxime.chevallier@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


