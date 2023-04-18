Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 172506E60D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Apr 2023 14:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjDRMMS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Apr 2023 08:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbjDRMLg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Apr 2023 08:11:36 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE41A5BA5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 05:11:02 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4ec8c2907c9so2102019e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Apr 2023 05:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681819861; x=1684411861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TusSYFhXpBTw3hD+Ig+2V6T5nJHWfXxfYQbiZRqJGNM=;
        b=qMjBZA6z4JwNv9nrY6ZukrVlV+5UNrtliICVTRHPh2CGw8TS41gty9nTL35MX8JJYC
         BV/AGuAdODhe4i8kD0urhXqyIxDomSAZfMUwiJaDRULOVXEtLJ3C83xJWgzTyAb8ItSi
         VaidmBVR8YcdgSk+NgWd+3aCzzIz2J4Mu8u0fN4KOTDxoIBQ6G6WGy0X7jXB/nQ4NUbR
         2yThvJC/cZpurp7BZqr8f99Mclucd1PkJu1RE+8Te0Zm9yAZ0c/hH0U/HvwEllyF+8cg
         M6AalA1t0wbUQwceXnEmIvRoGohFNuPFXkQchMgdco4WH4PARnSVKsLMs3h9f7DWJPLm
         HETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681819861; x=1684411861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TusSYFhXpBTw3hD+Ig+2V6T5nJHWfXxfYQbiZRqJGNM=;
        b=L/UhM4hKzxD7t2zzPOGqp3AzV7xrf/dTb6ZdycctMHHByJNmcV30s7ZHzam5xex97f
         rxnHIUq+lHNrlXzeaUNT/nlgzi3Rop1XBSe5NLmH3N8t7PI3xdEmZ9XFhaPsUwas67Qu
         ONuAbMwaxtQUd8M6z4/zQPEWLVSWtYF8/zOdb0L5mr4hZs7RiFaQBGX5YCr3qgSFzDz1
         0Va0+cfdf5cUmpok3Wd4b+NW9pFY2o2VRb0VuQc2GJp+W5Uz9JqEC3ThtacBy8DnJhQX
         gFF1NN0ZIa9KnyJRFqG5jOsWstCaLmszsnW58r3UttTkQ9vDkR7eZpPhGIWiW/HroVOm
         gSjg==
X-Gm-Message-State: AAQBX9dnXGLuz5TKALg5qVfk8pzhXhyfOTVPsQYPHKkFieAiMEL8COWv
        Ntjp+S8ML5aaR6NSskpKp79ASw==
X-Google-Smtp-Source: AKy350YFUr7D3ZA8FFCg0jBRLCUecF1TE4KPX3EM0XpcwN/O7LigF3RcuDV8Htc9b1S2Ec40qe9zRA==
X-Received: by 2002:ac2:4556:0:b0:4ea:f636:6d02 with SMTP id j22-20020ac24556000000b004eaf6366d02mr2287331lfm.18.1681819860976;
        Tue, 18 Apr 2023 05:11:00 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id q17-20020a19a411000000b004d86808fd33sm2365895lfc.15.2023.04.18.05.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 05:11:00 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 18 Apr 2023 14:10:57 +0200
Subject: [PATCH v2 2/5] drm/msm/dpu1: Rename path references to mdp_path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230417-topic-dpu_regbus-v2-2-91a66d04898e@linaro.org>
References: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v2-0-91a66d04898e@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681819856; l=3187;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=RHVX4b0dy7ygKXk/64XZDOzn26jUEVt2/m6N5KVO6Vs=;
 b=r2TFBVO5Hj5SdRdHTZ0YLUP9sN8AtEd+o8gl6ja50IX5vktPr9lMiBBhBuvVF1QlIRM+I182r2iE
 3e7I94N5DkppyOmS4WSIUeWXQZcRNBW8stdmAZtfC7dB3OlvbPvx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DPU1 driver needs to handle all MDPn<->DDR paths, as well as
CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
calculated, but the latter one has static predefines spanning all SoCs.

In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
the path-related struct members to include "mdp_".

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 1d9d83d7b99e..349c6cb3301d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -230,18 +230,18 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 
 			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
 				  tmp_crtc->base.id,
-				  dpu_cstate->new_perf.bw_ctl, kms->num_paths);
+				  dpu_cstate->new_perf.bw_ctl, kms->num_mdp_paths);
 		}
 	}
 
-	if (!kms->num_paths)
+	if (!kms->num_mdp_paths)
 		return 0;
 
 	avg_bw = perf.bw_ctl;
-	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
+	do_div(avg_bw, (kms->num_mdp_paths * 1000)); /*Bps_to_icc*/
 
-	for (i = 0; i < kms->num_paths; i++)
-		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
+	for (i = 0; i < kms->num_mdp_paths; i++)
+		icc_set_bw(kms->mdp_path[i], avg_bw, perf.max_per_pipe_ib);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 0e7a68714e9e..dd6c1c40ab9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -397,12 +397,12 @@ static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
-	dpu_kms->path[0] = path0;
-	dpu_kms->num_paths = 1;
+	dpu_kms->mdp_path[0] = path0;
+	dpu_kms->num_mdp_paths = 1;
 
 	if (!IS_ERR_OR_NULL(path1)) {
-		dpu_kms->path[1] = path1;
-		dpu_kms->num_paths++;
+		dpu_kms->mdp_path[1] = path1;
+		dpu_kms->num_mdp_paths++;
 	}
 	return 0;
 }
@@ -1238,8 +1238,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 	dev_pm_opp_set_rate(dev, 0);
 	clk_bulk_disable_unprepare(dpu_kms->num_clocks, dpu_kms->clocks);
 
-	for (i = 0; i < dpu_kms->num_paths; i++)
-		icc_set_bw(dpu_kms->path[i], 0, 0);
+	for (i = 0; i < dpu_kms->num_mdp_paths; i++)
+		icc_set_bw(dpu_kms->mdp_path[i], 0, 0);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index aca39a4689f4..d5d9bec90705 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -109,8 +109,8 @@ struct dpu_kms {
 	 * when disabled.
 	 */
 	atomic_t bandwidth_ref;
-	struct icc_path *path[2];
-	u32 num_paths;
+	struct icc_path *mdp_path[2];
+	u32 num_mdp_paths;
 };
 
 struct vsync_info {

-- 
2.40.0

