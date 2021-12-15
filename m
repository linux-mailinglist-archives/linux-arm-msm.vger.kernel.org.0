Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF4F7475CE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 17:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238082AbhLOQJ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 11:09:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244463AbhLOQJR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 11:09:17 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3190DC06173F
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 08:09:17 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id a37so32979488ljq.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Dec 2021 08:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KclpA+/0L/F7u9jRUKSOAZvZNDtVIlk59RARlc86ggs=;
        b=BW2Qt9EaFJTiHZdC3nvN/PUwTUpy6oR/0JRu42C/dW2P6CLvRaQ8LMP4HMHHmJLuk+
         p2PK7QpmjSv6EOQ4aDhdemXNuF47Ju7eN6qz+UIsw7jD14G/EST3fRXX9pVe+4sT/phl
         D2T9v2LwbqBp128aZo89UtQEFu3Rlt2uyzS4Ok5/ef9CzrpHcHIGFjHkdQoU2GetS6Ni
         ci3Y2NrukaRT73fvM81iUMphUlzP9B82buHfUtiP0RkzW+k575bk3vcAXDAZir709dO2
         OF58XG8Ol6bCAfxFxZjRI+gK1m9grn84DJ/OsUD82Xzd/jCvroYnzcf6cWc0UwXmBXhz
         c8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KclpA+/0L/F7u9jRUKSOAZvZNDtVIlk59RARlc86ggs=;
        b=T01VxNmE2FnQ2vkv7AGvMsuQggzIkKcfYmtIh/aH0ayK1bSElbPQ5IyTpzMWODu+Ds
         Qr5PhXZqixcbbN+5THMOFymUSWx0hR0hJ53GHH4B799IzaLIlGRi8+Su2gSRIuIMwJsd
         5kht+G/7MIOPcjrssvdlQf7IZtJD1VWi5s4teyzHFhltJigUiIwmJAy9gxuNq7MHK0e4
         36CITWGqtKkVtbnsDCdqjh4v1dINWGL3N58onxXgxn8zVtVU3H5yV85VNohGi09ifECl
         BnPZ84hqnvotW/2U85GNyQXr1BqHcdk7YrlRodHwtISmfoRtzll7Sw3oJ0rSmG4MxCKC
         U5LA==
X-Gm-Message-State: AOAM5325RmWADwxvN0jHuRZhOiym2pZe85j79kNqb1agAbwToWSTQ7jd
        p1msquo3+QZzbtzo2suHsi6kcQ==
X-Google-Smtp-Source: ABdhPJwx6kHE+Zh5SlUtduh99+fCd5xnD/MrJDiyKG5Dn+A0vsIz//wtOq3GIBs9TtKvHvEzJ0IPcg==
X-Received: by 2002:a2e:964a:: with SMTP id z10mr10593692ljh.210.1639584555501;
        Wed, 15 Dec 2021 08:09:15 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id p3sm384429lfo.162.2021.12.15.08.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 08:09:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/dpu: add dpu_crtc_atomic_print_state
Date:   Wed, 15 Dec 2021 19:09:11 +0300
Message-Id: <20211215160912.2715956-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement CRTC's atomic_print_state() callback, printing DPU-specific
CRTC state (LM, CTL and DSPP ids).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 59b1bcfbe8c0..df128a680697 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -924,6 +924,20 @@ static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
 	return &cstate->base;
 }
 
+static void dpu_crtc_atomic_print_state(struct drm_printer *p,
+					const struct drm_crtc_state *state)
+{
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
+	int i;
+
+	for (i = 0; i < cstate->num_mixers; i++) {
+		drm_printf(p, "\tlm[%d]=%d\n", i, cstate->mixers[i].hw_lm->idx - LM_0);
+		drm_printf(p, "\tctl[%d]=%d\n", i, cstate->mixers[i].lm_ctl->idx - CTL_0);
+		if (cstate->mixers[i].hw_dspp)
+			drm_printf(p, "\tdspp[%d]=%d\n", i, cstate->mixers[i].hw_dspp->idx - DSPP_0);
+	}
+}
+
 static void dpu_crtc_disable(struct drm_crtc *crtc,
 			     struct drm_atomic_state *state)
 {
@@ -1454,6 +1468,7 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.reset = dpu_crtc_reset,
 	.atomic_duplicate_state = dpu_crtc_duplicate_state,
 	.atomic_destroy_state = dpu_crtc_destroy_state,
+	.atomic_print_state = dpu_crtc_atomic_print_state,
 	.late_register = dpu_crtc_late_register,
 	.verify_crc_source = dpu_crtc_verify_crc_source,
 	.set_crc_source = dpu_crtc_set_crc_source,
-- 
2.33.0

