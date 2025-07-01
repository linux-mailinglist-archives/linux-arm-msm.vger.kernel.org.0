Return-Path: <linux-arm-msm+bounces-63273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FEDAF01D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 19:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89AC81899D95
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 17:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDA0280A56;
	Tue,  1 Jul 2025 17:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URnl0zTN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DB927FD45
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 17:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390940; cv=none; b=ExSSsQ2nWLqdc/47oTShbIkJvanMpjz1lKgAu+sNnkUCyjkBdDwG9yhg1sHyOzl+iMf8FIgeC54740TIrNjjKfG9fE2zNv6eQCQiJCHaz+ndeRfyDNrEG/goisYMgvFfke5z+kwT8jpU+pBFeYuQQqhKp5N7U8sqayEk4Cp8SGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390940; c=relaxed/simple;
	bh=MDNAebsy+Mi3ASrl6aegA1x7VqUr0MZiP8pOhziKEJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e7I1IdidZwb94kI3Id57iNQS2h+qh8kKgieRiPM1YbossML/mvmhvO0J+drtk2lupj3/3BAvtF9wbX+i2WVihcoUZP3d9abm9TV+KItR2JYYEGM4Yus9OSYD71LoKowMa92S4pw32GcErkofq5OAggUJOlEa3jpyE6vPlVW0B/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URnl0zTN; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so3902734f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 10:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751390937; x=1751995737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LprHnzf3Ga8gFToTGu+6UNkCcfwqLEwWhp8zeax+d+o=;
        b=URnl0zTNGaDyx72JhDvGboESMKAI/Uh37pxmnpT2MOYCCWQ3SlytGIHcTLJidwlMSI
         YgTybkmUs69GhlYottSqhbW27C5LvWyQ0ddf/tEZR9131hJz3m/AJxezvUrAG7YpCuda
         0Gq1BuCLHC724ax9UVCv1ym0diZkVAYsUvqebyXdrhHCoXdToNkeJVt2yRXBcU3td95p
         6RSSYC4yx6MMidthyB2H3ox2dlYFJjhxBseAKQC9LpcrxactKV3zQA8YxUF3VnYFYn1H
         2Uvunn9f8rHgHDB6SyqgqwKECB+kLisLvnTRS+hvKEhvjRMdvFZca89a8xwJ0KIr0f26
         NLLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751390937; x=1751995737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LprHnzf3Ga8gFToTGu+6UNkCcfwqLEwWhp8zeax+d+o=;
        b=nE/ecLvdv4681QFIPVTR1V9cbtDiNNOc5WRDdWLp+88oZ5Koq1jtu/RBdSFxOPMUh/
         CQacOkirLViaofW7ekSmuMK+KmwyzG28wT3hvjzYr01uPSEwqPGYntLi2mjjyOQWr76r
         dLs1JqWEagvmKhcWjnqa4h/+GxtE8YmkEjujDJVQu20ebjAfWC5yUpsiZhY6u+w9mX6u
         Ft117YPKWfKcRLkQLblpoF6o+XNnGo3VtfC4CMa6Q+VraAI+QwIP02tY0SGe3FlIwW7M
         dsldg5yMSd8KNvxv+dECnuKo7bC3zxrIHiZnooFiD/rXMpurmh218/QZnxZhw/0w7RTX
         TzgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNLusyDZj0iJcv3qI4qk6vJcRVbYfJhT7hA7of4XUrzI9JsRJxIWoPqJCu2gs5d7s2IOvt6qHUeke+b4Xa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx++ZPoJEzdRvUd0o8Yv6kcvJm5pcSdL5v6X0SGTtCGE+XissBk
	WqKxDL58kjDwYhzOcAl7ndpse+sEnWz3+vPIDt9lvPL00+rJRcDWipjnJllB3tgFvzM=
X-Gm-Gg: ASbGncvTQIhIWL66RXdKiuy+pONIwzU7vdnmpyqU/hFsYGSpLhcKif0hgiB2GfMyI9s
	S/9eF073cN+ASfW0aMYEKKOwT5ON5vRwdf2PDE8K+7ZLUCZFRl+ICapnapZfBX2Wo02YZ2KZEXM
	2cmKGV3RaEie1fq/xV5yJeuDQSY374l37bqZnkNh4vpbixXKzJ+FAlOCb1VHmnBwNEZC7bP/Nx1
	8MeNlxm2Tq8M7FyyqazzdEAbzvz4E4ovPeEgXI66YYdEiE2jmh9Vngsjp3rGV9MEnXTSIG5hYwI
	Nkeju2cCH/jVgsIhuPMDQ82LwkJjtT26kUl7Wzm5MYWhCnP7xkCQR425ThUExY7vbzq+T1NSKUs
	0QA==
