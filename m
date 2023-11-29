Return-Path: <linux-arm-msm+bounces-2397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C457FD343
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 10:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 433DA28308A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 09:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D6418E13;
	Wed, 29 Nov 2023 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="on5VUU3t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C16D6C;
	Wed, 29 Nov 2023 01:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QSUj5Hf27QAanj8NaPVwwZeZA3o2C5Q3Bi2HvrNaM/A=; b=on5VUU3tr5GEfHsjZFwUrgEY1l
	MDU8UIqQXuKAeIK+YVs7aaZFssQwkJ1FkdyCLY8JmKoftwt0BRgh934gGoX9IXCq6JpkLFV+b7bM8
	PVG7kB3MrJOH01NqxhGgwoEEhteJIM0egKh9PO1mfriK1uJo7KUH7qWvJ1vsvS9xRSLBRIWTrBJCm
	Ys9nS0PIh3g1SpOM3Ud5blZGmBwiwkL3h883a4QpF3bB2yURKxINOWNzxSQfW/WbVrL5aW5fJKeAU
	f5SQcivuyurfikG1g69lKQ9qowm1fPftvDZp0mUtGwVCwVGBgbdT0xPjUV6a+kbKB7UB25NSU/8WD
	3Bm5Z0eQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50220)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r8HFa-00005y-30;
	Wed, 29 Nov 2023 09:52:58 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r8HFc-0003t4-Ni; Wed, 29 Nov 2023 09:53:00 +0000
Date: Wed, 29 Nov 2023 09:53:00 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [net-next PATCH 13/14] net: phy: qcom: deatch qca83xx PHY driver
 from at803x
Message-ID: <ZWcJ/OgC1+cbFvhk@shell.armlinux.org.uk>
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-14-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129021219.20914-14-ansuelsmth@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Nov 29, 2023 at 03:12:18AM +0100, Christian Marangi wrote:
> diff --git a/drivers/net/phy/qcom/Makefile b/drivers/net/phy/qcom/Makefile
> index 6a68da8aaa7b..43e4d14df8ea 100644
> --- a/drivers/net/phy/qcom/Makefile
> +++ b/drivers/net/phy/qcom/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_AT803X_PHY)	+= at803x.o
> +obj-$(CONFIG_AT803X_PHY)	+= at803x.o common.o
> +obj-$(CONFIG_QCA83XX_PHY)	+= qca83xx.o common.o

These PHY drivers can be built as modules. You will end up with several
modules - at803x.ko, qca83xx.ko and common.ko. You don't mark any
functions in common.c as exported, no module license, no author, no
description. common.ko is way too generic a name as well.

Please think about this more and test building these drivers as a
module.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

