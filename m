Return-Path: <linux-arm-msm+bounces-94017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGBtLnVZnmkjUwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 03:07:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5620219093A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 03:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5A6632C1A93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 01:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B5228134F;
	Wed, 25 Feb 2026 01:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QEkcb6Tu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433F126E708;
	Wed, 25 Feb 2026 01:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771983770; cv=none; b=F9ahWSqJ21ft8wffzZjTj79dZp53x01ZUu4oGHv1XGmSnB5pAU1JGRntxCL1Tg4w9KObs3Q5mvRmx9R/VESsKtYOl5ZZZsp6DFbCzl/HnUWbleqMbx2RlWgnBdxm2Fr9TlplLXF+Va1QJpNNXTiEa50T5PXfXdPnvy1/hhg7+Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771983770; c=relaxed/simple;
	bh=/qQjUHwquTb5CtLX9o/HbDuVUMkNhBPNqviYoX0oBfw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ScKefGvqutiZeNQdpAgV/G/jD7KF25U2Hfl2cISFiydn/421jjNwOEenHmlPsXk/mKhf09vJxJrL/pTVPbOAxQ/yVNalPCUYVOl3b+tVfrN0Qb31YO9y36Sa8bJrL/ewwqSnjYb3h/qh9ncNSoJZkB6fbfq3uXFZA2gwYFlGd8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QEkcb6Tu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F808C116D0;
	Wed, 25 Feb 2026 01:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771983770;
	bh=/qQjUHwquTb5CtLX9o/HbDuVUMkNhBPNqviYoX0oBfw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QEkcb6Tuc0iKl2UxCSmBYbFxw6qntU3lrFUzz4BKQxVoE9/YYNWT13kCfD4+AhcOF
	 RNXlrph3ieqUNHcte7QZ87XLh2tsRGENgva3thu2q/nkJRKuE3q47jCIQkliGFm9Kv
	 sq1FfjwOOVMorQuiiicy7NWc1w2BvMPUqQIcQcGupVdgQ0pq4njJEbLAlx48vxgerr
	 oDaAVWjutWpizzMEuTlc7KgWABpP9CPrjhDQZjss2qV13HhaoTuiHE2Hz6J7E/FEQ8
	 7QThnNxxgGnhXAJSuXnN/ZYqUgNHMSLtIm2nrpf2ZPVoLDIE++SerUtJdGBy+OCh6J
	 fenqV6kLKwnuA==
Date: Tue, 24 Feb 2026 17:42:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Frank
 Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Mohd Ayaan Anwar
 <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 08/10] net: stmmac: qcom-ethqos: use phy
 interface mode for inband
Message-ID: <20260224174248.09dd1cbe@kernel.org>
In-Reply-To: <aZ5QmRjp_78ZT_Az@shell.armlinux.org.uk>
References: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
	<E1vuSL5-0000000AScX-2wuM@rmk-PC.armlinux.org.uk>
	<20260224171052.27bebff0@kernel.org>
	<aZ5QmRjp_78ZT_Az@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94017-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5620219093A
X-Rspamd-Action: no action

On Wed, 25 Feb 2026 01:30:01 +0000 Russell King (Oracle) wrote:
> It doesn't. The code ends up as:
> 
> 	switch (speed) {
> 	case SPEED_2500:
> 	case SPEED_1000:
> 		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
> 			      RGMII_IO_MACRO_CONFIG2);
> 		break;

SMH, sorry for the noise..

