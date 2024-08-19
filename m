Return-Path: <linux-arm-msm+bounces-29027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8049578B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 01:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92D271C2319D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 23:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBBE1E2131;
	Mon, 19 Aug 2024 23:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lRUamFfT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4001E2116
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 23:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724110594; cv=none; b=pai4k0iklpuKh7/GFPy4Rq4bxFTGdw/Nys0kLW/R9wE6kknHy+KWQFoABt/ubMAO/EscSJHXD0euZXDB1VIRXrq3uVMwhymCQ9V9YAHyOwb5CQHsu1IdUHuiU5sH39SBG9QYi83fA+gCMQNZuz7A7ZQpFlOhQ5SPLCgsLwmPY+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724110594; c=relaxed/simple;
	bh=Roi5i8LAm2qbYFgu3vbjTEm7hUeJWtdnSFionwzXcEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pybm8bd0iik6IBWW+bnzgj+lMqc+JFALaV6kT+Y5qjjJSLJzdkmvIuFtOkU6TRdt2dm4Hmg34ww/qpN0T3lmbhATmo2yIKgbQcV274qD2x5ZOYhqlDndWtYRrXMLhxcxo/6Lxew8TnAQxqWKupum45R7LGPIxrX5Q37J6rE+CZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lRUamFfT; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2d3c5f769d6so3355494a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 16:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724110592; x=1724715392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTKeVDX3B7Rec/avu2J3HYCERK0HslRs8x4rP1mNjLc=;
        b=lRUamFfTS6DsVcWeFWIwQ3+KBQRhl2+x3p+POWL5+2fISjFp+Zo51yzcGXbd/aZaj2
         FkwcJC9QRwDZZxsV7OkF3xg2rOvcUXMgE7l1dZrC+yWIrZATVXSCnVNxnff41PCiv+oM
         yWAoZexk2YKECd5pXyaSDllc9dC7rg7WluhEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724110592; x=1724715392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTKeVDX3B7Rec/avu2J3HYCERK0HslRs8x4rP1mNjLc=;
        b=BomuvGpGbyvdK8pdKN7zGauSl2RPPI4dGz9mjDVQg315/rv+ucMlpv66XSczN9RTFQ
         Ql15nXjko8UYvD5jDice8kBHPjt1yNZWFD0N2XFt/H169xD9KIT7KEQyaGUy6K5tPbNj
         KfXrMZIoyHOi2ehLWj//9KY1k0bjKkjz859bMFK4lfEefD+HKqSHWJKkzdvv3Pr2DsAb
         RuJyNj9hiSRLHJ8HS1VKfrM4ZZ/7TyRepYX4hU8XWXiRmOwa0gwPC6TN3qfFfi1Wq5NP
         Z/bQf8CplKYGknKq7KTiMzqUuURsRENcT3he8B8o6+vGiny4QXpLur2KQr3M/EXwI6py
         4E0w==
X-Forwarded-Encrypted: i=1; AJvYcCU7K8sacKFcbcT5ebBrjTUE1zBOsBc2QPshmK4WbCLZfL9VPQirDF08YqGSjBFFGMqfoWzhYyge787zFw2r@vger.kernel.org
X-Gm-Message-State: AOJu0YwKMJ2ainMW1fqLMobxJr2f78FZjbhquhtnKiW16U+bW6UsWPf2
	mY7pLc6x95KmdIs2dUk5oGCXwcQJ9VInoLHuTBonH2pbEZN9uhE8nzz22InN9g==
X-Google-Smtp-Source: AGHT+IFja8fgz65fqj/HxtsU1jnIOssam1yt+nNI7Qy7HCclfpXJ6+fUompPLNl4vW+lHeeLPkoYmA==
X-Received: by 2002:a17:90b:682:b0:2d3:c6dd:4383 with SMTP id 98e67ed59e1d1-2d3dfc6f2cdmr11172016a91.16.1724110591558;
        Mon, 19 Aug 2024 16:36:31 -0700 (PDT)
Received: from localhost (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2d3e3ebfe46sm7816927a91.57.2024.08.19.16.36.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 16:36:31 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	patches@lists.linux.dev,
	linux-clk@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Amit Pundir <amit.pundir@linaro.org>
Subject: [PATCH 1/2] clk: qcom: gcc-sm8550: Don't use parking clk_ops for QUPs
Date: Mon, 19 Aug 2024 16:36:26 -0700
Message-ID: <20240819233628.2074654-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240819233628.2074654-1-swboyd@chromium.org>
References: <20240819233628.2074654-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The QUPs aren't shared in a way that requires parking the RCG at an
always on parent in case some other entity turns on the clk. The
hardware is capable of setting a new frequency itself with the DFS mode,
so parking is unnecessary. Furthermore, there aren't any GDSCs for these
devices, so there isn't a possibility of the GDSC turning on the clks
for housekeeping purposes.

This wasn't a problem to mark these clks shared until we started parking
shared RCGs at clk registration time in commit 01a0a6cc8cfd ("clk: qcom:
Park shared RCGs upon registration"). Parking at init is actually
harmful to the UART when earlycon is used. If the device is pumping out
data while the frequency changes you'll see garbage on the serial
console until the driver can probe and actually set a proper frequency.

Revert the QUP part of commit 929c75d57566 ("clk: qcom: gcc-sm8550: Mark
RCGs shared where applicable") so that the QUPs don't get parked during
clk registration and break UART operations.

Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where applicable")
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>
Reported-by: Amit Pundir <amit.pundir@linaro.org>
Closes: https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/clk/qcom/gcc-sm8550.c | 52 +++++++++++++++++------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 7944ddb4b47d..0244a05866b8 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -536,7 +536,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s0_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -551,7 +551,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s1_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -566,7 +566,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s2_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -581,7 +581,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s3_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -596,7 +596,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s4_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -611,7 +611,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s5_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -626,7 +626,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s6_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -641,7 +641,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s7_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -656,7 +656,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s8_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -671,7 +671,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s9_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -700,7 +700,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
@@ -717,7 +717,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
@@ -750,7 +750,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
@@ -767,7 +767,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
@@ -784,7 +784,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
@@ -801,7 +801,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
@@ -818,7 +818,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s6_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
@@ -835,7 +835,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s7_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src = {
@@ -852,7 +852,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s0_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s0_clk_src = {
@@ -869,7 +869,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s1_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s1_clk_src = {
@@ -886,7 +886,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s2_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s2_clk_src = {
@@ -903,7 +903,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s3_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s3_clk_src = {
@@ -920,7 +920,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s4_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s4_clk_src = {
@@ -937,7 +937,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s5_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s5_clk_src = {
@@ -975,7 +975,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s6_clk_src_init = {
 	.parent_data = gcc_parent_data_8,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_8),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s6_clk_src = {
@@ -992,7 +992,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s7_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s7_clk_src = {
-- 
https://chromeos.dev


