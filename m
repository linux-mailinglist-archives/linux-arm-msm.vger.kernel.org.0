Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3CA766B157
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jan 2023 15:00:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbjAOOAa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 15 Jan 2023 09:00:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbjAOOA2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 15 Jan 2023 09:00:28 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9333F113C5
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 06:00:27 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id y25so39388721lfa.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Jan 2023 06:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FtXT1BPFkhUBcOmVGg1OQMa6Pr60aojLScowtO3kbw0=;
        b=k7RG32ky4SVtjFYCrrfJPPPboaKY/AM8OUnTp5BomwaXOx45avQ5O0gEufAh+hjwWA
         n2GeoW64ty7XyAdZSIzSpjfzAcrUZYvGoDWvLIaktqJ7mYqDdQl78PXmssNhv65/eRxh
         qlCUd/7AAlRLmq+Yx1A1zq57LTAzElXwZEKd05xfy01HncSzG1z4txZkP4pTnyVgbBpT
         mcUo8YevZjoBjl/cePIbNK9KJvxoOA4RpMakBM5jO0//IZJaJhfh6zNXslh6WFWyfWXt
         dQoxTl+aUp+ayvJh7qIy3CVP+Jtn6JPhugxFzI2rKjWOeLI2QfdGlNp3luB/N1Lo78+X
         NmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtXT1BPFkhUBcOmVGg1OQMa6Pr60aojLScowtO3kbw0=;
        b=uZxEeZ8MBX9DNavlH1alQ+ydORS33yHw6gOGhHKAp/SomLl2MvSro/qHzwZ3HUQ2t0
         7Mso2yKGvqBjYL5MSYqfJsDJEQ7lMsoSV5HYRxIvXWWh5YN6CzXKOmG/m07CbFHFg0y5
         ZSaQi4Q3ftY1hdTS0qCw7+49StEYeco7mqWxDEivvsa+ot5oPon4rPMkC162XZS7Z3MO
         7H2w+45ganUhJ7FANfLQylKiXwmFMe4xyV4STcb/LLpZ1ceJzLs219jYc9WPsD75P2xQ
         iqSBhxgcgb6jWmTwe5lVUFJngIwODCa68OOk444axgqipow54+FddmLUkQS4+vGDQY2M
         G5Ig==
X-Gm-Message-State: AFqh2krU+DIYckzY58KpayPgR2QKS+ycuOE7IT/JIbGAV64/a1yXsd7/
        ONiVEVFEn6cfSYUNKo04M+2DcQ==
X-Google-Smtp-Source: AMrXdXsocmXVqsyp15ghGtamQ+dj131X30zhjV7sOQNDVlqOptkYlymP9B+12UzN/LXFtel1ELCLDQ==
X-Received: by 2002:a19:ca1d:0:b0:4a4:68b7:dedc with SMTP id a29-20020a19ca1d000000b004a468b7dedcmr1977016lfg.56.1673791225941;
        Sun, 15 Jan 2023 06:00:25 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.243])
        by smtp.gmail.com with ESMTPSA id t20-20020ac243b4000000b004cb44c1d060sm4682527lfl.134.2023.01.15.06.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 06:00:25 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH] drm/msm/dpu: enable DPU_MDP_AUDIO_SELECT for sc8180x
Date:   Sun, 15 Jan 2023 16:00:22 +0200
Message-Id: <20230115140022.489881-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

According to the discussion ([1]) on the mailing list, platforms before
sm8250 (and derivatives) should program HDMI_DP_CORE_SELECT register to
route audio to the DP ports. Enable DPU_MDP_AUDIO_SELECT on sc8180x to
program correponding register.

[1] https://lore.kernel.org/all/f86504ba-835a-6e30-6c30-8bb89b1359c4@quicinc.com/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2664fa3665b0..b94b0a772ca8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -550,7 +550,7 @@ static const struct dpu_mdp_cfg sc8180x_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x45C,
-	.features = 0,
+	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.highest_bank_bit = 0x3,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
-- 
2.39.0

