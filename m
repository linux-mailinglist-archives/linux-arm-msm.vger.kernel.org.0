Return-Path: <linux-arm-msm+bounces-23733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CE09136E6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 01:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C24A1C21215
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 23:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172C682D9C;
	Sat, 22 Jun 2024 23:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gl9Q7sqo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A72780056;
	Sat, 22 Jun 2024 23:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719098761; cv=none; b=cfjCH8XvrcVdwJM9OIfHRxUFfGqGinl81lhHhCEBoxtrhWvtuamsGqZ+zAWsGvZm1o1fSz2XK52cK5/aBt6bJyt9ibw5obEVuhI4swyTd39+v/9D07YdWnV+GRj5vQyXpCd6AT9oIwiXyhc0ZovkqL0z9gGWXmOoMF4e87+iVZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719098761; c=relaxed/simple;
	bh=aW1EcPn7yp5cJwTqnBeh0dPDHZGWKayE/IkQrDcuX0Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DyK+stfiOCEcN0XgkbsvqvPDuvDH7dGm2SPeh7i2tRTZsV3BOeahlbDCDKmbU0HtGqAIVWYsUpl5rxDMe15uXv1bsjhFTRTl+6fVg2uz8p+rHYTgxnvY21XpgAwBkqGIBeBYInXOje0HnUQilloHGpwUlsCIWMIOHk1EnluZciI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gl9Q7sqo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42278f3aea4so27700005e9.1;
        Sat, 22 Jun 2024 16:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719098758; x=1719703558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNu7xeRP88jipeI6HHfobP1Qgyw76oR5Po2K0A0gOkc=;
        b=gl9Q7sqo7aCAjPQbnBlonNs6IBrYjm682DsMmgCHofaiGrBkRRIu+3ALFWSwrHkZwi
         07YaOBwHz/H9DOFW1WJ+P7LAmdKwLUTJpW7XEhdP2m19jH0ZyFhu3nnvXGOZMs1X5Fvs
         weIqZnonWUoZIMZuKkPiG5ovGeWhvH9B5G6qDo6vtQZsp2wqJ9ZLEbGwB+jX+gjSTrUU
         jEHrs1DErolrh02V4SpiUeWSs3XkIBDhytC+DJlwR0653hkByJ+PgchFTQtnfpgt2BA+
         m4Q1Z5pjLF42n/qRkQz4X7dCMRY1de8RufIU9prwgb+YlAsPvi+H/0C9ppBPgF0P9mrb
         2oFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719098758; x=1719703558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNu7xeRP88jipeI6HHfobP1Qgyw76oR5Po2K0A0gOkc=;
        b=I2V4111of6eyP3wOXfAN062x65V8GUGph0o3CCxu0b2e9FWRPWCputd98kEBMWdnPH
         HKKzm0mXv3kwoKE2HB5rRuXNCfT01d67cTceDY0+eU+B/cW5GWSagXb9U+swkzkiUyuL
         ctAkWECF8TAbqVM3xEsiPrZysRfnjsd223I/LqON2pMnpfjs81++pmxZJp0ZIW+y0zNw
         17bP/u0mCAqOSchRbxvMsEJPNOoHVuPqOD0UxiCtPTwYGtHhgYvrwTehcHqA6gmNu5CQ
         PhjXpACzh8Nk0/9xGQtfXLZlszo1glOnCAnz8Dr31zkCMrgcLDMA9xkDGWGHB3vhKfy1
         OX8g==
X-Forwarded-Encrypted: i=1; AJvYcCWB/dUhlgWh9FHpmwXJfwCurYhZH7piMqEhvUCkYxb0W9v00zV6HpqRvmFxj6nONV9Zq/oGpSCZlC3D3MFuwX5Y0IQgPVm0sTUgXEe7M5p9EEQH7TTwqu635yQ1NWQDrYUTl+akDj1ayA==
X-Gm-Message-State: AOJu0YzKl2SRW8bB0o8UJLh0QBcwYG65qdeeBSapP/3vOZn+gIRJE699
	J8FHVsf7sc5X7wLpjkSJ09NsOLIrjaG/qV4HTUiYJYxo4RpyhvNs5V2zeDGdcjI=
X-Google-Smtp-Source: AGHT+IH46DHY7jFQjqPPtgD7FXczy15ke69mR2FvCy0K0rrmLqtmKJ4cNCM9ziz8EjvCFharm4qOvQ==
X-Received: by 2002:a05:600c:68c:b0:421:de31:81 with SMTP id 5b1f17b1804b1-4248cc35d9cmr5842505e9.24.1719098757615;
        Sat, 22 Jun 2024 16:25:57 -0700 (PDT)
Received: from [192.168.1.90] (20014C4E18129200DEAEE2020304A5A2.dsl.pool.telekom.hu. [2001:4c4e:1812:9200:deae:e202:304:a5a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d2190desm120301875e9.48.2024.06.22.16.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 16:25:57 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 01:25:52 +0200
Subject: [PATCH 2/4] drm/msm/mdp5: Add MDP5 configuration for MSM8937
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v1-2-4ab560eb5bd9@gmail.com>
References: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
In-Reply-To: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
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
 Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.0

From: Daniil Titov <daniilt971@gmail.com>

Add the mdp5_cfg_hw entry for MDP5 version v1.14 found on msm8937.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 89 ++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index c5179e4c393c..6413c0d3e237 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -1011,6 +1011,94 @@ static const struct mdp5_cfg_hw msm8917_config = {
 	.max_clk = 320000000,
 };
 
+static const struct mdp5_cfg_hw msm8937_config = {
+	.name = "msm8937",
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
@@ -1325,6 +1413,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 9, .config = { .hw = &msm8x94_config } },
 	{ .revision = 7, .config = { .hw = &msm8x96_config } },
 	{ .revision = 11, .config = { .hw = &msm8x76_config } },
+	{ .revision = 14, .config = { .hw = &msm8937_config } },
 	{ .revision = 15, .config = { .hw = &msm8917_config } },
 	{ .revision = 16, .config = { .hw = &msm8x53_config } },
 };

-- 
2.45.2


