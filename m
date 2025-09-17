Return-Path: <linux-arm-msm+bounces-73959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF02B803E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44CAB188378B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D47F328966;
	Wed, 17 Sep 2025 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EogpYMUQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF03328984
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 14:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758120441; cv=none; b=I0Q65uUNP9O89+MxaiYPrrOrE8cOaEhT2sGFTGkAIFmDMjULml9Vniux7Hf9b7RefxT/kUV48bL26EcGndPN03BJ2PKASsKri7OYTR5Iatgt+eKv9uRTux8+zxnh26HawhAaNq1iAdO5mJmJaK8kUt7/0s65o9JzEjREAAjwldw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758120441; c=relaxed/simple;
	bh=hm0tnipoDHHszNsEnA1Tr51B4Yy6srxE7cfH3UWZfeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IB9TronQ1r+nAhlz8tdNyi8IGVt+higxBX5GSj+/NvtaF5omxGg9BSAXo5WsDpFYs9PIb6HChT3AwnFzT+AVYnIBLJmjKHvG5FUddLcvjaMinJcKHriDImUOBffu0sNlipcIe2sgrTHsmzGQOWW1QX606iSnGmVTuqMuP4cUYPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EogpYMUQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EC7C4CEF7;
	Wed, 17 Sep 2025 14:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758120441;
	bh=hm0tnipoDHHszNsEnA1Tr51B4Yy6srxE7cfH3UWZfeQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EogpYMUQsSDiGFuPH8pCZ+DBDC7mChG7yv0FCtk/Xydr+SViUV6k4dqOuJq+9r3xW
	 okyTAQxtuRwyhrloNoNx1pCFtXjNYIWYrtnlimaEWgscrAXPw5Gpe/3pBbMJMEPV+R
	 /M1wTXIKaq/bqM0f10R48Sqs9+sKLpU0CqHXosqCiflZbfZelOsQxgj8h2LG3Vb2V7
	 08ejdpSGr1xi7lAHCeTALFCznwCEDj5wWcEysEsmmvVfqWKWrmHdOMoSAwLVFgtUbb
	 81Hit7qqx6gwDvyfuJV0GDBlWVVlatN9B5ggPZe6hWmOlrf0sIKg4gYiM+MC2xqnLJ
	 WDI6PzfTXXFnw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 16:46:06 +0200
Subject: [PATCH v4 25/39] drm/msm/mdp5: Switch to
 drm_atomic_get_new_crtc_state()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-drm-no-more-existing-state-v4-25-5d4b9889c3c8@kernel.org>
References: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
In-Reply-To: <20250917-drm-no-more-existing-state-v4-0-5d4b9889c3c8@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnTq46fWfHxzsbJrOGCqXfqBeXnCS8nCdZmfnR+7sxJ
 97/iXks0DGFhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmwvKasWHD4juCSl5Vu/0M
 b57bM+foy/2ftGfWK0+eeP5Sv3hw1nRTXoX67D9TOX6uTT9usrPZdC9jxeMqR2e+fUeqpS/lOTE
 uuf+7fn3Tqq8b5+7lWXOJJS/sdaOwaKbfCuWLH17cN0v5KLwCAA==
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


