Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93C0B485C18
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 00:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245323AbiAEXKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 18:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245310AbiAEXKk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 18:10:40 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E00A2C061201
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 15:10:39 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id x6so1220171lfa.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 15:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XphhH0V3XTsT3U3EruqPNJqssblwVHA/YCk1rgg6+kI=;
        b=P1eTDHjLnqM5lseoBVT4PPTWkXwgAyiUZtzsqEkORJ8AJLpT8YqzHWdBw7RtlJOqiU
         ifMMxwmGR7NyEZ9zkLarwErkVVsFQEUaqWTrod7uGMi8ucIXNcWc8KYDE6eB/yuINRbx
         aUQWQDvZ7JK/vzYMiUaELFjXYfiqAmCrZUpb1YM5irYayZ7xv2oumlP/oWGm/QGB4OV7
         b0OwBZQr2tvpm640zbo2pJBIKC4knUPS+pm9qPOqRnDGA8J8Bmg5Mq9e86sDaUXzokJK
         GBju6q5Hs0NFrk0VqMUsQaknt212JZjP7kxeJxR6zNK8K6Mj4KvteI/O975c/p7w4Oee
         KXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XphhH0V3XTsT3U3EruqPNJqssblwVHA/YCk1rgg6+kI=;
        b=51m9g6ic1+Q3wONuDjxM2IH3GBxoez0RPEMGURlNVBFnMJiPFKU6mm56Sl31WJ59AQ
         Y9mHWJbKIJKv14iM3Q5b+WQaC2j1VR9FBl9RDym6hPwXOZWZ5/IMc4xbk2wgJzBNhdVX
         Iw8jkBdX0Fph8/JFaGj1X5DMf+q0lG8cJWfq8Nh7hdLA6tK5ZnoVkpAvKmBX90bGhs9C
         HbZKhI/+vWnaUrPGX926UmA+6K8gqtfWmq9zY7pT+cWVqTw4JgAWVHxH1nWdtXB9YUc5
         lVAUbq3CuFcSrx96xMoJGDh1SH+e1wWkHWGBaLjlSSA2P8fTFWdl1vsUVzW7Sh629bwy
         QXCA==
X-Gm-Message-State: AOAM530gcoi2lMJhEIStbEND1Yv5Lhboektftju6ZHS162yRibeuz0p+
        qXLwqWMudLlRwB4LJ4l9F9SEkPChyxAwPg==
X-Google-Smtp-Source: ABdhPJwiAQ2aUsDUWqoUINZXM1TN91GYJCt3dR3cLRiUYlG4IuDq9awuMNGw+yiBFFCvgN6jp0Ye/Q==
X-Received: by 2002:a05:6512:3d8c:: with SMTP id k12mr2966070lfv.461.1641424238191;
        Wed, 05 Jan 2022 15:10:38 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a13sm27187lff.104.2022.01.05.15.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 15:10:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 4/5] drm/msm/dpu: stop embedding dpu_hw_blk into dpu_hw_intf
Date:   Thu,  6 Jan 2022 02:10:30 +0300
Message-Id: <20220105231031.436020-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now as dpu_hw_intf is not hanled by dpu_rm_get_assigned_resources, there
is no point in embedding the (empty) struct dpu_hw_blk into dpu_hw_intf
(and using typecasts between dpu_hw_blk and dpu_hw_intf). Drop it and
use dpu_hw_intf directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 11 -----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 17 ++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  9 ++++++---
 3 files changed, 10 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 3568be80dab5..230d122fa43b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -78,7 +78,6 @@ struct dpu_hw_intf_ops {
 };
 
 struct dpu_hw_intf {
-	struct dpu_hw_blk base;
 	struct dpu_hw_blk_reg_map hw;
 
 	/* intf */
@@ -90,16 +89,6 @@ struct dpu_hw_intf {
 	struct dpu_hw_intf_ops ops;
 };
 
-/**
- * to_dpu_hw_intf - convert base object dpu_hw_base to container
- * @hw: Pointer to base hardware block
- * return: Pointer to hardware block container
- */
-static inline struct dpu_hw_intf *to_dpu_hw_intf(struct dpu_hw_blk *hw)
-{
-	return container_of(hw, struct dpu_hw_intf, base);
-}
-
 /**
  * dpu_hw_intf_init(): Initializes the intf driver for the passed
  * interface idx.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 8df21a46308e..bf4d72356a12 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -74,13 +74,9 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 			dpu_hw_ctl_destroy(hw);
 		}
 	}
-	for (i = 0; i < ARRAY_SIZE(rm->intf_blks); i++) {
-		struct dpu_hw_intf *hw;
-
-		if (rm->intf_blks[i]) {
-			hw = to_dpu_hw_intf(rm->intf_blks[i]);
-			dpu_hw_intf_destroy(hw);
-		}
+	for (i = 0; i < ARRAY_SIZE(rm->hw_intf); i++) {
+		if (rm->hw_intf[i])
+			dpu_hw_intf_destroy(rm->hw_intf[i]);
 	}
 
 	return 0;
@@ -179,7 +175,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			DPU_ERROR("failed intf object creation: err %d\n", rc);
 			goto fail;
 		}
-		rm->intf_blks[intf->id - INTF_0] = &hw->base;
+		rm->hw_intf[intf->id - INTF_0] = hw;
 	}
 
 	for (i = 0; i < cat->ctl_count; i++) {
@@ -593,8 +589,3 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	return num_blks;
 }
-
-struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_intf intf_idx)
-{
-	return to_dpu_hw_intf(rm->intf_blks[intf_idx - INTF_0]);
-}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index ee50f6651b6e..9b13200a050a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -18,14 +18,14 @@ struct dpu_global_state;
  * @pingpong_blks: array of pingpong hardware resources
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
- * @intf_blks: array of intf hardware resources
+ * @hw_intf: array of intf hardware resources
  * @dspp_blks: array of dspp hardware resources
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
-	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
+	struct dpu_hw_intf *hw_intf[INTF_MAX - INTF_0];
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
 };
@@ -90,7 +90,10 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
  * @rm: DPU Resource Manager handle
  * @intf_idx: INTF's index
  */
-struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_intf intf_idx);
+static inline struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_intf intf_idx)
+{
+	return rm->hw_intf[intf_idx - INTF_0];
+}
 
 #endif /* __DPU_RM_H__ */
 
-- 
2.34.1

