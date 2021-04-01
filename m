Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7562D350C3D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 04:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbhDACFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 22:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbhDACFg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 22:05:36 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33A30C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 19:05:36 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id y1so489750ljm.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 19:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EZtsCVis+vCjte+rmZOhgHYRoursgoalpacTDNYwKSU=;
        b=AuhdP2R2Moo+S96ZpsVcPCs4in4KziUI94OX/i/z7/t5DFG3QhrEepUOwZ80rrUyaO
         EYk5rvKxitPK34AlnjIgX0TKVdyOQHjrogBSfKEY+PBYmJQQ9US/UZo0YikARYf16uzS
         0f89SpLDx/9bYN94C6kZS3Raqlt2rgkM7MVOebFWCvHp/bMnKUqJYPdeKIa2RKwvu/Wt
         uX6GBeeFWYAVep5kkc4eekuDzAMLs2uPaiare1adk9jp7vyUhpGaPV9xRQ3LXOUFrKXf
         VhX8mLEHppg/5cjYWowUlJ3HZryGPNA7ySpGoEruV5Jf8wVlRVT92ZBPzyiP6bEF7r+N
         pIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EZtsCVis+vCjte+rmZOhgHYRoursgoalpacTDNYwKSU=;
        b=EkJWpXMRSpwCDqtPv7wVD9wo8ZTTq++dKi3gVPpqkX5bhvxstp20EVS2JrGcD3ARbB
         T++B9eJCVPN8DwWCKwTN1dHnWb0MJ/CJ8f6f15C336Z6LXdZBvWhPZYna5XZ9eY5EQHi
         +B3f2FlCIPjtzpsEG4mrZhrR+OPJkzPQ1h2beSVhOrwMv9OtU236P6mQaZ2P6+iKCq7F
         g2Qbc8/XfKDseSGARnvoj9cyDp1bt004t7SGbbbMZqbm22+aIclH609wRXpYPmEY/ViD
         qAEuWkK//5TY8wzf9Lvp7hA/IBS9sJGVWr6LpQ9jV5vn5rNHkEQrYhUl6WfbznxwShmg
         oiEw==
X-Gm-Message-State: AOAM531rvZddK2DxTEXeGnduHqriindbtFUnJEc0fZ4LtNwSqCqZphcE
        hJ69sboY8tQdRFuLHrOAvPJJOg==
X-Google-Smtp-Source: ABdhPJy5PxNWydH7fLY0kC7t95rY7/ayVoIh7aNdXILLjXm5rycoMMusE+DLpId/b39dzleHQ7+Hrw==
X-Received: by 2002:a05:651c:211e:: with SMTP id a30mr4141129ljq.18.1617242734705;
        Wed, 31 Mar 2021 19:05:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l4sm383635lfg.123.2021.03.31.19.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 19:05:34 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/dpu: fill missing details in hw catalog for sdm845 and sm8[12]50
Date:   Thu,  1 Apr 2021 05:05:32 +0300
Message-Id: <20210401020533.3956787-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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

