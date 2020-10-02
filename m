Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38609280C19
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Oct 2020 03:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387485AbgJBBrN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 21:47:13 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:31554 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727780AbgJBBrN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 21:47:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601603231; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=VlLVsjAaypSBUTBXNbvMUJcNoFogPIprQZ2479gn5yc=; b=FqXLakpNuZuBCAmxdU5HNTE8nJQwNL1aV1F9J2BnXkHccxaf8Cv4X7MIBxewX62mKaj2jdiQ
 2+htYFe7uPG61OFU7SbC7EdsxHFMrISCqYBwmS4dxHhj9kOdo/peaPccvuyw+2U1AvYTUYxv
 ejItOiFfoXFLVr+YkGjIan7M82U=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f76869f80da0872b7bad57b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Oct 2020 01:47:11
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5F09AC433F1; Fri,  2 Oct 2020 01:47:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 468AEC433CA;
        Fri,  2 Oct 2020 01:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 468AEC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        tanmay@codeaurora.org, khsieh@codeaurora.org, daniel@ffwll.ch
Subject: [RFC PATCH] drm: add support for taking drm atomic state snapshot
Date:   Thu,  1 Oct 2020 18:47:00 -0700
Message-Id: <20201002014700.32085-1-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to capture the drm atomic state snapshot which
can then be wired up with the devcoredump of the relevant display
errors to give useful information to debug the issues.

Since the devcoredump is read by usermode and it is allowed
upto 5 minutes to read the coredump, capturing the snapshot that
time will not result in an accurate result.

Rather we should capture the snapshot right after the error
happened. Hence add support for capturing this snapshot by
re-using the drm_atomic_helper_duplicate_state() API to support
a non-context version.

Also add nolock versions of the drm_atomic_get_***_state() APIs
which can be used to get snapshot of the drm atomic state of
display drivers.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/drm_atomic.c        | 154 ++++++++++++++++++----------
 drivers/gpu/drm/drm_atomic_helper.c |  28 ++++-
 include/drm/drm_atomic.h            |  10 ++
 include/drm/drm_atomic_helper.h     |   2 +
 4 files changed, 136 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 9ccfbf213d72..4e805157100b 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -272,37 +272,23 @@ void __drm_atomic_state_free(struct kref *ref)
 }
 EXPORT_SYMBOL(__drm_atomic_state_free);
 
-/**
- * drm_atomic_get_crtc_state - get CRTC state
- * @state: global atomic state object
- * @crtc: CRTC to get state object for
- *
- * This function returns the CRTC state for the given CRTC, allocating it if
- * needed. It will also grab the relevant CRTC lock to make sure that the state
- * is consistent.
- *
- * Returns:
- *
- * Either the allocated state or the error code encoded into the pointer. When
- * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
- * entire atomic sequence must be restarted. All other errors are fatal.
- */
-struct drm_crtc_state *
-drm_atomic_get_crtc_state(struct drm_atomic_state *state,
-			  struct drm_crtc *crtc)
+static struct drm_crtc_state *
+__drm_atomic_get_crtc_state(struct drm_atomic_state *state,
+		struct drm_crtc *crtc, bool take_lock)
 {
 	int ret, index = drm_crtc_index(crtc);
 	struct drm_crtc_state *crtc_state;
 
-	WARN_ON(!state->acquire_ctx);
-
 	crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
 	if (crtc_state)
 		return crtc_state;
 
-	ret = drm_modeset_lock(&crtc->mutex, state->acquire_ctx);
-	if (ret)
-		return ERR_PTR(ret);
+	if (take_lock) {
+		WARN_ON(!state->acquire_ctx);
+		ret = drm_modeset_lock(&crtc->mutex, state->acquire_ctx);
+		if (ret)
+			return ERR_PTR(ret);
+	}
 
 	crtc_state = crtc->funcs->atomic_duplicate_state(crtc);
 	if (!crtc_state)
@@ -319,8 +305,37 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 
 	return crtc_state;
 }
+
+/**
+ * drm_atomic_get_crtc_state - get CRTC state
+ * @state: global atomic state object
+ * @crtc: CRTC to get state object for
+ *
+ * This function returns the CRTC state for the given CRTC, allocating it if
+ * needed. It will also grab the relevant CRTC lock to make sure that the state
+ * is consistent.
+ *
+ * Returns:
+ *
+ * Either the allocated state or the error code encoded into the pointer. When
+ * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
+ * entire atomic sequence must be restarted. All other errors are fatal.
+ */
+struct drm_crtc_state *
+drm_atomic_get_crtc_state(struct drm_atomic_state *state,
+		struct drm_crtc *crtc)
+{
+	return __drm_atomic_get_crtc_state(state, crtc, true);
+}
 EXPORT_SYMBOL(drm_atomic_get_crtc_state);
 
