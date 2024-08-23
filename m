Return-Path: <linux-arm-msm+bounces-29362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A34DA95CD11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 14:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E6C11F21653
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 12:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD4D818453A;
	Fri, 23 Aug 2024 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rO9b5O/b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44AE18455E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417942; cv=none; b=UJma85aak++XAgh5qkqXNqNq1EnB5LG3Pde690hkFfAdR18hZXqBFUWtMCusp+5pAVxQ1dtiReG7e3UYVkc447jKjLm0heqteTg00ruVhCQIX9iqQj49PaqT1EuDdpfvBfZ7dqj09dlI1zg2mDkwyTCvYkwHy7y0/q9AtLcYfpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417942; c=relaxed/simple;
	bh=7kNEi/OiZze03OM1wbMpjeZA2NZZGXIuVb2E2KfBN4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GdioR20attbmZSTTwi/jmax9o4BCfhS3SqG9HvtgGjhhAR0c6zx/5j2j3I9dPuKDh+tsp6ZTb0SXmcfu9phuphBVmQPE2FXzZ9mQboWlqpNU50gV8xv9fG9b/MWgSPg3BNUnqnwn4jROMJ1zKTswBBiIT+7Ou46YlD9ahsnMdAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rO9b5O/b; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f4f2868621so12156771fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 05:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417939; x=1725022739; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qghjeC4G1cLi83JB5WxagT7bfxgoomvA+OfZjEPYThQ=;
        b=rO9b5O/bW2qmDRD7QxtZE2BLIGcN7/jTP9RMiqupCI/s7CwgMEkeItF3uDYCFbUygJ
         +XsCzZtB5u+7HRZ6u4c40nSeKMewxB7913xmNThriGZK1uZehKL0qFLgrwDF3r/wlYRL
         oqPnzsCOYQL3oUlWHCJXE/gutA+75Jo2QCgGVpAjvc4xEJ+BMqPbLPtKNxRhMqp0Dg6v
         vEzIlJeB23zQP7LXl56MvjMvFCIKQumkL3XxwSoxBfXqLyHLTHqckQj2Kayh/ZbqaEu/
         bWmTPZnRlKkJMXib1jrt4bgB9gj5gBKUM0bCjojemEbBHk8LXNXIVOEAB97tsD8Vmef4
         Z9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417939; x=1725022739;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qghjeC4G1cLi83JB5WxagT7bfxgoomvA+OfZjEPYThQ=;
        b=VXqew8sl0j1YVlW+H7/ZnHXIJQ7Wf/uhgJupSXzLtiW8p0jaKondP8o0ULftJrZZhK
         R/FHA9n7Y4sH1G3DW3OfvALcnKITcIWPC1dsVPXMSC84kEpDRGxBTJXNc8HMB99ylDl6
         xoSgGxTadKw+B6BGwL4EahgZ4XZ+3s41U4aw0WflqL9ZmkfmKImR2ETiXflS++iRLS97
         FKu7KSOrBMH7XmKX4+vn9Jc+RFZndVOeOnqOfEw59YkMiSuhkfARUmf5teOhF16otu1R
         DWqhNSpVZz5zYeeXuQzUQPC7/LlLi6aniZ+bV2pR30sBaWuRzk8Oo8Y74PLVlnqSfeX0
         gx3A==
X-Gm-Message-State: AOJu0Yxf4jFyzrdSsehHjNHo4tCeZIPwnuKAs0WqNPFNa1qxJlkq0rf3
	zc/Te1itlHz02Pwaxsbj/pAERwwjBpEpDDwr4K0IgqvfG5fsegDI5eKHbVijypGmz5z7eMM9wMM
	P
X-Google-Smtp-Source: AGHT+IFmyJqIIYKvFHFmvTWKdG+lP5pWyv5LUxcyYzdy1j+zF2jNHfzDubXY6GIudLULTmshpFaK5A==
X-Received: by 2002:a2e:8ec6:0:b0:2f3:cabc:6158 with SMTP id 38308e7fff4ca-2f4f5756f0emr13105291fa.11.1724417938476;
        Fri, 23 Aug 2024 05:58:58 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0515a9806sm2086709a12.87.2024.08.23.05.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:58:58 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 23 Aug 2024 13:58:56 +0100
Subject: [PATCH] clk: qcom: gcc-x1e80100: Don't use parking clk_ops for
 QUPs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-x1e80100-clk-fix-v1-1-0b1b4f5a96e8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAI+HyGYC/x2MQQqAMAzAviI9W+iq6OZXxINo1aKobCAD2d8dH
 hNIXgjiVQJ0xQteHg16nRlMWcC0jecqqHNmYOKaLFcYjVgyRDgdOy4aseHW8GwdsSPI2e0l63/
 ZDyl9ArLTH2IAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev

Per Stephen Boyd's explanation in the link below, QUP RCG clocks do not
need to be parked when switching frequency. A side-effect in parking to a
lower frequency can be a momentary invalid clock driven on an in-use serial
peripheral.

This can cause "junk" to spewed out of a UART as a low-impact example. On
the x1e80100-crd this serial port junk can be observed on linux-next.

Apply a similar fix to the x1e80100 Global Clock controller to remediate.

Link: https://lore.kernel.org/all/20240819233628.2074654-3-swboyd@chromium.org/
Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where applicable")
Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
I ran into some junk on the x1e80100 serial port and asked around to see if
someone had already found and fixed.

Neil pointed me at Stephen's fix for sm8550 which I found is also required
to fix the same thing x1e80100.
---
 drivers/clk/qcom/gcc-x1e80100.c | 48 ++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 6ffb3ddcae086..f17f8a1fcf414 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -670,7 +670,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
@@ -687,7 +687,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
@@ -719,7 +719,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
@@ -736,7 +736,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
@@ -768,7 +768,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
@@ -785,7 +785,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
@@ -802,7 +802,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s6_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
@@ -819,7 +819,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s7_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
@@ -836,7 +836,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
@@ -853,7 +853,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
@@ -870,7 +870,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
@@ -887,7 +887,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
@@ -904,7 +904,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
@@ -921,7 +921,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
@@ -938,7 +938,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s6_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
@@ -955,7 +955,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s7_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src = {
@@ -972,7 +972,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s0_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s0_clk_src = {
@@ -989,7 +989,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s1_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s1_clk_src = {
@@ -1006,7 +1006,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s2_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s2_clk_src = {
@@ -1023,7 +1023,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s3_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s3_clk_src = {
@@ -1040,7 +1040,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s4_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s4_clk_src = {
@@ -1057,7 +1057,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s5_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s5_clk_src = {
@@ -1074,7 +1074,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s6_clk_src_init = {
 	.parent_data = gcc_parent_data_8,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_8),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s6_clk_src = {
@@ -1091,7 +1091,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s7_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s7_clk_src = {

---
base-commit: 826d8eb42d2a7192c2c8e2103a4d07fb6006f409
change-id: 20240823-x1e80100-clk-fix-62712d890290

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


