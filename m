Return-Path: <linux-arm-msm+bounces-36189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6AD9B375E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 18:09:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8273281243
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 17:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE31B1DF274;
	Mon, 28 Oct 2024 17:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="jsX2pJ3M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0485C13AD11
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 17:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730135381; cv=none; b=rYQjqirYrpBPEii8meLPP+2wIvTGe0LEnSSFQsJXvh5oidwaEkhlclS9vqz0ttcrAk47MzAiNQ8KiTVyPkwawqjh4p/Jbt/7ffZU/xf70PyY0uF6Ycv8Zigk3ZvK5WsSkVmBqskUK9wwPfdof5pzCQAMRyprX1Y1mTZtgOMvZ0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730135381; c=relaxed/simple;
	bh=rfIt3xmfEmGGCR8JURfRisX9Ru/0YYRxNzOJEh6oqaY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NVSHP7PZkRl/vP2o3ctCR7dUHdmh2pcYd2gUM9vq5B9m0MLLpvJayX3hlVQN4l9x1F9WfRYB8/21L1YKPRm1kizOKyKM2grsuppTY6RTuEI4G1M/W9zsr+LXgno12F/8ZRuZsiqpvBKEhJ1YQRTBVVSUzC6DFOd29dFVtv0Wy2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=jsX2pJ3M; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aaLNCMNaFimB0K/xunkdj1iuQaXv9EHXa7EW+W6gvF8=;
  b=jsX2pJ3M0tK/FweOBSR4BNUwvFvboZYyqlnhH1WjZitDMT2BAabtksrQ
   2FgOjQenmOl5ly7+k2NpNy0euTVjTCZmzAfikx32zpYeyk/bs6Lmxm4zI
   VLKLovGX3hCYTtF2+MZbH4cO6sicAeyvyqWpu/JzrKA2N7+2BBNYSxAK3
   A=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,239,1725314400"; 
   d="scan'208";a="191112265"
Received: from dt-aponte.paris.inria.fr (HELO keisuke-XPS-13-7390.tailde312.ts.net) ([128.93.67.66])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 18:08:26 +0100
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
To: Vinod Koul <vkoul@kernel.org>,
	Sinan Kaya <okaya@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Keisuke Nishimura <keisuke.nishimura@inria.fr>
Subject: [PATCH] qcom_hidma: fix memory leak of kfifo
Date: Mon, 28 Oct 2024 18:06:19 +0100
Message-Id: <20241028170618.203023-1-keisuke.nishimura@inria.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory region allocated by kfifo_alloc() should be freed using
kfifo_free(). There are two possible cases that could result in a memory
leak:
- When hidma_ll_setup() fails, the initialization does not complete.
- hidma_ll_init() succeeds and the lldev is then uninitialized.

Fixes: d1615ca2e085 ("dmaengine: qcom_hidma: implement lower level hardware interface")
Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
---
 drivers/dma/qcom/hidma_ll.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/hidma_ll.c b/drivers/dma/qcom/hidma_ll.c
index 53244e0e34a3..6da611c61f8c 100644
--- a/drivers/dma/qcom/hidma_ll.c
+++ b/drivers/dma/qcom/hidma_ll.c
@@ -788,8 +788,10 @@ struct hidma_lldev *hidma_ll_init(struct device *dev, u32 nr_tres,
 		return NULL;
 
 	rc = hidma_ll_setup(lldev);
-	if (rc)
+	if (rc) {
+		kfifo_free(&lldev->handoff_fifo);
 		return NULL;
+	}
 
 	spin_lock_init(&lldev->lock);
 	tasklet_setup(&lldev->task, hidma_ll_tre_complete);
@@ -812,6 +814,7 @@ int hidma_ll_uninit(struct hidma_lldev *lldev)
 
 	lldev->initialized = 0;
 
+	kfifo_free(&lldev->handoff_fifo);
 	required_bytes = sizeof(struct hidma_tre) * lldev->nr_tres;
 	tasklet_kill(&lldev->task);
 	memset(lldev->trepool, 0, required_bytes);
-- 
2.34.1


