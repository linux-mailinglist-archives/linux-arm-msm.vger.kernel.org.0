Return-Path: <linux-arm-msm+bounces-78920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B35C0E194
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB589406660
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1084286353;
	Mon, 27 Oct 2025 13:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q77R3TU9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9AE1F4E34
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571965; cv=none; b=nrZYRrJibP0aEGc4mNRzxhYtxeI2WzIbxa5wKCB3iszCklOHLonkZAV0aXdLzhJ8/EIBQ8uOn298QypfkDfAynTt3vxzBrdAEMWOiXD8xRFT6d0+Mxzfht/C24zc+XN9o9db5NETcEVNR14V9UuoRLgqkv/uYbGp1aXZWHId1qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571965; c=relaxed/simple;
	bh=0RB24Z84JeEf7VVDDPkK0XKQmyXud+9FqvOEeyo4+Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GG2/YWOt17Q8v0oWVnnCjvRwnxXN1sdsM/nqWe2CDXJN4vaFdj67tllvEUEF8yVcwsJg+Xn1WAmEH3V3rQ/HWnYpaObpr+nNw8oedF3ZQ298ailPvSegEMDKfGNHfC0Ncp4v9111ui61cYlLE/HZCX05eEto1RjkuS5oM4HC2Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q77R3TU9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761571964; x=1793107964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0RB24Z84JeEf7VVDDPkK0XKQmyXud+9FqvOEeyo4+Sw=;
  b=Q77R3TU9LtF/xvIQ63tTXXFbpDZMZmlavxT2VTKilxznUMvqOTKVgkse
   g77nGS3fcJeAkg/ZU9a9uzAviTvce0z2uxownghVR+Xi1190Q8OqyGvU7
   RMFGFB7JIM+HrlFs1EFPZ4DZOK8zAN0FTPCwKDFqSy70g9HFHyjZJAKgE
   2MGuNNBUK+VX+C1/yFa04spLk/DES7PDHDiUTiFLxY3GJGEdxHtY5js4q
   Y1WntYl6MQxdBzAdJIGv7DkMzcoXRb0niFe9o12/TOCn3dUy7+rIajJRo
   79CAZZ2Rn6LwacBxvv8ms+6qHxFGTey/ZAICvokGy46h1oqZ2ePB0+ZOl
   A==;
X-CSE-ConnectionGUID: 9oW7ctvsQh+nxeQTVAdl2Q==
X-CSE-MsgGUID: QYIgNppnRAO3YchZYZ2iYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63686255"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63686255"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:44 -0700
X-CSE-ConnectionGUID: y3+lhkq2Qx+7tX89UJbzUg==
X-CSE-MsgGUID: QdHuXiBtSFmDIUYkyUQygA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184666869"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9EF5C121EF1;
	Mon, 27 Oct 2025 15:32:37 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDNKq-00000001eDX-2aKc;
	Mon, 27 Oct 2025 15:32:32 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sinan Kaya <okaya@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Abin Joseph <abin.joseph@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/6] dmaengine: qcom: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 15:32:29 +0200
Message-ID: <20251027133232.392898-3-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
References: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/dma/qcom/bam_dma.c    |  5 -----
 drivers/dma/qcom/hidma.c      | 12 +-----------
 drivers/dma/qcom/hidma_dbg.c  |  1 -
 drivers/dma/qcom/hidma_mgmt.c |  2 --
 4 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 2cf060174795..efeb229652e6 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -608,7 +608,6 @@ static void bam_free_chan(struct dma_chan *chan)
 	}
 
 err:
-	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
 }
 
@@ -784,7 +783,6 @@ static int bam_pause(struct dma_chan *chan)
 	writel_relaxed(1, bam_addr(bdev, bchan->id, BAM_P_HALT));
 	bchan->paused = 1;
 	spin_unlock_irqrestore(&bchan->vc.lock, flag);
-	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
 
 	return 0;
@@ -810,7 +808,6 @@ static int bam_resume(struct dma_chan *chan)
 	writel_relaxed(0, bam_addr(bdev, bchan->id, BAM_P_HALT));
 	bchan->paused = 0;
 	spin_unlock_irqrestore(&bchan->vc.lock, flag);
-	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
 
 	return 0;
@@ -927,7 +924,6 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 		writel_relaxed(clr_mask, bam_addr(bdev, 0, BAM_IRQ_CLR));
 	}
 
-	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
 
 	return IRQ_HANDLED;
@@ -1102,7 +1098,6 @@ static void bam_start_dma(struct bam_chan *bchan)
 	writel_relaxed(bchan->tail * sizeof(struct bam_desc_hw),
 			bam_addr(bdev, bchan->id, BAM_P_EVNT_REG));
 
