Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66429295777
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 07:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2507669AbgJVFCC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 01:02:02 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:31420 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2507656AbgJVFCC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 01:02:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603342920; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: References: In-Reply-To: Message-Id: Date: Subject: Cc:
 To: From: Sender; bh=p8DrmjkJQ+oHJ54FdquYm+sXfHeHtA9olhAJnkqW0sU=; b=uSUzcSnzsF4vUD36jaieib/2GorN6xj3yeBLDtgql29hWcX53GuyYoMIYLsJmuLZ9z4SFqws
 wzmETv4r+O5HSqYT5r+jbL5OR2RgbkZX82f+TDVATsKFFVhGa8zzOna9mdy0Z7ESWtvd2alw
 l8UDJuovm+2ncldx68xuo7BWCxY=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f911248e9e942744c006550 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Oct 2020 05:02:00
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B813DC43382; Thu, 22 Oct 2020 05:01:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AD62EC433C9;
        Thu, 22 Oct 2020 05:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AD62EC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        tanmay@codeaurora.org, khsieh@codeaurora.org
Subject: [PATCH 1/4] drm: allow drm_atomic_print_state() to accept any drm_printer
Date:   Wed, 21 Oct 2020 22:01:45 -0700
Message-Id: <20201022050148.27105-2-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201022050148.27105-1-abhinavk@codeaurora.org>
References: <20201022050148.27105-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently drm_atomic_print_state() internally allocates and uses a
drm_info printer. Allow it to accept any drm_printer type so that
the API can be leveraged even for taking drm snapshot.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/drm_atomic.c        | 17 ++++++++++++-----
 drivers/gpu/drm/drm_atomic_uapi.c   |  4 +++-
 drivers/gpu/drm/drm_crtc_internal.h |  4 +++-
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 58527f151984..e7079a5f439c 100644
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
@@ -1543,9 +1544,9 @@ int __drm_atomic_helper_set_config(struct drm_mode_set *set,
 }
 EXPORT_SYMBOL(__drm_atomic_helper_set_config);
 
-void drm_atomic_print_state(const struct drm_atomic_state *state)
+void drm_atomic_print_state(const struct drm_atomic_state *state,
+		struct drm_printer *p)
 {
-	struct drm_printer p = drm_info_printer(state->dev->dev);
 	struct drm_plane *plane;
 	struct drm_plane_state *plane_state;
 	struct drm_crtc *crtc;
@@ -1554,17 +1555,23 @@ void drm_atomic_print_state(const struct drm_atomic_state *state)
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
+EXPORT_SYMBOL(drm_atomic_print_state);
 
 static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 			     bool take_locks)
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 25c269bc4681..d9ae86c92608 100644
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
+			drm_atomic_print_state(state, &p);
 
 		ret = drm_atomic_commit(state);
 	}
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index da96b2f64d7e..d34215366936 100644
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
+void drm_atomic_print_state(const struct drm_atomic_state *state,
+		struct drm_printer *p);
 
 /* drm_atomic_uapi.c */
 int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

