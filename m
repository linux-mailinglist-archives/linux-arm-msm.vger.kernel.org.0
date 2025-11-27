Return-Path: <linux-arm-msm+bounces-83658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A97B0C8FE21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 19:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 28D3734FF5C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 18:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0798C301011;
	Thu, 27 Nov 2025 18:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMR64hqa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9A13009FA;
	Thu, 27 Nov 2025 18:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764267388; cv=none; b=c8vhVCmDOhErE6MDvJrTcq/XFxYB/PNcEyXGuJSTa1+BUGFvgxKttglLwVlZHifXevDrPtSPxwjm1jqIImE+yzdQP5tVJ81QvPJshXUxQHgq1rCrjn/depGP+XxYLxvX4kliXhSpP3P/ligDvMXz9/3dwRAbmxXqrP5UZ+v6KQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764267388; c=relaxed/simple;
	bh=6ixq0XVWHVxLUr4aT6Reqy57r8vKO5cAra3hnoC7JMQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Z5iUUBTDB6hsr4QyODnZqECC5XeqEFoHofelb3xDrLrBxN5DM0xIeGMKA3ST+m71OdTZKWlVo0Iqwra0DpyRpoDuKewWdGZ7QpdVt35TVTR8uPDxFMcm7SVt7KilZ/qbtkbBd/oKkLH1pSSzc6idPqQSYXVdhuukVlhq3KS9XQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMR64hqa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192D6C113D0;
	Thu, 27 Nov 2025 18:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764267388;
	bh=6ixq0XVWHVxLUr4aT6Reqy57r8vKO5cAra3hnoC7JMQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rMR64hqauCjp4BzhYr2pOBC069zTXW83KN4sAup5rfoMam4U6MkiRoDbOpmMTykcL
	 wMx3rh02Y7h06GdOoMFicOdMHAhrScZeoEUFCF3HhcRRMkpwwWHkHYzm3Qx33vs/FZ
	 scjjUOe58oJ5nohzrvlkm7H2yT5KuvhwgQ65MDoZR9ReYE7SaNz6Uu+VQimUTYgKIs
	 dmPPeKJXMrdqPe80mvKvYNB2M7AdlV+2ADzWQChzJTWO5DrZewQcwrBaBw05EJCaoj
	 X/Xia8twSpEkjujQ8WAzIl/JhSt3q/ZONbOxpbtOhSRL4/mAu+/7rtFlFgNmR4ULfL
	 G05jma+lwJ+Lw==
Date: Thu, 27 Nov 2025 12:16:27 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Romain Gantois <romain.gantois@bootlin.com>, 
 linux-arm-msm@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
 Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, 
 Florian Fainelli <f.fainelli@gmail.com>, mwojtas@chromium.org, 
 devicetree@vger.kernel.org, Tariq Toukan <tariqt@nvidia.com>, 
 thomas.petazzoni@bootlin.com, Conor Dooley <conor+dt@kernel.org>, 
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, 
 Simon Horman <horms@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Eric Dumazet <edumazet@google.com>, Herve Codina <herve.codina@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>, 
 Daniel Golle <daniel@makrotopia.org>, 
 =?utf-8?q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Antoine Tenart <atenart@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
 =?utf-8?q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20251127171800.171330-6-maxime.chevallier@bootlin.com>
References: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
 <20251127171800.171330-6-maxime.chevallier@bootlin.com>
Message-Id: <176426738519.367608.14469073626442288770.robh@kernel.org>
Subject: Re: [PATCH net-next v20 05/14] dt-bindings: net: dp83822:
 Deprecate ti,fiber-mode


On Thu, 27 Nov 2025 18:17:48 +0100, Maxime Chevallier wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251127171800.171330-6-maxime.chevallier@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


