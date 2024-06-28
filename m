Return-Path: <linux-arm-msm+bounces-24570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAF791B893
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 09:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A2331F2145D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 07:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA2913F43A;
	Fri, 28 Jun 2024 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XVfXoKBQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FAA03B29D;
	Fri, 28 Jun 2024 07:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719560254; cv=none; b=pNwl/ZwxmcYM8GJqWLA4yLXRleS4R0Iy//HcyGEtRaZIpy+1T9hj+2bUwxaxkj+aNbnM4f77Q1OpvDWMnU/AHiRlco+HdroU7jm3gDCzbrA6NI1pzaxXWz/E4z7XQe2Z0jC+mh3ON6U5Y1Ckq+N2NMitmDBaHGX63VfSIC8DDu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719560254; c=relaxed/simple;
	bh=btbuoqnbp19+IbkGkP5tLXygz84RloajtIo8HzsNVH8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=spvPaX359TWo9JhQ9yjlX9yBJ9AVN/6UIrUr7WzzGhyeWSGtMdmB2uKpYQ3F1d9Dd3Unwm5lpM68DtYb9urX7izuKezCl3mnAPE1yyVQ//ie4/84+Et+OGr7jB8A13+KSJnjkNia8FbWwM+gJnr2BQ+X7HP4ivFWtFd7QvWH6Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XVfXoKBQ; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=YMm3T
	0UnxeIlA2nphWPchowTmAu5M5TowJxfd/HCvM0=; b=XVfXoKBQ9f2Gbfm35xnFC
	A6KGkszOpNsKZbOrtTCwpRQU1SXbSCMpO7gynuX34kB4XqR/nK+irTBOrJO8Wph6
	MORYMrPZShKF5dEvqnWX0fX5huVjriWIoNKzNNOQ/lg5f9a1FxWookuWpcxUb4Q+
	mc3C9qUO/6U43XNaQ4F/3o=
Received: from localhost.localdomain (unknown [112.97.61.84])
	by gzga-smtp-mta-g3-3 (Coremail) with SMTP id _____wD330AMaH5moqg7Aw--.48095S2;
	Fri, 28 Jun 2024 15:36:45 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: manivannan.sadhasivam@linaro.org,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	quic_jhugo@quicinc.com
Cc: netdev@vger.kernel.org,
	mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH v3 3/3] net: wwan: mhi: make default data link id configurable
Date: Fri, 28 Jun 2024 15:36:41 +0800
Message-Id: <20240628073641.1447352-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD330AMaH5moqg7Aw--.48095S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWfJr1DAr1DWFWrJFW8WFg_yoW5JF1rpa
	yUKFW3tr48J3y7Wa18Cr45Za4Y9r4qka4ak342gws8tw1Yyr9xXFWxXFyjkryFkFWv9r1q
	yF18try3GanFkrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi9YFJUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbioxAMZGVOEHzVgwAAsK

For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
This would lead to device can't ping outside successfully.
Also MBIM side would report "bad packet session (112)".
In oder to fix this issue, we decide to use the modem name
to do a match in wwan side. Then wwan driver could
set a corresponding mux_id value according to the modem product.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/net/wwan/mhi_wwan_mbim.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
index 3f72ae943b29..e481ced496d8 100644
--- a/drivers/net/wwan/mhi_wwan_mbim.c
+++ b/drivers/net/wwan/mhi_wwan_mbim.c
@@ -42,6 +42,8 @@
 #define MHI_MBIM_LINK_HASH_SIZE 8
 #define LINK_HASH(session) ((session) % MHI_MBIM_LINK_HASH_SIZE)
 
+#define WDS_BIND_MUX_DATA_PORT_MUX_ID 112
+
 struct mhi_mbim_link {
 	struct mhi_mbim_context *mbim;
 	struct net_device *ndev;
@@ -93,6 +95,15 @@ static struct mhi_mbim_link *mhi_mbim_get_link_rcu(struct mhi_mbim_context *mbim
 	return NULL;
 }
 
+static int mhi_mbim_get_link_mux_id(struct mhi_controller *cntrl)
+{
+	if (strcmp(cntrl->name, "foxconn-dw5934e") == 0 ||
+	    strcmp(cntrl->name, "foxconn-t99w515") == 0)
+		return WDS_BIND_MUX_DATA_PORT_MUX_ID;
+
+	return 0;
+}
+
 static struct sk_buff *mbim_tx_fixup(struct sk_buff *skb, unsigned int session,
 				     u16 tx_seq)
 {
@@ -596,7 +607,7 @@ static int mhi_mbim_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
 {
 	struct mhi_controller *cntrl = mhi_dev->mhi_cntrl;
 	struct mhi_mbim_context *mbim;
-	int err;
+	int err, link_id;
 
 	mbim = devm_kzalloc(&mhi_dev->dev, sizeof(*mbim), GFP_KERNEL);
 	if (!mbim)
@@ -617,8 +628,11 @@ static int mhi_mbim_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
 	/* Number of transfer descriptors determines size of the queue */
 	mbim->rx_queue_sz = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
 
+	/* Get the corresponding mux_id from mhi */
+	link_id = mhi_mbim_get_link_mux_id(cntrl);
+
 	/* Register wwan link ops with MHI controller representing WWAN instance */
-	return wwan_register_ops(&cntrl->mhi_dev->dev, &mhi_mbim_wwan_ops, mbim, 0);
+	return wwan_register_ops(&cntrl->mhi_dev->dev, &mhi_mbim_wwan_ops, mbim, link_id);
 }
 
 static void mhi_mbim_remove(struct mhi_device *mhi_dev)
-- 
2.25.1


