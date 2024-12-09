Return-Path: <linux-arm-msm+bounces-41138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E67779E9D7C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 18:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5753281FE1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 17:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8811C5CCC;
	Mon,  9 Dec 2024 17:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aTBrH4p8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC951F2C39
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 17:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733766559; cv=none; b=kBXvCtkQjnzsaVlsTgbrCp7TuDtDCchH5gTh8vah/a7E9j3Yz/K5ypM8c06D89UiYk3ig65uc0MGcpHvpaKj5Mx/1cpFQiVpOZEC1glRN6Es6WZM6+ztRA1AUkOCnEdMfEn6R3FN6K5bLgAdy5IKmXhkXEjNAlnUoh32Sy3c4Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733766559; c=relaxed/simple;
	bh=/ngJ31invQX5gKPkdlu21QxuRo0Yy8l2N/s4QwYdOLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gtL1x4B0nzQwdW1dkCpzHh9FVtpqb32AtcES3qH82D+T5UE/ujxj+gJaJH6j/QEolRpJDB7FApbenwi/ASBm7wKSFI6hwJgMpnvuY4qDRkpA5l2WqfHlKNl9vchtq7a+GdXc8z2qryVdU4Owc80fgRQ2Y6vXYRYATEskQpekXs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aTBrH4p8; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2165cb60719so8352325ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 09:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733766557; x=1734371357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zf8gzCK3nfrU3b7Uuxbc0dGE1qzZ9/xYXm+PyMypy4k=;
        b=aTBrH4p8uwN3mK5wZi7cIQnJaMEtTpmWg2zzu3gWwTrzKQZcehNf69M1+xI3+/zviP
         7YvIby+h1KzcGHf/gV5vooIIBH+ygB1bpX5t/jEpfv/1VdAoGCeSvC36MMfwFbkrGL37
         EQ57TwZMDr/MnMd41wbDRqqDfVxrmBIJ4XW2sCMuxWjYW1qMwZTMNlOGxLzKfUifk9UP
         fnwKdkjb8/2VWAcBYFFWklndtVmLFQKiKEdt05aTPYm9Eovxvm11rsaNQ4cnwUUBn5jz
         j0C2umfOdkzBXguJxw7Tp/qbcPoQWczg6EHm3KjeI5db8D9SesBn1rO84prc+cHQN3Dj
         Tzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766557; x=1734371357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zf8gzCK3nfrU3b7Uuxbc0dGE1qzZ9/xYXm+PyMypy4k=;
        b=sqtsi8Hg/RgPUdKRp1wej5det+jNVKeW3jHL1CbKPFy0FF0xl6b8CnqH0YUnVaKg79
         3eeIWxHVICZiOEoBivfJqB/EdJnd1aW/BVeiBShsmlKCpK8TeD3fvsQfSZiiMdp6biZB
         6vMf2/a1oO4ipWpkiWApauIyz3Bq/lUZZ38RJ9eGVwvJd7Z6b7yiRbV53J7MWPWbTZnW
         vbDJY7vjGJ6ZKuYbZRDbE9aAYf/KvO9h/mTW7XpV7MJz/1IP5A6f4W4oAqBK3wcmVD0w
         ZnAz2jppFm9nuhCl5lkR5/2rPr6Mf45lkFtYw/yczIRl5MmT2egwz8xNaK9jtwqfN+ai
         n9tw==
X-Gm-Message-State: AOJu0YyLaA+0soPPeAlM5otQLBUSkhNCN8obpekbA2U32ALuurWS7i/P
	z8cb/ZyaW0PrS9ImxN6tNM5iCvGqYZDKAoB5ydU29HqeqcTe0WbxdB+ZLZcHrVM=
X-Gm-Gg: ASbGncvvQDu6H5ZUsKzxNQAcP/zv7kh74lChpW0wHQvnfyt/vp6TU1sc35bzGH15mKF
	aO35tn3KQ5fXDUt5++ZIbwCe3tKJQa7HtzG/A/xwtZhgdgEPt7oBhIQpBSgP3TUU+sVFZpI96SY
	LFzlRp8kYxHZ7wjJPtwcJGv1ab9LhG+d5kc+ekuIoPFMjZB577ly7Z2JDKk851/qPYxI6S/cna0
	u2QwZaGDpj5IP59rQ0BgRpFXu19z7wsMULEmdXfIoG4cHLTQw==
X-Google-Smtp-Source: AGHT+IFY3WJ1ALik4fCfvOaI+IBshnfFj9VVWrccJaSzIqDQLA6VvD98zEwQj/L1R/jPX93PhyCxlw==
X-Received: by 2002:a17:903:2303:b0:216:2a36:5b2e with SMTP id d9443c01a7336-2166a024b1fmr19667555ad.32.1733766557531;
        Mon, 09 Dec 2024 09:49:17 -0800 (PST)
Received: from x-wing.. ([2406:7400:94:42cf:4dea:f154:880:3adc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2164d103993sm21837865ad.193.2024.12.09.09.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:49:17 -0800 (PST)
From: Amit Pundir <amit.pundir@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND] clk: qcom: gcc-sdm845: Do not use shared clk_ops for QUPs
Date: Mon,  9 Dec 2024 23:19:12 +0530
Message-ID: <20241209174912.2526928-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to the earlier fixes meant for sm8x50 and x1e platforms,
we have to stop using the shared clk ops for sdm845 QUPs as well.

As Stephen Boyd pointed out in earlier fixes, there wasn't a problem
to mark QUP clks shared until we started parking shared RCGs at clk
registration time in commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs
upon registration"). Parking at init is actually harmful to the UART
when earlycon is used. If the device is pumping out data while the
frequency changes and we see garbage on the serial console until the
driver can probe and actually set a proper frequency.

This patch reverts the QUP clk sharing ops part of commit 06391eddb60a
("clk: qcom: Add Global Clock controller (GCC) driver for SDM845"), so
that the QUPs on sdm845 don't get parked during clk registration and
break UART operations.

Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
 drivers/clk/qcom/gcc-sdm845.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index dc3aa7014c3e..c6692808a822 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -454,7 +454,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s0_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
@@ -470,7 +470,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s1_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
@@ -486,7 +486,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s2_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
@@ -502,7 +502,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s3_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
@@ -518,7 +518,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s4_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
@@ -534,7 +534,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s5_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
@@ -550,7 +550,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s6_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s6_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
@@ -566,7 +566,7 @@ static struct clk_init_data gcc_qupv3_wrap0_s7_clk_src_init = {
 	.name = "gcc_qupv3_wrap0_s7_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
@@ -582,7 +582,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s0_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
@@ -598,7 +598,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s1_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
@@ -614,7 +614,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s2_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s2_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
@@ -630,7 +630,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s3_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
@@ -646,7 +646,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s4_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
@@ -662,7 +662,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s5_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
@@ -678,7 +678,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s6_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s6_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
@@ -694,7 +694,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s7_clk_src_init = {
 	.name = "gcc_qupv3_wrap1_s7_clk_src",
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src = {
-- 
2.43.0


