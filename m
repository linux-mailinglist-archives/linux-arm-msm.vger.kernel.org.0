Return-Path: <linux-arm-msm+bounces-76738-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B267BCAC9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 22:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 420CE19E57DA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Oct 2025 20:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 438C326E6F4;
	Thu,  9 Oct 2025 20:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eX6SLVRq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181FC212549;
	Thu,  9 Oct 2025 20:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760041255; cv=none; b=N1PZW++uTopc3RlpsC7O9nJd86iXIXFaOSzpZsBftGFEm46IUr875dUeROsD7f7p8x+uQxcJFna9XvkNOM0yg1gIpg3mnf3ySsjX7YaYDf8QbakvXbISsopa4vxwNw2Woyhz929fZ6UIzfnCSdLfQIaOVdZ5rw9d/nQleU+2Pj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760041255; c=relaxed/simple;
	bh=oA2uaCZRnNGs1M5Uw0XEpZ5pPtd9ck21xoINfY+pXQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKPHsP3tSZG0osOuU/kIhHJCVyC5xAdAAQ1/WhH3H7ZGpkLvumpFF8PrUtWx7I18fD+87I06RNSjyQ42wbzBbRsK4G7hsYO/7ZxPPei0ANtBjulrIziEH/T6kgC9b78sG1yIT+HZoB3EyIIGtP0ARFckfOjj82Biz1JR4IfLer8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eX6SLVRq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E163C4CEE7;
	Thu,  9 Oct 2025 20:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760041254;
	bh=oA2uaCZRnNGs1M5Uw0XEpZ5pPtd9ck21xoINfY+pXQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eX6SLVRqrZ3oxHM/cbevFHH5RfW2ewBDheS3mCX1fM+xaCN/e7Z7vvWSb5Gu3Qtun
	 2K9TflgQzlrE+i38oZ8sR1hw0pIeBSH6Liq64Q8qPlAtIcqyx39YT3oVkwHjEgWi1R
	 0dsQ2EhDurCJolfI0jVOZXkaGViTDMK53rdc5/TdFIDEqMeQoQa6oxnc4VCZJ0S635
	 dXJucQ+eo6hKkfQh6YVBQUMSCesCnj6X+dOnI9VN5W00R8XvgWKlF7HZMoUAR97IG+
	 Vq24cBlt6anuhdLLt4V869XCLoWvEhL772J8AbUjinWmQWzjcQGciA1Cjd9tmlkADe
	 yYeJYb7mO00pg==
Date: Thu, 9 Oct 2025 15:20:53 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Add
 mode-switch
Message-ID: <20251009202053.GA3288920-robh@kernel.org>
References: <20251006-topic-sm8x50-qmp-combo-allow-mode-switch-v1-1-3d79e7ea6824@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006-topic-sm8x50-qmp-combo-allow-mode-switch-v1-1-3d79e7ea6824@linaro.org>

On Mon, Oct 06, 2025 at 03:51:53PM +0200, Neil Armstrong wrote:
> The QMP USB3/DP Combo PHY can work in 3 modes:
> - DisplayPort Only
> - USB3 Only
> - USB3 + DisplayPort Combo mode
> 
> In order to switch between those modes, the PHY needs to receive
> Type-C events, allow marking to the phy with the mode-switch
> property in order to allow the PHY to receive Type-C events.
> 
> Referencing usb-switch.yaml lookkied like as a simpler way to allow
> the mode-switch property instead of duplicating the property
> definition but it causes some issues with the ports definitions.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Depends on:
> [1] https://lore.kernel.org/all/20251006-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v2-1-3249e511013b@linaro.org/

That's a series then...

