Return-Path: <linux-arm-msm+bounces-38063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF639CF42B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 19:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 118FCB3B5DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 17:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5496C1E0DC3;
	Fri, 15 Nov 2024 17:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cR1Dn88R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288681D61A5;
	Fri, 15 Nov 2024 17:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731692151; cv=none; b=aJKuXFWY9OE0vFWrahW5wdHhB5SedVCcKMZeYD3VOhimBDGrzV1nXGd/RcUKbz65DE4uKHXQPrUw6IO/T0OPBA9xBPEvJykpy0QXOFz//eAPeas6wyP2scPHLGXTzrGKn1wIHRqVy8CH1Ol7uOAKtDdfu5ENSKDqFf0yIfgfEXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731692151; c=relaxed/simple;
	bh=yx4vhMcUNe93yjF2ss21xAank9OEsIHQiHy6fqgsXRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsbc6tzLDpDD0mOGJbeyPRjzObP9u5jES/dzFYAohrlTdC02cuAAYRIaA63Jbb7PUeZJEl4sUcQP9wsMRQjncR9jr6dm122IbrP7iwGB0BusGQat1vPj3zGnx01GbHWqXJVUW5HIbwQZwsBl+yOsbED447mZZVYeoOtGMiPTJHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cR1Dn88R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 835E7C4CECF;
	Fri, 15 Nov 2024 17:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731692150;
	bh=yx4vhMcUNe93yjF2ss21xAank9OEsIHQiHy6fqgsXRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cR1Dn88RWNDYDkl6d+5z29DU8mvMl35uW+V3wuxNj0rGedhcDQQId7M68pvuLhrDu
	 25BAgf/jjqTkdaNgarnRcTe+oi8GIlQwPiF5ZebYrUiFxvHHcOWSjXXh4szx49Wz3t
	 rbO6La3kumGhbCjTyKKSyXEfJvzHM+ZEsFAtymN4nL9jjyjHhHtzaloNtz4TwEMwBb
	 gBcuaFsnek7YigccnznIC81OKp6ztdH6cvcVy+cd6FVDVsN22CIYX5WzwQ0Zg67z0s
	 ZV2wH1jDWu3agp4QPVnwm5FFh3ksYbmAbeYrV2ZxfiqBVX8ouGZ1t1X4znV7z3Wij/
	 kSoWxOcrPVYzg==
Date: Fri, 15 Nov 2024 11:35:48 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iommu: arm,smmu: add sdm670 adreno
 iommu compatible
Message-ID: <173169214597.3440718.17290669612266836614.robh@kernel.org>
References: <20241114004713.42404-4-mailingradian@gmail.com>
 <20241114004713.42404-5-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114004713.42404-5-mailingradian@gmail.com>


On Wed, 13 Nov 2024 19:47:15 -0500, Richard Acayan wrote:
> SDM670 has a separate IOMMU for the GPU, like SDM845. Add the compatible
> for it.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


