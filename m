Return-Path: <linux-arm-msm+bounces-78922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA9BC0E15B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:36:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DDCA19C152B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6501F4E34;
	Mon, 27 Oct 2025 13:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7ce6NjL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B82E220F49
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571969; cv=none; b=kJ7pyOgy5vrGn0YfNzaYhVHMd0yDFOKABKt8F4pIXKyDX8VdyGxSn1BTA6KOxk17l7j7OJM7eFtV/84X4bLA/rRFtSeLyqb5YhelC21UkgXVhXUX2+eNGBdpGxqpz4sf3CdRTZwxRCSFMt1neBmdIgk8eGrwoP0lCCRTdGSyn98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571969; c=relaxed/simple;
	bh=L2EJvo+ibiudIgMshQ8LXZ2bLi30gQggyjvuPIskscw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kY62c+d7R3IE8JD9uHNPgancTP07/g+xXt4D7ZljKvqDlhsAxOfvEzpAi0/zJgE9o2J31Hc5tCMpgefHhFHgDlQQZbqrivNLgioYpQ/A6l0LXMBXNquKzKXOQ9gg38cN9KNkuCQRLVoWHkU0D5Ec5Er2IaXU1q/f4oTURxo06z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7ce6NjL; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761571968; x=1793107968;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L2EJvo+ibiudIgMshQ8LXZ2bLi30gQggyjvuPIskscw=;
  b=N7ce6NjLhnORVsPoShBqsqR4XbiU0di/yn0tIVFnqsPb4dIP1P/owB+V
   IW87RNTnt2aYg0UPyY9WdYlZKmeEjIerfmXl6wZhljB6gM67KhLtQYa1+
   rqwdLMCJ3Gd7ejiuwgoORJspK/YOdPT+NLQ5tvU0RmZmq5ZybZOAFDxeh
   bYbBRnEUDsCK42CoGgnBiCe3HfSJVQNduTXvRfFxhLbf9lmoN0Zu5uyH/
   J/e+sFJvCAYC0qGAYn5io+DcdoXvTCewut4lT6vAlRGu08TgrGq3k2aeS
   gkF6/NlsHS+1SArOT1OzOrcl1sP9AIVggb+nH00KitQSY9q3JvGPQ8GKC
   A==;
X-CSE-ConnectionGUID: ioh3m3k1TCaapsC9WFNN1A==
X-CSE-MsgGUID: XLtKPNkPQXKIt6yKFi85Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81074228"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="81074228"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:48 -0700
X-CSE-ConnectionGUID: 3ddyvoeJT1KyPd5IgZv5Tw==
X-CSE-MsgGUID: WXHlONIZSjuUuikFyU/rXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184938316"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:45 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A939E121F07;
	Mon, 27 Oct 2025 15:32:37 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDNKq-00000001eDj-2mbu;
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
Subject: [PATCH 6/6] dmaengine: zynqmp_dma: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 15:32:32 +0200
Message-ID: <20251027133232.392898-6-sakari.ailus@linux.intel.com>
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
 drivers/dma/xilinx/zynqmp_dma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index f7e584de4335..7bb3716e60da 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -695,7 +695,6 @@ static void zynqmp_dma_free_chan_resources(struct dma_chan *dchan)
 		(2 * ZYNQMP_DMA_DESC_SIZE(chan) * ZYNQMP_DMA_NUM_DESCS),
 		chan->desc_pool_v, chan->desc_pool_p);
 	kfree(chan->sw_desc_pool);
-	pm_runtime_mark_last_busy(chan->dev);
 	pm_runtime_put_autosuspend(chan->dev);
 }
 
@@ -1145,7 +1144,6 @@ static int zynqmp_dma_probe(struct platform_device *pdev)
 		goto free_chan_resources;
 	}
 
-	pm_runtime_mark_last_busy(zdev->dev);
 	pm_runtime_put_sync_autosuspend(zdev->dev);
 
 	return 0;
-- 
2.47.3


