Return-Path: <linux-arm-msm+bounces-2732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C437FF379
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 16:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4A44B20AD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 15:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5B6524B2;
	Thu, 30 Nov 2023 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Ry6PWNiB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E4C10FE;
	Thu, 30 Nov 2023 07:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+YOgP5+zO/Xow7+mzpfCfU7R635Z1roqLn/BuaW+ZFM=; b=Ry6PWNiBej04RlW4GoLjqg0VGv
	F9b05uv/VWYnmPr4988jICSkzGjpk3r6dtz0/hklmtnWzcgZxrpVt3ZDLceVpKmghaI24ws16SfMj
	ZL1x6OHD4St5A/8hOIvcisViE0ZzVUs+cqVpkCxwOiiNm5Ip/t98zVkwi8rVKeJI2JGA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r8irO-001fzA-2N; Thu, 30 Nov 2023 16:21:50 +0100
Date: Thu, 30 Nov 2023 16:21:50 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [net-next PATCH 06/14] net: phy: at803x: move at8031 specific
 data out of generic at803x_priv
Message-ID: <47df2f0d-3410-43c2-96d3-87af47cfdcce@lunn.ch>
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-7-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129021219.20914-7-ansuelsmth@gmail.com>

> +struct at8031_data {
> +	bool is_fiber;
> +	bool is_1000basex;
> +	struct regulator_dev *vddio_rdev;
> +	struct regulator_dev *vddh_rdev;
> +};
> +
>  struct at803x_priv {
>  	int flags;
>  	u16 clk_25m_reg;
>  	u16 clk_25m_mask;
>  	u8 smarteee_lpi_tw_1g;
>  	u8 smarteee_lpi_tw_100m;
> -	bool is_fiber;
> -	bool is_1000basex;
> -	struct regulator_dev *vddio_rdev;
> -	struct regulator_dev *vddh_rdev;
> +
> +	/* Specific data for at8031 PHYs */
> +	void *data;
>  };

I don't really like this void *

Go through at803x_priv and find out what is common to them all, and
keep that in one structure. Add per family private structures which
include the common as a member.

By having real types everywhere you get the compiler doing checks for
you.

As Russell pointed out, this patch series is going to be too big. So
break it up. We can move fast on patches which are simple and
obviously correct.

	  Andrew

