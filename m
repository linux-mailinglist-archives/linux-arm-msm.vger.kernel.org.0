Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0630522DE52
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jul 2020 13:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727983AbgGZLOX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jul 2020 07:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727892AbgGZLOX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jul 2020 07:14:23 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30EAAC0619D2;
        Sun, 26 Jul 2020 04:14:23 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id kq25so1276561ejb.3;
        Sun, 26 Jul 2020 04:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=37BF1UwxVP7CixpP1U6Ina051uTwRlG/juDBdj9kXV4=;
        b=YXAZG2TJKcydz5dEyEcSkHS1L5TwH6/lU+Vvf6qFl3eFLWq0tk6ftDpI3RM0Y6WZZC
         Ic0APMwNKBbIwG24yj7aEonzyJCMqIMYPKgE68dPyC5DKROwn/CtRTu2dW2YsPWaPmJR
         ImUyqE+J+bXk4CMa/bAMkI3jNdbEWeg7tEqs2zzuFmmfUEZEYoeDkZfY87joNawLu0g/
         fCIgQ8pUlg979SghIRlS1hF4c7jHZws+9rP221oy/7xDgSpBI3V+SmENpT16dbrcBXfn
         AWgI7zF8WRS8Y1e02nxyrO0S32sHoBqsn6jZOBZ+AqpeVH9vhA0MqUvtRWyk6UlMYR2V
         5PgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=37BF1UwxVP7CixpP1U6Ina051uTwRlG/juDBdj9kXV4=;
        b=AkbtpHTh+H8y4Ya+7aAG+gdFaCr1/dnHbvm4TOChAic0gAs6rH5gvzebBYOqDufCCc
         hfnUILW/ZndRzLa0Kg9KaapuItB1WjTDYCj60XW4FKsAfwjJRRvPAzsxSlNFdycast2z
         l5GYmcc+3gEASRHrUTTQN+zTid10xAJvKq6gbdIkCw/K2pGThPJ7n/52b8kDJXgkHu/k
         Q/nE6UKkmVtMQVeME+H4nfVRDOkAzcPqpd5+VYXT0YnQ6wQCwgm17+zDx3D+x6viFISb
         dZFug7WmyyY2KxxmDR5rH41WqzV40heIEg7J5toqhtdmsQ9U+P5gUP+nEjlb85wc7gr3
         kFQQ==
X-Gm-Message-State: AOAM533DTVeHMtZJuU1aOQHdPnVwNeMqbJmgTTlS/RvwBORtEKnPEBwm
        /jBaDYjBmQaPNumtKmMq2zo=
X-Google-Smtp-Source: ABdhPJwTeEEQ2ZXZVpgawfqhB50ZrkrMpC5+cmMg9MzlJgq+tYGn96zmWoVuMYZ86Q5HRvZmLGQ2bw==
X-Received: by 2002:a17:906:8489:: with SMTP id m9mr14318876ejx.94.1595762061902;
        Sun, 26 Jul 2020 04:14:21 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl. [83.6.167.207])
        by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 04:14:21 -0700 (PDT)
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
Subject: [PATCH 6/9] drm/msm/dsi: Add DSI configuration for SDM660
Date:   Sun, 26 Jul 2020 13:12:03 +0200
Message-Id: <20200726111215.22361-7-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726111215.22361-1-konradybcio@gmail.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This also applies to sdm630/636 and their SDA
counterparts.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 813d69deb5e8..f892f2cbe8bb 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -149,6 +149,25 @@ static const struct msm_dsi_config msm8998_dsi_cfg = {
 	.num_dsi = 2,
 };
 
+static const char * const dsi_sdm660_bus_clk_names[] = {
+	"iface", "bus", "core", "core_mmss",
+};
+
+static const struct msm_dsi_config sdm660_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.reg_cfg = {
+		.num = 2,
+		.regs = {
+			{"vdd", 73400, 32 },	/* 0.9 V */
+			{"vdda", 12560, 4 },	/* 1.2 V */
+		},
+	},
+	.bus_clk_names = dsi_sdm660_bus_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_sdm660_bus_clk_names),
+	.io_start = { 0xc994000, 0xc996000 },
+	.num_dsi = 2,
+};
+
 static const char * const dsi_sdm845_bus_clk_names[] = {
 	"iface", "bus",
 };
@@ -240,6 +259,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&msm8996_dsi_cfg, &msm_dsi_6g_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_4_2,
 		&msm8976_dsi_cfg, &msm_dsi_6g_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_1_0,
+		&sdm660_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_0,
 		&msm8998_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_2_1,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 217e24a65178..efd469d1db45 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -18,6 +18,7 @@
 #define MSM_DSI_6G_VER_MINOR_V1_3_1	0x10030001
 #define MSM_DSI_6G_VER_MINOR_V1_4_1	0x10040001
 #define MSM_DSI_6G_VER_MINOR_V1_4_2	0x10040002
+#define MSM_DSI_6G_VER_MINOR_V2_1_0	0x20010000
 #define MSM_DSI_6G_VER_MINOR_V2_2_0	0x20000000
 #define MSM_DSI_6G_VER_MINOR_V2_2_1	0x20020001
 #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
-- 
2.27.0

