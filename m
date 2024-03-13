Return-Path: <linux-arm-msm+bounces-13958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1616587A011
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 01:14:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ADA81C224D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 00:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0364688;
	Wed, 13 Mar 2024 00:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VsFCgmX5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AA033CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 00:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710288841; cv=none; b=OlJsFlnDzTizw6W21DnlbulzwO5MBeHNluWoS5W9fByOzNbmWGg3lz+Wgp3kyH4dd+2ryyHuX+cQtrND7X/AR/5jZQS9a5h1RSSUNp5oRW3j1MaQAN+MvXLCrysuXxAC3aw/DRjgHTXxJXdNUq5S7VvJR0YZdEwBJiVfjM73cA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710288841; c=relaxed/simple;
	bh=YHGe8Mr61zFdFMoogYGbvzM2x9pXZrtdIwDPSx9JXC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MThZGITuNGR9w+ew/5kNetjNrm70vqJRKK5oUd6aevqKKK4+3Qe+Swn1yYcT2JLfxP0MUTyx0YnKzuOBHw19z6SnxaoHzUWqA9KPSGnz+Po0zsskXP2lSdTKsTnSUOF18uR2WIlk81xRJ5QeSZJh2L8ESemmBbKDiXCjpJNv8Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VsFCgmX5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dc29f1956cso31473285ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 17:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710288839; x=1710893639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iH7dOzHfySID1hx+dQROG4kWo57xV6ZLxO4hN1el+Bw=;
        b=VsFCgmX5e0UVWWk9bUXb6sherJM/1LcOI6PfqPb6GYbp3yywhbji8XK3O3fBLO/DNL
         DJUzIKALh0+gC9lOo09GIXV7h+AIGg3ufHtVPf3TyGkVjzXXf8jXPh1RKyDnrlcFNywy
         H7M8owjt+AEdIb0gYjOu5yI67QVYvveIC2Q8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710288839; x=1710893639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iH7dOzHfySID1hx+dQROG4kWo57xV6ZLxO4hN1el+Bw=;
        b=UD5xgfADIJFXCOhHUkaHy03Hp1JCGmtmu9iBTtl8aM4S0D1mpTNe5vGEVLKaKZtU0N
         361mZekKUgjBqm2v7EmVq9DsXy1k2PdSWbUOCEqsxoXdnTvWOWrzddXQ3QPNE4jN82Ne
         rMthO7xahcarDyQEgQ0EsXiCnH1hczqrTPgrrH0NCqsubteMmu5RgyEumCot1N230JWy
         L9oCfZXf/ByxJWp645Y37wwgWSoXrYq3lqBHUhrlKnoKZE46Pjsz/3+S+rgzdRNQUfbU
         +ouc4A6Y+v0DH+iz/aBuMk9GKoByoWoknZEv0vdKc/xu4NlE76eQLGQorVL93XcG0scE
         6sLw==
X-Forwarded-Encrypted: i=1; AJvYcCV1tDN1QtbBeFVLHBTpZeyFXp+cRAHdIII/VqJHNDF3Mfv7xCgiAAW9BxKg8B0QerZXjE6a13baVBKbXyIOdG/qZ/wlAA9apENUn30WQA==
X-Gm-Message-State: AOJu0YwcAGKjBRZimEjb7No1VZ3qgpdzVJIq9mMBPHvfKsxtZi0wWnQw
	79q2tL9XXt84bjWdyRU7SzSF2MMjHP2MklpAQvtBPO1VsSJntFELc4Q8IXTN+w==
X-Google-Smtp-Source: AGHT+IF8TBuICwc1/oaTRuDykpJ3M8i0pZiDCaxf+rAiL5WJKMEjNtGSI5raH9YjmvsuRaXg9/0jPg==
X-Received: by 2002:a17:902:cec1:b0:1dd:a16e:dea4 with SMTP id d1-20020a170902cec100b001dda16edea4mr8173646plg.67.1710288839081;
        Tue, 12 Mar 2024 17:13:59 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:f8dd:895c:e876:6edb])
        by smtp.gmail.com with ESMTPSA id x8-20020a170902a38800b001dd761faec3sm7432924pla.251.2024.03.12.17.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 17:13:57 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Guenter Roeck <groeck@chromium.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sean Paul <sean@poorly.run>,
	Tanmay Shah <tanmay@codeaurora.org>,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/msm/dp: Avoid a long timeout for AUX transfer if nothing connected
Date: Tue, 12 Mar 2024 17:13:16 -0700
Message-ID: <20240312171305.1.I16aff881c9fe82b5e0fc06ca312da017aa7b5b3e@changeid>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
In-Reply-To: <20240313001345.2623074-1-dianders@chromium.org>
References: <20240313001345.2623074-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As documented in the description of the transfer() function of
"struct drm_dp_aux", the transfer() function can be called at any time
regardless of the state of the DP port. Specifically if the kernel has
the DP AUX character device enabled and userspace accesses
"/dev/drm_dp_auxN" directly then the AUX transfer function will be
called regardless of whether a DP device is connected.

For eDP panels we have a special rule where we wait (with a 5 second
timeout) for HPD to go high. This rule was important before all panels
drivers were converted to call wait_hpd_asserted() and actually can be
removed in a future commit.

For external DP devices we never checked for HPD. That means that
trying to access the DP AUX character device (AKA `hexdump -C
/dev/drm_dp_auxN`) would very, very slowly timeout. Specifically on my
system:
  $ time hexdump -C /dev/drm_dp_aux0
  hexdump: /dev/drm_dp_aux0: Connection timed out

  real    0m8.200s

Let's add a check for HPD to avoid the slow timeout. This matches
what, for instance, the intel_dp_aux_xfer() function does when it
calls intel_tc_port_connected_locked(). That call has a document by it
explaining that it's important to avoid the long timeouts.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/dp/dp_aux.c     |  8 +++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 10 ++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index 03f4951c49f4..de0b0eabced9 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -307,7 +307,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 	 * turned on the panel and then tried to do an AUX transfer. The panel
 	 * driver has no way of knowing when the panel is ready, so it's up
 	 * to us to wait. For DP we never get into this situation so let's
-	 * avoid ever doing the extra long wait for DP.
+	 * avoid ever doing the extra long wait for DP and just query HPD
+	 * directly.
 	 */
 	if (aux->is_edp) {
 		ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
@@ -315,6 +316,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
 			DRM_DEBUG_DP("Panel not ready for aux transactions\n");
 			goto exit;
 		}
+	} else {
+		if (!dp_catalog_aux_is_hpd_connected(aux->catalog)) {
+			ret = -ENXIO;
+			goto exit;
+		}
 	}
 
 	dp_aux_update_offset_and_segment(aux, msg);
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 5142aeb705a4..93e2d413a1e7 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -266,6 +266,16 @@ int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog)
 				2000, 500000);
 }
 
+bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	/* poll for hpd connected status every 2ms and timeout after 500ms */
+	return readl(catalog->io->dp_controller.aux.base + REG_DP_DP_HPD_INT_STATUS) &
+	       DP_DP_HPD_STATE_STATUS_CONNECTED;
+}
+
 static void dump_regs(void __iomem *base, int len)
 {
 	int i;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 38786e855b51..1694040c530f 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -86,6 +86,7 @@ void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
 void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog);
 int dp_catalog_aux_wait_for_hpd_connect_state(struct dp_catalog *dp_catalog);
+bool dp_catalog_aux_is_hpd_connected(struct dp_catalog *dp_catalog);
 u32 dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
 
 /* DP Controller APIs */
-- 
2.44.0.278.ge034bb2e1d-goog


