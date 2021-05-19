Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E66C38957D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 May 2021 20:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbhESSge (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 14:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbhESSgd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 14:36:33 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B15C06175F;
        Wed, 19 May 2021 11:35:12 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id g18so8846030pfr.2;
        Wed, 19 May 2021 11:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dyRDajTFtNR7qr6Z/Z6izOc/ls5KixsyxM2Zqyhcyx0=;
        b=eOZsGbrygtGS4/kxKpqgyGbe/Fo5x0P2lHIMmrcJXGV4SpQSKMRgmMAlrfW4oJ4Vys
         8yqjqUz7iOcvEESiU0uY6nMb1DtkN48S3Ka8KXU45JEkNzxxoYKSscD257Kskkhkc8d3
         hYgJXTGHdxlSs/+XDhBwZElkhnm0Fgu6puwguzM/9SP7rZHf5yDKL7GPS0qyplg2yg71
         aKeajdjSsmVwqtCXsOodXYd/R2oKE4LkPfNaPG1U7xvCJeaatTKHiyAJxy1nPONQeaxV
         pK0pIU/EWGQrOvgqFwdOovX3DyX4ZZpWXhlKtSLY0Aqj4Ev6Gh2xyrAM78nLLMmxWKy+
         tZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dyRDajTFtNR7qr6Z/Z6izOc/ls5KixsyxM2Zqyhcyx0=;
        b=q3KGkFCrQnlzme+k5wGl0ji+uT3KZlbIwiXDVdBDcuPzqerVpuU3QNdYyUsl367uKN
         FxQeltXa8paaeW45UGCM69Z2A9Jl9YhcS8PO+QrSFHzzXnnss+ZDezS5KvOr5VC+4KeN
         zywqIwYGx7yDJ58KE9gd3w2L7jr9QEacQlZft4wgYflaIQ9peO2pOtWy3NZX/d2Mykvw
         ylc7MUVpECEzEarvxAO7segorzp+CAIABAqquCuOEj2PbDzscJhRgQuU1l/SPjLYL0d3
         SmtGDuPfpwrheUh0WBB+E0e290fEdQWB1BD+C+XTeyxwMnw0kM1Z2m/XcUsjMoPsNpHT
         k4tw==
X-Gm-Message-State: AOAM5312I5cSX8cHDerdsyYn6eHtvNc8uOYb1KI5DphvsnNwchXmQJDG
        QDnEhLTzXSfCb6gbKJrI5iA=
X-Google-Smtp-Source: ABdhPJz070ZMP7NkCwg2+MzB3JAsmbQUlCPKYZE6FXutZqjSQPpc/vo/B9BYHb7ZffVGJDNYLhVs9Q==
X-Received: by 2002:aa7:920d:0:b029:2d9:2ead:70dd with SMTP id 13-20020aa7920d0000b02902d92ead70ddmr453130pfo.67.1621449312453;
        Wed, 19 May 2021 11:35:12 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id k13sm115340pfg.31.2021.05.19.11.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 11:35:11 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [RFC 2/3] drm/atomic: Call dma_fence_boost() when we've missed a vblank
Date:   Wed, 19 May 2021 11:38:53 -0700
Message-Id: <20210519183855.1523927-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210519183855.1523927-1-robdclark@gmail.com>
References: <20210519183855.1523927-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 560aaecba31b..fe10fc2e7f86 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1435,11 +1435,15 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 	int i, ret;
 
 	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
+		u64 vblank_count;
+
 		if (!new_plane_state->fence)
 			continue;
 
 		WARN_ON(!new_plane_state->fb);
 
+		vblank_count = drm_crtc_vblank_count(new_plane_state->crtc);
+
 		/*
 		 * If waiting for fences pre-swap (ie: nonblock), userspace can
 		 * still interrupt the operation. Instead of blocking until the
@@ -1449,6 +1453,13 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 		if (ret)
 			return ret;
 
+		/*
+		 * Check if we've missed a vblank while waiting, and if we have
+		 * signal the fence that it's signaler should be boosted
+		 */
+		if (vblank_count != drm_crtc_vblank_count(new_plane_state->crtc))
+			dma_fence_boost(new_plane_state->fence);
+
 		dma_fence_put(new_plane_state->fence);
 		new_plane_state->fence = NULL;
 	}
-- 
2.30.2

