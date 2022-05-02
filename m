Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42CEC516BFC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 10:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359278AbiEBI1v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 04:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379079AbiEBI1v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 04:27:51 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6514B1D3
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 01:24:23 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 17so17545336lji.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 01:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K7s59/Q17Za6lJHQStBvDJic0/FOMAAkP8fNiF1n5RU=;
        b=rKwwxI4qcnZjlYF1CIXizaLM0mRyTT3aNe6ZMZpubtf31o5Lel5CdUNlQiobr/uitA
         QmhE9hlCPMEjiK3yvipxDRQsv/E8qT20nIg24rLZaSLWyKoJGuaNSFwPkNN5l0+Dcm9h
         lo+joRO6K/bFoqVxa7+RyQaWzb3LY6f4jX/n9elPRxJpLu6uI5xbb746n1ASEEi/l4Kz
         DUdq8Wl3MWpsGn5yenuNdBRhUARySy/2NqaS9g7viu3cxujCFPI7BuND0s4Ax1Vgzy9Q
         sZpxNOqesqOt21ER+EdFaQL9grOoptsjXrU7ZI96SRcD6P6zUFK+HewGJVYk31B8p4nh
         e53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K7s59/Q17Za6lJHQStBvDJic0/FOMAAkP8fNiF1n5RU=;
        b=2bzgLOHdLpX3UODGT7FpGr03Z5RigfZMLmgw8SsYzKCgbUjC0dGWhDRGWI6CFmYc2z
         jEy6EDoUyV5AlS+TizviHjlc5ahtsASjRHHQWl+W12BHt45j80hqomjykbYTntDJu7w6
         Tqwx3ag/cSO1z8hWOVELiPsGRmzTj4ra/HU/UQkNzatjDiqnr5x8qffLKsEegf8B+H3n
         9gIKyVWmpV8R6y7PqIVd/GKNIzgshyM2jKF4WyIwgdtLq2M722uHE1/UyQ0pf8K6I7oz
         q/9snARfNz0rU1fP9+pEzlbPCgpxCRQGrDMQ9qj2SQgl0e4hvQJgNq/ClXfcgp+5AWAs
         wZYg==
X-Gm-Message-State: AOAM531c5Ph66Lpy+92hfnIx3Y/znxsqqJhbRcyCXOACwMcRaQlrijIU
        fSh+8nvZZ3emENSBtHzHI3BOHw==
X-Google-Smtp-Source: ABdhPJzCKDUJ9dajLmL2juVoQAnLpONDDplg6cI7LPzhbPdaUY7FmF9Lu77YXD0cgh7lE49BERTIBg==
X-Received: by 2002:a2e:8657:0:b0:24f:14b6:4556 with SMTP id i23-20020a2e8657000000b0024f14b64556mr6931890ljj.369.1651479861379;
        Mon, 02 May 2022 01:24:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z22-20020ac25df6000000b0047255d21166sm643562lfq.149.2022.05.02.01.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 01:24:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/msm/dpu: don't access mode pointer before it is set
Date:   Mon,  2 May 2022 11:24:20 +0300
Message-Id: <20220502082420.48409-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Move the initializer for the mode variable to the declaration point to
remove unitialized variable access from the DEBUG_DPU macro. This fixes
the following warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c:250:37: note: initialize the variable 'mode' to silence this warning

Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index f4a79715a02e..4829d1ce0cf8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -247,7 +247,7 @@ static int dpu_encoder_phys_wb_atomic_check(
 		struct drm_connector_state *conn_state)
 {
 	struct drm_framebuffer *fb;
-	const struct drm_display_mode *mode;
+	const struct drm_display_mode *mode = &crtc_state->mode;
 
 	DPU_DEBUG("[atomic_check:%d, \"%s\",%d,%d]\n",
 			phys_enc->wb_idx, mode->name, mode->hdisplay, mode->vdisplay);
@@ -256,7 +256,6 @@ static int dpu_encoder_phys_wb_atomic_check(
 		return 0;
 
 	fb = conn_state->writeback_job->fb;
-	mode = &crtc_state->mode;
 
 	if (!conn_state || !conn_state->connector) {
 		DPU_ERROR("invalid connector state\n");
-- 
2.35.1

