Return-Path: <linux-arm-msm+bounces-37862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C289C812C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 03:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7EF6281E93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 02:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0344E1F26CC;
	Thu, 14 Nov 2024 02:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="OCovBEA9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBB91E493F;
	Thu, 14 Nov 2024 02:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731552724; cv=none; b=TBqPVtLNBfAgFYDXq2jX3DAj0+jEhEZqvtoR8VG5uV608FGKcmaiOT+mjUrUE8iKjsbipTToMQBE7OikCHL2HLPqYiWzemtIWcw0mm600lPA3ijOIz0Cv+6SQBgC9em69SJ57B7PXX570STjNGdw35tWd7GgA7N+SX6QAjrmg3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731552724; c=relaxed/simple;
	bh=+qD+aH+InC5FHeWW3WFdcSNbm9BzyYxnK18jSwWs1Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6LG+dsARysBcshh3ZvmVOgtLutEWYxgXsJ/N1tzIqGQVUd3xsdcum+e/dCFMOGSzzCHPrzLyBurkJvPvWiUfvZuEHoh96Te2fTTp+S7a4cDOGT5xW9JTdz+aIZX3tbDDQvzYxpuyp2WIGuedisrjzQF9a2Xwyf0E1SpXUHOb+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=OCovBEA9; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NbULr184rMs+0hKlTM2ECCrFBMN99AVDTkJ+fZktbaI=; b=OCovBEA9AdJJE0UpG1FQFiVk0q
	yb+h8evRMeH7xPTRSYHLwBSkNzJdKZ69WHNTaNzKlqixO7VOnFGIhB8f9g194MRZ6sMXERgoFOJag
	nWlSKhsWCec8Zg9tctPTkBCsrJGdQbvw2hQg9byF8f4cKoraAxrGX1TWP+s+Y2B28NMk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tBPxT-00DEkT-1w; Thu, 14 Nov 2024 03:51:47 +0100
Date: Thu, 14 Nov 2024 03:51:47 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH] net: stmmac: dwmac-qcom-ethqos: Enable support for XGMAC
Message-ID: <55914c2a-95d8-4c40-a3ea-dfa6b2aeb1dd@lunn.ch>
References: <20241112-fix_qcom_ethqos_to_support_xgmac-v1-1-f0c93b27f9b2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-fix_qcom_ethqos_to_support_xgmac-v1-1-f0c93b27f9b2@quicinc.com>

On Tue, Nov 12, 2024 at 06:08:10PM -0800, Sagar Cheluvegowda wrote:
> All Qualcomm platforms have only supported EMAC version 4 until
> now whereas in future we will also be supporting XGMAC version
> which has higher capabilities than its peer. As both has_gmac4
> and has_xgmac fields cannot co-exist, make sure to disable the
> former flag when has_xgmac  is enabled.

If you say they are mutually exclusive, how can it happen that both
are enabled?

To me, this feels like you are papering over a bug somewhere else.

	Andrew