+struct drm_crtc_state *
+drm_atomic_get_crtc_state_nl(struct drm_atomic_state *state,
+		struct drm_crtc *crtc)
+{
+	return __drm_atomic_get_crtc_state(state, crtc, false);
+}
+
 static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
 				 const struct drm_crtc_state *new_crtc_state)
 {
@@ -445,30 +460,13 @@ static int drm_atomic_connector_check(struct drm_connector *connector,
 	return 0;
 }
 
-/**
- * drm_atomic_get_plane_state - get plane state
- * @state: global atomic state object
- * @plane: plane to get state object for
- *
- * This function returns the plane state for the given plane, allocating it if
- * needed. It will also grab the relevant plane lock to make sure that the state
- * is consistent.
- *
- * Returns:
- *
- * Either the allocated state or the error code encoded into the pointer. When
- * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
- * entire atomic sequence must be restarted. All other errors are fatal.
- */
-struct drm_plane_state *
-drm_atomic_get_plane_state(struct drm_atomic_state *state,
-			  struct drm_plane *plane)
+static struct drm_plane_state *
+__drm_atomic_get_plane_state(struct drm_atomic_state *state,
+		struct drm_plane *plane, bool take_lock)
 {
 	int ret, index = drm_plane_index(plane);
 	struct drm_plane_state *plane_state;
 
-	WARN_ON(!state->acquire_ctx);
-
 	/* the legacy pointers should never be set */
 	WARN_ON(plane->fb);
 	WARN_ON(plane->old_fb);
@@ -478,9 +476,12 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
 	if (plane_state)
 		return plane_state;
 
-	ret = drm_modeset_lock(&plane->mutex, state->acquire_ctx);
-	if (ret)
-		return ERR_PTR(ret);
+	if (take_lock) {
+		WARN_ON(!state->acquire_ctx);
+		ret = drm_modeset_lock(&plane->mutex, state->acquire_ctx);
+		if (ret)
+			return ERR_PTR(ret);
+	}
 
 	plane_state = plane->funcs->atomic_duplicate_state(plane);
 	if (!plane_state)
@@ -506,8 +507,37 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
 
 	return plane_state;
 }
+
+/**
+ * drm_atomic_get_plane_state - get plane state
+ * @state: global atomic state object
+ * @plane: plane to get state object for
+ *
+ * This function returns the plane state for the given plane, allocating it if
+ * needed. It will also grab the relevant plane lock to make sure that the state
+ * is consistent.
+ *
+ * Returns:
+ *
+ * Either the allocated state or the error code encoded into the pointer. When
+ * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
+ * entire atomic sequence must be restarted. All other errors are fatal.
+ */
+struct drm_plane_state *
+drm_atomic_get_plane_state(struct drm_atomic_state *state,
+		struct drm_plane *plane)
+{
+	return __drm_atomic_get_plane_state(state, plane, true);
+}
 EXPORT_SYMBOL(drm_atomic_get_plane_state);
 
+struct drm_plane_state *
+drm_atomic_get_plane_state_nl(struct drm_atomic_state *state,
+		struct drm_plane *plane)
+{
+	return __drm_atomic_get_plane_state(state, plane, false);
+}
+
 static bool
 plane_switching_crtc(const struct drm_plane_state *old_plane_state,
 		     const struct drm_plane_state *new_plane_state)
@@ -939,19 +969,21 @@ EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
  * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
  * entire atomic sequence must be restarted. All other errors are fatal.
  */
-struct drm_connector_state *
-drm_atomic_get_connector_state(struct drm_atomic_state *state,
-			  struct drm_connector *connector)
+static struct drm_connector_state *
+__drm_atomic_get_connector_state(struct drm_atomic_state *state,
+struct drm_connector *connector, bool take_lock)
 {
 	int ret, index;
 	struct drm_mode_config *config = &connector->dev->mode_config;
 	struct drm_connector_state *connector_state;
 
-	WARN_ON(!state->acquire_ctx);
-
-	ret = drm_modeset_lock(&config->connection_mutex, state->acquire_ctx);
-	if (ret)
-		return ERR_PTR(ret);
+	if (take_lock) {
+		WARN_ON(!state->acquire_ctx);
+		ret = drm_modeset_lock(&config->connection_mutex,
+				state->acquire_ctx);
+		if (ret)
+			return ERR_PTR(ret);
+	}
 
 	index = drm_connector_index(connector);
 
@@ -999,8 +1031,22 @@ drm_atomic_get_connector_state(struct drm_atomic_state *state,
 
 	return connector_state;
 }
+
+struct drm_connector_state *
+drm_atomic_get_connector_state(struct drm_atomic_state *state,
+struct drm_connector *connector)
+{
+	return __drm_atomic_get_connector_state(state, connector, true);
+}
 EXPORT_SYMBOL(drm_atomic_get_connector_state);
 
+struct drm_connector_state *
+drm_atomic_get_connector_state_nl(struct drm_atomic_state *state,
+		struct drm_connector *connector)
+{
+	return __drm_atomic_get_connector_state(state, connector, false);
+}
+
 static void drm_atomic_connector_print_state(struct drm_printer *p,
 		const struct drm_connector_state *state)
 {
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index ea1926b5bb80..229dc41aedb9 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3140,13 +3140,18 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
 	if (!state)
 		return ERR_PTR(-ENOMEM);
 
-	state->acquire_ctx = ctx;
+	if (ctx)
+		state->acquire_ctx = ctx;
 	state->duplicated = true;
 
 	drm_for_each_crtc(crtc, dev) {
 		struct drm_crtc_state *crtc_state;
 
-		crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (ctx)
+			crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		else
+			crtc_state = drm_atomic_get_crtc_state_nl(state,
+					crtc);
 		if (IS_ERR(crtc_state)) {
 			err = PTR_ERR(crtc_state);
 			goto free;
@@ -3156,7 +3161,11 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
 	drm_for_each_plane(plane, dev) {
 		struct drm_plane_state *plane_state;
 
-		plane_state = drm_atomic_get_plane_state(state, plane);
+		if (ctx)
+			plane_state = drm_atomic_get_plane_state(state, plane);
+		else
+			plane_state = drm_atomic_get_plane_state_nl(state,
+					plane);
 		if (IS_ERR(plane_state)) {
 			err = PTR_ERR(plane_state);
 			goto free;
@@ -3167,7 +3176,12 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
 	drm_for_each_connector_iter(conn, &conn_iter) {
 		struct drm_connector_state *conn_state;
 
-		conn_state = drm_atomic_get_connector_state(state, conn);
+		if (ctx)
+			conn_state = drm_atomic_get_connector_state(state,
+					conn);
+		else
+			conn_state = drm_atomic_get_connector_state_nl(state,
+					conn);
 		if (IS_ERR(conn_state)) {
 			err = PTR_ERR(conn_state);
 			drm_connector_list_iter_end(&conn_iter);
@@ -3189,6 +3203,12 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_atomic_helper_duplicate_state);
 
+struct drm_atomic_state *
+drm_atomic_helper_snapshot_state(struct drm_device *dev)
+{
+	return drm_atomic_helper_duplicate_state(dev, NULL);
+}
+
 /**
  * drm_atomic_helper_suspend - subsystem-level suspend helper
  * @dev: DRM device
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 1dc8af7671b7..85e43489e33d 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -452,6 +452,16 @@ struct drm_connector_state * __must_check
 drm_atomic_get_connector_state(struct drm_atomic_state *state,
 			       struct drm_connector *connector);
 
+struct drm_crtc_state *
+drm_atomic_get_crtc_state_nl(struct drm_atomic_state *state,
+			  struct drm_crtc *crtc);
+struct drm_plane_state *
+drm_atomic_get_plane_state_nl(struct drm_atomic_state *state,
+			   struct drm_plane *plane);
+struct drm_connector_state *
+drm_atomic_get_connector_state_nl(struct drm_atomic_state *state,
+			       struct drm_connector *connector);
+
 void drm_atomic_private_obj_init(struct drm_device *dev,
 				 struct drm_private_obj *obj,
 				 struct drm_private_state *state,
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index b268180c97eb..e6be47ba4834 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -126,6 +126,8 @@ void drm_atomic_helper_shutdown(struct drm_device *dev);
 struct drm_atomic_state *
 drm_atomic_helper_duplicate_state(struct drm_device *dev,
 				  struct drm_modeset_acquire_ctx *ctx);
+struct drm_atomic_state *
+drm_atomic_helper_snapshot_state(struct drm_device *dev);
 struct drm_atomic_state *drm_atomic_helper_suspend(struct drm_device *dev);
 int drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state *state,
 					      struct drm_modeset_acquire_ctx *ctx);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

