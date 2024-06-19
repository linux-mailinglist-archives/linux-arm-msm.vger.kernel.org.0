Return-Path: <linux-arm-msm+bounces-23283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9904F90F6FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51E631F22A3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 19:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A1815699E;
	Wed, 19 Jun 2024 19:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="4Lj2qla9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0206F2FA;
	Wed, 19 Jun 2024 19:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718825603; cv=none; b=RWwvZipf7fGu0tkKmgCn0UYbugsdnV1KtQhG7CK2ZsASCJYhzLmSkMHMwsiYVlH6PRaCD/AVGO8rx3i7SD5CKlZ64gvlEgvMllIt9bgclcANYh+y/y3u8nwnkMZ/BFX2kFZjszxy/RtfgLKSq1NqeCaS2wzBj/4u7srTqZ9nnxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718825603; c=relaxed/simple;
	bh=t+9pG7L19H5cIIL8VakYc+flI4kAUxptRkeVE1DSifI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxICan+odcgDxVIzCeU7W1Eu6zNNcish8z6NhijK+MXai+SDzwuIfHkqYYh3U85p3ldzwW5/hurqTKTTnOa96REHaasIETnMdz8qTO/R/L/cRgV5URPasnjM4bpjJwgmSaWBVNNKg3qf9+HnSvr4GxRmtbUvrdZGAYTJGTRTvSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=4Lj2qla9; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=txGgc0ufUqMJpkO4obOPQezVmkf/SFP+T8mUqlNNaqc=; b=4Lj2qla9XtvzJTF7AfZ8itDI1d
	uoWu2NjKlhgtAgT5ecVpZj5pjGGA3WyFfBdI97x8DLWjNnozmXWGAtyMEpDlhpa+rJJ3Vm1dRUUIX
	h12i64FE1KJLF6uw4PyF6UbPPjXRBmf+Y/EZpZVS9jep2jvpV3Or0paQc9Fr8hUx5/ds=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sK13I-000VFP-4T; Wed, 19 Jun 2024 21:33:04 +0200
Date: Wed, 19 Jun 2024 21:33:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next 8/8] net: stmmac: qcom-ethqos: add a DMA-reset
 quirk for sa8775p-ride-r3
Message-ID: <f4af7cb3-d139-4820-8923-c90f28cca998@lunn.ch>
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-9-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619184550.34524-9-brgl@bgdev.pl>

On Wed, Jun 19, 2024 at 08:45:49PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> On sa8775p-ride the RX clocks from the AQR115C PHY are not available at
> the time of the DMA reset so we need to loop TX clocks to RX and then
> disable loopback after link-up. Use the provided callbacks to do it for
> this board.

How does this differ to ethqos_clks_config()?

	Andrew

