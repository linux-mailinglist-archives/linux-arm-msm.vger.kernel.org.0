Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF143901E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 15:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233148AbhEYNOx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 09:14:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233150AbhEYNOw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 09:14:52 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECAF2C061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 06:13:22 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id b26so29944833lfq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 06:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2n7j6woRRD2/J1RIFUHaJx0Us+qgUiMCWnRykbRfses=;
        b=NBzon7rqI1R9tCWpkRhk/EXuCfNF+AicrV7Gd/HCTnSZPRHtM8Rgv9Y566E7+1UA++
         pIPU0r++SaV9/6pXcLM2bwKKMiU0eUtC2LTUnzT9zRSwEyZCsa7/gce4sxmEgYUK4vFx
         VFMq/sGn8o3aIgtNlraSPWXOG6jJ+28OSUdDZ3JA3fYtcEzAnotVwxv8eoSSVoG1+Zf4
         3bvnCTiHhXjmnPd9H42sqwZj+LbPWaxFV7cG9YR/eR9uxhWKJcIpGmlWWCcFw8BmHqD9
         iI5STAQ+P8+RIn8f5zKhHJIvfDpzA2enhj3pVseF0hq/MVntuhMS4/4MaiE2Mm3M18vC
         qj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2n7j6woRRD2/J1RIFUHaJx0Us+qgUiMCWnRykbRfses=;
        b=oRO+yeGYL1KcPdRt6lkrsybh6nu6FRGitxOI1uIAvKEmh+L8hEseSOICqPpf+4uo9n
         +/pEkJwCQqCQwWR+Z1D6xpFA+YEZcszsP1E25raOVaUy/Fj+atUr4oe31egwfBM0ldhA
         jYMOZIZa+rNLfgsshP7tf3xdNxjODnjnEi+snfyVVYPkBok07HPWd394ALhoQHcgo66j
         mXKB98RV5TlFz2+zU0YjSM7zZPRVbBB5rVrXKH7Nc/k1oOFpMhmXkSrVwJBos4g6JL94
         aQcaWgmaV1bC7EkZajRXwCAyohUDAFPpG3sgTdf8BGYvHSCZosWTAP6EH1rrSm+SANKD
         +JZg==
X-Gm-Message-State: AOAM531nXwv4PYefTXeRNzKoEXMTqj+ubOhePZxo6SGm518W2Wjqi1r9
        52IQ+SDVYTOivxAL4xXDfADBeA==
X-Google-Smtp-Source: ABdhPJzTbNh3h70xYjMmgR0V7fYwVmNYQf+kSeh1zKBJpeS2uzDsqwIXtoAgPiuIzDsV89zLPAn3hA==
X-Received: by 2002:ac2:561a:: with SMTP id v26mr14551043lfd.602.1621948401346;
        Tue, 25 May 2021 06:13:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 06:13:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 4/7] drm/msm/mdp5: add support for alpha/blend_mode properties
Date:   Tue, 25 May 2021 16:13:13 +0300
Message-Id: <20210525131316.3117809-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
References: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hook alpha and pixel blend mode support to be exported as proper DRM
plane properties. This allows using this functionality from the
userspace.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 90cd825df16b..9c678e336e7a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -91,6 +91,11 @@ static void mdp5_plane_install_properties(struct drm_plane *plane,
 	INSTALL_RANGE_PROPERTY(zpos, ZPOS, 1, 255, 1);
 
 	mdp5_plane_install_rotation_property(dev, plane);
+	drm_plane_create_alpha_property(plane);
+	drm_plane_create_blend_mode_property(plane,
+			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+			BIT(DRM_MODE_BLEND_PREMULTI) |
+			BIT(DRM_MODE_BLEND_COVERAGE));
 
 #undef INSTALL_RANGE_PROPERTY
 #undef INSTALL_ENUM_PROPERTY
-- 
2.30.2

