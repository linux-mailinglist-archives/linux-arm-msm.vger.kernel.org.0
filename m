Return-Path: <linux-arm-msm+bounces-44063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE53A0342C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 01:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D87416385A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 00:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC9F208A9;
	Tue,  7 Jan 2025 00:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPXvkd9j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAD0C148;
	Tue,  7 Jan 2025 00:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736211150; cv=none; b=Ex3EyyYau5yIhH1fO9Kaihg0hJyUAYOSKa4eg5JlXv2sjGkaVbIgc8GwZh0MAkufeub7B3mB3rjcRJoK3xAFbJOQSw+jl2Za3FqEUGGLpcqyAsEdEEQIIGOAIota6L6SS4Z/1eG4IlP+gR7RMHDbg8gPWXJjGn/MaETYlQxh5Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736211150; c=relaxed/simple;
	bh=7+6DdqgteBZqLCvaUC8715Bkx+RkdSf5/LheljtHJ3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPBqt6Gkpk29LB/a7I+njUetDo/WS9ksEPmXQZQaX67v7m7dx7sy94hgrucXmjoEBaXebjfbmPpXurgnH8Mb9xNS7Jb+uFD1ktRfxZpveUMamS6dMv7bZSYjKIzB2Bve4O7PLhT7FDE8AsP2PtUiJ+q9ovXMrjkyXFnUK9WG6CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPXvkd9j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C30C4CED2;
	Tue,  7 Jan 2025 00:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736211149;
	bh=7+6DdqgteBZqLCvaUC8715Bkx+RkdSf5/LheljtHJ3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QPXvkd9jpxmoV6klGXjFaCXtubKqLSACiQp/Tlyi12uFdfzolIm4wROPLIGrqvBSI
	 POytWCasMqxsBJTk/wsIrNAg4pBh+paVPjMkuwj3+BSV/EJQxpQf4PhM9eLCf05IE6
	 jaJwH1zhD+aR9kdqufx3VaujwPO0uokFfL+U00ELAnXtSR+4gEbC6dK8/HMrIcYuId
	 EzlYsWjZCxWje9SyyR1zH5YAYY79+jxsJjp1Aqm0L0aWHjuDRzrmLU+JWLsZ9AZSTY
	 z8B6QJm8WZhuwDt1GDpG1h5FKgxEyn7HB55r4XXA+LQgSCLc8Ntb4CAazN6FrjwzBa
	 qxiDuP9xJ5xcA==
Date: Mon, 6 Jan 2025 18:52:26 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
	Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vara Reddy <quic_varar@quicinc.com>, 
	Rob Clark <robdclark@chromium.org>, Tanmay Shah <tanmay@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH 44/45] arm64: dts: qcom: add mst support for pixel stream
 clk for DP0
Message-ID: <rqezansr45u4qu6xmrmqtugi5y2tjfuq4embv6ofeoatmc6be4@4lzsywehfk63>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-44-f8618d42a99a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-44-f8618d42a99a@quicinc.com>

On Thu, Dec 05, 2024 at 08:32:15PM -0800, Abhinav Kumar wrote:
> From: Yongxing Mou <quic_yongmou@quicinc.com>
> 

I'd expect "sa8775p" in the subject prefix.

> Populate the pixel clock for stream 1 for DP0 for sa8775p DP controller.

Please write your commit messages in the style expressed in
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Use the commit message to document why the code/dt looks like it does.
Describe the problem your solving and why.

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 0dbaa17e5e3f06c61b2aa777e45b73a48e50e66b..0150ce27b98e9894fa9ee6cccd020528d716f543 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -3944,16 +3944,20 @@ mdss0_dp0: displayport-controller@af54000 {
>  					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
>  					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
>  					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> -					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
> +					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>;
>  				clock-names = "core_iface",
>  					      "core_aux",
>  					      "ctrl_link",
>  					      "ctrl_link_iface",
> -					      "stream_pixel";
> +					      "stream_pixel",
> +					      "stream_1_pixel";

I don't see this being a valid clock-names in the DT binding, does this
pass dtbs_check?

Regards,
Bjorn

>  				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> -						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> -				assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
> +						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>;
> +				assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>, <&mdss0_dp0_phy 1>;
>  				phys = <&mdss0_dp0_phy>;
> +
>  				phy-names = "dp";
>  
>  				operating-points-v2 = <&dp_opp_table>;
> 
> -- 
> 2.34.1
> 

