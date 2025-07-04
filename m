Return-Path: <linux-arm-msm+bounces-63680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7070AF8E32
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 11:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F1037665EB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 09:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EAC28936B;
	Fri,  4 Jul 2025 09:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Gx5pkXyL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E162DAFCB;
	Fri,  4 Jul 2025 09:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620130; cv=none; b=lwmMyKf0JvfRdN6kQnvBZ6D0o7Am2PDznvhWQnBlp3yp9Zm+HjV06hGMC45V4pDLdVxXZ8vAG6lg+wVnupL08aCXt+Xm/W9WwrqCMqCvXUsWO0gE5r4ziWNAfR+dgpUgTQ3eYAFb2vS2mcXijVrnkS5/J9Z1KnTAMahIOTphsQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620130; c=relaxed/simple;
	bh=A/tOP4cJ2t1NZ8O1Dsh/+HuppAWTYNhyv8Wa6EMqDFw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k9Rzdxza/bb0enVkYgIthvQ21GHZvkv3DDschAcuzJZ+bUgTRYNfJjxehG9uLGlalS26d+B3cHRx0HV58edJOL2mKOQeh6rMQygClalUfvKdo66Q67fiyFW/V8NZ6sAhdl0bQ/OBnj/SSA1GLQ/iQQKWhjk/Y/hcqPeOz6HJ4NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Gx5pkXyL; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 910304326B;
	Fri,  4 Jul 2025 09:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751620126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tR1QnAR+tVQi5ONZkL2wcXGMP9Iltcj6/sbOx85efyQ=;
	b=Gx5pkXyL5tYAW1yK2OCfVrehUO9xUuN3+LjltFzIZD6opOk1iWuECnHh8/HZd+ZEw4MNmT
	jz4d/lngarwLDIxbFQKIjzVYtPOYI2HlPzrfBY5cSnadHEtYxymItYxVggkK6Fi7jvzM9X
	TBi1tGMsavBRjx8JrP0+9hQvYvaXMkcRSMy4ZXGTypaGAK4ramvkLt/4zYjbJQzRdGndOx
	PExNmWloL79Yvbj15ZvHBD+YY6tQrI3QDuLXp8KLi0BjSCeycC20E8pPRuQ12svhzLtdIn
	rsMiKYLGtf2relLc8cJC88sKTcnnw/Jsn6HWFwaUcrQh4HvH78PUNTlrATzBkA==
Date: Fri, 4 Jul 2025 11:08:42 +0200
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
Subject: Re: [PATCH RESEND net 2/3] net: phy: qcom: qca808x: Fix WoL issue
 by utilizing at8031_set_wol()
Message-ID: <20250704110842.51616179@fedora.home>
In-Reply-To: <20250704-qcom_phy_wol_support-v1-2-053342b1538d@quicinc.com>
References: <20250704-qcom_phy_wol_support-v1-0-053342b1538d@quicinc.com>
	<20250704-qcom_phy_wol_support-v1-2-053342b1538d@quicinc.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejfedtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehteevfeeivdekjeefkeekffefgfdtudetjeehkeegieelheekgfefgfevveffhfenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduhedprhgtphhtthhopehquhhitggplhhuohhjsehquhhitghinhgtrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpt
 hhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com

On Fri, 4 Jul 2025 13:31:14 +0800
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

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

