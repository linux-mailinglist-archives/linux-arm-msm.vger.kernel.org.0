Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188D03901E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 15:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233150AbhEYNOz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 09:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233151AbhEYNOy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 09:14:54 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38D5C061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 06:13:24 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id f30so8996311lfj.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 06:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VWoFKEoGtTOuTzP0C2jwUTGuOWcUxql2hy1byMH9TIU=;
        b=hfkwFnBMrceotvW547bghRykcjmWgmpbSNKji+seAYyqhsPfjwd1te1nef9J+lxUPR
         pFykXWcZzeLSq4oU4lIbzBj34/wvFpVyG8PWZSk/Om8HBGm8Q5cWCvKElCTKhDUTNamc
         S8HXlkTHphuRjPj1ZQkjgcpqBalZg7WmsOZ1AaRnlwiG/FW/R9NBhHYOupvHS01jcB37
         oUTru/zXUKKzMA9hw6SNiYmydFnfG2CgyPgXW5jp71zTkttfyxZOn9fYMRYD51pScoOE
         3Ldc/MOZ0XYDNehaWwaOUWamDBhlOqZh656kmO9Ncl+J383cJSIWMSCMBz0wBifcvbSY
         XyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VWoFKEoGtTOuTzP0C2jwUTGuOWcUxql2hy1byMH9TIU=;
        b=H2SmqU5Pkn0LMWazH2+Yu3TVzJA39zfCueqMgy57s65g2sn2Yjw0hRHHysSeK2jPiJ
         i4tICEzC8InQlDYWqdYbqsRvn33mzKXxxag+0naYMgNjA/Hqt7RVE+k1BwvUhXPjy+RK
         Z++Az5g9KhManBboFSvM0ctPRKWuEP6Ken2gfIOsJnGw9KkRF6UQ5+d9we3ZHcScag4t
         aUHM/RpEEsdY5s2fPBVbAdICXM9IyBXrL3xwPFwh50hqqtUE+Df0IwNzMZEWhNMAIsqU
         EJTPq8q0iuMvMo637MmLvtNtuVRexbyMeiR2/LPBpp/nI6z8fDQHv9WjNTFTWW5Wv0zQ
         knPA==
X-Gm-Message-State: AOAM5306ovRvNvKCMob2k1bNUPWvVXufpm26r7mp1jBeceu0u0w4luxg
        /ICoIgMd/XJZAeP9b6/QjOU9EQ==
X-Google-Smtp-Source: ABdhPJxfPYb4gHyeda6eVnBIMz7niUxy4fnQGSA/AacFHjB/kgzS3sLbLemgKMqd6V/zeYGixicOQA==
X-Received: by 2002:a05:6512:209:: with SMTP id a9mr14628411lfo.219.1621948403005;
        Tue, 25 May 2021 06:13:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 06:13:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        James Willcox <jwillcox@squareup.com>
Subject: [PATCH 6/7] drm/msm/mdp5: add perf blocks for holding fudge factors
Date:   Tue, 25 May 2021 16:13:15 +0300
Message-Id: <20210525131316.3117809-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
References: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: James Willcox <jwillcox@squareup.com>

Prior downstream kernels had "fudge factors" in devicetree which would
be applied to things like interconnect bandwidth calculations. Bring
some of those values back here.

Signed-off-by: James Willcox <jwillcox@squareup.com>
[DB: changed _ff to _inefficiency, fixed patch description]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 35 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h |  7 +++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 94ce62a26daf..9741544ffc35 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -95,6 +95,11 @@ static const struct mdp5_cfg_hw msm8x74v1_config = {
 			[3] = INTF_HDMI,
 		},
 	},
+	.perf = {
+		.ab_inefficiency = 200,
+		.ib_inefficiency = 120,
+		.clk_inefficiency = 125
+	},
 	.max_clk = 200000000,
 };
 
@@ -177,6 +182,11 @@ static const struct mdp5_cfg_hw msm8x74v2_config = {
 			[3] = INTF_HDMI,
 		},
 	},
+	.perf = {
+		.ab_inefficiency = 200,
+		.ib_inefficiency = 120,
+		.clk_inefficiency = 125
+	},
 	.max_clk = 320000000,
 };
 
@@ -272,6 +282,11 @@ static const struct mdp5_cfg_hw apq8084_config = {
 			[3] = INTF_HDMI,
 		},
 	},
+	.perf = {
+		.ab_inefficiency = 200,
+		.ib_inefficiency = 120,
+		.clk_inefficiency = 105
+	},
 	.max_clk = 320000000,
 };
 
@@ -339,6 +354,11 @@ static const struct mdp5_cfg_hw msm8x16_config = {
 			[1] = INTF_DSI,
 		},
 	},
+	.perf = {
+		.ab_inefficiency = 100,
+		.ib_inefficiency = 200,
+		.clk_inefficiency = 105
+	},
 	.max_clk = 320000000,
 };
 
@@ -414,6 +434,11 @@ static const struct mdp5_cfg_hw msm8x36_config = {
 			[2] = INTF_DSI,
 		},
 	},
+	.perf = {
+		.ab_inefficiency = 100,
+		.ib_inefficiency = 200,
+		.clk_inefficiency = 105
+	},
 	.max_clk = 366670000,
 };
 
@@ -509,6 +534,11 @@ static const struct mdp5_cfg_hw msm8x94_config = {
 			[3] = INTF_HDMI,
 		},
 	},
+	.perf = {
+		.ab_inefficiency = 100,
+		.ib_inefficiency = 100,
+		.clk_inefficiency = 105
+	},
 	.max_clk = 400000000,
 };
 
@@ -617,6 +647,11 @@ static const struct mdp5_cfg_hw msm8x96_config = {
 			[3] = INTF_HDMI,
 		},
 	},
+	.perf = {
+		.ab_inefficiency = 100,
+		.ib_inefficiency = 200,
+		.clk_inefficiency = 105
+	},
 	.max_clk = 412500000,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
index 1c50d01f15f5..6b03d7899309 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h
@@ -76,6 +76,12 @@ struct mdp5_intf_block {
 	u32 connect[MDP5_INTF_NUM_MAX]; /* array of enum mdp5_intf_type */
 };
 
+struct mdp5_perf_block {
+	u32 ab_inefficiency;
+	u32 ib_inefficiency;
+	u32 clk_inefficiency;
+};
+
 struct mdp5_cfg_hw {
 	char  *name;
 
@@ -93,6 +99,7 @@ struct mdp5_cfg_hw {
 	struct mdp5_sub_block dsc;
 	struct mdp5_sub_block cdm;
 	struct mdp5_intf_block intf;
+	struct mdp5_perf_block perf;
 
 	uint32_t max_clk;
 };
-- 
2.30.2

