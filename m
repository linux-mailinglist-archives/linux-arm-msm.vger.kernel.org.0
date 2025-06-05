Return-Path: <linux-arm-msm+bounces-60298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BF1ACED78
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 12:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C4323AB232
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 10:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54379215198;
	Thu,  5 Jun 2025 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MA92+zVI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F54215175;
	Thu,  5 Jun 2025 10:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749118929; cv=none; b=CL9CbMLpSD1Y6CXbOAl+rXsi8Hjsoinee8IibRPD6ecCnBz6JRAfw/O3Q1R9+p2FZsCSK/UZPxuFzH/t+oa9Q6uauTyGdq94o0jq9q3cHKcxNe4sy5s4qJDKN9qC5Sk61h+K1PVCkcJ+UhbukUJh6iKGD5Q4O0Y419gMTHqKHvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749118929; c=relaxed/simple;
	bh=IAbfwq9S40+fyLHx6nXIBRtY/yzVmF8ctVF1noJJbiE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=c8HdzkPU/Ljm5AhrjnGZKGeZQJ0zrSwRSg+557P7YtY8UsE1FqUBhGv6veepAQvXSsLtc1oaxnWDdA/mAGovYH2sW3r19zjk2CFZ3RpIWG6wfpvy8aYsILUiGfBIooQ0oLzmWcBgDgnivZXf/A8Pnt40bTa5YUu0LPYQYXLb0rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MA92+zVI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27ABEC4CEE7;
	Thu,  5 Jun 2025 10:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749118928;
	bh=IAbfwq9S40+fyLHx6nXIBRtY/yzVmF8ctVF1noJJbiE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=MA92+zVI9dwJ3AzdEL1EHzB9zvYjgjH8GzTT6tqxSfJnIIdFaO1gaLZqxiSzNTcCO
	 KbeBlu7pGa8o9LnEau/fx2LQTk2CKmiYl5PeuG8Mv2hxc1iMle8Uxi+mKd5rnkLMEI
	 jWBBze06vwaM8u/PBOtWpxzsr5uWsvRthCXjehmu5gdCmR3DQmDOcg7OuvXBHf6+jE
	 NxISM3tt7fbRpryygPNKlLhwz25pNNvlyASKczbagtbDw7OiyCgRWvgbJxmvUbPvbF
	 /s++HRS3rw8YaVdONhfFNI0CN9OY5gvMcSpakmHwBoXta3fNf9Szp4ZRFGScEh3Opa
	 HFYZsTkuULv8w==
Message-ID: <1affbb8a-2f6f-4dc5-ace1-4058721f0947@kernel.org>
Date: Thu, 5 Jun 2025 12:22:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sven Peter <sven@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: mailbox: Correct example indentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>
Content-Language: en-US
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.06.25 13:57, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces, so
> correct a mixture of different styles to keep consistent 4-spaces.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Sven Peter <sven@kernel.org> # for apple,mailbox.yaml



