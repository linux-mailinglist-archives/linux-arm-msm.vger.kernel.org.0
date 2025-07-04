Return-Path: <linux-arm-msm+bounces-63681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B38FAF8E20
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 11:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57CF417F0B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 09:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BB22EFD84;
	Fri,  4 Jul 2025 09:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AUl0daSu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3B32E8E03;
	Fri,  4 Jul 2025 09:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620155; cv=none; b=S2lGR2+M4nCZn6T1NH5IOcmrcKTpJwATVi1tSWMRW3IkTFVBXLJHuM2FkNa49GVY0bPL+Yg3UMH7pTSbZrFno9Nw02+MJQmqaqGuoOJm0ZnEvKyPzEobSLB4hrG1FsMiVu+i27ZuKxA+WkbDQrkB5hxPqaBGfXhr7ngUWPHwst0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620155; c=relaxed/simple;
	bh=v9k5hOGsBzFXPC68vIzdXKUVHTyMCdZHS5bgukRHvDo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KzcyWK8PMgQW3fTInqiEStUTsvu8oIKLntjUKIOF8NwSiIc+1VTOEF4E47pOED2KlEc62hhh74jFciLSSx1X8oMo1v3vh5tqoy++fLUFGcFgk7haPY4S0R+BHdpwpS7Bdn/WeuCB/v05M5f8+m/UYFvslzkIcbnXXNit/xTos10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AUl0daSu; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED10A4333F;
	Fri,  4 Jul 2025 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751620145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyYT35dsDio4qjJzYgyZ6hDdsGQEMgy8YZyDCLNTbXI=;
	b=AUl0daSuNSO1AriU1l6qpK47h2Gifi94b6WwPvM1CaNdkwczeQbdrxkm1F4tyMIcCX+3yL
	DntDNV5KdLnmazt2rUnYZhsrkZ01yjdtBTfK1nWOlI5SWZRVyF4YvpCdAXhqtznFlQx3kC
	rTuEjSPnJDaZv4Vdc9XdGz6hiROUlpHpWmBdRO3eVuwcaSUD8Fw9n4PtJ11UdkhXYSDk71
	Og0oO9Rg3Q8MZGXyzWT7tQ1Y+Hocu/v7UQp3oBNiWivHPaqjG1Cufir4WUClATpSE1obtk
	H8rVNVAjhs7WGfUFj09E60sj/DKkrzyo1ovWrNlo8JgcM41DfZdy3z0wIsRS7w==
Date: Fri, 4 Jul 2025 11:09:02 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Viorel Suman
 <viorel.suman@nxp.com>, Li Yang <leoyang.li@nxp.com>, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>, Wei Fang <wei.fang@nxp.com>,
 <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND net 3/3] net: phy: qcom: qca807x: Enable WoL
 support using shared library
Message-ID: <20250704110902.4fdef534@fedora.home>
In-Reply-To: <20250704-qcom_phy_wol_support-v1-3-053342b1538d@quicinc.com>
References: <20250704-qcom_phy_wol_support-v1-0-053342b1538d@quicinc.com>
	<20250704-qcom_phy_wol_support-v1-3-053342b1538d@quicinc.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopehquhhitggplhhuohhjsehquhhitghinhgtrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpt
 hhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com

On Fri, 4 Jul 2025 13:31:15 +0800
Luo Jie <quic_luoj@quicinc.com> wrote:

> The Wake-on-LAN (WoL) functionality for the QCA807x series is identical
> to that of the AT8031. WoL support for QCA807x is enabled by utilizing
> the at8031_set_wol() function provided in the shared library.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

