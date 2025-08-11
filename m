Return-Path: <linux-arm-msm+bounces-68515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94099B2104D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 17:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4902518A6442
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 15:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911AF2E1C58;
	Mon, 11 Aug 2025 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jiElQkzB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692F32E11A8;
	Mon, 11 Aug 2025 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754925642; cv=none; b=FkjuOUnTwXXZxH2AcBhhYikqIMgKCAxEcq2i9zXU3XFgaXkIHPtfhVDXsPbto/N/NrYHHH0hnfhhfInqCmlgoghBy0G51RLV4GOQLfNqtANUbPQSPUEU+kmAIp4LJR2LFpExq5NOOeDNmp8/vWrKGiyL2bgeWRtEnFYQR7D60cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754925642; c=relaxed/simple;
	bh=HODDP6bUeUjpqflyi0V3xVYklwBtKZvsyo9s97ASpgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUjxtCTjjPqcNYWxXiNuYiY6i2hgh8i7YN93fV+1TQXyiLbspTBVd0LlXSWysjNTNCdc6Aa7Tm6LWVkosTErjH5wE6BuXK0HAffILQHozGOrCF6c8TnlfpeougXCZ7z4KLJoGInQlqgcZkyBhEZVIf7ots2vmXK4iPBPZxYQOZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jiElQkzB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11356C4CEED;
	Mon, 11 Aug 2025 15:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754925642;
	bh=HODDP6bUeUjpqflyi0V3xVYklwBtKZvsyo9s97ASpgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jiElQkzB1VuRNUtbAj0YE4+yrtFBTSue7LFZFVivvsuQ5ZX5fx0LyHNQWLmcher5p
	 5RDdaozpcRrqLIPWkzqhiAjTiptVPp3nKMvqzizujoK5RalBmwu6ucPq/fJFIwbobd
	 22rhIfBy4lKYeiCELOaCiz+eeUr2Y+XJGqukatp9OhncmsHxbqLKOBsUSDvIXcROO0
	 EEW9VEKewOBL1VxbCFJczHe9Pu0gl6lY96IlcJCcCKq6BvbDUj9e7J3zhukbwwivkj
	 UFfP2l3mXnEy0dwxs5AekcbuCgtk0fWqWoejOWHGVZR8Lavo4TKqBMQGSrDhqwKmdn
	 4xA9/RrEp/W5A==
Date: Mon, 11 Aug 2025 10:20:39 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, 
	conor+dt@kernel.org, bvanassche@acm.org, neil.armstrong@linaro.org, 
	dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH V1 1/4] dt-bindings: phy: Add max-microamp properties for
 PHY and PLL supplies
Message-ID: <jnsrcwcok6p63zddr3idsm2oa5kk3zi46atg7v3uvpu55vw4t4@vxslqznwhvyd>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-2-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806154340.20122-2-quic_nitirawa@quicinc.com>

On Wed, Aug 06, 2025 at 09:13:37PM +0530, Nitin Rawat wrote:
> Add two new optional properties to the SC8280XP QMP UFS PHY
> device tree binding:

Please start your commit message with a description of the problem
you're trying to solve.

> 
> - `vdda-phy-max-microamp`: Specifies the maximum current (in microamps)
> 			   that can be drawn from the PHY supply.
> - `vdda-pll-max-microamp`: Specifies the maximum current (in microamps)
> 			   that can be drawn from the PLL supply.

That's literally the content of the patch...use the commit message to
describe the problem you're solving and a technical description of the
solution to your problem (and in this case, why that solution goes in
the DeviceTree).

Regards,
Bjorn

> 
> These additions help define power requirements more precisely for
> regulators supplying the PHY and PLL blocks and ensuring the regulators
> is kept in correct mode based on the client load requirements.
> 
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  .../bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml        | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> index a58370a6a5d3..4648642dc974 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -71,6 +71,16 @@ properties:
>  
>    vdda-pll-supply: true
>  
> +  vdda-phy-max-microamp:
> +    maxItems: 1
> +    description:
> +      Specifies max. load that can be drawn from phy supply.
> +
> +  vdda-pll-max-microamp:
> +    maxItems: 1
> +    description:
> +      Specifies max. load that can be drawn from pll supply.
> +
>    "#clock-cells":
>      const: 1
>  
> -- 
> 2.48.1
> 

