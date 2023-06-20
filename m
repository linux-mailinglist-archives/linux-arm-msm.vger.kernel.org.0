Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3B5E73606F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 02:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjFTAIz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 20:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjFTAIy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 20:08:54 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 598D61AD
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:53 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so5278985e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687219731; x=1689811731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKz3aPcvu88ndrPcwjSI+B/SE8s8qt07goFGX5AqgwQ=;
        b=sCn3fMK5PWqoZRrB1BJJQpMJPJ4bfisEXydpsJ39eswCZwCFe3E5b6GTWY+xUrHkz3
         ZHZdFBWSTvMd80/i4iqFYLuGPda9mb4X+T95Ga0+2R741qJGBwWWLnLaJnsqX3n98fNb
         H4Ek7xsQOJUF9Y7Ipvwa0sFOelSaAjq0Nny3LzCO052vqJGWOliCfYNrKYp0YBJt7hvc
         aBl/dQ8diey+7xePjhi3pDTtXWA0u7+1rYiAjD1XOiiPCtuYj1BNGECNQOLWOUmA6q+h
         GWvlbJRyt3DgV16EV10XHSbju2LKolHVI46GuTt50OvfGBiM1c9TFbn79SEuww5waO0h
         Vu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687219731; x=1689811731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKz3aPcvu88ndrPcwjSI+B/SE8s8qt07goFGX5AqgwQ=;
        b=Yl4pfQveoc1phYMki9jXVvmDATbUkKI4THhYBGr+uHeUN0GDrJZfapTm6Gjza51J4a
         BMc+bicBJxTvqqm/4IqrWxvBE0LnjWbECPLEkVC3asQs5Ttm/UhJLGPTTLh2S0yQTnqA
         Jkj/mBNVE36Oi1UOrkKsS1mh2grlqM/mPTrk5REoYXpPuPBgpjfrra6b2XBV/NkMt3dH
         Qz3Dv4fXghjtxREKdnKHBSL9ecdQfEvkHTGpBVmB3/sXwrf6H7LN9FKNXMol6fCl7eW3
         70fwZtJiTunD5LwmNNQS7OacOXEoiBG3Dvv5rXG5lXoC/iJG7cIdHWqR+Y/10HzLIPFM
         f1ig==
X-Gm-Message-State: AC+VfDyNj0hxIzjRo1eaHaIdKJxQEnWIBsURgRdrxTf3svPlzKBa5jsq
        c0NoVIUszVbUS+2kC/V9V9ZkSA==
X-Google-Smtp-Source: ACHHUZ6kO2vkAtjubl3pvT0jhwPW+CgToJuLbejT31lLJzCC1jE3xw5d29Pvs0BKb8qnxJUrPapyXg==
X-Received: by 2002:a19:6918:0:b0:4f8:7556:23eb with SMTP id e24-20020a196918000000b004f8755623ebmr1531208lfc.39.1687219731664;
        Mon, 19 Jun 2023 17:08:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004f869e46fd4sm128815lfo.100.2023.06.19.17.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:08:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 3/8] drm/msm/dpu: drop dpu_core_perf_params::max_per_pipe_ib
Date:   Tue, 20 Jun 2023 03:08:41 +0300
Message-Id: <20230620000846.946925-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
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

The max_per_pipe_ib is a constant across all CRTCs and is read from the
catalog. Drop corresponding calculations and read the value directly at
icc_set_bw() time.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 17 +++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  2 --
 3 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 9902febc72c0..ba146af73bc5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -105,13 +105,12 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 	memset(perf, 0, sizeof(struct dpu_core_perf_params));
 
 	perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
-	perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
 	perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
 
 	DRM_DEBUG_ATOMIC(
-		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
+		"crtc=%d clk_rate=%llu core_ab=%llu\n",
 			crtc->base.id, perf->core_clk_rate,
-			perf->max_per_pipe_ib, perf->bw_ctl);
+			perf->bw_ctl);
 }
 
 int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
@@ -199,9 +198,6 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 				dpu_crtc_get_client_type(tmp_crtc)) {
 			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
 
-			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
-					dpu_cstate->new_perf.max_per_pipe_ib);
-
 			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
 
 			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu paths:%d\n",
@@ -217,7 +213,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
 
 	for (i = 0; i < kms->num_paths; i++)
-		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
+		icc_set_bw(kms->path[i], avg_bw, kms->catalog->perf->min_dram_ib);
 
 	return ret;
 }
@@ -320,15 +316,12 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 		 * 2. new bandwidth vote - "ab or ib vote" is lower
 		 *    than current vote at end of commit or stop.
 		 */
-		if ((params_changed && ((new->bw_ctl > old->bw_ctl) ||
-			(new->max_per_pipe_ib > old->max_per_pipe_ib)))	||
-			(!params_changed && ((new->bw_ctl < old->bw_ctl) ||
-			(new->max_per_pipe_ib < old->max_per_pipe_ib)))) {
+		if ((params_changed && new->bw_ctl > old->bw_ctl) ||
+		    (!params_changed && new->bw_ctl < old->bw_ctl)) {
 			DRM_DEBUG_ATOMIC("crtc=%d p=%d new_bw=%llu,old_bw=%llu\n",
 				crtc->base.id, params_changed,
 				new->bw_ctl, old->bw_ctl);
 			old->bw_ctl = new->bw_ctl;
-			old->max_per_pipe_ib = new->max_per_pipe_ib;
 			update_bus = true;
 		}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index e02cc2324af2..2bf7836f79bb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -16,12 +16,10 @@
 
 /**
  * struct dpu_core_perf_params - definition of performance parameters
- * @max_per_pipe_ib: maximum instantaneous bandwidth request
  * @bw_ctl: arbitrated bandwidth request
  * @core_clk_rate: core clock rate request
  */
 struct dpu_core_perf_params {
-	u64 max_per_pipe_ib;
 	u64 bw_ctl;
 	u64 core_clk_rate;
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 1edf2b6b0a26..ff5d306b95ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1400,8 +1400,6 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 	seq_printf(s, "core_clk_rate: %llu\n",
 			dpu_crtc->cur_perf.core_clk_rate);
 	seq_printf(s, "bw_ctl: %llu\n", dpu_crtc->cur_perf.bw_ctl);
-	seq_printf(s, "max_per_pipe_ib: %llu\n",
-				dpu_crtc->cur_perf.max_per_pipe_ib);
 
 	return 0;
 }
-- 
2.39.2

