Return-Path: <linux-arm-msm+bounces-43057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5F69FA3EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 06:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 063D6166C01
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 05:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC02155C8C;
	Sun, 22 Dec 2024 05:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FbTxft04"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80283487BF
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 05:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734843655; cv=none; b=ttJcZxIE5rbxMKB8dmwl+5JsYV+S6Sqxgp6Oce0CuTUphDn/Qk2gWEDrTaOE9W7Z4CtFBej+Izdj7pm6Yr6IrdLxr1xPRdOJgpzFJf/+UBrOuMxBxa/tJOjTSLzmg02DEjTVo3mfFar7NIIzyPIkzTLL9y+lSKRASV9ywL/gUKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734843655; c=relaxed/simple;
	bh=rWS0KFUVLvGb4ozb2+QIr1gzxcTnVRN9cNSrdc5NX8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QIEhgb5mhpxu6Y+XQsYUl+qWBh2cjLZqOsOEIwMJuOXeucAXL9NGNCodweZNIVzQibpX5G2V+IaxAKC+lq/F3QVrZfzyjAS69Mxe3/kzPm0s1CBCzvQtvd0ToDRFPTAlD8JsyO08x5O48VvN0efnp+sqgyZa3ssIjIA7N7VFyUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FbTxft04; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53f757134cdso3424395e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Dec 2024 21:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734843652; x=1735448452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N19A2AjG3Q/s9SAFMXdSh2+o269dpLqgKum0CI5lc8s=;
        b=FbTxft04DfJd+OpbwFNw25w9u3UiLZqRfS2+49ZmQCCfOZ67vRYK4/WCK5QvFGM7rT
         5J+AiN8G6STVoDBtGc111JpWwJk5mjqzj0g7xUUbsGHuBp4c8iR9g9gl4DyamImpGz46
         QckdxTQXVQBsBpo15FoRiRVPC3lWDSrmlhTNmWu6HTQKTP2sivayS24CWrNRHDUM5hoO
         x9DHL/elA/CFbMybiZ7okoEwB5rjzIjtxAWIs54Qss0/KokhOnCAfI9pS9IOxmSFkdiB
         RYRViIlvqWzcu6yj/TOFrNVNg3zAWpJRlD3KcccBySYxhQELPYTp/LaSO4iKumTA/yRd
         hpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734843652; x=1735448452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N19A2AjG3Q/s9SAFMXdSh2+o269dpLqgKum0CI5lc8s=;
        b=No7GmFY5MoylpS+rM0eb9Na/7t6trUR04oP8EUOHNED5CDDTfUW9HgjViRBm3u6b9a
         jQW9DnmwL6DxLF/ByyFLVKp6ORqmQ12DMYA7f5FneMm9U+Xv6Ug/gmYwfgu2cqOxiLvh
         5tjXT9uwRF3/DXteGtcyaETt5EpUNtIIxYs0WmyyBudBtlqQKLUqJlz5TWZBqTwue5Kx
         gFndxgFsYywYQV14an4GzxYwl3paDd/YtHjZeT9C7fx6wkfwMwyRTCb9f+y9yKB0TPpq
         wi752PHT/cEZtSATfelBH6nLkZHZGDMA7r1CYeZgbj6slakIPND8Zu8vCsxGicrnWXzX
         R1PA==
X-Forwarded-Encrypted: i=1; AJvYcCVfXQX7mwWG4VIDSAqTEgToW76dgD367YkGa4I6P8wSR7kv6e9O8Gw4zDK9DjDTRC5TsisvpXeUPg8YlkkO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6ewXOwZelqTYplty34waBO2ifgQLnVRQxIRfvfSns2vQa8Xa/
	HwF95RUZAxXg4am4EKsdnafadvp7OlQ70XGCpMcYU5F7YSFEoPvcEmk2vyC2mk4=
X-Gm-Gg: ASbGncu0+kbdKcNL3DXwErqErMwxLa3utZMdlyWjKPLBS7qy+VaUoYo7AB4UZAU6cYr
	wUeVcGy+URZoiyzyhUw5EQvrtTjB7u5ObLyV/OYKEG1Hf7CgIv2YzUZpbW7XD/gL4GE/aBBFnjD
	LaClJcW+itOxhQTcfsahpheYRC7Totv7xXsAqboRIrOZf60l4lfMzm4vv3WLdDee7Qg5xim2wdn
	hsqKNwCOeTvqTjIzQAO4k1KWfzVb1ebmMk3bl6wnA4t8BbBqBJYJIAipZ7WqJW0
