Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 986C44008D3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Sep 2021 03:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350398AbhIDAlC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 20:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241254AbhIDAlC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 20:41:02 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99EE0C061575;
        Fri,  3 Sep 2021 17:40:01 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id v1so494910plo.10;
        Fri, 03 Sep 2021 17:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FI6R42Oo7MX5/xkTwAAMjl52Mc/0wUr0Fx+yPEL+Ji4=;
        b=P9p3I1iFOOqZHomjJ9vNMefUT3hZPzD+F1bNrOIYlplXPkvXNDcsEoyzTJIVAmJ35Y
         0rkjEw3jIJ562VBGidsZBdYFLb+XXXwWHfP4361rOcoFkfXJlccu6Oa3StlZZpt8UB3p
         RMeJs65RYXCbGcJ9FCY+9HyR8PojZBDka55C1UZ9rYWMF3GUYyXqiBqOFxjLDEwwr1Pt
         s85jHd6VurdxdjV9hbU5CoLvTBeJI79gIHfkKkC9t7c8rptQ4B/9hqjUJgLc0CkQ7nQY
         IYyLlGH5GENe7taBtOG5A0IXy2YH8nbyCN6a+STlteI8sxyU1mv5PnWuHxgGuCtiClCx
         gtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FI6R42Oo7MX5/xkTwAAMjl52Mc/0wUr0Fx+yPEL+Ji4=;
        b=W3YZh9KB2GsQ4JIwhnvEM8sk2q0m8q5Nb0qLPGERgq9AjvlnDa6IZ5mwzoC2MqiZIb
         569Tn9FsFPsRyzg+kCgpHtqqEqtACalmhXhWlR7CrsZMUglx+WHNKUxjGCVLhMubY93K
         21uox2fDFTxnk83VnQvgeRd22IE3uhe9W7WcZ/BkwfWQ8O7vxGI4QUzfIVINUHZ6akDx
         G4o8bay4C/luP22UwuyeApaftMP+18RjbrqEt/mji4XYqL9MGREvKLgNQIrshFshsa0k
         q/7TwWy8iRwQXTk6tZUBg0NyYIw70556lx2zFJwvD7sMX9ahS2Cwqg+GpvLaTwdL7r69
         rSjw==
X-Gm-Message-State: AOAM5310s9QwG9vghGi3HIBuJ8n2OFh8aBUbp5NxeV6+9GfUOKrJB4Bo
        QY2vBty12mok/eGYRNGhEGPASU04VHIjN5Ma
X-Google-Smtp-Source: ABdhPJzz1rwyz2vh+Ezx9pYFTMx4kmC/xaZ4SlrqqT6MjtyqC6xvt8h0O3Dz2Zp+MEjlpU0HVoMEtw==
X-Received: by 2002:a17:90b:33c6:: with SMTP id lk6mr1588157pjb.203.1630716000885;
        Fri, 03 Sep 2021 17:40:00 -0700 (PDT)
Received: from skynet-linux.local ([136.185.149.81])
        by smtp.googlemail.com with ESMTPSA id o2sm487823pgu.76.2021.09.03.17.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 17:40:00 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Vladimir Lypak <vladimir.lypak@gmail.com>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        James Willcox <jwillcox@squareup.com>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] drm/msm/mdp5: Add configuration for MDP v1.16
Date:   Sat,  4 Sep 2021 06:09:17 +0530
Message-Id: <20210904003919.36575-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903170844.35694-1-sireeshkodali1@gmail.com>
References: <20210903170844.35694-1-sireeshkodali1@gmail.com>
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

