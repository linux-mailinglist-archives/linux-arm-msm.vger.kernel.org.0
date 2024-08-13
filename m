Return-Path: <linux-arm-msm+bounces-28374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E979504A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 14:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D8211F24AC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 12:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECCD81991D8;
	Tue, 13 Aug 2024 12:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTWuLgt2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87BE187348;
	Tue, 13 Aug 2024 12:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723551206; cv=none; b=Qj/69f98U9RjbYQK82FlnQNJcMNI00RvV7RJaV24fImGgedbgsrZPmmd0ZGHO9IEhMIH8aB/OK7UcdSVgx1p0oH1K5uTrQPNlR4dNbNGT+5xmGdjxliR3rlXbfcX50xXH8oIOuRyagM3SUoYwPCS0V9+t4tDZy+YPx/9uL8+MOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723551206; c=relaxed/simple;
	bh=kIIgzNfbPPOeGVzqpET5xjIMVCHKwtwP40zzL2GwutI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dF+tCBvyuff26GQS6bMn26AKu0pzZ2ZjUiv3qYRU61CNl22SFiTbzMlL3ZYB4+fwFNlz3TF0Z5q9TFQJvpUzFfAoOGe7bGt9oH8QWnljsd1B//gY4Bb89H+KVbnfoN0lereQVJ340UiW8TkHYfL5aHdM/fEehEQhLli/QNjDc9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTWuLgt2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723551205; x=1755087205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kIIgzNfbPPOeGVzqpET5xjIMVCHKwtwP40zzL2GwutI=;
  b=HTWuLgt21CuvWjQwidL5CnOOcinycqDcZyetg2rujCp91JIGH0XL80oh
   DzGAWtMuDpho9yNVkB6JeU5DR54pxlKqRl2gwfovdRoImfXdOE/YxpFNB
   z/EghsvcFzpbML5ZYjeZ61ws/CgZFUlPLBMcIBnYVYPMQImq61PD8fuA7
   aCmEzxlAi9fyINOL1S3sWqXpm3qvlzoJyjJdCnp+dayk2nYp3/dVkZTN3
   U+uG8mi3c84ig46X2UYvummQP6I3u/fV7dxuHZcKnQ5MDzlCSqrfPRWXN
   5OaqUsTJfWYxEwk388nd3d3JwAxs0lgDHEoiBydte+LnPjVcpJcH0tZC9
   A==;
X-CSE-ConnectionGUID: 44w/EPhDQQSnLNF3gBH7cg==
X-CSE-MsgGUID: EgZrJX2+TwieVJrV5ES0xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21682779"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21682779"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 05:13:12 -0700
X-CSE-ConnectionGUID: lGY95YNjTQ+6J6x1sGUetw==
X-CSE-MsgGUID: rQdXfg7pS2OG+6k4DkMosw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="89451014"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 05:13:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	akinobu.mita@gmail.com,
	akpm@linux-foundation.org,
	lucas.demarchi@intel.com,
	rodrigo.vivi@intel.com,
	thomas.hellstrom@linux.intel.com,
	robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	jani.nikula@intel.com
Subject: [PATCH 3/3] drm/xe: clean up fault injection usage
Date: Tue, 13 Aug 2024 15:12:37 +0300
Message-Id: <20240813121237.2382534-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240813121237.2382534-1-jani.nikula@intel.com>
References: <20240813121237.2382534-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

With the proper stubs in place in linux/fault-inject.h, we can remove a
bunch of conditional compilation for CONFIG_FAULT_INJECTION=n.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c |  7 +------
 drivers/gpu/drm/xe/xe_gt.h      | 10 ++--------
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 1011e5d281fa..b381bfb634f7 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -6,6 +6,7 @@
 #include "xe_debugfs.h"
 
 #include <linux/debugfs.h>
+#include <linux/fault-inject.h>
 #include <linux/string_helpers.h>
 
 #include <drm/drm_debugfs.h>
@@ -26,10 +27,7 @@
 #include "xe_vm.h"
 #endif
 
-#ifdef CONFIG_FAULT_INJECTION
-#include <linux/fault-inject.h> /* XXX: fault-inject.h is broken */
 DECLARE_FAULT_ATTR(gt_reset_failure);
-#endif
 
 static struct xe_device *node_to_xe(struct drm_info_node *node)
 {
@@ -214,8 +212,5 @@ void xe_debugfs_register(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_debugfs_register(gt);
 
-#ifdef CONFIG_FAULT_INJECTION
 	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
-#endif
-
 }
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 8b1a5027dcf2..ee138e9768a2 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -6,6 +6,8 @@
 #ifndef _XE_GT_H_
 #define _XE_GT_H_
 
+#include <linux/fault-inject.h>
+
 #include <drm/drm_util.h>
 
 #include "xe_device.h"
@@ -19,19 +21,11 @@
 
 #define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
 
-#ifdef CONFIG_FAULT_INJECTION
-#include <linux/fault-inject.h> /* XXX: fault-inject.h is broken */
 extern struct fault_attr gt_reset_failure;
 static inline bool xe_fault_inject_gt_reset(void)
 {
 	return should_fail(&gt_reset_failure, 1);
 }
-#else
-static inline bool xe_fault_inject_gt_reset(void)
-{
-	return false;
-}
-#endif
 
 struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
 int xe_gt_init_hwconfig(struct xe_gt *gt);
-- 
2.39.2


