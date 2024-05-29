Return-Path: <linux-arm-msm+bounces-21007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5922B8D3F57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 22:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12D9D28A5B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 20:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86AA1C2339;
	Wed, 29 May 2024 20:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dJioNcsQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC7F13B290;
	Wed, 29 May 2024 20:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717013074; cv=none; b=pZq+KWOluAMWdRr5+ozKNF6EmPzIde/mF259jZZfUZ2DVH2e8bTP9XhGdTUBuLj+QKIfMhuokXTzLRqUqqQCAO0rVZWTQBugf6Bx4BxeC46sRXd0V46aTvTu0iG4qxorEvqPKXsqO0zLq5rdwp5wr7kflHsgojoDt1gtp05iodk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717013074; c=relaxed/simple;
	bh=fCNn7IfHYiOzuDTUVnSEiJ6oAZ7RajYcAuCjWzn1eC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lshm2UFTjdzFlW6ng3tR9ZCGnPJKXvQ6g1swqEAU1jXi5346H2Egz9yuCShFwKvMDEegmYk5tcNZU/XgzTTE0/culi2q2ll3O58fad2NUsuycn09Y7AfBh1KdlG2txBa9kDoGRj+MsWAw96HxOieKIUHl8tiugqYSM1G28jX4q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=dJioNcsQ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ji6jBdkqbxFp+OuQ43Vad4Fu8h64VsKVi9xqFhSvyYA=; b=dJioNcsQZXAchoX1u3Z0RRXz24
	IKDZp77Z4YGT1uctbu0exqw7hEpgGMUo2U4LksS6p6KiAbUwQbB3eHeJMEVWxTzdPlDZkt+Ib425y
	Jo2FDh9wzn8zWREigGcEoimGBekkEenTVCuFCOZXOY7cIyU7PTC/C82WHNEQq+Bfavpk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sCPWj-00GI0X-GX; Wed, 29 May 2024 22:04:01 +0200
Date: Wed, 29 May 2024 22:04:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jochen Henneberg <jh@henneberg-systemdesign.com>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: dwmac-qcom-ethqos: Configure host DMA width
Message-ID: <5044135d-5a99-4ea3-add5-08954f7a7809@lunn.ch>
References: <20240529-configure_ethernet_host_dma_width-v1-1-3f2707851adf@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529-configure_ethernet_host_dma_width-v1-1-3f2707851adf@quicinc.com>

On Wed, May 29, 2024 at 11:39:04AM -0700, Sagar Cheluvegowda wrote:
> Fixes: 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA address width")
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>

You need some sort of description in the commit message. How would i
know i hit this bug? What do i see as a user? You want to give a hint
to people looking at patches to know if they need this fix or
not. Also, you need to make it clear why this patch meets the stable
rules.

> ---
> Change-Id: Ifdf3490c6f0dd55afc062974c05acce42d5fb6a7

And what does this mean, in the context of mainline?

    Andrew

---
pw-bot: cr

