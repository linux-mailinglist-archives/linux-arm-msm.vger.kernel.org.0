Return-Path: <linux-arm-msm+bounces-21373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE918D6CA5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2024 01:02:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD76CB20D72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 23:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2A2824B0;
	Fri, 31 May 2024 23:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IT0ggGGC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769BA381BD;
	Fri, 31 May 2024 23:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717196526; cv=none; b=eyBujr5JstwUjl1crmMcDv9QiFaqGh4SOLfvt9h1uIrrzuAFCyVzKvoGqJ0LNvLpBhEw+Dg7UZykCr+7kG+JDgihJLto4O2aMOD1Si66R4iSxMuOs5inQze8xaOIB+yQ6PJXQmyqc8yDOdZjGByEWSfZ/S0STw3kUcRGnkzWurA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717196526; c=relaxed/simple;
	bh=TIq2oxFZ0F5FduDHYaUGP8LeNkvPsFc5NiUBBapUT5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRBWSMAlZTCsvpTogGPqAszwZY1SkrIA8bVMwo1EkaodDdhwxGPrZ0/R/ksdiybq8VVpVZDYhvU2Ut/Qv/sSuacoEPcLdpfCrX2U7e51ZlHfshDx6/oi30n73GmhlR0Nw0E74fe3at/sHtbqi7jBXVBKVLVTzY9DSKfbaFYqtrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IT0ggGGC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26F7C116B1;
	Fri, 31 May 2024 23:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717196526;
	bh=TIq2oxFZ0F5FduDHYaUGP8LeNkvPsFc5NiUBBapUT5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IT0ggGGCjifOXXPJfY0DnkI9p3PEq9J1uGadB5fL0fcLg68IYmnIe896J2sd02Bv8
	 9WPJaUbR4043Uz6cqS/wfOqEKPXagsbo1ukaBSseB+CSfhBv0pu4lAVjaoZW/tJ83a
	 VtWQL4PFh44/8Dudk6XpnoHqC2oE8wYbRCXplStcASeSJ71aFyqBHOYym1ZOiNwKDt
	 PYwzZF56IgUxZuFP4Z/I+1V7wbkyiPZuMC2o4r6Mmd4MK+wuAGn3VNQ/rM/hk6+SfC
	 zE+bwl5caqjTpY4GGQTmxa8PIgfa2pF9TMkERbjIt1pHf7bcl2omjbyEgaZyPG3Ioo
	 1AK5calN1FIdA==
Date: Fri, 31 May 2024 18:02:02 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <swboyd@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthias Kaehlcke <mka@chromium.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, quic_ppratap@quicinc.com, quic_jackp@quicinc.com, 
	Doug Anderson <dianders@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7180: Disable SS instances in
 park mode
Message-ID: <ctmgikoes6p2sbvdxp3jmiseipzqsinbxjg7xewxl5jurh7r7w@s4lxchehtork>
References: <20240530082556.2960148-1-quic_kriskura@quicinc.com>
 <20240530082556.2960148-2-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530082556.2960148-2-quic_kriskura@quicinc.com>

On Thu, May 30, 2024 at 01:55:55PM GMT, Krishna Kurapati wrote:
> On SC7180, in host mode, it is observed that stressing out controller
> in host mode results in HC died error and only restarting the host

Could you please include a copy of that error message, so that others
searching for that error message will be able to find this commit?

Also, there's three "in host mode"s in this sentence.

> mode fixes it. Disable SS instances in park mode for these targets to

Please spell SS SuperSpeed.

Regards,
Bjorn

> avoid host controller being dead.
> 
> Reported-by: Doug Anderson <dianders@google.com>
> Cc: <stable@vger.kernel.org>
> Fixes: 0b766e7fe5a2 ("arm64: dts: qcom: sc7180: Add USB related nodes")
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 2b481e20ae38..cc93b5675d5d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3063,6 +3063,7 @@ usb_1_dwc3: usb@a600000 {
>  				iommus = <&apps_smmu 0x540 0>;
>  				snps,dis_u2_susphy_quirk;
>  				snps,dis_enblslpm_quirk;
> +				snps,parkmode-disable-ss-quirk;
>  				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
>  				phy-names = "usb2-phy", "usb3-phy";
>  				maximum-speed = "super-speed";
> -- 
> 2.34.1
> 

