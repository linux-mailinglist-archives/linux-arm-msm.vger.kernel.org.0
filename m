Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 909977474C2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 17:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231574AbjGDPED (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 11:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbjGDPEC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 11:04:02 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC0D10D8
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 08:04:01 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b69923a715so88381781fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 08:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688483039; x=1691075039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVBXyrFdIkopLRLb6Grc/paJlGJi3BPT4fGEsbFMO5s=;
        b=vTYFTcqwoKzA37LP5kgGmv6Q7MRWkJfDdwM7uA8r4nDoNW+Hrgj+/qCCeq2AYgjTET
         0Z1tva04iVqfMd3+9tpP2PFQAk9FVoewnyUv62qKTuE6h4NCxXj9my66W/NkgWXiDQ9T
         MXGhapOakDmtksqQP/wJz5d3YBeTHjrfe+eSlWaQlifC5wY2EIRWS5ipOnA3N4bDAlpa
         rShvvgItPSylTcy9GYoVMhMdThAlqeP0Ji/Rsso6pFskQekfImZk8uU4a+oeNgY5tLw8
         75Lcxn0qrIQN9tVR0MS7vE5qSmWm4fTR2Fi4mjn3Q3UfCl8ZAhQndiVF5PnCgc7xeJ+K
         AVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688483039; x=1691075039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVBXyrFdIkopLRLb6Grc/paJlGJi3BPT4fGEsbFMO5s=;
        b=BudSj2+2drB28r5MKOsYR2TALr497hvBnL/hERqPVocsWSRfw0JiFHustDu0OKYJPI
         d84G2QzfKHXJMR4X1PihSpESW2Redm3G1plf+7cP1OWcKUWhENEMT+UptTa6XXQBvKEy
         uKK357gFi9XrhOZA3Ua/V5YO7JHIzjAAVH2c8rcDyopC6608ilpQ41AMENCFg51cZK9y
         0mqrtXfS3Zr3taNbogvuknT0bygQXW2Aaa9+9BIR7a8Y1jNrRtXM7ApcD1EQfaWpVdCL
         CJfuyGznRpzNIsjF4eArveMljyYSwSm7oXTeBeVCUt05b+4m6OtusxKViG+zv1+CVK+/
         +CMw==
X-Gm-Message-State: ABy/qLYTUehnKDkith2cDlc1uv0vrfQZ5RBGEv4Hub2oNRsU8nGUcmpM
        bywlQLzrgAaSwy5R9fzcRDgaoA==
X-Google-Smtp-Source: APBJJlFhs2TWohEyXM7WfY4+XrDHcNsc3HfHMCZncPI2bnOYUqpoQNfNoCXKOKQ8rK8aDHVYQz7gtw==
X-Received: by 2002:a2e:90c2:0:b0:2b6:ac18:aaae with SMTP id o2-20020a2e90c2000000b002b6ac18aaaemr10376531ljg.11.1688483039460;
        Tue, 04 Jul 2023 08:03:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:03:59 -0700 (PDT)
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
Subject: [PATCH v2 05/14] drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()
Date:   Tue,  4 Jul 2023 18:03:45 +0300
Message-Id: <20230704150354.159882-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
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

Move perf mode handling for the bandwidth to
_dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
and then aggregating known values.

Note, this changes the fix_core_ab_vote. Previously it would be
multiplied per the CRTC number, now it will be used directly for
interconnect voting.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 37 +++++++++----------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 348550ac7e51..42c03a5f1f3e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -116,21 +116,9 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 		return;
 	}
 
-	memset(perf, 0, sizeof(struct dpu_core_perf_params));
-
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
-		perf->bw_ctl = 0;
-		perf->max_per_pipe_ib = 0;
-		perf->core_clk_rate = 0;
-	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		perf->bw_ctl = kms->perf.fix_core_ab_vote;
-		perf->max_per_pipe_ib = kms->perf.fix_core_ib_vote;
-		perf->core_clk_rate = kms->perf.fix_core_clk_rate;
-	} else {
-		perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
-		perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
-		perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
-	}
+	perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
+	perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
+	perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
 
 	DRM_DEBUG_ATOMIC(
 		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
@@ -236,17 +224,28 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	struct dpu_core_perf_params perf = { 0 };
 	int i, ret = 0;
 	u32 avg_bw;
+	u32 peak_bw;
 
 	if (!kms->num_paths)
 		return 0;
 
-	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
+		avg_bw = 0;
+		peak_bw = 0;
+	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
+		avg_bw = kms->perf.fix_core_ab_vote;
+		peak_bw = kms->perf.fix_core_ib_vote;
+	} else {
+		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
+		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
+		peak_bw = perf.max_per_pipe_ib;
+	}
 
-	avg_bw = perf.bw_ctl;
-	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
+	avg_bw /= kms->num_paths;
 
 	for (i = 0; i < kms->num_paths; i++)
-		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
+		icc_set_bw(kms->path[i], avg_bw, peak_bw);
 
 	return ret;
 }
-- 
2.39.2

