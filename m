Return-Path: <linux-arm-msm+bounces-105509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD/cKczN9GkAFQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105509-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:59:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 159354ADD2C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66E233027D85
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78D53D6682;
	Fri,  1 May 2026 15:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="YW7RYBQF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C443D34AB
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777650884; cv=none; b=ivNFl2iVYdw0prSvg7b47SuzZ3agOTNamX/UXznrz3U+WkhlukR5wctrOvQlJZexQxuTuMk9NIa6yqVlcF0PfJLqiJsvFtIEma/KgxMsBJxL0qIPr6iGrbLqaSJslc2Kni3PbI9NEikyK8oDjlDVdVPmzndpoX2ZkR4CFGUal4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777650884; c=relaxed/simple;
	bh=U/lTa+D6+IKoY+zUK905qn/IpLu9A+D8/9j9HczZJc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GfQnp8zOrgetE41lv9lF4shIx3A6xtjVr7GsEP4SgmQgXmyjZWYeGjedebse1RatqtYmhrV2U9M0zxBGlhtQe9vrov6hkUeN4LgiHgvYeTmW4fSkzzxpqi/9TPMYGGrujt2Jwem07/t2JAzTneWehy0VdzJO7qNhLm8D0EZt1uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=YW7RYBQF; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8b62ca1d28eso2337616d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777650882; x=1778255682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POapwciysOoUJcDyvw+AuP0OuBg91wKnl5ReneTvDn8=;
        b=YW7RYBQFNjf2Xvlg8AjQu3Zu0w53akdt9v2NMOyP8jd8jwYAN/VLagHLZ4P+b/q5kt
         28WP+LDmwE0Ys608VXqnv6k9E2dfUAPbTyWslcbqa01xaYIYDNkxCkx+kwhALESI7cSa
         Nxac1t6tYSD3gMNYvu+Q1r9mL+aFP9sBG4XgOytYzWh1P7nDzwu1j8qi6qM7ttWUtoHg
         PVtvZzmE1wXCzPgEsTRaRL2GON87uojpEyVYbO+t2L9QnA0FLjZaniGaISbryqdwF4VZ
         Bxn+gtBkCoI7hVroi0oBm9/3EZg0aNVlSkiwtGLX7Vf06fIKYtW7N4zBbvyOgZL72pS/
         0LIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777650882; x=1778255682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=POapwciysOoUJcDyvw+AuP0OuBg91wKnl5ReneTvDn8=;
        b=Gz5C8yltDhNGxh/9N7PHDcVZh9SYGfJ9y+fVbw63X0b6+VhmwdLbnha1DE/E2AP5kR
         F7tcYJoAW90/90w2Wv+xiKMQC+ah0XxKeSE3l3Da1ELig0kkal89zWekB50v98ONZQND
         iEjQ/Ce+n9VeaeKS0YaJIotf4wy1nTyS9z1UMMrUFkwGYOFOgSEqqwoyZK3mciyD75t7
         Fm9Wv2qMS6Qgg5l9w/DJEhtF0c05cvCm5W6agphnd6l9sebJ/SpFqNGAtC/lNVThspPC
         M1t1uo6RELBzvWBWn7osb8FaakEHfdgiRSyhz9Oj2r17UYzEj8WdoIkB/J8gFwTe7Tqf
         G8VA==
X-Forwarded-Encrypted: i=1; AFNElJ9160abYo45qPEq8gTeUnmiUzzup5SLesrMHdbBn/5SIwKAaukrwNKELnhiDaNPCqqFAJhWLIXIO2fUov1M@vger.kernel.org
X-Gm-Message-State: AOJu0YyLG+Zbc4v4V2Yd6mJ6+P2iensyEPdT6X4YCNnycVjZ92IgUsSN
	4INpeRoAzMvHE1VmCZVFOnKraM26mtJ1UmuePLu1KtzaWKWTfa9eRd2yOd0LC6qsKOSYT8DuqUt
	B2CSk1sM=
