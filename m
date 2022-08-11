Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B891058F684
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 05:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233504AbiHKD6w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 23:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233994AbiHKD6v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 23:58:51 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5C1844E6
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 20:58:48 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-10ee900cce0so20264794fac.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 20:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=WoGxgm6hm2DcIMIJHu37sZN3LBlheWW2cglanaquIW0=;
        b=CweOhy/8ASwAhV9xEgqiRk5gtbe4elGrTFE2sPXLee7BUSqeI+vgu28VRF8TyhL5YP
         QHsJTKS61Y+FX8C+aAyjD8ToRqHSqpJYym2xA12RI8AviJmFG512m8md9WHBKYLTrHOz
         WV9u3CABSPBsjw2HHLxITozNaZdWzM0YFTD3J3cX1LYfm05d1WZct4wqvmvYF0xLtKv3
         Vy2gfYKp5Fhrxhf5ywEbzyxZKKk5qi3DR2iy+lGuQGRyie1IQ9nVRTdhX39Pxd42BeRW
         RWklli78pvsAUOY/Yw7x5KiCqInvzobURoGISurH9FammW/l6g3u7IMZFBmEB/Dq/NZt
         6zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=WoGxgm6hm2DcIMIJHu37sZN3LBlheWW2cglanaquIW0=;
        b=hIjht8reMzM1pr4pBHpNOGmMgbdbeRZqqyNHHD4tspWro2Ed0PxyVQfKIZeQYmH5RO
         jYYRx8o9P1OApwNiuBqoRkVOoU/bzz3ZIXF+swm+XeZnbRi+y/gC5CGKyPbe4fu2EGzc
         UXyAR4ekKE2iyzFORHCqeIflmZo6fZFJKyB+yLXWqi/OBvjpQTBbIDc2u5tYaIWQ2P3b
         nhcS8HyfIhqCWvHADPcilWnbXtxuZerg5mpX695amqT7RZidCxMsFurcZDaRXCua3Ehy
         H0u3E5vPBBEbY2RPDCucksik86rJXeJpMH0KoCwzUgNEZV/giCQRYubjTHfxMzW+mwfQ
         6ASg==
X-Gm-Message-State: ACgBeo3Bc9jQ08SQHmgZwuYRmjtt/+HevKieWhthrmqNJ2uZBawIN3W7
        VcbZHXFZof5dqpEzk8STDV2v9w==
X-Google-Smtp-Source: AA6agR4BVzYmJfl+Hk8fitZmA3UojbgYxnrzYUgkQRHIbC6+ILapSjcFMHkSG/CeGqoomENm/h0R6Q==
X-Received: by 2002:a05:6870:9613:b0:10d:cc11:62ec with SMTP id d19-20020a056870961300b0010dcc1162ecmr2878413oaq.9.1660190327551;
        Wed, 10 Aug 2022 20:58:47 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w22-20020a056808141600b00338869042fdsm891443oiv.32.2022.08.10.20.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 20:58:47 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/msm/dpu: add support for MDP_TOP blackhole
Date:   Wed, 10 Aug 2022 21:01:20 -0700
Message-Id: <20220811040121.3775613-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811040121.3775613-1-bjorn.andersson@linaro.org>
References: <20220811040121.3775613-1-bjorn.andersson@linaro.org>
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On sm8450 a register block was removed from MDP TOP. Accessing it during
snapshotting results in NoC errors / immediate reboot. Skip accessing
these registers during snapshot.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 71fe4c505f5b..daf76ea908de 100644
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
index 008e1420e6e5..49e7aeebdedc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -946,8 +946,15 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
 				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
 
-	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
-			dpu_kms->mmio + cat->mdp[0].base, "top");
+	if (top->caps->features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
+		msm_disp_snapshot_add_block(disp_state, 0x380,
+					    dpu_kms->mmio + cat->mdp[0].base, "top");
+		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 0x3a8,
+					    dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
+	} else {
+		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
+					    dpu_kms->mmio + cat->mdp[0].base, "top");
+	}
 
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
-- 
2.35.1

