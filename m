Return-Path: <linux-arm-msm+bounces-44821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C802A0AB04
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2025 17:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8730016542F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jan 2025 16:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44461BEF6F;
	Sun, 12 Jan 2025 16:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="d5hw8F+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D259E1BE86A;
	Sun, 12 Jan 2025 16:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736700451; cv=none; b=YMlTVabSJKZXSJo83yALTzFUbA8muhydWKXRxPShZEgFey0iBb7wKqdb/sXkCrstTfxSij6AeuiHmN0QeWspBDoONe6YiWo9gZ/3KWFT10ZTWZFu2eTg2SPfshpeysmwJ6Hb1GYdQswdX926UTaIOTw1V6bBsmpykJvZFZKnekM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736700451; c=relaxed/simple;
	bh=LgTd9SnJ5zOCjCSPCwLJ91mVfoh3V6sM4u9uLS0LZrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlVKH3Dm6biHsAMddx6eGloHtnFh1VZTLC/cVmhJI1wEPJTd0mGxAdjZVPJCXWwr4CI9P9dSUwL5fmCAhFU231hyf69Yqi0a4GFB95XZqdWDiV7rdRt5vKPoOV1bYArAiHWu+mU7QiieRMcc14/lTzmZgUnosHaOAH89qdeb2r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=d5hw8F+x; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4sen/KQvowlVDuXXQp6C1WU9Vh4kdtp0pCZBfFYVlVk=; b=d5hw8F+xTeAqzu4BiYHbCWkGBP
	atom2+LrfuHb383eByLuiMaRP0Wm8aBJeVo6zhtblFvwIfFHwWNlXyAV/qi1EDOxp8RUxdRkdZERt
	qDKR8+a5+MSbySi8vPZCqC28vfyssjmkcxal1QH4IJMTmnCB64OV2sj9Vm1dyOcT2Ndc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tX171-003q0p-8Z; Sun, 12 Jan 2025 17:46:55 +0100
Date: Sun, 12 Jan 2025 17:46:55 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arun Ramadoss <arun.ramadoss@microchip.com>,
	UNGLinuxDriver@microchip.com, Xu Liang <lxu@maxlinear.com>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
	Andrei Botila <andrei.botila@oss.nxp.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH net-next] net: phy: Constify struct mdio_device_id
Message-ID: <9dfeb860-3c0c-4f16-a150-fdce133281e8@lunn.ch>
References: <403c381b7d9156b67ad68ffc44b8eee70c5e86a9.1736691226.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <403c381b7d9156b67ad68ffc44b8eee70c5e86a9.1736691226.git.christophe.jaillet@wanadoo.fr>

On Sun, Jan 12, 2025 at 03:14:50PM +0100, Christophe JAILLET wrote:
> 'struct mdio_device_id' is not modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   27014	  12792	      0	  39806	   9b7e	drivers/net/phy/broadcom.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   27206	  12600	      0	  39806	   9b7e	drivers/net/phy/broadcom.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Seems sensible.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Is the long terms goal to make MODULE_DEVICE_TABLE() enforce the
const?

    Andrew

