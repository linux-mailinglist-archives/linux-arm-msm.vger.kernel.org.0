Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CF0270AF33
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 19:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbjEURNt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 13:13:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbjEURKs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 13:10:48 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F75E1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 10:10:32 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f3b9c88af8so1179899e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 10:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684689031; x=1687281031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAIsFbOG0cWfqLFKEW28r27UV7QviA8Nux8MIb+QAb4=;
        b=xf8rbrv/gLJG33QMg02v3u3cFH+ZzzW30wjLc+i4sOhJSfw5gCfXPXBPYrU58t/JVI
         hsy6pgNEoa7tElz9QMir2neZe1wSZdKdRucW5aTsMVSz7yU742VBRyI5jjFL2mpIUfxz
         cE08NJ0JqicTKUOyq7UMsuf7uMTeITEaJVn5Ha1OHwd/A6cQD8dJbfpILrnZJFrJEv2q
         w/keiw4b8TI3GypTaq6wsY2GCIZS8T3v0540SzE7v647VW2gPw3uL7YMB8IYWvycyx6t
         rsmlYhcm81wzTQfPbyHkwdarnvW2J9M3zWYMSq2Ll6ffmyEWt9GE2uUXIHBxDnTVow+/
         /y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684689031; x=1687281031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAIsFbOG0cWfqLFKEW28r27UV7QviA8Nux8MIb+QAb4=;
        b=b2cqsA7iwusgT6mvLQOUIyhZ2aS0eN1F1ntXqFS2QxSNi8eYEDtzAgwOlBBEonHkKj
         NU2hNI+AreffCmTAlCN6uw3ao67jfNo6kzIXW9qZBWa261xdi7GuglOUQnKQV2l5WbqV
         bYiBt+4DJMHETxoWIb8/pMbFtVWkOv/ACIKADvhR/KPsi4NFrb8XaDBCcmSm0+d69+5N
         xvawaNFkmbzOfcQx6yeAHufRlulwln61xOnynbj+RQmcHC/uHsMzkRMiZZglk9kMufzV
         I3RPTqaK6My1SE3UvEssQNnU+R8oCf8oHWHwPS+TJbRhTpbLcEmIuU+a2nZaksfUJVkk
         M+Gg==
X-Gm-Message-State: AC+VfDwezNnin/yrDzdF5U3LIYTnVAoS5aTWMz48F3CBPk26cz4r6qPm
        g5imLUrniGmu862qmUtekeuClQ==
X-Google-Smtp-Source: ACHHUZ5VjMhUPjs6qeL+58pIgAAVNpavj0upmBx+2nawTbad1Sy8jW5RuhmiCbEW/M30+MDcGAU1uA==
X-Received: by 2002:a19:f60e:0:b0:4f3:baf9:8f93 with SMTP id x14-20020a19f60e000000b004f3baf98f93mr1031381lfe.3.1684689030888;
        Sun, 21 May 2023 10:10:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k19-20020ac24573000000b004f00189e1dasm680493lfm.143.2023.05.21.10.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 10:10:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 3/6] drm/msm/mdss: export UBWC data
Date:   Sun, 21 May 2023 20:10:23 +0300
Message-Id: <20230521171026.4159495-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

DPU programming requires knowledge of some of UBWC parameters. This
results in duplication of UBWC data between MDSS and DPU drivers. Export
the required data from MDSS driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 30 +++++++++++++-----------------
 drivers/gpu/drm/msm/msm_mdss.h | 27 +++++++++++++++++++++++++++
 2 files changed, 40 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.h

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index d1e57099b517..ed836c659688 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -13,7 +13,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
-#include "msm_drv.h"
+#include "msm_mdss.h"
 #include "msm_kms.h"
 
 #define HW_REV				0x0
@@ -26,16 +26,6 @@
 
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
-struct msm_mdss_data {
-	u32 ubwc_enc_version;
-	/* can be read from register 0x58 */
-	u32 ubwc_dec_version;
-	u32 ubwc_swizzle;
-	u32 ubwc_static;
-	u32 highest_bank_bit;
-	u32 macrotile_mode;
-};
-
 struct msm_mdss {
 	struct device *dev;
 
@@ -185,12 +175,6 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 	return 0;
 }
 
-#define UBWC_1_0 0x10000000
-#define UBWC_2_0 0x20000000
-#define UBWC_3_0 0x30000000
-#define UBWC_4_0 0x40000000
-#define UBWC_4_3 0x40030000
-
 static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
@@ -236,6 +220,18 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
+{
+	struct msm_mdss *mdss;
+
+	if (!dev)
+		return ERR_PTR(-EINVAL);
+
+	mdss = dev_get_drvdata(dev);
+
+	return mdss->mdss_data;
+}
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret;
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
new file mode 100644
index 000000000000..02bbab42adbc
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2018, The Linux Foundation
+ */
+
+#ifndef __MSM_MDSS_H__
+#define __MSM_MDSS_H__
+
+struct msm_mdss_data {
+	u32 ubwc_enc_version;
+	/* can be read from register 0x58 */
+	u32 ubwc_dec_version;
+	u32 ubwc_swizzle;
+	u32 ubwc_static;
+	u32 highest_bank_bit;
+	u32 macrotile_mode;
+};
+
+#define UBWC_1_0 0x10000000
+#define UBWC_2_0 0x20000000
+#define UBWC_3_0 0x30000000
+#define UBWC_4_0 0x40000000
+#define UBWC_4_3 0x40030000
+
+const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev);
+
+#endif /* __MSM_MDSS_H__ */
-- 
2.39.2

