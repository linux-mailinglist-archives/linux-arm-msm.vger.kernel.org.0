Return-Path: <linux-arm-msm+bounces-29307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D74B895BF2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 21:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E5641F2426E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 19:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7448B1D0DCF;
	Thu, 22 Aug 2024 19:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="0R9kOd0K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6912B17588;
	Thu, 22 Aug 2024 19:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724356448; cv=none; b=tUeim9wexRNXCAtyC01xHIR7wCJdLyJuV4t/3xq2Zwfna+MM80dSq9glPboNHFtet9oMGQf+0sxp0zJ2f2alRrGYsAQeLn7N57+ra3G/rGYqyLRKTuFVcDb/ykzQNJWbQaqHGfEJKZQ1WpcC6iCA38zfvEdb2hXYgmnfilCqjto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724356448; c=relaxed/simple;
	bh=mInMAy/j0ihN/lveGbrOf6zwgiZEBJG9H0AnsxAaIAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxg4Ob8KMD8hnB9qilRUkSZAIiRHmWkHI/zHnOrZpeJkM8mdvnQSiZ3oHfGzaYBeG4/IfX3D3sxajk8JIZHuqd/O02Ki9h7HnF3M/uewfsVrr8e8J/tKXdwtT3O0Og/8POdVgGHrk0CQ5BP2kP6NRBqRqt98oiwe3fK3N8uF6II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=0R9kOd0K; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=SW7pCV4C6zuecNbSbYljhWhCjQHrYV8I/vosHF4OpvQ=; b=0R9kOd0KyAC+iXvHHY41LfQ6KB
	zM4mtxeN1aQdlyS/4mLzDJRpi9awnGq6JAnnQRhEiLrNWQcamiPNRl7fau80uKtaRxZT5pO1+aWio
	MohHWFtuig4rq7RMDfqG4tWEPH7Om9rP9u/LlJJWcy8wz86+4w8DBUlleC74EO2ju/+Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1shDsc-005Stk-LE; Thu, 22 Aug 2024 21:53:58 +0200
Date: Thu, 22 Aug 2024 21:53:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: Add support for Global Clock Controller
 on QCS8300
Message-ID: <13b66efe-ed51-4e62-a0ea-f2f97b4144e8@lunn.ch>
References: <20240820-qcs8300-gcc-v1-0-d81720517a82@quicinc.com>
 <20240820-qcs8300-gcc-v1-2-d81720517a82@quicinc.com>
 <a7afdd6d-47a1-41c7-8a0d-27919cf5af90@lunn.ch>
 <6016f2ec-6918-471c-a8dc-0aa98fc2b824@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6016f2ec-6918-471c-a8dc-0aa98fc2b824@quicinc.com>

On Wed, Aug 21, 2024 at 01:54:57PM +0530, Imran Shaik wrote:
> 
> 
> On 8/20/2024 7:36 PM, Andrew Lunn wrote:
> > > +static int gcc_qcs8300_probe(struct platform_device *pdev)
> > > +{
> > > +	struct regmap *regmap;
> > > +	int ret;
> > > +
> > > +	regmap = qcom_cc_map(pdev, &gcc_qcs8300_desc);
> > > +	if (IS_ERR(regmap))
> > > +		return PTR_ERR(regmap);
> > > +
> > > +	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
> > > +				       ARRAY_SIZE(gcc_dfs_clocks));
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Keep some clocks always enabled */
> > > +	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_CAMERA_AHB_CLK */
> > > +	qcom_branch_set_clk_en(regmap, 0x32020); /* GCC_CAMERA_XO_CLK */
> > 
> > It would be good to document why. Why does the camera driver not
> > enable the clock when it loads?
> > 
> > > +	qcom_branch_set_clk_en(regmap, 0x33004); /* GCC_DISP_AHB_CLK */
> > > +	qcom_branch_set_clk_en(regmap, 0x33018); /* GCC_DISP_XO_CLK */
> > > +	qcom_branch_set_clk_en(regmap, 0x7d004); /* GCC_GPU_CFG_AHB_CLK */
> > > +	qcom_branch_set_clk_en(regmap, 0x34004); /* GCC_VIDEO_AHB_CLK */
> > > +	qcom_branch_set_clk_en(regmap, 0x34024); /* GCC_VIDEO_XO_CLK */
> > 
> > Why cannot the display driver enable the clock when it loads?
> > 
> 
> These clocks require for DISPCC and CAMCC drivers for register access, hence
> kept enabled at GCC driver probe. The same approach is followed for all the
> targets.

No, the DISPCC and CAMCC driver should get and enable these clocks
before accessing the hardware. They should be turned off until then,
and maybe they will never be used if it is a headless box without a
camera.

	Andrew

