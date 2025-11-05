Return-Path: <linux-arm-msm+bounces-80408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F30C3487A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 09:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11188189D67A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 08:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FB02D8371;
	Wed,  5 Nov 2025 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzGUfFRL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68DA2D6E6A;
	Wed,  5 Nov 2025 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332277; cv=none; b=XFYzVrUG0FgCpBuXksBL4s1SlCBYXrYYkomik4lExGerB1+8hq7lu7EV1b3xFfDC/RT5JnOtckr4Zg06g87lZM8jo4Pgi4VueZQ7spPZ7D9/5/FN97CJmZPKmZF3If5hlRxYBSmf8O2Jl1rCgkk00HH3uNRp4IkIThA5t4xL544=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332277; c=relaxed/simple;
	bh=B1mrzqdCotHeUPx6GmeRphi3vwwxC29uywn7AUaYpIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsukTHb7ZT5UC1XzdBRg4cyTYCPf6/A3zBpkp31JplJhX1TH9et1Tr7hn3ZChAYagEyI0XK1J68ZZHkKN3N5rJIjjqscOyOdiIMMA4rKObZzcicNR0sYujLoAPWr4BgMz2j4bf9+TwD9H1hh5WPgNXSbtTdLVaCjZA59l2457zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzGUfFRL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4CD0C4CEF8;
	Wed,  5 Nov 2025 08:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762332276;
	bh=B1mrzqdCotHeUPx6GmeRphi3vwwxC29uywn7AUaYpIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CzGUfFRLTsL19Qi/+XP0OzEpr4fmO4sluqZzOHVtWApYci0N543doqZb2LYPRMQR4
	 dY3EVAfT1DZ2vwrO7fYLaNlYaTSnc+KirvRrrwMu6Ew/NsyGtBg43SQTwVp6Sir5ET
	 ODovueBinj4gWGjlSR5zIFRhClia0uE1HD8cXIzP6s91aSZItsvOjfYekB9LCByPlR
	 +owTzT/WQLgiiks5rvCRODfMhUIKdFzoFYtM9H1JdeJAQTf3yvj8hbxZfQPqTT8I9z
	 ILgsXLWk6nWUVl6SrnknhDK+0kpfZ5ka+Z1NQgsi801m2a32GWLRkoYE2Gd55ZaGeu
	 mZFe9LQ00RxUA==
Date: Wed, 5 Nov 2025 09:44:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ritesh Kumar <riteshk@qti.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, 
	abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, sean@poorly.run, 
	marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_mahap@quicinc.com, 
	andersson@kernel.org, konradybcio@kernel.org, mani@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, vkoul@kernel.org, kishon@kernel.org, 
	cros-qcom-dts-watchers@chromium.org, Ritesh Kumar <quic_riteshk@quicinc.com>, 
	linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-scsi@vger.kernel.org, quic_vproddut@quicinc.com
Subject: Re: [PATCH v3 1/2] dt-bindings: phy: qcom-edp: Add eDP ref clk for
 sa8775p
Message-ID: <20251105-juicy-rhino-of-action-b6be48@kuoka>
References: <20251104114327.27842-1-riteshk@qti.qualcomm.com>
 <20251104114327.27842-2-riteshk@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251104114327.27842-2-riteshk@qti.qualcomm.com>

On Tue, Nov 04, 2025 at 05:13:26PM +0530, Ritesh Kumar wrote:
> From: Ritesh Kumar <quic_riteshk@quicinc.com>
> 
> When the initial contribution of eDP PHY for sa8775p was done,
> eDP reference clock voting was missed. It worked fine at that
> time because the clock was already enabled by the UFS PHY driver.
> 
> After commit 77d2fa54a945 ("scsi: ufs: qcom : Refactor
> phy_power_on/off calls"), eDP reference clock started getting
> turned off, leading to the following PHY power-on failure:
> 
> phy phy-aec2a00.phy.10: phy poweron failed --> -110
> 
> To fix this, explicit voting for the eDP reference clock is
> required. This patch adds the eDP reference clock for sa8775p
> eDP PHY and updates the corresponding example node.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> 
> Signed-off-by: Ritesh Kumar <quic_riteshk@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml  | 6 ++++--
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml     | 1 +
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> index e2730a2f25cf..6c827cf9692b 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> @@ -200,9 +200,11 @@ examples:
>                    <0x0aec2000 0x1c8>;
>  
>              clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
> -                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
> +                     <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
> +                     <&gcc GCC_EDP_REF_CLKREF_EN>;
>              clock-names = "aux",
> -                          "cfg_ahb";
> +                          "cfg_ahb",
> +                          "ref";
>  
>              #clock-cells = <1>;
>              #phy-cells = <0>;
> diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> index bfc4d75f50ff..ba757b08b9b1 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> @@ -72,6 +72,7 @@ allOf:
>        properties:
>          compatible:
>            enum:
> +            - qcom,sa8775p-edp-phy
>              - qcom,x1e80100-dp-phy

I don't have such code in latest next, which makes it impossible to
review.

>      then:
>        properties:
> -- 
> 2.17.1
> 

