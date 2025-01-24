Return-Path: <linux-arm-msm+bounces-46073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E20A1B480
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 12:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C42A63AB0D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 11:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B05A21ADAB;
	Fri, 24 Jan 2025 11:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NJhJ6SbL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FCE21A433
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737717276; cv=none; b=uEG3/ztKPcl9wbw2AfyWSLmjkQyViRPk2F/56eeYSQNTbVxcWLUAICFkXhy0SdAr5In2PdcE1S8pU74UnhgNHBpaUHUu++An2fg4kS3hKvzjqfOul3vQFVks5DJgdeoynafw5uwqb70lBtEnT8vgZ5jUN9lh3xWcc0LQn15Uxrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737717276; c=relaxed/simple;
	bh=4R2TAjvRhPbl5nWb6SOSqQ5SIwkmWTVcXua85X57qZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YF5q/qHMz1Rs5XLPxGtA6A9ao8cfMTLk5y+1u1APHkudeI6BofrEYx+dt5LP2TgjO+WC7NLl8Mdiui7bxt9Xl03AxehqRI9XOzHwI2Gb8syiKbHhoJEy9on11r+wwXrdUJBGvHzILVAo/i0TK4JdIm9uJezeEGspD6LszBrxtwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NJhJ6SbL; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30737db1ab1so17874271fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 03:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737717273; x=1738322073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQumNHb0czdV26nphZSgSBzfVIc/sINg5yBNO6XQGak=;
        b=NJhJ6SbLchWQvHr8KdN5slyHJO43wvGl2baqfVKfQfJTPgl/Es9eqZSukEnRBXwBqG
         z9tZKwJCJBpq1RNPonQMNSYZ5A7gE34fAfvLDiecPO4SkIyJiw7nzpZ6X/ZiwS7KcUpT
         tLbwgpdqf5cXxhAMacPxLU3YNzkltlOlyOC0zic0TdlSlEyc1H9gT+IG44nCKiND/T7G
         kHtt4zu7hYTAwPoUsdZsKfJvc/W3WCvBQggj6IBa7bwcIvWRCV852Aw/lDNh5wL01NYp
         WW13+KHsq/RejykauQHperi7Qs+oUcR1V+3BdOKwvJ8LrJNa6QxN69v2HN07eL/ma3zA
         0l/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737717273; x=1738322073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQumNHb0czdV26nphZSgSBzfVIc/sINg5yBNO6XQGak=;
        b=tad17cdyqYIc+NfMDWdBODl4Wbya7R09QZAxeCAVMc2ll35EPYj8a7TIxEyh5KI1qo
         QoC9T13aLgOKEg0lIFY76s08IJgDQIZhZCGxj9EPCFno79CeDfFmyQOGYrU8FG/+wF+y
         ESEaGDIFr45fBwC+IS1r21oCKIZF5fZD3XGqBpYZFxm1sR8YzLauxWjwGP+r7h2Gyv0g
         5zNP3P8XI2p5bDJL56or1OmLfxG1ywgYhVSqQZqZXrGu0DMe5Ad6MEFXTbKLcGQN5Chs
         m0HNjSHBdwQZ2th18pyUCkv7OEGRyxKBDezpa8FoFTj3wSeY7Pv+plH3Cgp8U4rj95uL
         pu7w==
X-Forwarded-Encrypted: i=1; AJvYcCWuI+plNyIlxVBpI4OHb9vFajl2g/ogMMFjP5L8VvS6lWI1yMYxdrRBTYNX9taQZKXrTrL1687h0nSUnWnW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2a/0TGnoqGQcGLAMPTsI1BsOQiapKX3pLhyh0thgMPNujmt8O
	LMHJElM4XmisqCvTHnIIotNn7tCcf3Gtvmo7V1OOXDP6fo7vlX7cQtUqGfoaFMU=
X-Gm-Gg: ASbGncuc9jN2fXSvatqjuckK1X80CkrpRjOus1PDylHJtMF+2ceTnOPqyiWhsJEKMYJ
	gZCMILLGBdjdkzPE0V2ToRa4tcCE8GBZ9jShQHb3la/T5DCTYLkzg6wmv+jr6cQW666vQJknV5C
	Yx0DDUE7E4tdAlVQOUM3BtUfRAmRhFigPbgYo7AR8VCVa80vbiBFGcFrexG3Dx0Rinu9wiiJSsb
	mnfE+6ezEsMnhNAHUPKPEVqFT4vRmSWUay0SQHRHz3D/IzvModJBW3D7SeCqN0dew5lzTtz4nmi
	BMVxNG4vNgLs
X-Google-Smtp-Source: AGHT+IGY2wva+MkPCdRgK1/XNjI/82GaXQEwsVxES2OrmcmMYbeyl0REkjsBdSaqM3fqWG9eRyRhsw==
X-Received: by 2002:a05:651c:1611:b0:300:3778:4dbb with SMTP id 38308e7fff4ca-3072ca60c5emr122341211fa.1.1737717272797;
        Fri, 24 Jan 2025 03:14:32 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bacba5esm3289701fa.36.2025.01.24.03.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:14:31 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 13:14:19 +0200
