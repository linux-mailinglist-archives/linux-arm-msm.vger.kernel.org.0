Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C88C70CCC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 23:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234083AbjEVVpf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 17:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233984AbjEVVpd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 17:45:33 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15E80CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 14:45:32 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f3b5881734so3465336e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 14:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684791930; x=1687383930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fa8BHx1lA9j88mBXlfwu5ebCF6YQtqactm4fwTM5QwA=;
        b=XvtsMpoW0JLA8cC9im5lhJicTOFSaXxK4sysS6vnAQBxbQUa/UH/uBXrfFcVKb88dD
         SLGbejG6Cv6cpdlnTr2nXVpW4c9m8Qh1BTsPS9zOiEIarrc1ZhN+WdiMixL4rxd6806B
         bJTiSbpUfdKE/18dTCd+HvFF1YpHGKWqjsE1R8SOQ2pBHt7EG42ZdEpYt6rImZVfphiT
         1TagZhb9iNg2o5k3lBNaRf7kMso9ygrhdi283otUfZIGJLbtDI87innhmX8asBqzjAH/
         /s0t1pJvqrR1jOtQSFD3tnckvAAREVrPlccnTtVdA5Mw1Zjjwp4ik2jEfc2keCAFs8RS
         17Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684791930; x=1687383930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fa8BHx1lA9j88mBXlfwu5ebCF6YQtqactm4fwTM5QwA=;
        b=JBtU2f3svNT9WeweS9JxQ3nauhqEWn2zEQhU2wRvDLMqxp9RC5Ljf5Lzm+uLkBmiBc
         YEBSTCg7EXb/kvkq/MtvvbatUmc/OeJ13zBde0maiOKz04BlIsh365Yn/4z/MH32Fk8B
         TfP60W6aATiNS37vlTY6MtMo1qyaOS2CBWRBHFnDGXYFD8lI/jNwylWOoAZWs8vHwv5H
         ejlqjOoEyxXAwE2UrlUMU59wody1US+keG1kZfhz9jBW/qt9VXHOyStydoIDS1WuoIal
         9xjhH13KLZcrD4R5QV6o16FhRrzZDwI/QWMa9lbV+znY1r3tafLrTFcmJD42FawuMiTE
         37/A==
X-Gm-Message-State: AC+VfDzsd2ON7ANBJuGLOfmgAFgqdkgw886ziIXHvDi4zYgeQz1bBP4f
        pawv88AJ0Ioo50yAALMpNOtDgQ==
X-Google-Smtp-Source: ACHHUZ5HK3klvkeuvXJkv8sVA8m8TZjFu2oS1/9VQKo+mZqjv5AjwTfQAOidLsncNAHbux/vrHW1ZA==
X-Received: by 2002:ac2:5a0b:0:b0:4f0:18e2:c0d7 with SMTP id q11-20020ac25a0b000000b004f018e2c0d7mr4573578lfn.60.1684791930098;
        Mon, 22 May 2023 14:45:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j7-20020ac25507000000b004f2543be9dbsm1106918lfk.5.2023.05.22.14.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 14:45:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 2/6] drm/msm/dpu: inline __intr_offset
Date:   Tue, 23 May 2023 00:45:23 +0300
Message-Id: <20230522214527.190054-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
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

