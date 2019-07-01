Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A01315C237
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 19:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727839AbfGARpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 13:45:11 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35573 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbfGARpL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 13:45:11 -0400
Received: by mail-pl1-f196.google.com with SMTP id w24so7716120plp.2;
        Mon, 01 Jul 2019 10:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=AO2x7+oDzyDn/msjFdHtB7Jf32S85kSlA4Ep+u5MEIY=;
        b=oe4KJUOZ24RJkPCDcui+GRK7jpx0+s309bJ2W1RNzhZOS35RJIqhxnMMgenbbj9Mjd
         eIV/LWTbxnfTQAqt801k8LE7acvcvBmUPiOPJrVGofq4oDoCgq2wXMua33MOhcMnOs60
         hjDOuCSSP7wDLb5ax8IVDwkqIhF8/C4QicSGpszeNKmv7reh1pPD97fbbBqu5HyaU+2s
         gI6BFai5LbQruDsabnw60DAysYsTIzJfS30KTXtsoT9Y2Obpg2gsfO2E/vg365j3H1ZG
         sgQj1EZpdollwWoYyai11ZNZ4eXOH585TS5ys4laEVxFsESml65Kvty97UyV6t+h65rE
         CEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AO2x7+oDzyDn/msjFdHtB7Jf32S85kSlA4Ep+u5MEIY=;
        b=o6MvT0+k/H2lL/QX0cjCoaScC+KS0OaJ9PBZ9HVPA+CvJeYh+C9z/W0TVmJYA9tW6K
         GaQpqJef3tSyWx9LAX/XYsbh9XWIlxOjyTnpSus0XTN5tJ0WSoErli/uN4RyvgZPFQjA
         sB7yyahxfsDlKdkooTOiDe/4VebAXr36AEs9LBhLWHBjWcQrQU6wwfBwWuj86EUOOn9I
         1kpjtJgKyw7B7AjYhzmVavF+BG18G0tocA7zc6kRBJhUEMaC2m+pJU/r7SLW/kuNeKKk
         VkqXnCu9EmINsbEWc/K2JZ74e3DsU/yF6PjHdsg0G1LhNqj0PKid4/IIS0mskQw4UZOm
         mNqA==
X-Gm-Message-State: APjAAAUQq1M11uskVWAwq9O3BeObaw4+djraJnz1cgMn7YiDXZx7Uzuu
        LlooJMuxDSBgVKJP4VPQMC0=
X-Google-Smtp-Source: APXvYqyWO/3l3ssw66kIcEbpjzILJWpJZV7XigaRPzarLuW9vxBabvjrGSA7Cl7GEMXnoZCyy4spIw==
X-Received: by 2002:a17:902:36c:: with SMTP id 99mr3180182pld.200.1562003110772;
        Mon, 01 Jul 2019 10:45:10 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id h11sm11814644pfn.170.2019.07.01.10.45.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 10:45:10 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH] drm/msm/mdp5: Add msm8998 support
Date:   Mon,  1 Jul 2019 10:45:06 -0700
Message-Id: <20190701174506.15625-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for MDP5 version v3.0 found on msm8998.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---

8998 support could probably be MDP5 or DPU.  This MDP5 support works,
but may not support all of the features that 8998 supports.  However,
DPU seems to only support 845 (MDP v4.0) with fundamental assumptions
about the base level a features supported, some of which 8998 does not
infact support, so DPU would likely need significant re-writes to
support 8998.  I'm not sure the effort is worth it since MDP5 needs so
little effort to support 8998.

 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 132 ++++++++++++++++++++++-
 1 file changed, 128 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index dd1daf0e305a..fb4762cec4f1 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -630,7 +630,115 @@ const struct mdp5_cfg_hw msm8917_config = {
 	.max_clk = 320000000,
 };
 
