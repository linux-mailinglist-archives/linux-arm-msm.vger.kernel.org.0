Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACB874B766
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 21:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjGGTmg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 15:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbjGGTlS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 15:41:18 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674DD2D58
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 12:39:48 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fbaef9871cso3560382e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 12:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688758786; x=1691350786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jS4QBjRPTQXKPDD7wlMbL4lf3gZh4eLDOWteEpntJqI=;
        b=jQ+aH2OJquXlDHELj0Tga/BRfi7MuxLfq0CbtfTvY7o+udJ30AwllW+89IziYe4t2r
         xTrMNT6XExiJZE0LueKf/jRRVZvn7BLPcNFH7Kvum23+mn5mD63yx4/4NL+Efe55SmIk
         Zj7Jgxi4f8WzNDr42C+/xO5VSvn+JrEQ0by9xOjbw4ydNh4GzRZxagXMudAxv++BxrOG
         tUPuxKmC3ksvfSNGMWZF8uTBGYJsu73FEw8Vy5Rl/RHypb6CU1EssZgwQTZfp/IsCoGx
         3dDWX3Gha1Cie7g4ZV37ggJ8SJDVMX5A1Zk8CYB9O1OqIPfdfwyzNLBl4oDSlnBLhr/4
         23IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688758786; x=1691350786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jS4QBjRPTQXKPDD7wlMbL4lf3gZh4eLDOWteEpntJqI=;
        b=VQR0jiSH+sH2/gX5XQZ8HHXNbGVWV2nNeYBfwqq9yAdXEk/3BaDci4z5eeTM7JqUAo
         8SuNRt3Ycha5FywA9oPJahSOMqUS1HYug2C5g44yMa7Ahog6ivIzJvISKtL0tCEpHfoD
         a1dEubwbq4fG9g6T2KfNqGLJnULiZxB0xOWbtHCvjPTphaW+hWHf8jlF51Wyxamx/JAn
         Y/lCDPPcOFl2ENJHqiJ32C/E481EGY73GqVvAZuqtIh7BqFkdu4T4S//nP1MDnFbEZuf
         M6XeidREB0O5MXXrw3INtLkoNgSHOBektzZx97yEc4H94SBxbIkjrh5n6fad55/vBQ8W
         yxnQ==
X-Gm-Message-State: ABy/qLb0DQJZxwYZe/1OVMbhgXQXF8E0vPTQBa8RtASWfn9wRBVCgBJs
        5LPQIQNRmfAjXPUDlIJNca3HRg==
X-Google-Smtp-Source: APBJJlFy5KM/w4/k4Md3037veJ8vqKUoZJvmQr5DOrbOa1BC1Bssjuvqs5yL9M+xEcWFA3K2jbtW5Q==
X-Received: by 2002:a05:6512:2521:b0:4fb:c0b5:63d4 with SMTP id be33-20020a056512252100b004fbc0b563d4mr5257145lfb.43.1688758786799;
        Fri, 07 Jul 2023 12:39:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 12:39:46 -0700 (PDT)
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
Subject: [PATCH v3 05/11] drm/msm/dpu: rework indentation in dpu_core_perf
Date:   Fri,  7 Jul 2023 22:39:36 +0300
Message-Id: <20230707193942.3806526-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
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
index 348550ac7e51..87bf4e5cb8e7 100644
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

