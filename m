Return-Path: <linux-arm-msm+bounces-46074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B06AA1B486
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 12:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 005037A26BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 11:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7A621B191;
	Fri, 24 Jan 2025 11:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s9AGiUyR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3085421ADB0
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 11:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737717279; cv=none; b=Q3FlMtl58hpzsgODpZuWwOQlG+4NWQBuACOKlMUtK4lgzhU2UouPecW9J9F5J72KqIIIODx3k0rG3Td5TrZgcD4Y/k0uj2ZtxjZtasL/xRiwEU9x9WALQjqpWaYBXPv6lSTcN+bosmVcxTF5rcjpsM90MmHJy+u8KbrY/6KTD2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737717279; c=relaxed/simple;
	bh=pwmtWNrqDVg2rI64aHz+boP7gTDUq9GICL0T2h/DMTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iZEmJ8ffiihZrM2+Vwq70lZVF35noQmhZeCnKDbAyNp7yf2WUitLHjF8qfOpySLuRlgt2iyQMaE+0dMpJoruVkvZBlg1cHCu48+37IKYZuYWSySgsgepSJ7fECZFQDVSljYm1YBkE3UWfMWvtjlk9QysEAhPUxkwBMYKXrmnv90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s9AGiUyR; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30737db1ab1so17874641fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 03:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737717275; x=1738322075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sacSme45d+zAHAZW9ym+kv+4dwtO/HOlcohR4MIv7o=;
        b=s9AGiUyR9RSKyIQ2Iq/PPd6RwbUlStFvZ2GdGLI1AHZOy4+t6ph0i7pizjxjGu8TfD
         60g5jzWvUykd9cUBJOJNhzxmRzaswXH0yZz1HiBi+9HuQCMy1cxr47K00cPL3MtGyQvo
         bkMo/ry09H7mx6Lu9PEp/JPO4f8S3oNOzKpE4WhOlCa0EIjay2F4e8HByb+aCCHMzSmZ
         oRUmIbFat1L8DB2nswvkmqyL13sOlsLD6KCGzRBtIDDlqI59jwHq2gf0r46K6u7jlYJr
         KMhQIcBpgO6ueJVX3er6dDYP2Y2Ji9UhV9sxNkrwiUMNdGewzcfDl8oNKC59S/SGgA8A
         J8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737717275; x=1738322075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0sacSme45d+zAHAZW9ym+kv+4dwtO/HOlcohR4MIv7o=;
        b=j0cheQq5RwZc82R0Mbbv78ItxXjGpCEZ75PrAyIRJwB1iloVZepm4EuooD5XBMC62r
         Yyp5Xlddnzf53NNKwjQvzGGAMYNhTr3DS+2ShVwnQdOvX87SDdK7cOnI8jg1dkFWY8HU
         yKpWI/18bB7LOoebj32c2osMIUwdys1nN8VaNJlyo6X67g87PFsOKAp8Em8usIBiC2xl
         2LikAXsgDTWT9yB9IjTX6orJupjxiqRaQdkRlbeEXrk15KH3+kBRDeLyMI1/85H2XuTV
         xc6lRESnwb/iKtDZ+Oc67aw8SlGbo3zdppag4BzsMjEj8Kq/mS2qdMMaa/FjEJh03j5P
         RIFw==
X-Forwarded-Encrypted: i=1; AJvYcCVGaKreknQcHQOOGS5KXLhPCNfGfHjJ7nYa1oEd9pIamD93hL0QnIZVvJbCYb0dOWNpAVUc5KSitMqiGGYl@vger.kernel.org
X-Gm-Message-State: AOJu0YyKL/cOF/QmJZEJHKBVmU9MN/BtbhLZReNlVL2wjhvGkB0WMqMY
	gcN0u12zKScqMqFL9fofJV7xDQqcSxF2Dvd/45gplDcNNxfTyHGSGsjR11+adpo=
X-Gm-Gg: ASbGncshWCL5YsUUBqLxAqKOCdTXhcJVWWm119aSr4NZrgkfopYAHEk50PoEbywXKmh
	04cgkVUFRqlcqFXRMim3kifpJciYNJETaFK5MhpsgmDofYGXCK7CVK920r0rokvxjCZLC0hao3h
	sNWeks+ZfMxaS+2UKhi8xGssY6g6ipjGskIfwuGZFgNv0LLQH37+pVPZ8iKKzXT7qJYboKyZ0dG
	k7uLySA2yQKbugxEvtB+TEAizRfoMt5vOoQbBTwrWJrcwHUR6esSrNt316qpo2617DXjfgjlCQE
	9rKBexrXu7kF
