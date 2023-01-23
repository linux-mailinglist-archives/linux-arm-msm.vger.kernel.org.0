Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B30E1677610
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 09:08:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbjAWIIX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 03:08:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbjAWIIW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 03:08:22 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2349413D7F
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 00:08:21 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id a11so17064923lfg.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 00:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c7wlYRJ20Jol236QKN6NipQuokT5Lc5cfhgSG+Al5uE=;
        b=YiIp9bSkATLGtKH5X9Qw8/wPF5/WC7QLObJT7zQkSWWYGSgBKWTCuexj4of3gEZb/4
         Xi76HAMGUOmeQVFUl71QGTlVn5iLqCRI8Fv3IyLNJ/c3S1thWAIXGusqqdbIvkqiSVE4
         P82BwXvvxpPjh6IB1fcZfl9MK/25gW4+l8kh4XE1bfV6EP0EXJqSaCL2kF6pahAMSdqd
         c0usWW0p0EJRpqMEhODnakmmLMItLvI5KFcR7a3EcLfOILZchJX/ixLUSlusDnyMwDOW
         TX6zbffuPS8GAWaBKlk40OoX1h6aUARXyG9Noi1H1jDZjnq7ypZ7PP8BvXyOQXy6vfDa
         wn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7wlYRJ20Jol236QKN6NipQuokT5Lc5cfhgSG+Al5uE=;
        b=jeabr7nnpSG+J32ACZAQ2pnlYQzancIRaB8iSlmdJhqxNaBjvBiPWnScHvs5AxFkdp
         8Nrt4BKfVbRVwFQhIc5S/+6Nx3dnvHK7JSqDgR69KSe5lFNubxrPc2PeFsvAdkrJbgU6
         R5PT+QSX+M5kTZkTc2xy/6s5ZWGmsGCnfFOesRJ1xePukvox85WlECZ9xG/BoNDdTrpZ
         zxNo3/x0Cnh44OL4dXs++OUH4EckThu6fQy3tvPiM8b4BuDfNwvR4SqNSBgNxdzvyoLr
         akBFzeMp1jBJJBoiVkJ/qORyoG4Lz7TZtoNuYw71ybPAJfO1m8xp5QPtWavRGGB0/YVt
         LQrQ==
X-Gm-Message-State: AFqh2kptS+hY0AS/brbt+yJDuutnD93bj7Nq4YvlrNpE9vAnXFwN+lOF
        VtiDEBrDb8mmR27wBe+6zH9c0Q==
X-Google-Smtp-Source: AMrXdXvmu4H2D/okEr4fBGESa3wja37aq6dQQ/DRvEdR9w9OojzN05TqJovYtHPPNMf9ZBSgX0ma0g==
X-Received: by 2002:a05:6512:3ba8:b0:4d5:8bf9:92ef with SMTP id g40-20020a0565123ba800b004d58bf992efmr7694954lfv.60.1674461299296;
        Mon, 23 Jan 2023 00:08:19 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w42-20020a0565120b2a00b004cc858a2d47sm5154265lfu.41.2023.01.23.00.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 00:08:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: fix sm8450 CTL configuration
Date:   Mon, 23 Jan 2023 10:08:18 +0200
Message-Id: <20230123080818.3069266-1-dmitry.baryshkov@linaro.org>
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

Correct the CTL size on sm8450 platform. This fixes the incorrect merge
of sm8350 support, which unfortunately also touched the SM8450 setup.

Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 63a0fa3b0a17..9060dce51e2e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1017,31 +1017,31 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
 	},
 	{
 	.name = "ctl_1", .id = CTL_1,
-	.base = 0x16000, .len = 0x1e8,
+	.base = 0x16000, .len = 0x204,
 	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
 	.name = "ctl_2", .id = CTL_2,
-	.base = 0x17000, .len = 0x1e8,
+	.base = 0x17000, .len = 0x204,
 	.features = CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
-	.base = 0x18000, .len = 0x1e8,
+	.base = 0x18000, .len = 0x204,
 	.features = CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
-	.base = 0x19000, .len = 0x1e8,
+	.base = 0x19000, .len = 0x204,
 	.features = CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 	{
 	.name = "ctl_5", .id = CTL_5,
-	.base = 0x1a000, .len = 0x1e8,
+	.base = 0x1a000, .len = 0x204,
 	.features = CTL_SC7280_MASK,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
-- 
2.39.0

