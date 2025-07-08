Return-Path: <linux-arm-msm+bounces-63984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD6AFC550
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3F8A1BC206F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE242BCF70;
	Tue,  8 Jul 2025 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3003mvu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4102BCF6F;
	Tue,  8 Jul 2025 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751962891; cv=none; b=Xqh26J9abkFPCN4rl/AGaw3Q4ZD47gv0huyXuX65xuRRt5phOj6OmJ2PqFL35KtlRBJt5C9Wh/4yPjUmuWtvmYYL2ZWKqEEqgcS2jMc6wqQFBvE/JetdR5ztl3GfyA32isLU8Iw6eywNcrmcnlDaK+1YdzsTpnpXiYpse73IRhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751962891; c=relaxed/simple;
	bh=8PN/PFOLCto+wJyr7ixRplnKv9QuyDqxu1RnCpRLIJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kl/7iI4uK9h4M+6KtRkfdjiDz6U5TiauwaDI46TOVA7m4s6+OracmRFPlqCiqnwBDWo0k3hGAp8wOf4EEph7apa5eZz6FshDICqBWvH2jYZEAwx3J4Gth3dqVoWvnq2BVmHoGUUh3BM9k+fIHU4XdeqvXpZ9b9x9vRXEeWoVK3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3003mvu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7E0C4CEED;
	Tue,  8 Jul 2025 08:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751962891;
	bh=8PN/PFOLCto+wJyr7ixRplnKv9QuyDqxu1RnCpRLIJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G3003mvuWma2TvBG0K8/VWpXIhlx4FnVnUWM1qerYmoXUDRdw2looXA7w1SbHFLZb
	 j2OBaUKu0jFDD55kYynYdqYiMZsdwbUMeuSPwMM9OgfXxOae/aBnpze2Y4KlV1qGg6
	 fPtHJnS9E9fZLpa2pHxTiN1D71kDfgs1vppAAdki9zQnJaHomqRa+xkPRqzrvLNEE/
	 oFGb3oenSFbptvYk6ppJnt8ZaYnC4tiGBbEl7s+916aXUMGQ+ZGogMp7o7zZV4TuTR
	 z3gI+gKpGPZ9VTPAuyEwjAcMmU64Tcczhu/WZQ+kZcN1j3w2dYVTQZ7m8T61jQVNEs
	 GgSrGsmj4nHjQ==
Date: Tue, 8 Jul 2025 10:21:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: phy: qcom,snps-eusb2-repeater: Add
 compatible for PMIV0104
Message-ID: <20250708-analytic-misty-chital-3ddf86@krzk-bin>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
 <20250625-sm7635-eusb-repeater-v1-3-19d85541eb4c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-3-19d85541eb4c@fairphone.com>

On Wed, Jun 25, 2025 at 11:14:58AM +0200, Luca Weiss wrote:
> Add a dt-bindings compatible string for the Qualcomm's PMIV0104 PMIC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


