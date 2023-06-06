Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 485DB723BDE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 10:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236741AbjFFIdr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 04:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236758AbjFFIdn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 04:33:43 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434E4E6E
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 01:33:15 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-30ae4ec1ac7so4565306f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 01:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686040388; x=1688632388;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGNvezJMXfjn7ToqqZuXUFZItGnK+ZI8rSYUZp66fL0=;
        b=ebW+dZ4PFwVmuzs+A/1mErcEfwlk42eaHMnN0FTXdU4DToHNMqjg4hps7BaomOmmnG
         ULeztuZ667nKmYkB8ryIIMId0Ya0i1cXnLd/2Jms6MjS7sKP1cyJAOU6jeF085HhLoTY
         lRn40UYUUe074EBieFDm8LmII0z3VjGADQOBO416duu0D4HLC/dxSxgOShk3e9tnQu6G
         z7cIOOTpWmTUCCKwHUfk/AY8KznVOufjFOyrDOcxDNKRzEAmuKQ+1SEEhsDwkOAvnlKK
         SOeWPzLVkwYxz5X6SCq/3oB97ZfRVn3MS5PjBh6rNiLAom3mBQQdr8q4n7gRCRwvF5dc
         wi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686040388; x=1688632388;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HGNvezJMXfjn7ToqqZuXUFZItGnK+ZI8rSYUZp66fL0=;
        b=A+LiT1gad1CtN+4TrfTUF3x3LcdLHWy7IlmEDagYHMK584UAndy34kVCgnfLo5y81E
         coAZwCB3YSrrgMifDemy1H34SNAuKCd8yLcOvN34tBUE+FB/8QMgAw0tmOM4YcFbfHNc
         Bl9HyVlWhUVz/c1g5YdeVnQsWuZE2sj+KoiO4iox7JEkqpGEzYgb+9fBdBpQdLeGIr20
         Ym95sVVbJYjcIhFWzOCCQFu8w47zW3+4725FiCr5Ngbn8tL5Ksh8cLWFkuTRxSeBaco8
         /2FTOX7cxz/FyhrcFTRP+6dx0ed0ZLK+WfkJGG/OMtnpv3lA37HCd7OSkr3/28daAIOD
         WGlA==
X-Gm-Message-State: AC+VfDw3OTklzN/mYRx98W1n29ppmRrYwU9lPaq+PyGLjR20QtvKaNBQ
        01yugnQbkqL4vXCVgwl9Pb5ZeA==
X-Google-Smtp-Source: ACHHUZ69J8r5vJcWEWXn2VmWqlCRB7PTWJZj88krqf7/cGT0YE5tj+fKqFHTvwx1gzn5SpOc8uSZ5g==
X-Received: by 2002:adf:fccb:0:b0:30c:2bbf:bf75 with SMTP id f11-20020adffccb000000b0030c2bbfbf75mr1071217wrs.26.1686040388227;
        Tue, 06 Jun 2023 01:33:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l24-20020a1ced18000000b003f31cb7a203sm13443342wmh.14.2023.06.06.01.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:33:07 -0700 (PDT)
Date:   Tue, 6 Jun 2023 11:33:03 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm/dpu: tidy up some error checking
Message-ID: <ZH7vP2Swu8CYpgUL@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "vsync_hz" variable is unsigned int so it can't be less
than zero.  The dpu_kms_get_clk_rate() function used to return a u64
but I previously changed it to return an unsigned long and zero on
error so it matches clk_get_rate().

Change the "vsync_hz" type to unsigned long as well and change the
error checking to check for zero instead of negatives.  This change
does not affect runtime at all.  It's just a clean up.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index d8ed85a238af..6aecaba14e7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -324,7 +324,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	struct dpu_hw_tear_check tc_cfg = { 0 };
 	struct drm_display_mode *mode;
 	bool tc_enable = true;
-	u32 vsync_hz;
+	unsigned long vsync_hz;
 	struct dpu_kms *dpu_kms;
 
 	if (phys_enc->has_intf_te) {
@@ -359,8 +359,8 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	 * frequency divided by the no. of rows (lines) in the LCDpanel.
 	 */
 	vsync_hz = dpu_kms_get_clk_rate(dpu_kms, "vsync");
-	if (vsync_hz <= 0) {
-		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %u\n",
+	if (!vsync_hz) {
+		DPU_DEBUG_CMDENC(cmd_enc, "invalid - vsync_hz %lu\n",
 				 vsync_hz);
 		return;
 	}
@@ -381,7 +381,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	tc_cfg.rd_ptr_irq = mode->vdisplay + 1;
 
 	DPU_DEBUG_CMDENC(cmd_enc,
-		"tc vsync_clk_speed_hz %u vtotal %u vrefresh %u\n",
+		"tc vsync_clk_speed_hz %lu vtotal %u vrefresh %u\n",
 		vsync_hz, mode->vtotal, drm_mode_vrefresh(mode));
 	DPU_DEBUG_CMDENC(cmd_enc,
 		"tc enable %u start_pos %u rd_ptr_irq %u\n",
-- 
2.39.2