X-Google-Smtp-Source: AGHT+IEKsI1FHKsU/oq63Owrwj/AxIolbDVcCg9fk2AcSbkPZFLWwNFBfl+vzCRP0IAnp1mAghhfXQ==
X-Received: by 2002:a2e:a901:0:b0:2ff:cfbb:c893 with SMTP id 38308e7fff4ca-3072ca60a30mr114304741fa.6.1737717275242;
        Fri, 24 Jan 2025 03:14:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bacba5esm3289701fa.36.2025.01.24.03.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:14:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 13:14:20 +0200
Subject: [PATCH 2/6] drm/mgag200: move format check to
 drm_plane_helper.atomic_needs_modeset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-atomic-needs-modeset-v1-2-b0c05c9eda0f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3634;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pwmtWNrqDVg2rI64aHz+boP7gTDUq9GICL0T2h/DMTk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnk3YURWUWU01A6XqaUSIWW8FOy+qff+XjWYSkZ
 56VP0FXSWeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5N2FAAKCRCLPIo+Aiko
 1cFHB/4xZMU+AzbdxZr6M/tEKI3BPADtj3wkgUMr8+GsJt3pS5i0aL+uSRnAQ0w90ahY+xj1NGR
 ydwByJx+LU6dcZ9VBukcBNtjs+jW36FmNm4n2ATCuO7G1j7UtnUw446vYER8Y9XKYuMEL8YcUo+
 3OilKZKQLU3Is/wYwRtbcix/JeDmw34ZFQkpFSlOn95EopH6vBbOVDxz3k69cW1x1QFvMJYnYRH
 bBSgj/YBG+RkwVoBwxO/hgkj/MsUWdVdqp4mzFYQOnC49PetFw7e7kvpieLlz0C4X4CQy4jmyO3
 W3kgVzYd+wz73NA+9RiEMUfMwT3WubiRVFl9c+y+CzZ9qUqX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

For the mgag200 driver if the format of the plane changes, then the PLL
rate needs to be changed. This requires performing a full CRTC modeset.
Current code sets drm_crtc_state.mode_changed from the plane's
atomic_check() callback and then doesn't call drm_atomic_helper_check()
again. It works for the mgag200 driver, but it breaks calling convention
of the drm_atomic_helper_check() function.

Move the check to the new atomic_needs_modeset() callback, removing the
need to set the flag in the atomic_check().

Note: this also checks the check to compare format to the
old_plane_state->fb->format instead of using plane->state->fb->format.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  2 ++
 drivers/gpu/drm/mgag200/mgag200_mode.c | 27 ++++++++++++++++++++-------
 2 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 0608fc63e588bb60f1b087d263a34cfd11624b52..42cf0826ed14e0e9e4ed1b7920486bda008a0f99 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -354,6 +354,8 @@ extern const uint32_t mgag200_primary_plane_formats[];
 extern const size_t   mgag200_primary_plane_formats_size;
 extern const uint64_t mgag200_primary_plane_fmtmods[];
 
+bool mgag200_primary_plane_helper_atomic_needs_modeset(struct drm_plane *plane,
+						       struct drm_atomic_state *new_state);
 int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
 					      struct drm_atomic_state *new_state);
 void mgag200_primary_plane_helper_atomic_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index fb71658c3117b25311f19276d6f4ffdee157ac17..63285b356326a13b465387e5d7ac90ec9fe867cf 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -463,12 +463,31 @@ const uint64_t mgag200_primary_plane_fmtmods[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+bool mgag200_primary_plane_helper_atomic_needs_modeset(struct drm_plane *plane,
+						       struct drm_atomic_state *new_state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(new_state, plane);
+	struct drm_framebuffer *new_fb = new_plane_state->fb;
+	struct drm_framebuffer *fb = NULL;
+
+	if (old_plane_state)
+		fb = old_plane_state->fb;
+
+	if (!new_fb)
+		return false;
+
+	if (!fb || (fb->format != new_fb->format))
+		return true;
+
+	return false;
+}
+
 int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
 					      struct drm_atomic_state *new_state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
 	struct drm_framebuffer *new_fb = new_plane_state->fb;
-	struct drm_framebuffer *fb = NULL;
 	struct drm_crtc *new_crtc = new_plane_state->crtc;
 	struct drm_crtc_state *new_crtc_state = NULL;
 	struct mgag200_crtc_state *new_mgag200_crtc_state;
@@ -486,12 +505,6 @@ int mgag200_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	else if (!new_plane_state->visible)
 		return 0;
 
-	if (plane->state)
-		fb = plane->state->fb;
-
-	if (!fb || (fb->format != new_fb->format))
-		new_crtc_state->mode_changed = true; /* update PLL settings */
-
 	new_mgag200_crtc_state = to_mgag200_crtc_state(new_crtc_state);
 	new_mgag200_crtc_state->format = new_fb->format;
 

-- 
2.39.5


