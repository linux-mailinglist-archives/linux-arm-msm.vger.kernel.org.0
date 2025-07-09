Return-Path: <linux-arm-msm+bounces-64167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED122AFE557
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 12:13:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A8621C46CE1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 10:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274DB28C2A5;
	Wed,  9 Jul 2025 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TWg55c0C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7636A28B509
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jul 2025 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752055796; cv=none; b=Cr/R4XX5ie3qacUb9XGWrojv4LX6GXD0fMIGrWWhqXvDX6DuMHRX5wLCrE2wDHfuUUGxRMrlomJaePM0jzID1THJ18tX4zUmnS6VUJP7TfYx3O1CSO5BD77YnuGPWU/Jac8IdTgD/W9caHdlDBiWuq4cZrTvQMXmcE2XSYC2QMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752055796; c=relaxed/simple;
	bh=oHtxKLb95kWtO1ABeXnwkyA2GtGWv8G/qQ04XDDzKoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C2IfFHYLMu1KX4UrLXSPQtoKHZGbjBEdA/4neSWrlnBKPa/Nlqmqd4Zw4TxgttVPIsY9hfGMYGitGbSTPFaO4zDciIY5zfFuNg7NzYrpFsR+PTfl+yvrhhDal7yhLenaVkSSdEYTtT+K8y3s4AotfuTT5xr9ZMhviF93uMToeCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TWg55c0C; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so583711f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jul 2025 03:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752055793; x=1752660593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6HxvD09F6nT+66ixpsjcoirCJ37IebWgFlBepGL5ug8=;
        b=TWg55c0Ce6UX+XBe4R+NVyUUzcZglTFolRq9nhSSuxSyHHGlbsI5LMdEmF5+r2G2Ee
         mW0UwkzcsA0if2hMAXRfRe48+jUd2i+b9AGh7YZtusQ0px5bwhWPNjVeUuyA/uTGRGjc
         cJE4EZ72MTm7QiSwP3jzAcvRBTLy/6MOS/vsR3MGhK3U8nJXQVpvezdheRG7qhF8ulL8
         ZTFhipAIPZ+sNWCRpRVz/S4UVZSyOU+elNzq1KwEQ/DU7qSfvMW/bQKELsWryEB+WPgi
         Y9T2emXolOMAw1w/zetrR+XcocR1OfPv16K7ZL9L7ger7P0L/3SkndHiX2RLx8vqf9Zl
         644w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752055793; x=1752660593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HxvD09F6nT+66ixpsjcoirCJ37IebWgFlBepGL5ug8=;
        b=CRWf1cc+qaIoJd/3GvIlS5gBoxfwSX8OuEmgIWdpXeBZljdIoos/pxBewdWm11m9+D
         xOcDhSG3RqjAI606MgDax7KxkI1Hmx2jZe3VYUh+AxL28a18P/6GVjqR/4l3ztLq7Z9a
         G2b8PmRpXu2agG0kDzdVkv3ehHKrZ05+yKF24Fog6jqnZVFjfuZhntZe1EVq3zhHtywx
         E+ly8zJZiqZWAn05+bgVV6zDrAVhIzSU5JA21yj9NlmiruoBNa2eKI3Gj2/URN3FepPu
         VN9X4WznLgBOISsvp1ScQGUgAP6KDKI7cnbKUPeFj/mBCSL/Cd9udQnN9iJUvF2nFBra
         oh0A==
X-Forwarded-Encrypted: i=1; AJvYcCUtLO/uEktwCG2OXgeja3p5dhsbRoJqZuGnqOT9H7ax4mRAy80vtaeH9qDusp/vYH+7u83/00dwe4KFwBAb@vger.kernel.org
X-Gm-Message-State: AOJu0YzuaL5QTiRJYs3yFjAu1r9m+ZKsEtbxp0ioTTYJ1mw4EyC92Z0G
	93VJ/BnXtUO0FRAdnVBCcU7N395NaL5LtPB5oEbd1nUMurYsjguEIFjWRHL1Pnm7xSw=
X-Gm-Gg: ASbGncv8TE0avUP3vvEaotr+TOhFggsRbibn27Mr2COR0TObHdbf3g+zO2OQVakqHNb
	2BNgtoNJ21wtOLqfIPOEn55f2y0xaQZOhSbrcoW6mxFHmN8xD9HN5QfhNJ4X5rhSr+n5om5RAAc
	FYcHZfpJMZH7yB/ZKFfReMWhojqdrXu+nT+0c/VMySpw33vI/stVqi3HHvqW5uGzdv7okXmYB9S
	54a55On3sWCVTRgkf22UZIPHjwvS6BjC6gKvk6jc9FeRVvsoOoQ/Gxc2fQQS2XFrkyXWHHK91DL
	OEqtlwMt69d5bbMerg2HztXNpG2qQCdQzqTVabJ2MUxtaNMUUbEf4KaqVGKRQbFt42N85HUywHZ
	aKw==
X-Google-Smtp-Source: AGHT+IGePVRa5c41YQYZ/2B1kylc5GX/RflEeqWBX0hcc0fLez3e7u4p1eY6s1aZVrZhJaHTwFshVQ==
X-Received: by 2002:a5d:5f8d:0:b0:3a4:d9d3:b7cc with SMTP id ffacd0b85a97d-3b5de03575cmr4975600f8f.28.1752055792512;
        Wed, 09 Jul 2025 03:09:52 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:d3be:a88a:dbb9:f905])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d5032997sm18342105e9.7.2025.07.09.03.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 03:09:52 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 09 Jul 2025 12:08:55 +0200
Subject: [PATCH v2 3/6] clk: qcom: videocc-sm8550: Add separate frequency
 tables for X1E80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-x1e-videocc-v2-3-ad1acf5674b4@linaro.org>
References: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
In-Reply-To: <20250709-x1e-videocc-v2-0-ad1acf5674b4@linaro.org>
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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


