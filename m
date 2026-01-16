Return-Path: <linux-arm-msm+bounces-89347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E263D2E3F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 09:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D070E30662BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 08:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA26F30DEC4;
	Fri, 16 Jan 2026 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7+erkmf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C6030BF66;
	Fri, 16 Jan 2026 08:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768553217; cv=none; b=ePP+0IcMi4xfFbVHFbgGfHwoiWQ6FtFCtHJ4oUF/Fm6Ug4gQEdvJRWjpWrTrVIPWomOa5PmVsqUQPrZ519S5pHl0y0cO03BosUlrCxkWD4tjv8PqoOlcAVBn3whjq4bMOmXjjN33tiVXz9H/aA0YozvAT7ddKuapgucOR2Yu98c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768553217; c=relaxed/simple;
	bh=WYcyGFfls7UnBi1hYRcbdi7szgPuiaviPSMCiwNJO3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqFHrxopzCia5vyh4OJAxnggNr+EIrWJhfi7IvROxVskXUb//ZAR+TDH7qbYJoSD2F1eaylvPGCLVvcX88xdOigU+O6i1WSH+hUdviiemUSPYscKLUkNPX94ee4DBT2D/QnsiEMIuIK1iuRhfd1lScpr9+3Oi31m9DMtPSEapX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7+erkmf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FDDC116C6;
	Fri, 16 Jan 2026 08:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768553217;
	bh=WYcyGFfls7UnBi1hYRcbdi7szgPuiaviPSMCiwNJO3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y7+erkmf7xtzrsmeI3AyRF7OV8yeNtwvynALL5j8eWuKyARvkZL81Pvvzs3TtBlS9
	 /O04CA8LKqxg9X9IKCjff3+Kh9GstL5Yz6/W+iHgfZme/JWnBwhLj4/X6CW1UsH+6R
	 P6hMQRYQXBLEvk9rLRC3JkUApUc+3H1R4hjlyO1f9I2RIKbE317NOsiuJAj0FBHlnk
	 sD4D3v3mnoPfqY1A50fq+goZdKvsL0cNOL2PpiVPsTd+g+CFYLUSge3+zyOXuoSkQI
	 85G3c4ECLmgRc64ADn9z7BmmP9W7EWtg0oeg7m7pk85dfvK5LkjcmTdLrWKI+g25yF
	 hA4XmJzGkEEmg==
Date: Fri, 16 Jan 2026 09:46:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, akhilpo@oss.qualcomm.com, vikash.garodia@oss.qualcomm.com, 
	dikshita.agarwal@oss.qualcomm.com, robin.clark@oss.qualcomm.com, lumag@kernel.org, 
	loic.poulain@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: display: msm: qcm2290-mdss: Fix
 iommus property
Message-ID: <20260116-transparent-dexterous-nightingale-c029cb@quoll>
References: <20260116062004.237356-1-sumit.garg@kernel.org>
 <20260116062004.237356-2-sumit.garg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260116062004.237356-2-sumit.garg@kernel.org>

On Fri, Jan 16, 2026 at 11:50:02AM +0530, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Fix IOMMU DT propety for display via dropping SMMU stream IDs which
> relates to secure context bank. Assigning Linux kernel (HLOS) VMID
> to secure context bank stream IDs is incorrect.
> 
> The min value is added for iommus property to ensure in future when
> secure context bank stream IDs are properly supported then the iommus
> property is extensible.
> 
> These DT bindings changes should be backwards compatible.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml   | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> index f0cdb5422688..5c888f07bc0b 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
> @@ -33,6 +33,7 @@ properties:
>        - const: core
>  
>    iommus:
> +    minItems: 1

Same comment as other changes like that, which I already gave guideline
- you need to list the items (minItems stay), because you now claim the
order matters and is strictly defined.

Best regards,
Krzysztof


