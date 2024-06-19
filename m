Return-Path: <linux-arm-msm+bounces-23281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E58AD90F6EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 951791F22D77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 19:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A18B15749C;
	Wed, 19 Jun 2024 19:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Z7I7pHf6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B3B52F6A;
	Wed, 19 Jun 2024 19:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718825242; cv=none; b=sYwf6kfUtZqQ0yVm1+COhmgsLRol35UfCYRLtWgiJKtdNp6MuFT9EUVWEwaw9ggKIqtca6pVfgtJyrqvsq99qu1nkUl5sIUHYOxVtMneUrWjoQikkmzo96v5086QsJav8g300vdOdheHtW/F+ndLSx19FWqNydz/FRNTAqOhh6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718825242; c=relaxed/simple;
	bh=mrEwoiN85cEXCRA5/bAJS6yDh+1Lt3cnK6VKkyTXeGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JJtdX5MIH6p6VMvpkPwA4yZn5/mTIv3i2ERez9V5I7JmdKB9vqvpbQCpmPdHzx1ao4f05jIKpRc74/reLVVPv/38xJkf6EWBAWcoHS3/qTLPdQrB1iG2HUckpW5/7cM/IbpHCJ+wrCDFmEcPZvSaGFhTH5g4aAiHj/NMl/S1gzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Z7I7pHf6; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=98QUa2MBu1c9AJb7JgnySQn5wRXa0aYdxlnVerBdhj0=; b=Z7I7pHf6C6+72k9liVbdB/X6Ta
	oDZO3zivPT+rkdbJbzOG6vrQCMrSlQeKr4NltnzCJpQEENcFSlIgA8pRwLM6HcEnkNaCWIIfuJdso
	wLqoiVycYZt23Tjqvi7xxfmi9QnSOwXIx0jLlLOGXDh5cQBsaMpUPm9smiipc6gV/3RA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sK0xQ-000VCV-6q; Wed, 19 Jun 2024 21:27:00 +0200
Date: Wed, 19 Jun 2024 21:27:00 +0200
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
Subject: Re: [PATCH net-next 5/8] net: phy: aquantia: wait for FW reset
 before checking the vendor ID
Message-ID: <44cf011b-ec81-4826-b7c2-1a8d57594fca@lunn.ch>
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-6-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619184550.34524-6-brgl@bgdev.pl>

On Wed, Jun 19, 2024 at 08:45:46PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Checking the firmware register before it boots makes no sense, it will
> report 0 even if FW is loaded. Always wait for FW to boot before
> continuing.

Please split this patch up. One patch which renames the method to the
more generic aqr_ since it is used by more than aqr107. Then add the
new use of it.

Is this actually a fix? What happens to the firmware if you try to
download it while it is still booting? Or do you end up downloading
firmware when it is not actually needed? Please expand the commit
message.

    Andrew

---
pw-bot: cr

