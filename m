Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74BA1CC084
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 12:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgEIKsT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 May 2020 06:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726877AbgEIKsS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 May 2020 06:48:18 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B09BC061A0C;
        Sat,  9 May 2020 03:48:18 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id r26so13400642wmh.0;
        Sat, 09 May 2020 03:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KPkpTBXFZk8/9lQwGo/IWPlBj9LHEhRMLSp+d9p19Sc=;
        b=Tr8y0xKXAra5GctwNvLtRyAa1bba2IwoqopYCSTNHICLbOXZewzdKG3+udL1UvFsh0
         lNiKP14hDcrxr64CbT5564HTEDJ4WPTLmMe8uAA84YyfqxxHW9/OyFLysZqeaKu5Cq8R
         7ME8lRPiqLeOlcacLG/JJICWBqAuafxmgACnP7pBZsuBk1AsX7k6fcfFbIqNiQyeQmjD
         qKMoe6YWOalzhwiYIlNfusY9r3SqQcDtMzVex3TZFjcPhRZgxTK5s66919wAkoOey45B
         b030+OHYlYaXzynu/V2dsq5Vzp4+nWzFKDqLRHN1/dft0MhE/sDZeCcZIzv0cMtYvsVm
         yA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KPkpTBXFZk8/9lQwGo/IWPlBj9LHEhRMLSp+d9p19Sc=;
        b=MDWFr3C+/9aat/Rt3NnQ0v/ycjyF4knr6/PTE2+5FOmYgJDNSCvYlZ64CdAlQTpOKT
         dknvzNGl8caIKVrasCUNlMAUWgT6RZDTW+9Sc5aN2j0izc9hE0Ke1S1FFkgFB4V6a0Ui
         kxr/07xGlUxEGDNGMV43UWdKrIoplOUiD1aijT7EWd82p68mU9hO7VsruobMFHWxJ8Vo
         FHfGBpnrkOtnQIp0XPlHXoSo3IpSrge0k954vg6Xs5sgyryRibx4OxVDNhGUFTWb06Py
         UZppFE1Gjzp8gxghE4fkZiiFPEeavAQtX+Qe/i33QZdMuhB9FfVyDyEqoeQ2PNruGpCP
         3Mbg==
X-Gm-Message-State: AGi0PuaqL9iFjNj9NrAUyfYjKc8WwTz7nVkqdwhNlER6y8hPlI7Rb6rc
        JNMEcTSuHYUmNfXxZBR7lAI=
X-Google-Smtp-Source: APiQypKzJQGVgMUTZFyTGkaa+3CHh+R+8aV9dtiRSenGbepLQYS189mR2vWZ/oegBvt0gO7U8I+WjA==
X-Received: by 2002:a05:600c:24cf:: with SMTP id 15mr20121734wmu.94.1589021296925;
        Sat, 09 May 2020 03:48:16 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl. [83.6.170.125])
        by smtp.googlemail.com with ESMTPSA id p7sm7819484wrf.31.2020.05.09.03.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2020 03:48:16 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        zhengbin <zhengbin13@huawei.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [v2 PATCH] drivers: gpu: drm: Add MDP5 configuration for MSM8x36.
Date:   Sat,  9 May 2020 12:48:10 +0200
Message-Id: <20200509104812.202981-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change adds MDP5 configuration for MSM8x36-based SoCs,
like MSM8936, 8939 and their APQ variants.
The configuration is based on MSM8916's, but adds some notable
features, like ad and pp blocks, along with some register
changes.

changes since v1:
- add an ad block
- add a second mixer @ 0x47000
- adjust .max_width
- write a more descriptive commit message

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 76 ++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index e3c4c250238b7..a7df8dbffdc2b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -342,6 +342,81 @@ static const struct mdp5_cfg_hw msm8x16_config = {
 	.max_clk = 320000000,
 };
 
+static const struct mdp5_cfg_hw msm8x36_config = {
+	.name = "msm8x36",
+	.mdp = {
+		.count = 1,
+		.base = { 0x0 },
+		.caps = MDP_CAP_SMP |
+			0,
+	},
+	.smp = {
+		.mmb_count = 8,
+		.mmb_size = 10240,
+		.clients = {
+			[SSPP_VIG0] = 1, [SSPP_DMA0] = 4,
+			[SSPP_RGB0] = 7, [SSPP_RGB1] = 8,
+		},
+	},
+	.ctl = {
+		.count = 3,
+		.base = { 0x01000, 0x01200, 0x01400 },
+		.flush_hw_mask = 0x4003ffff,
+	},
+	.pipe_vig = {
+		.count = 1,
+		.base = { 0x04000 },
+		.caps = MDP_PIPE_CAP_HFLIP | MDP_PIPE_CAP_VFLIP |
+				MDP_PIPE_CAP_SCALE | MDP_PIPE_CAP_CSC |
+				MDP_PIPE_CAP_DECIMATION,
+	},
+	.pipe_rgb = {
+		.count = 2,
+		.base = { 0x14000, 0x16000 },
+		.caps = MDP_PIPE_CAP_HFLIP | MDP_PIPE_CAP_VFLIP |
+				MDP_PIPE_CAP_DECIMATION,
+	},
+	.pipe_dma = {
+		.count = 1,
+		.base = { 0x24000 },
+		.caps = MDP_PIPE_CAP_HFLIP | MDP_PIPE_CAP_VFLIP,
+	},
+	.lm = {
+		.count = 2,
+		.base = { 0x44000, 0x47000 },
+		.instances = {
+				{ .id = 0, .pp = 0, .dspp = 0,
+				  .caps = MDP_LM_CAP_DISPLAY, },
+				{ .id = 1, .pp = -1, .dspp = -1,
+				  .caps = MDP_LM_CAP_WB, },
+				},
+		.nb_stages = 8,
+		.max_width = 2560,
+		.max_height = 0xFFFF,
+	},
+	.pp = {
+		.count = 1,
+		.base = { 0x70000 },
+	},
+	.ad = {
+		.count = 1,
+		.base = { 0x78000 },
+	},
+	.dspp = {
+		.count = 1,
+		.base = { 0x54000 },
+	},
+	.intf = {
+		.base = { 0x00000, 0x6a800, 0x6b000 },
+		.connect = {
+			[0] = INTF_DISABLED,
+			[1] = INTF_DSI,
+			[2] = INTF_DSI,
+		},
+	},
+	.max_clk = 366670000,
+};
+
 static const struct mdp5_cfg_hw msm8x94_config = {
 	.name = "msm8x94",
 	.mdp = {
@@ -840,6 +915,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 2, .config = { .hw = &msm8x74v2_config } },
 	{ .revision = 3, .config = { .hw = &apq8084_config } },
 	{ .revision = 6, .config = { .hw = &msm8x16_config } },
+	{ .revision = 8, .config = { .hw = &msm8x36_config } },
 	{ .revision = 9, .config = { .hw = &msm8x94_config } },
 	{ .revision = 7, .config = { .hw = &msm8x96_config } },
 	{ .revision = 11, .config = { .hw = &msm8x76_config } },
-- 
2.26.2

