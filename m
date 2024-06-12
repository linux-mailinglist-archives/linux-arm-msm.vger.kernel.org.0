Return-Path: <linux-arm-msm+bounces-22396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCA4904F6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 11:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52BC51F26AD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 09:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2123B16DEC9;
	Wed, 12 Jun 2024 09:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kaIQcOzC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2DD16DEBD;
	Wed, 12 Jun 2024 09:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718185208; cv=none; b=KK1e2T10ZfB3uUFOMQzSl1wZSI/mvagvedAJNnAjI6lE1cYE5hT/ey0AJJN1BMN6dglQwuxn8cx919eb9Jh4+uL8WrUXX7X5CKqhtqPy1h565sBfoMf6clNNaZMOKTQHcNUU77yWn46/8LQDGW2U4D8+Sz3ydIZdIs8RwRxu6aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718185208; c=relaxed/simple;
	bh=CseckecvFHVYq5/Mi+eTnmliiolSYA/fTa5Hy15SGko=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WDLfCcTxczVXbYZyjSkZ1rv2BMlqdLiJDHU36xc9TCt0V1DsL/2Z+CbmcIiEIIJB6vOgGFkOY/eCZmJPgswCKJ/+5ov2AVXDxtB6WO4QtlJ1V0PonEjqdt93g3wP44Zc/0+1KlL8rDZzhpPX/jPBWLSYoAWQxWqRxlr5hulbq/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=kaIQcOzC; arc=none smtp.client-ip=45.254.50.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=dtUDZ
	Mf38e7mWzd9Ay3BGQ/8e3RMt1YamowsisI+xss=; b=kaIQcOzCsSj7DeZtSqF3G
	3yd4ErsVsEhlYaw+DHzDVuPydojnuGCILlEnl3GCasebdo1NSqec8jrISY3Cr1t3
	Tcsfdxh2xOedJConjqb4JobaBft8RuhbjAZ2+spqcaaB4xPfGJ2bPqRe4H33c+Ei
	19UiCBSuBkAwgcsfBRzXrM=
Received: from localhost.localdomain (unknown [112.97.57.186])
	by gzga-smtp-mta-g0-4 (Coremail) with SMTP id _____wDX37ngbGlmhhrDHw--.14951S2;
	Wed, 12 Jun 2024 17:39:45 +0800 (CST)
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
Subject: [PATCH v2 2/2] net: wwan: mhi: make default data link id configurable
Date: Wed, 12 Jun 2024 17:39:41 +0800
Message-Id: <20240612093941.359904-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDX37ngbGlmhhrDHw--.14951S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFWkWFy7JF4xXF1kZryUAwb_yoWktrXE9r
	1kuas7WF4UWr1rKr1j9F98ZrySkwnYqFZ2gr1ft395J3sxXFy7uay5Zr1UtrnF9w47Crn7
	Wr47XFyakw48WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNoGQDUUUUU==
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiNQH7ZGV4IDQMmgAAs0

For SDX72 MBIM device, it starts data mux id from 112 instead of 0.
This would lead to device can't ping outside successfully.
Also MBIM side would report "bad packet session (112)".
So we add a link id default value for these SDX72 products which
works in MBIM mode.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/net/wwan/mhi_wwan_mbim.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan_mbim.c
index 3f72ae943b29..c731fe20814f 100644
--- a/drivers/net/wwan/mhi_wwan_mbim.c
+++ b/drivers/net/wwan/mhi_wwan_mbim.c
@@ -618,7 +618,8 @@ static int mhi_mbim_probe(struct mhi_device *mhi_dev, const struct mhi_device_id
 	mbim->rx_queue_sz = mhi_get_free_desc_count(mhi_dev, DMA_FROM_DEVICE);
 
 	/* Register wwan link ops with MHI controller representing WWAN instance */
-	return wwan_register_ops(&cntrl->mhi_dev->dev, &mhi_mbim_wwan_ops, mbim, 0);
+	return wwan_register_ops(&cntrl->mhi_dev->dev, &mhi_mbim_wwan_ops, mbim,
+		mhi_dev->mhi_cntrl->link_id);
 }
 
 static void mhi_mbim_remove(struct mhi_device *mhi_dev)
-- 
2.25.1


