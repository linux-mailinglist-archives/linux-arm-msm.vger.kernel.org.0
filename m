Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4D5790FCE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Sep 2023 04:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350538AbjIDCFL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 22:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350541AbjIDCFJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 22:05:09 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6196A9
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 19:05:02 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2bccda76fb1so14814441fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 19:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693793101; x=1694397901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ND9TWls6WljGZ9WIziWPWxaNspuAqLv4XdjEfOK8lUI=;
        b=LbhPGXVjre00Z/HPi3uZa2zGwqeFY9CpP1FGxKu/DXxPpuQO2KIR2iqJxFpVpSGxTi
         I6LrbyXOK76pp78ZWzOPzJ9YElZqr8S5C4riJbtXkhHI7BfnrHTcyyaKd9XajkzjlTfW
         rvIgPQEbWBNZYzA7gmOsdHpe4x97Yjw0gIVWeistbU0p24wIvS9QuSi+drSEhytD1EgI
         EroLHWb4oPjkA9z4QPWsSRCLn7y6IB2vd2SiRDavjADeozuIj9vj/PjUuZof1HH+qNKF
         89MQ8uII7/Ng8KZZJPSfMFIJ/qVWldeQmPM70NQg3ZPzzDt5zbj6+yk2201SFWtZm3cU
         iVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693793101; x=1694397901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ND9TWls6WljGZ9WIziWPWxaNspuAqLv4XdjEfOK8lUI=;
        b=UPWfLFiC69QJDIuAqhQ9DhMfJm92dWynVOxYR761nKElkvch8YXz+fUAQlZznYW6ta
         t3WuVdxwTw2nJvOu8asGrpqhfUx7fR+ER7jS6zuvCQFKeCb/C+pn72lpegB5w2Do/CnX
         a08Y3eVWbPTuHlSbvoeXwBrGVT+37tjMr/OI00IOj/gMKuBxGdTTlMnhtRlpKFg4f0e+
         HbPbwGdhUC3UNNEoHxg3WEC02FYL1w1TnGUnwpcjGuDABzIShzHYyYHAcmnLnHT+HYht
         9MbZtidYGnP6GRYkmXwqGwLZEeTnE40Tu7xxw6uUDZmrX2Kz6faLpqXBeph8s+SgNOaF
         UiHA==
X-Gm-Message-State: AOJu0YyISlBoeAJvF5JuWRz1VFLnu4R1dDSs8vWrORBicDE8+bXJoqUg
        fnr16Tw93gw583bErAoVDefwFnxSKjKND9AdYKI=
X-Google-Smtp-Source: AGHT+IFWbfGA5SPwQb9KAW491TGzx4BsLhxrFJCHwvDlY00nbTmmGEYFV+xN3Jn9gSryCqTk/mI8/A==
X-Received: by 2002:a2e:8608:0:b0:2bc:dada:dbe0 with SMTP id a8-20020a2e8608000000b002bcdadadbe0mr6270880lji.10.1693793101188;
        Sun, 03 Sep 2023 19:05:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 19:05:00 -0700 (PDT)
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
Subject: [PATCH v3 8/8] drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init
Date:   Mon,  4 Sep 2023 05:04:54 +0300
Message-Id: <20230904020454.2945667-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As the INTF is fixed at the encoder creation time, we can move the
check whether INTF supports tearchck to dpu_encoder_phys_cmd_init().
This function can return an error if INTF doesn't have required feature.
Performing this check in dpu_encoder_phys_cmd_tearcheck_config() is less
useful, as this function returns void.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 39 +++++++++++--------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index d18236bd98e6..ca1296379c4d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -325,24 +325,21 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	unsigned long vsync_hz;
 	struct dpu_kms *dpu_kms;
 
-	if (phys_enc->has_intf_te) {
-		if (!phys_enc->hw_intf ||
-		    !phys_enc->hw_intf->ops.enable_tearcheck) {
-			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
-			return;
-		}
-
-		DPU_DEBUG_CMDENC(cmd_enc, "");
-	} else {
-		if (!phys_enc->hw_pp ||
-		    !phys_enc->hw_pp->ops.enable_tearcheck) {
-			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
-			return;
-		}
-
-		DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
+	/*
+	 * TODO: if/when resource allocation is refactored, move this to a
+	 * place where the driver can actually return an error.
+	 */
+	if (!phys_enc->has_intf_te &&
+	    (!phys_enc->hw_pp ||
+	     !phys_enc->hw_pp->ops.enable_tearcheck)) {
+		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
+		return;
 	}
 
+	DPU_DEBUG_CMDENC(cmd_enc, "intf %d pp %d\n",
+			 phys_enc->hw_intf ? phys_enc->hw_intf->idx - INTF_0 : -1,
+			 phys_enc->hw_pp ? phys_enc->hw_pp->idx - PINGPONG_0 : -1);
+
 	mode = &phys_enc->cached_mode;
 
 	dpu_kms = phys_enc->dpu_kms;
@@ -768,10 +765,20 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	phys_enc->intf_mode = INTF_MODE_CMD;
 	cmd_enc->stream_sel = 0;
 
+	if (!phys_enc->hw_intf) {
+		DPU_ERROR_CMDENC(cmd_enc, "no INTF provided\n");
+		return ERR_PTR(-EINVAL);
+	}
+
 	/* DPU before 5.0 use PINGPONG for TE handling */
 	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
 		phys_enc->has_intf_te = true;
 
+	if (phys_enc->has_intf_te && !phys_enc->hw_intf->ops.enable_tearcheck) {
+		DPU_ERROR_CMDENC(cmd_enc, "tearcheck not supported\n");
+		return ERR_PTR(-EINVAL);
+	}
+
 	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
 	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
 
-- 
2.39.2

