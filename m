Return-Path: <linux-arm-msm+bounces-29812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8647F962E52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 19:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04F911F222B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 17:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B7D1A76A0;
	Wed, 28 Aug 2024 17:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LfDHuj9Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C5A1A4F28
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 17:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724865450; cv=none; b=eqaalLmf8+m9B+Id8NDRjInEPd9c575VRonZQGM+pHFt5IqnZWI7bTS3cPw2uhO6DdLo7S5i+aCex8wYnUJPHDOqZBSmaaF3d7tNYQcaUnLGFXoajPPJmVKlhzTop1vqBdZs+xSP1KccsLptL/xvfQEdYAO7pC7ZZhz4b4/hvTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724865450; c=relaxed/simple;
	bh=bwSfvGk4ew41Pt/E/xxobSD02oCnd1HApU3EHn2TPXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YRug+da0xI2ej+jXLIIK/j9HCLZKWOW6dfKgH8dTGDBI0vcHGdeuE+M1JPrvcZxuzPa0UUzf0pbeEj5PI0qrKqgUzz1tRWv35TpzfwDvrVTbr3eqDVeb8rlyJxT+6D3kU4TCKvVS8pmxh2wODunf8yAvpUd6N/C/yBfoH2FYTLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LfDHuj9Z; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2020ac89cabso65988945ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 10:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724865448; x=1725470248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obx3p45lH094wmMafo9xf2AcgFRs0OVi52Qu0+34Bqo=;
        b=LfDHuj9ZfaWEZ8qae2ejKkN4SR7yAYltdeJ+11qtR+qYVCfzVX5bf2Q6TjfUHYb44A
         o63A83z0kWDrQ96ZsOePzhAh5DtHlIo+vy4ChfbWa8fRTQAK79n7hDPEh3bURnbZa1yY
         gDdhpZh7ldp40US2ej75BYtggzkia8u2tuKO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724865448; x=1725470248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obx3p45lH094wmMafo9xf2AcgFRs0OVi52Qu0+34Bqo=;
        b=XUuy6QxjTny4yY6WotUM3xGj2MsQEvJz0Pl6BlUndnjkvd13JyIK6V1+S5ZIE1yfSY
         2nVOpVCwSRrbyyLR2Z8wgGPQcng6g0jxi64bTIcW98OaYJ9CA3ZMmuNM+XPRCkvU80Xw
         SLV60X44HyLEmZUWVj5UUUwHjbQQXMdRSe9tGjzKbWQkAwNvdr8VWibejQYbNHkft6ga
         rD+W4z1hSIalMDr0dZIYul7k3X8v4dkbUsiYdPG2iM/YU8iquNu4ExbG2hPNXq4Ee9sJ
         2Ge9s+U4YpqxRbOk2zBEmr3pVUSUsqQ7T67JZh6uvbSiXRZnyRQwASMfvYWmJxErO0Kr
         +YIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6+xYZ81/Lwa6eGGFgUqcaMPJxyirQ3aagMSgvWyZsPxTPGlUG+h3VZV3c1rbeJXBCTGBSIiL115SOSsZn@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHgjrmx9hxkKKkuRkjxY4tKWSD3HhxJJAWLtWhSmSzyiJdS4s
	k+R8drOLwGOXrN3qqj3N+2EgQEMOVgRbmCcchp/qpzKO6eH/n/VEpHxYJfyLpg==
X-Google-Smtp-Source: AGHT+IFo3yNR44JAQjq7tPpX6XRV0bUKv+iJl4hPJ7g/ZEOViXftZwzGkPdFX7wZrnrsNHYoVWKkMw==
X-Received: by 2002:a17:903:2a85:b0:1fd:9a23:90cc with SMTP id d9443c01a7336-2050c34c67dmr2292795ad.26.1724865447375;
        Wed, 28 Aug 2024 10:17:27 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-20385ae81afsm101148885ad.252.2024.08.28.10.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 10:17:26 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	linux-clk@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Amit Pundir <amit.pundir@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH v3 1/2] clk: qcom: dispcc-sc7180: Only park display clks at init
Date: Wed, 28 Aug 2024 10:17:07 -0700
Message-ID: <20240828171722.1251587-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240828171722.1251587-1-swboyd@chromium.org>
References: <20240828171722.1251587-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Amit Pundir reports that audio and USB-C host mode stops working on
sm8550 after commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
registration"). That's because the gcc_usb30_prim_master_clk_src clk is
registered and clk_rcg2_shared_init() parks it on XO. Running USB at a
slower speed than the link supports is effectively under-clocking the
USB link and probably confusing the downstream USB devices.

