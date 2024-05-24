Return-Path: <linux-arm-msm+bounces-20418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C948CE921
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 19:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84B201C20E97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 17:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800EE12C47E;
	Fri, 24 May 2024 17:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="F6jCRNkA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C732912E1E4;
	Fri, 24 May 2024 17:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716571034; cv=none; b=CmHcQsXqoCq/VwsHDD6CpQC4JQj5p2hmtStyU8gyRUq0z/ZdgKzfZWeNGQOnnMXInYFrtHdxdYdPA9X6aEI5YBR1to1KVEEhdgbOahgWljVKGeqbLB4ALtqcJt9znw+TdX7Y9+CNXxGPIhu2sJxURJSkNZHjtjpDdB1NNG6B8sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716571034; c=relaxed/simple;
	bh=kHF4TokOoY3Lk8WrG+jPy16BkQBetgNCHYFl+EUqjWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YAKm4PbGvDSULP3KGlzVdIGhLS4M54VVkxee2uMKhLuVVQpdAHKbiRyY05Jy7UpzcsQ6wdwGzbfWkNaSAxlZhiE+q3JQT3xstnlPhI4zKPtThU1fH2ilLaozPZ2gDgijitkuF0+UKusGO+KbNv9B1xBxqGlejtZp7W1drEBv098=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=F6jCRNkA; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jDJOw7qJRLZUYuFrG/b6JHqnGqkFYvG+B4foAsiNrJo=; b=F6jCRNkAeaJkq2NUhcMJI0Mmka
	6ymkvq7KaMgUxlqdMrPHvCgwQbuX3qBAHgfuC2ScVX2mkemN945BudExvuVVhWuWdrIxmpLaMiqXe
	oWuaXmAv2dsyv1Q08+qM0lyDDBSk34O6uwYbPfm5Sf0SRwowLqFP0uEwk34BBijCMyt2CO+Uk0law
	URCdsGGRpB7gnCgw1NMiaIpVlfI2dVUwVjOG/FD8u0sUPeBzlkTA1Jvt+wl/YroFxasYFpTYMbdkI
	DiZFTx1bl/USay0EF3xZsGBEVxmNH6bEXsusW5f6lG1nFHoMp3Nawb5g8XHzPg4PWqNT+Lofr42BU
	HQEUA2fQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46940)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sAYXK-0005kG-2h;
	Fri, 24 May 2024 18:16:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sAYXL-00087f-7V; Fri, 24 May 2024 18:16:59 +0100
Date: Fri, 24 May 2024 18:16:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sneh Shah <quic_snehshah@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Halaney <ahalaney@redhat.com>, kernel@quicinc.com
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-qcom-ethqos: Enable
 support for 2500BASEX
Message-ID: <ZlDLixcieBBoWc1y@shell.armlinux.org.uk>
References: <20240524130653.30666-1-quic_snehshah@quicinc.com>
 <20240524130653.30666-3-quic_snehshah@quicinc.com>
 <a7317809-77a1-4884-83d8-2271ceea2c81@lunn.ch>
 <ZlDKrS0EhHgQPHAo@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlDKrS0EhHgQPHAo@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, May 24, 2024 at 06:13:17PM +0100, Russell King (Oracle) wrote:
> Note that this checks for !STMMAC_FLAG_HAS_INTEGRATED_PCS, so this isn't
> going to be used by this code which is conditional on this flag being
> set.
> 
> In any case, I posted a patch set 12 days ago, which has remained

Oops, forgot the link to the patch series:

https://lore.kernel.org/r/ZkDuJAx7atDXjf5m@shell.armlinux.org.uk

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

