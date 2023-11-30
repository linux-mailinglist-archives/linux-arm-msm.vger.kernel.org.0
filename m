Return-Path: <linux-arm-msm+bounces-2727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC397FF31B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 15:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41E6DB20B6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 14:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2445151C2E;
	Thu, 30 Nov 2023 14:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="p++TjUAA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9021A4;
	Thu, 30 Nov 2023 06:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9lXR2Yg+MNUQ5+GW3+sYqb86n0z6QZkAexRHWU1Q1cg=; b=p++TjUAA7fLFlJfwKW2/IShO2t
	0BbEnvTaq3SBg87GTrBHVVvR6jJwHVOHbRxiMly1MdbOb3LEsQxMNt4BYQOB4GgmjIdIA1J9KqtmF
	BSDylz30HG0LiJ1P1lDe4S0uaEAPacPb7qy2SzseVVXGcHpF6w82IYnLSg3ysAGwyBSQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r8iVz-001ftr-RD; Thu, 30 Nov 2023 15:59:43 +0100
Date: Thu, 30 Nov 2023 15:59:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [net-next PATCH 03/14] net: phy: at803x: raname hw_stats
 functions to qca83xx specific name
Message-ID: <1c5807a8-c17e-424c-98d5-3cf9c519123f@lunn.ch>
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129021219.20914-4-ansuelsmth@gmail.com>

On Wed, Nov 29, 2023 at 03:12:08AM +0100, Christian Marangi wrote:
> The function and the struct related to hw_stats were specific to qca83xx
> PHY but were called following the convention in the driver of calling
> everything with at803x prefix.
> 
> To better organize the code, rename these function a more specific name
> to better describe that they are specific to 83xx PHY family.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

