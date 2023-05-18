Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2FC9708B68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 00:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbjERWWo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 18:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229842AbjERWWo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 18:22:44 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65BACE57
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:42 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ac82912a59so28075751fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 15:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684448560; x=1687040560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/FSqh+3JrXMuGo9qVgDoKrtQjNWUoz9j1Y/GscvxrY=;
        b=RbdclsXLy+LVJcup0/goXw+LdDGvkYqw4zMaBapZAyEOlTsSWy+duE6YAdCE7ux67Z
         wfIAa6hyAevCSJVF7E/rj/0runDMJfb+I55fcHEWOdNmjQOeojErvHp2NR7M9/D3Kv5N
         62BBgk3kwyBM5SobM2TS9eqEdzpmqhsMCHYxiuOde1BurCo1OIZOWhAmriX+75SrdxKE
         MS0/HaymyxyWCuhk0fgXKsl4N61dxO2Gw+kpTE6wrlod4q9SiQ+MkZ9gER1VGUelzX1C
         cfj9L06ubnaj7I3Net18XpjDmBjAHwyIZu5a5UaKO4rU4G98t4r0KiMOhFoiBk9OZ5Au
         UMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684448560; x=1687040560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/FSqh+3JrXMuGo9qVgDoKrtQjNWUoz9j1Y/GscvxrY=;
        b=mCA60WmpxDuFL8EW4MlfVaV4GCKwzVUTbwODwtwFTM8NpiwP9zCLPFljkM/LNNktcI
         rf0S0XAgzGanDo2qQ2ohuLyxJKv7ygzloX5k26nMsrm9rkBmzlzlpFu9katIOUNP+ceV
         PQzPiBKKGUX4LULyzBuV/ZcyC58rBRkIj+L/yLRYHnhX3Jwcw5PygYXDheAq0Ydpp218
         41n0EmTTiC90g126CWAlbwN2vbd/wQMe17QEr1Ppqx2e77giV+C8a3IRIUAmWiOrp6cC
         D0SfFLMcjobQOwibAXQfk/xrVLhAUk2B1Na1izOOxyz/Edn1n1DLUYabZGmRvrXpNmXT
         x5Xw==
X-Gm-Message-State: AC+VfDzjW1dyxF0baJaCXfUZpbSq6FJ4CxDxKktZnwIGzVdKZfwDkWRK
        jvBzJeT2t/lg1XhleT+OwpdjFg==
X-Google-Smtp-Source: ACHHUZ7bEPsyIeXkktlMTpQRFW8ww/CaMYUXFu7x7EgILMi3TX6nrLSbZK7vcnwfwz+vdvTP3vd5uw==
X-Received: by 2002:ac2:5187:0:b0:4f3:8728:540a with SMTP id u7-20020ac25187000000b004f38728540amr135461lfi.7.1684448560679;
        Thu, 18 May 2023 15:22:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o18-20020ac24352000000b004ec7c0f2178sm383860lfl.63.2023.05.18.15.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 15:22:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Jeykumar Sankaran <quic_jeykumar@quicinc.com>
Subject: [PATCH v3 1/9] drm/msm/dpu: fix SSPP register definitions
Date:   Fri, 19 May 2023 01:22:30 +0300
Message-Id: <20230518222238.3815293-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
References: <20230518222238.3815293-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reorder SSPP register definitions to sort them in the ascending order.
Move register bitfields after the register definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 64 ++++++++++-----------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 6b68ec5c7a5a..08098880b7d5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -26,45 +26,18 @@
 #define SSPP_SRC_FORMAT                    0x30
 #define SSPP_SRC_UNPACK_PATTERN            0x34
 #define SSPP_SRC_OP_MODE                   0x38
-
-/* SSPP_MULTIRECT*/
-#define SSPP_SRC_SIZE_REC1                 0x16C
-#define SSPP_SRC_XY_REC1                   0x168
-#define SSPP_OUT_SIZE_REC1                 0x160
-#define SSPP_OUT_XY_REC1                   0x164
-#define SSPP_SRC_FORMAT_REC1               0x174
-#define SSPP_SRC_UNPACK_PATTERN_REC1       0x178
-#define SSPP_SRC_OP_MODE_REC1              0x17C
-#define SSPP_MULTIRECT_OPMODE              0x170
-#define SSPP_SRC_CONSTANT_COLOR_REC1       0x180
-#define SSPP_EXCL_REC_SIZE_REC1            0x184
-#define SSPP_EXCL_REC_XY_REC1              0x188
-
-#define MDSS_MDP_OP_DEINTERLACE            BIT(22)
-#define MDSS_MDP_OP_DEINTERLACE_ODD        BIT(23)
-#define MDSS_MDP_OP_IGC_ROM_1              BIT(18)
-#define MDSS_MDP_OP_IGC_ROM_0              BIT(17)
-#define MDSS_MDP_OP_IGC_EN                 BIT(16)
-#define MDSS_MDP_OP_FLIP_UD                BIT(14)
-#define MDSS_MDP_OP_FLIP_LR                BIT(13)
-#define MDSS_MDP_OP_BWC_EN                 BIT(0)
-#define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
-#define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
-#define MDSS_MDP_OP_BWC_Q_HIGH             (1 << 1)
-#define MDSS_MDP_OP_BWC_Q_MED              (2 << 1)
-
 #define SSPP_SRC_CONSTANT_COLOR            0x3c
 #define SSPP_EXCL_REC_CTL                  0x40
 #define SSPP_UBWC_STATIC_CTRL              0x44
