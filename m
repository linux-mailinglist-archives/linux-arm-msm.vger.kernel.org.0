Return-Path: <linux-arm-msm+bounces-24586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5FB91B9DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE9291C22DC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 08:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175B3146D53;
	Fri, 28 Jun 2024 08:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JtPFEYzu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310E12139A8;
	Fri, 28 Jun 2024 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563427; cv=none; b=pu5rRTwg2U+FP9PZuXrg6FZ08/ylQYSD+CqpZAiN4ssOii5FJCXGuHEiopC7p2HfkCAhM5ycIVs0FUMskEB3EViMC73gkl3YhVC+xevlsb8jzzfxGVau2a1vA8hmznUeah8FJg+3wVChwNVMkVUM66N+W/fls6HkxVKVz1FG1ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563427; c=relaxed/simple;
	bh=btbuoqnbp19+IbkGkP5tLXygz84RloajtIo8HzsNVH8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YlQ2QfjCjc7NfL/DHSJwmOaQtEbdS1xBMsssLCCXrJ+OR4xwWUyx7pMbD7Xayxu9/tEFm5pGKi8rv/3bT5WanxxVffSODnev034vA6XR8xv3mkqUyksXvGvWIAkAE+XbcbaIs9X1DPR23Q7Joa0oS1n4/Lb+7lczc+dd6ziQo4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JtPFEYzu; arc=none smtp.client-ip=45.254.50.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=YMm3T
	0UnxeIlA2nphWPchowTmAu5M5TowJxfd/HCvM0=; b=JtPFEYzuzFSCCKxdCdZwG
	C97ktLDpUI+YKmiIJTJbUjT5qpM1Ni+t/FxkZOsIeRj3xaBTytY+eY/AIzN6A6qq
	LSrrQ6IQwLR4xG9qcr66BBHG1exZHQtVAWIf1iKZOoNQEZXnIFTp+Stny3/WVgQU
	aoZ7uR7BJN+wEVMUWwFBLA=
Received: from localhost.localdomain (unknown [112.97.61.84])
	by gzga-smtp-mta-g0-4 (Coremail) with SMTP id _____wD3v7BzdH5mWbI3Aw--.3813S4;
	Fri, 28 Jun 2024 16:29:45 +0800 (CST)
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
Date: Fri, 28 Jun 2024 16:29:21 +0800
Message-Id: <20240628082921.1449860-3-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240628082921.1449860-1-slark_xiao@163.com>
References: <20240628082921.1449860-1-slark_xiao@163.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v7BzdH5mWbI3Aw--.3813S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWfJr1DAr1DWFWrJFW8WFg_yoW5JF1rpa
	yUKFW3tr48J3y7Wa18Cr45Za4Y9r4qka4ak342gws8tw1Yyr9xXFWxXFyjkryFkFWv9r1q
	yF18try3GanFkrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z__MaDUUUUU=
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNRsMZGV4IU7gJQAAsx

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


