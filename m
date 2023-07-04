Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8819F7474C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 17:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbjGDPEF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 11:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbjGDPEE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 11:04:04 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA3910D3
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 08:04:03 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b5c231c23aso92382131fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 08:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688483042; x=1691075042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OmpW03IM72nopc7RqY4/FXVDSlVzzZJgcKrKtH7fe0=;
        b=PxRZS+JrgkzEdLNOzrmbJtDt6JlLldsrDvAu3ZQOsKSQ7aOfS0oX4K84cIZGte/l83
         eBqHLlAHVfz4JG7A4stUTV8yUWcYUrp81vUwdcwdLVUoiH/sZzROMEzGNTjJ6s9JqNDk
         21PbXHaX/8UeJKU2Ks0gE5yIW8Dc8G5OBAWiZAKtljdidx+Sc+InE/s0jDC6IzRMHDqj
         0/hKcfGj9LKRdRtaUj5WuC7u+BJhLzsTBTYqpDaSgMjBGyr7T8m3ai2G4+WNBpfaAXg7
         a+orj2NkPN98jVoijL0EQIbM5+OEJRl1rph2xX2avDcUXt3Yy8Te4VdwiXsCmZAeut7I
         hAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688483042; x=1691075042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OmpW03IM72nopc7RqY4/FXVDSlVzzZJgcKrKtH7fe0=;
        b=ICgo2HG8aC4RS/xlQ8qnyNzeApV4SLqM2+LKd7Y4HnvGbbWOLgd8KZmKgKtCzhkk77
         ndSVZeEEp+vyjZ7h8P98YTnSO797eHQ29jdcVdgmIyNvrMNlwqLBESv1WA1pGFyZnYiN
         wNtcv0bwF21Di6lXcNv2xcHVar1Ab7I60u2CbRq+v/g0H9XvXKnlVc240B9EXjievIqB
         OCxPlvstq2UvhwEH2e549GydcCz8i3hQPu+E5+F7Y7sfnyA7ttfLryzXpQtyHVbAx0B2
         JQZ0iL0BsN03iqqTsatMt5s8ZGu6YruMqrJ55NTiPPZz7X4xHd8sPaWSx8uY72XeR/5t
         /gSw==
X-Gm-Message-State: ABy/qLaJdaUIfHaNxljVfhEPWxFYoBPMFl0+1l5Y5dE7SviCaeFR7maE
        XELSA9qTWhT4dIswerpKYW8sJQ==
X-Google-Smtp-Source: APBJJlFevKH1/FZGiODB7UDLxIkzFthcFVqPh4QOyv9WqNiniAjhGZdy4LYOnX/5zIzz7PlzcZIuDg==
X-Received: by 2002:a2e:681a:0:b0:2b6:e196:68c4 with SMTP id c26-20020a2e681a000000b002b6e19668c4mr5685092lja.39.1688483041891;
        Tue, 04 Jul 2023 08:04:01 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:04:01 -0700 (PDT)
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
Subject: [PATCH v2 08/14] drm/msm/dpu: rework indentation in dpu_core_perf
Date:   Tue,  4 Jul 2023 18:03:48 +0300
Message-Id: <20230704150354.159882-9-dmitry.baryshkov@linaro.org>
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
index fe4d7e08ac1d..bdd00c3af1c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -146,8 +146,8 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
-		    (dpu_crtc_get_client_type(tmp_crtc) ==
-				curr_client_type) && (tmp_crtc != crtc)) {
+		    dpu_crtc_get_client_type(tmp_crtc) == curr_client_type &&
+		    tmp_crtc != crtc) {
 			struct dpu_crtc_state *tmp_cstate =
 				to_dpu_crtc_state(tmp_crtc->state);
 
@@ -338,10 +338,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
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