Subject: [PATCH 1/6] drm/atomic-helper: add atomic_needs_modeset callbacks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-atomic-needs-modeset-v1-1-b0c05c9eda0f@linaro.org>
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
In-Reply-To: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8241;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4R2TAjvRhPbl5nWb6SOSqQ5SIwkmWTVcXua85X57qZA=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/rkMpFJsYka4Z9WvN3MmWi9d9k0jT2adv2u66NZTtzdx
 d5gL1XbyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJaKSx/0+1thHwuKvL9dnl
 NGtW2dNH9QzqLSIXYg5lB8uvOWL2+rlhg9nFLQ2hNs2cecLzM5NUl/J/0m0O5vcOE46d86Du/yG
 BP1e3+JoZrg4XTMw8tqnlk/XLut33DN91X93L67NXRZxB7bnvxCvW+8Scq1//tdLVvWUrpDR/72
 ujQpEJYQeMONOPLronJbxUtu8gk1jMNftvsS+dQu5PskyakdXSuyUx2/ls39XklafOl2QWXLRuP
 O+rlBrG3fw4bLmlNlPFLeMJ796t2jRr5r6dS24e8ZrwX4SPO9Hy5fauaE6+06UzXbzulss5mF8s
 cu06tGNq0nelhOkzNdQd9RjfcEXMbeWWt5SQmsQ5za8WAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Despite drm_atomic_helper_check_modeset() and drm_atomic_helper_check()
documenting that the function should be run again if atomic_check()
callback changes drm_crtc_state.mode_changed some drivers ignore it and
don't rerun the helpers. To simplify such drivers and remove the need to
rerun the helper functions provide additional set of callbacks,
atomic_needs_modeset(). These callbacks are executed at a proper time,
they return a boolean which signifies that corresponding CRTC should
undergo a full modeset. This way the atomic_check() callbacks can stop
updating the drm_crtc_state.mode_changed.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c      | 59 ++++++++++++++++++++
 include/drm/drm_modeset_helper_vtables.h | 92 ++++++++++++++++++++++++++++++++
 2 files changed, 151 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 3034ba09c0ee5791ffd2f4130bd84b4cc4676fae..1f689ccd9b0d7f655c6a49e642d652b815a0e8e1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -649,6 +649,8 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_connector *connector;
 	struct drm_connector_state *old_connector_state, *new_connector_state;
+	struct drm_plane *plane;
+	struct drm_plane_state *new_plane_state, *old_plane_state;
 	int i, ret;
 	unsigned int connectors_mask = 0, user_connectors_mask = 0;
 
@@ -708,6 +710,9 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 
 	for_each_oldnew_connector_in_state(state, connector, old_connector_state, new_connector_state, i) {
 		const struct drm_connector_helper_funcs *funcs = connector->helper_private;
+		struct drm_encoder *encoder = new_connector_state->best_encoder;
+		const struct drm_encoder_helper_funcs *enc_funcs =
+			encoder ? encoder->helper_private : NULL;
 
 		WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
 
@@ -734,6 +739,25 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 				new_crtc_state->connectors_changed = true;
 		}
 
+		if ((funcs->atomic_needs_modeset &&
+		     funcs->atomic_needs_modeset(connector, state)) ||
+		    (enc_funcs && enc_funcs->atomic_needs_modeset &&
+		     enc_funcs->atomic_needs_modeset(encoder, state))) {
+			if (new_connector_state->crtc) {
+				new_crtc_state =
+					drm_atomic_get_new_crtc_state(state,
+								      new_connector_state->crtc);
+				new_crtc_state->mode_changed = true;
+			}
+
+			if (old_connector_state->crtc) {
+				new_crtc_state =
+					drm_atomic_get_new_crtc_state(state,
+								      old_connector_state->crtc);
+				new_crtc_state->mode_changed = true;
+			}
+		}
+
 		if (funcs->atomic_check)
 			ret = funcs->atomic_check(connector, state);
 		if (ret) {
@@ -746,6 +770,29 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 		connectors_mask |= BIT(i);
 	}
 
