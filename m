Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D88E76450F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 02:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiLGBWs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 20:22:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbiLGBWm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 20:22:42 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A00131EF4
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 17:22:40 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id j4so26450660lfk.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 17:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugUF9l2t8z9Udj87v9jUtc+vYXU/V4qZ3hVoTb3vXFk=;
        b=qa9/s3fRjTHjDxd8xY2qp66mq6K6M9lu4rUCkt/WSGAPO3+wJvZzX1TGDvKAt6Sh/B
         DC+0Szao2GPYqHqKuCEmHo28Pwy+7DBDI4tyk58A0o8criMcJ0FVw87hY4ko/muyW1E+
         nI4DS7+VcfxjyKKwRR/Pl6bml3q7/MfreOcy4bb+q7eMsmJyYEwAZtqp0hzPM45wDj45
         sl+HNEOHKhXn0M09ybZigF+xEpAyzxU9hWsR/imtud8Na+3yMTK1XDspKw0GLWTq2i1v
         IaYu3cqvTpsUfFraD2KodJf/Aqjfe1NIgphRYGn3v5tNkMdF29SIcVebNsOrykZ6XMY7
         bmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugUF9l2t8z9Udj87v9jUtc+vYXU/V4qZ3hVoTb3vXFk=;
        b=Aioead/P6MCE1v/MA9CiXkBGEFrt24Z6C8qkAz2AWlc5RyZGymvvLvRe2H1aXQz1xb
         0EBXuYo3oZf8/ZLigLGYRP65Wks+LYFWXLbNVnAqYzrs4Lt2q7Sw0Mt1o8S4Jpk10bic
         hNxUXhO4HGG1IBP2E4yx+NxV7XytVBDws9lU8PGLz6sSeyJxNes/0EPiZSfzDiVIkUnC
         EIu0n9k0CEeTGG8xqp+em+UPjyidz7SmeFR86fCzB6D83ezuv2n1OHoJcdwlJL0jM/9q
         vYLEdPC5tgDw4u2fuQ2okBI/j0pUuemICVjZ548fGP8mkiqC+NT4Ar0MJiGt7UVau2zD
         DZUA==
X-Gm-Message-State: ANoB5pkEa8kflpOexLeu5m2jaEYz3tXmmMgCq4b5mu5fb2QGGUwVUIrD
        1DM6BwoU+W1fU7yFHYTpJrOoOQ==
X-Google-Smtp-Source: AA0mqf7rVeppYVMDlGKK8EChbY6AMVk9HbvF3GpbeD7jnwQvfT8bQ3IqzcAUuOaSC3Pt848pDtWWKA==
X-Received: by 2002:a05:6512:340d:b0:497:456d:890 with SMTP id i13-20020a056512340d00b00497456d0890mr22839006lfr.687.1670376160058;
        Tue, 06 Dec 2022 17:22:40 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a11-20020ac25e6b000000b0048a9e899693sm2678916lfr.16.2022.12.06.17.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 17:22:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v6 09/11] drm/msm/dpu: add support for MDP_TOP blackhole
Date:   Wed,  7 Dec 2022 03:22:29 +0200
Message-Id: <20221207012231.112059-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h       |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 3b645d5aa9aa..a9d161daf786 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -83,6 +83,8 @@ enum {
  * @DPU_MDP_UBWC_1_0,      This chipsets supports Universal Bandwidth
  *                         compression initial revision
  * @DPU_MDP_UBWC_1_5,      Universal Bandwidth compression version 1.5
+ * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
+ *			   in a failure
  * @DPU_MDP_MAX            Maximum value
 
  */
@@ -93,6 +95,7 @@ enum {
 	DPU_MDP_UBWC_1_0,
 	DPU_MDP_UBWC_1_5,
 	DPU_MDP_AUDIO_SELECT,
+	DPU_MDP_PERIPH_0_REMOVED,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
index 86c423e63b61..feb9a729844a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h
@@ -63,4 +63,7 @@
 #define MDP_WD_TIMER_4_LOAD_VALUE       0x448
 #define DCE_SEL                         0x450
 
+#define MDP_PERIPH_TOP0			MDP_WD_TIMER_0_CTL
+#define MDP_PERIPH_TOP0_END		CLK_CTRL3
+
 #endif /*_DPU_HWIO_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index b71199511a52..987a74fb7fad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
 				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
 
-	msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
-			dpu_kms->mmio + cat->mdp[0].base, "top");
+	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
+		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
+				dpu_kms->mmio + cat->mdp[0].base, "top");
+		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - MDP_PERIPH_TOP0_END,
+				dpu_kms->mmio + cat->mdp[0].base + MDP_PERIPH_TOP0_END, "top_2");
+	} else {
+		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
+				dpu_kms->mmio + cat->mdp[0].base, "top");
+	}
 
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
-- 
2.35.1

