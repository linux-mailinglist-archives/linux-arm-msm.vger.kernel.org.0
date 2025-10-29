Return-Path: <linux-arm-msm+bounces-79522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBA5C1C490
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 17:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92A78644818
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B58024C076;
	Wed, 29 Oct 2025 16:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uToJNhpD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F962F0676;
	Wed, 29 Oct 2025 16:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761756002; cv=none; b=FCPUNLI9N+7ogeE7W4i9PyrUd9RdCXdOV54L3YTRMvShTBtNbifXgvMSibsgE5xabGnV69XdhbAGywDpm8uQWZ1doh8tCo68oJ17RHivwK/ea/yEEDViw558lvwd4guEZCTSKeOzOfU8eV5avygBBW8FrdrQ4veK9NC2FgWjAY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761756002; c=relaxed/simple;
	bh=NdTp1VvlzXT2iMmRb+rzAshXMwZ79HLOe8xu+us+kJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EmI7HbmkMPYt3nfRpS4ZfMZfjT3DQ680bhtz9IAN6HNqVxKOhn0/hlOIx9kPbOGtP6Fvp/hN7CkafSdi8wI+WNVuOPygCMHJ+vey07PUF2YtgCYZaj4IIPu0Qdqmuu6HzfuryBkrrmmTyfM7PULIzhtnaSnBSTTCtot4lBB04HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uToJNhpD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AB8C4CEF7;
	Wed, 29 Oct 2025 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761756001;
	bh=NdTp1VvlzXT2iMmRb+rzAshXMwZ79HLOe8xu+us+kJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uToJNhpDTN6RNRLAFbn29AjYO7MrPMp2zZskc9hsRSRGpM+74g36Z0GDf51W6Mrza
	 vETg//BYRbnaU8mg+KpsVXrosVmirha6BfUhF3Ycsr3cK8u5Af+l0F0lW+LA43NTZH
	 QqvkIB0+1jdimtMKRncxhzAjvnOX4SCI4206/EDRJRkcseKpjS0Eyf+4NQvMFwomnA
	 MLfvZdoIQ2BIRC4CGhCHpEKrHJdtlDrWb1dlCyAXnjc4z/L1G3JAM88gfWcw6uLZTs
	 l+DonwkjYE1NdlthoHbTVWmf+muYP3xggO/DIQ6i/TNwv4Q6I0BzKdfAhhw7hu4u+T
	 YXQXuHuWr/GWw==
Date: Wed, 29 Oct 2025 11:43:04 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: x1e80100: Add missing TCSR ref
 clock to the DP PHYs
Message-ID: <u6f4spt62rzqyqifaza7q34e7vf2jmbrbmzmgxtlhjupya3lsy@6vvssqcfhmtg>
References: <20251029-phy-qcom-edp-add-missing-refclk-v4-0-adb7f5c54fe4@linaro.org>
 <20251029-phy-qcom-edp-add-missing-refclk-v4-3-adb7f5c54fe4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-phy-qcom-edp-add-missing-refclk-v4-3-adb7f5c54fe4@linaro.org>

On Wed, Oct 29, 2025 at 03:31:32PM +0200, Abel Vesa wrote:
> The DP PHYs on X1E80100 need the ref clock which is provided by the
> TCSR CC.
> 
> The current X Elite devices supported upstream work fine without this
> clock, because the boot firmware leaves this clock enabled. But we should
> not rely on that. Also, even though this change breaks the ABI, it is
> needed in order to make the driver disables this clock along with the
> other ones, for a proper bring-down of the entire PHY.
> 
> So lets attach it to each of the DP PHYs in order to do that.
> 
> Cc: stable@vger.kernel.org # v6.9
> Fixes: 1940c25eaa63 ("arm64: dts: qcom: x1e80100: Add display nodes")

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index a17900eacb20396a9792efcfcd6ce6dd877435d1..59603616a3c229c69467c41e6043c63daa62b46b 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -5896,9 +5896,11 @@ mdss_dp2_phy: phy@aec2a00 {
>  			      <0 0x0aec2000 0 0x1c8>;
>  
>  			clocks = <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
> -				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
> +				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				 <&tcsr TCSR_EDP_CLKREF_EN>;
>  			clock-names = "aux",
> -				      "cfg_ahb";
> +				      "cfg_ahb",
> +				      "ref";
>  
>  			power-domains = <&rpmhpd RPMHPD_MX>;
>  
> @@ -5916,9 +5918,11 @@ mdss_dp3_phy: phy@aec5a00 {
>  			      <0 0x0aec5000 0 0x1c8>;
>  
>  			clocks = <&dispcc DISP_CC_MDSS_DPTX3_AUX_CLK>,
> -				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
> +				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +				 <&tcsr TCSR_EDP_CLKREF_EN>;
>  			clock-names = "aux",
> -				      "cfg_ahb";
> +				      "cfg_ahb",
> +				      "ref";
>  
>  			power-domains = <&rpmhpd RPMHPD_MX>;
>  
> 
> -- 
> 2.48.1
> 

