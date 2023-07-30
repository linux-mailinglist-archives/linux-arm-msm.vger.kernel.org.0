Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E264C7682F9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 03:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229600AbjG3BBJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 21:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjG3BBI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 21:01:08 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193911BF4
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:01:07 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso49820781fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 18:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690678865; x=1691283665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xF2cKFE9m7FsBb3Uecjxgnlyz82/CdN+JnUhT4R1oVE=;
        b=Q9Pl0+9k2xa9ybLP2N69yNEDdIEplHRFobPbzhejgjlailsWjlkTLxAWBu5UnGaW1B
         v39PfrhE91z2dFw93/xUS9x77Ud9kdQHO+sKt5U8SKTrkBZB8eL6SvchIHwO5qHzJi1F
         kWSedz6K/wSeuxNmyMG43pOUHIDKoDhjFsmvGxJr01QHbe9rlF8obdQERfaOIPhakHTy
         gPd6MgL2GlBY2rsyjGutKc0702+Qua81KDOlSwp7m4zIxI3Vz3YnMwZS16AzAX85gJpq
         15f7FOnRff9Z0XEoodkklnRm+XLiXLVBK4EG/Tc09yq1GVifZ+oAEYNSZIbyurTrRd8M
         Id/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690678865; x=1691283665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xF2cKFE9m7FsBb3Uecjxgnlyz82/CdN+JnUhT4R1oVE=;
        b=gMIZakRb/pX14TeXOlloBYJoB6jWXDpJtcjmPO6IsD3IxDz8hsFTKQAcA215jYeD15
         NnKCjSRP3xDApKjv7G9OkaRrSLiWbLRf5zLEwR7ravMZaaBg/jE2SEI0hK8f1o3wTQ2X
         oRHGlHhNxxav7Ph4HkHHK2WVI1gliB6KZDKebF1Xl2ofltURwK5lUARzqB3j38tHzNJs
         suSR73m6Xj3JvPvrEeyl52bIj0/HB7NEHOgK1eZuFRl7+yO/t8EkimQyWtP/zcbNCYQb
         DTq81yp9NyTgkoLL209AjK2pzgXSn72JybEvyiZzzsXgRrFrQhR+PehDjhPSioRwxxmZ
         YYlA==
X-Gm-Message-State: ABy/qLaN9KQ3ocpW59tUG1TKWPlC6aLXfRaH++Qovnkj0WBjqyJimS65
        vn4O/38L9S1KIu/kFKhF/Wnm8g==
X-Google-Smtp-Source: APBJJlFu3afc1uxVCOiDZxyihR1by+qsfw0zL9K8CT5CvGuExBJO/4FsVxSV4gWwkM06sCan/2RW3A==
X-Received: by 2002:a2e:8083:0:b0:2b6:e105:6174 with SMTP id i3-20020a2e8083000000b002b6e1056174mr4016947ljg.47.1690678865487;
        Sat, 29 Jul 2023 18:01:05 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 18:01:05 -0700 (PDT)
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
Subject: [PATCH v5 02/10] drm/msm/dpu: bail from _dpu_core_perf_crtc_update_bus if there are no ICC paths
Date:   Sun, 30 Jul 2023 04:00:54 +0300
Message-Id: <20230730010102.350713-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Skip bandwidth aggregation and return early if there are no interconnect
paths defined for the DPU device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 1d9d83d7b99e..3dbd73035a11 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -217,6 +217,9 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	int i, ret = 0;
 	u64 avg_bw;
 
+	if (!kms->num_paths)
+		return 0;
+
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
 			curr_client_type ==
@@ -234,9 +237,6 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 		}
 	}
 
-	if (!kms->num_paths)
-		return 0;
-
 	avg_bw = perf.bw_ctl;
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
 
-- 
2.39.2

