Return-Path: <linux-arm-msm+bounces-72743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8011B4ABF4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 13:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A44284436AC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 11:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB399321F35;
	Tue,  9 Sep 2025 11:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2Dw1p/A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C0E285071
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 11:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757417340; cv=none; b=gdt9uykv8WvoLSgivZjkUOygPTS9iN7F5JN741Zl0J6AVUIZ2MGbWQ8ihRratSS5o+efZCktLsSG+HObpdITEjRTXgw+n3fGIsDYSdlzqsGpVqRoBP7qly5Fil1IE8mil2WF+PJwr1pReXplZmVh844fQAVGs+bGP5f9MLhVkVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757417340; c=relaxed/simple;
	bh=hm0tnipoDHHszNsEnA1Tr51B4Yy6srxE7cfH3UWZfeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JKazS3jBTZGez1sRkEvP6/65LQOR3dLVb5qnWmB1GiVPYDpK6Ire8ei+hbcMIGYhJtuCapMUfaUxF8uFNSw6oOEIzHQSBh8l/kcK146MvMyC4ES4+X94r0373OyD41KV8armSWuA9a9sRtIh3rRJuT4EOtOzsrSATJ35eUOH2y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2Dw1p/A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5B5C4CEFA;
	Tue,  9 Sep 2025 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757417340;
	bh=hm0tnipoDHHszNsEnA1Tr51B4Yy6srxE7cfH3UWZfeQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k2Dw1p/A/OrMqgN+FOPCrXanU/V1sDNUva/XlUOFd2t5IC87HDQL+qd0NTJ4KA9eU
	 irkueP9eeBWqnJLEvJurDaffzPZsxC3ETSypX/1/d5ojeHKKE2ncxw5luhhb10wM9i
	 82hH+2GxNMjASQWSXs2xNz4kwcJWCBcvPe4SCvf/8lfyG0tPxIUcbVS92CapA0qu9M
	 jUSTsBi7kaNpjH/CERfA+MGMsrEoJML50fSl4pz5Y8DAnFTh6JI1ju00zVr4B9T+rh
	 Un+hbRkJE3Xdt++xmjtyjr7yIwH28AxvaRFVgcN9/sR1UXsy7eydrvXCduJJfIgc09
	 A0Co0b4kQ5o8A==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:44 +0200
Subject: [PATCH v3 25/39] drm/msm/mdp5: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-25-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354; i=mripard@kernel.org;
 h=from:subject:message-id; bh=hm0tnipoDHHszNsEnA1Tr51B4Yy6srxE7cfH3UWZfeQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+HW95CXXqpv+zRd58MyWO7Pl4VOrdwpuh3qudzlXT
 ItKPuzWMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACYyvZuxzvR9aJhK/KWErOwn
 ezam/v2W/45zh05WkMOHxas9A0LmmxUIux+0OnbTmNfrgkdbbbALY53S5jv9H4/NemQnqXKJ5cx
 1pkfNd9eY/p7R5M90lb9zQttchhdqxa4ZiX5ZKXe3m1v5XgEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The msm atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 7c790406d533fbabb330c438419efb18204cc4b7..4ca183fb61a95af60ef5a2c011ae6b2a0df963f0 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -334,12 +334,11 @@ static int mdp5_plane_atomic_check(struct drm_plane *plane,
 
 	crtc = new_plane_state->crtc ? new_plane_state->crtc : old_plane_state->crtc;
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	return mdp5_plane_atomic_check_with_state(crtc_state, new_plane_state);
 }
@@ -371,12 +370,12 @@ static int mdp5_plane_atomic_async_check(struct drm_plane *plane,
 	struct mdp5_plane_state *mdp5_state = to_mdp5_plane_state(new_plane_state);
 	struct drm_crtc_state *crtc_state;
 	int min_scale, max_scale;
 	int ret;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							new_plane_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state,
+						   new_plane_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	if (!crtc_state->active)
 		return -EINVAL;

-- 
2.50.1


