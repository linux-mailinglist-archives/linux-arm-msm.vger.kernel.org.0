Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D893FF0AB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 18:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346049AbhIBQBs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 12:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346051AbhIBQBp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 12:01:45 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1594AC0613C1;
        Thu,  2 Sep 2021 09:00:47 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id r13so1988040pff.7;
        Thu, 02 Sep 2021 09:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FI6R42Oo7MX5/xkTwAAMjl52Mc/0wUr0Fx+yPEL+Ji4=;
        b=pG0CALULKhiASC09JpVPt1vkukpytG62yV6Mp9KfeIeVKWMoOSEec0UbnaaogMMcpR
         uWYdwegsIf6sgyLoCzWyKm7Fry3mK97lwK9d1mDzPWfLJgU//CWikizRdYlxDn0zlgD2
         +t29ZweiXajDQmCxJhfkkixnxKe3je+hA4DDP334QKLeJZub0HZO55Ac6tWfWlmJekbM
         finZLxbBUa5ixuOw403oufmJFzXW/S7z/LRNrQs/4zGdp8IUfjfDj9NA8S32R5IcGKrb
         bZHmy0UDJTu4GlSDjlx+K+D1N1DNUC84ZZ8YjxhF+QBRhTDCpyZfkc0ol/dXzbph2t8Z
         c/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FI6R42Oo7MX5/xkTwAAMjl52Mc/0wUr0Fx+yPEL+Ji4=;
        b=JIm5lQHvSOHFlNUKj18qsep0lHiOZLM+BhzBFWfOuFYzRLR5ZB8oZQy7Hbl0fdi8gW
         A7fiP6wM+8LVQUR3Ba8fcJM2iMK6up9c5sDJLNSg2cAw6J1sB0Zm/Xnrin6XbDn36aU9
         j6+SigHtLhTM/HhZdzScm+QNfdH+KtuhgoaHRAJi240BV/skif+exkXPmtWvAzt5nQE1
         YLQVhC880K83NPPaUQvlUk3OakwhCMldU/XTw+39NxPvs3IHZgW2EN0uHeXUHv/ixg9n
         XPHieIstvocDknqVco0DtFJpO7YoWiP+s0wGxBuy8Pi+ZIbQg/7Ss5a26mWD4E7xp4Cr
         k6PQ==
X-Gm-Message-State: AOAM531D2bcBKpQz2GJ75TnqxjvS5A5TWX2Gcue75vqSGlKLBHQdQy8B
        pYeGkVnOzhHe+4+bx2hTA65PlCSynNHrkUf/
X-Google-Smtp-Source: ABdhPJzWTVwG+AcHQ6VecSgeEqu+OM6E3bEx4MFUqtuGtjaEp9E8MMCgF3Zu4sdQepTKE/L+840OaQ==
X-Received: by 2002:a63:1d25:: with SMTP id d37mr3953926pgd.52.1630598446597;
        Thu, 02 Sep 2021 09:00:46 -0700 (PDT)
Received: from skynet-linux.local ([106.203.214.216])
        by smtp.googlemail.com with ESMTPSA id a15sm3528540pgn.25.2021.09.02.09.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 09:00:46 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     sireeshkodali1@gmail.com
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, airlied@linux.ie,
        robdclark@gmail.com, linux-arm-msm@vger.kernel.org,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        James Willcox <jwillcox@squareup.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm/mdp5: Add configuration for MDP v1.16
Date:   Thu,  2 Sep 2021 21:29:51 +0530
Message-Id: <20210902155951.6672-3-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210902155951.6672-1-sireeshkodali1@gmail.com>
References: <20210902155951.6672-1-sireeshkodali1@gmail.com>
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

