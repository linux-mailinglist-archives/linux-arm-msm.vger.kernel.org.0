Return-Path: <linux-arm-msm+bounces-1594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB71D7F5263
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 22:15:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AB9FB20D2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 21:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203AF1C28C;
	Wed, 22 Nov 2023 21:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E959KgU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8231A27D;
	Wed, 22 Nov 2023 21:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 748A8C433C7;
	Wed, 22 Nov 2023 21:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700687708;
	bh=tX29cwq4HW2ZTQzwFFB4rNa+GB41wrnSmjmIQn6Gg9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E959KgU9SkJXN31p4CoiSoFMbt1/4mixRnb3ii4nBu8A1WjJfgKADIlw/4ob1B2OO
	 C2YiEz9grSlGSdayOaPCOmxT2duYcfB+4pdNVCGKJW3PEmzFt9LF/OPpmBoLkZEIyZ
	 DdSOuor0RqsN0PXu688gw3z8uc0RMaTG/hvbfr4h+jscQUVSNipFZ3C9MZlcpXlh1L
	 utkd7IFab0TsuoYQRgymLQiq4fx4G5OuLAUah8wAUR7PpwxAv0CvvCDPngDFwfS8DL
	 gKgUKN0gBkIcOfj2b+AuL6cYIdEKKmfUyQjOPIcdXSa8vT1rR8KS4H+4Z3zAzFGBxy
	 9PWmU8fF6JOpw==
Date: Wed, 22 Nov 2023 21:14:59 +0000
From: Simon Horman <horms@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 04/14] net: phy: add initial support for PHY
 package in DT
Message-ID: <20231122211459.GA46439@kernel.org>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-5-ansuelsmth@gmail.com>
 <20231122105243.GB28959@kernel.org>
 <655e452d.5d0a0220.61c31.01ae@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655e452d.5d0a0220.61c31.01ae@mx.google.com>

On Wed, Nov 22, 2023 at 07:15:06PM +0100, Christian Marangi wrote:

...

> > Hi Christian,
> > 
> > I was a little hasty in hitting send on my previous message.
> > Please find some more minor feedback from my side below.
> >
> 
> Thanks a lot for the initial review and sorry for the various warning
> you had to write about it. I know this was a new concept and that I had
> to discuss a lot about the DT structure so I was a bit relaxed in
> releasing OF node. Will handle all of them in v2. Again thanks! 

No problem. I'm never sure if this kind of feedback is appropriate for and
RFC or not. And perhaps in this case it would have been better to wait for
at least one more revision. So sorry for the noise at this stage of the
patch-set's development.

...