+	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
+		const struct drm_plane_helper_funcs *funcs;
+
+		funcs = plane->helper_private;
+		if (!funcs || !funcs->atomic_needs_modeset)
+			continue;
+
+		if (!funcs->atomic_needs_modeset(plane, state))
+			continue;
+
+		if (new_plane_state->crtc) {
+			new_crtc_state = drm_atomic_get_new_crtc_state(state,
+								       new_plane_state->crtc);
+			new_crtc_state->mode_changed = true;
+		}
+
+		if (old_plane_state->crtc) {
+			new_crtc_state = drm_atomic_get_new_crtc_state(state,
+								       old_plane_state->crtc);
+			new_crtc_state->mode_changed = true;
+		}
+	}
+
 	/*
 	 * After all the routing has been prepared we need to add in any
 	 * connector which is itself unchanged, but whose CRTC changes its
@@ -753,6 +800,18 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 	 * crtc only changed its mode but has the same set of connectors.
 	 */
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
+		const struct drm_crtc_helper_funcs *funcs;
+
+		if (!new_crtc_state->crtc)
+			continue;
+
+		funcs = crtc->helper_private;
+		if (!funcs || !funcs->atomic_needs_modeset)
+			continue;
+
+		if (funcs->atomic_needs_modeset(crtc, state))
+			new_crtc_state->mode_changed = true;
+
 		if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
 			continue;
 
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index b62f41f489625e5177bdc05eef950e6c18c219fd..a83999109a49321536956c8b1b93fb4b0d0f7ce2 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -304,6 +304,29 @@ struct drm_crtc_helper_funcs {
 	 */
 	void (*disable)(struct drm_crtc *crtc);
 
+	/**
+	 * @atomic_needs_modeset:
+	 *
+	 * This function is called at the beginning of
+	 * drm_atomic_helper_check_modeset() to verify whether the CRTC needs a
+	 * full mode set or not.
+	 *
+	 * This hook is optional.
+	 *
+	 * NOTE:
+	 *
+	 * This function is called in the check phase of an atomic update. The
+	 * driver is not allowed to change anything outside of the
+	 * &drm_atomic_state update tracking structure passed in.
+	 *
+	 * RETURNS:
+	 *
+	 * True if the corresponding CRTC should undergo a full modeset, False
+	 * otherwise.
+	 */
+	bool (*atomic_needs_modeset)(struct drm_crtc *crtc,
+				     struct drm_atomic_state *state);
+
 	/**
 	 * @atomic_check:
 	 *
@@ -800,6 +823,29 @@ struct drm_encoder_helper_funcs {
 	 */
 	void (*enable)(struct drm_encoder *encoder);
 
+	/*
+	 * @atomic_needs_modeset:
+	 *
+	 * This function is called at the beginning of
+	 * drm_atomic_helper_check_modeset() to verify whether the connected
+	 * CRTC needs a full mode set or not.
+	 *
+	 * This hook is optional.
+	 *
+	 * NOTE:
+	 *
+	 * This function is called in the check phase of an atomic update. The
+	 * driver is not allowed to change anything outside of the
+	 * &drm_atomic_state update tracking structure passed in.
+	 *
+	 * RETURNS:
+	 *
+	 * True if the corresponding CRTC should undergo a full modeset, False
+	 * otherwise.
+	 */
+	bool (*atomic_needs_modeset)(struct drm_encoder *encoder,
+				     struct drm_atomic_state *state);
+
 	/**
 	 * @atomic_check:
 	 *
@@ -1067,6 +1113,29 @@ struct drm_connector_helper_funcs {
 	struct drm_encoder *(*atomic_best_encoder)(struct drm_connector *connector,
 						   struct drm_atomic_state *state);
 
+	/**
+	 * @atomic_needs_modeset:
+	 *
+	 * This function is called at the beginning of
+	 * drm_atomic_helper_check_modeset() to verify whether the connected
+	 * CRTC needs a full mode set or not.
+	 *
+	 * This hook is optional.
+	 *
+	 * NOTE:
+	 *
+	 * This function is called in the check phase of an atomic update. The
+	 * driver is not allowed to change anything outside of the
+	 * &drm_atomic_state update tracking structure passed in.
+	 *
+	 * RETURNS:
+	 *
+	 * True if the corresponding CRTC should undergo a full modeset, False
+	 * otherwise.
+	 */
+	bool (*atomic_needs_modeset)(struct drm_connector *connector,
+				     struct drm_atomic_state *state);
+
 	/**
 	 * @atomic_check:
 	 *
@@ -1284,6 +1353,29 @@ struct drm_plane_helper_funcs {
 	 */
 	void (*end_fb_access)(struct drm_plane *plane, struct drm_plane_state *new_plane_state);
 
+	/**
+	 * @atomic_needs_modeset:
+	 *
+	 * This function is called at the beginning of
+	 * drm_atomic_helper_check_modeset() to verify whether the connected
+	 * CRTC needs a full mode set or not.
+	 *
+	 * This hook is optional.
+	 *
+	 * NOTE:
+	 *
+	 * This function is called in the check phase of an atomic update. The
+	 * driver is not allowed to change anything outside of the
+	 * &drm_atomic_state update tracking structure passed in.
+	 *
+	 * RETURNS:
+	 *
+	 * True if the corresponding CRTC should undergo a full modeset, False
+	 * otherwise.
+	 */
+	bool (*atomic_needs_modeset)(struct drm_plane *plane,
+				     struct drm_atomic_state *state);
+
 	/**
 	 * @atomic_check:
 	 *

-- 
2.39.5


