Return-Path: <linux-arm-msm+bounces-38352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4205F9D2AD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 17:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 080A7283803
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 16:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485291D0400;
	Tue, 19 Nov 2024 16:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlQXiGc/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E121CC161;
	Tue, 19 Nov 2024 16:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732033489; cv=none; b=DAZsiO7cnEeDrds/RT3DqQppjAKKWHhKU3w0QAYUcxD1si8wespZBIYIp5HdkGTWotIcRjIR1rjxK7B67UyYydRvr2mQLsugBzR2YoaKnMzoy9g4qPUSh0xofUpNu3GWpcGd1IwM5NHj2S6a9DCZ613zzuRZpLrS88Z8Co2sq8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732033489; c=relaxed/simple;
	bh=j6RXHCNuVKCw00NDiP75RQpvT8vD3zsb2CJxkx+a5lw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=hdTW15E+L50XfXj8VthMVHn7I0xTwkKHDWZ29FPdHYucCCNq8Ig0az1LRJ2hEXr8vMTFBqU1xtys8eTOvuO1wEV5HpoqMYASPNKZfoE314qdiig6Jb+5/WIcTVIaIfUJPgpH2V4XNAqtA+nU83Gle6AtKrvaLNdVbnIL0mS5kN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlQXiGc/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60664C4CECF;
	Tue, 19 Nov 2024 16:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732033488;
	bh=j6RXHCNuVKCw00NDiP75RQpvT8vD3zsb2CJxkx+a5lw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=jlQXiGc/YR8uNbwBAQKlWob4eRRzO7iH49Xg2MCH2pQBrvrnaUexWASGP81MF3YpO
	 yFHIEXYEGl77SRDIAO/jQoioITCZu+wHVgqse1FJghR41Vk68PtX+S1dV9TqCwkQY9
	 jbStGm1TiQaxiwtRWIiYnBynNIGFg9ZBFtG9d4c1Iy0z8C86FUw2fv9ITdEZgQvTLe
	 TtEhFXM6awiApADh3Eigxax/s/dK6mDfjW9kZ4xzFYbYbTBl/dUsuylyIfbrNxAmcO
	 ddiOXhgNJli1abovfQGbYKrFijo8KwzLiR3Xw0LBKWO0XZl/WwsTd0u5IXkvta/7Hd
	 p7v+VxLM74kGA==
Date: Tue, 19 Nov 2024 10:24:46 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jose Abreu <joabreu@synopsys.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Emil Renner Berthing <kernel@esmil.dk>, 
 Russell King <linux@armlinux.org.uk>, 
 Minda Chen <minda.chen@starfivetech.com>, linux-arm-msm@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, 
 linux-stm32@st-md-mailman.stormreply.com, Shawn Guo <shawnguo@kernel.org>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Vinod Koul <vkoul@kernel.org>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, imx@lists.linux.dev, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Fabio Estevam <festevam@gmail.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 NXP S32 Linux Team <s32@nxp.com>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com>
Message-Id: <173203348678.1765163.1636321988738538785.robh@kernel.org>
Subject: Re: [PATCH v5 13/16] dt-bindings: net: Add DT bindings for DWMAC
 on NXP S32G/R SoCs


On Tue, 19 Nov 2024 16:00:19 +0100, Jan Petrous (OSS) wrote:
> Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> and S32R45 automotive series SoCs.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 105 +++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   3 +
>  2 files changed, 108 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


