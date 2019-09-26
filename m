Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCF0BF06E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 12:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbfIZKxZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 06:53:25 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53086 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbfIZKxY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 06:53:24 -0400
Received: by mail-wm1-f68.google.com with SMTP id r19so2192452wmh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2019 03:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y8yDViXpHqhxHd9Sp8XJBl9klumTFt9ab9bndlNAw2U=;
        b=ax1mYLD/99/JZuOwkYm2ZyNQqSQfcLi8XFC1aePHrMa+BA0T51Wfv1o57sLsFVi5F/
         9M+5CMVb4Y6uOGvuLCxdlDFkM99Lajm7bQqy6YRpwpot1pls3YCD0+0Zr8648r87l1YC
         fu53EMnSdcZglEFbfeM5TCcZikfLautOFAR7vVREhMPn2gnac20JuwjenCtaDAMA/cQl
         Ji5jFvEGXudd/2XIQQf32UB2Th5X6/AZRssTM+nshMNWXlD2tApUxuQ7nLmwXe3tXPRF
         Zn6K9O2PBUuA2v/eAbQcF2UH1X+YT+bIur0zdvzAGABPWZgKu9Qp3JoMswfE4pTY5X97
         QR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y8yDViXpHqhxHd9Sp8XJBl9klumTFt9ab9bndlNAw2U=;
        b=FjNH9iNwku5t8oXxXHoU8KR9LhV9z9SPkoweTQQ4V+u2084ACjcHXoooiQTuF7kPDM
         vOaQ8N8Wud/1aF18SEDIQbrnjDk6XLijoviCoffDD26GB3daUkshcI5SnbsV63ow0K62
         6uYifrSv4PBvv0AwZ7+Yez62DOj07N559QLNXWTyI2Wu7fmdZW4tqIlxCe6iWiLrO1s2
         xzrnlLIeOnlaG+xpArgt70KE66mFZSUlYwdx+6NLtP+9UMGMDeTXzICIYKT6dbkyXd+V
         aLfwcCZ9yf5VGt0y0E+9/EIDwQNTJxlMl0b+i+Zqu+u9JEQ9B0O02Djm66V8PVZKZgg2
         QlbA==
X-Gm-Message-State: APjAAAXXmdWrfRF9e30b7ZYgxKijZD5vlkeMaQ/AI2B3YCOB4CMSJNkN
        1p/3++lA73OZWbTWVEx7+QtjfQaqr7c=
X-Google-Smtp-Source: APXvYqxHKiSKDIkH52EYtP2NAKD9BHkmYN6rC6FXOvuQNiUjUlnJAbDsCCocwagEf+z03SHw34Qc4A==
X-Received: by 2002:a1c:a7c6:: with SMTP id q189mr2338459wme.22.1569495202312;
        Thu, 26 Sep 2019 03:53:22 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id d9sm3468412wrc.44.2019.09.26.03.53.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 03:53:21 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
        jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/5] drm/msm/mdp5: Add configuration for msm8x56
Date:   Thu, 26 Sep 2019 12:52:53 +0200
Message-Id: <20190926105256.61412-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926105256.61412-1-kholk11@gmail.com>
References: <20190926105256.61412-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

Add the configuration entries for the MDP5 v1.11, found on MSM8956
and APQ8056.

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 99 ++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index dd1daf0e305a..9ff44e7fc7c7 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -545,6 +545,104 @@ const struct mdp5_cfg_hw msm8x96_config = {
 	.max_clk = 412500000,
 };
 
+const struct mdp5_cfg_hw msm8x56_config = {
+	.name = "msm8x56",
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
+
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
 const struct mdp5_cfg_hw msm8917_config = {
 	.name = "msm8917",
 	.mdp = {
@@ -637,6 +735,7 @@ static const struct mdp5_cfg_handler cfg_handlers[] = {
 	{ .revision = 6, .config = { .hw = &msm8x16_config } },
 	{ .revision = 9, .config = { .hw = &msm8x94_config } },
 	{ .revision = 7, .config = { .hw = &msm8x96_config } },
+	{ .revision = 11, .config = { .hw = &msm8x56_config } },
 	{ .revision = 15, .config = { .hw = &msm8917_config } },
 };
 
-- 
2.21.0

