Return-Path: <linux-arm-msm+bounces-25524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA4592AAD6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 23:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BB871C216C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 21:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC5024503B;
	Mon,  8 Jul 2024 21:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RTy6zSuu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72415748A;
	Mon,  8 Jul 2024 21:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720472446; cv=none; b=uXU1Kw9mnKUiiFS9d5ak4vmO2gtRCR8NJZ0PQnPh3o+HAweY/HHAvNTmCvdFRON7gsN5T7Ib6oAjt8huKLArkc5sdLRjHzmqV148twgF3TgVqm6xbNNwQlY6bL4iUpGBUVn6CR5+jYPPSlvgt7QU65Xfn64tHiN9W5D5f58TC58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720472446; c=relaxed/simple;
	bh=42gS1nMI85V4oiOAsvAixKC1DvPcw6XJmD6MkJh3tm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VggHdsZLvahGXoGv7VVnmkVjDftrkoIFOaFGkXG6gO6P+OeRDzXXKfgNtNWUNrMPR+Jcbzg3EOGlG7riv8jx11Tav4G616hkloZWuubTX97dc0eWRyW8f+QtKCBav1tIDruGYMZXrkHp89F8GRag6J5pNCt5U0cwjx37HW0mRe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RTy6zSuu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E7EBC4AF0E;
	Mon,  8 Jul 2024 21:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720472445;
	bh=42gS1nMI85V4oiOAsvAixKC1DvPcw6XJmD6MkJh3tm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RTy6zSuuhRm55fKoP9JOgDqIYkJwgTtLlGmYYvmT/GeUKEBd5BGwuNO7FeZQP8tOy
	 KVge5s7kJ/sBB2C+/8roi4w2jYIVofT3anDc8fZORhsNou4Sy3jPiKvhmDGT5I6nMy
	 k7o4NYRr2eJo2sXIG50JPomyCPU+vvkG92cRYnAnm5l2g+6bgUO7vDiTgua/7tkequ
	 k4LrMoEmhoSV8qTbXsojRm4jZ+A086tlGmAzczRX5E9qwlr3SfVxb6iaVbBHcQ3sjH
	 sj12bEBssKy4v2Z9A+Pic5PfDFSkiCcgxXa5l/xJfXbIkqkH+c+KL8ktzpv2ReM0Ad
	 Mo7NDsKlBwtMw==
Date: Mon, 8 Jul 2024 15:00:44 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v7] dt-bindings: iommu: Convert msm,iommu-v0 to yaml
Message-ID: <172047244295.3895229.16417666171365762021.robh@kernel.org>
References: <20240705221520.109540-1-david@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705221520.109540-1-david@ixit.cz>


On Fri, 05 Jul 2024 15:14:54 -0700, David Heidelberg wrote:
> Convert Qualcomm IOMMU v0 implementation to yaml format.
> 
> iommus part being ommited for the other bindings, as mdp4 one.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> v7:
>  - change maintainer to myself
>  - define NCB range (thx @Rob)
> v6:
>  - clean iommu-cells description (thx @Robin)
> v5:
>  - updated example (thx @Konrad)
>  - ordering of requirements + dropped > and | and reformatted (thx @Konrad)
> v4:
>  - renamed to qcom,apq8064-iommu as Rob requested
>  - changed title to Qualcomm APQ8064 IOMMU
>  - dropped quotes around URLs
>  - dropped mdp node
>  - dropped unused mdp_port0 label
> 
> v3:
>  - I kept the name as -v0, since we have other binding -v1 and it look
>    good, I can change thou in v4 if requested.
>  - dropped non-existent smmu_clk part (and adjusted example, which was
>    using it)
>  - dropped iommu description
>  - moved iommu-cells description to the property #iommu-cells
> 
> v2:
>  - fix wrong path in binding $id
>  - comment qcom,mdp4 node example (we don't want to validate it yet)
> Signed-off-by: David Heidelberg <david@ixit.cz>
> 
>  .../bindings/iommu/msm,iommu-v0.txt           | 64 ---------------
>  .../bindings/iommu/qcom,apq8064-iommu.yaml    | 78 +++++++++++++++++++
>  2 files changed, 78 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/iommu/msm,iommu-v0.txt
>  create mode 100644 Documentation/devicetree/bindings/iommu/qcom,apq8064-iommu.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


