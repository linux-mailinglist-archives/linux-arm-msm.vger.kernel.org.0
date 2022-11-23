Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD79636BE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 22:04:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237928AbiKWVE3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 16:04:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237042AbiKWVER (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 16:04:17 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE539824F
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:04:11 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id z24so22758340ljn.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BL3dVpq4lInuNIJjCsSuR/7YS0AX1mCMhw4iqXJEL4=;
        b=Pii11tTJEWXqdPtDtZmrubLFVnpOkE5p5lqN5IVEykTUegm9WmZhWA3fqLoMUvenbT
         eLobFUp8evmILhKxD1UaNfBjsxWy8XxPvucHiK+ot4fSFsot6/FPSt54LQInzoB7dER8
         1DO4uYRmg6S0zh5mmFgaLRqGfCY04ouSjVrGFUYq0BHrw7Anr/AM43RQJTFSSvre37oF
         6AT6vxLCq/66BqUFqClkuBSwAMH8U3U1a1eTZaBwkzTQcTNKQnhmFLLLLi5eehGVbNMH
         q+Ebcc/fgXQd2CI3Bqf1GxOBMdnRT+KKrunFDaZH5UtFyYMdP4np0e5Z/ZXhduVnW9ML
         27HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8BL3dVpq4lInuNIJjCsSuR/7YS0AX1mCMhw4iqXJEL4=;
        b=61vQktOHXvW1o8bG6HswHdCkRCeS1SOOw9KS1my+2ed0dBUtFAQ1sGNNxLwXBRmSZ/
         +ls+KpZo/FbUkDz3NPr3zrWknX6LSwiwFYPuvVYbC15w/PoiB7oVI1Ja1ZSIcM+RiEjt
         CwPj3Pm8TADpm0AgED/6+qYDGSSYESdV0z1N94nllvfh113gmGfb4bI1Y89EZTIaQ10v
         wDau3o9f9TZk3ETGLaRdj3m6ftyCV4Zr2d+COuItpIAbXZAEGpcM/2XDhm8pDqNpEaJj
         UQNA0/j/fjjZ3W6BllTPcrmibhyTsFyJUnqQQg0RH1pL1JRqMSx8s78uww0N65iAm9jv
         s1vQ==
X-Gm-Message-State: ANoB5pkt+Ajp92dd2ISMbriv/5IIFD/97SwNwkHa8+NTB05lmprSdaCY
        t+hukZ8Q20cEXlKxZZtIidLtOA==
X-Google-Smtp-Source: AA0mqf7OHJ55sOzx13XCGgisDIl9E4avBxDZGbPFWdgpeCuwNJQmQB+9qxJNqPxCFK3/69FNUm3vmQ==
X-Received: by 2002:a05:651c:32b:b0:277:8d3:4298 with SMTP id b11-20020a05651c032b00b0027708d34298mr8811264ljp.302.1669237451083;
        Wed, 23 Nov 2022 13:04:11 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b004b177293a8dsm3009913lfc.210.2022.11.23.13.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 13:04:10 -0800 (PST)
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
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v5 08/10] drm/msm/dpu: add support for MDP_TOP blackhole
Date:   Wed, 23 Nov 2022 23:04:01 +0200
Message-Id: <20221123210403.3593366-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
References: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 38aa38ab1568..8da4c5ba6dc3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -82,6 +82,8 @@ enum {
  * @DPU_MDP_UBWC_1_0,      This chipsets supports Universal Bandwidth
  *                         compression initial revision
  * @DPU_MDP_UBWC_1_5,      Universal Bandwidth compression version 1.5
+ * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
+ *			   in a failure
  * @DPU_MDP_MAX            Maximum value
 
  */
@@ -92,6 +94,7 @@ enum {
 	DPU_MDP_UBWC_1_0,
 	DPU_MDP_UBWC_1_5,
 	DPU_MDP_AUDIO_SELECT,
+	DPU_MDP_PERIPH_0_REMOVED,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index f3660cd14f4f..4ac14de55139 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
 				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
 
-	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
-			dpu_kms->mmio + cat->mdp[0].base, "top");
+	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
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