-	pm_runtime_mark_last_busy(bdev->dev);
 	pm_runtime_put_autosuspend(bdev->dev);
 }
 
diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c2b3e4452e71..1639d82778fd 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -184,10 +184,8 @@ static void hidma_callback(void *data)
 
 	hidma_process_completed(mchan);
 
-	if (queued) {
-		pm_runtime_mark_last_busy(dmadev->ddev.dev);
+	if (queued)
 		pm_runtime_put_autosuspend(dmadev->ddev.dev);
-	}
 }
 
 static int hidma_chan_init(struct hidma_dev *dmadev, u32 dma_sig)
@@ -316,11 +314,9 @@ static dma_cookie_t hidma_tx_submit(struct dma_async_tx_descriptor *txd)
 
 	pm_runtime_get_sync(dmadev->ddev.dev);
 	if (!hidma_ll_isenabled(dmadev->lldev)) {
-		pm_runtime_mark_last_busy(dmadev->ddev.dev);
 		pm_runtime_put_autosuspend(dmadev->ddev.dev);
 		return -ENODEV;
 	}
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 
 	mdesc = container_of(txd, struct hidma_desc, desc);
@@ -507,7 +503,6 @@ static int hidma_terminate_channel(struct dma_chan *chan)
 
 	rc = hidma_ll_enable(dmadev->lldev);
 out:
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	return rc;
 }
@@ -525,7 +520,6 @@ static int hidma_terminate_all(struct dma_chan *chan)
 	/* reinitialize the hardware */
 	pm_runtime_get_sync(dmadev->ddev.dev);
 	rc = hidma_ll_setup(dmadev->lldev);
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	return rc;
 }
@@ -569,7 +563,6 @@ static int hidma_pause(struct dma_chan *chan)
 		if (hidma_ll_disable(dmadev->lldev))
 			dev_warn(dmadev->ddev.dev, "channel did not stop\n");
 		mchan->paused = true;
-		pm_runtime_mark_last_busy(dmadev->ddev.dev);
 		pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	}
 	return 0;
@@ -591,7 +584,6 @@ static int hidma_resume(struct dma_chan *chan)
 		else
 			dev_err(dmadev->ddev.dev,
 				"failed to resume the channel");
-		pm_runtime_mark_last_busy(dmadev->ddev.dev);
 		pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	}
 	return rc;
@@ -882,7 +874,6 @@ static int hidma_probe(struct platform_device *pdev)
 	hidma_debug_init(dmadev);
 	hidma_sysfs_init(dmadev);
 	dev_info(&pdev->dev, "HI-DMA engine driver registration complete\n");
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	return 0;
 
@@ -909,7 +900,6 @@ static void hidma_shutdown(struct platform_device *pdev)
 	pm_runtime_get_sync(dmadev->ddev.dev);
 	if (hidma_ll_disable(dmadev->lldev))
 		dev_warn(dmadev->ddev.dev, "channel did not stop\n");
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 
 }
diff --git a/drivers/dma/qcom/hidma_dbg.c b/drivers/dma/qcom/hidma_dbg.c
index ce87c7937a0e..7d7594da084c 100644
--- a/drivers/dma/qcom/hidma_dbg.c
+++ b/drivers/dma/qcom/hidma_dbg.c
@@ -103,7 +103,6 @@ static int hidma_chan_show(struct seq_file *s, void *unused)
 		hidma_ll_chstats(s, mchan->dmadev->lldev, mdesc->tre_ch);
 
 	hidma_ll_devstats(s, mchan->dmadev->lldev);
-	pm_runtime_mark_last_busy(dmadev->ddev.dev);
 	pm_runtime_put_autosuspend(dmadev->ddev.dev);
 	return 0;
 }
diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
index 4805ce390ffa..8442082bde23 100644
--- a/drivers/dma/qcom/hidma_mgmt.c
+++ b/drivers/dma/qcom/hidma_mgmt.c
@@ -150,7 +150,6 @@ int hidma_mgmt_setup(struct hidma_mgmt_dev *mgmtdev)
 	val |= mgmtdev->chreset_timeout_cycles & HIDMA_CHRESET_TIMEOUT_MASK;
 	writel(val, mgmtdev->virtaddr + HIDMA_CHRESET_TIMEOUT_OFFSET);
 
-	pm_runtime_mark_last_busy(&mgmtdev->pdev->dev);
 	pm_runtime_put_autosuspend(&mgmtdev->pdev->dev);
 	return 0;
 }
@@ -305,7 +304,6 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
 		 &res->start, mgmtdev->dma_channels);
 
 	platform_set_drvdata(pdev, mgmtdev);
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 	return 0;
 out:
-- 
2.47.3


