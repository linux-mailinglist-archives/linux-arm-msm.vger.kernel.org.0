Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CCEF3AFEA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 10:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhFVIGI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 04:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbhFVIGI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 04:06:08 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE246C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 01:03:51 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id r5so34540394lfr.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jun 2021 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L6dvvzZyObyhwL2GTDK5GvqaSMzikBYI0dsjq1ofWU4=;
        b=HFg0pBvn1ezE7HGOPwEwUN9DJO42xcGeiBFeOhr6aoBg30gTuZlwYhuhMcR245tWXp
         Wf6RDOtbApunsSpqsRtQCJsJ4AYTt8X/679UrIKSHm9El2INdHViVmySgw5i8NvV2RTU
         d30kCptz/ljypl0dtsaDvUmYjlXxYZl9Xt3rBLAS6fINncZzxCVrQ39AWlNJ8N3Vyq3L
         dtJPTth9DQ0UJV8wH12ffvFfqSeMeXoAhWv8mxQEa5InI2KmAAp6gcfBMeg06Yah+n6b
         lmP/rvnLNQIt6DpJNTPH0A1QKl0DbvFG7D9wVXOLwq2ldI81Tu8oBplw5eKkv6H5B2O5
         3vWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=L6dvvzZyObyhwL2GTDK5GvqaSMzikBYI0dsjq1ofWU4=;
        b=c/0nfclcCpOcTiOvqpS8gKZwZ3Z6ZBaEoIefocFvO0iatQ5dEVv9nlopWA591Rgcs2
         K4T2Ou93wcFmA3KZ8c+8pQvxlbHVRU2LhaGSQJ1POpTLT3D6+4K7ZEK+JRjqkSnlTR8L
         /A2v60RjW6u2D8uxcrFHh9e0uqClDoABLl2q7bA7UE8KgcZy8EwXgbCivNxGuoxz44Nb
         oNxhBB/PIxuUOz0BMOSoAcQcHEwqci88EbEA1uzeJtErOSdnWPaSp/3qV3AF76PXVgu1
         ikGWF4LIMBqm5X99Je4zsPOSrSgqsDLEkY2Izp9yB6WcYTnuztLvOQNSJdwx9qbEl7mP
         7JHg==
X-Gm-Message-State: AOAM533cnKNuNAQjo8GJ+1i73BSMQ3ouQEYoqvJxe3sT8ku9t3B+Dngi
        TyurD9BxZC+dIo8RAwhRyJ92HSu3fxZh7g==
X-Google-Smtp-Source: ABdhPJw7cTkEh1N0fgadAC+01g/UwE9Xlil803bn3Q7tlFSolIxHYOX0pr/E0nrh1tLM5H/0tYzeLw==
X-Received: by 2002:a19:e20d:: with SMTP id z13mr2010790lfg.538.1624349029921;
        Tue, 22 Jun 2021 01:03:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p9sm998289lfe.112.2021.06.22.01.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 01:03:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/mdp5: fix 64-bit division in bandwidth calculation
Date:   Tue, 22 Jun 2021 11:03:48 +0300
Message-Id: <20210622080348.1679589-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix undefined symbols errors arising from 64-bit division on 32-bit
arm targets. Add 64-bit version of mult_frac and use it for calculating
bandwidth.

ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!
ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!

Fixes: 7e0230fd096c ("drm/msm/mdp5: provide dynamic bandwidth management")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   |  5 ++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c |  2 +-
 include/linux/math.h                       | 13 +++++++++++++
 4 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index a9332078aa13..52724d0a6fea 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -755,7 +755,7 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *crtc,
 	hw_cfg = mdp5_cfg_get_hw_config(mdp5_kms->cfg);
 
 	if (hw_cfg->perf.ab_inefficiency)
-		crtc_bw = mult_frac(crtc_bw, hw_cfg->perf.ab_inefficiency, 100);
+		crtc_bw = mult_frac_ull(crtc_bw, hw_cfg->perf.ab_inefficiency, 100);
 	mdp5_cstate->new_crtc_bw = crtc_bw;
 
 	/*
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 3e1b28d3e41b..85b7093a1218 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -301,6 +301,7 @@ static const struct mdp_kms_funcs kms_funcs = {
 void mdp5_kms_set_bandwidth(struct mdp5_kms *mdp5_kms)
 {
 	int i;
+	u64 bw;
 	u32 full_bw = 0;
 	struct drm_crtc *tmp_crtc;
 
@@ -311,7 +312,9 @@ void mdp5_kms_set_bandwidth(struct mdp5_kms *mdp5_kms)
 		if (!tmp_crtc->enabled)
 			continue;
 
-		full_bw += Bps_to_icc(to_mdp5_crtc_state(tmp_crtc->state)->new_crtc_bw / mdp5_kms->num_paths);
+		bw = to_mdp5_crtc_state(tmp_crtc->state)->new_crtc_bw;
+		do_div(bw, mdp5_kms->num_paths * 1000); /* Bps_to_icc */
+		full_bw += bw;
 	}
 
 	DBG("SET BW to %d\n", full_bw);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 85275665558b..2ede34177a90 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -191,7 +191,7 @@ static void mdp5_plane_calc_bw(struct drm_plane_state *state, struct drm_crtc_st
 		prefill_div = vbp + vpw + vfp;
 #endif
 
-	pstate->plane_bw = max(plane_bw, mult_frac(plane_bw, hw_latency_lines, prefill_div));
+	pstate->plane_bw = max(plane_bw, mult_frac_ull(plane_bw, hw_latency_lines, prefill_div));
 }
 
 static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
diff --git a/include/linux/math.h b/include/linux/math.h
index 53674a327e39..1327385905df 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -118,6 +118,19 @@
 }							\
 )
 
+#define mult_frac_ull(x, numer, denom)(			\
+{							\
+	typeof(x) quot = (x);				\
+	typeof(x) rem;					\
+	do_div(quot, (denom));				\
+	rem = (x) - quot * (denom);			\
+	rem = (rem * (numer));				\
+	do_div(rem, (denom));				\
+	(quot * (numer)) + rem;				\
+}							\
+)
+
+
 #define sector_div(a, b) do_div(a, b)
 
 /**
-- 
2.30.2

