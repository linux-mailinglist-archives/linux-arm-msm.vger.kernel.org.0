Return-Path: <linux-arm-msm+bounces-29491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A875C95F230
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 14:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DD76283759
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 12:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89EC117C990;
	Mon, 26 Aug 2024 12:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Dvis41ie"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6352C172798;
	Mon, 26 Aug 2024 12:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724676881; cv=none; b=YIMpNnV1eoHHu7B6vJKAQrBJJ81hKmh9ebS3sOLRZ9C/FuoNYAxgoFKlybez9gRwMJVMNEdzJAhCUkClTYOOurPnMBuXzvI/b5F6O0ANHpKessnqywcW4mxkPe/+avAR3erS6+20WyV8SG73WbPk943Mtui45f2krh5i99pbthI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724676881; c=relaxed/simple;
	bh=v88WBWfZpCdGdGKjwhtcFxY3n1G9uCQbsZZkbJ7RUPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kL3pPtgJGD5Jg4hu7wnZVTizqmlym6kIHNWHbTqPvD6ouZxwgUs03JFrEDB5cqLRUXgBaiR9O8Sqp1WiZIQYm1XTpj6nDWPO3szF5IMkU5x3CUPnvbftyoCE6u0ei6TnTaghe3gTjXcT5y7ne1RU6fLgWDtrp/CzxhjA6pCKTxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Dvis41ie; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CRtm2k1gp7t1K52GzLSjl2RYWVeceIa4paPrEJiXqdM=; b=Dvis41ieXGf3GZmZ8nlqU2mofv
	iqJgs/BcD5SiPsKrAUZm4LXcg9kuZI9klJoXzzSdrYrvtRV5DPwOSjH7LL2MGVZ3nARZri8snLsq6
	QPBwElAWuI/7JDeN8AX3tKKfPrY2vSeqCyFlAQA34yTSVhW+dFHpNA8ZJYypuiVCt8WA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1siZEu-005i0i-Ff; Mon, 26 Aug 2024 14:54:32 +0200
Date: Mon, 26 Aug 2024 14:54:32 +0200
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
Message-ID: <049ee7d3-9379-4c8f-88ed-7aec03ad3367@lunn.ch>
References: <20240822-qcs8300-gcc-v2-0-b310dfa70ad8@quicinc.com>
 <20240822-qcs8300-gcc-v2-2-b310dfa70ad8@quicinc.com>
 <bf5b7607-a8fc-49e3-8cf7-8ef4b30ba542@lunn.ch>
 <01c5178e-58fe-4c45-a82e-d0b6b6789645@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01c5178e-58fe-4c45-a82e-d0b6b6789645@quicinc.com>

On Mon, Aug 26, 2024 at 04:25:39PM +0530, Imran Shaik wrote:
> 
> 
> On 8/23/2024 1:29 AM, Andrew Lunn wrote:
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
> > 
> > Sorry, but you need to explain why. Why cannot the camera driver
> > enable these clocks when it loads? Why cannot the display driver
> > enable these clocks when it loads.
> > 
> 
> These clocks are recommended to be kept always ON as per the HW design and
> also exposing clock structures and marking them critical in the kernel would
> lead to redundant code. Based on previous discussions with clock
> maintainers, it is recommended to keep such clocks enabled at probe and not
> model them. This approach is consistently followed for all other targets as
> well.

I don't see why it would add redundant code. It is a few lines of code
in the driver, which every driver using clocks has. If you really
don't want the clock turned off because it is unused, you can use
CLK_IGNORE_UNUSED, along with a comment explaining why.

What i was actually guessing is that you don't actually have open
drivers for these hardware blocks, just a blob running in user
space. As such, it cannot turn the clocks on. If that is the case, i
would much prefer you are honest about this, and document it.

	Andrew

