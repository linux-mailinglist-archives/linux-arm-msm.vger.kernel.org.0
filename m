Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDD26496706
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jan 2022 22:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229817AbiAUVG2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jan 2022 16:06:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232237AbiAUVG0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jan 2022 16:06:26 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ECCDC06173B
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jan 2022 13:06:25 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id t14so1944555ljh.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jan 2022 13:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9AFRMJgK0nyYghOSw9TsyUQaZPsdSU3tPBxO//doHq4=;
        b=FQVMsEwk2YwnuGl9qO+PZ2V0crB4qZTzeWwZAlL7rLcKup8R9rQyvln72xvCDmvsnV
         iYJLG2XVeSkv5DwkGv0//Gs/kB4ma0QZyYmZ3QRQZE6rZC9lI7BQG1sztCyJXKOspmZ0
         jLquS6HtqFgDRVMk4HoFO4qtQ1Sjzt99mSktXQviPbcSmSOt2E75dx9Vf/H35RC+oruh
         f3+qKZG69wmufrr1gg8IavXIsvfDK56IbJc5MTFlBmqYsDCXl5jzjEXkzjZ/U1ECZdwV
         52u9mzrQMQjpn96bdZsGrrrBNARS6FAljdgVQ2fIbgGW+7tDesSQWP+ijpaUh0A6hOpn
         UVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9AFRMJgK0nyYghOSw9TsyUQaZPsdSU3tPBxO//doHq4=;
        b=pyjSvJZr4mkSz48vuYQL2CPgJiQ4+jsdG1szY1BwMsj2tEb1n2ddcG7tVnssBOYjnF
         A/N1kuTx69w7BHGbOsEYGrfG7hBqNL5MGjpTr0jY3d+wBaeuv/fD4tgCikEDyguxpB2f
         H3rLNpgFVsFScuElule2xYF2JFn4TQ8d0DEYhdaPq1WiFEIba8kUH35dUerZUUnxLOJo
         BC2NOF/jWGp8TI9pHejgXFrCHqRj0wrKq92b727hxjKid5xMBmD2wFW2qarhIbj8t0bh
         Urt6RPOfH7yerPzVnnuGg3MIkWzdv9uUx4i/0FrpN0zXej+kpRzWKlzm238aS+R9M7FV
         OkzA==
X-Gm-Message-State: AOAM532RFjigUNJV/9E52dYzVfmJohrr3xr9geIIePQYIV0M2zqlnYxJ
        qgF2GGgqWwYA5PWYp1fYelIqBg==
X-Google-Smtp-Source: ABdhPJxD+lD2OCevw7/8RPqaUcYSl2oi+CfkryQ7ncpqbSrzGvysbBwfP8gmQ8Kcs8l3XgqChkTZZA==
X-Received: by 2002:a2e:8e79:: with SMTP id t25mr4507753ljk.186.1642799183849;
        Fri, 21 Jan 2022 13:06:23 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10sm279125ljk.44.2022.01.21.13.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:06:23 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v5 4/6] drm/msm/dpu: stop embedding dpu_hw_blk into dpu_hw_intf
Date:   Sat, 22 Jan 2022 00:06:16 +0300
Message-Id: <20220121210618.3482550-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 11 -----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 17 +++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  9 ++++++---
 3 files changed, 9 insertions(+), 28 deletions(-)

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
index 8df21a46308e..96554e962e38 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -74,14 +74,8 @@ int dpu_rm_destroy(struct dpu_rm *rm)
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
-	}
+	for (i = 0; i < ARRAY_SIZE(rm->hw_intf); i++)
+		dpu_hw_intf_destroy(rm->hw_intf[i]);
 
 	return 0;
 }
@@ -179,7 +173,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 			DPU_ERROR("failed intf object creation: err %d\n", rc);
 			goto fail;
 		}
-		rm->intf_blks[intf->id - INTF_0] = &hw->base;
+		rm->hw_intf[intf->id - INTF_0] = hw;
 	}
 
 	for (i = 0; i < cat->ctl_count; i++) {
@@ -593,8 +587,3 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
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

