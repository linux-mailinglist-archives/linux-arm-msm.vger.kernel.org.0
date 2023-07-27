Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5544176587A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 18:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233598AbjG0QVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 12:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232380AbjG0QVO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 12:21:14 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29822D4B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 09:21:13 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-522382c4840so1519579a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 09:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690474872; x=1691079672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAO+D5NMJTNgq7oxICRJMihelHd0A/dupTNabM/INjg=;
        b=nTbsfxmpsMq+10/C/3jN78hzseUIeoBGPTpCNV/NgPdpK6SB52b7eF/QqeqqmxiWbH
         cyUj5opl/D8INNxEMtLIF6vSItt6H30YjVnPpEpLueOGTZa6pzH7K/SvQcCgR9y3SPU6
         NHQqn8asiJ1qlKxM//cPq0nJo1MB7ZoucmhBJD9Ymyp3RdIBz78f6J2lbn8cf7xqgdp6
         7TJYDWzP6fIywxdBXyk5IonQ43yyAjfWe4iaQe1InUGDa+0D2v9qQi8Zfr9M43xgBowO
         +ZGYMKZ6ZJKBovRlvS6e/zZUIChpdKLC4kPVxdAxtSb7PsXqORGobeGHSursQxytJUHc
         EJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690474872; x=1691079672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAO+D5NMJTNgq7oxICRJMihelHd0A/dupTNabM/INjg=;
        b=dI++ont0Yi7X8iQcMmVxXZ8tb6uuQclKMYHsonW9ArP1zZCdOAZof3uh2JTzy5d+wq
         SdwVsm1nwOslDnfRzT7F8jWA0M6hqvKMBOA08swE0R8G0UCjfOR7zNNFKoOVUP3pJ0jx
         Ihi4icrJWlJY3xlrJgxio2QUAsbl6icCW0ncoTBxQ12EJpoDs++Ve3SWiNPbosFl563L
         HGyq/WZxe9SLa8zJPQWgveLdYaeKeyqXC1sU21L/pjsCnVXCDcn1RFVFZzYTEXWKiuYs
         +H3UBar6ZYeON33lwImwywfZ31neXyHXo8pR45TE3EdND+RdetRal7th06y4720DGike
         8wgg==
X-Gm-Message-State: ABy/qLbH0c90iMM2EfNnkDYUjFI3Ac5HOLAGlym/VosSOgGr15fS2F1C
        EDRZVho5iFoxhki6yRgSqibPOQ==
X-Google-Smtp-Source: APBJJlHCv2u8VglBAcBOLLPFkBcIselPzpXHPs1zWQ8D07gQIhCJPSIE2bZas8AEOWcDi0qTlZuqMg==
X-Received: by 2002:aa7:d94e:0:b0:51e:404:1e6d with SMTP id l14-20020aa7d94e000000b0051e04041e6dmr2094325eds.38.1690474872108;
        Thu, 27 Jul 2023 09:21:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a15-20020aa7d90f000000b00521953ce6e0sm808027edr.93.2023.07.27.09.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 09:21:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 5/7] drm/msm/dpu: drop DPU_INTF_TE feature flag
Date:   Thu, 27 Jul 2023 19:21:02 +0300
Message-Id: <20230727162104.1497483-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
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

Replace the only user of the DPU_INTF_TE feature flag with the direct
DPU version comparison.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h       | 2 --
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 9589fe719452..60d4dd88725e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -776,8 +776,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	phys_enc->intf_mode = INTF_MODE_CMD;
 	cmd_enc->stream_sel = 0;
 
-	phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
-					 &phys_enc->hw_intf->cap->features);
+	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
+		phys_enc->has_intf_te = true;
 
 	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
 	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c19dc70d4456..17426f0f981e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -100,7 +100,6 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_TE) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
 	 BIT(DPU_DATA_HCTL_EN))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index a6f8eee58b92..69c9099cf5a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -175,7 +175,6 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_TE                     INTF block has TE configuration support
  * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
  *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
@@ -183,7 +182,6 @@ enum {
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_TE,
 	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
-- 
2.39.2

