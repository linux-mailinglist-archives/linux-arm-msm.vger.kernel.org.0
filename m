Return-Path: <linux-arm-msm+bounces-76737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95870BCAC87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 22:19:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 556B1481EB9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 20:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461D626E6F4;
	Thu,  9 Oct 2025 20:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/F6qN7g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBD826CE39;
	Thu,  9 Oct 2025 20:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760041181; cv=none; b=iiSgtJTM2egHGfmdE/SOlgspMhhKlpKZI/Moj+MpRvPjw5Z2B6YF6G8DQcb6e238fdO42WqPnfVXdZMC12BeauzBACEu+Vfnq5Z6BWiWXPHHeY92fhu8wGFaED2sRuCfN1SGjGu50e69TJRlprv6M4IYI989BaSt5lKnkTGlwjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760041181; c=relaxed/simple;
	bh=Walqh5a8kXanT1LhuuUh7J1+eh9oalVte1fOpfe1J5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMr9oE0x+J7SlfyY2VygEo1n1PY77Kry6ZB3sz/pK3YYMX4nN9KLgkcBbMeFPq7Z4f5AS2UCKdcVA1XGBr1jyk9OCE/iOmD1ZObRTQZSMmvoFZJ8CLmJ+IWyyZ2I6pjq0xxrg11Gu48YiWmakyc1bvfIoKnp9fg0msi7Fai5ZWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/F6qN7g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFA0C4CEE7;
	Thu,  9 Oct 2025 20:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760041180;
	bh=Walqh5a8kXanT1LhuuUh7J1+eh9oalVte1fOpfe1J5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/F6qN7g58WK+WrVTXd2fgPq8Iaj0rj6WipTL30vjmo6h3MgqoiLwCLPCTBeHGnU4
	 fYd54h3WUmdRpikfX3gNK5vNrFdqb9Vw3bSQ3dhQoXyg2wQP8lOHgPfLQRE4u2hf9O
	 X0+gPuxe8jwwWbzKb8lSxBAhur4H/2YX8lEsQx6s+RHuDhgB7WEIDjnqwOyhltrhHb
	 VNuxCTgh8MaxzgvLFhYoaOjbndFaR4jxN20HLgLrrdmapR81SVgxhvVI27CwYDbuM/
	 YUhDsLhJhxu9dAg/z81L40e6PFkzB0PsOV6qaZQb0i0UFg8oRn0MKP8CyzJ3BWZE5y
	 mY1UdRw34JQHw==
Date: Thu, 9 Oct 2025 15:19:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Revert "dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp:
 Reference usb-switch.yaml to allow mode-switch"
Message-ID: <176004117839.3288724.61530273334679572.robh@kernel.org>
References: <20251006-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v2-1-3249e511013b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v2-1-3249e511013b@linaro.org>


On Mon, 06 Oct 2025 10:49:04 +0200, Neil Armstrong wrote:
> This reverts commit 3bad7fe22796a420c6e16b591c37ed1bd6cc2a30.
> 
> Referencing the usb-switch.yaml also imports the ports definition which
> collides with the definition in the qcom,sc8280xp-qmp-usb43dp bindings
> and also enforces ports as required which breaks DT bidnings check on
> a lot of boards DT.
> 
> Until the granularity of the usb-switch.yaml bindings allows us to
> only reference the mode-switch & orientation-switch, it's simpler to
> revert the change and start again.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Instead of splitting or loosely referencing usb-switch, just revert and start again
> - Link to v1: https://lore.kernel.org/r/20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml     | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


