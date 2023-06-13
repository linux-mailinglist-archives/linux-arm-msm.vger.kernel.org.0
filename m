Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B41E72D658
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 02:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239494AbjFMAVS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 20:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239509AbjFMAVD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 20:21:03 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724CA1FEE
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:16:14 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b1b66a8fd5so58329361fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686615299; x=1689207299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUCljY54Ij62McPnq0z5nAUMfwrJa995R+QcNnilpzs=;
        b=HRnN39XmMxADcgsQ4UsoJKdnb5PupGSLkU8BYR5nbPIWydUvXIVDTLesrEq/RNBodP
         w2SccNj2n0A8cz4ojOHmKKaSxFtqyf2yJc/Uxk5Q9YWSPZPCx4QOO2ZPZlw4pMqFVyBG
         E7qfCv1KiP/Bh2q3/0Y6VA1E1VOnOzR2uu6BTOiU23V63m6kVuofNGHSYnpTijhFLz0F
         WUxJ2nYcK5sxlxsj/+HHvoqTX1CRkrCmovZFnrGGBVBGmHZVCp9yvgoOuTHzT4hw/74+
         3C28oXPupcb9QZr4/dMnR0KOM9VciVrhV0qRaOj3wW2e+GF+JlWuNQdK1G7FRkfseHde
         ipkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686615299; x=1689207299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gUCljY54Ij62McPnq0z5nAUMfwrJa995R+QcNnilpzs=;
        b=gQmvajexR8N2T39H6H6hd7cizW44gA3z0B+/1JdZtQL4z8sTFWOp8mhkIvdZ+lUVNA
         djPPXzN0o3SuJBNqfziNkzRY1yezww4XTfsn0AwBdSvXA7m6ghe2dtbrHf08u6CUTiyN
         dn9s6oPEb8FMAZFXuEsdgs1f6xViidxuf6fAn1rkT37zwOhUUhq049xC7nQwFSWKh5xW
         J+KdkxQbq1/flCUfSf+L1kmtv9JhS6c2MxlNlDIz0EHlcGfiuuTsvjH3kQp38HCBR4uG
         P9mCGfMTKin4SNpr9vsnSMXaAjjmNwZOgwm3a0kXgT9gv2dv4bsmh2OLSZRWy1yetc+B
         NLtw==
X-Gm-Message-State: AC+VfDxZwqxUpLmntE0/TMQSgWsqhe3EJ6IndMEC1KrCAxFzTQfUNyhI
        bBEdoEAxLlP0yR8EcayZ2HQy5A==
X-Google-Smtp-Source: ACHHUZ6h245In3U7zl4A+OAnezGSXs0aQyBOgAKWeJLrmUYwHYlHLlAnLZ9DWTR7QEgLzFFwpGnXIw==
X-Received: by 2002:a2e:8609:0:b0:2b1:bd11:a71f with SMTP id a9-20020a2e8609000000b002b1bd11a71fmr3688278lji.41.1686615299144;
        Mon, 12 Jun 2023 17:14:59 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v10-20020a2e960a000000b002adbe01cd69sm1961999ljh.9.2023.06.12.17.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 17:14:58 -0700 (PDT)
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
Subject: [PATCH v2 22/22] drm/msm/dpu: drop empty features mask INTF_SDM845_MASK
Date:   Tue, 13 Jun 2023 03:14:53 +0300
Message-Id: <20230613001453.3427024-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The INTF_SDM845_MASK features mask is zero. Drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 2 --
 3 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index d78cedd35c01..060e6a49b2f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -246,7 +246,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 21,
@@ -256,7 +255,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 21,
@@ -266,7 +264,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 21,
@@ -276,7 +273,6 @@ static const struct dpu_intf_cfg msm8998_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_HDMI,
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index de26f469ebb1..54d7475e1591 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -260,7 +260,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
 		.base = 0x6a000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -270,7 +269,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
@@ -280,7 +278,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DSI,
 		.controller_id = MSM_DSI_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
@@ -290,7 +287,6 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x280,
-		.features = INTF_SDM845_MASK,
 		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 4a18fc66a412..3efa22429e5f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -95,8 +95,6 @@
 
 #define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
 
-#define INTF_SDM845_MASK (0)
-
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
 	 BIT(DPU_INTF_TE) | \
-- 
2.39.2

