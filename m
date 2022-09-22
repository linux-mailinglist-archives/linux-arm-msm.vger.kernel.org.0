Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4EC45E6113
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 13:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbiIVLae (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 07:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbiIVLaa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 07:30:30 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5BC9D8E15
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:30:27 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id s6so14148225lfo.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 04:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=583h6KF71HUgEtsvHt8C5CKBAKwnaZE+xGmKl57ijJU=;
        b=E8GoP/tqY9uLEMc+tulq9xPDQzcwCP/+S+MWgvUhZAnhqeQImOfBvEHy2q1TEonW8o
         FqPgyAgR+wuOOiVLKTgokDZKt5Vym/eB9MduxCahabbIqlG4+AgITrgrtQ9hD6rAGYPu
         356/O6rCQt0sdStYuOgcv0pZDC+KtfFnS6gelhcBQ6t4+mJyiagvN3z+rK2gBXAYdukl
         4+MiOZZLjqOMhJLSXQ2ZHKqe7OA0rfPow/gljAmt7OdZxs+9K2YXKkgBODuAPECTokOS
         GyQ7cPHFyPLGGgVyJjWhbwFV5Ibd5FnokeLYBJGBDn4wU62xsCVxs5Q1nXxyGKpUjxd5
         B4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=583h6KF71HUgEtsvHt8C5CKBAKwnaZE+xGmKl57ijJU=;
        b=WFkeURYl/4hRG39eeHpMEiBpKKTJnelahcDGp69ByCCrlDifnJ5NA8xyY9WoMQ6YPN
         1Ge8EJfIpA9NmRISFtrpMoQZQyk3uuFGDioO0uj32DAsxdxt9t7kTkNtieqSG+Q6BvPx
         5VDxFc2m1xwEnpW1D74FLQgeNqENSCreQ4HadrhWoS8kQJURMXUtZ4GqUCaZ2kAhVzAu
         8LiDnFzflzVaLwCK3juWsbJyrozYBkkalp+kVk06cGkrZ2QGFVTY2d8TWMopFWGJfcLz
         oDEdRsLsbHtm8nYlyB72Te765iQeza7OFP4m3Qaf56Tl4SzWUtWNo/qjSHxj2zYvYxCP
         gEHg==
X-Gm-Message-State: ACrzQf2aXr5EKFeVrN4w2UzvniV+6VQMB1081wmei6C+3uMvwHYyQp73
        JAXyKJNWwV1slsMefNeSD6KINQ==
X-Google-Smtp-Source: AMsMyM7/FvoCj8lHHs9X09maj/umN/CcXQani3boBysW4Q3s/DFvafrWo+nlKexuhyzWwblDO14kIQ==
X-Received: by 2002:a05:6512:150a:b0:49f:1b3d:889f with SMTP id bq10-20020a056512150a00b0049f1b3d889fmr1131655lfb.75.1663846221338;
        Thu, 22 Sep 2022 04:30:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c4-20020ac25304000000b004996fbfd75esm898527lfh.71.2022.09.22.04.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 04:30:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 3/5] drm/msm/dpu: add support for MDP_TOP blackhole
Date:   Thu, 22 Sep 2022 14:30:14 +0300
Message-Id: <20220922113016.355188-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
References: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
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

On sm8450 a register block was removed from MDP TOP. Accessing it during
snapshotting results in NoC errors / immediate reboot. Skip accessing
these registers during snapshot.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 38aa38ab1568..4730f8268f2a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -92,6 +92,7 @@ enum {
 	DPU_MDP_UBWC_1_0,
 	DPU_MDP_UBWC_1_5,
 	DPU_MDP_AUDIO_SELECT,
+	DPU_MDP_PERIPH_0_REMOVED,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5e6e2626151e..b0bb693c10ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -939,8 +939,15 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
 				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
 
-	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
-			dpu_kms->mmio + cat->mdp[0].base, "top");
+	if (top->caps->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
+		msm_disp_snapshot_add_block(disp_state, 0x380,
+				dpu_kms->mmio + cat->mdp[0].base, "top");
+		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 0x3a8,
+				dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
+	} else {
+		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
+				dpu_kms->mmio + cat->mdp[0].base, "top");
+	}
 
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
-- 
2.35.1

