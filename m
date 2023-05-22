Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9D670B287
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 02:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjEVAmh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 20:42:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbjEVAme (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 20:42:34 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 316D7C5
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 17:42:33 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f3ba703b67so1368341e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 17:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684716151; x=1687308151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjC2o2RQsqV5nTbuvN77aHeR5dEhH5/JaYtRSJzTgZA=;
        b=osRVdQTxu2DDCV/zMuHPaTYsul8XmCwWIZ6Dlg6o/+mHuuvoaXK2AJLe3ezd3BGq/l
         7vsBT7K2xLun2kgDm1G+zCSZRXqW8gx7uI001V4+Xb5Tw2nY5FZyUiRLM+1vi7P4k6uD
         rD3VEMccANRFcJeUwHguY+9VPhdzmnVLyFpk25XOVp1r53iLoEqLY07wRfSLQgeVedjW
         l69JOGn0GrJ3av+oU5gNHrsHOekF+XUyo6fXXKL86RsWejTb9SPyVq7Kc5VwJDlHGhmv
         A6D7dNCDbXD+2d3Gp9ENQYVWBYIVCXK5RvDEDkCM74ImIYjonap09As3VB8+8rErcHD+
         sdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684716151; x=1687308151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BjC2o2RQsqV5nTbuvN77aHeR5dEhH5/JaYtRSJzTgZA=;
        b=Uzx8+4eM8RiuVKo4Pc6uttyRtqmoQi9yq9j7eWwB6y6wL6s7j4fMQGJYDR6BgZ0fVr
         KhnE7RmdW867OaP6tJCSCdVOyDt8kzZtwitsuQChoWCMCvVVAfAb7JhWa7LSWL7bURUT
         z37XYiGrP+P8zHznTipgua9SAaqwH6cfLrE68NWx9oTc7Tdad/CPoQPCaA3Wg02CmWuT
         VZfKxP70adRaOgQG1PTbyzwrgHZEnixBA84IrOrwkrJhDr7yki+aUkaNiV0+C/yz0L60
         +nyQKaAWW0pfZquNFyUh6KgDfvV73z0jAn7f0HqLYylNV0KD4bKYVwMgALl5oaK2byc4
         PNiQ==
X-Gm-Message-State: AC+VfDwmxMnNpH84q8xnxGF2i7HSPFX0zCmatdtODhPiPMuvBsRHGHbc
        IT8t+EaIUs98MC5Isz1PoTP8uyyTyVC85mDcon0=
X-Google-Smtp-Source: ACHHUZ7OxDDO1hEyr87WgCREKr/jBFihNoQyYqsiBKRAApx2ovI+fHiW6aqL+bxS+VTnbG3YqjpNyg==
X-Received: by 2002:ac2:44d6:0:b0:4dd:ce0b:7692 with SMTP id d22-20020ac244d6000000b004ddce0b7692mr2628528lfm.46.1684716151426;
        Sun, 21 May 2023 17:42:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b15-20020ac25e8f000000b004f139712835sm768159lfq.293.2023.05.21.17.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 17:42:31 -0700 (PDT)
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
Subject: [PATCH 4/6] drm/msm/dpu: autodetect supported interrupts
Date:   Mon, 22 May 2023 03:42:25 +0300
Message-Id: <20230522004227.134501-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
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

Declaring the mask of supported interrupts proved to be error-prone. It
is very easy to add a bit with no corresponding backing block or to miss
the INTF TE bit. Replace this with looping over the enabled INTF blocks
to setup the irq mask.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 20 ++++++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  6 ++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index a03d826bb9ad..01f2660a2354 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -463,6 +463,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 {
 	struct dpu_hw_intr *intr;
 	int nirq = MDP_INTR_MAX * 32;
+	unsigned int i;
 
 	if (!addr || !m)
 		return ERR_PTR(-EINVAL);
@@ -480,7 +481,24 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 
 	intr->total_irqs = nirq;
 
-	intr->irq_mask = m->mdss_irqs;
+	intr->irq_mask = BIT(MDP_SSPP_TOP0_INTR) |
+			 BIT(MDP_SSPP_TOP0_INTR2) |
+			 BIT(MDP_SSPP_TOP0_HIST_INTR);
+	for (i = 0; i < m->intf_count; i++) {
+		const struct dpu_intf_cfg *intf = &m->intf[i];
+
+		if (intf->type == INTF_NONE)
+			continue;
+
+		intr->irq_mask |= BIT(MDP_INTFn_INTR(intf->id));
+
+		if (test_bit(DPU_INTF_TE, &intf->features)) {
+			unsigned idx = MDP_INTFn_TEAR_INTR(intf->id);
+
+			if (!WARN_ON(idx == -1))
+				intr->irq_mask |= BIT(idx);
+		}
+	}
 
 	spin_lock_init(&intr->irq_lock);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index f329d6d7f646..f0b92c9e3b09 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -17,6 +17,7 @@ enum dpu_hw_intr_reg {
 	MDP_SSPP_TOP0_INTR,
 	MDP_SSPP_TOP0_INTR2,
 	MDP_SSPP_TOP0_HIST_INTR,
+	/* All MDP_INTFn_INTR should come sequentially */
 	MDP_INTF0_INTR,
 	MDP_INTF1_INTR,
 	MDP_INTF2_INTR,
@@ -33,6 +34,11 @@ enum dpu_hw_intr_reg {
 	MDP_INTR_MAX,
 };
 
+#define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
+#define MDP_INTFn_TEAR_INTR(intf) (intf == INTF_1 ? MDP_INTF1_TEAR_INTR : \
+				   intf == INTF_2 ? MDP_INTF2_TEAR_INTR : \
+				   -1)
+
 /* compatibility */
 #define MDP_INTF0_7xxx_INTR MDP_INTF0_INTR
 #define MDP_INTF1_7xxx_INTR MDP_INTF1_INTR
-- 
2.39.2

