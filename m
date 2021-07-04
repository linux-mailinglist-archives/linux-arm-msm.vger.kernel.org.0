Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1493BB072
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 01:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhGDXIa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 19:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231130AbhGDXII (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 19:08:08 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6DDC061762
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 16:05:22 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id v14so3524209lfb.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 16:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kGQc2sDPy1RlhcacoqvnsQtk1TCEx3OXB0l57sVHH4Q=;
        b=GLX1EdopSbQ4ot9cf5NvEcT0RVW1jhZK/SCwFSbQhgSqGkYh0a0SrMmHK9a+mZGqlG
         y/o4b6E35sLe+kkRc06k+61cfUqRe4iDqCMXefLhIZVJPT8rpMSygRK+0xwmoqgENoAn
         MJAFYqWw6/O+w9QbMY6D5WOvxqAftl0qS1LK3Zruk+osNqqIhGjeTBoCqPRqZKtWhkh8
         Q08Lda+Ld+vcl9sLS2iJwBrsgBn75YYz5CPb8MrMzmPc80uEHFGUeeUFmgNKIg7dJ/Ft
         I5Qg8mRK3DnsQsKBMKhm0hgQouds3DgaCWpZwk4jGNAQ4vAOBSJ5Kwc15LiKMR9mPrUw
         dFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kGQc2sDPy1RlhcacoqvnsQtk1TCEx3OXB0l57sVHH4Q=;
        b=QqAASfyjRf1gl4h+I/IbT2WISRBnEQDyJaM17qzoZA0CUo3FyK4ulMxIq0Jgl5NkiL
         MrYaxE88zt1thqlv2Fg+/T7oyVLO0Ll2C34G3EsvP81E3fLQoW/iojiFYy4gx6NWGT68
         0R+J0TfmDBIL31umX/GRmkqxR8s7196I3Ekph6YN7Cua07a8gjS52egGByfqFLHCUHnw
         0XaBWEbhEb+1ZNgbhRlmZrTthX0nU5C5Ic2GLwIIZSijuxBWOGr2A9Sw20S9Q4I8g9Z1
         vVXSxbcf0iS2vEV3VHbSRg8PbIAwrJRydNEzzrUQjPPrtbEIO6Ayzm4f6TO8iagMobgg
         XD9g==
X-Gm-Message-State: AOAM530uo6dgfcxduN3sUSSKUGnbMS5h2PnMleHWqLuE0FofJw3hxePZ
        9S6UYlf4FCA2ZAHX1kjrkN6LLA==
X-Google-Smtp-Source: ABdhPJybpDYuNzRv2N9KUxmLO5VGHYaAHkmmewK62Od5eXqWP8hwGiE4/L8Ti4rlLpgKiiPeM3B9yw==
X-Received: by 2002:a19:408e:: with SMTP id n136mr7834867lfa.412.1625439921033;
        Sun, 04 Jul 2021 16:05:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s19sm1181859ljj.86.2021.07.04.16.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 16:05:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: make dpu_hw_ctl_clear_all_blendstages clear necessary LMs
Date:   Mon,  5 Jul 2021 02:05:19 +0300
Message-Id: <20210704230519.4081467-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dpu_hw_ctl_clear_all_blendstages() clears settings for the few first LMs
instead of mixers actually used for the CTL. Change it to clear
necessary data, using provided mixer ids.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index f8a74f6cdc4c..64740ddb983e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -345,10 +345,12 @@ static void dpu_hw_ctl_clear_all_blendstages(struct dpu_hw_ctl *ctx)
 	int i;
 
 	for (i = 0; i < ctx->mixer_count; i++) {
-		DPU_REG_WRITE(c, CTL_LAYER(LM_0 + i), 0);
-		DPU_REG_WRITE(c, CTL_LAYER_EXT(LM_0 + i), 0);
-		DPU_REG_WRITE(c, CTL_LAYER_EXT2(LM_0 + i), 0);
-		DPU_REG_WRITE(c, CTL_LAYER_EXT3(LM_0 + i), 0);
+		enum dpu_lm mixer_id = ctx->mixer_hw_caps[i].id;
+
+		DPU_REG_WRITE(c, CTL_LAYER(mixer_id), 0);
+		DPU_REG_WRITE(c, CTL_LAYER_EXT(mixer_id), 0);
+		DPU_REG_WRITE(c, CTL_LAYER_EXT2(mixer_id), 0);
+		DPU_REG_WRITE(c, CTL_LAYER_EXT3(mixer_id), 0);
 	}
 
 	DPU_REG_WRITE(c, CTL_FETCH_PIPE_ACTIVE, 0);
-- 
2.30.2

