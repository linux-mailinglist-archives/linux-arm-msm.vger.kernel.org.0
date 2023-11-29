Return-Path: <linux-arm-msm+bounces-2392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B12387FD30A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 10:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93190282BC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 09:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4E118658;
	Wed, 29 Nov 2023 09:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="iKqMrL15"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04AC21999;
	Wed, 29 Nov 2023 01:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CcnSaaDv4e59225OcHBi5h8IpHBaUHCJu6uN+JWRhkM=; b=iKqMrL15Y3c+chBt6nYsXTVcVy
	4TcIIrbTBlb/UxAuXv28YY5wPkSJca2gHJmFe71z1dtzk34Wr1ms4I50bp2aLYGw4eQXPGzJo8TVH
	oHdwoN4c+Q/UTBkXdVYF4hbxHGlXt9mrFrt6Bi7OpKw/9wpsi/54lvn1CLySRpqpQqkcBeoGIJFRH
	tU+8BJ7ruy69dOisq3q62FUMQK4r/S2t5XitNGR0gHDnHrTgi1X4myBTqNL3suKLPCrknbgYuk/we
	HmazE4S5uCTluc8o8nFR8b/zgXr0Yazzb5B2pQLCieA2LyYlffTopd20vJfQJydxlxGZ47lMhCNge
	k7oKz+wQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53222)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r8H7Y-00004y-17;
	Wed, 29 Nov 2023 09:44:40 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r8H7a-0003sr-EX; Wed, 29 Nov 2023 09:44:42 +0000
Date: Wed, 29 Nov 2023 09:44:42 +0000
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
Subject: Re: [net-next PATCH 10/14] net: phy: at803x: drop usless probe for
 qca8081 PHY
Message-ID: <ZWcICtVc0dBDi3pA@shell.armlinux.org.uk>
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-11-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129021219.20914-11-ansuelsmth@gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Nov 29, 2023 at 03:12:15AM +0100, Christian Marangi wrote:
> Drop useless probe for qca8081 PHY. The specific functions and the
> generic ones doesn't use any of allocated variables of the at803x_priv
> struct and doesn't support any of the properties used for at803x PHYs.

So now we have two different structures in ->priv _and_ ->priv can be
NULL all in the same driver.

This is getting rediculous.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

