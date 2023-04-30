Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 924FB6F2AAA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Apr 2023 22:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjD3UgE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 16:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjD3UgD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 16:36:03 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA4AC1
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:36:02 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2a8c28158e2so17758491fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682886960; x=1685478960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1z0wTDitZ+gnKwYBCCk5Nz8/vpEbM2i/0l3o9/Ite8Q=;
        b=bh7w9+OtR7liuWR6o0f8z2yxiERyBwCcEE+vuJVYz0tOzNmhnfR69BU7R4QI6zx2da
         A8vNAtr28uxKOBoTP+0CC6vbtnZMGmq9MYh9JL+tI2Rx68ZooO3/3KqEKZCz3+1YdB3X
         6Bb1nwsGgRgfEH4y+Ap517bc2WIMnCu8iVkSVrvifYWp7AW0da/Yrw1XPRuzORl70I8t
         1tHBgGMMTjnVpDFVx9+j66DvUPyBCgFwKW4ZEIP47SFBEQ2Sd5FvL6qSe+Hs/A8ibTyY
         x6wn4lmmBIFoNZaxxuOWgPZUqI5bpw2+AwJmWxhtf/XYsNgnb71SLUSfCp6qcvEamkhd
         qAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682886960; x=1685478960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1z0wTDitZ+gnKwYBCCk5Nz8/vpEbM2i/0l3o9/Ite8Q=;
        b=k5VI8lUCJY7Y2Rgu52vY71jN/f8Ns4E4FGu1LK5X4jAJZJFSsB1lIIIHH02JogmlpX
         QGLnErRf9zy34MkJfCt9tXIY/3Ly/5gdwpUp9Iccmn+8l8vnUGVmDtXNyTmPrerfWHZ+
         01V3dcsbEtl5t1zvS7AsQ4iNf0t+2cPi4FnKAEZgBGY9tXk3LAE151xLyPhMf5mCjS+Q
         Ht0emoF3nyEHZ44izuNGVtQBTH+JkYrwEB1rD0Bti/i4xxpWgfF07Lcdg2ytyvos/rv3
         3evg+AY989UvVbmlfmbmF4Tuo9/eOrC2WG2lM/B606JaLhdAf59SOxhjoVWlplWqAsMz
         3W9Q==
X-Gm-Message-State: AC+VfDzbL8+G2Q7zYArZANhFSnMASIx7jD3ZgAss/lGdiic4WDPxxedg
        TCBdcejKARGgew8jrGKOpZmHoQ==
X-Google-Smtp-Source: ACHHUZ61lTnTm2vJed0Hbx8L4qCVWHfDv5fhWb0j9H/0AMiX+fz8xaElCfmxlsdHh3Ooixn/ajvxpg==
X-Received: by 2002:a05:6512:11c1:b0:4e1:36a:eda5 with SMTP id h1-20020a05651211c100b004e1036aeda5mr3134672lfr.30.1682886960376;
        Sun, 30 Apr 2023 13:36:00 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b24-20020ac247f8000000b004edd4d1e55dsm4324634lfp.284.2023.04.30.13.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 13:35:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 3/4] drm/msm/dpu: use PINGPONG_NONE for LMs with no PP attached
Date:   Sun, 30 Apr 2023 23:35:55 +0300
Message-Id: <20230430203556.3184252-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
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

On msm8998/sdm845 some LM blocks do not have corresponding PINGPONG
block. Currently the driver uses PINGPONG_MAX for such cases. Switch
that to use PINGPONG_NONE instead, which is more logical.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h             | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                  | 2 +-
 4 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index bdcd554fc8a8..6ae30f806ebc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -104,9 +104,9 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_2, LM_5, 0),
 	LM_BLK("lm_3", LM_3, 0x47000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
+		&msm8998_lm_sblk, PINGPONG_NONE, 0, 0),
 	LM_BLK("lm_4", LM_4, 0x48000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
+		&msm8998_lm_sblk, PINGPONG_NONE, 0, 0),
 	LM_BLK("lm_5", LM_5, 0x49000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_3, LM_2, 0),
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index ceca741e93c9..4a94fd9b64a9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -102,9 +102,9 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
 	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
+		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
 	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
+		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
 	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 2d9192a6ce00..56826a92c155 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -191,7 +191,8 @@ enum dpu_dsc {
 };
 
 enum dpu_pingpong {
-	PINGPONG_0 = 1,
+	PINGPONG_NONE,
+	PINGPONG_0,
 	PINGPONG_1,
 	PINGPONG_2,
 	PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index d5a06628885e..bf7b8e7c45b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -117,7 +117,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_mixer *hw;
 		const struct dpu_lm_cfg *lm = &cat->mixer[i];
 
-		if (lm->pingpong == PINGPONG_MAX) {
+		if (lm->pingpong == PINGPONG_NONE) {
 			DPU_DEBUG("skip mixer %d without pingpong\n", lm->id);
 			continue;
 		}
-- 
2.39.2

