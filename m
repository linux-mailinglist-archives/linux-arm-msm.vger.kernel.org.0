Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C06D295F92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 15:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2899442AbgJVNRQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 09:17:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2899437AbgJVNRP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 09:17:15 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCF6C0613CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 06:17:14 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id b1so2201809lfp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 06:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c6sHmg150yqR1h8Bag52W9aV+m2EBknaw6fZR/BGv6Q=;
        b=dei5BSiIcn7nX0DE5vIPX4LkR73UUgIsJiID54aOzMSLlzaqx/oXn1q5Psg9L0/v60
         TyrHpOp4cI4caNH/52W6ozJC+39bsgXPh28jjOAqrEDbzzVFuFVVV2AFUVorR+SgbMJz
         BdTHNyLQaVHw0ko2BwHTSVPTTeNTp5uVCz8ifYvTpXB9UUbGPN4ayXQB94jCAY2EvFy7
         ha5ZDODcfk1V07oaCoaNn7zAYwItYwkbQfSyg2ThBtSgpcqpXgOm23xMTWtEiRRDbLUX
         vuxqFUSSSsuHMF0t+ldDpnrqwHvC3N9RzhG01LB0Avn+9M12TJrwAXqhjqJu6nH9d9f/
         0Cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c6sHmg150yqR1h8Bag52W9aV+m2EBknaw6fZR/BGv6Q=;
        b=UBx2BhxO71e6+O+twF8sjdJff0ZthcUItjrMms7miVGCskHvBPVdJnPakFIenbUIuE
         EucfQ/hmaVTM9hJqLCVgW1LMURElO3dn3Bd7ely8EddgM5odS5BVocxPggrbf19zfQdF
         NsqOXdq6ts3x/eciAHYy4ALK0f8864gV2S0zWdint02FkG3tjxFmh0m/YI3WLvVTpPlt
         HlH/r/3kdafBVIAq31dOYWoXf2aAKQPjPHR1IJuJY7v5kQGA0UuoS2KrRdNjfdVYgiVy
         9w+6MGSk/xzta5NZ82P0oGnKRWjeTMu0YYXIaaKHBNZgUgrqsIM02B/MyFaeGwZlm8zM
         WpEA==
X-Gm-Message-State: AOAM532y2PkzYrxMoCS9/lUztU5DqF6J3/EHzNFbMp3++6TFgnyEcDWH
        Darr3GcZ9uyBsgAFK1b6YrkpTg==
X-Google-Smtp-Source: ABdhPJwZNjwVsaunrNwWpeDjPWiTH0HB+wf7/x/CjEKCmxyyhQrranTSsWv8skXqeBGpQHDrNkoLow==
X-Received: by 2002:a19:4b81:: with SMTP id y123mr805003lfa.597.1603372632535;
        Thu, 22 Oct 2020 06:17:12 -0700 (PDT)
Received: from eriador.lan ([188.162.64.195])
        by smtp.gmail.com with ESMTPSA id j10sm308514ljb.93.2020.10.22.06.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2020 06:17:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/5] drm/msm/dpu: setup merge modes in merge_3d block
Date:   Thu, 22 Oct 2020 16:16:57 +0300
Message-Id: <20201022131658.181363-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022131658.181363-1-dmitry.baryshkov@linaro.org>
References: <20201022131658.181363-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Handle setting up merge mode in merge_3d hardware block.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 21 +++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    |  4 ++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
index 5c7ad19feea3..720813e5a8ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c
@@ -11,6 +11,9 @@
 #include "dpu_kms.h"
 #include "dpu_trace.h"
 
+#define MERGE_3D_MUX  0x000
+#define MERGE_3D_MODE 0x004
+
 static const struct dpu_merge_3d_cfg *_merge_3d_offset(enum dpu_merge_3d idx,
 		const struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -32,9 +35,27 @@ static const struct dpu_merge_3d_cfg *_merge_3d_offset(enum dpu_merge_3d idx,
 	return ERR_PTR(-EINVAL);
 }
 
+static void dpu_hw_merge_3d_setup_3d_mode(struct dpu_hw_merge_3d *merge_3d,
+			enum dpu_3d_blend_mode mode_3d)
+{
+	struct dpu_hw_blk_reg_map *c;
+	u32 data;
+
+
+	c = &merge_3d->hw;
+	if (mode_3d == BLEND_3D_NONE) {
+		DPU_REG_WRITE(c, MERGE_3D_MODE, 0);
+		DPU_REG_WRITE(c, MERGE_3D_MUX, 0);
+	} else {
+		data = BIT(0) | ((mode_3d - 1) << 1);
+		DPU_REG_WRITE(c, MERGE_3D_MODE, data);
+	}
+}
+
 static void _setup_merge_3d_ops(struct dpu_hw_merge_3d *c,
 				unsigned long features)
 {
+	c->ops.setup_3d_mode = dpu_hw_merge_3d_setup_3d_mode;
 };
 
 static struct dpu_hw_blk_ops dpu_hw_ops;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
index aaad7c90cfb0..870bdb14613e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h
@@ -16,8 +16,12 @@ struct dpu_hw_merge_3d;
  *
  * struct dpu_hw_merge_3d_ops : Interface to the merge_3d Hw driver functions
  *  Assumption is these functions will be called after clocks are enabled
+ *  @setup_3d_mode : enable 3D merge
  */
 struct dpu_hw_merge_3d_ops {
+	void (*setup_3d_mode)(struct dpu_hw_merge_3d *merge_3d,
+			enum dpu_3d_blend_mode mode_3d);
+
 };
 
 struct dpu_hw_merge_3d {
-- 
2.28.0

