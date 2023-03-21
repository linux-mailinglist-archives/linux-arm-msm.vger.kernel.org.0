Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30B1C6C275C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Mar 2023 02:20:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjCUBUo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 21:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230454AbjCUBUn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 21:20:43 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9925591
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 18:20:14 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id k37so4278762lfv.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 18:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679361511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19Mh1AennFks/7EMfm7YcmHqybWalPcK9N+h2nso4NM=;
        b=E2Tm00ZfPxZRTFrHiINcrkN47RtD3K7YkBow6t5sagMcYhCs4GYZQoHGg/vR6HQmXb
         cF6B77vvj1ANdqtdDxsaEGY6T/qCd0qmn5Q6qof2HCIJ/ptt5w7d78cPC1xbNrZnYtXA
         0AWbaPfclpDzX1iKhFc6pTvwdY0oJNu8LsjHulfdaEsXWm9h8+/0KfIKKMGxC02L0Z+X
         JVg5lLBVSdnCsfSf0TTes96FsomJDvRSkUqJzZIlJSx9Q7Wtg/wj7I2UvBSnz70pTy2W
         tMsbpy1/WZ4nNFsmIFfWp9AI5Ese0gbZthX/Vr81PLI4t/+h2Q5qUkvGuxfKM+cV7MXZ
         ePEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679361511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19Mh1AennFks/7EMfm7YcmHqybWalPcK9N+h2nso4NM=;
        b=vX7z8CPfJsvMITHDn1RoLd53NOiaZN6j3kpwf04pGFLA17yoxif7QSBHrUI4jDBhuH
         LYydMoMt5+Piwt6aLAma8/Te9xZrySdl1XZJP9PPxiJNnDSEy3r0hk03HF36X3sxeRpr
         95a9uAKlrk/QU7mU7XVWAtZOgbVfMWJOLRtlo6YLaJrVGltuAo8rZVKYC3NsEJpxAeBK
         4frNqrIfNACcjTvhiLGBNNljZOyK6V+EMd5f9lvRWEKS8bodAZG1KaQk7ZyQ/JqBkm2B
         XF8p2LPKeXfwLnFelvXIj4PCfynSOWYrSaJpDrgsEa7jMNNehcxxo69U86t1OadUE/Kt
         zcsA==
X-Gm-Message-State: AO0yUKVn7dl96PJPQU3w44dBRBClaIenEZkeG1/FGNmkjI/2xylWqy9V
        zpC9epczvVE8Y+lj8IttjP8f3Q==
X-Google-Smtp-Source: AK7set+aTiuu1uL1+bgmR9So63+iQYZYtju6YL2CUqZSRgh063oiaoRPpeS4LcJfucYU8Ou4ChRZJQ==
X-Received: by 2002:ac2:53b6:0:b0:4dd:a445:e69d with SMTP id j22-20020ac253b6000000b004dda445e69dmr313101lfh.26.1679361510839;
        Mon, 20 Mar 2023 18:18:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 18:18:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v2 11/13] drm/msm/dpu: add a field describing inline rotation to dpu_caps
Date:   Tue, 21 Mar 2023 04:18:19 +0300
Message-Id: <20230321011821.635977-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We need to know if the platform supports inline rotation on any of the
SSPP blocks or not. Add this information to struct dpu_caps in a form of
the boolean field has_inline_rot.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2d6944a9679a..33527ec7c938 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -489,6 +489,7 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
+	.has_inline_rot = true,
 	.max_linewidth = 2400,
 	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
 	.format_list = plane_formats_yuv,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4847aae78db2..cc64fb2e815f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -400,6 +400,7 @@ struct dpu_rotation_cfg {
  * @has_dim_layer      dim layer feature status
  * @has_idle_pc        indicate if idle power collapse feature is supported
  * @has_3d_merge       indicate if 3D merge is supported
+ * @has_inline_rot     indicate if inline rotation is supported
  * @max_linewidth      max linewidth for sspp
  * @pixel_ram_size     size of latency hiding and de-tiling buffer in bytes
  * @max_hdeci_exp      max horizontal decimation supported (max is 2^value)
@@ -416,6 +417,7 @@ struct dpu_caps {
 	bool has_dim_layer;
 	bool has_idle_pc;
 	bool has_3d_merge;
+	bool has_inline_rot;
 	/* SSPP limits */
 	u32 max_linewidth;
 	u32 pixel_ram_size;
-- 
2.30.2

