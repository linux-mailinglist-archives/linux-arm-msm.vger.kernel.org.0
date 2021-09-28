Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB3BE41AFF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 15:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240864AbhI1NWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 09:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240632AbhI1NWr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 09:22:47 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46ACAC061604;
        Tue, 28 Sep 2021 06:21:08 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id x4so6676732pln.5;
        Tue, 28 Sep 2021 06:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FI6R42Oo7MX5/xkTwAAMjl52Mc/0wUr0Fx+yPEL+Ji4=;
        b=gRG8Yad0DkgCqHgfSM6eKAjkEesndtjSXcOrNoLI43C1HCMqCTIF5up6G1wuxVvuX7
         OsE5cXBYzUjJi7UJ9JIWZATR1mBUnsOqLkhEex7Qte7mZWLLBbQLcDXOZeO/5bTcceXK
         W4eQ+BpVJfkJWTYjuFNdBf7S33ZniFXYdrKf87Um+yFlyv1quA165gXIlG3quo2QZsKv
         C90PjeyABy/OANhATHURszi9l9W6yYOhhksGWAhhrgfFybbLcqJDJAcg9uvvIjkoB4RO
         G/fF2Re+afwznQTT8oDwrL5g7541T5vc5JQzJYZOkSbBJexL8D2IC2AsysSrknbNvFK/
         qEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FI6R42Oo7MX5/xkTwAAMjl52Mc/0wUr0Fx+yPEL+Ji4=;
        b=vhrEe7S7IFrGE4lP18HkGc4OCFOuxC3uOd1ZAUzWqptbR8vcDvyO0u89prUyD4ImWi
         NZgsoLNNDEroHe0SgS4B5hFU91GiiVjuqHUTqdJf9ybflcdhOm6d3UtKF8BnvmkfTQCq
         ZnEpKC1bawaSsM/BBrtJxEGo9ovBH1zbaJakuEHzNygWx1+83OiIy2remwyMKhqwcnZh
         LIMvA9tKSfa4+bu92kLiZBhO6rHpS85QDyoErUZcb3t9lvCHiKPSHBHngazwuDBLN4ZT
         3E/EHyq+sc4PhGL87xRIOZq7nkSnMJRt6/Kz9nl1c/AeOsGE55q+GAGeypJC9S3z/twU
         H31g==
X-Gm-Message-State: AOAM5326AJLdIVUec4PgL8PibHE3bbsvq0JppO1vCbG6shjX5vmvt/Zr
        lcejhAcQ6SG0JHP97koydHZNi4oWihATx5OHRiY=
X-Google-Smtp-Source: ABdhPJymzcJo+QKmf4mnPfuNVaN/DDPzbo/krHlEYR8n1hDHvEtBus3O3CctB3dT8q0IRyhI+AVR+A==
X-Received: by 2002:a17:90a:4815:: with SMTP id a21mr5575292pjh.108.1632835267542;
        Tue, 28 Sep 2021 06:21:07 -0700 (PDT)
Received: from skynet-linux.local ([122.162.197.175])
        by smtp.googlemail.com with ESMTPSA id h13sm22063964pgf.14.2021.09.28.06.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 06:21:07 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vladimir Lypak <vladimir.lypak@gmail.com>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        James Willcox <jwillcox@squareup.com>
Subject: [PATCH v3 3/3] drm/msm/mdp5: Add configuration for MDP v1.16
Date:   Tue, 28 Sep 2021 18:49:29 +0530
Message-Id: <20210928131929.18567-4-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928131929.18567-1-sireeshkodali1@gmail.com>
References: <20210928131929.18567-1-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vladimir Lypak <vladimir.lypak@gmail.com>

MDP version v1.16 is almost identical to v1.15 with most significant
difference being presence of second DSI interface. MDP v1.16 is found on
SoCs such as MSM8x53, SDM450, SDM632 (All with Adreno 506).

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 89 ++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 9741544ffc35..0d28c8ff4009 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -752,6 +752,94 @@ const struct mdp5_cfg_hw msm8x76_config = {
 	.max_clk = 360000000,
 };
 
+static const struct mdp5_cfg_hw msm8x53_config = {
+	.name = "msm8x53",
+	.mdp = {
+		.count = 1,
+		.caps = MDP_CAP_CDM |
+			MDP_CAP_SRC_SPLIT,
+	},
+	.ctl = {
+		.count = 3,
+		.base = { 0x01000, 0x01200, 0x01400 },
+		.flush_hw_mask = 0xffffffff,
+	},
+	.pipe_vig = {
+		.count = 1,
+		.base = { 0x04000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SCALE	|
+			MDP_PIPE_CAP_CSC	|
+			MDP_PIPE_CAP_DECIMATION	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			0,
+	},
+	.pipe_rgb = {
+		.count = 2,
+		.base = { 0x14000, 0x16000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_DECIMATION	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			0,
+	},
+	.pipe_dma = {
+		.count = 1,
+		.base = { 0x24000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			0,
+	},
+	.pipe_cursor = {
+		.count = 1,
+		.base = { 0x34000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			MDP_PIPE_CAP_CURSOR	|
+			0,
+	},
+
+	.lm = {
+		.count = 3,
+		.base = { 0x44000, 0x45000 },
+		.instances = {
+				{ .id = 0, .pp = 0, .dspp = 0,
+				  .caps = MDP_LM_CAP_DISPLAY |
+					  MDP_LM_CAP_PAIR },
+				{ .id = 1, .pp = 1, .dspp = -1,
+				  .caps = MDP_LM_CAP_DISPLAY },
+			     },
+		.nb_stages = 5,
+		.max_width = 2048,
+		.max_height = 0xFFFF,
+	},
+	.dspp = {
+		.count = 1,
+		.base = { 0x54000 },
+
+	},
+	.pp = {
+		.count = 2,
+		.base = { 0x70000, 0x70800 },
+	},
+	.cdm = {
+		.count = 1,
+		.base = { 0x79200 },
+	},
+	.intf = {
+		.base = { 0x6a000, 0x6a800, 0x6b000 },
+		.connect = {
+			[0] = INTF_DISABLED,
+			[1] = INTF_DSI,
+			[2] = INTF_DSI,
+		},
+	},
+	.max_clk = 400000000,
+};
+
 static const struct mdp5_cfg_hw msm8917_config = {
 	.name = "msm8917",
 	.mdp = {
@@ -1151,6 +1239,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 7, .config = { .hw = &msm8x96_config } },
 	{ .revision = 11, .config = { .hw = &msm8x76_config } },
 	{ .revision = 15, .config = { .hw = &msm8917_config } },
+	{ .revision = 16, .config = { .hw = &msm8x53_config } },
 };
 
 static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
-- 
2.33.0

