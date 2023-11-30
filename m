Return-Path: <linux-arm-msm+bounces-2728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F08C87FF338
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 16:09:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D84491C20E58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 15:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0F451C45;
	Thu, 30 Nov 2023 15:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Yn/Jk19t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61AC21B4;
	Thu, 30 Nov 2023 07:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=D+LmC+1/RYTLpkFTwI8yb/n8Ew6AV+Cl7nqaIiFwlPs=; b=Yn/Jk19thhlWMIUF0bplu8nx6s
	4dc/ABz2PL5pQvTaKMGJP1xvVlD4KvnF7JdUyWac08oNceGczk3W2qFILgO/KM7Nv0cYtdeERRG62
	Xkd+8k6dlp12GXHbG+EN2bUzGEV3XuaYgkP0bYypD/sc9F7gdvZLyeZJSxTBQnf26qMc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r8iez-001fvP-Fe; Thu, 30 Nov 2023 16:09:01 +0100
Date: Thu, 30 Nov 2023 16:09:01 +0100
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
Subject: Re: [net-next PATCH 04/14] net: phy: at803x: move qca83xx stats out
 of generic at803x_priv struct
Message-ID: <987fe800-ea6c-44a0-9895-57feb6731b08@lunn.ch>
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-5-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129021219.20914-5-ansuelsmth@gmail.com>

On Wed, Nov 29, 2023 at 03:12:09AM +0100, Christian Marangi wrote:
> Introduce a specific priv struct for qca83xx PHYs to store hw stats
> data and a specific probe to allocate this alternative priv struct.
> 
> This also have the benefits of reducing memory allocated for every other
> at803x PHY since only qca83xx currently supports storing hw stats.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/net/phy/at803x.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
> index 4ff41d70fc47..3b7baa4bb637 100644
> --- a/drivers/net/phy/at803x.c
> +++ b/drivers/net/phy/at803x.c
> @@ -301,6 +301,10 @@ static struct at803x_hw_stat qca83xx_hw_stats[] = {
>  	{ "eee_wake_errors", 0x16, GENMASK(15, 0), MMD},
>  };
>  
> +struct qca83xx_priv {
> +	u64 stats[ARRAY_SIZE(qca83xx_hw_stats)];
> +};
> +
>  struct at803x_priv {
>  	int flags;
>  	u16 clk_25m_reg;
> @@ -311,7 +315,6 @@ struct at803x_priv {
>  	bool is_1000basex;
>  	struct regulator_dev *vddio_rdev;
>  	struct regulator_dev *vddh_rdev;
> -	u64 stats[ARRAY_SIZE(qca83xx_hw_stats)];
>  };

I agree with Russell here, this is the wrong way to go.

Maybe keep at803x_priv for all the common private members which are
shared by all variants. Add a qca83xx_priv which includes this:

struct qca83xx_priv {
	struct at803x_priv at803_priv;
	u64 stats[ARRAY_SIZE(qca83xx_hw_stats)];
};

	Andrew

