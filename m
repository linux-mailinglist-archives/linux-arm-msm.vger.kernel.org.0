Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 815A6356F9E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 17:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349103AbhDGPCP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 11:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349071AbhDGPCO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 11:02:14 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F1EC061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 08:02:05 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id o16so21077758ljp.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 08:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EZtsCVis+vCjte+rmZOhgHYRoursgoalpacTDNYwKSU=;
        b=Ocg1faV18l88DL8KA0alLWRQKCM/tzQUBnYYoWU8RI+PN9VrtfC7pacE4SVHA4mBq6
         sEm7bz08SbbaWwYDk7QX6fyi9Fgf6P19U+QmUY7iyuhbAK70/VcHsyFgDfoKY+BibzRp
         +wOtRoE1dC3XMYT7CwZ8sSawJjCXKXwSu9DK8wDEhPDZmhmVXSgcKp6A/ReU01TS80cg
         DEFzM+H12M4BpX91ONGFfYEZjvIkp6/aYpcCiop+wnhqtv1A3FkB1/5DqqnNY5ib5kgk
         Yyfujg8FP4JDTwZXWaoevmdpsB+n/+HDk9Va2wKBqBDZI80VmbracgCzSKz4Y5sl8dqG
         4stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EZtsCVis+vCjte+rmZOhgHYRoursgoalpacTDNYwKSU=;
        b=XPT+7evZ12jYKuz+wD13cCFqiZBZoIcmJdFssh9ajhZxsbpO6i99eK+ZmHhitVveie
         rrUzRKmE2RAYJAQaE+1q7liK6gnB3wZwgGeNH8zcBX5GjbxCvHS5Bp/ZYKeQc3VWi7iD
         lE5bspWJddPmm48bHg3l8Bv/bxBJ+qGv2y9/D3EGluoH/MR/h/4W3VibWWi5ymT5y6DO
         iLMHAOVY+emYNG5Y44miQIZ6ZP8FbNEs5ufichSznRJ7B7MWhNi12mMxxfQotiloFULy
         LOJJpmRWo5FyYt7+u/eIIThDMXm3sXQ+k92HHBfY9GlpfxPyl/fYyRq7rkaZBpSC1chO
         mMnQ==
X-Gm-Message-State: AOAM5300uHHTJ0br7I5R6YKXISWovapWKCG4F5SETnIlYhC/nPHgWQd0
        jijaKEk8qMRi/Hh0AqotroHDDw==
X-Google-Smtp-Source: ABdhPJzfIgQ7kamucHqroAR70dbdqx589P79Av8gZAVKXIfhoQ95JRpIx9X7UTISu86/kF4Gy1tbvQ==
X-Received: by 2002:a2e:98c7:: with SMTP id s7mr2506004ljj.276.1617807722066;
        Wed, 07 Apr 2021 08:02:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o11sm2552142ljg.42.2021.04.07.08.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 08:02:01 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] drm/msm/dpu: fill missing details in hw catalog for sdm845 and sm8[12]50
Date:   Wed,  7 Apr 2021 18:01:54 +0300
Message-Id: <20210407150157.801210-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
References: <20210407150157.801210-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fill clk_inefficiency_factor, bw_inefficiency_factor and
min_prefill_lines in hw catalog data for sdm845 and sm8[12]50.

Efficiency factors are blindly copied from sc7180 data, while
min_prefill_lines is based on downstream display driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 189f3533525c..a9f74c1177dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -817,6 +817,8 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
 		{.rd_enable = 1, .wr_enable = 1},
 		{.rd_enable = 1, .wr_enable = 0}
 	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
 };
 
 static const struct dpu_perf_cfg sc7180_perf_data = {
@@ -852,6 +854,7 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 	.min_core_ib = 2400000,
 	.min_llcc_ib = 800000,
 	.min_dram_ib = 800000,
+	.min_prefill_lines = 24,
 	.danger_lut_tbl = {0xf, 0xffff, 0x0},
 	.qos_lut_tbl = {
 		{.nentry = ARRAY_SIZE(sm8150_qos_linear),
@@ -869,6 +872,8 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 		{.rd_enable = 1, .wr_enable = 1},
 		{.rd_enable = 1, .wr_enable = 0}
 	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
 };
 
 static const struct dpu_perf_cfg sm8250_perf_data = {
@@ -877,6 +882,7 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 	.min_core_ib = 4800000,
 	.min_llcc_ib = 0,
 	.min_dram_ib = 800000,
+	.min_prefill_lines = 35,
 	.danger_lut_tbl = {0xf, 0xffff, 0x0},
 	.qos_lut_tbl = {
 		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
@@ -894,6 +900,8 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 		{.rd_enable = 1, .wr_enable = 1},
 		{.rd_enable = 1, .wr_enable = 0}
 	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
 };
 
 /*************************************************************
-- 
2.30.2

