Return-Path: <linux-arm-msm+bounces-58290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FC5ABACE6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 02:02:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A754E1896AEA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 00:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB14800;
	Sun, 18 May 2025 00:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhO8pHAg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B4B647;
	Sun, 18 May 2025 00:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747526563; cv=none; b=hTVKz8ydLb36yHr5WxrbLz1SBobDr5aARJaLOyje8PQRZ1KgoLIQST0aFIgIzvyJH0fdFo1d2PRE9EraHFTgkPCbEcUAokdoimPYHml9w1dXPV36tH9lxYZbgU9cvoHxh8vUTmQ+F/Rt2VTinYpDLR0aH+6twASne88Efjq8xDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747526563; c=relaxed/simple;
	bh=KL7wSzI7YuLulaVuEeqR20qBSuN4BVt39boNwuifozQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnqEnfg0tAMeMN/J0gY5kUXlZGFqwqfzUdeqTrO7+zW2gs62HIlMV6g1at4K1ota+31M7fvS10a7/wAVIrJnDmYsBGov909Z+Ko37ulSi2x6VkUP3J7zbyJuzY178weBqclzjGmyWzvLvuTB57LW4bf69c+2JcefbVwPNHxy6o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhO8pHAg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839B2C4CEE3;
	Sun, 18 May 2025 00:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747526562;
	bh=KL7wSzI7YuLulaVuEeqR20qBSuN4BVt39boNwuifozQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EhO8pHAgPEVO8iLXYVpKrJ25s20GbRp//xSvppDmZWYY9UUdhPWV3so6okuX7c1xL
	 PejHe9XAFGeTYds//IiFkKerr2ffSa3k7TdAPN+FjQWob+8Vr5eslyiFxpOz/+L/y6
	 9n6HTX8EJ4dnzmk64mCmh6O4hxAyHDjy3pekq3o+xLyPoEoFEPHDl8awthWJpIZQDC
	 rOB7JGaZznUET9d86CZ4qe5HpXMcMkNrXxWFYpXH20o3e9x7fNT9hpWmyr52XbaJhT
	 Z9f21gf1GRdc8lP5g9aF4NdKRn+fLEI2QQgIr7Nx8HLGkSRUbzoD/YBqT3Z6QaFWgM
	 no6ndZrgh52Jg==
Date: Sat, 17 May 2025 19:02:19 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: ufs: qcom: Document the SM8750 UFS
 Controller
Message-ID: <ivyxgka65ahbwu7juszd7pf4wc3rns2siztibrtbnm6eoqjjwk@57nsyim5qyz7>
References: <20250327-sm8750_ufs_master-v3-0-bad1f5398d0a@oss.qualcomm.com>
 <20250327-sm8750_ufs_master-v3-1-bad1f5398d0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-sm8750_ufs_master-v3-1-bad1f5398d0a@oss.qualcomm.com>

On Thu, Mar 27, 2025 at 01:54:28PM -0700, Melody Olvera wrote:
> From: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Document the UFS Controller on the SM8750 Platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

@UFS-maintainers, could you please pick the binding (this patch) through
your tree, so that I can pick up the remaining dts changes through the
qcom tree?

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> index a03fff5df5ef2c70659371bf302c59b5940be984..6c6043d9809e1d6bf489153ab0aea5186d3563cc 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -43,6 +43,7 @@ properties:
>            - qcom,sm8450-ufshc
>            - qcom,sm8550-ufshc
>            - qcom,sm8650-ufshc
> +          - qcom,sm8750-ufshc
>        - const: qcom,ufshc
>        - const: jedec,ufs-2.0
>  
> @@ -158,6 +159,7 @@ allOf:
>                - qcom,sm8450-ufshc
>                - qcom,sm8550-ufshc
>                - qcom,sm8650-ufshc
> +              - qcom,sm8750-ufshc
>      then:
>        properties:
>          clocks:
> 
> -- 
> 2.48.1
> 

