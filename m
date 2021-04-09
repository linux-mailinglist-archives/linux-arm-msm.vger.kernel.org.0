Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE9063591F8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 04:28:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232620AbhDIC3B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 22:29:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:11179 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232616AbhDIC3B (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 22:29:01 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617935329; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: References: In-Reply-To: Message-Id: Date: Subject: Cc:
 To: From: Sender; bh=Ag27HkJ+10ibwDc+VxR4qHnNyYcVdG9wEnqiGuaogQM=; b=mU9Bw/7F24awQZulqpLPzCRMJWyK4yMecJIqfKgeGGpAv0Xkl9dCBSxKsWeX66xo/GiKzQDV
 Ud5y8vVLKtWwbgIml9wUaet6N3kqwaRxwMXO1DD+7oXksWEefRVU2cdTBDQH7lMrwHoeHqPX
 vnieKk9aTdFCAJaQWKO0L+hmlqs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 606fbbe08166b7eff71327ea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Apr 2021 02:28:48
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 00603C43467; Fri,  9 Apr 2021 02:28:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 09F64C433CA;
        Fri,  9 Apr 2021 02:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 09F64C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, daniel@ffwll.ch
Subject: [PATCH v3 1/3] drm: allow drm_atomic_print_state() to accept any drm_printer
Date:   Thu,  8 Apr 2021 19:28:35 -0700
Message-Id: <1617935317-15571-2-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617935317-15571-1-git-send-email-abhinavk@codeaurora.org>
References: <1617935317-15571-1-git-send-email-abhinavk@codeaurora.org>
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

changes in v3:
- Remove empty line in the kernel doc

Change-Id: Ie425b15b9d5e84f7bad2514f9990181d05019cbf
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_atomic.c                     | 28 +++++++++++++++++++-----
 drivers/gpu/drm/drm_atomic_uapi.c                |  4 +++-
 drivers/gpu/drm/drm_crtc_internal.h              |  4 +++-
 drivers/gpu/drm/selftests/test-drm_framebuffer.c |  1 +
 4 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index dda6005..7041a26 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1,6 +1,7 @@
 /*
  * Copyright (C) 2014 Red Hat
  * Copyright (C) 2014 Intel Corp.
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
  *
  * Permission is hereby granted, free of charge, to any person obtaining a
  * copy of this software and associated documentation files (the "Software"),
@@ -1573,9 +1574,20 @@ int __drm_atomic_helper_set_config(struct drm_mode_set *set,
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
+ */
+void drm_atomic_print_new_state(const struct drm_atomic_state *state,
+		struct drm_printer *p)
 {
-	struct drm_printer p = drm_info_printer(state->dev->dev);
 	struct drm_plane *plane;
 	struct drm_plane_state *plane_state;
 	struct drm_crtc *crtc;
@@ -1584,17 +1596,23 @@ void drm_atomic_print_state(const struct drm_atomic_state *state)
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
index 268bb69..c340a67 100644
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
@@ -1321,6 +1322,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	struct drm_out_fence_state *fence_state;
 	int ret = 0;
 	unsigned int i, j, num_fences;
+	struct drm_printer p = drm_info_printer(dev->dev);
 
 	/* disallow for drivers not supporting atomic: */
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
@@ -1453,7 +1455,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 		ret = drm_atomic_nonblocking_commit(state);
 	} else {
 		if (drm_debug_enabled(DRM_UT_STATE))
-			drm_atomic_print_state(state);
+			drm_atomic_print_new_state(state, &p);
 
 		ret = drm_atomic_commit(state);
 	}
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 54d4cf1..1ca51ad 100644
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
@@ -236,7 +237,8 @@ int __drm_atomic_helper_disable_plane(struct drm_plane *plane,
 int __drm_atomic_helper_set_config(struct drm_mode_set *set,
 				   struct drm_atomic_state *state);
 
-void drm_atomic_print_state(const struct drm_atomic_state *state);
+void drm_atomic_print_new_state(const struct drm_atomic_state *state,
+		struct drm_printer *p);
 
 /* drm_atomic_uapi.c */
 int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
diff --git a/drivers/gpu/drm/selftests/test-drm_framebuffer.c b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
index 789f227..61b44d3 100644
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