X-Gm-Gg: AeBDietzyC2UGoHMwRswT33xk30i88uC0mYACfoBxi2YtJkBixKe0Harq5LIzEUHKEL
	rGPiOZ2VpV60VFHROEwdRsfTSDctcK6o/3LHPhQRFfvvIB5iOKsh+im2H4dmnRMw4OiDQ/tcWpU
	sRN1UEGHjk8R3CVP9nggznXPKGn0hAXUd5Vy7Q38t/PD2AoF3bPTCt91ayp+Ye0CWeBndtTJ/A6
	MMc9v6hL14vva12/iza+d1xIKG4dVQ+R0ZHx9OCFk1V/qJxBlxvS+NSSGt/x4pxv92VQ2cxr6yO
	Y19nwWORfvoyqA9nfj6ZGNQP5uUtlvkeF6Dfdx2uT8myQpKm92JHIdP2vfk6OgPL7YQO+QR39g5
	VAbGglocykUQc/pR2tGjAb1pAv0ekpb6H/472r4ovhybwjpFdvhOOdRM9iguAFLxGbznotCkGcW
	RmMKqZ0wLK8n3vIR3LfXZjOI5wcY0rr2XaeCiS2tnXz4P+xXtR4G5AxdJ/PDLON953sBOQWLHr2
	W4dSS6BV1gfbq45
X-Received: by 2002:a05:6214:f62:b0:8ac:ba63:a1b1 with SMTP id 6a1803df08f44-8b669ac6336mr335536d6.49.1777650881517;
        Fri, 01 May 2026 08:54:41 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b539aa7293sm26615406d6.22.2026.05.01.08.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:54:41 -0700 (PDT)
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
Cc: daniel@riscstar.com,
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
Subject: [PATCH net-next 04/12] net: stmmac: dma: create a separate dma_device pointer
Date: Fri,  1 May 2026 10:54:12 -0500
Message-ID: <20260501155421.3329862-5-elder@riscstar.com>
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
X-Rspamd-Queue-Id: 159354ADD2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,kernel.org,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105509-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[50];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pp_params.dev:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,riscstar-com.20251104.gappssmtp.com:dkim,riscstar.com:mid,riscstar.com:email]

The Toshiba TC956x Ethernet bridge chip is an Ethernet AVN/TSN bridge
that is essentially a small but specialized SoC.  It provides two XGMAC
Ethernet interfaces along with a number of internal IP blocks, some of
which are used by both eMACs.

The chip implements two internal PCIe functions, and one of these is
used to manage the common internal IPs.  Both of the PCIe functions
use an auxiliary bus device to represent an XGMAC Ethernet interface.
Separating the PCIe function from the XGMAC IP this way helps in
managing the life cycle for various objects (common and per-MAC).

However this separation means that the MAC device is no longer the
proper device to use for DMA.  To address this, we add support for
a second "DMA device" pointer in the stmmac_priv structure.  The DMA
device pointer is used for all DMA operations, while the "normal"
device pointer is used for log messages, memory allocation, runtime
power management, and a few other things.

To set up the DMA device pointer, we add a new device structure pointer
to the plat_stmmacenet_data structure.  If set, it will be assigned as
the (new) dma_device pointer field in the stmmac_priv structure.  If
the plat_stmmacenet_data field is NULL, the "normal" device pointer is
assigned as the dma_device pointer instead (preserving existing behavior).

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../net/ethernet/stmicro/stmmac/chain_mode.c  | 12 ++--
 .../net/ethernet/stmicro/stmmac/ring_mode.c   | 12 ++--
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 59 ++++++++++---------
 .../net/ethernet/stmicro/stmmac/stmmac_xdp.c  |  2 +-
 include/linux/stmmac.h                        |  1 +
 6 files changed, 46 insertions(+), 41 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
index fc04a23342cfc..331e6523ee018 100644
--- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
@@ -34,10 +34,10 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 	buf_len = min_t(unsigned int, nopaged_len, bmax);
 	len = nopaged_len - buf_len;
 
