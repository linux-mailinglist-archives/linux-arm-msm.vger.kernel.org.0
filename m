Return-Path: <linux-arm-msm+bounces-89679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0287D3AA45
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 14:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1584230B8202
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30224369982;
	Mon, 19 Jan 2026 13:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ESSnzD+e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC515369210
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 13:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768829010; cv=none; b=jaJC1CVuTsC1NQ89o7o4BFUqR3jO1dpMh+YnWc/PrX1QLI/igvW3y7tqF3ZPK4woMyDfy+iRDJ9XFhRdlb83sPYg3WrHGhofiWMVtSzb1V+wT0nbDZlkclPW1GdaQ0nx32/9aTVtnAAkHoX9ud9NgtHWyXYcYv3vFkgZ2/uk2Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768829010; c=relaxed/simple;
	bh=2mMpGF31gxFSYAU1G+CVR79yzgpfZ2L1xziab/aUumY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUHObglHq7yV2VurzKaSe6QSn3+Q3FX5FxWWE6RnX1XSzT46w9Vmcl2VOCDbpNV7DqimCBS+jx72wdjkqz0qcgrvdIl5GyJYL3TcsBkSYkCPE3wyNmqpee1VwvaBPpCG7yw/7A2vxjWSJ1qyqldnyszTPRfy3ondwbKIFk1O8V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ESSnzD+e; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 471094E42176;
	Mon, 19 Jan 2026 13:23:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0CEAD60731;
	Mon, 19 Jan 2026 13:23:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8E70110B6AFE5;
	Mon, 19 Jan 2026 14:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768829005; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=KxedpuQaJ1XVwtqrotV402P4SEf92fFjf3lBHShSz7o=;
	b=ESSnzD+eNodO3pGQ2VSksmhDzLtD7Haf02tWs6UM3s/aJs+45FX3aI+D3WUocDRTjKq7Md
	8QGsn5A52b5/RW7IDBhL914t4h1n2Z/srz32S8oyBhriGrlU+VjUZSirqC0AJmnvg92bRl
	BzuT/6IaT9Hz2v9w4Sen77kLVMmJnVn+scvXb/5Hum5EiJCM8o07ElwOV8p2eGGfIpi0+9
	+lbbbKgtI4C53cf/Irpq2USu1GgbzJPfcqrvdKgsX+w7uNE5nPEoJMKC06UcyQNhELg26X
	XeqYLxf8d1c8+pvLsbp6FFEorRAqk8M1gd4aocJcRV7DCpLu53w+fHmBpJ+Fxg==
Message-ID: <2c5a7b0c-b58f-4b6a-9669-fde434f995e6@bootlin.com>
Date: Mon, 19 Jan 2026 14:23:22 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 11/14] net: stmmac: add struct stmmac_pcs_info
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
 <E1vhoSm-00000005H2F-1mve@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vhoSm-00000005H2F-1mve@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 19/01/2026 13:34, Russell King (Oracle) wrote:
> We need to describe one more register (offset and field bitmask) to
> the PCS code. Move the existing PCS offset and interrupt enable bits
> to a new struct and pass that in to stmmac_integrated_pcs_init().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


