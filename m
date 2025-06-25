Return-Path: <linux-arm-msm+bounces-62507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A8FAE8CDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 20:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2CA57B81D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 18:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390DA2E0B6D;
	Wed, 25 Jun 2025 18:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uqFVH/IF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB5B2E0B64;
	Wed, 25 Jun 2025 18:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750876864; cv=none; b=LXLe2I4S6ZN4iuoIxNYy6JdO+2MbdojtcfEo5XakxT/AwQM8wNxwTs0RT6P2qvTgn+VJX1o3qsW3lHf4Lk2W66DXdtjGa3am/TohTU5oZSGwf06ZhdYZGOzJl8D882/IwR48zEZv7AE73t12m7vevd6MqKlCgF/po/1nx8iqwbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750876864; c=relaxed/simple;
	bh=OnNE9mY+q1rPxEWew6abwgQMr1/ISDmBqUKGPWYE/Og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H3Y1J6a5wwOtfdIPHROYS9Y705uetucIqxEKj9KZiG06ZRMqluOiMddJPs2avBbeyh+7lSePioeYF31hE8jv+4F7BSyUIrGGF5qNTsIXY1MJLvDX8VI5bO9pTtH7wxHwc3ptezKaGvlZVUh9WbCQK6r+IEuzBhXqNY5AzCM2TLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uqFVH/IF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527B9C4CEEA;
	Wed, 25 Jun 2025 18:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876863;
	bh=OnNE9mY+q1rPxEWew6abwgQMr1/ISDmBqUKGPWYE/Og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uqFVH/IF47MkJv2QMT9nXskdrh6mA6XytghV1a9FkAyNEQXwRHNx48AfVfp8sxkTu
	 xcrrLIhBh1vAqcfVijfFwT45igCxcf8oSVWgveYJi2+MReQwtYoMLXjk6cosWrWBOe
	 NorsS7+RPXTKkXN0S8JuFPKnFVP9TzeJdlb/dHo/oC2CUCygyHg8HCf4B94fdWLa4J
	 pdgYH53ICBaXDPbEauVog3wOBVDPX9Klt0FXlCLWaeve3o4K2eeMbEyAAUNtqcz1yK
	 tKcWitq7Q4nWjgN5y/r+6R8Ly6DVuW3q9+IKMZ7Dd/TIcGawpgDFuT+MKytsUCRKbA
	 b6gJiqaj/4ihA==
Date: Wed, 25 Jun 2025 13:41:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neal Gompa <neal@gompa.dev>, linux-amlogic@lists.infradead.org,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Nishanth Menon <nm@ti.com>, linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>, Suman Anna <s-anna@ti.com>,
	Janne Grunau <j@jannau.net>, Jerome Brunet <jbrunet@baylibre.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Sven Peter <sven@svenpeter.dev>, Conor Dooley <conor+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>, linux-sunxi@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>, asahi@lists.linux.dev,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-arm-msm@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 3/5] dt-bindings: mailbox: Correct example indentation
Message-ID: <175087686216.1999261.11778803038524197779.robh@kernel.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>


On Tue, 03 Jun 2025 13:57:10 +0200, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces, so
> correct a mixture of different styles to keep consistent 4-spaces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml     | 14 +++++++-------
>  .../bindings/mailbox/amlogic,meson-gxbb-mhu.yaml         |  8 ++++----
>  .../devicetree/bindings/mailbox/apple,mailbox.yaml       | 16 ++++++++--------
>  .../devicetree/bindings/mailbox/ti,secure-proxy.yaml     | 16 ++++++++--------
>  4 files changed, 27 insertions(+), 27 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


