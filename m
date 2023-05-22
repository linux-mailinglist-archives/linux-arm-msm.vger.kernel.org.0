Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4FCC70B285
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 02:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbjEVAmf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 20:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbjEVAmc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 20:42:32 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD9C0C5
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 17:42:31 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2af2958db45so27707711fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 17:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684716150; x=1687308150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOzPobYlC2VJQ4A8wiKtjp03QoZTADqwD/v8ClHAvyg=;
        b=SuQPA0Jaa3BwdVOg3HARRiUy269QcbA6O7yq6Pc0rm3/YOLDCLkMxueXRD00Jbjob1
         fghM/DjmCQn+fhr83Br5lDLC8hfESrPOwEhM0OwnbtUV76zrdeDonIchGu/nYaODK8Ng
         3ffelWHUZs1sjmFgSqAIfHIuJEG2Px+Reg9cnY8sGM0f3BJq0WW1C/7Rd/LgN2sKEh2T
         NlP92sC66+ekM2xMLW5feeU7ziqmgtipfeX6yLa94bbCjNWUK/uTcV7QV9LWY73Lrk76
         t2F8iVzo8xlvmx7NIWSpBhLmAC9fwhRUYtNpYlIOfxE8y+yRWNgrr3JRcnosbDKKsPr7
         QOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684716150; x=1687308150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOzPobYlC2VJQ4A8wiKtjp03QoZTADqwD/v8ClHAvyg=;
        b=Yzb6UROXagaeFfGNDccvJv72FpYmI1QmeeAMX3JeMGpzK4uIL7oCKkNhZYXYwI/NvS
         Ewi4Cbbyeo8FDPqZVU1c6s9sZdZN+YurK0gjUq2WRU9hBZJJtircD58FnnetSY1fw1iA
         w498X2Rr4uw+30esMaUZbfjNPtEROnA1OYkNo9lBDAY/NJfMWh2Y2rxJGjgw+Y4AJ7C5
         zWX/qNvtvs4cuyhgMOCzSdhAji9AVbYolrBSFbczCzcLI1oRpYWhKz2J3K7tFEIpfn6o
         8YqkrrzuPFvb1C0RDruxpoPqw+97SGC63W09SMc4iOt1tSAoR7l5/hrjzKCGjitNIR74
         AnAQ==
X-Gm-Message-State: AC+VfDyV4SDOlmiHOVb1OdDc0JDBGO7+0App0RjJLTKcE8ZHV81R87Nz
        oZk7JnCKTsNrngSaOQO1o+l99FXmbyHEbz257l0=
X-Google-Smtp-Source: ACHHUZ4ggFhhA2hNrKjtxpGMbVrJXZV1LH3tuH4c5IaHWg2GABMg6MdloukTTdkTvAEqvYCsNDdAtA==
X-Received: by 2002:a2e:81ce:0:b0:2a8:b7e9:82ee with SMTP id s14-20020a2e81ce000000b002a8b7e982eemr3385826ljg.1.1684716149896;
        Sun, 21 May 2023 17:42:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b15-20020ac25e8f000000b004f139712835sm768159lfq.293.2023.05.21.17.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 17:42:29 -0700 (PDT)
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
Subject: [PATCH 2/6] drm/msm/dpu: inline __intr_offset
Date:   Mon, 22 May 2023 03:42:23 +0300
Message-Id: <20230522004227.134501-3-dmitry.baryshkov@linaro.org>
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

Inline __intr_offset(), there is no point in having a separate oneline
function for setting base block address.

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

