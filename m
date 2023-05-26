Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 957D7712314
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 11:10:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjEZJKD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 05:10:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236818AbjEZJJu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 05:09:50 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1DC119
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 02:09:48 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2af31dc49f9so5314971fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 02:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685092186; x=1687684186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lfip9WRM9noL0Gy0TC2bjz3Y0WgSk0gvAx7c/r1Jxko=;
        b=tC3msow/rYHS8fmhMtLDMTusljx5I9UlxeUipOQ+QzT+ZBCWBVBdTgzOsw8apyiVWn
         LfCicP6fAGq1Dsz6bYsGWGZOsUwQAYDHwCyiaGqge3f4jwJfgPQMU5LW4b+V33DxRNiJ
         cbC0WbRvoheZa8bc6Cto4grBIB0Un2a6u38AoLLBi7sPSf3ZQwZZjkhzSx9Kl4oPH1Yv
         kuHebrCdxIoXaG6W9nAUVjLLI8s2ukwNPTiXgI+6KBU+F5wMamkAoGcJWOdi20cnWL+c
         AVQrN7tHZ0SSQkL8NL2t9k/vP+BXrIArUjBYvXiFyc92kLBcjnzwFAF32UfAVIszKAKF
         zOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685092186; x=1687684186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lfip9WRM9noL0Gy0TC2bjz3Y0WgSk0gvAx7c/r1Jxko=;
        b=MGY4LXc/Fa2iMa4Yi8ilM/Ex8pOIDPiNLV/VZreGyBKW88CrQ8+rZKpOcnPQ03BoNS
         ZJuo+Vrb2fzOLOl/BHkf4jqlhP6biAxvNLY4d6SmgPTKVCAbuEKrBY9EPfw9lgEuEGKV
         OTqjRTOKGPNCvzbKApOBli9DshABr5l8idIb/wYMMVuYca/cJYQOgRtI8TSesNA58FzE
         ogPMe3Dp9rg/ic/tteo5KDHrisxcaL+Woy1p9cHXh/jGush6kbcDJTCl2NbhlsZYIsIh
         TDvCvIIozG1EhLRjOH8WNT5JD+WrS64XB2RAEIQ9x/P+BuozpdCTr4fWVA/1oOsJC6E2
         fcxA==
X-Gm-Message-State: AC+VfDzQFZuTc0f9q6n9h82e1Efk7vKKHEB7ukzCEIqRgGnflrMBIIV0
        yKDDV++x8Nh5fT1/s5U/K7r95g==
X-Google-Smtp-Source: ACHHUZ7nSrpogwjiwCp+uhudeJqoYumglTZ0HcqOUiICGf86YSnpKgCMPXXDYHYk5q9AWFYo7TD8Kg==
X-Received: by 2002:ac2:4855:0:b0:4f3:b6b8:dabb with SMTP id 21-20020ac24855000000b004f3b6b8dabbmr395149lfy.13.1685092186562;
        Fri, 26 May 2023 02:09:46 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004cb43eb09dfsm538992lfd.123.2023.05.26.02.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 02:09:46 -0700 (PDT)
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
Subject: [PATCH] drm/msm/dpu: use PINGPONG_NONE to unbind INTF from PP
Date:   Fri, 26 May 2023 12:09:45 +0300
Message-Id: <20230526090945.439639-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

Currently the driver passes the PINGPONG index to
dpu_hw_intf_ops::bind_pingpong_blk() callback and uses separate boolean
flag to tell whether INTF should be bound or unbound. Simplify this by
passing PINGPONG_NONE in case of unbinding and drop the flag completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 1 -
 5 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ebe34eda6e50..7fd3a13ac226 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2102,8 +2102,8 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 			if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
 				phys_enc->hw_intf->ops.bind_pingpong_blk(
-						dpu_enc->phys_encs[i]->hw_intf, false,
-						dpu_enc->phys_encs[i]->hw_pp->idx);
+						dpu_enc->phys_encs[i]->hw_intf,
+						PINGPONG_NONE);
 
 			/* mark INTF flush as pending */
 			if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 1a4c20f02312..3130c86a32cc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -66,7 +66,6 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
 		phys_enc->hw_intf->ops.bind_pingpong_blk(
 				phys_enc->hw_intf,
-				true,
 				phys_enc->hw_pp->idx);
 
 	if (phys_enc->hw_intf->ops.enable_compression)
@@ -556,8 +555,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 	if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
 		phys_enc->hw_intf->ops.bind_pingpong_blk(
 				phys_enc->hw_intf,
-				false,
-				phys_enc->hw_pp->idx);
+				PINGPONG_NONE);
 
 		ctl = phys_enc->hw_ctl;
 		ctl->ops.update_pending_flush_intf(ctl, phys_enc->intf_idx);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 3a374292f311..220020273304 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -287,7 +287,6 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	if (phys_enc->hw_intf->ops.bind_pingpong_blk)
 		phys_enc->hw_intf->ops.bind_pingpong_blk(
 				phys_enc->hw_intf,
-				true,
 				phys_enc->hw_pp->idx);
 
 	if (phys_enc->hw_pp->merge_3d)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index a2486f99d3c2..918d154848b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -268,7 +268,6 @@ static void dpu_hw_intf_setup_prg_fetch(
 
 static void dpu_hw_intf_bind_pingpong_blk(
 		struct dpu_hw_intf *intf,
-		bool enable,
 		const enum dpu_pingpong pp)
 {
 	struct dpu_hw_blk_reg_map *c = &intf->hw;
@@ -277,7 +276,7 @@ static void dpu_hw_intf_bind_pingpong_blk(
 	mux_cfg = DPU_REG_READ(c, INTF_MUX);
 	mux_cfg &= ~0xf;
 
-	if (enable)
+	if (pp != PINGPONG_NONE)
 		mux_cfg |= (pp - PINGPONG_0) & 0x7;
 	else
 		mux_cfg |= 0xf;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index 72fe907729f1..e2d15e89880d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -89,7 +89,6 @@ struct dpu_hw_intf_ops {
 	u32 (*get_line_count)(struct dpu_hw_intf *intf);
 
 	void (*bind_pingpong_blk)(struct dpu_hw_intf *intf,
-			bool enable,
 			const enum dpu_pingpong pp);
 	void (*setup_misr)(struct dpu_hw_intf *intf, bool enable, u32 frame_count);
 	int (*collect_misr)(struct dpu_hw_intf *intf, u32 *misr_value);
-- 
2.39.2

