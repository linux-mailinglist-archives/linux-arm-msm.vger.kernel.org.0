Return-Path: <linux-arm-msm+bounces-63539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2E4AF771B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 16:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E8A93AF946
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3899A2E8E0A;
	Thu,  3 Jul 2025 14:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Of2qwTBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819971AF0B4;
	Thu,  3 Jul 2025 14:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552381; cv=none; b=fhkP+95t1/DpFTq51Ei0TlIziSOH6y5Pc78jj0TmCyumJHM0lMTzQiELNPvoaTaP40UNkL6vMI4FEizW6pM0a3jqSAzGQM/oKjsQAimyV/ihFHWRZMEt73MecQTHLB1UW+T+icl6QM6iTb7OjKVFszhSwb0Kd1Gt3paIe+nK/Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552381; c=relaxed/simple;
	bh=pWZZhlrHyymn+4w3dwdODDG8B22ypMJ54GuRBdehWiI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gM6WPAqij1XaslJbYZDVCRMntWTXAk2NMJHifQKWWjRkl9f7an06JJ/JvCSV36lWwC2EsyjocvbPmlPSO/SBmqNiQokokJaR7IPjgugIIAQ0AiOBUknMaLSXQe7clrEZ30ajtsJXjtQruFn137M8R3nMY7tYTJrNtGEO3IedLAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Of2qwTBW; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F4219441C2;
	Thu,  3 Jul 2025 14:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751552369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IjWgKjQu0yFZINgyODR7VkrxezJ5+shCU/FvlcHyDNo=;
	b=Of2qwTBWsYXCjv4qk1+iTz/SBmR7CaaZujQJmSXhszbByr9QvFpYf/ByyujGkxRPIaFuvc
	EIEcIGLWCrKqefjYGAgoYO2z9c2OYHELUXL/qaRsa2uEwwDAsIS2wUS8PBR/C+gjPd7WxP
	WDjhwGTPgEI2iZKcFNU6QwCWEl+U054QA8+pbo0u9MS/us9l+aDJzr/UCkZ0aQX918IttE
	RzYSHsWdbP7/CZr24YgNCkvz2yTuDcYqlnU405FbOgesd6DlmgR8ykeh71vE/O/fC5KyeO
	bjK02flFiCA2ZgtcbaTKYsM5tmsJyMLmls1nYQfxz34qJAXqkpAQN6Wmli3lFA==
Date: Thu, 3 Jul 2025 16:19:26 +0200
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
Subject: Re: [PATCH net-next 1/3] net: phy: qcom: move the WoL function to
 shared library
Message-ID: <20250703161926.3484b749@fedora.home>
In-Reply-To: <20250703-qcom_phy_wol_support-v1-1-83e9f985b30a@qti.qualcomm.com>
References: <20250703-qcom_phy_wol_support-v1-0-83e9f985b30a@qti.qualcomm.com>
	<20250703-qcom_phy_wol_support-v1-1-83e9f985b30a@qti.qualcomm.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehquhhitggplhhuohhjsehquhhitghinhgtrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghpt
 hhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com

On Thu, 3 Jul 2025 20:14:28 +0800
Luo Jie <quic_luoj@quicinc.com> wrote:

> Move the WoL (Wake-on-LAN) functionality to a shared library to enable
> its reuse by the QCA808X PHY driver, incorporating support for WoL
> functionality similar to the implementation in at8031_set_wol().
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

