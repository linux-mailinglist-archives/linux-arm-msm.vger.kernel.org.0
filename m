Return-Path: <linux-arm-msm+bounces-23791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98648913E1E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 22:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 534B0281DD3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 20:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6397F185E59;
	Sun, 23 Jun 2024 20:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyZuaK6i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A114818509C;
	Sun, 23 Jun 2024 20:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719174648; cv=none; b=Q0WxnfWw/h8HJU6QH2okarbWFurSw9yY3bSBiUpbpVPaw3D1svRFZIXtIcG5/kAunogPsofaPy/afzoMMI+pRhxWjNWyoubKWCNk90uyCixqnFurESW2pnzRsBqa0V2S08ujMzhit+O3zRuWsQtR1G457PhIxBIWTowJidD666o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719174648; c=relaxed/simple;
	bh=yhOYS/9FzCoKFqg5QuOKMh14E/pcAsr+79fAB77M6Pk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hdjVxRnrbawsp7JbTwBTVcIIAA1iwEytGWizuuXhChEIi+h2VeNdew95IHoObyHLuFWDPjljNClYGPbZS2bW5V2wdkEV1qM4xPlyVQG1gUMXPYRbaAhgAp05v6EKB6fWZc43BzCgEZk5bmLTd3/UcE0eWcV61aghLeqCbgxEXOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyZuaK6i; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-366dcd21604so1136984f8f.1;
        Sun, 23 Jun 2024 13:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719174644; x=1719779444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WcQwj4t9zR+7uYrgBkNTvxKkblY1AhgJTZPnMnuWT20=;
        b=QyZuaK6iQOnAkrk94vX6yH7VNJdGDPG/IOqeU2VRhRXxJqGDQD6n229gEWBJypk4JK
         rVVAt0NK74PTnHl5tIbTmtHfWQMBpAWnIidFMyn8kXTtnRHYFlEBorQ2cD+T+vNo4tAL
         b+IH2anvCkjOe2UQ9ZKFSindaDlFQJYrGTQJpVwSCebRBeCos9HF+kKF8ZArrjVjBBBu
         WrMeum1dmlhzVlfrKZG3wONE0CoDseHyOZeC50pDDuv6Cs9qnmWYcsCtqiHId20z1iXT
         OdqcMqOJ9pdQNyIpypWhiWjOKoZx3GO7gj4mgKbVU4Ooiv+LHVQ0KwU/bmCBJ60q84j9
         D15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719174644; x=1719779444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcQwj4t9zR+7uYrgBkNTvxKkblY1AhgJTZPnMnuWT20=;
        b=h+C/t19rQN9ymMG4LjiH2/E+VoP7DGvojzSAvCxImc9rfWV02awZcHXAkQy+wpU3UO
         2wcmcm74Lp61NGQm82LEv7xBmByjBUtXz61foL0umKbly8PR6fFED7poy2oeiAcxhkJT
         swqOO4WgbSk3LjuZJL68YfGpmumzXk4SCChaq1qkyuaTV2sJJVVCG9nr24WdwetUxhAi
         gFOev77nz1G4EIwLzsPMS/K0QzCTsWArTOflxJ1HVBImNIASf2kMjARs/S8Ub36tlC1k
         Cud33x1UFQBej/pkG6pQ1OiLwqaCG2nBVF7tH0NKHupgjzg4b6OVlE/v4QqU6bTYHplw
         lwbA==
X-Forwarded-Encrypted: i=1; AJvYcCX3PDddft63cODVYFaO9OtDVqgOe/WER0D/UsCF2ilWvtgBJFdsiAZu8uAM/40Cy8bZnVjPg0lJWBuA+vSnjWkTr5dl5T5/OFwhzQs2hMvj+lPISzsXADKOSJlnWT2s/yNBbjkoEI/7GbjWkN7pzN5NeZUpyN0y4R1FepafVY8dffstIlQq
X-Gm-Message-State: AOJu0YxwEW89MmOdQdIoJk3uzZLjFmODcgItYSWB/D3aiiZbHBA+uw1T
	liTMz+5DCcXtsY4roWLXMdg/qIEksUhmobyiDsKcMptNMIaYDIXx
X-Google-Smtp-Source: AGHT+IGQquz5k2BVLGaucgi4cKq8o9F9G60dY1wEBUIUTqJaF6oBnYohr7FR/h/6RtTQnKBlHZ0zVA==
X-Received: by 2002:a05:6000:1f83:b0:366:f496:c0c2 with SMTP id ffacd0b85a97d-366f496c101mr220821f8f.6.1719174644185;
        Sun, 23 Jun 2024 13:30:44 -0700 (PDT)
Received: from [192.168.1.130] (BC2492F3.dsl.pool.telekom.hu. [188.36.146.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b8ad2sm8088599f8f.33.2024.06.23.13.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 13:30:43 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 22:30:37 +0200
Subject: [PATCH v2 2/4] drm/msm/mdp5: Add MDP5 configuration for MSM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v2-2-a0ca70fb4846@gmail.com>
References: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
In-Reply-To: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>, 
 phone-devel@vger.kernel.org, Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.0

From: Daniil Titov <daniilt971@gmail.com>

Add the mdp5_cfg_hw entry for MDP5 version v1.14 found on msm8937.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 88 ++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index c5179e4c393c..fac8e276da52 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -1011,6 +1011,93 @@ static const struct mdp5_cfg_hw msm8917_config = {
 	.max_clk = 320000000,
 };
 
+static const struct mdp5_cfg_hw msm8937_config = {
+	.name = "msm8937",
+	.mdp = {
+		.count = 1,
+		.caps = MDP_CAP_CDM,
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
+		.count = 2,
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
+		.base = { 0x00000, 0x6a800, 0x6b000 },
+		.connect = {
+			[0] = INTF_DISABLED,
+			[1] = INTF_DSI,
+			[2] = INTF_DSI,
+		},
+	},
+	.max_clk = 320000000,
+};
+
 static const struct mdp5_cfg_hw msm8998_config = {
 	.name = "msm8998",
 	.mdp = {
@@ -1325,6 +1412,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 9, .config = { .hw = &msm8x94_config } },
 	{ .revision = 7, .config = { .hw = &msm8x96_config } },
 	{ .revision = 11, .config = { .hw = &msm8x76_config } },
+	{ .revision = 14, .config = { .hw = &msm8937_config } },
 	{ .revision = 15, .config = { .hw = &msm8917_config } },
 	{ .revision = 16, .config = { .hw = &msm8x53_config } },
 };

-- 
2.45.2