-	des2 = dma_map_single(priv->device, skb->data,
+	des2 = dma_map_single(priv->dma_device, skb->data,
 			      buf_len, DMA_TO_DEVICE);
 	desc->des2 = cpu_to_le32(des2);
-	if (dma_mapping_error(priv->device, des2))
+	if (dma_mapping_error(priv->dma_device, des2))
 		return -1;
 	tx_q->tx_skbuff_dma[entry].buf = des2;
 	tx_q->tx_skbuff_dma[entry].len = buf_len;
@@ -51,11 +51,11 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 		desc = tx_q->dma_tx + entry;
 
 		if (len > bmax) {
-			des2 = dma_map_single(priv->device,
+			des2 = dma_map_single(priv->dma_device,
 					      (skb->data + bmax * i),
 					      bmax, DMA_TO_DEVICE);
 			desc->des2 = cpu_to_le32(des2);
-			if (dma_mapping_error(priv->device, des2))
+			if (dma_mapping_error(priv->dma_device, des2))
 				return -1;
 			tx_q->tx_skbuff_dma[entry].buf = des2;
 			tx_q->tx_skbuff_dma[entry].len = bmax;
@@ -64,11 +64,11 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 			len -= bmax;
 			i++;
 		} else {
-			des2 = dma_map_single(priv->device,
+			des2 = dma_map_single(priv->dma_device,
 					      (skb->data + bmax * i), len,
 					      DMA_TO_DEVICE);
 			desc->des2 = cpu_to_le32(des2);
-			if (dma_mapping_error(priv->device, des2))
+			if (dma_mapping_error(priv->dma_device, des2))
 				return -1;
 			tx_q->tx_skbuff_dma[entry].buf = des2;
 			tx_q->tx_skbuff_dma[entry].len = len;
diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
index 78fc6aa5bbe95..0d334c51fc1c2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
@@ -37,10 +37,10 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 
 	if (nopaged_len > BUF_SIZE_8KiB) {
 
-		des2 = dma_map_single(priv->device, skb->data, bmax,
+		des2 = dma_map_single(priv->dma_device, skb->data, bmax,
 				      DMA_TO_DEVICE);
 		desc->des2 = cpu_to_le32(des2);
-		if (dma_mapping_error(priv->device, des2))
+		if (dma_mapping_error(priv->dma_device, des2))
 			return -1;
 
 		tx_q->tx_skbuff_dma[entry].buf = des2;
@@ -58,10 +58,10 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 		else
 			desc = tx_q->dma_tx + entry;
 
-		des2 = dma_map_single(priv->device, skb->data + bmax, len,
+		des2 = dma_map_single(priv->dma_device, skb->data + bmax, len,
 				      DMA_TO_DEVICE);
 		desc->des2 = cpu_to_le32(des2);
-		if (dma_mapping_error(priv->device, des2))
+		if (dma_mapping_error(priv->dma_device, des2))
 			return -1;
 		tx_q->tx_skbuff_dma[entry].buf = des2;
 		tx_q->tx_skbuff_dma[entry].len = len;
@@ -72,10 +72,10 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 				STMMAC_RING_MODE, 1, !skb_is_nonlinear(skb),
 				skb->len);
 	} else {
-		des2 = dma_map_single(priv->device, skb->data,
+		des2 = dma_map_single(priv->dma_device, skb->data,
 				      nopaged_len, DMA_TO_DEVICE);
 		desc->des2 = cpu_to_le32(des2);
-		if (dma_mapping_error(priv->device, des2))
+		if (dma_mapping_error(priv->dma_device, des2))
 			return -1;
 		tx_q->tx_skbuff_dma[entry].buf = des2;
 		tx_q->tx_skbuff_dma[entry].len = nopaged_len;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 8ba8f03e1ce03..76c8551687998 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -278,6 +278,7 @@ struct stmmac_priv {
 	void __iomem *ioaddr;
 	struct net_device *dev;
 	struct device *device;
+	struct device *dma_device;
 	struct mac_device_info *hw;
 	int (*hwif_quirks)(struct stmmac_priv *priv);
 	struct mutex lock;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ca68248dbc781..1104cf750295b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1730,12 +1730,12 @@ static void stmmac_free_tx_buffer(struct stmmac_priv *priv,
 	if (tx_q->tx_skbuff_dma[i].buf &&
 	    tx_q->tx_skbuff_dma[i].buf_type != STMMAC_TXBUF_T_XDP_TX) {
 		if (tx_q->tx_skbuff_dma[i].map_as_page)
-			dma_unmap_page(priv->device,
+			dma_unmap_page(priv->dma_device,
 				       tx_q->tx_skbuff_dma[i].buf,
 				       tx_q->tx_skbuff_dma[i].len,
 				       DMA_TO_DEVICE);
 		else
-			dma_unmap_single(priv->device,
+			dma_unmap_single(priv->dma_device,
 					 tx_q->tx_skbuff_dma[i].buf,
 					 tx_q->tx_skbuff_dma[i].len,
 					 DMA_TO_DEVICE);
@@ -2166,7 +2166,7 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 
 	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
-	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+	dma_free_coherent(priv->dma_device, size, addr, rx_q->dma_rx_phy);
 
 	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
 		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
@@ -2214,7 +2214,7 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 
 	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
-	dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
+	dma_free_coherent(priv->dma_device, size, addr, tx_q->dma_tx_phy);
 
 	kfree(tx_q->tx_skbuff_dma);
 	kfree(tx_q->tx_skbuff);
@@ -2266,8 +2266,8 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	pp_params.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV;
 	pp_params.pool_size = dma_conf->dma_rx_size;
 	pp_params.order = order_base_2(num_pages);
-	pp_params.nid = dev_to_node(priv->device);
-	pp_params.dev = priv->device;
+	pp_params.nid = dev_to_node(priv->dma_device);
+	pp_params.dev = priv->dma_device;
 	pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
 	pp_params.offset = stmmac_rx_offset(priv);
 	pp_params.max_len = dma_conf->dma_buf_sz;
@@ -2290,7 +2290,7 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 
 	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
-	addr = dma_alloc_coherent(priv->device, size, &rx_q->dma_rx_phy,
+	addr = dma_alloc_coherent(priv->dma_device, size, &rx_q->dma_rx_phy,
 				  GFP_KERNEL);
 	if (!addr)
 		return -ENOMEM;
@@ -2369,7 +2369,7 @@ static int __alloc_dma_tx_desc_resources(struct stmmac_priv *priv,
 
 	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
-	addr = dma_alloc_coherent(priv->device, size,
+	addr = dma_alloc_coherent(priv->dma_device, size,
 				  &tx_q->dma_tx_phy, GFP_KERNEL);
 	if (!addr)
 		return -ENOMEM;
@@ -2898,12 +2898,12 @@ static int stmmac_tx_clean(struct stmmac_priv *priv, int budget, u32 queue,
 		if (likely(tx_q->tx_skbuff_dma[entry].buf &&
 			   tx_q->tx_skbuff_dma[entry].buf_type != STMMAC_TXBUF_T_XDP_TX)) {
 			if (tx_q->tx_skbuff_dma[entry].map_as_page)
-				dma_unmap_page(priv->device,
+				dma_unmap_page(priv->dma_device,
 					       tx_q->tx_skbuff_dma[entry].buf,
 					       tx_q->tx_skbuff_dma[entry].len,
 					       DMA_TO_DEVICE);
 			else
-				dma_unmap_single(priv->device,
+				dma_unmap_single(priv->dma_device,
 						 tx_q->tx_skbuff_dma[entry].buf,
 						 tx_q->tx_skbuff_dma[entry].len,
 						 DMA_TO_DEVICE);
@@ -4569,9 +4569,9 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	first = desc;
 
 	/* first descriptor: fill Headers on Buf1 */
-	des = dma_map_single(priv->device, skb->data, skb_headlen(skb),
+	des = dma_map_single(priv->dma_device, skb->data, skb_headlen(skb),
 			     DMA_TO_DEVICE);
-	if (dma_mapping_error(priv->device, des))
+	if (dma_mapping_error(priv->dma_device, des))
 		goto dma_map_err;
 
 	stmmac_set_desc_addr(priv, first, des);
@@ -4597,10 +4597,10 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	for (i = 0; i < nfrags; i++) {
 		const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
 
-		des = skb_frag_dma_map(priv->device, frag, 0,
+		des = skb_frag_dma_map(priv->dma_device, frag, 0,
 				       skb_frag_size(frag),
 				       DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, des))
+		if (dma_mapping_error(priv->dma_device, des))
 			goto dma_map_err;
 
 		stmmac_tso_allocator(priv, des, skb_frag_size(frag),
@@ -4825,9 +4825,9 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	} else {
 		bool last_segment = (nfrags == 0);
 
-		dma_addr = dma_map_single(priv->device, skb->data,
+		dma_addr = dma_map_single(priv->dma_device, skb->data,
 					  nopaged_len, DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, dma_addr))
+		if (dma_mapping_error(priv->dma_device, dma_addr))
 			goto dma_map_err;
 
 		stmmac_set_tx_skb_dma_entry(tx_q, first_entry, dma_addr,
@@ -4876,9 +4876,9 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 
 		desc = stmmac_get_tx_desc(priv, tx_q, entry);
 
-		dma_addr = skb_frag_dma_map(priv->device, frag, 0, frag_size,
-					    DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, dma_addr))
+		dma_addr = skb_frag_dma_map(priv->dma_device, frag, 0,
+					    frag_size, DMA_TO_DEVICE);
+		if (dma_mapping_error(priv->dma_device, dma_addr))
 			goto dma_map_err; /* should reuse desc w/o issues */
 
 		stmmac_set_tx_skb_dma_entry(tx_q, entry, dma_addr, frag_size,
@@ -5188,9 +5188,9 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 
 	tx_desc = stmmac_get_tx_desc(priv, tx_q, entry);
 	if (dma_map) {
-		dma_addr = dma_map_single(priv->device, xdpf->data,
+		dma_addr = dma_map_single(priv->dma_device, xdpf->data,
 					  xdpf->len, DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, dma_addr))
+		if (dma_mapping_error(priv->dma_device, dma_addr))
 			return STMMAC_XDP_CONSUMED;
 
 		buf_type = STMMAC_TXBUF_T_XDP_NDO;
@@ -5199,7 +5199,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 
 		dma_addr = page_pool_get_dma_addr(page) + sizeof(*xdpf) +
 			   xdpf->headroom;
-		dma_sync_single_for_device(priv->device, dma_addr,
+		dma_sync_single_for_device(priv->dma_device, dma_addr,
 					   xdpf->len, DMA_BIDIRECTIONAL);
 
 		buf_type = STMMAC_TXBUF_T_XDP_TX;
@@ -5781,7 +5781,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		if (!skb) {
 			unsigned int pre_len, sync_len;
 
-			dma_sync_single_for_cpu(priv->device, buf->addr,
+			dma_sync_single_for_cpu(priv->dma_device, buf->addr,
 						buf1_len, dma_dir);
 			net_prefetch(page_address(buf->page) +
 				     buf->page_offset);
@@ -5860,7 +5860,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			skb_mark_for_recycle(skb);
 			buf->page = NULL;
 		} else if (buf1_len) {
-			dma_sync_single_for_cpu(priv->device, buf->addr,
+			dma_sync_single_for_cpu(priv->dma_device, buf->addr,
 						buf1_len, dma_dir);
 			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 					buf->page, buf->page_offset, buf1_len,
@@ -5869,7 +5869,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		}
 
 		if (buf2_len) {
-			dma_sync_single_for_cpu(priv->device, buf->sec_addr,
+			dma_sync_single_for_cpu(priv->dma_device, buf->sec_addr,
 						buf2_len, dma_dir);
 			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
 					buf->sec_page, 0, buf2_len,
@@ -7810,6 +7810,7 @@ static int __stmmac_dvr_probe(struct device *device,
 
 	priv = netdev_priv(ndev);
 	priv->device = device;
+	priv->dma_device = plat_dat->dma_device ? : device;
 	priv->dev = ndev;
 
 	for (i = 0; i < MTL_MAX_RX_QUEUES; i++)
@@ -7938,8 +7939,9 @@ static int __stmmac_dvr_probe(struct device *device,
 		priv->dma_cap.host_dma_width = priv->dma_cap.addr64;
 
 	if (priv->dma_cap.host_dma_width) {
-		ret = dma_set_mask_and_coherent(device,
-				DMA_BIT_MASK(priv->dma_cap.host_dma_width));
+		u64 mask = DMA_BIT_MASK(priv->dma_cap.host_dma_width);
+
+		ret = dma_set_mask_and_coherent(priv->dma_device, mask);
 		if (!ret) {
 			dev_info(priv->device, "Using %d/%d bits DMA host/device width\n",
 				 priv->dma_cap.host_dma_width, priv->dma_cap.addr64);
@@ -7951,7 +7953,8 @@ static int __stmmac_dvr_probe(struct device *device,
 			if (IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT))
 				priv->plat->dma_cfg->eame = true;
 		} else {
-			ret = dma_set_mask_and_coherent(device, DMA_BIT_MASK(32));
+			ret = dma_set_mask_and_coherent(priv->dma_device,
+							DMA_BIT_MASK(32));
 			if (ret) {
 				dev_err(priv->device, "Failed to set DMA Mask\n");
 				goto error_hw_init;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
index d7e4db7224b0c..7ba068f1ca88d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
@@ -25,7 +25,7 @@ static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
 	if (frame_size < ETH_FRAME_LEN + VLAN_HLEN * 2)
 		return -EOPNOTSUPP;
 
-	err = xsk_pool_dma_map(pool, priv->device, STMMAC_RX_DMA_ATTR);
+	err = xsk_pool_dma_map(pool, priv->dma_device, STMMAC_RX_DMA_ATTR);
 	if (err) {
 		netdev_err(priv->dev, "Failed to map xsk pool\n");
 		return err;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 4430b967abdeb..02ae177d5c27d 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -245,6 +245,7 @@ struct plat_stmmacenet_data {
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct device_node *phy_node;
 	struct device_node *mdio_node;
+	struct device *dma_device;
 	struct stmmac_dma_cfg *dma_cfg;
 	struct stmmac_safety_feature_cfg *safety_feat_cfg;
 	int clk_csr;
-- 
2.51.0


