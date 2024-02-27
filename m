Return-Path: <linux-arm-msm+bounces-12621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E489868669
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 02:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C62A028F2CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 01:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A7763D0;
	Tue, 27 Feb 2024 01:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOUFT3IQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CC46139;
	Tue, 27 Feb 2024 01:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708998669; cv=none; b=orSxhWI9U11K+nIv3ub4+4FJvMaOmB8Bjz0BamYl9+mur+nQvOYtaFZOn2AcVDCS78RG2pAOfaXetBz/gnTtlk+3ZTPHqF8M7+dg7BI6ftn2ANyCMo8v5OIZUE8JwYmywJxDIkh3oJm45QJWpb0yt0x6KAOa9fQU/lojFvebEr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708998669; c=relaxed/simple;
	bh=n8eF5bWyKZHUY/oPzbkl9hpUCBFpfLEQiqjx9qsZYvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ajlTZll4et8QT+w2xcUGCG4+BFaVyy3Curvw6RnJjeC9uLaH62ReDg+BRQK3kwRjz/cMZxpEE6TJ89kRrgBGLK1nlF0PXleB7+cudmaz0Ol3kehGLzORUSDnwxWCU3ODtPMgdQCZrfIDSwCNMN9zor6dX1BqGx1BYnYT3lX/1aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOUFT3IQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3CECC433F1;
	Tue, 27 Feb 2024 01:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708998668;
	bh=n8eF5bWyKZHUY/oPzbkl9hpUCBFpfLEQiqjx9qsZYvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOUFT3IQ+Up8bd1i/za3BXLI6Tq4c0lROTl4jDDnP2AJvmukLwLWVPuHoaL4Z/oCq
	 +hi1YFbB9vyEnf9oI/ClKGaOhpkWczIWV5Gcjga7pO+ePZWxUNgOaEzW68DUJarD33
	 TReAP227DTWpDq4JnCBUHID6klaMxEgcOA2PIDIkYGafsiTzo8Qcef6TutmtYNs94U
	 1wQp9RlUWLPUsvlE7utk+rwxtxzJWj201kFKkoL7+KJe96afubSohSzmzV9r6tZJEa
	 WrNu/R71fNCxxjAkC8H+ZGe2xiD80B90slLK9hczJ2E/3pOGKLHfr4eVL7Ai7kjbhQ
	 DFEjcJNvSeeBA==
Date: Mon, 26 Feb 2024 19:51:05 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: make dispcc cast minimal
 vote on MMCX
Message-ID: <vxyst4gls5idecrgzjadm44xlwflfbwn5lvlss6tdru4kb2wtb@tzynrbvmdwsg>
References: <20240226211123.4192907-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226211123.4192907-1-dmitry.baryshkov@linaro.org>

On Mon, Feb 26, 2024 at 11:11:23PM +0200, Dmitry Baryshkov wrote:
> Add required-opps property to the display clock controller. This makes
> it cast minimal vote on the MMCX lane to prevents resets caused by the
> DisplayPort / panel probing.
> 

Interesting wording, this is exactly what e3e56c050ab6 ("soc: qcom:
rpmhpd: Make power_on actually enable the domain") was supposed to do
(cast minimal enabled vote).

And sure enough, there's a bug in my patch:
https://lore.kernel.org/linux-arm-msm/20240226-rpmhpd-enable-corner-fix-v1-1-68c004cec48c@quicinc.com/T/#u

Regards,
Bjorn

> Fixes: 57d6ef683a15 ("arm64: dts: qcom: sc8280xp: Define some of the display blocks")
> Cc: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index febf28356ff8..ec85c81f65cd 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -3938,6 +3938,7 @@ dispcc0: clock-controller@af00000 {
>  				 <0>,
>  				 <0>;
>  			power-domains = <&rpmhpd SC8280XP_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
>  
>  			#clock-cells = <1>;
>  			#power-domain-cells = <1>;
> @@ -5034,6 +5035,7 @@ dispcc1: clock-controller@22100000 {
>  				 <0>,
>  				 <0>;
>  			power-domains = <&rpmhpd SC8280XP_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
>  
>  			#clock-cells = <1>;
>  			#power-domain-cells = <1>;
> -- 
> 2.39.2
> 

