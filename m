Return-Path: <linux-arm-msm+bounces-83841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B65C93B37
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 10:22:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 06B9B4E1E2D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Nov 2025 09:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D890027B331;
	Sat, 29 Nov 2025 09:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDmci5u+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D0B27A442;
	Sat, 29 Nov 2025 09:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764408120; cv=none; b=GaugQrfe1BwkTUsDfMX5hH/Q4SXo3NIZ7n0sKhnLXIoT7cIWEt+Q+kPGeiFk5fCHc0L4I0FI7zoeOUoVpke4JfrdWjhE7rBJ54pKl7ch8S+g03bymA+YJwZML/q2Go3Gxo38NOaIpWjWRJQVHuuoIJXELwHC90zomfNPV5pBHRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764408120; c=relaxed/simple;
	bh=sogpOuSUqfbJepFbkIkyP19GQaHrYVXkuJ/MaiPaku8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ff0XRaF6SNMyH3RJYpygH34kzc+1Si8dKwwQdaPi78u4WNNolsSl3xWSXiQ5I7KJyDnIuwmmD6jgSkvmzETfBHMvjBJYiWjecN4TLuv5t/Hi3ygLlfEtP7JLoKhQMEs8vhnVxPve9YQ7zdvcF9/OQzpj73vvPQRcF57VfH6RQvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDmci5u+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8D0C116C6;
	Sat, 29 Nov 2025 09:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764408119;
	bh=sogpOuSUqfbJepFbkIkyP19GQaHrYVXkuJ/MaiPaku8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iDmci5u+CYVqoAYFd0wuwL4uQi4YhU9ZKXiuB93HT1jRBNVjItxrPhQqbRxa4KEa0
	 gyPTyK49Q1/Sd/5zAI2QIu5OsjZlqZLCXdak43Pj5FpKmnsGUnyqcWP43pC6wm1dil
	 2ETCZH3s4qk6x+Te7aNj1JMIJSsuqsZHfbGYYtIpyo5iJ3ga++iWIDwai30rvbufVd
	 EQ4MnkIh/WNW5BzG49s9fSRDeoA9eGSwyOoKBzm1wJhJYyP4XW2gr/EGqnyR8ulz9q
	 DOZcIso6rXS79M6DwL8B3KaJmjVOUYAJYA7PYxmR/uRjTpYfjsO8w6mbJw2G1g1k+/
	 si/v7aDm2FzAQ==
Date: Sat, 29 Nov 2025 03:21:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
 Paolo Abeni <pabeni@redhat.com>, Herve Codina <herve.codina@bootlin.com>, 
 =?utf-8?q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>, 
 netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 Andrew Lunn <andrew@lunn.ch>, Dimitri Fedrau <dimitri.fedrau@liebherr.com>, 
 =?utf-8?q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, mwojtas@chromium.org, 
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>, davem@davemloft.net, 
 Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, 
 Simon Horman <horms@kernel.org>, Antoine Tenart <atenart@kernel.org>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, devicetree@vger.kernel.org, 
 Tariq Toukan <tariqt@nvidia.com>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20251129082228.454678-6-maxime.chevallier@bootlin.com>
References: <20251129082228.454678-1-maxime.chevallier@bootlin.com>
 <20251129082228.454678-6-maxime.chevallier@bootlin.com>
Message-Id: <176440811592.3523266.4372040709133421609.robh@kernel.org>
Subject: Re: [PATCH net-next v21 05/14] dt-bindings: net: dp83822:
 Deprecate ti,fiber-mode


On Sat, 29 Nov 2025 09:22:17 +0100, Maxime Chevallier wrote:
> The newly added ethernet-connector binding allows describing an Ethernet
> connector with greater precision, and in a more generic manner, than
> ti,fiber-mode. Deprecate this property.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  Documentation/devicetree/bindings/net/ti,dp83822.yaml | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251129082228.454678-6-maxime.chevallier@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


