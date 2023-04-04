Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D936D61DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Apr 2023 15:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234811AbjDDNIp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 09:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234792AbjDDNIn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 09:08:43 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAA3110F2
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 06:08:40 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id x20so33737334ljq.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 06:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680613719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QMmILR6+zBOxbV3dxRV8TQtCQNp43+duiF1VbsCx/M=;
        b=G4hEMLKsdJIyDl7TZT6T3aoRmN9Jcwk1beAPsjx7+aBsnGknGuB6WjfaSDWf9bC1HI
         sCqMwdhdQ/HPYVzhfZSLuH1a4MhqVK4H2LO486gYps5D5vZ5zdrw5RnQTmOgdUQyomlE
         aOMdbFbSTGgC7J84LSIcrFdVjERFygCURsYSuhi+Rbb5Hjv4vXlx5TDKe7okM9oLz7U4
         oCV2jcIiFJB4u2P4qiaMoO89EwRNvFuvjd4q1RCeRRZMsXt2RzqC2TxGFS7AWzjqWKE3
         Vylye85bK/o7zgQ/DSIUdS53t6ppNU5m23+Ogd5KnkoK9VCWgD4H/Kch34qDXz146ABb
         31ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680613719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QMmILR6+zBOxbV3dxRV8TQtCQNp43+duiF1VbsCx/M=;
        b=G0qQ83sauvx5P7v1ZHg3gE91G88+P0I24ICsWGTyztZ/bDVlk6MQXt8Mtt9FMQxi7q
         AT8kb9Nr5Yg3xjxLOSdrKD25dyhY+uaTcu49T3oVJkBN49QdoN64WlW0DoxI/Vn4rkAw
         2oyB5pdU4DDriiXRbJsIDERlCmvcMWWnQfWTzAw7UqO9U5DkQ86uFzkv0euErJ2pt0gq
         dvpydw79V6hfkzkv9xVrqJ+vj3NgyfqMi/c0pRnqtcPbcDj/l2mPidEc0iPBiDkAWVyz
         kF0ig0bIT/k+a06k22+7OI/Knq/il77cfInzjSFmb9QrXq66tjyldbHaEk9HCoJd6ASQ
         xFfQ==
X-Gm-Message-State: AAQBX9fVTaHcAT/X50WKRjMTtGeuFCg4ew+/WOrEeo/drYhKTt20rvee
        aCkm0nwm6Y2us9uEGLx90zYo4w==
X-Google-Smtp-Source: AKy350ZWuU4Cr1Xcl5SU/ev0HBewzetwe4S/y8T939nGGYayQEsQ9UmBH7ULciZ2qBYnMlYVAZlfnA==
X-Received: by 2002:a2e:8753:0:b0:2a2:54e8:1037 with SMTP id q19-20020a2e8753000000b002a254e81037mr857429ljj.38.1680613719135;
        Tue, 04 Apr 2023 06:08:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([193.65.47.217])
        by smtp.gmail.com with ESMTPSA id c11-20020a05651c014b00b0029e5448e752sm2304789ljd.131.2023.04.04.06.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:08:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4 05/42] drm/msm/dpu: mark remaining pp data as const
Date:   Tue,  4 Apr 2023 16:05:45 +0300
Message-Id: <20230404130622.509628-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix several leftover _pp strutures and mark them as const, making all hw
catalog fit into the rodata section.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2dbd4783a57b..69ea713405bd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -1659,12 +1659,12 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15)),
 };
 
-static struct dpu_pingpong_cfg sc7180_pp[] = {
+static const struct dpu_pingpong_cfg sc7180_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk_te, -1, -1),
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x70800, 0, sdm845_pp_sblk_te, -1, -1),
 };
 
-static struct dpu_pingpong_cfg sc8280xp_pp[] = {
+static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
 		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
 	PP_BLK_TE("pingpong_1", PINGPONG_1, 0x6a000, MERGE_3D_0, sdm845_pp_sblk_te,
@@ -1728,7 +1728,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	PP_BLK("pingpong_3", PINGPONG_3, 0x6c000, 0, sc7280_pp_sblk, -1, -1),
 };
 
-static struct dpu_pingpong_cfg qcm2290_pp[] = {
+static const struct dpu_pingpong_cfg qcm2290_pp[] = {
 	PP_BLK("pingpong_0", PINGPONG_0, 0x70000, 0, sdm845_pp_sblk,
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12)),
-- 
2.39.2

