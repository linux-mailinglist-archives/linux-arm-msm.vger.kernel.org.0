Return-Path: <linux-arm-msm+bounces-24523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A4C91AF98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 21:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25B581C22A1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 19:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C1819B3D8;
	Thu, 27 Jun 2024 19:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jqZY+usY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEBF200DE;
	Thu, 27 Jun 2024 19:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719516278; cv=none; b=Cfc9C6a+M70G4BBKVlv2c//+OvM+sEbxB2GB2DF9/9lEbxaNqJaYanEAB7Lb/sF48yBPg53wlaAiu9XW8LlYku/gQZOU9e2ZJRICHpxi3GFxuqB+NAGlxNXXs2rlNaN/SzRrFklIWQT8VNozcj4QRp3GrdVQ8QRM8tKlJkHGWa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719516278; c=relaxed/simple;
	bh=ByWy07f9rUggWN9DLwEaBmr1GuYoIk8YDAPbU9bHcps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzXdQCxF3Dphn0II1YU8VJOevIF9QtANQHG8TPQ5QEI9SssSOFMfEPJxhat87y+7SPDeW5ckLQmCMDwLUglZsZqp6AG6KdBRR5CtmDkK5waQoebjXrT0anfVJ9+JeVymBLQNX1LW/Da8w2VsgTTR1th7gQ52E34xW818Y+V1OQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jqZY+usY; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MIJerN91KOAahfx//F9cleyCTP+2uS5vcbZ0p363Ojc=; b=jqZY+usY9iPuJpXu55zsW+kvaJ
	ikF+PmQHCkXwNKbFueAJfrQ/SJ/gbKnlDTRECR6vCQevb2rChvhqfEJ3mUgspq5VOpBsPjCEJx0T2
	jdin0vKrxJ5BxL1twXhIqC6OwVgALQbDDiE7ts5FUZa31S9yAx9bs+FM8B6VKp9GdKGk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sMujE-001CdD-L2; Thu, 27 Jun 2024 21:24:20 +0200
Date: Thu, 27 Jun 2024 21:24:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 net-next 2/2] net: stmmac: qcom-ethqos: add a
 DMA-reset quirk for sa8775p-ride
Message-ID: <4f642463-3a8c-4412-a007-42fb65c4276e@lunn.ch>
References: <20240627113948.25358-1-brgl@bgdev.pl>
 <20240627113948.25358-3-brgl@bgdev.pl>
 <td5jbseo7gtu6d4xai6q2zkfmxw4ijimyiromrf52he5hze3w3@fd3kayixf4lw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <td5jbseo7gtu6d4xai6q2zkfmxw4ijimyiromrf52he5hze3w3@fd3kayixf4lw>

> Its not clear to me though if the "2500basex" mentioned here supports
> any in-band signalling from a Qualcomm SoC POV (not just the Aquantia
> phy its attached to, but in general). So maybe in that case its not a
> concern?

True 2500BaseX does have inband signalling, for the results of pause
negotiation.

However, in this case, this is not true 2500BaseX, but a hacked SGMII
overclocked to 2.5GHz. There is no inband signalling, because SGMII
signalling makes no sense when over clocked. So out of band signalling
will be used.

My understanding is that both ends of this link are not using true
2500BaseX, and this Qualcomm SoC is incapable of true 2500BaseX. So we
don't need to worry about it in the Qualcomm glue code.

However, what these patches should not block is some other vendors SoC
with true 2500BaseX from working correctly.

     Andrew


