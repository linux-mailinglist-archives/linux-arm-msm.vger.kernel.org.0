Return-Path: <linux-arm-msm+bounces-46702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EA26AA2531E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 08:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E32887A1FAC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 07:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4722C1E7C20;
	Mon,  3 Feb 2025 07:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjTAsZlH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1FD1DDC1B;
	Mon,  3 Feb 2025 07:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738568063; cv=none; b=fXtMs/+8DqsAGFoTyd9TOvj/SFXNmlflkRkZ6tYAikxPCQj29oLBUf7AiFKK59rokNwxFswff6T7T7NPWTtniL9cqYOpM14wlyaF1oPpY7p1p9P9tTMlRCg0NXbiMPZwhjenVFgZqRajLs7D8Ho0juNgNWv0zO0rhUNU+Qg6Dic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738568063; c=relaxed/simple;
	bh=0fcgH6fpAU+WqDpnPrnEK4yexzXBn4fqZT+ycK7aI3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tk0xalQVJku7xM+u+pP68b6/0tquZEyaaarst9TDSxZi3iNBN8xsHsZgLlouFstBSz74BVeaJkFy7/1aSTNLNGUwaEgfl36yFt0peWqlfH+5BDZSfAiTfH6nCtFgbbf3jHhqAUg1ZQLdkfOKzl7yCR3PybXOgfcihMHKbAqtKTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IjTAsZlH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDF4C4CEE2;
	Mon,  3 Feb 2025 07:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738568062;
	bh=0fcgH6fpAU+WqDpnPrnEK4yexzXBn4fqZT+ycK7aI3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IjTAsZlHDtzcC9Z5sZbCEYC9gToKIZMZ/OC5TwV9/hg4+yroCNi++HNt2Jnozlhbs
	 sEYmt315saTQ2j0sLNP3YQ7pE21IsgKxnvIjVOBmWUsqpYzreRPI0OfA8xFbkxZIEu
	 KTqq93/+ud782OYURu18/EsiHsh2u7EnWxd+tmM7fC9XCZpoIkJyerBUMPtX8BMD3g
	 AwGntRAziBFtD7DphHTDXWtxT4mDfTCIzQavyDNd2yjvygzhJ1H8P0ApTiR9t+YJXz
	 RUURQyU5Z8CXyxQBbjHcW9l2S6jMQM6S102ll8Ot4CBxPWqBpwiFVgVvnLarsFGjQu
	 7qUw2T9pQlppA==
Date: Mon, 3 Feb 2025 08:34:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
Message-ID: <20250203-demonic-melodic-jellyfish-7d2b5f@krzk-bin>
References: <20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com>
 <20250203-b4-branch-gfx-smmu-v4-1-eaa7aa762f48@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-b4-branch-gfx-smmu-v4-1-eaa7aa762f48@quicinc.com>

On Mon, Feb 03, 2025 at 11:17:01AM +0530, Pratyush Brahma wrote:
> Add the compatible for Qualcomm QCS8300 GPU SMMU. Add the compatible
> in the list of clocks required by the GPU SMMU and remove it from the
> list of disallowed clocks.
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


