Return-Path: <linux-arm-msm+bounces-78921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC52C0E155
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1ED619C14FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B46561F418D;
	Mon, 27 Oct 2025 13:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKHJxAhd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E265C1F3B8A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571967; cv=none; b=ChsBxurpoVs9zOnQhMWMS51unA9InnMUGhbC5dtgPWyTiH5aAkRl0dv3iPKAhAD0Fhw7vd03Mzar5eZpoSxAAS6JVe4m7LOChvVl9ws4M0oFPct8pzCoyQGrshel1EZRgpAYyvMRjP017n8S0Hj6zVQGaVrRWKBc2HOW9i173Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571967; c=relaxed/simple;
	bh=mSv4aivh/25dKTV3yCbWUl1DefAAZN9jvBNFADSthdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9HC6ueqLDd85LwgAw24oaODS7QxRZ+TOVwnOrYxY6lzHiT9r9aOZPrWgYRBjp1Ox3FCwxOcMVE7PMbVQLV085wJP8KcrhpkWsBUFLUnSeBRJ/zNVXBSCGNKpUFVdoHIAyxcmnz/RKuH5pml6P2lVU5SAAQ4NLaV0y4auCRrW34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKHJxAhd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761571966; x=1793107966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mSv4aivh/25dKTV3yCbWUl1DefAAZN9jvBNFADSthdA=;
  b=aKHJxAhdt/L8s3CliLDxDcN+ETVwhuMrvay2YPrDbyaZ/445i1TKgJw7
   zmbK8Uqydwe///+rniuGcQoorN5vbxq6uO7trSmln8CmcfdTZmXgAlyxI
   mH3BMR8fK2e6gmHvCTapicca9DPpqfGYNvM7exv2HQSlt3H0t+xWEv5a/
   9+rIIHLVdnelr84B5ClqLOdifiSzLweZJmc+5uuJR/58FIAjVYrk+Jz/t
   aLOD/vnUHj0tFUz5YGyxbMk/yOatFfJWLlW/X/DfVLnL9KI7NkkT87697
   4oo/Siz7ikys959Ed/3Eotz73FZEoeE6TMIZ5roWsZq91xDFL0P5xWFM4
   g==;
X-CSE-ConnectionGUID: uJvZ0/4CQF6NkMeQCJo3TA==
X-CSE-MsgGUID: WnNtv3l6RC2aGPzJc0VXLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74324548"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="74324548"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:44 -0700
X-CSE-ConnectionGUID: U+nLFdlWRzyJoRqjD+5+rw==
X-CSE-MsgGUID: z07qLKJvQUqaBN4Doutzcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="190176389"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A3D22121F01;
	Mon, 27 Oct 2025 15:32:37 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDNKq-00000001eDf-2iIp;
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
Subject: [PATCH 5/6] dmaengine: ti: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 15:32:31 +0200
Message-ID: <20251027133232.392898-5-sakari.ailus@linux.intel.com>
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
 drivers/dma/ti/cppi41.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
index 8d8c3d6038fc..88756dccd62c 100644
--- a/drivers/dma/ti/cppi41.c
+++ b/drivers/dma/ti/cppi41.c
@@ -390,7 +390,6 @@ static int cppi41_dma_alloc_chan_resources(struct dma_chan *chan)
 	if (!c->is_tx)
 		cppi_writel(c->q_num, c->gcr_reg + RXHPCRA0);
 
-	pm_runtime_mark_last_busy(cdd->ddev.dev);
 	pm_runtime_put_autosuspend(cdd->ddev.dev);
 
 	return 0;
@@ -411,7 +410,6 @@ static void cppi41_dma_free_chan_resources(struct dma_chan *chan)
 
 	WARN_ON(!list_empty(&cdd->pending));
 
-	pm_runtime_mark_last_busy(cdd->ddev.dev);
 	pm_runtime_put_autosuspend(cdd->ddev.dev);
 }
 
@@ -509,7 +507,6 @@ static void cppi41_dma_issue_pending(struct dma_chan *chan)
 		cppi41_run_queue(cdd);
 	spin_unlock_irqrestore(&cdd->lock, flags);
 
-	pm_runtime_mark_last_busy(cdd->ddev.dev);
 	pm_runtime_put_autosuspend(cdd->ddev.dev);
 }
 
@@ -627,7 +624,6 @@ static struct dma_async_tx_descriptor *cppi41_dma_prep_slave_sg(
 	txd = &c->txd;
 
 err_out_not_ready:
-	pm_runtime_mark_last_busy(cdd->ddev.dev);
 	pm_runtime_put_autosuspend(cdd->ddev.dev);
 
 	return txd;
@@ -1139,7 +1135,6 @@ static int cppi41_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_of;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
-- 
2.47.3


