Return-Path: <linux-arm-msm+bounces-29130-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB34D95888A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 16:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C044B21E78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 14:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7395019408E;
	Tue, 20 Aug 2024 14:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="w3FRcgwN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA261922CD;
	Tue, 20 Aug 2024 14:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724162771; cv=none; b=p5WGlpSoqkGWENjk/hH7Ti7KXWEVaau4gvsuPlEvDHA/lt5g8ZHGQjcsByl2T37Hy9ErBC4x9IsTw2rm5VAVc3lre70x9hxmW5Qbf8JSq9y5GdBUVCN8N5FI2rkpQb5/1ePag+zhhRXDJYvzOs8KzF92yHA8xbw3nn2PL+CziIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724162771; c=relaxed/simple;
	bh=9gOvJxkyuNcwjkjB/DjAJ9EuvFjOEdaBEkYKQsoZ+w0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwOjBFP58n9WsIlAxuX5SeONovvBDgzbhMJCvwzO4Jo9Xktyt8YSn3pga3xhQbzGzVCi43csN9wnLgJ3cSq9147BtUIN4AJaaF5W84Td8FUNxGrwsLRcvp9C9NpdZylfHoHDUM1ZKHcFnWXr/l8OvIRPUguEpKiBlxrXJrFXGMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=w3FRcgwN; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=aBwtM7ry0exKaagPxt9MGTGB2xPl9mXToUPSwaqEOyw=; b=w3FRcgwN4IzbI050+qjcuAgaru
	nkIlIKxdfxgPfZPZJI3+9G3P7PlkVUpmVbrso7n6PZNk492u2KUhF7TpknKqLPNm6nIuheHpgB0d3
	lz38vxy9tGLIN9th0NtJIn6YSxQEL64uxm3rTZBNQ0LzUrC/Z0omJKdtuBkxj3Hi2Ha4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sgPUp-005EFD-Ur; Tue, 20 Aug 2024 16:06:03 +0200
Date: Tue, 20 Aug 2024 16:06:03 +0200
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
Message-ID: <a7afdd6d-47a1-41c7-8a0d-27919cf5af90@lunn.ch>
References: <20240820-qcs8300-gcc-v1-0-d81720517a82@quicinc.com>
 <20240820-qcs8300-gcc-v1-2-d81720517a82@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820-qcs8300-gcc-v1-2-d81720517a82@quicinc.com>

> +static int gcc_qcs8300_probe(struct platform_device *pdev)
> +{
> +	struct regmap *regmap;
> +	int ret;
> +
> +	regmap = qcom_cc_map(pdev, &gcc_qcs8300_desc);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
> +				       ARRAY_SIZE(gcc_dfs_clocks));
> +	if (ret)
> +		return ret;
> +
> +	/* Keep some clocks always enabled */
> +	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_CAMERA_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x32020); /* GCC_CAMERA_XO_CLK */

It would be good to document why. Why does the camera driver not
enable the clock when it loads?

> +	qcom_branch_set_clk_en(regmap, 0x33004); /* GCC_DISP_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x33018); /* GCC_DISP_XO_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x7d004); /* GCC_GPU_CFG_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x34004); /* GCC_VIDEO_AHB_CLK */
> +	qcom_branch_set_clk_en(regmap, 0x34024); /* GCC_VIDEO_XO_CLK */

Why cannot the display driver enable the clock when it loads?

	Andrew