-#define SSPP_FETCH_CONFIG                  0x048
+#define SSPP_FETCH_CONFIG                  0x48
 #define SSPP_DANGER_LUT                    0x60
 #define SSPP_SAFE_LUT                      0x64
 #define SSPP_CREQ_LUT                      0x68
 #define SSPP_QOS_CTRL                      0x6C
-#define SSPP_DECIMATION_CONFIG             0xB4
 #define SSPP_SRC_ADDR_SW_STATUS            0x70
 #define SSPP_CREQ_LUT_0                    0x74
 #define SSPP_CREQ_LUT_1                    0x78
+#define SSPP_DECIMATION_CONFIG             0xB4
 #define SSPP_SW_PIX_EXT_C0_LR              0x100
 #define SSPP_SW_PIX_EXT_C0_TB              0x104
 #define SSPP_SW_PIX_EXT_C0_REQ_PIXELS      0x108
@@ -81,11 +54,33 @@
 #define SSPP_TRAFFIC_SHAPER_PREFILL        0x150
 #define SSPP_TRAFFIC_SHAPER_REC1_PREFILL   0x154
 #define SSPP_TRAFFIC_SHAPER_REC1           0x158
+#define SSPP_OUT_SIZE_REC1                 0x160
+#define SSPP_OUT_XY_REC1                   0x164
+#define SSPP_SRC_XY_REC1                   0x168
+#define SSPP_SRC_SIZE_REC1                 0x16C
+#define SSPP_MULTIRECT_OPMODE              0x170
+#define SSPP_SRC_FORMAT_REC1               0x174
+#define SSPP_SRC_UNPACK_PATTERN_REC1       0x178
+#define SSPP_SRC_OP_MODE_REC1              0x17C
+#define SSPP_SRC_CONSTANT_COLOR_REC1       0x180
+#define SSPP_EXCL_REC_SIZE_REC1            0x184
+#define SSPP_EXCL_REC_XY_REC1              0x188
 #define SSPP_EXCL_REC_SIZE                 0x1B4
 #define SSPP_EXCL_REC_XY                   0x1B8
-#define SSPP_VIG_OP_MODE                   0x0
-#define SSPP_VIG_CSC_10_OP_MODE            0x0
-#define SSPP_TRAFFIC_SHAPER_BPC_MAX        0xFF
+
+/* SSPP_SRC_OP_MODE & OP_MODE_REC1 */
+#define MDSS_MDP_OP_DEINTERLACE            BIT(22)
+#define MDSS_MDP_OP_DEINTERLACE_ODD        BIT(23)
+#define MDSS_MDP_OP_IGC_ROM_1              BIT(18)
+#define MDSS_MDP_OP_IGC_ROM_0              BIT(17)
+#define MDSS_MDP_OP_IGC_EN                 BIT(16)
+#define MDSS_MDP_OP_FLIP_UD                BIT(14)
+#define MDSS_MDP_OP_FLIP_LR                BIT(13)
+#define MDSS_MDP_OP_BWC_EN                 BIT(0)
+#define MDSS_MDP_OP_PE_OVERRIDE            BIT(31)
+#define MDSS_MDP_OP_BWC_LOSSLESS           (0 << 1)
+#define MDSS_MDP_OP_BWC_Q_HIGH             (1 << 1)
+#define MDSS_MDP_OP_BWC_Q_MED              (2 << 1)
 
 /* SSPP_QOS_CTRL */
 #define SSPP_QOS_CTRL_VBLANK_EN            BIT(16)
@@ -96,6 +91,7 @@
 #define SSPP_QOS_CTRL_CREQ_VBLANK_OFF      20
 
 /* DPU_SSPP_SCALER_QSEED2 */
+#define SSPP_VIG_OP_MODE                   0x0
 #define SCALE_CONFIG                       0x04
 #define COMP0_3_PHASE_STEP_X               0x10
 #define COMP0_3_PHASE_STEP_Y               0x14
@@ -107,6 +103,9 @@
 #define COMP1_2_INIT_PHASE_Y               0x2C
 #define VIG_0_QSEED2_SHARP                 0x30
 
+/* SSPP_TRAFFIC_SHAPER and _REC1 */
+#define SSPP_TRAFFIC_SHAPER_BPC_MAX        0xFF
+
 /*
  * Definitions for ViG op modes
  */
@@ -128,6 +127,7 @@
 /*
  * Definitions for CSC 10 op modes
  */
+#define SSPP_VIG_CSC_10_OP_MODE            0x0
 #define VIG_CSC_10_SRC_DATAFMT BIT(1)
 #define VIG_CSC_10_EN          BIT(0)
 #define CSC_10BIT_OFFSET       4
-- 
2.39.2

