Return-Path: <linux-arm-msm+bounces-92724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B57LxoAjmm0+AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 17:30:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 195E912F6F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 17:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF49D300B111
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074FB3382F7;
	Thu, 12 Feb 2026 16:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="x+pWO8Sc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334D6352FA4;
	Thu, 12 Feb 2026 16:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913605; cv=none; b=Ax70gfWUiLvkcNUBBvY7VZxRSPWBTfiIwky6uGWy9A4qkaN19ngqAvWRs8oMEmcBRyNBWS0+XJLTmkGWuCutpG21/mKhEcN7/l5bvAC0vXkgTi6tSAyqkOKIzgmrfD/JC7mZ0pLBbDh+vAQWYRZdI0KYuLK1+tkXmaPCrA0Yl28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913605; c=relaxed/simple;
	bh=IfJPTfD/j68xQystdzmnn1rusozs+rtcSj53lcL2wPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cV5kGN33QYJnH4D7gtXP5ECQoL7vk72b+EuJnzn39eF+k2S2rHdtOKL5Vgci+Amc5f11XWMQxm7PnK4GUMa3LT74MGUOkprWRMEEwLlHmfmLo9VM4vI2HebrMUHL4+6OVOiSB9OqD4pUzEmSoky4jw6A/z5oJWmX/TNsyAknWFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=x+pWO8Sc; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5C835C23D93;
	Thu, 12 Feb 2026 16:26:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1308A606B8;
	Thu, 12 Feb 2026 16:26:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19B7E11971BE5;
	Thu, 12 Feb 2026 17:26:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770913600; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Pygeso/hMqg/e8j/lPRGQdP2Dp2JrXGGOdwPzlOloJU=;
	b=x+pWO8Sci3e/vAkcG0CjCHE7+PpRiLbF8Bn2OgYjOb2QWHixHk8m224SX2FmhaxMN2YTki
	ZXXvaZOSAVIiC057uD5EHXXkQ5ksgMFhtPjxaS/0JERCW4C1wiSyLm/eKLOgyq4qJm2gi4
	X/nZ4tpbdoohYr8ooiX0EK3Wb368cbNzOLVVLocGqC+ChUF+KA3mdgruoknTprigpn1jVJ
	iKBHHX5N4njDB8/haIRWvmkXSoP31fcB9vG45UYgMj5wZY7Bit4NWzRtzEofo54S824nJA
	4My5gcpu5bSNfZPMER8wBsO2kJ9J4m5AGGeJVbPHcFVZoiusoq/YEnAPSK6I/g==
Message-ID: <3699fa56-6eb2-489f-bcb6-0ec7f020999b@bootlin.com>
Date: Thu, 12 Feb 2026 17:26:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next 6/9] net: stmmac: pass interface mode into
 fix_mac_speed() method
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKPL-000000093mf-2fkd@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vqKPL-000000093mf-2fkd@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92724-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 195E912F6F1
X-Rspamd-Action: no action

Hi Russell,

On 12/02/2026 01:18, Russell King (Oracle) wrote:
> Pass the current interface mode reported by phylink into the
> fix_mac_speed() method. This will be used by qcom-ethqos for its
> "SGMII" configuration.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


