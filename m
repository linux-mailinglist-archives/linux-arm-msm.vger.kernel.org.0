Return-Path: <linux-arm-msm+bounces-78918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4287C0E19D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:39:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 229A540563F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925DA1E3DE5;
	Mon, 27 Oct 2025 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOIjtcyM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A896B1F5433
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571965; cv=none; b=V2gtf8z3SDUBwlEYAR8bcC4f1zQLOuypVsphEtOED5njezbkuSpUApovKLfjlXQzvMJp9dYQJTOANyrqnIossgtjGHcmsWMpu/XLmzlUr9Ichp/bzrJM9Eb0Pe6sLbIqaGvoQCWvzGqQFM8SVsh6+iTOEddrSHBfOll7HpWrJew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571965; c=relaxed/simple;
	bh=goC/t74Beaos4bhfJNoY+s7Khzyp5MrUbBGzebOtlkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ky0Exk4R/IYX6LpbTEBCfm9Ld+LcO0quV8OfvSiRgNAku85RVYTksSz8+ZDqSg5lu/ODUqNr8U/xg6HfkAcfm/hRnRXzsWmWsBEktdNI72HeeZbAfyY6yrJlLwpMTjel/fBC9WgzNoweK3w+zqQjurSdEl+61qBSs2fRgpJamJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOIjtcyM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761571964; x=1793107964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=goC/t74Beaos4bhfJNoY+s7Khzyp5MrUbBGzebOtlkI=;
  b=UOIjtcyM6lGoLoy00LtvR5NKMw5FcSrzirv8yH0Q2kFO/hGwdvEgawy0
   BW8K168XGm/pHy4RO/FLb+6pmjSujriuHZv4LqqMzedGH/KVu9UBjMH0G
   /z0zbopuSPRYMCGJQsV/+EFxUJXc+X1Cm5HYZPPyPWICUzHhux5ndodyX
   /rq6onD1OpgsyatCjoJ+V8/Y/tIRBt6NTNqYkE7KMuIZ8sSdc3x6X986f
   qWg8Og3yPQqZFvizGfhncvuviDBTgHIk+am51LDztrPLLVPIjp+iZ/vNH
   wn/g7f0L18/jxKH27J7t9VuWikrWOFaUINlYWe6YFlLicJIHezhwYwQlG
   g==;
X-CSE-ConnectionGUID: nK1A7d3LRUCuB9D/sKLbhw==
X-CSE-MsgGUID: +G3TxgZRSGW5o4pk6aXmHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63684286"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="63684286"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:43 -0700
X-CSE-ConnectionGUID: u/pg0HMwQ/y/6IS7yqqC8Q==
X-CSE-MsgGUID: hIjq87w2Q6WwIk5sez8q8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="185511616"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A3CC0121EFA;
	Mon, 27 Oct 2025 15:32:37 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDNKq-00000001eDb-2dp5;
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
Subject: [PATCH 4/6] dmaengine: ste_dma40: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 15:32:30 +0200
Message-ID: <20251027133232.392898-4-sakari.ailus@linux.intel.com>
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
 drivers/dma/ste_dma40.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index d52e1685aed5..e67e0d66e6e8 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1452,7 +1452,6 @@ static int d40_pause(struct dma_chan *chan)
 
 	res = d40_channel_execute_command(d40c, D40_DMA_SUSPEND_REQ);
 
-	pm_runtime_mark_last_busy(d40c->base->dev);
 	pm_runtime_put_autosuspend(d40c->base->dev);
 	spin_unlock_irqrestore(&d40c->lock, flags);
 	return res;
@@ -1479,7 +1478,6 @@ static int d40_resume(struct dma_chan *chan)
 	if (d40_residue(d40c) || d40_tx_is_linked(d40c))
 		res = d40_channel_execute_command(d40c, D40_DMA_RUN);
 
-	pm_runtime_mark_last_busy(d40c->base->dev);
 	pm_runtime_put_autosuspend(d40c->base->dev);
 	spin_unlock_irqrestore(&d40c->lock, flags);
 	return res;
@@ -1581,7 +1579,6 @@ static void dma_tc_handle(struct d40_chan *d40c)
 		if (d40_queue_start(d40c) == NULL) {
 			d40c->busy = false;
 
-			pm_runtime_mark_last_busy(d40c->base->dev);
 			pm_runtime_put_autosuspend(d40c->base->dev);
 		}
 
@@ -2054,16 +2051,13 @@ static int d40_free_dma(struct d40_chan *d40c)
 	else
 		d40c->base->lookup_phy_chans[phy->num] = NULL;
 
-	if (d40c->busy) {
-		pm_runtime_mark_last_busy(d40c->base->dev);
+	if (d40c->busy)
 		pm_runtime_put_autosuspend(d40c->base->dev);
-	}
 
 	d40c->busy = false;
 	d40c->phy_chan = NULL;
 	d40c->configured = false;
  mark_last_busy:
-	pm_runtime_mark_last_busy(d40c->base->dev);
 	pm_runtime_put_autosuspend(d40c->base->dev);
 	return res;
 }
@@ -2466,7 +2460,6 @@ static int d40_alloc_chan_resources(struct dma_chan *chan)
 	if (is_free_phy)
 		d40_config_write(d40c);
  mark_last_busy:
-	pm_runtime_mark_last_busy(d40c->base->dev);
 	pm_runtime_put_autosuspend(d40c->base->dev);
 	spin_unlock_irqrestore(&d40c->lock, flags);
 	return err;
@@ -2618,12 +2611,9 @@ static int d40_terminate_all(struct dma_chan *chan)
 		chan_err(d40c, "Failed to stop channel\n");
 
 	d40_term_all(d40c);
-	pm_runtime_mark_last_busy(d40c->base->dev);
 	pm_runtime_put_autosuspend(d40c->base->dev);
-	if (d40c->busy) {
-		pm_runtime_mark_last_busy(d40c->base->dev);
+	if (d40c->busy)
 		pm_runtime_put_autosuspend(d40c->base->dev);
-	}
 	d40c->busy = false;
 
 	spin_unlock_irqrestore(&d40c->lock, flags);
-- 
2.47.3


