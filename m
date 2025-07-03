Return-Path: <linux-arm-msm+bounces-63540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A620AF773F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 16:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3944D1676DF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668F52EA14C;
	Thu,  3 Jul 2025 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ndo5O7EO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07B22E9EAD;
	Thu,  3 Jul 2025 14:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552609; cv=none; b=M4gSsRvUPgOf4znMMHqbbhv4WDUAbAaFXe1kGFc892GHOVyqbu3k2a0UCODhHSfCCtoSQornwMyuMDALRIgvvjnmLh9vR2ZcyvfWPE1CE4jL7KP4j8l1Ax5DyeNu/GFvAp7DIl+TYEAm8WTgv8/chaokNttxOHd/5dsc0yjCOGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552609; c=relaxed/simple;
	bh=DsT1McTIJn1Yv3Pa500TRPiaOVwIRXvnvgb+DjNqVZI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PQlI62BjTJm9GnWT1XTAfOH4YTXlH0eBZLwpAMtY/ZdHl+wmMZYsaD9aoKJjxgTfZi9cN8la1BvKOS+ymCxqJxgasZ1T65Q8/lnPMF1IsBwsGwEijWmj7V4eNifyN5H+PN8lrF1/IqtjleBwnxpw5Kg3Jh//99/on/VE3aNs5bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ndo5O7EO; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BCB942FD8;
	Thu,  3 Jul 2025 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751552599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVq0HLVAFhy9BOeh2BTtxPYptG4uS2APmgxOi0kYu4I=;
	b=ndo5O7EOsDnQQL5cHo4USKg9LDhHFu0nQQBKV/8HivPpQsp2Cg66ZFySKG9OA3eg7NNcl/
	eiIX1sPx8gRTh8fN2blyRjoqmuJ3ZX9SJCl+HaJ/lzet+a4WxTSfp2JWuG8SmDviiM4B5K
	jQ5krYY7qaem6PWw6F1ydw/fbgjvY5g5CYw3Px6rDfLYRZVhDiMliHl2VCQg+wlWIBkkUJ
	eOX5crjgbQgA5lL8kVXeZor//5Hl9gDA2yuma2iNhfEG6muPnhKistNQ4L6ggu/B/0F+Mk
	J6bLm5ooI1RkDXxtGFVmROE1pyC2TNbD9u5BSztqkwH+m2WoEx2escGU5GEJIw==
Date: Thu, 3 Jul 2025 16:23:16 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, Viorel Suman <viorel.suman@nxp.com>, Li Yang
 <leoyang.li@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Luo Jie <luoj@qti.qualcomm.com>
Subject: Re: [PATCH net-next 2/3] net: phy: qcom: qca808x: Fix WoL issue by
 utilizing at8031_set_wol()
Message-ID: <20250703162316.32a9d442@fedora.home>
In-Reply-To: <20250703-qcom_phy_wol_support-v1-2-83e9f985b30a@qti.qualcomm.com>
References: <20250703-qcom_phy_wol_support-v1-0-83e9f985b30a@qti.qualcomm.com>
	<20250703-qcom_phy_wol_support-v1-2-83e9f985b30a@qti.qualcomm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehquhhitggplhhuohhjsehquhhitghinhgtrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpt
 hhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi,

On Thu, 3 Jul 2025 20:14:29 +0800
Luo Jie <quic_luoj@quicinc.com> wrote:

> The previous commit unintentionally removed the code responsible for
> enabling WoL via MMD3 register 0x8012 BIT5. As a result, Wake-on-LAN
> (WoL) support for the QCA808X PHY is no longer functional.
> 
> The WoL (Wake-on-LAN) feature for the QCA808X PHY is enabled via MMD3
> register 0x8012, BIT5. This implementation is aligned with the approach
> used in at8031_set_wol().
> 
> Fixes: e58f30246c35 ("net: phy: at803x: fix the wol setting functions")
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>

If this is a fix, you should target the -net tree instead -net-next :)

Maxime

