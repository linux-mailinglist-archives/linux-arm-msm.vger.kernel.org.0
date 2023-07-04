Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC53747601
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 18:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbjGDQCd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 12:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjGDQCc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 12:02:32 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A246910C8
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 09:02:30 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7673180224bso424020385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 09:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20221208.gappssmtp.com; s=20221208; t=1688486550; x=1691078550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vGounWSX2Ta3v2i79JYImPXzwvWuhBfpeJNjehKi004=;
        b=rc0Z7y7TRSX2d+1KPwiGFAhYt8WzwvmJqI3TYwOtVT7uvUJyHaeN5LaGt1mKP6LKnC
         uKq/8vW9itima9B31SpAz2mexuJEkJdzIMVLK3cmvR/s+Y7cz9KbMRjSAgMJ+7VFtPVG
         dIJu6aXSkK+O7myNN/V/OfAmFqOzWcohTDSY287Ugp/Fag9pxnuwih1IXXP6cNdp9XKK
         lmXRumrxbC3Uemv/foXY+rq8vEePWATO3BKLYjB3LRWaqrVZhwfReNd4+XXK5P6fmFHk
         ikG+Oh3DBXvPMPhfFoQHTQiPEtlhp2z93JMi/J6KDiEtY7ZJC7WpFdzK/n0WaokgzzGA
         kRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688486550; x=1691078550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vGounWSX2Ta3v2i79JYImPXzwvWuhBfpeJNjehKi004=;
        b=i2O6534wBcWlrYWb0ZU0YFX6Y3rKToUPV9c9K6OhJtlxr+N3sXj73lZAz5Pw+14Q6n
         wStjkaxSYeLozgioOf3212YGwxP6pYsrCEbj/K4yxhg4yk4poiYG74xuXs1JvHHjV5gL
         VQLHCVuG+XStTBnwDkCv7ZlKCpamjXAPwJ/kc8vZqBHglYrArNI315q89oWuzY7XJd6K
         SxoaEWuzfzGhBynJs37zPbV3p7gJoz32zgCoC37sgbdVVTWPdQqiue8ru55Ewx+V8sa6
         4x0t0V1ITNQ16VC3k4kdqvcqfCOgEEY7mCs1yKiSVDQbERwmAjE0ypRfYrgiv06BUzAv
         u3/w==
X-Gm-Message-State: ABy/qLb2AbUOwVeJ5EvBvcm4YET3CpwlK7kQqsgUAJOYVcg7yXz5zQH4
        zVoPfjPZ+BQUw8vonlJ+9wmrfQ==
X-Google-Smtp-Source: APBJJlE+NmKZaXt8xrhE1cfKOONdr0uQa7f/tA9YGQWR7rwjnOqQDPa3QaGrSLMkEeuqZM5bZwMHBg==
X-Received: by 2002:a05:620a:4096:b0:765:575b:415 with SMTP id f22-20020a05620a409600b00765575b0415mr17754462qko.24.1688486549669;
        Tue, 04 Jul 2023 09:02:29 -0700 (PDT)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id l15-20020ad4444f000000b0062439f05b87sm12659236qvt.45.2023.07.04.09.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 09:02:29 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/dpu: add missing flush and fetch bits for DMA4/DMA5 planes
Date:   Tue,  4 Jul 2023 12:01:04 -0400
Message-Id: <20230704160106.26055-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Note that with this, DMA4/DMA5 are still non-functional, but at least
display *something* in modetest instead of nothing or underflow.

Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index bbdc95ce374a..52222af5975f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -51,7 +51,7 @@
 
 static const u32 fetch_tbl[SSPP_MAX] = {CTL_INVALID_BIT, 16, 17, 18, 19,
 	CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, 0,
-	1, 2, 3, CTL_INVALID_BIT, CTL_INVALID_BIT};
+	1, 2, 3, 4, 5};
 
 static const struct dpu_ctl_cfg *_ctl_offset(enum dpu_ctl ctl,
 		const struct dpu_mdss_cfg *m,
@@ -206,6 +206,12 @@ static void dpu_hw_ctl_update_pending_flush_sspp(struct dpu_hw_ctl *ctx,
 	case SSPP_DMA3:
 		ctx->pending_flush_mask |= BIT(25);
 		break;
+	case SSPP_DMA4:
+		ctx->pending_flush_mask |= BIT(13);
+		break;
+	case SSPP_DMA5:
+		ctx->pending_flush_mask |= BIT(14);
+		break;
 	case SSPP_CURSOR0:
 		ctx->pending_flush_mask |= BIT(22);
 		break;
-- 
2.26.1

