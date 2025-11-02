Return-Path: <linux-arm-msm+bounces-80026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E1EC292B0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 02 Nov 2025 17:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C88334E87A6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Nov 2025 16:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D990D246333;
	Sun,  2 Nov 2025 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lfEPQ90A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF3E22B584;
	Sun,  2 Nov 2025 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762101693; cv=none; b=nM+9+GlglhQinAZnjzCiIGf0MiD7MF9xl3ig+sUZ7ZdD4idjRJ2egrhfODwdldAri6CvcS7Qwz8nzS2YeFmMuH+IKhPVny8eQlaW2BHNYccAQzcs8PlAcHmu29el0V7/RIm87ie+7uFAfPM9ogf830h9QkuDzhLpyvoO/hRHs14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762101693; c=relaxed/simple;
	bh=Qw2o7qqiBovxxDEWs9ElY7NcJNTGLYN9uvGaOrZH0y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSTpygJSkDAXTNF82GBlvf4k8qTJTWMpv+oqPgvI233tBB/RwoEqDMiwvZr04ghPl7/8MObQY3+Lo7dpoVySFkb1rlWN1Sk7lRVGfHLeKWfXDQOSbBcK/pXgHwDk7NMxGtZzB5FOax/hl8PFQGpvduICmIgEgznEC+5wq1l0ba0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lfEPQ90A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6791C4CEF7;
	Sun,  2 Nov 2025 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762101693;
	bh=Qw2o7qqiBovxxDEWs9ElY7NcJNTGLYN9uvGaOrZH0y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lfEPQ90ANx5Z7evVCdIJUbBJ3FyL3MeBlDDuDClUr/MrUuBOVFWV1i8jjqkmP2adp
	 C3t1mFYv8Ox5HNeepAngVWQzEn3CQNRyeGCWsp3LC2Y5INFnB4XYycW2jaAaSiNwnr
	 MLPZAvWECTT4GUdJEhmXRh92ZByJe9Wweuv8EACKwBcivfkBxc91/9gXR/Oaiyn94q
	 IcKQEbmp1AFknATj50ZKSA+JYM3nT+Bw7E3FBNbI+u3tgOtgnfqOLcwXx8oI88jyeP
	 V7CUMNy1fKt09Pwrlx8ETWCVdIgZzenm9BhNZPchjHbVgGUToVdhZdlAvHVkv+dvVi
	 1DstzWu0hZSNg==
Date: Sun, 2 Nov 2025 17:41:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maud Spierings <maud_spierings@hotmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: display: bridge: simple: document the
 Parade PS185HDM DP-to-HDMI bridge
Message-ID: <20251102-shaggy-famous-loon-0c4913@kuoka>
References: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
 <20251101-asus_usbc_dp-v1-1-9fd4eb9935e8@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251101-asus_usbc_dp-v1-1-9fd4eb9935e8@hotmail.com>

On Sat, Nov 01, 2025 at 01:54:12PM +0100, Maud Spierings wrote:
> The Parade PS185HDM is a transparent Displayport to HDMI bridge.
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


