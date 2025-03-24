Return-Path: <linux-arm-msm+bounces-52404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E41A6E454
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 21:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05C8C18857F5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 20:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07071C7015;
	Mon, 24 Mar 2025 20:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnNSYE68"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF4117E0;
	Mon, 24 Mar 2025 20:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742848096; cv=none; b=ejNthFNppqriivnHlmPWf4rFnEnRCZEnpENrgYNkJnddedSBMBDDWjS8WeiJQ5jHgopt58rV6/oHfuPgdfx6Jk3kI59xGCa/OT6mGcM1n5VqEGShfm0Qi3eq4mVklyMzGjnow5OYE+nXmjPx265Fqushk27nUN2UzA1yVzNOi8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742848096; c=relaxed/simple;
	bh=nraEfwXGNNYxOKREgx+klOuG419qOT50aasEjbGDBd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTUlQ4U6u9CQ9/yNqaHFbFpO6b8kQ64gTVzLzZtuBogHYcwjQHXsS83WG0iKul+TPNqgFK2wqGI+yyDqKZoQANoefUgmxGQN7eWiBLoAI5Gg1x8i0k/OcQMDv5g9Udnfu4EW1sALNuuFGbBTUbIyES9GJ6fEMRo15Jd/K0Plc8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnNSYE68; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56685C4CEDD;
	Mon, 24 Mar 2025 20:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742848096;
	bh=nraEfwXGNNYxOKREgx+klOuG419qOT50aasEjbGDBd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OnNSYE68hBSBzyeGtTO8nd4tOOxSR0aog7akGaYiLwkG8num2NSKLgjJWh8uC3WuK
	 U06pjVmuTdST0N48/cGtLz1X/xbKBvuVyo38G1KyRqk5JRDML7T2ur0OiskHh+GacP
	 G7B/QgXENoJQLeeGgj3s9fP9hpjQxsPg5EAfU+QmH/ORmrU8nUC9sLfESe3SAjib5g
	 Z5ygHc7Z6x2ayebeHLhKEgKL+fioKExC6D233ds831t23wzaGpVtdNUtbH/M6eNGmt
	 LYI/cznIe/PeS+qM2oKj5D2MgTJ/BaX50rAh9BVbl6ZwXxuPu6LozGomPx5qwW6rwl
	 MRcHsdtysEnRg==
Date: Mon, 24 Mar 2025 15:28:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	David Heidelberg <david@ixit.cz>,
	Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev,
	Samuel Holland <samuel@sholland.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iommu: Correct indentation and style in DTS
 example
Message-ID: <174284809477.815772.5676101186306641286.robh@kernel.org>
References: <20250324125250.82137-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324125250.82137-1-krzysztof.kozlowski@linaro.org>


On Mon, 24 Mar 2025 13:52:50 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
> unused labels.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../iommu/allwinner,sun50i-h6-iommu.yaml      |  24 ++--
>  .../bindings/iommu/arm,smmu-v3.yaml           |  20 ++--
>  .../devicetree/bindings/iommu/arm,smmu.yaml   | 104 +++++++++---------
>  .../bindings/iommu/mediatek,iommu.yaml        |  18 +--
>  .../bindings/iommu/qcom,apq8064-iommu.yaml    |  20 ++--
>  5 files changed, 92 insertions(+), 94 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


