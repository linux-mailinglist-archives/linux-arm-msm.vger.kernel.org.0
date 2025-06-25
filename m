Return-Path: <linux-arm-msm+bounces-62506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4006AE8CCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 20:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D47E5A5AAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 18:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F21E2DFA3B;
	Wed, 25 Jun 2025 18:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efojQDRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580331C8621;
	Wed, 25 Jun 2025 18:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750876845; cv=none; b=HDUz3qBIrQNqMWVtouME9nMjWgUJKaP4K1+FapmtT8kCIM5o29PYZgYw9F3H/4oOGxS/ahTOfkZauKIgjJsNY1aSl49QgjJ0QTOBowkNm6DR2ElnzQ5fqW+NhbTUzTTTi0Lhg/GkS3KAYitsbH2kFBr+/oRS19XAWfITpTSRc8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750876845; c=relaxed/simple;
	bh=G0ZtbjjaXpwn9zFSPBNkvbd+Aj3mZgZ0xv6kXXcjdt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gS2AeP5IaB6tlmKIW02h7xJos9LOvXgYksTrqvJs2ec2qbgG4lhCXZ8V4u9Z6+i63s9z63hhWwYA7rsR/o9JOvnQs5ofUt3Taxa2ZkPzG+Cm44Ty2lnWBs8Y3QbnWpK9O7avkjsRNWAHgyLgUDLaw3PObOZLuEg0Rm8dpLus33w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efojQDRO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31C9C4CEEE;
	Wed, 25 Jun 2025 18:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876844;
	bh=G0ZtbjjaXpwn9zFSPBNkvbd+Aj3mZgZ0xv6kXXcjdt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=efojQDROTflqmTIAaXAItvhNnGdXHxQjO1uoj/C/j9dOY/+gAiwrk8mrGCTIQEZP7
	 nAScazUl5mDMqI+uRPvxQCsCPKvPdt7zjYdped3HC+re8L3VUNVEBffO2mf6BUHFwk
	 afr73TA+vf0s2FEYzn+qNfpU+3cQCDM9780QLVQvdxFMeLQa/YaRdDJyQ0G7exrp5E
	 aon2jMH2FgNTS9J7AoTcyA2r+W1AtLL4bfug4EOEWq+UmhXhQqWrbHVnmdWsRNEJkV
	 tsZJ5Nir+nfrwc1OioIEkj/V8wg3912PIHzZQR9M7Up/HCsneFfuEfQIrJCmJHJCu3
	 pKmUQtx+Afgjw==
Date: Wed, 25 Jun 2025 13:40:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
	linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
	asahi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org, Suman Anna <s-anna@ti.com>,
	Janne Grunau <j@jannau.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>, Nishanth Menon <nm@ti.com>,
	linux-arm-kernel@lists.infradead.org, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH 2/5] dt-bindings: mailbox: ti,secure-proxy: Add missing
 reg maxItems
Message-ID: <175087684357.1998777.17182209219488528393.robh@kernel.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-2-724407563997@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-2-724407563997@linaro.org>


On Tue, 03 Jun 2025 13:57:09 +0200, Krzysztof Kozlowski wrote:
> Lists should have fixed constraint, so add missing maxItems to the "reg"
> property.  Since minItems=maxItems, the minItems is implied by dtschema
> so can be dropped.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


