Return-Path: <linux-arm-msm+bounces-89348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E53B2D2E406
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 09:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15645303D689
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 08:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B36E30DEC4;
	Fri, 16 Jan 2026 08:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="smMTk41d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D8F3064AA;
	Fri, 16 Jan 2026 08:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768553260; cv=none; b=TbXBfuWzW43VnYZerHOg8Xvn4TZOy4j1Q/3ZOnIZvEfhYeoKASNlVCqWKi+GjbJfK0UWssN4DBDj8fcQonZiMmOl1eR+ZTSskLXi0BSHtCeyy5JDQLlR+WJjQdsyag69zb3FlzIxq3ou28rSmt4mHLUhaM72cVOB0lxOFbZKmfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768553260; c=relaxed/simple;
	bh=yEJTVW9xDZyccQ+8ZfLVCfXsSgPCkHTxGKn4vjT3CAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHvinhrit4+KYd5bffChpylpRGzkROCAtEL/7wNa7FwgB0Vn4n6w0uwfQT+ib5Nhn7tyxhJOz5HCv01wPeW29LdRZW4kyw7qPoFZ/Ey/sWxWjFgE98fws5CEimSnV3OObhWUmJaaIMhe1tQi1YHfKpll+XfBhYqv/T6pgIM4EeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=smMTk41d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26771C116C6;
	Fri, 16 Jan 2026 08:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768553259;
	bh=yEJTVW9xDZyccQ+8ZfLVCfXsSgPCkHTxGKn4vjT3CAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=smMTk41dT8zjNf9LSBbNdWQstxLT1X3FLmYJ1XEMjwP7O8hLmTRlugA7ARZP3ylS6
	 sPuxRjPacSi2CEZ0SgPC1/ZewZTqMxNMGKub6o5fHXLPG7n++iwDs9dagsicHk7Z80
	 g25Kh8hiViedBYe9tth63MVs37oX5kaf+NvbPnR7MyYuOp+1Xwf33+A2U3g6GUEfSY
	 ODtCMHO3RWbDSWFWvqrmfmsuTUSJJzN6zzxxLAFmOHIQ/JrZRtytBsd4KoMGbK7xdw
	 SOmLZJtFc37K27lRv+XjQjJF4yiPyafmjGgftCpMpd0rfwp3C/0GgZ3Nb4hrCh/nAQ
	 C4/Om1OPNMuUg==
Date: Fri, 16 Jan 2026 09:47:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, akhilpo@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com, 
	dikshita.agarwal@oss.qualcomm.com, robin.clark@oss.qualcomm.com, lumag@kernel.org, 
	loic.poulain@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] media: dt-bindings: venus: Fix iommus property
Message-ID: <20260116-burrowing-weightless-sawfly-53dc98@quoll>
References: <20260116062004.237356-1-sumit.garg@kernel.org>
 <20260116062004.237356-3-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116062004.237356-3-sumit.garg@kernel.org>

On Fri, Jan 16, 2026 at 11:50:03AM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Fix IOMMU DT propety for venus via dropping SMMU stream IDs which
> relates to secure context bank. Assigning Linux kernel (HLOS) VMID
> to secure context bank stream IDs is incorrect.
> 
> The min value is added for iommus property to ensure in future when

You do not add min value (that would be "minimum") but change the list.

> secure context bank stream IDs are properly supported then the iommus
> property is extensible.
> 
> These DT bindings changes should be backwards compatible.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/media/qcom,qcm2290-venus.yaml       | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> index 3f3ee82fc878..ae6bc0d0bea6 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-venus.yaml
> @@ -42,6 +42,7 @@ properties:
>        - const: vcodec0_bus
>  
>    iommus:
> +    minItems: 2

Same problem.

>      maxItems: 5

Best regards,
Krzysztof