We didn't need to change all the shared RCGs to park on XO at
registration time in commit commit 01a0a6cc8cfd ("clk: qcom: Park shared
RCGs upon registration"). Instead, we only needed to park the few
display related clks on sc7180 to fix the issue.

Fix sm8550 (and likely other qcom SoCs) by skipping the parking part of
clk_rcg2_shared_init(). Make that the default init clk_op for shared
RCGs, but keep the part where we cache the config register as that's
still necessary to figure out the true parent of the clk is. Introduce
another set of clk_ops 'clk_rcg2_shared_init_park' that does what
clk_rcg2_shared_init() was doing and use that for the display clks on
sc7180. This fixes the sm8550 problem and limits the "park upon
registration" logic to the display clks that need it.

Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Reported-by: Amit Pundir <amit.pundir@linaro.org>
Closes: https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/clk/qcom/clk-rcg.h       |  1 +
 drivers/clk/qcom/clk-rcg2.c      | 36 +++++++++++++++++++++++++++++---
 drivers/clk/qcom/dispcc-sc7180.c |  8 +++----
 3 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index d7414361e432..5f479a29d969 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -198,6 +198,7 @@ extern const struct clk_ops clk_byte2_ops;
 extern const struct clk_ops clk_pixel_ops;
 extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
+extern const struct clk_ops clk_rcg2_shared_init_park_ops;
 extern const struct clk_ops clk_dp_ops;
 
 struct clk_rcg_dfs_data {
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 30b19bd39d08..5f0b729d7115 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1305,6 +1305,31 @@ clk_rcg2_shared_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 }
 
 static int clk_rcg2_shared_init(struct clk_hw *hw)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+
+	/*
+	 * Cache the cfg so that the parent is properly mapped at registration.
+	 */
+	regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &rcg->parked_cfg);
+
+	return 0;
+}
+
+const struct clk_ops clk_rcg2_shared_ops = {
+	.init = clk_rcg2_shared_init,
+	.enable = clk_rcg2_shared_enable,
+	.disable = clk_rcg2_shared_disable,
+	.get_parent = clk_rcg2_shared_get_parent,
+	.set_parent = clk_rcg2_shared_set_parent,
+	.recalc_rate = clk_rcg2_shared_recalc_rate,
+	.determine_rate = clk_rcg2_determine_rate,
+	.set_rate = clk_rcg2_shared_set_rate,
+	.set_rate_and_parent = clk_rcg2_shared_set_rate_and_parent,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
+
+static int clk_rcg2_shared_init_park(struct clk_hw *hw)
 {
 	/*
 	 * This does a few things:
@@ -1335,8 +1360,13 @@ static int clk_rcg2_shared_init(struct clk_hw *hw)
 	return 0;
 }
 
-const struct clk_ops clk_rcg2_shared_ops = {
-	.init = clk_rcg2_shared_init,
+/*
+ * Like clk_rcg2_shared_ops but also park the clk at init to avoid the parent
+ * from being shutdown, getting the clk stuck when it is turned on
+ * automatically by the GDSC.
+ */
+const struct clk_ops clk_rcg2_shared_init_park_ops = {
+	.init = clk_rcg2_shared_init_park,
 	.enable = clk_rcg2_shared_enable,
 	.disable = clk_rcg2_shared_disable,
 	.get_parent = clk_rcg2_shared_get_parent,
@@ -1346,7 +1376,7 @@ const struct clk_ops clk_rcg2_shared_ops = {
 	.set_rate = clk_rcg2_shared_set_rate,
 	.set_rate_and_parent = clk_rcg2_shared_set_rate_and_parent,
 };
-EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
+EXPORT_SYMBOL_GPL(clk_rcg2_shared_init_park_ops);
 
 /* Common APIs to be used for DFS based RCGR */
 static void clk_rcg2_dfs_populate_freq(struct clk_hw *hw, unsigned int l,
diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 4710247be530..068af819f23e 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -154,7 +154,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
 		.parent_data = disp_cc_parent_data_4,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_init_park_ops,
 	},
 };
 
@@ -263,7 +263,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.name = "disp_cc_mdss_mdp_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_init_park_ops,
 	},
 };
 
@@ -291,7 +291,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 		.name = "disp_cc_mdss_rot_clk_src",
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_init_park_ops,
 	},
 };
 
@@ -305,7 +305,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 		.name = "disp_cc_mdss_vsync_clk_src",
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_init_park_ops,
 	},
 };
 
-- 
https://chromeos.dev


