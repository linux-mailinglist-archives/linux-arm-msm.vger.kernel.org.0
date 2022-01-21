Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2929D496707
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jan 2022 22:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232237AbiAUVG3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jan 2022 16:06:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiAUVG1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jan 2022 16:06:27 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4B2C06173D
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jan 2022 13:06:26 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id br17so36318215lfb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jan 2022 13:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HACSLRAJTlm7BMAPuR4eurye88UGsf0f2NbWhCbmGEA=;
        b=MIus+nplDxpSNK/ib6qq1BFF0mBzL5WUhur4Trk6OuhGZTDRlU6NV3fX761lL6KOdW
         OHbDuih1CR/M0b6tgdDv8Ki1Ds4MxSD8dmKvekgtTeJCbooIiCa1EKdempyucvxAZDPx
         TJaQ7soqXcLN2otM0RsTmWOxFWyBSUWGELo3rYQkcNeOjpAT1sq6BSRq70E8FCyIVlS6
         gWQAhHw9q068i5H0suJ5IBWBKj2a8gGLawBMXOZb6Gtf70ChGDPAudI0GTxg11kL42k4
         X5zbe+4JKgSIKlowx7R3aB1k0fE4yDhRk/B5EHtRwBN/hu2Jp26Rbu/GhNpPAZp81uJv
         KLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HACSLRAJTlm7BMAPuR4eurye88UGsf0f2NbWhCbmGEA=;
        b=JWpepF2+EO6kDmwueB2IG3deSbcfmwoqgw9E5pEXYt0Nw+aSLP0wTyLoyxSPEhlCUr
         F2YWyYn4cgxRvCNtU2Loc6SxG72JXtx4YFiOFOHnkYDAERrMCLf2v1oVk+U+y7XBiHGf
         xIo9HPVD64dOfitOTZwK3MSu6z0K0hZxKJbszioQ0d1S5ReBcly7KtvGin6KtYRzf+Qw
         yqv4SzROQo+K7/lF3KKKGHzu2JSX+gDNehDc03xbGWj22o51pb+t0ZpnHAvoL03ZqIQK
         qtDRhyqWF6GpWBwXps7vaV5NWVIzQT2OtpK035Y5f2fwuIbMSNR5GJ1NUfk5+j2aJelq
         dD3A==
X-Gm-Message-State: AOAM532NX2sqVYfXsoF/SVyWgzAjlRzIi+P6yQJ+BwZtUoFLMmkrpu37
        sbAjqWJMPu3JyvQ2pwkkbAUehQ==
X-Google-Smtp-Source: ABdhPJxg1niv4tD6fSTzrRnGAjE2soBYkgvk6apaxB6/S8kfoBwjYBpdeDLXWHZ4yyxduLuNX2frag==
X-Received: by 2002:a05:6512:3443:: with SMTP id j3mr3354095lfr.120.1642799184804;
        Fri, 21 Jan 2022 13:06:24 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10sm279125ljk.44.2022.01.21.13.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:06:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v5 5/6] drm/msm/dpu: fix error handling in dpu_rm_init
Date:   Sat, 22 Jan 2022 00:06:17 +0300
Message-Id: <20220121210618.3482550-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Moreover none of dpu_hw_*_init() functions can return NULL.
So, replace all dpu_rm_init()'s IS_ERR_OR_NULL() calls with IS_ERR().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 96554e962e38..7497538adae1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -109,7 +109,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 		hw = dpu_hw_lm_init(lm->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed lm object creation: err %d\n", rc);
 			goto fail;
@@ -126,7 +126,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 		hw = dpu_hw_merge_3d_init(merge_3d->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed merge_3d object creation: err %d\n",
 				rc);
@@ -144,7 +144,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 		hw = dpu_hw_pingpong_init(pp->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed pingpong object creation: err %d\n",
 				rc);
@@ -168,7 +168,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 		hw = dpu_hw_intf_init(intf->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed intf object creation: err %d\n", rc);
 			goto fail;
@@ -185,7 +185,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 		hw = dpu_hw_ctl_init(ctl->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed ctl object creation: err %d\n", rc);
 			goto fail;
@@ -202,7 +202,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			continue;
 		}
 		hw = dpu_hw_dspp_init(dspp->id, mmio, cat);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed dspp object creation: err %d\n", rc);
 			goto fail;
-- 
2.34.1

