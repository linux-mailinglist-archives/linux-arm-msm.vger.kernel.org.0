Return-Path: <linux-arm-msm+bounces-76111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DC9BBF99C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 23:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B893C3C0ACB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 21:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635417262E;
	Mon,  6 Oct 2025 21:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pSkAmXjX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3076D8F4A;
	Mon,  6 Oct 2025 21:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759787312; cv=none; b=syJcOJ9/QLGQxR1SLZY4J/CWgHp6qspTK2AZntkIVLmOa8BLc01bzYYmCLz3ejxf8AeQ/YKnc+wBACRcPGkw/ymp4kDv7WnIQkKTkxgQUjeJ5h58uOnsjPSxCZa/hVXdNwqCG2iQL+IYdGmIqP86jKAcN5HDJV3nIgkBaLw/erU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759787312; c=relaxed/simple;
	bh=OpaSlgNgbG6LGQ9WKZLEg5SEp0sOr8exS4JYKgFQGjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRaC3qSBj5T+WeVN/SBG7DeTM3gV5ADhuA0Ofc+VRCgnZRu91tmPiV5Vl5XWQCUK2FOUC3gbcZh1pCfWA4QYFjM+qQIIu+ISrCUDwOOLlCgX2AdZ2UiWtxI2p1f9Itd2OeqxAUyJb8TksgBbv/jzc5v0RWfFvuzPEoeQ9um+NYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pSkAmXjX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757E2C4CEF5;
	Mon,  6 Oct 2025 21:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759787311;
	bh=OpaSlgNgbG6LGQ9WKZLEg5SEp0sOr8exS4JYKgFQGjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pSkAmXjXHg+U1pTbtnA1GTbUm+N8VigWWBlFWZC7/fkAo2wP2inbeV0Hnv6pNIKk9
	 DeEv7BqPEUkLPhVke5T2sokJ9BjI/SBbQFQmzAmuS0qUWnkp2NUVz8Z78Q1eJFIXWh
	 IVpxt6cVUz1rDA62F6x43EVhPsHrC8fy1iAd1Acszuj6oqLT6axu4Lf4HSovx5iB0d
	 F1IwMwYd31zCgBu5AJ+nQ+SgosfEXX6Nh/0dhcCpg183bun5a/Xg6NSzGS6RF1IBKA
	 IwyRX9j4JYS5bvmZOQTqs13CE8Sy5db2LOINSbFkzwEXDVR72zxe74evPUpXQ66iAM
	 BlVlJIgTtkixA==
Date: Mon, 6 Oct 2025 16:48:30 -0500
From: Rob Herring <robh@kernel.org>
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	quic_pragalla@quicinc.com, quic_sayalil@quicinc.com,
	quic_nitirawa@quicinc.com, quic_bhaskarv@quicinc.com,
	kernel@oss.qualcomm.com, Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: mmc: Add dll-hsr-list for HS400 and
 HS200 modes
Message-ID: <20251006214830.GB625548-robh@kernel.org>
References: <20250929113515.26752-1-quic_rampraka@quicinc.com>
 <20250929113515.26752-2-quic_rampraka@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929113515.26752-2-quic_rampraka@quicinc.com>

On Mon, Sep 29, 2025 at 05:05:12PM +0530, Ram Prakash Gupta wrote:
> From: Sachin Gupta <quic_sachgupt@quicinc.com>
> 
> Document the 'dll-hsr-list' property for MMC device tree bindings.
> The 'dll-hsr-list' property defines the DLL configurations for HS400
> and HS200 modes.
> 
> QC SoCs can have 0 to 4 SDHCI instances, and each one may need
> different tuning.
> 
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 22d1f50c3fd1..a60222473990 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -137,6 +137,11 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: platform specific settings for DLL_CONFIG reg.
>  
> +  qcom,dll-hsr-list:

'-list' doesn't add anything.

What is 'hsr'?

> +    maxItems: 10
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: platform specific settings for DLL registers.
> +
>    iommus:
>      minItems: 1
>      maxItems: 8
> -- 
> 2.34.1
> 