X-Google-Smtp-Source: AGHT+IG9UfbKX/+O28pbh9mOgykatm2AQRooaxU64IfyXQEfm5XhZwAZ6nxN5YS+Af/aCOrAhRimXA==
X-Received: by 2002:a05:6000:b0b:b0:3a4:f70d:aff0 with SMTP id ffacd0b85a97d-3af0ffb93aamr3609887f8f.14.1751390936967;
        Tue, 01 Jul 2025 10:28:56 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:1425:eda1:87ab:f850])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b1b9sm198716175e9.11.2025.07.01.10.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 10:28:56 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 01 Jul 2025 19:28:35 +0200
Subject: [PATCH 3/6] clk: qcom: videocc-sm8550: Add separate frequency
 tables for X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-videocc-v1-3-785d393be502@linaro.org>
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

X1E80100 videocc is identical to the one in SM8550, aside from slightly
different recommended PLL frequencies. Add the separate frequency tables
for that and apply them if the qcom,x1e80100-videocc compatible is used.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/Kconfig          |  2 +-
 drivers/clk/qcom/videocc-sm8550.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 26752bd79f508612347ce79fd3693359d4dd656d..53bbdbe0725bd1b37ecd4c6b15b0d31676d9f548 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1394,7 +1394,7 @@ config SM_VIDEOCC_8550
 	select QCOM_GDSC
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.
-	  SM8550 or SM8650 devices.
+	  SM8550 or SM8650 or X1E80100 devices.
 	  Say Y if you want to support video devices and functionality such as
 	  video encode/decode.
 
diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index 3e5891b43ee404edc6c99bbf8f2583cb44df9e37..32a6505abe265472de4059c4a048f731fdbf1dfe 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -145,6 +145,16 @@ static const struct freq_tbl ftbl_video_cc_mvs0_clk_src_sm8650[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_video_cc_mvs0_clk_src_x1e80100[] = {
+	F(576000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(720000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1014000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1098000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1332000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	F(1443000000, P_VIDEO_CC_PLL0_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 video_cc_mvs0_clk_src = {
 	.cmd_rcgr = 0x8000,
 	.mnd_width = 0,
@@ -177,6 +187,15 @@ static const struct freq_tbl ftbl_video_cc_mvs1_clk_src_sm8650[] = {
 	{ }
 };
 
+static const struct freq_tbl ftbl_video_cc_mvs1_clk_src_x1e80100[] = {
+	F(840000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1050000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1350000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1500000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	F(1650000000, P_VIDEO_CC_PLL1_OUT_MAIN, 1, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 video_cc_mvs1_clk_src = {
 	.cmd_rcgr = 0x8018,
 	.mnd_width = 0,
@@ -559,12 +578,22 @@ static const struct qcom_cc_desc video_cc_sm8550_desc = {
 static const struct of_device_id video_cc_sm8550_match_table[] = {
 	{ .compatible = "qcom,sm8550-videocc" },
 	{ .compatible = "qcom,sm8650-videocc" },
+	{ .compatible = "qcom,x1e80100-videocc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, video_cc_sm8550_match_table);
 
 static int video_cc_sm8550_probe(struct platform_device *pdev)
 {
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,x1e80100-videocc")) {
+		video_cc_pll0_config.l = 0x1e;
+		video_cc_pll0_config.alpha = 0x0000;
+		video_cc_pll1_config.l = 0x2b;
+		video_cc_pll1_config.alpha = 0xc000;
+		video_cc_mvs0_clk_src.freq_tbl = ftbl_video_cc_mvs0_clk_src_x1e80100;
+		video_cc_mvs1_clk_src.freq_tbl = ftbl_video_cc_mvs1_clk_src_x1e80100;
+	}
+
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-videocc")) {
 		video_cc_pll0_config.l = 0x1e;
 		video_cc_pll0_config.alpha = 0xa000;

-- 
2.49.0


