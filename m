Return-Path: <linux-arm-msm+bounces-28373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B3B95049D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 14:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 480441F24B21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 12:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9892199238;
	Tue, 13 Aug 2024 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYaRD188"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D4A199230;
	Tue, 13 Aug 2024 12:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723551187; cv=none; b=M5RI0TObwUdoWtUGDWeAXuM4te6IB76e15j8EA+K/zgJhOQ5kiutxFRrSWyf13+7jTgcL6yb3i896FGGbwHcozsZ+9SS0+WBUxlji0jSPEkt5ecvvECIYflUlkagLuR3LaznW5bdR0QJ/99OJ8y92Vw/+7BVYELiOEaFtY//nYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723551187; c=relaxed/simple;
	bh=e7aAkUAOvQI0AJNRk7wUAPuWDxjmt0yF+bVjRvPT56Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F0tNB5xyhhkXNzPvLJiVd+zehaazGiRO76XNW61XgiWEJiqrHthmG2qFT55G13ziKCbCQ55+cYkJp1dvRd5mex8rDHfqY4KCvfg/VgtYvcyfZxIDX76lr6iENQ6QZ+F1gvCRoS9bBZ4hE+x/2CBKFgafL09m5YyY4LYPK+kIsrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYaRD188; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723551186; x=1755087186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e7aAkUAOvQI0AJNRk7wUAPuWDxjmt0yF+bVjRvPT56Y=;
  b=LYaRD188klC/n+CnpHyXLl20hv0kP1xJzlN9FKsDBnVNgVnlU8uSYDmI
   P0vhRSxDVWMkJUYuNJv1lfBF8ro7MPforniY/Qr/2FTf7Vqo8NosUQThF
   EH/hwQfSjGg7VnK2BecSUCIVpigKzslYQNxaSkgvFlxvenFlsevh/3zqM
   PB59kSK48gi+wBQMjryGlhyB6RfL/1bDjd6Wfw4UK6c2+peX/txrSV16+
   O+GtUkGpKNdZGJuVQuB+MoykDBFP1v6Xrievf3rVHt50X+iZt+eY+brpm
   OzNm/1+TlaKMRnQdG0oCp/KMKpJlWCtGaPTZLI7yCNjmHvkHDOSoQQzVL
   g==;
X-CSE-ConnectionGUID: 6s22v9DMRwqI6qUuHm8V/g==
X-CSE-MsgGUID: tbgyPD5nQ3edK5m6eCs53Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21682655"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="21682655"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 05:13:05 -0700
X-CSE-ConnectionGUID: +U7NRZz+RJCuoKL1wc8Auw==
X-CSE-MsgGUID: DeUeRhHlR4m/2bjsj/r5vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; 
   d="scan'208";a="89450958"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2024 05:12:59 -0700
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
Subject: [PATCH 2/3] drm/msm: clean up fault injection usage
Date: Tue, 13 Aug 2024 15:12:36 +0300
Message-Id: <20240813121237.2382534-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240813121237.2382534-1-jani.nikula@intel.com>
References: <20240813121237.2382534-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

With the proper stubs in place in linux/fault-inject.h, we can remove a
bunch of conditional compilation for CONFIG_FAULT_INJECTION=n.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 2 --
 drivers/gpu/drm/msm/msm_drv.c     | 2 --
 drivers/gpu/drm/msm/msm_drv.h     | 4 ----
 3 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 4494f6d1c7cb..7ab607252d18 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -357,12 +357,10 @@ void msm_debugfs_init(struct drm_minor *minor)
 	if (priv->kms && priv->kms->funcs->debugfs_init)
 		priv->kms->funcs->debugfs_init(priv->kms, minor);
 
-#ifdef CONFIG_FAULT_INJECTION
 	fault_create_debugfs_attr("fail_gem_alloc", minor->debugfs_root,
 				  &fail_gem_alloc);
 	fault_create_debugfs_attr("fail_gem_iova", minor->debugfs_root,
 				  &fail_gem_iova);
-#endif
 }
 #endif
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9c33f4e3f822..6938410f4fc7 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -58,10 +58,8 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
-#ifdef CONFIG_FAULT_INJECTION
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
-#endif
 
 static int msm_drm_uninit(struct device *dev)
 {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index be016d7b4ef1..9b953860131b 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -33,12 +33,8 @@
 #include <drm/msm_drm.h>
 #include <drm/drm_gem.h>
 
-#ifdef CONFIG_FAULT_INJECTION
 extern struct fault_attr fail_gem_alloc;
 extern struct fault_attr fail_gem_iova;
-#else
-#  define should_fail(attr, size) 0
-#endif
 
 struct msm_kms;
 struct msm_gpu;
-- 
2.39.2