X-Google-Smtp-Source: AGHT+IGWOF5L9r9w+Rvx/sxvEH8+CLwrVoF+t4m8SvJw+iSDzew6q+z2eYxXwXHRCkDsVxu6XZXCJg==
X-Received: by 2002:a05:6512:e8c:b0:53a:1a81:f006 with SMTP id 2adb3069b0e04-5422953fedcmr3014188e87.31.1734843651614;
        Sat, 21 Dec 2024 21:00:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c05sm887145e87.276.2024.12.21.21.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 21:00:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 07:00:42 +0200
Subject: [PATCH 2/6] drm/atomic: prepare to check that drivers follow
 restrictions for needs_modeset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-drm-dirty-modeset-v1-2-0e76a53eceb9@linaro.org>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
In-Reply-To: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8180;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rWS0KFUVLvGb4ozb2+QIr1gzxcTnVRN9cNSrdc5NX8g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZ5z71Xj3vDZ5ZQ9k5EaVm/6pV22nfsxOppXU8
 urExzv+o8yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2ec+wAKCRCLPIo+Aiko
 1eDjCACEaoaRFJsbhJHmjd3uHaWnQCQA3aWQKHzRvFrDf7Em7z0Gao1tpDPETltMg4hGw9imGF/
 PtpGBoPGrff7Mf6/fSkZQKcBzyk2nds6Pmm41ImFPilCfg57s70TvJ8b+yRs7SbYd5G+gxE3MYU
 voHPno59UMWls4TEyjlcckMmilATWZhT4Cj08xSb97FrGuAV9e5lrX4zzr1U3eyh5LCkSiI51XI
 xi2ZSJf2Kv+8y9J1HtkLW5kPgrILGaBg3asKa4+mIqDhnDxCFNZK1MtdHv6AHrqXUA+gI/jpJit
 nXQgHSxtMdjeuCSaRaKgyoclkm4lYv7wxwWyAT9xRjrT6Gst
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Some drivers might fail to follow the restrictions documented for
drm_atomic_helper_check_modesets(). In order to catch such an issues,
add the drm_atomic_state->dirty_needs_modeset field and check it in
drm_atomic_check_only(). Make sure that neither of atomic_check()
callbacks can set that field without calling
drm_atomic_helper_check_modesets() again.

Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c        |  3 ++
 drivers/gpu/drm/drm_atomic_helper.c | 77 +++++++++++++++++++++++++++++++++----
 include/drm/drm_atomic.h            | 10 +++++
 3 files changed, 82 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 9ea2611770f43ce7ccba410406d5f2c528aab022..202e4e64bd31921d0a4d4b86605b501311e14c33 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1449,6 +1449,9 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 		}
 	}
 
+	WARN_RATELIMIT(state->dirty_needs_modeset,
+		       "Driver changed needs_modeset under drm_atomic_helper_check_modeset()");
+
 	if (!state->allow_modeset) {
 		for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f26887c3fe8b194137200f9f2426653274c50fda..2c62840416f4b807d6a880b5c30ae024a16af528 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -433,6 +433,7 @@ mode_fixup(struct drm_atomic_state *state)
 
 	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
 		const struct drm_encoder_helper_funcs *funcs;
+		bool old_needs_modeset = false;
 		struct drm_encoder *encoder;
 		struct drm_bridge *bridge;
 
@@ -451,6 +452,9 @@ mode_fixup(struct drm_atomic_state *state)
 		encoder = new_conn_state->best_encoder;
 		funcs = encoder->helper_private;
 
+		if (new_crtc_state)
+			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
 		ret = drm_atomic_bridge_chain_check(bridge,
 						    new_crtc_state,
@@ -479,6 +483,12 @@ mode_fixup(struct drm_atomic_state *state)
 				return -EINVAL;
 			}
 		}
+
+		if (new_crtc_state) {
+			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
+			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
+		}
 	}
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
@@ -574,6 +584,36 @@ mode_valid(struct drm_atomic_state *state)
 	return 0;
 }
 
