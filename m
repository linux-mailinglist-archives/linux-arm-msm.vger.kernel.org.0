Return-Path: <linux-arm-msm+bounces-73219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA4DB5424E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 07:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E18C16EEDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 05:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2392A2773D4;
	Fri, 12 Sep 2025 05:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SI7aETGT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5F41A2387;
	Fri, 12 Sep 2025 05:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757656590; cv=none; b=f3fdtlFolHgnbCrcRDEHq8nlmpSRd01598R7nf2RJGzkhed4PhBv3K54glYhk5zmiYdSNb+Rs6Epxi+5d7kDaIRaVAfR0b3I28SihMg0erO8yTzQ30D1qBu1/2cQ+JX2mV/cfuq21yrxi9JLwWIE3+aBRNQyFq3Te6hfiYgECBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757656590; c=relaxed/simple;
	bh=NoVcwhHFhGVy4YaFMNb6TmrHk9QeQ0TL+216knOdmWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t615ZO15zoHwgH8w5XQ2IuJ2J0CznrS19JGuSIMBi/Gg3r0arbJri+EMLaoOO2Ms1L/ErkeVxmOAcL7+xmdhVKs7PqumhITw1ukdI2tPQzWlsqhFx+uAMbf+1I+c1BH5SCja5j4Jc8KxDIa7xywgwj5BiacI6mHWZI5QxvTYiYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SI7aETGT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE472C4CEF4;
	Fri, 12 Sep 2025 05:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757656588;
	bh=NoVcwhHFhGVy4YaFMNb6TmrHk9QeQ0TL+216knOdmWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SI7aETGTzluOOEMW/W1Yf2oJIhfw+qt0AykEt+OlCHsqowZTUgxU7oUVaTUkzzR/c
	 S1/R6Tav6Ja+kIX74IpvNBe72B57B3Rz45ou78b0eQyKNT3cDrMC7zZesYtUvqe9Cr
	 AbCG9Wt1bQRpbLISofMxJZ0j5G665gshmHgrC+wRvp/ivLWmiP/uqgiaFpleqcbvVu
	 7nZzXWcwEjGHFHZmYSWkQe1m341Q3a+VRh0007c2KexS/xYDDhfkfbFPjC5eOhgZIw
	 FR4993IFUSHqxoxZx7UnDEC6cuYnDHzr2O8elUaYkEPrkTFnqoflalaQHHm1VBciyW
	 1YpSNXHxTRO2g==
Date: Fri, 12 Sep 2025 07:56:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: display: msm: Document the Glymur
 Mobile Display SubSystem
Message-ID: <20250912-beautiful-radiant-pheasant-72dedd@kuoka>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-1-d391a343292e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-1-d391a343292e@linaro.org>

On Thu, Sep 11, 2025 at 03:28:48PM +0300, Abel Vesa wrote:
> +
> +            mdp_opp_table: opp-table {
> +                compatible = "operating-points-v2";
> +
> +                opp-200000000 {
> +                    opp-hz = /bits/ 64 <200000000>;
> +                    required-opps = <&rpmhpd_opp_low_svs>;
> +                };
> +
> +                opp-325000000 {
> +                    opp-hz = /bits/ 64 <325000000>;
> +                    required-opps = <&rpmhpd_opp_svs>;
> +                };
> +
> +                opp-375000000 {
> +                    opp-hz = /bits/ 64 <375000000>;
> +                    required-opps = <&rpmhpd_opp_svs_l1>;
> +                };
> +
> +                opp-514000000 {
> +                    opp-hz = /bits/ 64 <514000000>;
> +                    required-opps = <&rpmhpd_opp_nom>;
> +                };
> +            };
> +        };
> +
> +        displayport-controller@ae90000 {
> +            compatible = "qcom,glymur-dp";
> +            reg = <0 0xae90000 0 0x200>,
> +                  <0 0xae90200 0 0x200>,
> +                  <0 0xae90400 0 0x600>,
> +                  <0 0xae91000 0 0x400>,
> +                  <0 0xae91400 0 0x400>;
> +
> +            interrupt-parent = <&mdss>;
> +            interrupts = <12>;
> +
> +            clocks = <&dispcc_mdss_ahb_clk>,
> +               <&dispcc_dptx0_aux_clk>,
> +               <&dispcc_dptx0_link_clk>,
> +               <&dispcc_dptx0_link_intf_clk>,
> +               <&dispcc_dptx0_pixel0_clk>;

Mis-aligned entries.

> +            clock-names = "core_iface", "core_aux",
> +                    "ctrl_link",
> +                    "ctrl_link_iface",
> +                    "stream_pixel";

Same here and in other places.

> +
> +            assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
> +                  <&dispcc_mdss_dptx0_pixel0_clk_src>;
> +            assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +                  <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> +
> +            operating-points-v2 = <&mdss_dp0_opp_table>;
> +
> +            power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +            phys = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_PHY>;
> +            phy-names = "dp";
> +
> +            #sound-dai-cells = <0>;
> +
> +            ports {
> +              #address-cells = <1>;

Mixed up indentation, keep 4 spaces.

> +              #size-cells = <0>;
> +
> +              port@0 {
> +                  reg = <0>;
> +
> +                  mdss_dp0_in: endpoint {
> +                    remote-endpoint = <&mdss_intf0_out>;
> +                  };
> +              };
> +
> +              port@1 {
> +                  reg = <1>;
> +
> +                  mdss_dp0_out: endpoint {
> +                  };
> +              };
> +            };

Best regards,
Krzysztof


