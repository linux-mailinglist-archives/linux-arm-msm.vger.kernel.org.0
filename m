Return-Path: <linux-arm-msm+bounces-89678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4D6D3AA33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 14:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D322B300AFF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4764736828B;
	Mon, 19 Jan 2026 13:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WL75Q6Jm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED355368272
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828843; cv=none; b=I8qj9WF5EMaNfyU7m3FKxoXnmxz4Z2uUxqG850N3aLTP7fNRdJ9ASTigU5rx+V95qnNHp6uAML+3pWUUpyzotyNtCGRkrhG2u0Fn84ogHTGdn4Ex3HTo3VFhr5wCzvBy7lXFiVC/XFW+KlkjY0OeZGv8Qdl0ReJ2oDGx7DY9cFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828843; c=relaxed/simple;
	bh=EQOm3MNiQSsW5rdGkmOFnTGQUr1SnAsHfKkJRxBdDhY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OCnYK84GrvnJ0sSZWegouNH8DC7TtPK78CZuE5UdoHZ3ZRxq3EhJRSarTTD78sDebl/Ry/CR99YKpkWsWVsJziNLN2BdWSSaA3QziTYH5JN66oicDjFzw8k1e4cwAoaiJJBF1eRcRK0uMnqkc7IL4FaSkR8ls9FzQYBK8d7nBiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WL75Q6Jm; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D6D7B4E42176;
	Mon, 19 Jan 2026 13:20:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA6D560731;
	Mon, 19 Jan 2026 13:20:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80CE510B6AFE7;
	Mon, 19 Jan 2026 14:20:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768828837; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=C88mVe4i3Z4l63ZcsasxWSNQLM5vvDv1/QRFfBQNgwM=;
	b=WL75Q6JmD/2Sm5piBoIA+v8gzFbjTwJz0lP7rJVdDU/Ayn+q92uePzNzCiiQNAK2CP8PRv
	ip3puZqFUHQg/9mIUqwTeSVahXjqKCGNhc/JiVR8jMg+ajzSzfDatEi0wQmTIp4Mq1xZ9z
	WvtLjHEhcnLeN2PVZCCdFgPXIqr20jYnFAVWKJJL8nPDPHvCz2VdqlrpDEyq0F3TWU2iA5
	YpKxcvARPFMLIs5De1S9LNSH57XWzurdG/MYqhgDwYsBj4xV4eyi4/nhu6/D2fufTQELal
	PeUDVjASw+xlDH/vuc62zUY42q5wgihzdX/qC9tWoWwh5m+oJRVc5Z/dSkALKQ==
Message-ID: <c6d88377-2b0f-4535-96b1-3eb01efef709@bootlin.com>
Date: Mon, 19 Jan 2026 14:20:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/14] net: stmmac: use integrated PCS for BASE-X
 modes
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
 <E1vhoSh-00000005H29-1LYk@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vhoSh-00000005H29-1LYk@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 19/01/2026 13:34, Russell King (Oracle) wrote:
> dwmac-qcom-ethqos supports SGMII and 2500BASE-X using the integrated
> PCS, so we need to expand the PCS support to include support for
> BASE-X modes.
> 
> Add support to the prereset configuration to detect 2500BASE-X, and
> arrange for stmmac_mac_select_pcs() to return the integrated PCS if
> its supported_interfaces bitmap reports support for the interface mode.
> 
> This results in priv->hw->pcs now being write-only, so remove it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime



