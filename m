Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA77617188
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Nov 2022 00:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbiKBXNW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 19:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbiKBXNS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 19:13:18 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC86DED9
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 16:13:17 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id d25so170140lfb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 16:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c55txKhE8RFQaKFPB1LANvhtQdHp4s4KlPHFEvihAOs=;
        b=JjgQyTbrvfrA0k4TOfGyJm2Bt9+7jLRS981xSiM0unzDPwxCu3uvZhVKwXJUdxuHW3
         e4i9T6Ldpo5wCpNtLL3nXEPuw/u5BIidnhk5C8/cmAii4ZN0wKUoIMn4M/e/OI3BfhbJ
         Ce0IkxtGUUr0jpkea8vHFKKZwUQDJPM+oPnOupN6SmqjJASahUPBk4B0dgboK97TNKrZ
         liD82dmwCYksbpxVU0QUZOWrn3O21a4wiJFqNMt2APQBwgBdNmH7FGZ8f8OlKuSSR/O8
         CcXvs5duxWXoPCrCB5n/FqZz7dqc09Tt/M0OhfgVJNEWuPWpzBjFrGsiqNpMBgnz08Ke
         g1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c55txKhE8RFQaKFPB1LANvhtQdHp4s4KlPHFEvihAOs=;
        b=5OBjGpKVcEyy2dlUopHVKtSYfdm4lbFyEzaXkNCJ6/31qTmr5oKI44E2/Kj6/D1moS
         nfwdAR/uJF3DAV7NkW70+hxnvkv4rOmqgoJOeRcmoNHL/8dnmyu26/WJCB6/k3WFNH3T
         C9NAQkz8SrlVSzNr2axC+6IriDbadywwnnKPVLMF2iot/KzR1uDa8cgtS/sN+ivBFYFe
         dwJZdBwlAkThpqyoQwNhKYNoP+xR+dacCgdd4fEdnjBZmXY1Yc/i6QphrxVTEuyxpOfO
         62yNYqb3dPVGnO5mbS7dwY4bzXAx8VgYA4OJYlm/7cVYl7UkmhbhN6cgosKETu0DRJD2
         R5Cg==
X-Gm-Message-State: ACrzQf1q1qwvhqsX6duEVn8+6ElN95fVT+kMg5MjVN0Yl/qezK5IlUVX
        VxOwqK7DIjWmLDt9xJkzg8t+3Q==
X-Google-Smtp-Source: AMsMyM6i8kH2PIK7323eH+pwjjpyWcRfkIoG7iuiAv+Uzo4hkPXJC1+aqzmz2hx5BpFsqt/p7M1Ekg==
X-Received: by 2002:a05:6512:3446:b0:4b0:69b0:ba15 with SMTP id j6-20020a056512344600b004b069b0ba15mr8900465lfr.184.1667430796785;
        Wed, 02 Nov 2022 16:13:16 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512114600b004b0a1e77cb6sm1636134lfg.139.2022.11.02.16.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 16:13:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 6/8] drm/msm/dpu: add support for MDP_TOP blackhole
Date:   Thu,  3 Nov 2022 02:13:07 +0300
Message-Id: <20221102231309.583587-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
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

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
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
index f3660cd14f4f..67f2e5288b3c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
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

