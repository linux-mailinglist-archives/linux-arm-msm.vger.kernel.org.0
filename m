Return-Path: <linux-arm-msm+bounces-97467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0C7SEEADtGnjfQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:29:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7980282FBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA6FC305DD54
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2143932D1;
	Fri, 13 Mar 2026 12:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Jlzc0EPa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECA6390C8D;
	Fri, 13 Mar 2026 12:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773404972; cv=none; b=vCa6PJS69eFK3Pl6FJ/rpkc1OgaZaL/pPw8yx9z+itzXK2FovQIjyXdd6ZK6HKCi+im+T2lEmWNKH/BMejMA4qUBDY0aovA/7Itl+TWfhaoc1wH0bVfPEI6403RgsjcPrE6WnTymuGxvPxj0TC5EspIOp3vupV//eS0gikGkMyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773404972; c=relaxed/simple;
	bh=Vh9SyJC2Jc75IfRVKO5JVPrr5yed63ZKR7MEfSfJnmw=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=rrAoVI6MoQXgXyhWfLjviWpjajLwTZW9oiwGkB49td/mbzleURA+skGI7cAkdIXkg07fITpzoxxiGKxovsPHSxhozvJtq1DAQVZp20WShbQor4ShXmfHHr1kKo4xJf87iA8Aryu1BV04n7L/LAyQVSBrUXA+2/2lXh+tvD8sbto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Jlzc0EPa; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vRGaB5Bliy2iHcTFd37O3KH9tuEgTI4zNfd/MVCkts4=; b=Jlzc0EPaTQkfwlAVNO7tQgXXTU
	UCbM7Ov6AZPC6L6GCTB68qoZ6pNXBJAAxIWNSOvl3za/8DFRo8YIZApTmpCVv4rYb0EHfRfwrK1JN
	Y1ONHe9PEL5icTP622tkoGDOQVPFyTaGWBl7zxHYr0Lqc7FNoGiD4ifkV00ZqR6g/HfSRP429r70K
	ILzTO5dZXGSDZ7ASzg7Jho6fv6mnHqq9bnzCX73dfHOISS2O9+yhriPX+o6vlu0i1L+4b80LdXwCQ
	uxDEgel7DWfYaGuMEIumISbfEEKKbNbkd7blAO8FpE6pIkDNrxMaA3+xkuz3arJE4pDsLr3/1dHMa
	UysVQT2w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47646 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w11dq-000000000vu-2e04;
	Fri, 13 Mar 2026 12:29:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w11dp-0000000DEiS-2epT;
	Fri, 13 Mar 2026 12:29:21 +0000
In-Reply-To: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 6/8] net: stmmac: qcom-ethqos: enable inband mode for
 SGMII
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w11dp-0000000DEiS-2epT@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 13 Mar 2026 12:29:21 +0000
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97467-lists,linux-arm-msm=lfdr.de,kernel];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rmk-PC.armlinux.org.uk:mid,armlinux.org.uk:email]
X-Rspamd-Queue-Id: B7980282FBD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

qcom-ethqos is manually enabling the PCS ANE bit for SGMII modes while
phylink remains in outband mode. With support for SGMII inband mode now
supported by the stmmac PCS code, switch phylink to use inband mode for
SGMII. Phylink will switch back to outband mode for 2500BASE-X since the
PCS code reports no BASE-X AN support.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f0e7a060ca73..a4571c0ee8b6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -765,6 +765,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	case PHY_INTERFACE_MODE_SGMII:
 		ethqos->configure_func = ethqos_configure_sgmii;
 		plat_dat->mac_finish = ethqos_mac_finish_serdes;
+		plat_dat->mdio_bus_data->default_an_inband = true;
 		break;
 	default:
 		dev_err(dev, "Unsupported phy mode %s\n",
-- 
2.47.3


