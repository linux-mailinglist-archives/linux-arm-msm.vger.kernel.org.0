Return-Path: <linux-arm-msm+bounces-75745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EA3BB22D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 02:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 153131C1EB1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 00:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99636DF76;
	Thu,  2 Oct 2025 00:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOC2dxuk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622CA2BAF7;
	Thu,  2 Oct 2025 00:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759366517; cv=none; b=XcmxhuqToHHXy0bqVS0Nj8qFEuGSCZ2l73Oj7fpkOwpKLcWoIv+HGNp2Vpdk6qm74ytyf5mgJOIC8LDylwkHjyiWMyaHKqrSw90fpYB7adPT79VAdh8ML3Az8C1JWwIGxOKne96vboi8TCOIy12cWLUGexoxq2/U7Okm6q7jpxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759366517; c=relaxed/simple;
	bh=q9M3siSz/WFA6MZ4rZKnKAlQsMFUpEVWypzADKDqvD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QSM3BoGqRwe4GCLeH6FM/gRgjwvxyNatbd3ZR1olk7mV1uK/EQJuVLzOEbmLvnCGooviaTrauAahOIw2Ogt5I4DaFBBC8pm7O3QlH/5c848vVCyRLrGde8Ho/GpXsC2sGJ6aSFXuFd5aUgOr+CHvu0jnaYefhk+9QYFkWZHdWlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOC2dxuk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF61BC4CEF1;
	Thu,  2 Oct 2025 00:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759366517;
	bh=q9M3siSz/WFA6MZ4rZKnKAlQsMFUpEVWypzADKDqvD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOC2dxukQNc1nuOcMw3f8L2NdCOiTXiAD/eQg31sseG/w/Ce82NpSl0Sfs0kTBq7U
	 ATnGDGK669HQCbMBULaqd7XNuQAnJTmOs323mvsIPW/dIT8lgFSD/jOOUdIqdKY7DJ
	 4z1T2ed4INGa7gc7KjUA1SzcMChCLkOTY6Stbz9vGXsJi5jnfZlZ3McN4FiSSpVX01
	 Fo5lpk6z3UQPNIfRbWV0ZQHfb5KAFfK0LFjYtoHjWLBzsjdKXfG+0K0okcBy8L/8AU
	 onUzqEFihwz0ioDZvl3zUhyXfYHPc2KzxWtEVnLF+VZPgfH3Qw2OYjKIyCRt31IcXh
	 kCbbWNJJQxB3Q==
Date: Wed, 1 Oct 2025 19:55:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: konradybcio@kernel.org, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org, mani@kernel.org, krzk+dt@kernel.org,
	linux-remoteproc@vger.kernel.org, andersson@kernel.org,
	linux-arm-msm@vger.kernel.org, jassisinghbrar@gmail.com,
	devicetree@vger.kernel.org, mathieu.poirier@linaro.org
Subject: Re: [PATCH 5/5] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 Glymur CDSP
Message-ID: <175936651505.2801389.13767475690907098428.robh@kernel.org>
References: <20250924183726.509202-1-sibi.sankar@oss.qualcomm.com>
 <20250924183726.509202-6-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924183726.509202-6-sibi.sankar@oss.qualcomm.com>


On Thu, 25 Sep 2025 00:07:26 +0530, Sibi Sankar wrote:
> Document compatible for Qualcomm Glymur SoC CDSP which is fully compatible
> with SM8550 CDSP. Also with the Linux Host running on EL2, the remoteprocs
> need to be hypervisor independent, the iommu property is mandatory to
> ensure proper functionality.
> 
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> ---
> 
> Dependencies:
> Peripheral Image Loader support for Qualcomm SoCs running Linux host at EL2:
> https://patchwork.kernel.org/project/linux-arm-msm/cover/20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com/
> This patch has a dependency on the iommu binding added in ^^ series.
> 
>  .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml     | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


