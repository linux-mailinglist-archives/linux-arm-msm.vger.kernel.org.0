Return-Path: <linux-arm-msm+bounces-78919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EDEC0E16D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:37:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DBD764F63E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7115213254;
	Mon, 27 Oct 2025 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpvCHAQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71421FBC92
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571965; cv=none; b=PDfwQ2L/iZ2l4U4VnvX10jhDdxs4bDGzV+NZa+OiJ59g57DyExDaG7UMjLs1eZJwSMUPHJjXVlRbCgpPmitw/UZKhTxmjDlyb6HqY16P5MuKsHH8bBbJKRzjAzGIkBXVg7jHj9j1kaDkLE5cuyBf8qwhvH7Smrda3b6x0wzEEnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571965; c=relaxed/simple;
	bh=mamwn5TbNH4hfztICDA/xhTtvnc1/Keqfpn2ZYZW7RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kdiCxCjfNOKb5hAGSkBu1Xevq79uQ0mNZLMPnn0k80si9+FLLCGdlYjquLEKfYBN/fom9/6JwYivOQUufjRl3X+ao3a0HKa72mU0QQyDPSgee+xj4mw2rPUnTF5oYXw5V+r/Oe/NXjKuqKmhn3NzOiJN7aRom1sdagc1bjGY3oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpvCHAQO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761571964; x=1793107964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mamwn5TbNH4hfztICDA/xhTtvnc1/Keqfpn2ZYZW7RQ=;
  b=dpvCHAQOTZNB2suxZWwZc4icp97qQvPYYtXOcjcEcnV2hBuJMW/+xmCe
   TsI5rtS1oXDxRpGHWq1h0q/WWtgFLZSnaQ/roMtASBcUCVb7UXtFPicRo
   lu7BLQY44g03CkLNIxf2b/sCrJ/SDtcNeME3RnvdUGY0B6mHlHzCvdBE6
   F4BXBi+oMf8VyaN/9w1Y/MmjVMqirMVuk7hFD8ZAWA+YuQsNxqXf3LvxW
   Ll3s4I3jzx1cQkAwNB9TqGHM+7ZLYyBPxKp72dovPrtDk/jFysqvu38gg
   dbDARbqZp8WlyIAFB+Gmc1hJkg9KjQLjchRrsZNhpkiF/cOjXw/EzLhMw
   w==;
X-CSE-ConnectionGUID: 5C2zUNf/SlKSymhz8HHsZg==
X-CSE-MsgGUID: E0jWNAj5Q2SaYv9zT6rrsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74324545"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="74324545"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:43 -0700
X-CSE-ConnectionGUID: 6o5P9WsNT5mWDTMPgHg5Kg==
X-CSE-MsgGUID: CqqWrJUlR+eDcmWguz3O7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="189082275"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9DBD711FADA;
	Mon, 27 Oct 2025 15:32:37 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDNKq-00000001eDT-2WpC;
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
Subject: [PATCH 2/6] dmaengine: pl330: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 15:32:28 +0200
Message-ID: <20251027133232.392898-2-sakari.ailus@linux.intel.com>
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
 drivers/dma/pl330.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index 82a9fe88ad54..72f260328ae9 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -2133,10 +2133,8 @@ static void pl330_tasklet(struct tasklet_struct *t)
 	spin_unlock_irqrestore(&pch->lock, flags);
 
 	/* If work list empty, power down */
-	if (power_down) {
-		pm_runtime_mark_last_busy(pch->dmac->ddma.dev);
+	if (power_down)
 		pm_runtime_put_autosuspend(pch->dmac->ddma.dev);
-	}
 }
 
 static struct dma_chan *of_dma_pl330_xlate(struct of_phandle_args *dma_spec,
@@ -2313,7 +2311,6 @@ static int pl330_terminate_all(struct dma_chan *chan)
 	list_splice_tail_init(&pch->work_list, &pl330->desc_pool);
 	list_splice_tail_init(&pch->completed_list, &pl330->desc_pool);
 	spin_unlock_irqrestore(&pch->lock, flags);
-	pm_runtime_mark_last_busy(pl330->ddma.dev);
 	if (power_down)
 		pm_runtime_put_autosuspend(pl330->ddma.dev);
 	pm_runtime_put_autosuspend(pl330->ddma.dev);
@@ -2347,7 +2344,6 @@ static int pl330_pause(struct dma_chan *chan)
 			desc->status = PAUSED;
 	}
 	spin_unlock_irqrestore(&pch->lock, flags);
-	pm_runtime_mark_last_busy(pl330->ddma.dev);
 	pm_runtime_put_autosuspend(pl330->ddma.dev);
 
 	return 0;
@@ -2371,7 +2367,6 @@ static void pl330_free_chan_resources(struct dma_chan *chan)
 		list_splice_tail_init(&pch->work_list, &pch->dmac->desc_pool);
 
 	spin_unlock_irqrestore(&pl330->lock, flags);
-	pm_runtime_mark_last_busy(pch->dmac->ddma.dev);
 	pm_runtime_put_autosuspend(pch->dmac->ddma.dev);
 	pl330_unprep_slave_fifo(pch);
 }
@@ -3176,7 +3171,6 @@ pl330_probe(struct amba_device *adev, const struct amba_id *id)
 	pm_runtime_irq_safe(&adev->dev);
 	pm_runtime_use_autosuspend(&adev->dev);
 	pm_runtime_set_autosuspend_delay(&adev->dev, PL330_AUTOSUSPEND_DELAY);
-	pm_runtime_mark_last_busy(&adev->dev);
 	pm_runtime_put_autosuspend(&adev->dev);
 
 	return 0;
-- 
2.47.3