-static const struct mdp5_cfg_handler cfg_handlers[] = {
+const struct mdp5_cfg_hw msm8998_config = {
+	.name = "msm8998",
+	.mdp = {
+		.count = 1,
+		.caps = MDP_CAP_DSC |
+			MDP_CAP_CDM |
+			MDP_CAP_SRC_SPLIT |
+			0,
+	},
+	.ctl = {
+		.count = 5,
+		.base = { 0x01000, 0x01200, 0x01400, 0x01600, 0x01800 },
+		.flush_hw_mask = 0xf7ffffff,
+	},
+	.pipe_vig = {
+		.count = 4,
+		.base = { 0x04000, 0x06000, 0x08000, 0x0a000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SCALE	|
+			MDP_PIPE_CAP_CSC	|
+			MDP_PIPE_CAP_DECIMATION	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			0,
+	},
+	.pipe_rgb = {
+		.count = 4,
+		.base = { 0x14000, 0x16000, 0x18000, 0x1a000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SCALE	|
+			MDP_PIPE_CAP_DECIMATION	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			0,
+	},
+	.pipe_dma = {
+		.count = 2, /* driver supports max of 2 currently */
+		.base = { 0x24000, 0x26000, 0x28000, 0x2a000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			0,
+	},
+	.pipe_cursor = {
+		.count = 2,
+		.base = { 0x34000, 0x36000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			MDP_PIPE_CAP_CURSOR	|
+			0,
+	},
+
+	.lm = {
+		.count = 6,
+		.base = { 0x44000, 0x45000, 0x46000, 0x47000, 0x48000, 0x49000 },
+		.instances = {
+				{ .id = 0, .pp = 0, .dspp = 0,
+				  .caps = MDP_LM_CAP_DISPLAY |
+					  MDP_LM_CAP_PAIR, },
+				{ .id = 1, .pp = 1, .dspp = 1,
+				  .caps = MDP_LM_CAP_DISPLAY, },
+				{ .id = 2, .pp = 2, .dspp = -1,
+				  .caps = MDP_LM_CAP_DISPLAY |
+					  MDP_LM_CAP_PAIR, },
+				{ .id = 3, .pp = -1, .dspp = -1,
+				  .caps = MDP_LM_CAP_WB, },
+				{ .id = 4, .pp = -1, .dspp = -1,
+				  .caps = MDP_LM_CAP_WB, },
+				{ .id = 5, .pp = 3, .dspp = -1,
+				  .caps = MDP_LM_CAP_DISPLAY, },
+			     },
+		.nb_stages = 8,
+		.max_width = 2560,
+		.max_height = 0xFFFF,
+	},
+	.dspp = {
+		.count = 2,
+		.base = { 0x54000, 0x56000 },
+	},
+	.ad = {
+		.count = 3,
+		.base = { 0x78000, 0x78800, 0x79000 },
+	},
+	.pp = {
+		.count = 4,
+		.base = { 0x70000, 0x70800, 0x71000, 0x71800 },
+	},
+	.cdm = {
+		.count = 1,
+		.base = { 0x79200 },
+	},
+	.dsc = {
+		.count = 2,
+		.base = { 0x80000, 0x80400 },
+	},
+	.intf = {
+		.base = { 0x6a000, 0x6a800, 0x6b000, 0x6b800, 0x6c000 },
+		.connect = {
+			[0] = INTF_eDP,
+			[1] = INTF_DSI,
+			[2] = INTF_DSI,
+			[3] = INTF_HDMI,
+		},
+	},
+	.max_clk = 412500000,
+};
+
+static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 0, .config = { .hw = &msm8x74v1_config } },
 	{ .revision = 2, .config = { .hw = &msm8x74v2_config } },
 	{ .revision = 3, .config = { .hw = &apq8084_config } },
@@ -640,6 +748,10 @@ static const struct mdp5_cfg_handler cfg_handlers[] = {
 	{ .revision = 15, .config = { .hw = &msm8917_config } },
 };
 
+static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
+	{ .revision = 0, .config = { .hw = &msm8998_config } },
+};
+
 static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev);
 
 const struct mdp5_cfg_hw *mdp5_cfg_get_hw_config(struct mdp5_cfg_handler *cfg_handler)
@@ -668,8 +780,9 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
 	struct drm_device *dev = mdp5_kms->dev;
 	struct platform_device *pdev = to_platform_device(dev->dev);
 	struct mdp5_cfg_handler *cfg_handler;
+	const struct mdp5_cfg_handler *cfg_handlers;
 	struct mdp5_cfg_platform *pconfig;
-	int i, ret = 0;
+	int i, ret = 0, num_handlers;
 
 	cfg_handler = kzalloc(sizeof(*cfg_handler), GFP_KERNEL);
 	if (unlikely(!cfg_handler)) {
@@ -677,15 +790,26 @@ struct mdp5_cfg_handler *mdp5_cfg_init(struct mdp5_kms *mdp5_kms,
 		goto fail;
 	}
 
-	if (major != 1) {
+	if (major != 1 && major != 3) {
 		DRM_DEV_ERROR(dev->dev, "unexpected MDP major version: v%d.%d\n",
 				major, minor);
 		ret = -ENXIO;
 		goto fail;
 	}
 
+	switch (major) {
+	case 1:
+		cfg_handlers = cfg_handlers_v1;
+		num_handlers = ARRAY_SIZE(cfg_handlers_v1);
+		break;
+	case 3:
+		cfg_handlers = cfg_handlers_v3;
+		num_handlers = ARRAY_SIZE(cfg_handlers_v3);
+		break;
+	};
+
 	/* only after mdp5_cfg global pointer's init can we access the hw */
-	for (i = 0; i < ARRAY_SIZE(cfg_handlers); i++) {
+	for (i = 0; i < num_handlers; i++) {
 		if (cfg_handlers[i].revision != minor)
 			continue;
 		mdp5_cfg = cfg_handlers[i].config.hw;
-- 
2.17.1

