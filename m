Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 712D038AEB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 14:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239106AbhETMom (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 08:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242306AbhETMnv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 08:43:51 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC789C056495
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 05:03:11 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id r12so17403219wrp.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 May 2021 05:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+O8/a75/EGow+S0U9CZ37LWYZF774zelw+e2XQOlCh4=;
        b=gsBnLdFU3oWNrhBa7vRRPNx39MdLikfhn452GGaIU18fvdoduwwMRM9C+jHWfpHLG9
         asVi6CrO78KKTlAiG+ngvTFyUgyaBK40x+j1EFFzYUN/gBT5MLGRT+o3S4rM1KUhRDNr
         VNRGo+47UnuHxYBOnz7SDcKktAUQGAqmGiitTy1r8G7PmSeABWb7xpVQoaSHH6X2mn/D
         uk17KLc0dTNLuTb/hq/d4/0mrcwHCwbAUkvEDihJd275xN3cauoi+RLBNzzOCdoeXkxn
         /Lnz5++iI42RAKRrYhhgjk/uarilYfwMpXYh6Hm84M1L9gH/+vRrAnjNFWoyOxTqmOQA
         iCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+O8/a75/EGow+S0U9CZ37LWYZF774zelw+e2XQOlCh4=;
        b=eZEzf0UWgfbwg+UahYe/loWysjnsxrdMN2XVTrLEqmlbkTvJgNaeqKASZoT3y2UD5L
         41d/xj9nbHO6q8AIR2oRdxdFDcViq1tqTVOzHRg1ssfkVS6DM056rRWYLiMyjlhhHl+X
         jnGMVDUuvX2cLywSbqgbcxpDKXgZg3gQRuiFg13dO574+7uE8L5+u6VDAh1lRBNGuZ9V
         I+5wjZ6qMYSQL+2vmoJQoqLKU/e98aG88/7+SQQQbNc9Bt6sHSgqoplDbL/w9imFp/5J
         c4Rbj4/Yz8JVboJmWeUWRjQTdLzS+XOmfU55If5WwrqGfE3Keo6d8RMm/mZMPrj9KLsJ
         Sp8A==
X-Gm-Message-State: AOAM532mnqlftsKvYatIonpeB+qtYd8GMTsWw4z1MNq7oSo3xGdvlz6E
        hInuNHYw9jYkhODqPLiLumCs0w==
X-Google-Smtp-Source: ABdhPJywOjK6LWPAbdN260/ypqhrfZeMF3DGR/bIZOUiENHJWFfNcRpEc9oztHcV087mXa+zxKX92Q==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr4037940wrt.189.1621512190493;
        Thu, 20 May 2021 05:03:10 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:03:10 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 18/38] drm/msm/disp/dpu1/dpu_hw_interrupts: Demote a bunch of kernel-doc abuses
Date:   Thu, 20 May 2021 13:02:28 +0100
Message-Id: <20210520120248.3464013-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:17: warning: expecting prototype for Register offsets in MDSS register file for the interrupt registers(). Prototype was for MDP_SSPP_TOP0_OFF() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:35: warning: expecting prototype for WB interrupt status bit definitions(). Prototype was for DPU_INTR_WB_0_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:42: warning: expecting prototype for WDOG timer interrupt status bit definitions(). Prototype was for DPU_INTR_WD_TIMER_0_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:51: warning: expecting prototype for Pingpong interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_0_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:71: warning: expecting prototype for Interface interrupt status bit definitions(). Prototype was for DPU_INTR_INTF_0_UNDERRUN() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:85: warning: expecting prototype for Pingpong Secondary interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:94: warning: expecting prototype for Pingpong TEAR detection interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_0_TEAR_DETECTED() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:102: warning: expecting prototype for Pingpong TE detection interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_0_TE_DETECTED() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:110: warning: expecting prototype for Ctl start interrupt status bit definitions(). Prototype was for DPU_INTR_CTL_0_START() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:119: warning: expecting prototype for Concurrent WB overflow interrupt status bit definitions(). Prototype was for DPU_INTR_CWB_2_OVERFLOW() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:125: warning: expecting prototype for Histogram VIG done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_VIG_0_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:133: warning: expecting prototype for Histogram VIG reset Sequence done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_VIG_0_RSTSEQ_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:141: warning: expecting prototype for Histogram DSPP done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_DSPP_0_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:149: warning: expecting prototype for Histogram DSPP reset Sequence done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:157: warning: expecting prototype for INTF interrupt status bit definitions(). Prototype was for DPU_INTR_VIDEO_INTO_STATIC() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:170: warning: expecting prototype for AD4 interrupt status bit definitions(). Prototype was for DPU_INTR_BACKLIGHT_UPDATED() instead

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krishna Manikandan <mkrishn@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 48c96b8121268..aaf251741dc27 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -10,7 +10,7 @@
 #include "dpu_hw_util.h"
 #include "dpu_hw_mdss.h"
 
-/**
+/*
  * Register offsets in MDSS register file for the interrupt registers
  * w.r.t. to the MDP base
  */
@@ -29,14 +29,14 @@
 #define MDP_INTF_1_OFF_REV_7xxx             0x35000
 #define MDP_INTF_5_OFF_REV_7xxx             0x39000
 