+static int
+connector_atomic_check(struct drm_atomic_state *state,
+		       struct drm_connector *connector,
+		       struct drm_connector_state *old_connector_state,
+		       struct drm_connector_state *new_connector_state)
+{
+	const struct drm_connector_helper_funcs *funcs = connector->helper_private;
+	struct drm_crtc_state *new_crtc_state;
+	bool old_needs_modeset = false;
+	int ret;
+
+	if (new_connector_state->crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_connector_state->crtc);
+	if (new_crtc_state)
+		old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
+	if (funcs->atomic_check)
+		ret = funcs->atomic_check(connector, state);
+	else
+		ret = 0;
+
+	if (new_crtc_state) {
+		bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
+		state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
+	}
+
+	return ret;
+}
+
 /**
  * drm_atomic_helper_check_modeset - validate state object for modeset changes
  * @dev: DRM device
@@ -628,6 +668,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 	int i, ret;
 	unsigned int connectors_mask = 0, user_connectors_mask = 0;
 
+	state->dirty_needs_modeset = false;
+
 	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i)
 		user_connectors_mask |= BIT(i);
 
@@ -683,8 +725,6 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 		return ret;
 
 	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i) {
-		const struct drm_connector_helper_funcs *funcs = connector->helper_private;
-
 		WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
 
 		/*
@@ -710,8 +750,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 				new_crtc_state->connectors_changed = true;
 		}
 
-		if (funcs->atomic_check)
-			ret = funcs->atomic_check(connector, state);
+		ret = connector_atomic_check(state, connector,
+					     old_connector_state, new_connector_state);
 		if (ret) {
 			drm_dbg_atomic(dev,
 				       "[CONNECTOR:%d:%s] driver check failed\n",
@@ -752,13 +792,11 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 	 * has been called on them when a modeset is forced.
 	 */
 	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i) {
-		const struct drm_connector_helper_funcs *funcs = connector->helper_private;
-
 		if (connectors_mask & BIT(i))
 			continue;
 
-		if (funcs->atomic_check)
-			ret = funcs->atomic_check(connector, state);
+		ret = connector_atomic_check(state, connector,
+					     old_connector_state, new_connector_state);
 		if (ret) {
 			drm_dbg_atomic(dev,
 				       "[CONNECTOR:%d:%s] driver check failed\n",
@@ -994,6 +1032,7 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 
 	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
 		const struct drm_plane_helper_funcs *funcs;
+		bool old_needs_modeset = false;
 
 		WARN_ON(!drm_modeset_is_locked(&plane->mutex));
 
@@ -1006,6 +1045,12 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 		if (!funcs || !funcs->atomic_check)
 			continue;
 
+		if (new_plane_state->crtc)
+			new_crtc_state = drm_atomic_get_new_crtc_state(state,
+								       new_plane_state->crtc);
+		if (new_crtc_state)
+			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
 		ret = funcs->atomic_check(plane, state);
 		if (ret) {
 			drm_dbg_atomic(plane->dev,
@@ -1013,16 +1058,26 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 				       plane->base.id, plane->name);
 			return ret;
 		}
+
+		if (new_crtc_state) {
+			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
+			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
+		}
 	}
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 		const struct drm_crtc_helper_funcs *funcs;
+		bool old_needs_modeset = false;
 
 		funcs = crtc->helper_private;
 
 		if (!funcs || !funcs->atomic_check)
 			continue;
 
+		if (new_crtc_state)
+			old_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
 		ret = funcs->atomic_check(crtc, state);
 		if (ret) {
 			drm_dbg_atomic(crtc->dev,
@@ -1030,6 +1085,12 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 				       crtc->base.id, crtc->name);
 			return ret;
 		}
+
+		if (new_crtc_state) {
+			bool new_needs_modeset = drm_atomic_crtc_needs_modeset(new_crtc_state);
+
+			state->dirty_needs_modeset |= (new_needs_modeset != old_needs_modeset);
+		}
 	}
 
 	return ret;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 31ca88deb10d262fb3a3f8e14d2afe24f8410cb1..7b0dbd3c8a3df340399a458aaf79263f0fdc24e5 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -408,6 +408,16 @@ struct drm_atomic_state {
 	 */
 	bool duplicated : 1;
 
+	/**
+	 * @dirty_needs_modeset:
+	 *
+	 * Indicates whether the drm_atomic_crtc_needs_modeset() changed in an
+	 * unexpected way. Usually this means that driver implements atomic
+	 * helpers using drm_atomic_crtc_needs_modeset(), but mode_changed has
+	 * toggled by one of its atomic_check() callbacks.
+	 */
+	bool dirty_needs_modeset : 1;
+
 	/**
 	 * @planes:
 	 *

-- 
2.39.5


