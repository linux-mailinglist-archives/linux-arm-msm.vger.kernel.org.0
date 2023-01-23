Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE301677517
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 07:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjAWGYU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 01:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjAWGYU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 01:24:20 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E83193D4
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jan 2023 22:24:18 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id g13so16650106lfv.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jan 2023 22:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zmjULO6Lx2bWV6pkSSEDxjddNWaKTXCc+6Tq6pikP+U=;
        b=YutDh5WeB6NfXcZ3hcWQgq2dByaVsZ7vVHG+GdUSj3u28nImaDR7qbiJyk5Uz9myWT
         AIAAkzE3HWrAx3EgDduZmPtOQMJgRct5gkB/UX9zhCIuavgp3HidywhNEU9GLpWEl2Ea
         FgdbO8mCFOkVx42WPWp3YREJrW8pyKtqITeTn6UdxK1mt0ZNxSDJTWUoykyY7UebDsSw
         h2+CgCOfL5GRLoYzNl3MqeJTDfrqc8X8z5ne0a1/+9DKUoizMeggOZdmdMf2Q3AsyxQH
         u4jzVWmdGlaq1BpbJs4WkAivQ+wOl0QCymxOEdN3dZ3CzheMHNYgOsUHLx0Wg9U+H4w3
         ik6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zmjULO6Lx2bWV6pkSSEDxjddNWaKTXCc+6Tq6pikP+U=;
        b=Zerd9kILw3sbZ6o1kPAWlyAekgxopGDQjiPyBRlcKkvgkYR+OlsCZmXaldYIwksUbO
         rQzKok0xVY87AgMV5g20IoSyR5DbZDQHvFhU4N+beXSSnhD7acnWaYWP7gSVDrOs224J
         grSXr3KxP+Y33jyT0+whFWkquIAhKKREov4iBDNVZx9I+v7U38GMwn7OqJ5Dcj+iQ2te
         fCsyZ70rPLrZrd36ybiZjBE+/tFvCghc3Acm3nqZIHwgOzEm8mQsJ0Um6XB0Dtyqtolv
         J1c4jCdmuMTIFchnSRXhYfjVfGcfDj62YblKAWfozc5p91IVmEyy5ooCfeP5lXSQiek8
         fwuQ==
X-Gm-Message-State: AFqh2kqeLZx4mVwvqsT5lpq9s57BrQOc2xDo+P1P3iMA7W+hXSYtU1GL
        dgp6fZD2uxdWfky3QzQ5VJLrKQ==
X-Google-Smtp-Source: AMrXdXsuF1OLKO3i/Z0WsolPfPCIAUQJ/ZfsfaSUltkM+91LW8idP/MFE+s9DJZ6rvMmKcmp+StWHA==
X-Received: by 2002:a05:6512:2305:b0:4b5:b87a:3264 with SMTP id o5-20020a056512230500b004b5b87a3264mr7370328lfu.56.1674455057129;
        Sun, 22 Jan 2023 22:24:17 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id g7-20020a056512118700b004cc885ea933sm4807775lfr.192.2023.01.22.22.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 22:24:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2] drm/msm/dpu: add missing ubwc_swizzle setting to catalog
Date:   Mon, 23 Jan 2023 08:24:15 +0200
Message-Id: <20230123062415.3027743-1-dmitry.baryshkov@linaro.org>
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

Use the values from the vendor DTs to set ubwc_swizzle in the catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Added data for sc7280 and sm8550

---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e45799e9fe49..b16e550fc4b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -580,6 +580,7 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.highest_bank_bit = 0x1,
+	.ubwc_swizzle = 0x7,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -593,6 +594,7 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -649,6 +651,7 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -675,6 +678,7 @@ static const struct dpu_mdp_cfg sc7280_mdp[] = {
 	.name = "top_0", .id = MDP_TOP,
 	.base = 0x0, .len = 0x2014,
 	.highest_bank_bit = 0x1,
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -711,6 +715,7 @@ static const struct dpu_mdp_cfg sm8550_mdp[] = {
 	.base = 0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x4330, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
-- 
2.39.0