-/**
+/*
  * WB interrupt status bit definitions
  */
 #define DPU_INTR_WB_0_DONE BIT(0)
 #define DPU_INTR_WB_1_DONE BIT(1)
 #define DPU_INTR_WB_2_DONE BIT(4)
 
-/**
+/*
  * WDOG timer interrupt status bit definitions
  */
 #define DPU_INTR_WD_TIMER_0_DONE BIT(2)
@@ -45,7 +45,7 @@
 #define DPU_INTR_WD_TIMER_3_DONE BIT(6)
 #define DPU_INTR_WD_TIMER_4_DONE BIT(7)
 
-/**
+/*
  * Pingpong interrupt status bit definitions
  */
 #define DPU_INTR_PING_PONG_0_DONE BIT(8)
@@ -65,7 +65,7 @@
 #define DPU_INTR_PING_PONG_2_AUTOREFRESH_DONE BIT(22)
 #define DPU_INTR_PING_PONG_3_AUTOREFRESH_DONE BIT(23)
 
-/**
+/*
  * Interface interrupt status bit definitions
  */
 #define DPU_INTR_INTF_0_UNDERRUN BIT(24)
@@ -79,7 +79,7 @@
 #define DPU_INTR_INTF_3_VSYNC BIT(31)
 #define DPU_INTR_INTF_5_VSYNC BIT(23)
 
-/**
+/*
  * Pingpong Secondary interrupt status bit definitions
  */
 #define DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE BIT(0)
@@ -88,7 +88,7 @@
 #define DPU_INTR_PING_PONG_S0_TEAR_DETECTED BIT(22)
 #define DPU_INTR_PING_PONG_S0_TE_DETECTED BIT(28)
 
-/**
+/*
  * Pingpong TEAR detection interrupt status bit definitions
  */
 #define DPU_INTR_PING_PONG_0_TEAR_DETECTED BIT(16)
@@ -96,7 +96,7 @@
 #define DPU_INTR_PING_PONG_2_TEAR_DETECTED BIT(18)
 #define DPU_INTR_PING_PONG_3_TEAR_DETECTED BIT(19)
 
-/**
+/*
  * Pingpong TE detection interrupt status bit definitions
  */
 #define DPU_INTR_PING_PONG_0_TE_DETECTED BIT(24)
@@ -104,7 +104,7 @@
 #define DPU_INTR_PING_PONG_2_TE_DETECTED BIT(26)
 #define DPU_INTR_PING_PONG_3_TE_DETECTED BIT(27)
 
-/**
+/*
  * Ctl start interrupt status bit definitions
  */
 #define DPU_INTR_CTL_0_START BIT(9)
@@ -113,13 +113,13 @@
 #define DPU_INTR_CTL_3_START BIT(12)
 #define DPU_INTR_CTL_4_START BIT(13)
 
-/**
+/*
  * Concurrent WB overflow interrupt status bit definitions
  */
 #define DPU_INTR_CWB_2_OVERFLOW BIT(14)
 #define DPU_INTR_CWB_3_OVERFLOW BIT(15)
 
-/**
+/*
  * Histogram VIG done interrupt status bit definitions
  */
 #define DPU_INTR_HIST_VIG_0_DONE BIT(0)
@@ -127,7 +127,7 @@
 #define DPU_INTR_HIST_VIG_2_DONE BIT(8)
 #define DPU_INTR_HIST_VIG_3_DONE BIT(10)
 
-/**
+/*
  * Histogram VIG reset Sequence done interrupt status bit definitions
  */
 #define DPU_INTR_HIST_VIG_0_RSTSEQ_DONE BIT(1)
@@ -135,7 +135,7 @@
 #define DPU_INTR_HIST_VIG_2_RSTSEQ_DONE BIT(9)
 #define DPU_INTR_HIST_VIG_3_RSTSEQ_DONE BIT(11)
 
-/**
+/*
  * Histogram DSPP done interrupt status bit definitions
  */
 #define DPU_INTR_HIST_DSPP_0_DONE BIT(12)
@@ -143,7 +143,7 @@
 #define DPU_INTR_HIST_DSPP_2_DONE BIT(20)
 #define DPU_INTR_HIST_DSPP_3_DONE BIT(22)
 
-/**
+/*
  * Histogram DSPP reset Sequence done interrupt status bit definitions
  */
 #define DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE BIT(13)
@@ -151,7 +151,7 @@
 #define DPU_INTR_HIST_DSPP_2_RSTSEQ_DONE BIT(21)
 #define DPU_INTR_HIST_DSPP_3_RSTSEQ_DONE BIT(23)
 
-/**
+/*
  * INTF interrupt status bit definitions
  */
 #define DPU_INTR_VIDEO_INTO_STATIC BIT(0)
@@ -164,7 +164,7 @@
 #define DPU_INTR_DSICMD_2_OUTOF_STATIC BIT(7)
 #define DPU_INTR_PROG_LINE BIT(8)
 
-/**
+/*
  * AD4 interrupt status bit definitions
  */
 #define DPU_INTR_BACKLIGHT_UPDATED BIT(0)
-- 
2.31.1

