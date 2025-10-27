Return-Path: <linux-arm-msm+bounces-78917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFE3C0E167
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B6DAD4F602D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 13:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE021E832A;
	Mon, 27 Oct 2025 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxxYcXQy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091FA1E3DE5
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 13:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761571965; cv=none; b=fMg+S7ba99f4vXR5qR+O+5+4shSpmuik1MYASewUgdGNfhP2P+0/UY2jhcBfwKG8d1Fdd8IRUsHvIX3hherUAVEaMh+cfBp1vnm0zkloBzF49XbopmiGKsH6dsw0epAwR049MYBQDoyeDcl988L7tMGdIM1Fl4PLwvnpYBDbSPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761571965; c=relaxed/simple;
	bh=AZN7S6QCt7r5m/F5D5zkopp7+Wbsjp/4T46MA6TqB7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m9D/k4dxESjEM6Zb3YSGy/iI/UJaaBtZyYaszjeFtveYXwUGMlUJRZVJfm4BzkUznhEKzQzu0I++re2cJ/CGoU1EL3pg1ZoBOVKTMpkSC3YTeFn1ciT+QUC4h4kwY8Akbg6PnS0lpl1mSAdqVsJhej1eRUtz4p9gyu1t4382WZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxxYcXQy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761571963; x=1793107963;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AZN7S6QCt7r5m/F5D5zkopp7+Wbsjp/4T46MA6TqB7c=;
  b=ZxxYcXQyJ53E15iqjScnNfFOEVZJCJBbCUNGj/BC2SEMcj4Af3c5qnrI
   a73HSYmo1boErMTCXMHU/BzPbqQQl/GuMiiu3WRAFn8f5YcSMhRrqeTto
   g94Ng/kKMvrSCO0nEqkMAqUm0xPlNt+EK9o413YGBHg2dxWf2+Ww+7FAe
   1N0XpJUvJd/7ykwIw7N/PgMYb/XTu151twKfGAspSQHxMthSHtzeYl4jd
   KR2IqpL4Vj0ZHibH3eSuyc41G6bPJH4ZW3VEgGOemOvW8lNzvI2dC0ZQn
   L6zlM3iJNbf1YUmyp81uDW1OkWs6y2td3KGwDp9nVWJX0kPqTVl+AW0bk
   g==;
X-CSE-ConnectionGUID: Ko0NWG9NTAultthxHYEmxg==
X-CSE-MsgGUID: 4tD4iqN7Rm65kicdqJke+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62855324"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="62855324"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:42 -0700
X-CSE-ConnectionGUID: WRh17/xzRBiIO1cTreqlKQ==
X-CSE-MsgGUID: 3+bCGemdTLKjv6J+Nb+LFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="185391823"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:32:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9E2C3121EC5;
	Mon, 27 Oct 2025 15:32:37 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDNKq-00000001eDQ-2TIh;
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
Subject: [PATCH 1/6] dmaengine: at_xdmac: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 15:32:27 +0200
Message-ID: <20251027133232.392898-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
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
 drivers/dma/at_xdmac.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index 3fbc74710a13..ada96d490847 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -379,7 +379,6 @@ static void at_xdmac_runtime_suspend_descriptors(struct at_xdmac_chan *atchan)
 		if (!desc->active_xfer)
 			continue;
 
-		pm_runtime_mark_last_busy(atxdmac->dev);
 		pm_runtime_put_autosuspend(atxdmac->dev);
 	}
 }
@@ -413,7 +412,6 @@ static bool at_xdmac_chan_is_enabled(struct at_xdmac_chan *atchan)
 
 	ret = !!(at_xdmac_chan_read(atchan, AT_XDMAC_GS) & atchan->mask);
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	return ret;
@@ -446,7 +444,6 @@ static void at_xdmac_off(struct at_xdmac *atxdmac, bool suspend_descriptors)
 		}
 	}
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 }
 
@@ -1676,7 +1673,6 @@ at_xdmac_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
 
 spin_unlock:
 	spin_unlock_irqrestore(&atchan->lock, flags);
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 	return ret;
 }
@@ -1758,7 +1754,6 @@ static void at_xdmac_handle_error(struct at_xdmac_chan *atchan)
 		__func__, &bad_desc->lld.mbr_sa, &bad_desc->lld.mbr_da,
 		bad_desc->lld.mbr_ubc);
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	/* Then continue with usual descriptor management */
@@ -1822,7 +1817,6 @@ static void at_xdmac_tasklet(struct tasklet_struct *t)
 	 * Decrement runtime PM ref counter incremented in
 	 * at_xdmac_start_xfer().
 	 */
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 }
 
@@ -1954,7 +1948,6 @@ static int at_xdmac_device_pause(struct dma_chan *chan)
 
 	spin_unlock_irqrestore(&atchan->lock, flags);
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	return 0;
@@ -1998,7 +1991,6 @@ static int at_xdmac_device_resume(struct dma_chan *chan)
 
 unlock:
 	spin_unlock_irqrestore(&atchan->lock, flags);
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	return ret;
@@ -2041,7 +2033,6 @@ static int at_xdmac_device_terminate_all(struct dma_chan *chan)
 	clear_bit(AT_XDMAC_CHAN_IS_CYCLIC, &atchan->status);
 	spin_unlock_irqrestore(&atchan->lock, flags);
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	return 0;
@@ -2235,7 +2226,6 @@ static int __maybe_unused atmel_xdmac_resume(struct device *dev)
 		}
 	}
 
-	pm_runtime_mark_last_busy(atxdmac->dev);
 	pm_runtime_put_autosuspend(atxdmac->dev);
 
 	return 0;
@@ -2412,7 +2402,6 @@ static int at_xdmac_probe(struct platform_device *pdev)
 
 	at_xdmac_axi_config(pdev);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
-- 
2.47.3


