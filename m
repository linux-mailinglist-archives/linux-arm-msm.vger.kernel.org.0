Return-Path: <linux-arm-msm+bounces-62706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4297AEAAFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 01:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 942F37B4B3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 23:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA329226D18;
	Thu, 26 Jun 2025 23:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DwXT7Fbk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFB81F8724;
	Thu, 26 Jun 2025 23:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750982121; cv=none; b=W65/rZDleVuHjHc2lBaYtLo1oaH4kQNgifhmJSgk3NJltKs6eiKUqzAR5TkPKu3l79v3b3t8OoGnYe59XH8yadv36qlGhRSsF82fRBSAyPfrRuIPLBN8zCQBlxB9VTzTPM86LlyAoHHVg8s5eY9+pYhVD7PU311emctPOtp9Jn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750982121; c=relaxed/simple;
	bh=IQ4gPjgm+BlfQlfBkH4V119fWEcuJOoQY3dYUFLsEvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKCC+O3XCVkqbzx6WHYwQubbbT6E3oTsZQRC0vQzdyRc3/bCsqdysMsWrGX5dtg6fIL83NQt1h1U4Iqi01Tuwk1fEP6zuN5miqNpEnkH2P6FuvyYKGEfWGJDw6SMKdq5n9+w6/dY/9WmIVHz7ndCZMyV1qrQdCzjVS2D+vWMCeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DwXT7Fbk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F369BC4CEEB;
	Thu, 26 Jun 2025 23:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750982118;
	bh=IQ4gPjgm+BlfQlfBkH4V119fWEcuJOoQY3dYUFLsEvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DwXT7FbkOMuUr58MgAdbvcMAXsnJVO8rVetWPfdmnSIuwRVonJWbZzTHrl5oEJZF1
	 NetH/ep/H0hyjgc4L/aAri/y2RO3eW1+cv0ys8teVRlvFhD1gwH/BXpcTv1thrQzjR
	 Z887RJFvWtpARAKfjFesq+nB+wL9l1AOXN61kjjbC37FX3XAutNAmVvbac1/lyzmuW
	 ErCI+S45xw6j52JPppF+q4x5lh4qzTQ3zPAG6UyZolXzDD7im4OSld++Xgst2jmFk6
	 Vcc7bSSt5lWFTFL+K+OdMgcnTkXIXBCg1Vh+Qjksvj4o57l0wVxOmrhE/TKb1Pc2bx
	 3Ch7dS8KHUq8Q==
Date: Thu, 26 Jun 2025 18:55:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: qcom,snps-eusb2-repeater:
 Remove default tuning values
Message-ID: <175098211658.1434134.8830216383938971952.robh@kernel.org>
References: <20250617-eusb2-repeater-tuning-v2-0-ed6c484f18ee@fairphone.com>
 <20250617-eusb2-repeater-tuning-v2-1-ed6c484f18ee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617-eusb2-repeater-tuning-v2-1-ed6c484f18ee@fairphone.com>


On Tue, 17 Jun 2025 10:26:35 +0200, Luca Weiss wrote:
> The reset default tuning value depends on the PMIC, so remove them from
> the doc since they're not accurate for all PMICs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 3 ---
>  1 file changed, 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


