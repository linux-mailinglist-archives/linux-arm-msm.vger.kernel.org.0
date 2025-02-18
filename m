Return-Path: <linux-arm-msm+bounces-48322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA291A393E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 08:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B180F188CE42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 07:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAFB1BA89C;
	Tue, 18 Feb 2025 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYOZOsxH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0710C1ADC81;
	Tue, 18 Feb 2025 07:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739864498; cv=none; b=SDrsL2RjItruVji+pzuVHdPs5Qb/yng7BfKw+RjFoM6jVaiBTPM6RwIofHDDR24kZ0p6ojZUULKko6DerkcA34HpREyuu0rjfUBXYdPQpvUodFuB+m5Kcztno8QMMXSkaCEUoGVPIjO6snCogIUpk0ri/D1zQEB/ZnaA2UarsQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739864498; c=relaxed/simple;
	bh=xXPX5c5YeoOms6ZAlpLWFIk9apQH4PlaNegNhRhakhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWs7JGFxambpmSu8zJ/0xrXkh6WU9VuMcFuGSxi8KiDl4dUweQeOmj6sOQl0+/Ac2gfJehBEkWr0Jy1fPN5l4AjjkyjOmMCnkuZsmuwEwu3FbMjSmxTuoIzHe+42zlbInX0KKZ/lh9J7p9rcpIjfi6NqtsQnPUWfZb7gNrPglcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYOZOsxH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3D4C4CEE2;
	Tue, 18 Feb 2025 07:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739864497;
	bh=xXPX5c5YeoOms6ZAlpLWFIk9apQH4PlaNegNhRhakhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYOZOsxHvbMaQPHBzFgDJKqngokcVgLWTJUJw4eDD26XZh2fo0+YUHKlgrlv89B/T
	 H2L4VrDZoZc52Gj0BJaibsb2qVoFvhzOFeOE6HP81fxgN8mNmRjH5B8ZWbHA5BVkpa
	 Ory0w9U1Fp1tFNVxLhHXe5nyu1Bzj6NCYqZ/nzvpT+GsuGoEsLipei1KaOm7gSMacj
	 GJV4vgrRS1uyez9LU96vQCzyy0YsZnXb29F+eA1ahrs1Sxmq3CQej8UfMQF4L0O5r3
	 JhvvUUxim/BaHZbA7P4dIEzYLLoQcxV35oDEuxszOc5h45m841UIj25REcmbVJgXcf
	 DfeBlgMb5OqJA==
Date: Tue, 18 Feb 2025 08:41:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Wronek <david@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Lenovo Xiaoxin Pad Pro
 2021
Message-ID: <20250218-nifty-tall-marmot-5caadf@krzk-bin>
References: <20250217-lenovo-j716f-v1-0-b749cf4f6cd7@mainlining.org>
 <20250217-lenovo-j716f-v1-1-b749cf4f6cd7@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250217-lenovo-j716f-v1-1-b749cf4f6cd7@mainlining.org>

On Mon, Feb 17, 2025 at 12:32:54PM +0100, David Wronek wrote:
> Document the Lenovo Xiaoxin Pad Pro 2021 Android tablet based on the
> Qualcomm Snapdragon 870 (SM8250-AC) SoC.
> 
> Signed-off-by: David Wronek <david@mainlining.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


