Return-Path: <linux-arm-msm+bounces-35869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 535369B0274
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 14:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 077371F234E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 12:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64334231C8E;
	Fri, 25 Oct 2024 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kR9O2FOk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1BB1FE107;
	Fri, 25 Oct 2024 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729859686; cv=none; b=Ki3MlAIpGw0znt2RSAEK82UYbXZ5TYrTwk7ESNWhlPpBXrOQehUofnIAwikLCoU++H7Ft105Ed7SyIwK0laqgJ6Blj3c7JWXXFlQfp5DCf7zzXxbBxxro/oPopD3b5z7oe4jMmUjt+2MNrrzHH36/oM7S7p7T6iRCVjofhBgTko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729859686; c=relaxed/simple;
	bh=KlmpvUQiUGH9hbJtB2/sxgQMV8PN+Fo3A4mmPN+NcD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPyvOvYP2YpUjnhRuLvhPwWw+l1XTqRtJreDyn+dHpx5C9zKUESElBFT15oR0yC8uMf9CzoKsXqENU8WaHAeDCaF2Rf9sREIBOoHaovLAQnItvVtxdhIiP3T9UOZfJ09tKZHqfaM/ujLBI3Lik5+GNtUIjsY2Yo3oSSUWApH360=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kR9O2FOk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D498FC4CEC3;
	Fri, 25 Oct 2024 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729859685;
	bh=KlmpvUQiUGH9hbJtB2/sxgQMV8PN+Fo3A4mmPN+NcD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kR9O2FOkjxFRTeztY0naWl/Bn6TCUu4C5ub4DXqwmvbODSbvjX3cWAHh3tL0tfrAn
	 rB67IxGd6glVhWiXKWrZi/TKOuT1XfXl9D82XI6XaP8NcILF4kcg4tzc+PJI8oceC4
	 +tw/GSjCPJ6Y9wrcPcshsMCXXPmx0N9CejQqLwXk1wbWKrtHf5PILDxHXZ8dELPFIC
	 h5sxipbbyNQI1Ol2h4aArHn/FAfP0RXE2S2Qg9/og8HY/lpWepaeW/R9GevGlp8Pby
	 hoct6KlcdoeBA0AdLKOiUFPdp0mgbsBhGEJcWjt+Pxq2iyC5KyZw20v9Nbpau2swFc
	 pX+0BRwPLIiZA==
Date: Fri, 25 Oct 2024 14:34:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qingqing Zhou <quic_qqzhou@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, robimarko@gmail.com, will@kernel.org, 
	robin.murphy@arm.com, joro@8bytes.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH v3 2/4] dt-bindings: arm-smmu: document QCS615 APPS SMMU
Message-ID: <mh3fh23aeix23argueflyqbia6gh62kqsbgehkrvzqgdklgao2@pikskhwfbdyr>
References: <20241025030732.29743-1-quic_qqzhou@quicinc.com>
 <20241025030732.29743-3-quic_qqzhou@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025030732.29743-3-quic_qqzhou@quicinc.com>

On Fri, Oct 25, 2024 at 08:37:30AM +0530, Qingqing Zhou wrote:
> Add the compatible for Qualcomm QCS615 APPS SMMU.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


