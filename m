Return-Path: <linux-arm-msm+bounces-90389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ho/Fgnpc2nhzQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 22:32:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EF27AEE7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 22:32:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8F173011A58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 21:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE562BE7AB;
	Fri, 23 Jan 2026 21:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="UUVNlVPj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BA727470;
	Fri, 23 Jan 2026 21:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769203958; cv=none; b=Qd/yOOrCZpvVZDFFFGYGjwnZA2gVvXV4shyb7fyS+EXKc9az1sxeczYhGz7YSokjNByYPTVCBrh98ZCQ9+PPOQZm1AtvMObDpQ2b2vMUynxK0UzlTeRK5Dqr6od4/qJDMPBXP/u1TJPA/wnCHziLRAnC58I47YINLbP/BJg/VQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769203958; c=relaxed/simple;
	bh=32WWXeXvRXXXnj/kZlQKkKu4K9vlUwiDPTb+2euqXV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=piyHC64LsUdUJUOOPj7WOCkaK8kTs9SWBtFxNHqAd/cga2Wj0pkiBEQXUqY1gzVZr7ftEtgVGsaxDqb6Gii0GmHcChcuwE3IGrJhECHxCeG+l/z0w2CoaoQ/PHH0YOM5KGOC4jUuQfcLpix+uUG7QuLW+KCdfdgDkMsr61XWYoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=UUVNlVPj; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=UId/Vzt9Vm2GMBalR/x7lGAofZBiET9NUSj2/ZXMbKw=; b=UUVNlVPj9g+71IhAhxMULD9ivp
	frh5NGpDhavuR+455fTIxq4AsTEpiUZgXVk0HasxdIi98K7k3RRP7N+iWhDyCxEh9lh11T4f9Ad/6
	PkHZeihli1kFmfs5qwHKvpHOI07TrNEtvK+ZiVmZWYLgSWU/ozx5M72kIR/jNtfHAXwDslutBShFe
	pDtmZQhMAitq6rtrK1c/pSRmDQKWohJzJiPduRvw6pp65OnOtiwP0qXgUQI70/XxvYTr+/9xdihQz
	SCxnjkqNlqsasxYT6+YN5G8i7Ydi2h2cdI7ifWwETuuMrq1coSffTwsc3dXpsHr9SK8DcpDFrtq8J
	hiXRr/4g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43970)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vjOlV-000000002YU-2dTD;
	Fri, 23 Jan 2026 21:32:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vjOlR-000000002QA-2jQL;
	Fri, 23 Jan 2026 21:32:21 +0000
Date: Fri, 23 Jan 2026 21:32:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <aXPo5R1Q-qWG3r3l@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,foss.st.com,davemloft.net,google.com,kernel.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,linaro.org,redhat.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	TAGGED_FROM(0.00)[bounces-90389-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.948];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E9EF27AEE7
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 07:05:00PM +0530, Mohd Ayaan Anwar wrote:
> 4. Switching from 1G to 2.5G - similar issues + a NULL pointer
> dereference. I am checking on the reason for it.

For the NULL pointer dereference, this is a bit weird, and may help to
point towards the issue.

> 	[ 1235.996004] qcom-ethqos 23040000.ethernet eth1: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
> 	[ 1240.517716] qcom-ethqos 23040000.ethernet eth1: phy link up 2500base-x/2.5Gbps/Full/none/off/nolpi
> 	[ 1240.529470] qcom-ethqos 23040000.ethernet eth1: major config, requested phy/2500base-x
> 	[ 1240.537642] qcom-ethqos 23040000.ethernet eth1: interface 2500base-x inband modes: pcs=00 phy=00
> 	[ 1240.546702] qcom-ethqos 23040000.ethernet eth1: major config, active phy/outband/2500base-x
> 	[ 1240.555441] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010

> 	[ 1240.880168] Code: d63f0020 f9400e60 b4000040 f900081f (f9000ad3)

This code line disassembles to:

   0:   d63f0020        blr     x1
   4:   f9400e60        ldr     x0, [x19, #24]
   8:   b4000040        cbz     x0, 10 <.text+0x10>
   c:   f900081f        str     xzr, [x0, #16]
  10:   f9000ad3        str     x19, [x22, #16]

which, after comparing with my disassembly, the blr x1 is the call to
pcs_disable() inside phylink_pcs_disable() in this code:

        if (pcs_changed) {
                phylink_pcs_disable(pl->pcs);

                if (pl->pcs)
                        pl->pcs->phylink = NULL;

                pcs->phylink = pl;

and the failing store is the one for that last line of C code - in
other words, pcs = NULL.

This means that mac_select_pcs() returned NULL when being asked
"which PCS should be used for 2500base-X" ?

This suggests that the SerDes detection of support for 2500BASE-X
isn't working, meaning that stmmac_mac_select_pcs() ends up returning
NULL, rather than &priv->integrated_pcs->pcs.

That would only happen if:

                /* Only allow 2500Base-X if the SerDes has support. */
                ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_2500BASEX);
                if (ret == 0)
                        __set_bit(PHY_INTERFACE_MODE_2500BASEX,
                                  spcs->pcs.supported_interfaces);

fails, meaning we don't set that interface mode for the PCS.
dwmac_serdes_validate() calls phy_validate() for PHY_MODE_ETHERNET
with the PHY interface mode as the sub mode.

Patch 3 adds the required methods to phy-qcom-sgmii-eth.c to allow
phy_validate() to indicate whether this is supported or not:

        .validate       = qcom_dwmac_sgmii_phy_validate,

and its implementation is:

        int ret = qcom_dwmac_sgmii_phy_speed(mode, submode);

        return ret < 0 ? ret : 0;

where qcom_dwmac_sgmii_phy_speed() is:

        if (mode != PHY_MODE_ETHERNET)
                return -EINVAL;

        if (submode == PHY_INTERFACE_MODE_SGMII ||
            submode == PHY_INTERFACE_MODE_1000BASEX)
                return SPEED_1000;

        if (submode == PHY_INTERFACE_MODE_2500BASEX)
                return SPEED_2500;

        return -EINVAL;

So, this should be returning a positive integer (SPEED_2500), which
should cause phy_validate(serdes, PHY_MODE_ETHERNET,
PHY_INTERFACE_MODE_2500BASEX, NULL) to return success (zero). That
should result in PHY_INTERFACE_MODE_2500BASEX being set in
spcs->pcs.supported_interfaces, and thus &priv->integrated_pcs->pcs
being returned for PHY_INTERFACE_MODE_2500BASEX.

Is the particular hardware you're running this oopsing test on not
using a SerDes PHY? If that's the case, how does it switch between
2.5Gbps and 1Gbps data rate on the SerDes?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

