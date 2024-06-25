Return-Path: <linux-arm-msm+bounces-24111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0C3916ABE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 16:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E20121F27C64
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 14:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007B516D9B4;
	Tue, 25 Jun 2024 14:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="iWLftwCH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FBE16D338;
	Tue, 25 Jun 2024 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719326417; cv=none; b=uGmD6hK4/b/9HsOQEQzScjoWDuAWfQWffO8cSFFsmYlZwa20kRe8n9JDw+sQ17Y3+J1DKXNVtLwf9krCFaiDrVPbVSVYIbRabbxljj1Y8c3jvpaLcazYjNzHaEu5M7mYlsezeFZppey6viQGqfZDo+P3RDfAKo4yfLUDeamyHHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719326417; c=relaxed/simple;
	bh=WMpS9YKstacr4OnFYut3CN0tpRysFfQ3lqxLynq2U0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBBNGOSGnKpHU34zNfeJzZzjyEv+HfqkQelIcACm/0Y8xrqMYait2wfot4X5Sp29iRJSG1ho0fi62KJrcizMA1TYAxGWrJl36tRPaKjbwNuVkp+BsrsN1EfyVGpx9c1VF/NtZLLAvN0xpeSOR+32AM7Lz1YgZX3EDJJRzTLdzgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=iWLftwCH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=80nITvdEQ3ZYPvCBhPBJbpPjyUAJJwEpoyVFLTx8G1c=; b=iWLftwCHU3mgob5NSxrjWbcBLU
	1k3dzkLaL2UqXjJaKmvaxpqVf+rRtTZ63JxAgP6S2VjPhEmt8IJU0PLvJJjJvtZbf3WbdabHGb7BQ
	Fkx79SrO/D3epZAFG0oCe/PACUMF+yqK1QcqAiFCvyXrkEW3cgT98Ppl55dPPokIGlAA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sM7Ks-000wy5-2A; Tue, 25 Jun 2024 16:39:54 +0200
Date: Tue, 25 Jun 2024 16:39:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Devi Priya <quic_devipriy@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	konrad.dybcio@linaro.org, catalin.marinas@arm.com, will@kernel.org,
	p.zabel@pengutronix.de, richardcochran@gmail.com,
	geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
	neil.armstrong@linaro.org, arnd@arndb.de, m.szyprowski@samsung.com,
	nfraprado@collabora.com, u-kumar1@ti.com,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH V4 5/7] clk: qcom: Add NSS clock Controller driver for
 IPQ9574
Message-ID: <f9d3f263-8559-4357-a1c6-8d4b5fa20b8c@lunn.ch>
References: <20240625070536.3043630-1-quic_devipriy@quicinc.com>
 <20240625070536.3043630-6-quic_devipriy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625070536.3043630-6-quic_devipriy@quicinc.com>

> +static struct clk_alpha_pll ubi32_pll_main = {
> +	.offset = 0x28000,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
> +	.flags = SUPPORTS_DYNAMIC_UPDATE,
> +	.clkr = {
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "ubi32_pll_main",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_XO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_huayra_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_alpha_pll_postdiv ubi32_pll = {
> +	.offset = 0x28000,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_NSS_HUAYRA],
> +	.width = 2,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "ubi32_pll",
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&ubi32_pll_main.clkr.hw
> +		},
> +		.num_parents = 1,
> +		.ops = &clk_alpha_pll_postdiv_ro_ops,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},
> +};

Can these structures be made const? You have quite a few different
structures in this driver, some of which are const, and some which are
not.

	Andrew


