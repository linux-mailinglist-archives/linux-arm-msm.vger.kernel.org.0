Return-Path: <linux-arm-msm+bounces-37899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9799C8871
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 12:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44A27282328
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 11:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFE21F80D2;
	Thu, 14 Nov 2024 11:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ySwz1ayK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9B41F8185
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 11:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731582520; cv=none; b=ef4k5K5bqtQ6B0pQF3c33lD12qmNkdw8pAySm7geHn1xFA2/jZi7inInPMga8kagomjQ0n9tVUKjgRQsig1gWwGjZh056vkWSCgS4PyhrQeezGib9tfSpREEtCy1HPQQxOwzEyk84PCAtoYU8zFzjRBrh0JZin27G/jzTdW36kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731582520; c=relaxed/simple;
	bh=dzbS37X0L0tq4kxmhjWWI+bKCewZv3KsIvKoWylV6ps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dAi7j26t+k+iUFMiAS2f53em+pKU84szndkojaqkekViiQHDjFqVxr1cVh/YJhSrG0AJWsXYMP9Dm9ivTMDdQnCIxbHF+eK6YnYOgnql1PJoVaoFHmhBp2nmkRZsPnG1dFYZ60ky/WC9CPo0AlYO8fo12585jTrenl5cy9bjnio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ySwz1ayK; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21116b187c4so3450525ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 03:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731582518; x=1732187318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4ICUIU2kTVypzjbkrPGHGmEX7WZpJWypKgX+IImalU=;
        b=ySwz1ayKFQf5k5pd13wiSwLfi7aKzJ5npg0udEQIHJtkmLOrXf6gnx7ENdpIg8KVvX
         M9cIvcIgUAVjC+nIhcpgjcfYnltQHXWm5LOtjYpAgduByoMRCl82BhfVOAm44Z1Uht1A
         n/dtWemn6rEbAku9QvF6B/HZtXTZMzPNNfCWhY6KR+gqILKgC07yeidsgRfVMCzKcNsq
         vKAmV9bWfQ0Hh9UWVsQbpuPzbvWFhP/+lNTyoUI5yUAJvrcuQia7vrd9Jw1V43Js/Fdb
         NlJSPf/nlngt3PFvHSOUb5I8z9jRaLZTbjEWEm/tgFeGp2SMn0NdtaxZZTbODr/0PNA/
         AEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731582518; x=1732187318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4ICUIU2kTVypzjbkrPGHGmEX7WZpJWypKgX+IImalU=;
        b=M4gxIZiGdXlEzmWk5YF2Hu7FVdb8w2AtcrH/Gekd9SRYMLMyA/GwFVHNY67zKzQJgB
         40T78+xOVBSwByYR6WPDWz/N/I7d/p0GqkNU5F7e7SQ2f3ZQ63ngjGsz3TKwBT+uDOHG
         7Zkmyo5cTJa9TTZItTko8d2Ww2wUsFlCEFGYJCmaNpdi0C2XQHPdRRsigQRP9bIyTfD5
         MWyja1AK4onZ8gQ0JodOU+tprQ/9edJj0ldx6FxGE9Lu0FFetnBTsl8IZo9B69uLV+WV
         8Mx8/Y3JlrMDUgbz5s3k809+urCQj9E39rLptBAQRV7nwb1f8vcn8acMrJH6PKiW8qrl
         F3bg==
X-Gm-Message-State: AOJu0YyRN2ODjCqiNXk4/y3iNrvEFNagyHqbqAeEMdD8Tv/XtIyrYbDN
	hN2ub0Y8ynygaR1dqFIDciJl3nDu9FbCjaJXBuJe7o4ShpT7N9u1N7c5CaPdpe8=
X-Google-Smtp-Source: AGHT+IG/uR8njq3nUO4WzcbIvca9iOUo50VvFlaSdHueUNTB9GQ4ab1JoQGIXQcgjRWdbBHqv/PFbQ==
X-Received: by 2002:a05:6a20:9183:b0:1db:e338:ab0a with SMTP id adf61e73a8af0-1dc8336123dmr2507880637.8.1731582518463;
        Thu, 14 Nov 2024 03:08:38 -0800 (PST)
Received: from x-wing.lan ([49.207.60.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea06ef6b3esm949628a91.10.2024.11.14.03.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 03:08:38 -0800 (PST)
From: Amit Pundir <amit.pundir@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] clk: qcom: gcc-sdm845: Do not use shared clk_ops for QUPs
Date: Thu, 14 Nov 2024 16:38:33 +0530
Message-ID: <20241114110833.731059-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to the earlier fixes meant for sm8x50 and x1e platforms,
do not use shared clk ops for sdm845 QUPs.

As Stephen Boyd pointed out in earlier fixes, there wasn't a problem
to mark QUP clks shared until we started parking shared RCGs at clk
registration time in commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs
upon registration"). Parking at init is actually harmful to the UART
when earlycon is used. If the device is pumping out data while the
frequency changes and we see garbage on the serial console until the
driver can probe and actually set a proper frequency.

Revert the QUP clk sharing ops part of commit 06391eddb60a ("clk: qcom:
Add Global Clock controller (GCC) driver for SDM845") so that the QUPs
on sdm845 don't get parked during clk registration and break UART
operations.

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


