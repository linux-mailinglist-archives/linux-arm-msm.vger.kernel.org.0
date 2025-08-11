Return-Path: <linux-arm-msm+bounces-68517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A59C4B21058
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 17:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04FFD6837CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 15:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BA92E3397;
	Mon, 11 Aug 2025 15:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qchva0sc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE2D2E0915;
	Mon, 11 Aug 2025 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925939; cv=none; b=U6CmvcYFF6HKe1/BdCRjNcuLGWWdVC+kWMMaR3kgBTamdvsdXCWQivy1XXcyNM7juVSfBCvXRLk9gF6f+1kFuF3ww06ot4qjfiDv0G01MIPghs866s/NywkpjpoYN/WLu9GE7CyU/d2cptEhzfwyGDdkLm6vteyjNyuCpJJmNbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925939; c=relaxed/simple;
	bh=IhIcr66PToRKXOs7w1W4iQhvU2VtWXgGXaxM2SDwKgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYHdfr6wF5Wlce4eSeBydVGDLin6G4ZUpug42lTSLACGhvOakskzL99+DI36FX17Q28SPpYFcRVMKWE2cqOF+oR+5aCOCptuIMV05+YiMnfz0HVCD6+MCqfJtnPr0V/K/OITtNZ/pPUvMBFXMDZrJLUCi6JjFVmqFIHv7VdTtLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qchva0sc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FFF5C4CEED;
	Mon, 11 Aug 2025 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925939;
	bh=IhIcr66PToRKXOs7w1W4iQhvU2VtWXgGXaxM2SDwKgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qchva0sczO7tAGJoNcboP/KSVOd5rINI76Yu3dlVbv2AFnRwqQYYqodZwcpntYzY9
	 H1gv2Hiy44BwZuLyO+NRLphKrKVgYS0RxOAmfYVM4Rk+agFZTFniwa9SsxM9D0oy/6
	 gILT0HQSbwjVLvpTf1aLzif9rpLHjKWhpMTOSSJoKxpMARYKHhGVSqLZ4uaSMlOEP4
	 rK+nJdeXjNcG7KI8nwCSINn7zAuq/AdQ17OaZEabz5QoRuzToc7KoLGtpqrTFZaul8
	 QLKCqM+LtEj0NxjJq2QUsiq6v3ppkvupF32gq0C5iw5bVHqx+XEb0hOVvy/ylk9JBb
	 y+WUyDMzHCoQw==
Date: Mon, 11 Aug 2025 10:25:36 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, 
	conor+dt@kernel.org, bvanassche@acm.org, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH V1 2/4] arm64: dts: qcom: sm8750: add max-microamp for
 UFS PHY and PLL supplies
Message-ID: <gvwdeswdx5rhdepxrgomtbeenh4o6zyi5banvp3y5gz2dkvopb@7pd6qmq4ypvg>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-3-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806154340.20122-3-quic_nitirawa@quicinc.com>

On Wed, Aug 06, 2025 at 09:13:38PM +0530, Nitin Rawat wrote:
> Add `vdda-phy-max-microamp` and `vdda-pll-max-microamp` properties to
> the UFS PHY node in the device tree.
> 
> These properties define the maximum current (in microamps) expected
> from the PHY and PLL regulators. This allows the PHY driver to
> configure regulator load accurately and ensure proper regulator
> mode based on load requirements.
> 

But doesn't this imply that these values are fixed for a given SoC?
Perhaps even for a given generation of the PHY/process?

Is there any case where these values need to be tweaked on a per-board
basis?


If not, I think these should be constants in the driver.

Regards,
Bjorn

> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 ++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index 75cfbb510be5..2ae5915fe38d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -1032,7 +1032,9 @@ wcd_default: wcd-reset-n-active-state {
>  
>  &ufs_mem_phy {
>  	vdda-phy-supply = <&vreg_l1j_0p91>;
> +	vdda-phy-max-microamp = <213000>;
>  	vdda-pll-supply = <&vreg_l3g_1p2>;
> +	vdda-pll-max-microamp = <18300>;
>  
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> index 13c7b9664c89..e9a41d34e2d6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> @@ -1039,7 +1039,9 @@ &uart7 {
>  
>  &ufs_mem_phy {
>  	vdda-phy-supply = <&vreg_l1j_0p91>;
> +	vdda-phy-max-microamp = <213000>;
>  	vdda-pll-supply = <&vreg_l3g_1p2>;
> +	vdda-pll-max-microamp = <18300>;
>  
>  	status = "okay";
>  };
> -- 
> 2.48.1
> 

