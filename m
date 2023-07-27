Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEBC1765641
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 16:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233869AbjG0OqG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 10:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233949AbjG0OqF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 10:46:05 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7ADA30EB
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 07:45:47 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe0d5f719dso1805916e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 07:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690469146; x=1691073946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozXv1DbyX/9IhURbF1Fhd2b0LEweNNt8AgMpeAaCDSs=;
        b=f9wp7aF+JtlvjPCrxW+wyk6MQOJhgz9FgjxG/z6ZPtxWdM81p5lw/WJ9D7L7f6OWP0
         DxPSFOxjJGzy/0oy3rFjThgKNk2yok0MadMiMQT866V7H3M49e8S4D3DRdQgxBy/o7Aw
         23mm1HMpVVKB7MNkivPFO/6UaB5/QhRsuQlPNTgKRj0NG5xCTFNl4wfH0bE4z82pdg/Q
         Gt5TgpJu5zr9U8QVEEXpynYF10tTsw/EfM0FahQFz8L0pcv6lxzHAnE6Rwj2NIfpaj3J
         +/opyClhe25uissfWfgvrjavAjzh7HT6KxH65ujzcCgpu3sZ0EqxqbYCvnFjjD+XFefg
         cM6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690469146; x=1691073946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ozXv1DbyX/9IhURbF1Fhd2b0LEweNNt8AgMpeAaCDSs=;
        b=YnwuAN7QsCTpIHRkOIYMYQRm2bTGPBuVs2InZQGxtWdJ1128ZBab4i2N9v9I3TtC8S
         Tr3hjUTC162kCMonxXcRyESnICVf4D+3ZyaBg4pTeb5ozEZEuqTqDEvI29gZsGi6H7y/
         bJNDHFDYLZvjeQHgktwC3xXe2cAPbs+epIUnZL55DW4DK5oaEZCVpod5peKowFZMrqiO
         hMZR7LJkeEQLw2TyXIBYZtjWvyWscicmaqPLy3DTyrj0C7un5ZEca1WJivder8dFkLf/
         pwLxMMQ5kHLfuhF+j0cCCMY6qgSFLIWjbU0d9lOUuZnZUFG/Up1E8GlinxHwGq3R91rO
         0xLw==
X-Gm-Message-State: ABy/qLbipglhSlcvl0Yoz6a+7lqxOyxB1RwOturI/3qrcMsTbRpj2AMS
        AJ461V0+sBboey3zJzQkqO2kLg==
X-Google-Smtp-Source: APBJJlFhMrD49VU49jXEomb0dk47f28sgcEyHBNeyokLEu/IKGXr7EkYXVKw7fd6oWwSDZ4pdHuCYA==
X-Received: by 2002:ac2:4343:0:b0:4f9:586b:dba1 with SMTP id o3-20020ac24343000000b004f9586bdba1mr1947280lfl.4.1690469145967;
        Thu, 27 Jul 2023 07:45:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d28-20020ac2545c000000b004fb86662871sm334110lfn.233.2023.07.27.07.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:45:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 1/5] drm/msm/dpu: inline __intr_offset
Date:   Thu, 27 Jul 2023 17:45:39 +0300
Message-Id: <20230727144543.1483630-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
References: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
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

Inline __intr_offset(), there is no point in having a separate oneline
function for setting base block address.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 5e2d68ebb113..0776b0f6df4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -435,12 +435,6 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 	return intr_status;
 }
 
-static void __intr_offset(const struct dpu_mdss_cfg *m,
-		void __iomem *addr, struct dpu_hw_blk_reg_map *hw)
-{
-	hw->blk_addr = addr + m->mdp[0].base;
-}
-
 struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 		const struct dpu_mdss_cfg *m)
 {
@@ -454,7 +448,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
-	__intr_offset(m, addr, &intr->hw);
+	intr->hw.blk_addr = addr + m->mdp[0].base;
 
 	intr->total_irqs = nirq;
 
-- 
2.39.2

