Return-Path: <linux-arm-msm+bounces-5378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A9C818729
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 13:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 775B41F25E1A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 12:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B789E171AB;
	Tue, 19 Dec 2023 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAr9T/GX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5691A17758;
	Tue, 19 Dec 2023 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702987992; x=1734523992;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+MrEafeNI2bji1qIUK95N5xIPX4N/cZzvPCOZdaopQg=;
  b=mAr9T/GXNHD0NHVMuvxRMASYFRJscYSZA3WfLIU8TihjG6cXd3PiWDgA
   js5TKztJ7mrOi3rUgavf0yqrAqgEIJLJBGBJXXbK4W1c/d8skUGGMgyi9
   H0Bd8XBJ1F8CYrxzyPnxUlqCdbX9/a81sUuLaZ18Vpgh3TZjRF4CRLB3L
   OJocWN0MHEziVuOS+IKLBz9VmnMUq/2AQ/2EEHefz70/iSlnCKBsr1l1b
   HH7ua3zcQTyvv993xNFL6xulGNNz0StL83Qa8WVOe/eHU2evFDgrZe9we
   XNEj+H/OweEWn9355+ePldIpEAV8j2S2iHBNPZGrCTmKaHHs/t81Kv+h3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="380633930"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="380633930"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 04:12:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="899342018"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="899342018"
Received: from alexeyze-mobl.ger.corp.intel.com (HELO localhost) ([10.252.34.118])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 04:12:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	linux-sound@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4] ASoC: hdmi-codec: drop drm/drm_edid.h include
Date: Tue, 19 Dec 2023 14:12:10 +0200
Message-Id: <20231219121210.1076152-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214092856.4019251-1-jani.nikula@intel.com>
References: <20231214092856.4019251-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit

hdmi-codec.h does not appear to directly need drm/drm_edid.h for
anything. Remove it.

There are some files that get drm/edid.h by proxy; include it where
needed.

v2-v4: Fix build (kernel test robot <lkp@intel.com>)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

I'm pretty sure I haven't compiled everything that might implicitly
depend on the include. However, the right thing to do is to include
drm_edid.h where needed, not from somewhat random intermediate
headers. I hope this uncovers anything I missed.
---
 drivers/gpu/drm/bridge/lontium-lt9611.c    | 1 +
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c  | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c        | 1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c             | 1 +
 include/sound/hdmi-codec.h                 | 1 -
 6 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 9663601ce098..b9205d14d943 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -18,6 +18,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index e971b75e90ad..f3f130c1ef0a 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -21,6 +21,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 52d91a0df85e..fa63a21bdd1c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -31,6 +31,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1b88fb52726f..766c8d01e6b3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -11,6 +11,7 @@
 #include <linux/of_irq.h>
 #include <linux/delay.h>
 #include <drm/display/drm_dp_aux_bus.h>
+#include <drm/drm_edid.h>
 
 #include "msm_drv.h"
 #include "msm_kms.h"
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index f05e2c95a60d..34f807ed1c31 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -35,6 +35,7 @@
 #include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
diff --git a/include/sound/hdmi-codec.h b/include/sound/hdmi-codec.h
index 9b162ac1e08e..5e1a9eafd10f 100644
--- a/include/sound/hdmi-codec.h
+++ b/include/sound/hdmi-codec.h
@@ -12,7 +12,6 @@
 
 #include <linux/of_graph.h>
 #include <linux/hdmi.h>
-#include <drm/drm_edid.h>
 #include <sound/asoundef.h>
 #include <sound/soc.h>
 #include <uapi/sound/asound.h>
-- 
2.39.2


