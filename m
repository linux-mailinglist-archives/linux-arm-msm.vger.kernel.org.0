Return-Path: <linux-arm-msm+bounces-62505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9722BAE8CC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 20:43:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E94075A25BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 18:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 704C52D9EDA;
	Wed, 25 Jun 2025 18:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLH/g5IY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386B62820CB;
	Wed, 25 Jun 2025 18:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750876835; cv=none; b=S8sH0CXcywW9LpzjNbdtfsoWrv4rWes+IIf9LhokT8H0gMNg4rVrctnI5+x+SptKR20L8Q5P4aOMe3IvmAep+qyF0CamuNf/nZvb8KnxFCkdjzGMaQ5w3zTCN+YsoFqhn+MlRcuqIICvF6PRxn7fZjUAq6MA0MSvGw9W1e1pEuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750876835; c=relaxed/simple;
	bh=q/8or6cq8OGa8xNABTFOKqL3F2hse9FddmDtZIeWGZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovoXQ9LErAAUIsdwftQh549HiprQoYVo8b0Mud6hYPjGi7IjaLC+C6KIkyCwyuGv1FDVI73MkrfGeEZO/SVS8p9rcOFyBb4TKE7pkNxQMUaMpLpPhdkY2rD4XduO9Q9zCj4dQiQymvmg9nd48oavH0MwOn2Zww4L2ySeUtq+oTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLH/g5IY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E206C4CEEA;
	Wed, 25 Jun 2025 18:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876834;
	bh=q/8or6cq8OGa8xNABTFOKqL3F2hse9FddmDtZIeWGZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLH/g5IYQCHlVK3DIrWDwra/rt2rYAY1XwbXQdPNk68KzQgeHdrGH5VSQRVsGoTFp
	 Kn2chB4zeZ/O98kh3MtkzcUhtybnpKKwxom1iz6XNpN06zJ/GDi7/cYxugypSyFcAY
	 M6zpqQrDyrhaWKlvaIvJzLeHdYnMAreyUumQ/EMPyPUfrFU6JmkdzebSzcOh0q1mos
	 5aF9DJfJClk/HuMMrr/WASrZiAtjWo4HuwP0NiVn6hQLWHY7bMETe7y9du7BhLITpv
	 difTA58iFtjsmNeP8t/obDl0qLs2ecRO67a+yU5vJHXXl3gJbruk7xFtvvVXJephrW
	 qHED+15vVzC0g==
Date: Wed, 25 Jun 2025 13:40:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sunxi@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-tegra@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Neal Gompa <neal@gompa.dev>, Kevin Hilman <khilman@baylibre.com>,
	asahi@lists.linux.dev, Nishanth Menon <nm@ti.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, Janne Grunau <j@jannau.net>,
	Jassi Brar <jassisinghbrar@gmail.com>, devicetree@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Suman Anna <s-anna@ti.com>, Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/5] dt-bindings: mailbox: amlogic,meson-gxbb-mhu: Add
 missing interrupts maxItems
Message-ID: <175087683295.1998442.14302996914739580882.robh@kernel.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-1-724407563997@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-1-724407563997@linaro.org>


On Tue, 03 Jun 2025 13:57:08 +0200, Krzysztof Kozlowski wrote:
> Lists should have fixed constraint, so add missing maxItems to the
> "interrupts" property.  Since minItems=maxItems, the minItems is implied
> by dtschema so can be dropped.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


