Return-Path: <linux-arm-msm+bounces-105508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id TWMJIJbN9GkAFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:58:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A574ADCEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3DEDE306559F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5933D3485;
	Fri,  1 May 2026 15:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Z5pLDII9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A563D6682
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650880; cv=none; b=ILI3HZaOX/3GDU7i2XBETh/+RjpkQvt99XlxbVbTk0GxoI5iLsq3iYYptpRejqx0QtyOggKm4TYlFlQs9N+aS3szyqS4VCL+xqM6tNNjgLFraM87aN/nVFvBZH69LDoD+8QGNUn3AWSQ1DbBagVYNAxn5IbQyjKzyyrMvaO7SSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650880; c=relaxed/simple;
	bh=vSMz0fMwD5nvE28rW2N/JHi9BJvlZF2OiadS95iYJ7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ce6D7cZBOAe2NhpquiNI7ylFF5VOpfnzb2josi+J1oH8Mly04g6/2djKMVk2C52s2cMG2yI1zXBm7UU3497UA01evq7Iglgy0yl7ckXNyjeXeJv+VdEfAHa/BsXi2eYP5dd3BlrufwQFi468H2LPXB0KHc8LbQ+xBBrs6tK/hM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Z5pLDII9; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8aca6bd57cfso18494966d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650878; x=1778255678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVr8Clh+n9i4UIz8+5GUPFBuftN5UkiMGfqWWtAa7So=;
        b=Z5pLDII9inAZIYRk3mHwRycVsXtkdv+tJIEvThfg1icNH8qCTRn+9tTfuMPeovkW7P
         aQyfaIEH442Fs0eM8ndBTO2CA74qq3PvbpncoYETsKlrO1XAZ+Aa/TUPukzfqc0z42dg
         bjLWAYawkJmCx/oTfbXnbGm1HowNQ1loVD+lWT9od8pPZFGuQmtJJn10620MKicg1cXp
         brPPS5wXGQWUUmaMzR8555yBCFcstfLYTEsZN6RqjSP+ev8ympE/3h8ThKfQfkvZoZ9G
         nHyRUL0Afm51WMx/9vtY0l+lbCP7perMn1H3HIk+UUBm8ab9lrekzEb3fdpREmkWP5Y+
         4C/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650878; x=1778255678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aVr8Clh+n9i4UIz8+5GUPFBuftN5UkiMGfqWWtAa7So=;
        b=HT/5+eBDKwfDUdVr/zGnPipW21f8yM6C4+8etTZQTBsG2pMwgVDd529LCP864Z1v1d
         jXpuoHDc/CGvAtjXs1IGgOpskrTA8rtMMYZHi9+dnmPr+o47Cwv56pY95DO92dK3OstB
         M2zG2h0sS9v5SdED83iX4z6JvAbA4XL13uUi/tTpZ10WVTEm9SNcxFenCNbmt5N7lpCI
         taSR0zj9omV+pQmeXlxia5MM7XRKcCiP3g2rvm2vuVYkLd1zz/Wow8xXVMS4yFC1fbHb
         XPjNQwcuje1UUSnrsuFO0ptQlsc+ovAGzxSCdVzmdKhJRqw3xWW1ODyBke6UQkH5CGXC
         xhKg==
X-Forwarded-Encrypted: i=1; AFNElJ+f1m3Xs4w+KWwu/WJpvcmaofO9A3E64P8V+mogy853uESEXe/ndolM5tdy+huonXaX8Z/lEfdHEieB1tvA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ZHdsFkk6s6eosjMZQwDSVuHRuw01Vl3IAXNgy7XN5PsHRf0R
	eO7sppvId3Gkj8c2XwHjx4Os+w765ATOcuWit30brDjDg8Q0jUy4EyHPfOptAVP3Gws=
X-Gm-Gg: AeBDievJ1BeA+x2w+VflGgJK4ntauDoveulIBIrFIg3PN3E7FN5JfNw8uKlDuf8mhax
	2anYhMguWDei/9lwpI2WeZkpacItrJUyZr4ySaf6dIw+JkmgZaOQqvjMkneqZMQAYe6ly5StgHV
	aQ28JISzrmvg88/m2AUL1kBqjC9OlZhPFptxli9LADt8nGsUHVkjpPrIsNZYhqekkxm0iqS8Cqt
	Q+uakswo6R+72z+yOFfgjYBEPJ5Hya6aR+OdTRVYWbUbIsVHpume++hhYr/M7j4t8O2Ubb+/msX
	KZzXNOtr9SaeIbvcST01dyBi0gIA/416ERtLWwwRn05Meu6kKsXXBLvOh0s+oQR3mdaexiNddnE
	JTS+CQqaS0XiThUiUYBZoDP20bxDzhaE1D7KbECSJcWGS4j4JSobVkZFhQO4hztBy3ApGpzODOv
	kyRJT6cxclkZ4Rp1SMUiphicuSx01HnAhMSaKGv2Fav/t9TcCpJZjAukDJJZsR2vPwPvgLwIITY
	7C5Bw==
X-Received: by 2002:a05:6214:483:b0:8ac:bb62:fe4a with SMTP id 6a1803df08f44-8b665f02857mr1068856d6.5.1777650878062;
        Fri, 01 May 2026 08:54:38 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:54:37 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	matthew.gerlach@altera.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 03/12] net: pcs: pcs-xpcs: Preserve BMCR_ANENBLE during link up
Date: Fri,  1 May 2026 10:54:11 -0500
Message-ID: <20260501155421.3329862-4-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260501155421.3329862-1-elder@riscstar.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 02A574ADCEC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105508-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_GT_50(0.00)[50];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,riscstar.com:mid,riscstar.com:email,riscstar-com.20251104.gappssmtp.com:dkim]

From: Daniel Thompson <daniel@riscstar.com>

Currently the XCPS found on Toshiba TC9564 (a.k.a. Qualcomm QPS615)
is unable to operate at 1000base-X and slower with a PHY connected
using SGMII/2500base-X (in our case a Qualcomm QCA8081). The link
negotiates speed correctly but the MAC can't get any packets out.

This attracted attention to the ANENABLE bit and we observed that the
bit is currently set during config and cleared during link up.
Preserving the bit during link up allows the system to work as expected.

Perhaps I lack the imagination but I couldn't come up with any reason
why keeping the ANENABLE bit set would break things for other XPCS
implementations. Let's ensure link up sets the bit for SGMII interfaces.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/pcs/pcs-xpcs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index b2c84b7e1e113..1d62d5b31c61c 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1263,11 +1263,14 @@ static void xpcs_link_up_sgmii_1000basex(struct dw_xpcs *xpcs,
 					 phy_interface_t interface,
 					 int speed, int duplex)
 {
+	u16 an_enable;
 	int ret;
 
 	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
 		return;
 
+	an_enable = (interface == PHY_INTERFACE_MODE_SGMII ? BMCR_ANENABLE : 0);
+
 	if (interface == PHY_INTERFACE_MODE_1000BASEX) {
 		if (speed != SPEED_1000) {
 			dev_err(&xpcs->mdiodev->dev,
@@ -1283,7 +1286,7 @@ static void xpcs_link_up_sgmii_1000basex(struct dw_xpcs *xpcs,
 	}
 
 	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
-			 mii_bmcr_encode_fixed(speed, duplex));
+			 mii_bmcr_encode_fixed(speed, duplex) | an_enable);
 	if (ret)
 		dev_err(&xpcs->mdiodev->dev, "%s: xpcs_write returned %pe\n",
 			__func__, ERR_PTR(ret));
-- 
2.51.0


