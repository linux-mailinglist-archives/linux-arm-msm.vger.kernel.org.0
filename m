Return-Path: <linux-arm-msm+bounces-79521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B84D4C1C82F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 18:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A50966443D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31BB2F5307;
	Wed, 29 Oct 2025 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeRm2lPc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A04299A8F;
	Wed, 29 Oct 2025 16:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761755963; cv=none; b=imPY/sT1Yu+V7v+g7+IyeBiR3eULjTTI6f+FwZWuGU1znasf5LEjaE7ST2K2qVh9ainLdZNGYIt6qhxIHmdtfPR2dtsDTdtspYQvvKkSYNURo9+w2ZVkULOIxBx4qqbRW9jwOgAgxxpnpyYcaR6Aug9kPX6v+tghfq+of+gJ8L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761755963; c=relaxed/simple;
	bh=k/THoufCsFgPBRIhXt6rhIAnwVeM2wUTW1HoSJUyun8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvSKi0QBUdn+Hi4x9uYAZkImgxYIOTleNdS65b4D6nNGUOlZEMp8BhAjEtB6RFJqb5UxXLKyfocDsQNF0jSTPWUU8gMWZ9BQs4Phj1eO6kfpZsp6B4JdEtMqMDBtDkalWO7PDWl42SiHzg96M/1BlFatlVtAGOGvDz6AmuVFFUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeRm2lPc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81A65C4CEF8;
	Wed, 29 Oct 2025 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761755962;
	bh=k/THoufCsFgPBRIhXt6rhIAnwVeM2wUTW1HoSJUyun8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oeRm2lPcNLRrYndKKmwVVpubn9BNybVM8rAZJlFfLxVuwlBgFuVKAeWfzJIbw+/6v
	 B//Fzw8Sj3kzbDJlCI0LPNUylzDYSat5ksVPpjcZ+9lkSlBxnSxi0KPWfm1y82OROd
	 UugFPKSPeO3pCdkSXN7ZDGoZ3VSd7Jld1gFmI6tnWn6j01DJ1x7SUtN3W3bA1fUGsO
	 YVfOu6YbWzIV2RZN2+d71K1S9M4pM7ajQkfF1yI3jHLg0IGCgTuPOXEPmVK/JGbFs4
	 raG/iKgxHm/BHJZCUjvKOdqX7MzRFAkV/rMhD00hQB3frIls5NlDvOdd48AiRDXlNq
	 2wEE2IkfcxG/A==
Date: Wed, 29 Oct 2025 11:42:26 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/3] phy: qcom: edp: Make the number of clocks flexible
Message-ID: <wjvec7fiqjzlyo6y5kpzsd5u7rz47anaytu25w2j4yqgtdntx6@zuapdsayoio2>
References: <20251029-phy-qcom-edp-add-missing-refclk-v4-0-adb7f5c54fe4@linaro.org>
 <20251029-phy-qcom-edp-add-missing-refclk-v4-2-adb7f5c54fe4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-phy-qcom-edp-add-missing-refclk-v4-2-adb7f5c54fe4@linaro.org>

On Wed, Oct 29, 2025 at 03:31:31PM +0200, Abel Vesa wrote:
> On X Elite, the DP PHY needs another clock called ref, while all other
> platforms do not.
> 
> The current X Elite devices supported upstream work fine without this
> clock, because the boot firmware leaves this clock enabled. But we should
> not rely on that. Also, even though this change breaks the ABI, it is
> needed in order to make the driver disables this clock along with the
> other ones, for a proper bring-down of the entire PHY.
> 
> So in order to handle these clocks on different platforms, make the driver
> get all the clocks regardless of how many there are provided.
> 
> Cc: stable@vger.kernel.org # v6.10
> Fixes: db83c107dc29 ("phy: qcom: edp: Add v6 specific ops and X1E80100 platform support")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index f1b51018683d51df064f60440864c6031638670c..ca9bb9d70e29e1a132bd499fb9f74b5837acf45b 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -103,7 +103,9 @@ struct qcom_edp {
>  
>  	struct phy_configure_opts_dp dp_opts;
>  
> -	struct clk_bulk_data clks[2];
> +	struct clk_bulk_data *clks;
> +	int num_clks;
> +
>  	struct regulator_bulk_data supplies[2];
>  
>  	bool is_edp;
> @@ -218,7 +220,7 @@ static int qcom_edp_phy_init(struct phy *phy)
>  	if (ret)
>  		return ret;
>  
> -	ret = clk_bulk_prepare_enable(ARRAY_SIZE(edp->clks), edp->clks);
> +	ret = clk_bulk_prepare_enable(edp->num_clks, edp->clks);
>  	if (ret)
>  		goto out_disable_supplies;
>  
> @@ -885,7 +887,7 @@ static int qcom_edp_phy_exit(struct phy *phy)
>  {
>  	struct qcom_edp *edp = phy_get_drvdata(phy);
>  
> -	clk_bulk_disable_unprepare(ARRAY_SIZE(edp->clks), edp->clks);
> +	clk_bulk_disable_unprepare(edp->num_clks, edp->clks);
>  	regulator_bulk_disable(ARRAY_SIZE(edp->supplies), edp->supplies);
>  
>  	return 0;
> @@ -1092,11 +1094,9 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>  	if (IS_ERR(edp->pll))
>  		return PTR_ERR(edp->pll);
>  
> -	edp->clks[0].id = "aux";
> -	edp->clks[1].id = "cfg_ahb";
> -	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(edp->clks), edp->clks);
> -	if (ret)
> -		return ret;
> +	edp->num_clks = devm_clk_bulk_get_all(dev, &edp->clks);
> +	if (edp->num_clks < 0)
> +		return dev_err_probe(dev, edp->num_clks, "failed to parse clocks\n");

Nit...We're not really failing to "parse" clocks...

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

>  
>  	edp->supplies[0].supply = "vdda-phy";
>  	edp->supplies[1].supply = "vdda-pll";
> 
> -- 
> 2.48.1
> 

