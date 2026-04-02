Return-Path: <linux-arm-msm+bounces-101553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLZsJ2uAzmkqoAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 16:42:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4F238AC0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 16:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8400C3006014
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 14:38:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B815E3E5593;
	Thu,  2 Apr 2026 14:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="PdGvsnb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B8B3161BF;
	Thu,  2 Apr 2026 14:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775140683; cv=none; b=YhWJaZkJZGt1FofFl4+wCuJ2BUTXclOywFY55a8mWumzyv3XmIQqa76CQi2xS5FsRk4mUtBY/YzsrxySHU+d5tM82URNypftUAxNXCCrq2HkErfIrfoNbrdKF5QFuBvdFVKIQHveNN9KIbPPa8bqvjvDDDcsAu61rithtDKOX1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775140683; c=relaxed/simple;
	bh=dpZvnezUBKU+C5cSkhP8bplSbzpzYDPwDTLI8dXhCqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4c4eDsizE5JZ0zXYGW7nCbMMQKsR3JK+P+rNBs+Adxnl50jPouKtPxzPhELf8QUF5KkqixWYTPVg2x+zsJFK3swxe4qE6kmSjgexQ83ol4oPyNfo0jjbHE0MMmv8A+6jIw4+4+/GWAA/5TVJP5ZMqnIco0zUF/mMQv/tU/7LvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=PdGvsnb1; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eglLKrveNJuj7YOcmdnYRMdVElmq6kVL9OzjVIGPajw=; b=PdGvsnb1gbCZELkYEOvXsBdgo3
	pxstB8JsTZnISW06js/AXkaTooQnQWt+WBKuQqCehMJU9pnAsm32Vs4AutzsTVrZJHfZLsvev30mt
	4mC9oBXgtWFugWpJ5Deg7kBR1L01IW4zS7JMCvFSqoBdCNBWw9DwCSdqZEJ8CrwzvpSWELrQRRdts
	QJKuHHK+CcVVgo3VfyUbRxI6h3/i8UAik0nzXVsRYEebECQueryJ2ANMQXZ6iea9mjyABtsSzIkkU
	6sj8650Uh8ssV+Dy/HjEMAwxmci/Tx8zsyaB2XFl8HDoJTOM76oXmvqIpSA0C5e6G3vN2q0AEAq5m
	poBIocag==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45144)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w8JB2-000000004Zt-1mLj;
	Thu, 02 Apr 2026 15:37:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w8JAz-000000005pB-2SHC;
	Thu, 02 Apr 2026 15:37:41 +0100
Date: Thu, 2 Apr 2026 15:37:41 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next] net: stmmac: qcom-ethqos: set clk_csr
Message-ID: <ac5_NVLeRZTYm2yR@shell.armlinux.org.uk>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
 <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
 <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
 <acw1habUsiSqlrky@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acw1habUsiSqlrky@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101553-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_SPAM(0.00)[0.323];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,armlinux.org.uk:url,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 9C4F238AC0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 01, 2026 at 02:28:45AM +0530, Mohd Ayaan Anwar wrote:
> While I had made an identical change while retesting the PCS series,
> I was holding off on posting this patch for the same concern - what
> if some boards fall outside the 50 - 100 MHz range.
> 
> After some digging, the AHB clock appears to operate within:
>  - 50 to 100 MHz for lemans/monaco derivative boards (2500BASE-X
>    interface)
>  - 30 to 75 MHz for boards with an RGMII interface.

That's ever so slightly annoying, but it makes no difference for the
divisor selection.

CSR_F_60M is a divider of 42 giving:
	714kHz  @ 30MHz,
	1.19MHz @ 50MHz,
	1.79MHz @ 75MHz,
	2.42MHz @ 100MHz

If we were to use CSR_F_35M, that would be /26, giving:
	1.15MHz @ 30MHz
	1.92MHz @ 50MHz
	2.88MHz @ 75MHz (exceeding 802.3 spec)
	3.85MHz @ 100MHz (exceeding 802.3 spec)

Given the RGMII range, to stay within the 802.3 spec without knowing
the actual clock rate being used, CSR_F_60M is still the only possible
selection, even though it gives an extremely low clock rate for 30MHz.

I believe you said that firmware can change this clock rate dynamically
at runtime which makes it much harder. If there was a notification from
firmware into the kernel that the clocks had changed, and that was
communicated into the clk API such that the appropriate clock input for
stmmac, then we could look at updating the divisor.

We would need the firmware to give us a pre-rate change notification
and post-rate change notification (and be guaranteed that there would
always be a post notification after the pre notification) with that
coupled into the clk API.

We'd need stmmac to hook into the clk API notifier infrastructure,
where the PRE_RATE_CHANGE takes the MDIO bus lock to wait for any in-
progress transfer to finish, and then block further accesses, and
POST_RATE_CHANGE update the divisor, and finally both
ABORT_RATE_CHANGE and POST_RATE_CHANGE releasing the MDIO bus lock.

With firmware telling the kernel what this clock rate is, the manual
setting of priv->plat->clk_csr goes away.

Maybe this is something to consider for the future.

> If a future platform exceeds this range, we could switch to something
> like: plat_dat->clk_csr = data->clk_csr, with each EMAC version
> selecting the appropriate divisor.

Without firmware telling us what the clock rate actually is, that's the
only solution.

> Due to some urgent work tasks, I am still finishing PCS series
> testing. I will provide a t-b once done.
> 
> In the meanwhile, please feel free to add:
> 
> Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Thanks! I'll submit the patch non-RFC shortly.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

