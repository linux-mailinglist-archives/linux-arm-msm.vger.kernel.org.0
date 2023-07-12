Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9A3B751346
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 00:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbjGLWLt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 18:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232382AbjGLWLs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 18:11:48 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FEE41FEE
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:46 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b701e41cd3so124748471fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689199904; x=1689804704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M10VgP9//AsaJyB3rDz2tLQzN4SdFxlisowXmDtHg2k=;
        b=rVuupT85qWdSAbnUF3rDBecpUJzSwFPoZDWDdmyJ7XQ4KRb9vuiiOQU2WseFdV6glE
         Yv6SiAOeoW9Dyn88J3dbXayLGmVwVMRWi/zQVYMuScrI8+S3bM5RiFhRuskt2wEaiens
         0g8Y52AoIQzeG5vz01diRLIkSKdfqMG3xy6AHC9COGSq+WGU2+KARqu6EG0RFt5T7+LO
         fgjO1tyzS/N7jocbp7S5W+S9+4EV14YxMrb3uGGTbACky6EcdCvS5ANKk0skxpd/wiFR
         7MBpiSeBiztIz/egBUcWqj9Aw2a5BSO1e/SWCAU2Ggnf6M4jlMMXSpExC976Y4lBu4Nr
         dBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689199904; x=1689804704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M10VgP9//AsaJyB3rDz2tLQzN4SdFxlisowXmDtHg2k=;
        b=Y/3e4JbFEAuT11vrXBF/tHCDpZuJP63No9MdarVw5XTmNYkWrKpNiFoyoy+LJ+kNTA
         xJBB4Lnbarcs1WPXYjeLOsxcuCAamXYZRuy0eJfb/BsfBls5TsrDR22pmeTcaGzR3pNj
         gb7IStxOGDuaENTU4Ipwwk2ddbuFsHSGBmGIk1Z1mQwhN5IyQtpFs/IIrRd4ftFEqjov
         IJplB1OEZLn6fxAfzs8HEgZcaKBd+gzw4CAvkFRvb6CXU1A6YxS3ADASJtspdGhIjMnz
         ILv2j5bJ6+CweVMdcpE8bNMrYleAbGKNVIH45CgOcYJ/C8i7Ctsr9gAns2XKqORxUey/
         vOpw==
X-Gm-Message-State: ABy/qLb0NfYrKRwEG8nbIiwfTogpFkFXR4k4kDUSGk91F7TliDSMC+k3
        YqOeSiYsUJIKIpQfFz6WTr7wdw==
X-Google-Smtp-Source: APBJJlGQNS1YTzCBpsZUchsi6L/GVRPzj9zzQdd8jYukqlbz5CtMlEj14dRIljkdXqQ+0+paMHFqfQ==
X-Received: by 2002:a05:6512:3b3:b0:4f9:571d:c50e with SMTP id v19-20020a05651203b300b004f9571dc50emr15810889lfp.36.1689199904391;
        Wed, 12 Jul 2023 15:11:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 15:11:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4 05/11] drm/msm/dpu: rework indentation in dpu_core_perf
Date:   Thu, 13 Jul 2023 01:11:33 +0300
Message-Id: <20230712221139.313729-6-dmitry.baryshkov@linaro.org>
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

dpu_core_perf.c contains several multi-line conditions which are hard to
comprehent because of the indentation. Rework the identation of these
conditions to make it easier to understand them.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index f9f44cfcfbf2..841e1fc0c6a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -173,8 +173,8 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
-		    (dpu_crtc_get_client_type(tmp_crtc) ==
-				curr_client_type) && (tmp_crtc != crtc)) {
+		    dpu_crtc_get_client_type(tmp_crtc) == curr_client_type &&
+		    tmp_crtc != crtc) {
 			struct dpu_crtc_state *tmp_cstate =
 				to_dpu_crtc_state(tmp_crtc->state);
 
@@ -365,10 +365,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 			update_bus = true;
 		}
 
-		if ((params_changed &&
-			(new->core_clk_rate > old->core_clk_rate)) ||
-			(!params_changed &&
-			(new->core_clk_rate < old->core_clk_rate))) {
+		if ((params_changed && new->core_clk_rate > old->core_clk_rate) ||
+		    (!params_changed && new->core_clk_rate < old->core_clk_rate)) {
 			old->core_clk_rate = new->core_clk_rate;
 			update_clk = true;
 		}
-- 
2.39.2

