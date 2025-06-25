Return-Path: <linux-arm-msm+bounces-62509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DE9AE8CE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 20:46:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C00B57B8DF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 18:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E6E2E4256;
	Wed, 25 Jun 2025 18:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7qjIcdk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0F02DA77C;
	Wed, 25 Jun 2025 18:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750876898; cv=none; b=Ux9BnQWnPTqmO2Sdn7Cx6ocvYMgJXv81IGRWIeLj8U6RvZn7DUGTOpi+3xA2NzhqE60VHQpVHAledaVr5Rj9DzKrG0uFM6TLTIyWxQk4JeYjlGRuyhdrVD1qrUuECfMeRunzC8T2whbix0wlq0C3BQQ2OaL6O8gUmhJSaN7PyFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750876898; c=relaxed/simple;
	bh=wxeKAaw4aalXeyf5+7rhG+eyj+foK0QMHsVAbOwvW24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYzfc5gUb7N79RPlbu2oqUgd04ri6mEpvRJ0oAgiMUFqbXUKq67/OK88WUqRVH41EyxVGJ8OqlYmU8YrpO5hAIX7wkJ4T8kbjVq4LqnIsOYxYEK7cc81mEpRLvc/48AU2olEAPmZsuP/nHeIOUwXgLJPOWpc72zwZ/iQnYDIKBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7qjIcdk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D29D1C4CEEA;
	Wed, 25 Jun 2025 18:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876896;
	bh=wxeKAaw4aalXeyf5+7rhG+eyj+foK0QMHsVAbOwvW24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z7qjIcdkJyu0GkdqJZyBHRZUdFn1DrTxxu5BtvpIZNgFWBqdaAOuuURO/j5rZwhn0
	 T9gr05XzG6g9tHsnmmKxiCe18Bzg7cP8oUM8jJT6SZIeSiy5ZcGJxYte2DDx8XJYuy
	 8hW8IOj+qeLPXyJ8ApBt/KAUUKGBYWO3Pnf97Yr3dKrPYutGy4dPOpY/vkG2tF2Rok
	 AM+b1Ejonsztge8HkA888c7z6/Bxv6VILAljTGDjCpvDSqkhu6/mkh4EMglH4oQoF5
	 hLSCPKLF++Q06qhgkKUkFBdcuBU75ShT9EIAesAFgTdQhf9fG2u6bGmvZUPyt6MHJC
	 eeEx3rr+GGXcQ==
Date: Wed, 25 Jun 2025 13:41:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sunxi@lists.linux.dev, Jerome Brunet <jbrunet@baylibre.com>,
	asahi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
	linux-tegra@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	linux-amlogic@lists.infradead.org,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Neal Gompa <neal@gompa.dev>, Suman Anna <s-anna@ti.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Sven Peter <sven@svenpeter.dev>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>, Janne Grunau <j@jannau.net>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hector Martin <marcan@marcan.st>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 5/5] dt-bindings: mailbox: Drop consumers example DTS
Message-ID: <175087689465.2000134.18175207388418623670.robh@kernel.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-5-724407563997@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-5-724407563997@linaro.org>


On Tue, 03 Jun 2025 13:57:12 +0200, Krzysztof Kozlowski wrote:
> Providers DTS examples should not contain consumer nodes, because they
> are completely redundant, obvious (defined in common schema) and add
> unnecessary bloat.  Drop consumer examples and unneeded node labels.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml       |  6 +-----
>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml     |  9 +--------
>  Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml | 10 +++-------
>  3 files changed, 5 insertions(+), 20 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


