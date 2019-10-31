Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66DECEADB5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 11:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbfJaKoP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 06:44:15 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43785 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbfJaKoO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 06:44:14 -0400
Received: by mail-wr1-f67.google.com with SMTP id n1so5658428wra.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2019 03:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NM0ZQ0YqLj9AAkiTqqi3iRVNKR68xa3LpemkjK2oJlo=;
        b=ZjLZfc7nE+46nibZZiP0fBMLPB+5vGGJh5lEBWo3TmzmDxhvT3nO2okc+6tkBEW9Eg
         1hi/aRP6qhzbjvIfWBVRz1IGfkKCjBpzkYCxceGXHHy6o4dys75BmrL4VvMDpUgsQ/58
         vi2LZXBYHcFhliqVZEIFAnD8Xos/ujbRBqfKDyxaCGJbqiLK359pt5CZ+ozaeHpvcwZP
         eFXHEHX0Xl9p5ihQs9Sl7WTulNSTEMyORcZcPK2ljOy/9AYGX++X6i8SGL3yvuxlzGVw
         kL8KU5ZayxDME0bDDtf82yW3v6Cep7pQSyNGAwUPJxR4LI7p1L0SKyLDNcGb7fed7ed4
         6ebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NM0ZQ0YqLj9AAkiTqqi3iRVNKR68xa3LpemkjK2oJlo=;
        b=mAuIZb1b2NCyZ7aPPFIcTzhxfKIbMIXmw4fTD7oMgz4Y7iRgtO4YJyL/1DtAMBUD5D
         SttQzIxML0QB+4feVQenuc1zNXFeAZq8Yu7KMGHpIVoa58VS+TTMteTSbphQlk5uSZCV
         LJwSlV6v605tEC9pRqy4CQyuflvg6EJyn6AQJD6FNw17mRALka461B2UOy+yz3pB8eVN
         885epyYtnCMcdRHB41bkCFK/3PEIAO1cYPbW4f3juGHBLZVqOMN7YJHwu7D9gYE6cy8n
         QYBZU9YYV9P0xNCPndUoY7/2C6VTfANcTivsgJaWdF7W+LazY4J7Y3RWH2BojNN0vDi7
         +hMw==
X-Gm-Message-State: APjAAAX4vJv2uUwUekb1+pR1zI9Ra7r3jGSNedPI1bgOkiQBcHAJNNio
        rjxkA28fOGpNLb6gJLQsVgDCqobJbZg=
X-Google-Smtp-Source: APXvYqwwV2FDAYew06BczHOcmRSBKQ86j1b6KPyVWTtXbhIIaRTinyvwMpz24ADKRLRF+C7LZg345w==
X-Received: by 2002:adf:f685:: with SMTP id v5mr5092282wrp.246.1572518651782;
        Thu, 31 Oct 2019 03:44:11 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id q25sm4141389wra.3.2019.10.31.03.44.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Oct 2019 03:44:11 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 3/7] drm/msm/mdp5: Add configuration for msm8x76
Date:   Thu, 31 Oct 2019 11:43:58 +0100
Message-Id: <20191031104402.31813-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191031104402.31813-1-kholk11@gmail.com>
References: <20191031104402.31813-1-kholk11@gmail.com>
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

