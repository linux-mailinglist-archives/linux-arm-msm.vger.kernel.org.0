Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983C11C1F04
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2020 22:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgEAUwL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 May 2020 16:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbgEAUwK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 May 2020 16:52:10 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E970C061A0C;
        Fri,  1 May 2020 13:52:10 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id g13so12942781wrb.8;
        Fri, 01 May 2020 13:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=12JtCUsbZ+yUp2HpWHpScZpztaTEOKrSxTmHGBuq0XI=;
        b=XMuJ3VRSMmnxdQVoGSNb165xKuSdEDNoIVP8pSrhPxgU2KM3Bda13/Sw7sYV3xvxol
         xhWfZoSmsGD3+sG/0sETAj0feAM8YqB+NP/hvL7PatsMIuAmmu8gyBoKZT946NpmQqyO
         oiEiV6WVC3feL2jw7/xo5YyCKM1CbmUr5y+QMOuciVsv5ii/5xjw0C6v9KcK+eMJY3Hd
         x+fecNm5e74MZsAzGrQbokYAxVsZFwrC9l70JSrXs1+0lH9+RM6pMWBx6LrUv3oi9Y/U
         p4h0wYYQDpGZBzDaEEX8cqWYiXYN41kcZwGgz1UIhghAfi9PIF6TxUesOfwjV4C14MiX
         IzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=12JtCUsbZ+yUp2HpWHpScZpztaTEOKrSxTmHGBuq0XI=;
        b=mF7WnsLpZvh/nEqfgx7L/wyaCSg7FgKLPyz0MBh/qhuqQ9shzEtyCP03SPsgmkcUT8
         haLnH/2T9wcaF9UCv4jdE8b0LBeL/lUsxzO4+4R1Oe5lAS6PYSneKhMrqEGNnoAj+BJn
         7tDZDMM5xB2Ur7wDJzV0BnMi7KfAv3FAKj7VR3ltW7L2j4UvOM81lg02uyoltGsKKDFf
         GWp3lNj6bM5Q1A05avl/rFXwPkt888DbYZUAyZ+YE+2EbK+z6kqHnG3/uHsAp9l/9jd8
         vI0ngAA47Tb9YR85OsY27O2guxF7YrG1o0D/I/+Z3EDm99ULMvi1sd+qhziIUSh+iZ++
         sVeQ==
X-Gm-Message-State: AGi0PubTqJjaEzpc1/rAglQuVzzB8T29GymfkfuOh3W7q/S8vd6i4Q2L
        R3NLO9xDxzqNDBbPjAoSaio=
X-Google-Smtp-Source: APiQypLaF6TJ5hD+rLSGyVSptxrYBa9qeOx0rfL//IoFc6ei2aWIAaO6eINfl9t4+h1vHw3nSOB9YQ==
X-Received: by 2002:a5d:4248:: with SMTP id s8mr5841751wrr.216.1588366329072;
        Fri, 01 May 2020 13:52:09 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl. [83.6.170.125])
        by smtp.googlemail.com with ESMTPSA id d143sm1065098wmd.16.2020.05.01.13.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 13:52:08 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Allison Randal <allison@lohutok.net>,
        Alexios Zavras <alexios.zavras@intel.com>,
        zhengbin <zhengbin13@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: gpu: drm: Add MDP5 configuration for MSM8x36 and its derivatives, such as MSM8939.
Date:   Fri,  1 May 2020 22:51:59 +0200
Message-Id: <20200501205201.149804-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 70 ++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index e3c4c250238b7..1c7de7d6870cf 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -342,6 +342,75 @@ static const struct mdp5_cfg_hw msm8x16_config = {
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
+		.count = 1,
+		.base = { 0x44000 },
+		.instances = {
+				{ .id = 0, .pp = 0, .dspp = 0,
+				  .caps = MDP_LM_CAP_DISPLAY, },
+				},
+		.nb_stages = 8,
+		.max_width = 2048,
+		.max_height = 0xFFFF,
+	},
+	.pp = {
+		.count = 1,
+		.base = { 0x70000 },
+	},
+
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
 static const struct mdp5_cfg_hw msm8x94_config = {
 	.name = "msm8x94",
 	.mdp = {
@@ -840,6 +909,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 2, .config = { .hw = &msm8x74v2_config } },
 	{ .revision = 3, .config = { .hw = &apq8084_config } },
 	{ .revision = 6, .config = { .hw = &msm8x16_config } },
+	{ .revision = 8, .config = { .hw = &msm8x36_config } },
 	{ .revision = 9, .config = { .hw = &msm8x94_config } },
 	{ .revision = 7, .config = { .hw = &msm8x96_config } },
 	{ .revision = 11, .config = { .hw = &msm8x76_config } },
-- 
2.26.1

