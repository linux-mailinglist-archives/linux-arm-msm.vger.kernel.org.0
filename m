Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4562C045D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 12:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729073AbgKWLUO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 06:20:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729067AbgKWLUN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 06:20:13 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C271DC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 03:20:12 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id t4so5263053wrr.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2020 03:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2t9iqbRyeuX0nirNEosiONRTy+C0oDlGXG3WbFusG7M=;
        b=Jn6Pi1XsJmL/ENpTrqWl/cVPr3vx0YNgOS0FywSmCPK1bAfC/IFmtCJGaN1r4k7BPl
         szGNkuRtsjmCJUE4tSBByndiNoSA+Oa1/oqY1J45rr5PEg9SSAJwW4W14yhlNhz5EwlD
         PJPDHisOPu6iE5F75An6OB8dlNoOqbIRkRTE22eV0voFuHwP+yBoJvGLbBiMuhAZojcj
         ZvlfzkekMQi4qdyEAh/Feoz3IQNQWf72JA/ezIoa4uROSkTgnTdmkdh2f+va2s5ccagb
         KeFpsyv9L87nppTo0afKj9dr5gd3fawB1oKsvlHi2icTPnhdmq62KKssY26CgNbwUL9e
         u43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2t9iqbRyeuX0nirNEosiONRTy+C0oDlGXG3WbFusG7M=;
        b=R51spb+YM0bIAK5odfHd2DHQeO6Y87PI9nS9r61vyvzkU3/pEn8rv1mXZOj9kCJr32
         9zG+YOYv0RGwXzfA27jDAqyigCRwMhmLMAwwWHwITSFrVX85I7ZYRGtaG831MLyzlnxY
         pQJz/zcSBcMeWsV8hkqPRpOzu8jLPi3kbIek49CifdRJJ9PA9YEz4Wnbfy6sUGBxEYZO
         0cRdegRAumpgilJNNNSMwpWhkA9pP/TvftwsOUu39YLuYtFmi4xwxvbD4WlRc6U5ExRj
         L2NL1iElMCr1+pFyThosrwxEVDhtzKgICVVEV2wo3VKTjMeaO1G+5/ZS+1QRhOlExoMo
         L7tg==
X-Gm-Message-State: AOAM533XnUsHDBd8xE3IaQsuaftBcJgoygOXQFeRXHP/Co6JZZjeOpSL
        fCIl32KGKaMZCjFePEywP+D+Tg==
X-Google-Smtp-Source: ABdhPJxAa7z5x3+CcaJFNBIR42ujVfPJC43gdl9BpgeYhYwm4UnICya36UGyV1RT4iTouygxQ8UUDw==
X-Received: by 2002:adf:f5c8:: with SMTP id k8mr31439775wrp.2.1606130411509;
        Mon, 23 Nov 2020 03:20:11 -0800 (PST)
Received: from dell.default ([91.110.221.218])
        by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 03:20:10 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 35/40] drm/msm/disp/dpu1/dpu_plane: Fix some spelling and missing function param descriptions
Date:   Mon, 23 Nov 2020 11:19:14 +0000
Message-Id: <20201123111919.233376-36-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:152: warning: Function parameter or member 'plane' not described in '_dpu_plane_calc_bw'
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:152: warning: Function parameter or member 'fb' not described in '_dpu_plane_calc_bw'
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:152: warning: Excess function parameter 'Plane' description in '_dpu_plane_calc_bw'
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:200: warning: Function parameter or member 'plane' not described in '_dpu_plane_calc_clk'
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:200: warning: Excess function parameter 'Plane' description in '_dpu_plane_calc_clk'
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:232: warning: Function parameter or member 'src_width' not described in '_dpu_plane_calc_fill_level'
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:232: warning: Excess function parameter 'src_wdith' description in '_dpu_plane_calc_fill_level'
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1060: warning: Function parameter or member 'error' not described in 'dpu_plane_set_error'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Kalyan Thota <kalyan_t@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c0b1d77369e53..cf0084d7cc7c9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -142,7 +142,8 @@ static struct dpu_kms *_dpu_plane_get_kms(struct drm_plane *plane)
 
 /**
  * _dpu_plane_calc_bw - calculate bandwidth required for a plane
- * @Plane: Pointer to drm plane.
+ * @plane: Pointer to drm plane.
+ * @fb:   Pointer to framebuffer associated with the given plane
  * Result: Updates calculated bandwidth in the plane state.
  * BW Equation: src_w * src_h * bpp * fps * (v_total / v_dest)
  * Prefill BW Equation: line src bytes * line_time
@@ -192,7 +193,7 @@ static void _dpu_plane_calc_bw(struct drm_plane *plane,
 
 /**
  * _dpu_plane_calc_clk - calculate clock required for a plane
- * @Plane: Pointer to drm plane.
+ * @plane: Pointer to drm plane.
  * Result: Updates calculated clock in the plane state.
  * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
  */
@@ -224,7 +225,7 @@ static void _dpu_plane_calc_clk(struct drm_plane *plane)
  * _dpu_plane_calc_fill_level - calculate fill level of the given source format
  * @plane:		Pointer to drm plane
  * @fmt:		Pointer to source buffer format
- * @src_wdith:		width of source buffer
+ * @src_width:		width of source buffer
  * Return: fill level corresponding to the source buffer/format or 0 if error
  */
 static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
@@ -1055,6 +1056,7 @@ void dpu_plane_flush(struct drm_plane *plane)
 /**
  * dpu_plane_set_error: enable/disable error condition
  * @plane: pointer to drm_plane structure
+ * @error: error value to set
  */
 void dpu_plane_set_error(struct drm_plane *plane, bool error)
 {
-- 
2.25.1

