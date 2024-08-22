Return-Path: <linux-arm-msm+bounces-29308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BF695BF44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 22:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A35C1C216E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 20:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED541D0DEC;
	Thu, 22 Aug 2024 19:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dD6kJZJG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D6B1D0DD4;
	Thu, 22 Aug 2024 19:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724356798; cv=none; b=Gm6zI00WXPy4CLTicPtvW/ZgMzwS+aSj6cemCQzmEJD3HeAyB/gnrCHYCGsw/5KdArfqZ8NMqw3VP19P1XYX7TsExzXBEf5MomMc3p3/Nub0Wcpf8roatSn91EGJF8kJ0NX8uWIP3X2IBMrBJyqvVkhKslhect7JSb4hGXCEpX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724356798; c=relaxed/simple;
	bh=jBkO5qhBZE1Eo4ADj3N6Ul4IbW+ARljKSut5JJfQXGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uA2NZl2HEMr3YFqkZp0oh2ZwO4gPnZL32iNJFLikpy26SEZpChAPov9e65Qa5HVKrcMJtc1JQkA6/lfAVpKetc1wZoa01K+i/uXosPfLRzeiN3bg7Q3JXg9PQ5g6aP+C3YitJ+m62dsn6psnwgVYZz5D85Dvzd0Si4JW+DScmIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=dD6kJZJG; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tFNNGh/KNaC2hf6KXw1cxUc96BM6VzspMmCt769Gxoc=; b=dD6kJZJGzqIgGioQoFYODjBUKd
	uzPvqUSTJSUIcLJeswYLjuoVlXeARDWNVD2fuTEssEzlQG3VehSzROgPJdtvEkgMr5Wh8Ql/x3b9s
	KMUR+qaDW2GP+x0gk06zkHZt5UsUM8nYjdOxzUK0WT5Org9rH3zfPunzPaQ8Q39PWtxA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1shDyI-005SvH-5a; Thu, 22 Aug 2024 21:59:50 +0200
Date: Thu, 22 Aug 2024 21:59:50 +0200
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
Subject: Re: [PATCH v2 2/2] clk: qcom: Add support for Global Clock
 Controller on QCS8300
Message-ID: <bf5b7607-a8fc-49e3-8cf7-8ef4b30ba542@lunn.ch>
References: <20240822-qcs8300-gcc-v2-0-b310dfa70ad8@quicinc.com>
 <20240822-qcs8300-gcc-v2-2-b310dfa70ad8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822-qcs8300-gcc-v2-2-b310dfa70ad8@quicinc.com>

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

Sorry, but you need to explain why. Why cannot the camera driver
enable these clocks when it loads? Why cannot the display driver
enable these clocks when it loads.

	Andrew

