Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6179E29FA5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 02:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725372AbgJ3BMZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 21:12:25 -0400
Received: from z5.mailgun.us ([104.130.96.5]:23112 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbgJ3BMZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 21:12:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604020344; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: References: In-Reply-To: Message-Id: Date: Subject: Cc:
 To: From: Sender; bh=yrRq+Yyojnj/WiiSBZi31VWL/zQhOFjHtFCa2OEUncA=; b=xHd2UZCWlL2FvU+yD1wTisK1AhXUcNL3oEET486KQ9Ulm0WXnnpMoWAjonzN+aEuSBtm0EnK
 Q8hMmhjYT/q6RRxp3VWhWTJYOiIpaDl2vRUC00oumIvn6/Ojp+vUqVOSfAp34qwJEzq4QSyJ
 oiRV5OMA7N2boU6Q3G9wxZWad0A=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f9b65d9bdb473cf165e46fa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 01:01:13
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5E79FC433C6; Fri, 30 Oct 2020 01:01:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28920C433C6;
        Fri, 30 Oct 2020 01:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28920C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        tanmay@codeaurora.org, khsieh@codeaurora.org, daniel@ffwll.ch,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2 1/4] drm: allow drm_atomic_print_state() to accept any drm_printer
Date:   Thu, 29 Oct 2020 18:00:58 -0700
Message-Id: <20201030010101.4345-2-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201030010101.4345-1-abhinavk@codeaurora.org>
References: <20201030010101.4345-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently drm_atomic_print_state() internally allocates and uses a
drm_info printer. Allow it to accept any drm_printer type so that
the API can be leveraged even for taking drm snapshot.

Rename the drm_atomic_print_state() to drm_atomic_print_new_state()
so that it reflects its functionality better.

changes in v2:
- Rename the function drm_atomic_print_state to
  drm_atomic_print_new_state and update the commit text
- Fix kbot errors
- Add kernel doc for the newly exported function

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/drm_atomic.c                  | 29 +++++++++++++++----
 drivers/gpu/drm/drm_atomic_uapi.c             |  4 ++-
 drivers/gpu/drm/drm_crtc_internal.h           |  4 ++-
 .../gpu/drm/selftests/test-drm_framebuffer.c  |  1 +
 4 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 58527f151984..5df7b67ced78 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1,6 +1,7 @@
 /*
  * Copyright (C) 2014 Red Hat
  * Copyright (C) 2014 Intel Corp.
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -1543,9 +1544,21 @@ int __drm_atomic_helper_set_config(struct drm_mode_set *set,
 }
 EXPORT_SYMBOL(__drm_atomic_helper_set_config);
 
-void drm_atomic_print_state(const struct drm_atomic_state *state)
+/**
+ * drm_atomic_print_new_state - prints drm atomic state
+ * @state: atomic configuration to check
+ * @p: drm printer
+ *
+ * This functions prints the drm atomic state snapshot using the drm printer
+ * which is passed to it. This snapshot can be used for debugging purposes.
+ *
+ * Note that this function looks into the new state objects and hence its not
+ * safe to be used after the call to drm_atomic_helper_commit_hw_done().
+ *
+ */
+void drm_atomic_print_new_state(const struct drm_atomic_state *state,
+		struct drm_printer *p)
 {
-	struct drm_printer p = drm_info_printer(state->dev->dev);
 	struct drm_plane *plane;
 	struct drm_plane_state *plane_state;
 	struct drm_crtc *crtc;
@@ -1554,17 +1567,23 @@ void drm_atomic_print_state(const struct drm_atomic_state *state)
 	struct drm_connector_state *connector_state;
 	int i;
 
+	if (!p) {
+		DRM_ERROR("invalid drm printer\n");
+		return;
+	}
+
 	DRM_DEBUG_ATOMIC("checking %p\n", state);
 
 	for_each_new_plane_in_state(state, plane, plane_state, i)
-		drm_atomic_plane_print_state(&p, plane_state);
+		drm_atomic_plane_print_state(p, plane_state);
 
 	for_each_new_crtc_in_state(state, crtc, crtc_state, i)
-		drm_atomic_crtc_print_state(&p, crtc_state);
+		drm_atomic_crtc_print_state(p, crtc_state);
 
 	for_each_new_connector_in_state(state, connector, connector_state, i)
-		drm_atomic_connector_print_state(&p, connector_state);
+		drm_atomic_connector_print_state(p, connector_state);
 }
+EXPORT_SYMBOL(drm_atomic_print_new_state);
 
 static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 			     bool take_locks)
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 25c269bc4681..b4b3cb28a8ea 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -2,6 +2,7 @@
  * Copyright (C) 2014 Red Hat
  * Copyright (C) 2014 Intel Corp.
  * Copyright (C) 2018 Intel Corp.
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -1294,6 +1295,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	struct drm_out_fence_state *fence_state;
 	int ret = 0;
 	unsigned int i, j, num_fences;
+	struct drm_printer p = drm_info_printer(dev->dev);
 
 	/* disallow for drivers not supporting atomic: */
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
@@ -1413,7 +1415,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 		ret = drm_atomic_nonblocking_commit(state);
 	} else {
 		if (drm_debug_enabled(DRM_UT_STATE))
-			drm_atomic_print_state(state);
+			drm_atomic_print_new_state(state, &p);
 
 		ret = drm_atomic_commit(state);
 	}
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index da96b2f64d7e..2bd56ec9fb0e 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -5,6 +5,7 @@
  *   Jesse Barnes <jesse.barnes@intel.com>
  * Copyright © 2014 Intel Corporation
  *   Daniel Vetter <daniel.vetter@ffwll.ch>
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -233,7 +234,8 @@ int __drm_atomic_helper_disable_plane(struct drm_plane *plane,
 int __drm_atomic_helper_set_config(struct drm_mode_set *set,
 				   struct drm_atomic_state *state);
 
-void drm_atomic_print_state(const struct drm_atomic_state *state);
+void drm_atomic_print_new_state(const struct drm_atomic_state *state,
+		struct drm_printer *p);
 
 /* drm_atomic_uapi.c */
 int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
diff --git a/drivers/gpu/drm/selftests/test-drm_framebuffer.c b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
index 2d29ea6f92e2..9296c68cbe71 100644
--- a/drivers/gpu/drm/selftests/test-drm_framebuffer.c
+++ b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
@@ -8,6 +8,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "../drm_crtc_internal.h"
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

