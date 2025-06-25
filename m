Return-Path: <linux-arm-msm+bounces-62508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FC0AE8CD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 20:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD6D91883D7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 18:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B9A2E2EFC;
	Wed, 25 Jun 2025 18:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dWtv+78w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2932DA77C;
	Wed, 25 Jun 2025 18:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750876878; cv=none; b=otK2WsEQy2a7RqVKWRySWqJ6N5faFogqbsi0Zy6le5K72N7xzX4O5Eyf1Z0WWXvo/LSL77RFXdevfhGnlpxXVhX+422UtRXxt5ASLAVBcGQIhKw1k4mgwq+dM2744JGTYg5vE6IkHf9jzkEyKbHAKo6GiisTHkzHJ0FP5UUE6pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750876878; c=relaxed/simple;
	bh=YIqdFUnrDKWeVurIumCT1yOoNMX9Wmo1YKjLdM7JSjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kjhMqa5oig61u6eopOUOsw2Rl/Q68qp8yrCLDa4ZODO+w9N8e8ad0KsLwvk6RDBcU8xcffUW7hfdssyXAuhb0xtpjJX5pceBaFX2CmHOMQnhMoebdQf6KdgYu5cTtELvS1Qk3j1a4aC9XjuzeTbZE11rDCmxRfZCc+gYL31iqoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dWtv+78w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA2B2C4CEEA;
	Wed, 25 Jun 2025 18:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876878;
	bh=YIqdFUnrDKWeVurIumCT1yOoNMX9Wmo1YKjLdM7JSjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dWtv+78wMBu4N9UTopIIMUNW+CMD2DzcNjsZ9E/gZv4rrH8qSp1646DCcIZauoJUp
	 wsDkvqfgC+xderKq/1fUAQE1Z7VSfm3ajte1uo0DWT5m7mGMwTWVoYyi0PvtDTK9nj
	 8LIv+T3ivxaZmpMx1xp4PjniDxaupneqaqsa7WJM2gRm+Sw/e/HNr0CJ088Tyz9L+D
	 UTEnbZavZaxGHEEp5UK3DN9dlnBNCtmo8Gpuic94H88xBDqYyGNoyssLn+QBllqVrh
	 ZyMNGoc287Qy7+hKeovf3oMEKN8WCWak1yYeKEWzY41lCoENV+hlrXyArNukjRik1+
	 T/olh0kJmpNeA==
Date: Wed, 25 Jun 2025 13:41:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, devicetree@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>, Nishanth Menon <nm@ti.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sunxi@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Hector Martin <marcan@marcan.st>, linux-tegra@vger.kernel.org,
	linux-amlogic@lists.infradead.org, Sven Peter <sven@svenpeter.dev>,
	Samuel Holland <samuel@sholland.org>, asahi@lists.linux.dev,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Janne Grunau <j@jannau.net>, Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH 4/5] dt-bindings: mailbox: nvidia,tegra186-hsp: Use
 generic node name
Message-ID: <175087687639.1999653.9393745012974436532.robh@kernel.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-4-724407563997@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-4-724407563997@linaro.org>


On Tue, 03 Jun 2025 13:57:11 +0200, Krzysztof Kozlowski wrote:
> According to Devicetree specifications, device node names should be
> generic, thus Mailbox provider should be called "mailbox", not "hsp".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


