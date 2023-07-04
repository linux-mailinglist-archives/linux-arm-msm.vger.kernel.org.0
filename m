Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB4D7474BD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 17:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbjGDPEC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 11:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbjGDPEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 11:04:00 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA7010CF
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 08:03:58 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b5e7dba43cso92125061fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 08:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688483037; x=1691075037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjoI3Dx1Y7JEO/QjjX2Gq34JkRG4tKXD0+CPY31Fy3E=;
        b=mnlRrEYkT1bLTpjdSK3/SYPxwdfahLX/mA2DCiGjVRVrwWVAmO1HzFdVn/6bWm0Ng3
         JCB9IdVKH2/S9Iatr/GJ653jQQRbrtW1iaR+h+/QQQ+Y9yZJIT0n9mzJJkL6vXoJ3qUF
         Nxt0v8JaIlHu1EMSXtJrrW/i3scdz50zmlB8gOyQI3UMn9XVvtU6Wa9duFjdaeLtSlx8
         cm6hj8aIHcj2gNWFx/zp2q/N46Z+jTCXXWLotENrtAUEIECfFFRSozCzSAu+AAsBEuP5
         KwZGJUVu6SQBvujwi87Pg1WFrb/Cv5txzKL97atlq5GEEorPs6hZ3k7LQW/eM5RW/W0p
         A70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688483037; x=1691075037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjoI3Dx1Y7JEO/QjjX2Gq34JkRG4tKXD0+CPY31Fy3E=;
        b=I68NRWXFTPeGrDmCAw+OrroKvLzU0k11ltSrHjUGDO8SPanditsRCtXrSP5cmPZpci
         Vhn2bGd2fiocFMd3W1szmu4uzj4jObag98969DkUAP61Eo+1ivT20k4yPQUeZ2qClRAj
         XnlRhT9N/3F6/YEmEt3W5V5MBu0A4wwervk5tvqQmD57lmDRweAIA0sgSDFW5VwJgspq
         OLS4x9S2wmE5g1SCO8ZVYzrHcU6O09I5ak7sN4i9Vw4Ep9Xz7hvEIMFrJUhPfcahj8bs
         L0qZSTEipBmjNPd1ep9z3QSLOo/1tvB7aXpkUTSqrZ/8ePcQBeu3ZKRvHTCWn2KlICAN
         be5g==
X-Gm-Message-State: ABy/qLaYEc+gMMsxW5KONbGJL3ucLtvTstMv4ZKXcW4LZH57XSAF1brL
        q72RzoHw2wRH0u2/5RYPeo7vjg==
X-Google-Smtp-Source: APBJJlEIpyGmPKFAyIMvvdNdb1Ujx+ZPnxW2uFUNINEv2423vq4210IYOn5QzypLYX/RQ6fr20NjxA==
X-Received: by 2002:a2e:9147:0:b0:2b6:b942:aaf8 with SMTP id q7-20020a2e9147000000b002b6b942aaf8mr9801084ljg.30.1688483036977;
        Tue, 04 Jul 2023 08:03:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:03:56 -0700 (PDT)
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
Subject: [PATCH v2 02/14] drm/msm/dpu: core_perf: extract bandwidth aggregation function
Date:   Tue,  4 Jul 2023 18:03:42 +0300
Message-Id: <20230704150354.159882-3-dmitry.baryshkov@linaro.org>
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

