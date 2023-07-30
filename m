Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9D517682FC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjG3BBL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjG3BBJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:01:09 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E6971BF4
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:01:08 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b9c66e2e36so35828521fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690678867; x=1691283667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZNp47+5mB8X0hcppySWiLzPp8uuJeeDzihUIEzaqAU=;
        b=d0aLnx44WreqBxfzVKUyHNRC/2znwkN7OM8Tji+REbbNyPGLBq/IH4t/qbJsm5oNLG
         Qf1hc7aknH3OfUZyp9RIcBdxOSm79q954WelFeI/roGpJyqZjdBBNcS7IJjuxUIhUcEu
         22EhGmlhhUv9eFcazbD/b5X9itTR6IXAyW2RFMo7DD8NzdVVguWs9ecyqDCIZF7yb75f
         skJjp5JGSy0QmdUCyxH4ABDCyojviAkYQmeqHpV/FKLXOLUVzn+oiqmf1E5UJDBlvFuC
         BCd61/qOYVvyrtePtiQ6e4MrV24FW+YIX4neCrv4Z865kTzKMX+vuWLaAmzh1XPGbnfD
         5BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690678867; x=1691283667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZNp47+5mB8X0hcppySWiLzPp8uuJeeDzihUIEzaqAU=;
        b=NJIs3hZjaDaFP5B6Fy4JRVAIn7dINRxt5o1a6GxWw54Cu08JcfLL9sK4l5NBqTUhLF
         WU1IT1e0Ko7E3HbUb833RwpYfft7fsau/di35YxlIBE9UCT8FQ99ekdHo+7IDA+tbOkG
         0OLDu7v6yARMBYGIJdzA3JZnVt0no5YY00D3KQ51VO8g4N2WkiGdmdKP6VDhS228cuHI
         J9mBoiAx90FaDXCEf5Qu4EV9MGChA2x+dXQM+qTWoTK+ZT7CxZgxvJbud36AFjkBuuMn
         srjdsBlFkzl4fpUzQJLwHleLmqHpO/ND8JXKKKN/Pex94FxD85/piNeyfSTIA8ERLDwe
         +oYg==
X-Gm-Message-State: ABy/qLZu77mC79yPAd8P5O7lJpS6Kyu6o9DLbKDqRG2LMvnTlpuw++ZA
        DfHQF2qHuvr90sTvNVTNj68M8Q==
X-Google-Smtp-Source: APBJJlFqXEBAJVvdNEpnw4uL7J0jdLoGKMd2O45vURHylZnvimMbfKv+vUqEa42Drvky3tUeT5Xm6A==
X-Received: by 2002:a2e:b601:0:b0:2b4:50b8:5d3b with SMTP id r1-20020a2eb601000000b002b450b85d3bmr2202311ljn.0.1690678866934;
        Sat, 29 Jul 2023 18:01:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 18:01:06 -0700 (PDT)
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
Subject: [PATCH v5 04/10] drm/msm/dpu: rework indentation in dpu_core_perf
Date:   Sun, 30 Jul 2023 04:00:56 +0300
Message-Id: <20230730010102.350713-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
index 34f3d30ab7d6..6ddbedb83e66 100644
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
 
@@ -360,10 +360,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
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

