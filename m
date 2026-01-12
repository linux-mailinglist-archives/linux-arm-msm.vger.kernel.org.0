Return-Path: <linux-arm-msm+bounces-88618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9E4D151A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 20:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E31530056C2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 19:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AF683019B2;
	Mon, 12 Jan 2026 19:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fPS3IxPL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9BF632;
	Mon, 12 Jan 2026 19:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768246880; cv=none; b=rzoKqMPa56MHKSNhEaNr9fepXKVJo9sIUNRYfCRbN4FL001VOqK5I1zJyRU/Kf46PKQ0Mmib5mvB/lOD5TH7teSiVa2KGn0hjBlt2P9ChlTYEwUeAEx76Jc/socIW6DGF5FfD0kWcrL+BWm1H5ejwx1ZH2HLcMQScEHg57CseWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768246880; c=relaxed/simple;
	bh=CpmZu7O7cGMk+rfEE+A9vvZSvkEmnurzn8/ZKV9rpyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rug4/39yqDoHWfRZvanhP6/H/Hze/i6ZG6M0FrU7OoEKvw6yTTVbJ1ryP/tBa7rOOXAGWPnE+v1Y5k7bIq1UuFFwZUIjFvWWCQsdqkkJpZpmvwTacsYkXpSAzH8SPfxnNWabhLuI1UG9MJI3TB8zJ26wc+hMD9Nb98NMeU6NnqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=fPS3IxPL; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NM5C7qyiUf+omAX954ZXByyVcNHloTHTbWgqrTe5zU0=; b=fPS3IxPLiVG1Fc8gVGqT/ADz1w
	FQFS8zYmG0ipq0/xvjQNUdWUvx74jk2bYwzbU9eKoy0vFJljti303UcfaEKpid3yMNBDnRo8Dfm6Q
	kBlRr/u5LG7SNOB3taEsupSqTF6bah741PQqRdJBmO1Omrmxh0X1XrDL1+3C5KWamKd0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vfNme-002X2X-W6; Mon, 12 Jan 2026 20:41:00 +0100
Date: Mon, 12 Jan 2026 20:41:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 1/2] net: stmmac: qcom-ethqos: remove mac_base
Message-ID: <fa4e6b2f-c038-475a-82de-ee5832078aae@lunn.ch>
References: <aWU4gnjv7-mcgphM@shell.armlinux.org.uk>
 <E1vfMNw-00000002kJ9-2XDx@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vfMNw-00000002kJ9-2XDx@rmk-PC.armlinux.org.uk>

On Mon, Jan 12, 2026 at 06:11:24PM +0000, Russell King (Oracle) wrote:
> Since the blamed commit, ethqos->mac_base is only written, never
> read. Let's remove it.
> 
> Fixes: 9b443e58a896 ("net: stmmac: qcom-ethqos: remove MAC_CTRL_REG modification")
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

