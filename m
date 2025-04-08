Return-Path: <linux-arm-msm+bounces-53596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DDBA81822
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 00:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D2B1448BC0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 21:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83710255227;
	Tue,  8 Apr 2025 21:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jxtG6cyH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E782550D5;
	Tue,  8 Apr 2025 21:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149442; cv=none; b=gqbBFWz4U1XAGOonN75mWLzn+W+PpcADEEA6CCnPvM09bPq7zIT4PYBaBoG4pTRG/xux2lzVDfzkoWLhu1lvAPJfbZhhEjboMze+xgwpoBc7pDPQjDgmxYOQbEgIFMX82saF9oYx0zLdJn32q2ftHZQvMR8s+AdzneMnw12HLCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149442; c=relaxed/simple;
	bh=13bwSaLivT7PWT7yUVcAfAg2qBe5W0x6LJ2TLwmH5hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EurTw/NyRae6ME+VuNbEb3b9nW45SxLzezYwtu28v7Z/IGSv5MIMmkwjvl83EACoGoANbafBx8mYrRNpSUPST0KrAD3iBh5PbZnGlYFK5yGcQy5lO2JuYNX6XRZkW5Fd3rlkMBlH+z1dWu4aBj+MJCp9FoJyfJgSklvYcuHybOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jxtG6cyH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D036DC4CEE5;
	Tue,  8 Apr 2025 21:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744149441;
	bh=13bwSaLivT7PWT7yUVcAfAg2qBe5W0x6LJ2TLwmH5hY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jxtG6cyHv89DdB2PnUxODTgCDaLldaPSr+JhG2xN9sCVBsDmww34SfB0kmnOMRPtt
	 xaOYkzZnblT5Zu95vJHgmQUyrT1QVvv0ZUdJgS2kFGOWMbPpgu39BTnrCZ/szKmH73
	 TeailpYcpa6QMhKDrLH0cQ0S+pR8mmO8wRqagmPdcsDTUPY5kQ15gCyF7cjkFm0WYe
	 5/oJr0yP33grObfcOvgKrbMzWRD1ZjWRGnH/NYQ4yDcQaizFUJS4BX4InqW4LHQ6l/
	 eqQpBNvhSkGG0Zys6bzKOJZlbRs/8gyvRNBieXjLoIUv+WGHw28HF/HxxuiutM/lEH
	 LBn2ddlCP75kg==
Date: Tue, 8 Apr 2025 16:57:18 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 03/24] ARM: dts: qcom: msm8916: Use the header with
 DSI phy clock IDs
Message-ID: <5jvedjfbkuumgmqovf65cavdgnta5zss3emiwnwdnh5o3aw7te@4d5ecfbxlwui>
References: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
 <20250408-dts-qcom-dsi-phy-clocks-v2-3-73b482a6dd02@linaro.org>
 <D916M5DUK1YC.282XEZ0TMSNEC@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D916M5DUK1YC.282XEZ0TMSNEC@fairphone.com>

On Tue, Apr 08, 2025 at 12:23:18PM +0200, Luca Weiss wrote:
> On Tue Apr 8, 2025 at 11:32 AM CEST, Krzysztof Kozlowski wrote:
> > Use the header with DSI phy clock IDs to make code more readable.
> 
> Hi Krzysztof,
> 
> This patch was the wrong subject, it's touching arm64, not arm32.
> 

Thanks for spotting this, I'll fix it up while applying the patches.

Thanks,
Bjorn

> And thanks for sending this series, it's nice to see some magic numbers
> disappear that make little sense if you don't know what it's about :)
> 
> Regards
> Luca
> 
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8916.dtsi | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > index 8f35c9af18782aa1da7089988692e6588c4b7c5d..c89f9e92e832eae8f630555e9e7f5817d6731d4d 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> > @@ -4,6 +4,7 @@
> >   */
> >  
> >  #include <dt-bindings/arm/coresight-cti-dt.h>
> > +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
> >  #include <dt-bindings/clock/qcom,gcc-msm8916.h>
> >  #include <dt-bindings/clock/qcom,rpmcc.h>
> >  #include <dt-bindings/interconnect/qcom,msm8916.h>
> > @@ -1497,8 +1498,8 @@ gcc: clock-controller@1800000 {
> >  			reg = <0x01800000 0x80000>;
> >  			clocks = <&xo_board>,
> >  				 <&sleep_clk>,
> > -				 <&mdss_dsi0_phy 1>,
> > -				 <&mdss_dsi0_phy 0>,
> > +				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
> > +				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> >  				 <0>,
> >  				 <0>,
> >  				 <0>;
> > @@ -1590,8 +1591,8 @@ mdss_dsi0: dsi@1a98000 {
> >  
> >  				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
> >  						  <&gcc PCLK0_CLK_SRC>;
> > -				assigned-clock-parents = <&mdss_dsi0_phy 0>,
> > -							 <&mdss_dsi0_phy 1>;
> > +				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
> > +							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
> >  
> >  				clocks = <&gcc GCC_MDSS_MDP_CLK>,
> >  					 <&gcc GCC_MDSS_AHB_CLK>,
> 

