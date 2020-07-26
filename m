Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3A422DE58
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jul 2020 13:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727878AbgGZLOf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jul 2020 07:14:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbgGZLOf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jul 2020 07:14:35 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07511C0619D2;
        Sun, 26 Jul 2020 04:14:35 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id q4so6843323edv.13;
        Sun, 26 Jul 2020 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=odkhAQTvRYESHiHGqpDynQYqs+08K37ujfoJpgK5xW8=;
        b=BWil68KsIDDYAqe6oxpdO98IqNFBgoGjsgfFXzj8jCJqWoxTYil9KyuW2hk9Oagmh+
         oupi2RpWAhncyOn5ZT2QO+EOjeB7+WOFsaeNYI6f8T+yx3bl5NS4THB/dzqhQ6XFlfMd
         LzEU5kPx67MURKnXl6VWifwP268jMDacRsl8cl2b0NN80oTan+vvxeCYdEGgxOKmnDpt
         D1neRCuEV/0KHdojYzJ5Im/T161KvIJ525H5ahZNI1AKrEBAPtPsSj3Ldjamf/kKUZ3z
         dzCh3SKPEvHA3jkQ1zjlRpYyW1p7nxYPskBkgZBB/0F0vG4JASY1REaA5XBy+F+iv0Oe
         PXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=odkhAQTvRYESHiHGqpDynQYqs+08K37ujfoJpgK5xW8=;
        b=XU1CxEPGTNFJvnvbvJ73mal2IdLJhk+Yns6mZGqJ2OLa0109DQ6pm+SM+SR3/EtORA
         TSD1vbNIizTNFpRWBUmP5y+i1EC9OdAJPydPmTuvwDU8fl4R1bxmkbEAsavU5WTp4rfg
         VZIv+BWFno6+SkZyPAPQERjpUUZ6H2QsZhgGQAkIKW6ygUuj7Ya6PGyxcY6PqaCGv832
         OMX4ULJSjcYS/UYzoraWQnivxs4iqc9k9V84Ujxf/1VY6QqtxRaLPvPzjhWBWoibiSvo
         A3V3dSXrLJm/qediO4hDsDVuKyeoS+ViYjK2ClFnpU9hDbkJG1hXhcSFgimY+8Vt0FE8
         5ZJQ==
X-Gm-Message-State: AOAM5316jLQgkFpb5p5C+1nVoJ0B8L+DnNldxGF7EjC+zGxkZh/ld5br
        mpC4nRvfnDRUqs+3PMI/yQ0=
X-Google-Smtp-Source: ABdhPJzm8S6QvxC7Jm7ur4kYYxIFDeXo8r8iCerJChS7geyPJpEr9L0UPhbdcwFKI2tl0oyxsMbwxw==
X-Received: by 2002:aa7:d654:: with SMTP id v20mr6147049edr.314.1595762073743;
        Sun, 26 Jul 2020 04:14:33 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 04:14:33 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     martin.botka1@gmail.com, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        zhengbin <zhengbin13@huawei.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Krzysztof Wilczynski <kw@linux.com>,
        Harigovindan P <harigovi@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Xiaozhe Shi <xiaozhes@codeaurora.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 7/9] drm/msm/mdp5: Add MDP5 configuration for SDM636/660
Date:   Sun, 26 Jul 2020 13:12:04 +0200
Message-Id: <20200726111215.22361-8-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726111215.22361-1-konradybcio@gmail.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This commit adds support for the MDP5 IP on Snapdragon
636/660.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 105 +++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 2e02de8a7e41..df10c1ac7591 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -1002,6 +1002,110 @@ static const struct mdp5_cfg_hw sdm630_config = {
 	.max_clk = 412500000,
 };
 
+static const struct mdp5_cfg_hw sdm660_config = {
+	.name = "sdm660",
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
+		.flush_hw_mask = 0xf4ffffff,
+	},
+	.pipe_vig = {
+		.count = 2,
+		.base = { 0x04000, 0x6000 },
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
+		.base = { 0x24000, 0x26000, 0x28000 },
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
+		.count = 4,
+		.base = { 0x44000, 0x45000, 0x46000, 0x49000 },
+		.instances = {
+				{ .id = 0, .pp = 0, .dspp = 0,
+				  .caps = MDP_LM_CAP_DISPLAY |
+					  MDP_LM_CAP_PAIR, },
+				{ .id = 1, .pp = 1, .dspp = 1,
+				  .caps = MDP_LM_CAP_DISPLAY, },
+				{ .id = 2, .pp = 2, .dspp = -1,
+				  .caps = MDP_LM_CAP_DISPLAY |
+					  MDP_LM_CAP_PAIR, },
+				{ .id = 3, .pp = 3, .dspp = -1,
+				  .caps = MDP_LM_CAP_WB, },
+				},
+		.nb_stages = 8,
+		.max_width = 2560,
+		.max_height = 0xFFFF,
+	},
+	.dspp = {
+		.count = 2,
+		.base = { 0x54000, 0x56000 },
+	},
+	.ad = {
+		.count = 2,
+		.base = { 0x78000, 0x78800 },
+	},
+	.pp = {
+		.count = 5,
+		.base = { 0x70000, 0x70800, 0x71000, 0x71800, 0x72000 },
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
+		.base = { 0x6a000, 0x6a800, 0x6b000, 0x6b800 },
+		.connect = {
+			[0] = INTF_DISABLED,
+			[1] = INTF_DSI,
+			[2] = INTF_DSI,
+			[3] = INTF_HDMI,
+		},
+	},
+	.max_clk = 412500000,
+};
+
 static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 0, .config = { .hw = &msm8x74v1_config } },
 	{ .revision = 2, .config = { .hw = &msm8x74v2_config } },
@@ -1016,6 +1120,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 
 static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
 	{ .revision = 0, .config = { .hw = &msm8998_config } },
+	{ .revision = 2, .config = { .hw = &sdm660_config } },
 	{ .revision = 3, .config = { .hw = &sdm630_config } },
 };
 
-- 
2.27.0

