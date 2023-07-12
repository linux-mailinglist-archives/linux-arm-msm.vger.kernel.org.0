Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2B9751342
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 00:11:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232415AbjGLWLr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 18:11:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232382AbjGLWLp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 18:11:45 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638C61FEE
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:43 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fb7373dd35so1636473e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689199901; x=1689804701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjoI3Dx1Y7JEO/QjjX2Gq34JkRG4tKXD0+CPY31Fy3E=;
        b=j0/D7wxA4iyH+b7ICVgO4R7WWGxeJrcBs3PzaFpHruiCWDmfPgpDC5T5dTiwIfz5ze
         teLLgrvkNHULKDrJHgFVYNH5eqUqVq83KVjzTK62+f/2co38A97/vGpm4gtB7dOkby4e
         X/HyQKcFUdtCxebjznnsaJpiEew17IehcpPRwB8e9ysJMJoCfWx82qTLDkc5D2grgwUX
         IkYwLPNQ4R9EcS2byO0LIy2dksKIbg6fwoK3QMjiw7UMfdcjT8xhMIkhSOQ142eKSBe5
         o+MOhfgiUYK4FGViGv+oe+KZcQMz3O8TDAgr/kcWz4i5/jiEGKHG4u3goqELBJuCGYLK
         L/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689199901; x=1689804701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjoI3Dx1Y7JEO/QjjX2Gq34JkRG4tKXD0+CPY31Fy3E=;
        b=Yi8Dh/0jrUMkYw8Y/sYaCmH6a4AJIVm6xb7CQvzoWILC3sHHTDAw2yLmfxdlNPA8rW
         MAH2gKxEAFUFuhD8ohvFd/3lIjCaMAI5i6wvvf/uMHOsK06iNuzEhN79FfvkMLezb7E+
         wXH/F37/jQ4nUoeU9Vfr5EpjLS8FtaIFnQSNZ8cN2IvN8UtYSGToLhaDN5Nz3goAUxHs
         X41GtDY6q/DQ/qNOkQH0fDiC4p4tTRDx6tW9eZJGFAaN38sAp8DSDSTpl+sMGh3kmRHZ
         SplPS+GuE84SbLMsrTPnm2nkhV+Adb5bSaqItCkaJc9fokSeYwuDG6JgkjRaOdf8ZcrZ
         N1kA==
X-Gm-Message-State: ABy/qLZryzdMJ3nPW+L2tIewAGMOTytqqQSzsTW8tjdP+Jp9KoA+R6SY
        GjjrSrjOKENfk98LEkmjwSAVjQ==
X-Google-Smtp-Source: APBJJlFXWUYjQidB1ObvXIK2k2OVBloUYCnZ3YxIu1veI2yPlLZehMX4vOhmglglknfvr10Tu37Q/A==
X-Received: by 2002:a05:6512:3f18:b0:4f8:6e50:d6d0 with SMTP id y24-20020a0565123f1800b004f86e50d6d0mr1217938lfa.31.1689199901809;
        Wed, 12 Jul 2023 15:11:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 15:11:41 -0700 (PDT)
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
Subject: [PATCH v4 02/11] drm/msm/dpu: core_perf: extract bandwidth aggregation function
Date:   Thu, 13 Jul 2023 01:11:30 +0300
Message-Id: <20230712221139.313729-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation to refactoring the dpu_core_perf debugfs interface,
extract the bandwidth aggregation function from
_dpu_core_perf_crtc_update_bus().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 39 +++++++++++--------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 1d9d83d7b99e..333dcfe57800 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -206,33 +206,38 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	return 0;
 }
 
-static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
-		struct drm_crtc *crtc)
+static void dpu_core_perf_aggregate(struct drm_device *ddev,
+				    enum dpu_crtc_client_type curr_client_type,
+				    struct dpu_core_perf_params *perf)
 {
-	struct dpu_core_perf_params perf = { 0 };
-	enum dpu_crtc_client_type curr_client_type
-					= dpu_crtc_get_client_type(crtc);
-	struct drm_crtc *tmp_crtc;
 	struct dpu_crtc_state *dpu_cstate;
-	int i, ret = 0;
-	u64 avg_bw;
+	struct drm_crtc *tmp_crtc;
 
-	drm_for_each_crtc(tmp_crtc, crtc->dev) {
+	drm_for_each_crtc(tmp_crtc, ddev) {
 		if (tmp_crtc->enabled &&
-			curr_client_type ==
-				dpu_crtc_get_client_type(tmp_crtc)) {
+		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
 			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
 
-			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
-					dpu_cstate->new_perf.max_per_pipe_ib);
+			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
+						    dpu_cstate->new_perf.max_per_pipe_ib);
 
-			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
+			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
 
-			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
-				  tmp_crtc->base.id,
-				  dpu_cstate->new_perf.bw_ctl, kms->num_paths);
+			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
+					 tmp_crtc->base.id,
+					 dpu_cstate->new_perf.bw_ctl);
 		}
 	}
+}
+
+static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
+		struct drm_crtc *crtc)
+{
+	struct dpu_core_perf_params perf = { 0 };
+	int i, ret = 0;
+	u64 avg_bw;
+
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
 	if (!kms->num_paths)
 		return 0;
-- 
2.39.2

