Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B041D515C56
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 12:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237975AbiD3Kvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 06:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237909AbiD3Kvo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 06:51:44 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09F09549A
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 03:48:22 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id j4so17977584lfh.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 03:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jWp20FUjFEijENLW1jgAj2gw68XIVADTXOMKS9xgjoY=;
        b=cgzQY8Q64Q67uW86YHlg0bfLxKzVbDGY698MRQjXg3sdZdn3FlVzRJkurCkWNjwdBq
         Nw/KO7x04JZrsZO6o1w1Okb+L+HeOY40QrjtOyPSGdqhKmryE1GzTjQaSyLmsIPvwRSz
         IC31O9JdbC6Cn3bNbEFXmz/Fq0wwj0L9x25etBCvDqakuLNXRotON+r4LoW5Zkp2BwZt
         hWbZeG0wB70kYxqxBGXkgDoVGevxAOQ67z+3/5aEQzvhV/zSYV1r7M+3olb4Ku1yfKgt
         R/zLZPaEs41qOZXvOF5npwUJBlYtwnXDTs7XugUdUT+ZrMeywW+hp+8uPg0/dhHP/zJ3
         ClZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jWp20FUjFEijENLW1jgAj2gw68XIVADTXOMKS9xgjoY=;
        b=L5IDvAyBfJt/PR19rKI9xZ1BLP3lWG74Wk349d3hoi5TtYz0hXAHsKcoGqxmV96xzs
         l8FI64/Nw/q0QBbsnIHo13Qq90zxU6ksy/ExqLwT5gJJMlFQSu5asCMmvdGYAttotPPV
         6y8AdnWw88/HcqGfjPjAZdg33mVtx5nZv66rnGcIcORH7hF/k27bPtYMOvCRXubYS7yG
         /16vodg6Hore4igaN2yTLwUmTw9rh+xjY+MMQ7d+ZfQndQmIh/JZroKQWYIWUVK8rXEX
         uxPFD5hWseD+RIra0y8TH2Fdbq/p9pSx3xsbukNIYmA/hRCfzfNfO6n6TrzzxMKLsBeF
         ZQ4w==
X-Gm-Message-State: AOAM533HIWutg/ItGd8uqjTF56da0JMBoQwoSnXDeGcCdnO3zmnyTZ3O
        2ikTIIjqJoQdgpnV61Bjbwc/Lw==
X-Google-Smtp-Source: ABdhPJw+A9ODuR0yLPkkt2fiEjJKwxD3Hn49sKAuSccnhcMm14Xdy0Pi8D800lFTTOxQGh1mjIs0jQ==
X-Received: by 2002:a05:6512:b9d:b0:472:687:50ca with SMTP id b29-20020a0565120b9d00b00472068750camr2638797lfv.466.1651315701200;
        Sat, 30 Apr 2022 03:48:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z13-20020a2e8e8d000000b0024f3d1daeeasm510841ljk.114.2022.04.30.03.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 03:48:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/msm: add missing include to msm_drv.c
Date:   Sat, 30 Apr 2022 13:48:20 +0300
Message-Id: <20220430104820.3782290-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add explicit include of drm_bridge.h to the msm_drm.c to fix the
following warning:

drivers/gpu/drm/msm/msm_drv.c:236:17: error: implicit declaration of function 'drm_bridge_remove'; did you mean 'drm_bridge_detach'? [-Werror=implicit-function-declaration]

Fixes: d28ea556267c ("drm/msm: properly add and remove internal bridges")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4f3dce334553..4a3dda23e3e0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -11,6 +11,7 @@
 #include <linux/uaccess.h>
 #include <uapi/linux/sched/types.h>
 
+#include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
-- 
2.35.1

