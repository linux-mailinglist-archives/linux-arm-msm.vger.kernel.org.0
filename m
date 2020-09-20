Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F4D92711A2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Sep 2020 02:43:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgITAnB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Sep 2020 20:43:01 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:45664 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726707AbgITAnA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Sep 2020 20:43:00 -0400
X-Greylist: delayed 1431 seconds by postgrey-1.27 at vger.kernel.org; Sat, 19 Sep 2020 20:43:00 EDT
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1kJn4K-00FR2h-1K; Sun, 20 Sep 2020 02:19:04 +0200
Date:   Sun, 20 Sep 2020 02:19:04 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
        kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH v3 2/2] net: mdio-ipq4019: add Clause 45 support
Message-ID: <20200920001904.GB3673389@lunn.ch>
References: <20200918205633.2698654-1-robert.marko@sartura.hr>
 <20200918205633.2698654-3-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918205633.2698654-3-robert.marko@sartura.hr>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> +
> +/* 0 = Clause 22, 1 = Clause 45 */
> +#define MDIO_MODE_BIT				BIT(8)

How about calling this MDIO_MODE_C45

> +		/* Enter Clause 45 mode */
> +		data = readl(priv->membase + MDIO_MODE_REG);
> +
> +		data |= MDIO_MODE_BIT;
> +
> +		writel(data, priv->membase + MDIO_MODE_REG);

It then becomes clearer what this does.

Otherwise this looks O.K.

	  Andrew
