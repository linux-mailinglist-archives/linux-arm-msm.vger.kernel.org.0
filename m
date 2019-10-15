Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F87D72DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 12:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727625AbfJOKLH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 06:11:07 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36397 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730158AbfJOKLH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 06:11:07 -0400
Received: by mail-wr1-f66.google.com with SMTP id y19so23125246wrd.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2019 03:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NM0ZQ0YqLj9AAkiTqqi3iRVNKR68xa3LpemkjK2oJlo=;
        b=cCi+p6beTsj9Yuz4bUkH9Vw5ZE6UE4ZhmyLPBEfR1p4bn6Ncll7Ic7/qG0UWV2ZHkE
         PDoWqmtjoYMp/AVgyW7PTFDrlFMVgdxl+nBaE7KAH6UHgYPATIh3FajubajMTOR85VpB
         aQn/ewD+3sNG/lTpPGukWGhkfmC8fX9mX1yZDwoCITtYZKm17RcCumKpZCUqWm43ZyiB
         29SsLnqxfL4h+bAxvTwdS66sLC4PoT6fz0wM8+TmB/ydBbtVs7y2Toxs/bfqBZOp11vJ
         SebFLxUyt3NYqNeBAj9/vBTTf93HQxwfh2yg1Jpxk3BYSQmAv54oV3wDZgB6+JPYnJWc
         Mvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NM0ZQ0YqLj9AAkiTqqi3iRVNKR68xa3LpemkjK2oJlo=;
        b=IsZcH3Fe/A6/3QjvkAstPB2kD8GlKB8jEx5/pSJxEAS7rvaRXm3QuNJkvA9OeDakwm
         qmWc4MaekfU4gMpyJaKR7zX2jQJtOgIFss0gdf2+cenZp/QuAhMz4/yuPYA8f2LCGOZL
         ETmSOJ3nzJTLB5ZJnUuwtnS8TEL6GMf0PFx4SdudyEB24JRC4fQmCoRyYPdptc/oK3na
         jX3SGxtSIJJBNr/92rFjo1uQIBgxFtOn2b4jaIX5KaJDxqvvWCJWbI0ks3g8jDtM95gj
         F3IDqCNF5kDgG2S0oVDQGLpeyzDJ8nzXUS8R2zsE1p5c5F0Nmo/NAohj0r2RLq2HTZaP
         r6Uw==
X-Gm-Message-State: APjAAAVAJZ+LugZaWcYWhAfWvQ5TXCRjksPAemdiHL/4MngER/FDFyuC
        PFj+Vvk8DQdjRRpaHce5OlI3BsTKfo0ggA==
X-Google-Smtp-Source: APXvYqzOdcC7RRLBjTc2K334M0Fr5ZEwG3WffQCqGTmKWtSovwVaphVJ6E4lNlM5CeQMkcNcCKu5tQ==
X-Received: by 2002:adf:e542:: with SMTP id z2mr12482426wrm.338.1571134264591;
        Tue, 15 Oct 2019 03:11:04 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id y186sm42778837wmd.26.2019.10.15.03.11.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 03:11:04 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 3/7] drm/msm/mdp5: Add configuration for msm8x76
Date:   Tue, 15 Oct 2019 12:10:54 +0200
Message-Id: <20191015101058.37157-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191015101058.37157-1-kholk11@gmail.com>
References: <20191015101058.37157-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add the configuration entries for the MDP5 v1.11, found on
MSM8956, MSM8976 and APQ variants.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 98 ++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 7c9c1ddae821..1f48f64539a2 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -545,6 +545,103 @@ static const struct mdp5_cfg_hw msm8x96_config = {
 	.max_clk = 412500000,
 };
 
+const struct mdp5_cfg_hw msm8x76_config = {
+	.name = "msm8x76",
+	.mdp = {
+		.count = 1,
+		.caps = MDP_CAP_SMP |
+			MDP_CAP_DSC |
+			MDP_CAP_SRC_SPLIT |
+			0,
+	},
+	.ctl = {
+		.count = 3,
+		.base = { 0x01000, 0x01200, 0x01400 },
+		.flush_hw_mask = 0xffffffff,
+	},
+	.smp = {
+		.mmb_count = 10,
+		.mmb_size = 10240,
+		.clients = {
+			[SSPP_VIG0] = 1, [SSPP_VIG1] = 9,
+			[SSPP_DMA0] = 4,
+			[SSPP_RGB0] = 7, [SSPP_RGB1] = 8,
+		},
+	},
+	.pipe_vig = {
+		.count = 2,
+		.base = { 0x04000, 0x06000 },
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
+		.base = { 0x440DC },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			MDP_PIPE_CAP_CURSOR	|
+			0,
+	},
+	.lm = {
+		.count = 2,
+		.base = { 0x44000, 0x45000 },
+		.instances = {
+				{ .id = 0, .pp = 0, .dspp = 0,
+				  .caps = MDP_LM_CAP_DISPLAY, },
+				{ .id = 1, .pp = -1, .dspp = -1,
+				  .caps = MDP_LM_CAP_WB },
+			     },
+		.nb_stages = 8,
+		.max_width = 2560,
+		.max_height = 0xFFFF,
+	},
+	.dspp = {
+		.count = 1,
+		.base = { 0x54000 },
+
+	},
+	.pp = {
+		.count = 3,
+		.base = { 0x70000, 0x70800, 0x72000 },
+	},
+	.dsc = {
+		.count = 2,
+		.base = { 0x80000, 0x80400 },
+	},
+	.intf = {
+		.base = { 0x6a000, 0x6a800, 0x6b000 },
+		.connect = {
+			[0] = INTF_DISABLED,
+			[1] = INTF_DSI,
+			[2] = INTF_DSI,
+		},
+	},
+	.max_clk = 360000000,
+};
+
 static const struct mdp5_cfg_hw msm8917_config = {
 	.name = "msm8917",
 	.mdp = {
@@ -745,6 +842,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 6, .config = { .hw = &msm8x16_config } },
 	{ .revision = 9, .config = { .hw = &msm8x94_config } },
 	{ .revision = 7, .config = { .hw = &msm8x96_config } },
+	{ .revision = 11, .config = { .hw = &msm8x76_config } },
 	{ .revision = 15, .config = { .hw = &msm8917_config } },
 };
 
-- 
2.21.0

