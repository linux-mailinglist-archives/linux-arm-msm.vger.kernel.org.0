Return-Path: <linux-arm-msm+bounces-58348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B99AABB047
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 15:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9FFB175373
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 13:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E3D28E0F;
	Sun, 18 May 2025 13:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PROUTI3V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB633635;
	Sun, 18 May 2025 13:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747573590; cv=none; b=B1LbeDKlRwuShLNrYgcrFNFGlcqnIXkeml/fGk9zYWUQ0xtdg3WWlKR0sJTONKxff733QFXaW/8ZAdB4HpI5Q4dxskLh/RMtBgJjFurHkrN5ZgxQeC5vEj2Hyxj8NRE+/8SbM1bKSr7sMFow4gFmbedjfVNDvMlHgzLFIVaZSr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747573590; c=relaxed/simple;
	bh=QKPfHl99X4kso7jChN1jE5UUNDv8LQK2gzGmhxNr2cg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UfT9sKHS/wNhvH+QUqYD3PdAm3AahxV1jaIGQX1Vh43U3aO90UdbJHo8EcbY/AF6BVQsOFVvKQDyDRKeboGVXJEK7oX8fFnF4x/GL5U6oeaFHVgg/1T4FXoREPGjg3qagzac2gcDPJ0TpEqLdIv15E1oSQhd8zHvMZFgjgI9gto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PROUTI3V; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2302d90c7f7so45708595ad.3;
        Sun, 18 May 2025 06:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747573588; x=1748178388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GQzOnhmj39ccEfRo0gYtUZqATjFu0/HR0pPxsBGgL7I=;
        b=PROUTI3VsM4j3ut+o5Zzjal/ldvnB5+wPz7xrjOoiM095Mal8G8HiI/yfNijO39923
         C6Du7GvPFdhGx6x4FOleMCXdZKREF+gNN5TLpLCcuXpfRQ7Kr+vf/exUxAXvmDBIRmSP
         OdJGzONAoi4W5Zkc2taO+gKue/UVlqbtsSoUkGlNBfh2yPG0j/iDrZ7v4aeIpgTwp8g6
         OV8MIB2bDnWDbUMbfQh5QYNPdEVacPEfexWWb1+YSN7D3ZjovMqeoLHtbrwZhCLUK6iQ
         YlshfiBd1V3i3sTYMDigoUETVe4d4GSMbDiTmj7icn/wjGeuPmxgu3XNGAWer1IbzU1O
         YLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747573588; x=1748178388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQzOnhmj39ccEfRo0gYtUZqATjFu0/HR0pPxsBGgL7I=;
        b=F8vlBFq+M2FWawj7ff6CYSFngZOxjJNFtSeY+l29SEcm0lD2PrtfTppcoC5wouFjkP
         B1VHJvUlkgScdgzLqqtN9qqoSoDGHYgID39kYQtoeBFHhHeYv38TwyBrc4BcsC50l1Ue
         iNIiSZm/CDMbqgOwRBBBoiqnQolUeYzT3hB1KkK1vQ0p54ZtTnVIc9Z2TQtaT8ow9hIi
         zZecmAkE2GFtYJtj6dA2al5CKbCuZsLUYTSOLEqEAqYPl87wbgQ4Tdi8EjVpAg9fdGYq
         LmbQ8KnsnERoW8ZppZQV8RhMPiE2ddLKHaJZCnXaNcU1JNrCxVisg5YZw29/G6ChmY4/
         75oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoOtffMwEDkxBnelJvOW341fiqnz61bo1KKdVl/+s3xalIUzMZiHDZIZJ4G9itVKqIycXo6XcGkPY=@vger.kernel.org, AJvYcCVgIUliL/WQ5Trgzkex7ETkekT0YRChEDWu7XeGU6PFSAIv2SoyO0rE4dU4jQYmXn5nA2mJIUNPZcoaGKDE@vger.kernel.org
X-Gm-Message-State: AOJu0YzkXImoQF+64L5pE5kqKnp4GwgqT0IE44O/36CVpU4s1QhIpn6E
	/JUprBLny36YTCHWxqLB+Tkesuf1SYhYUl6fC1KRBSbyh+iEj1KBVE11
X-Gm-Gg: ASbGncuLgHAcYV9MQdgQYSvRORz7gfLD3D84l13iS+9mQleufLkbk+yBUR93GlyC4Sb
	Van3teo/akt0YeggBftwc5lkE06ULpvG7m5wdcSFD+mh/Z1LJlsecsJJ2rCAFbI8AKpOqzmC/J2
	p1jkrBAHziD9y0Gb3ullRt5SZaIpSEleoW0s+rcxOZRZM3pMMcssVeapESSESmsQdOpjQnkycxy
	C3xfN0fUd0AKq08EFecdqhrUCoYGyUkku0Q43Qvkp7LKFdRBbV/cbJVY/GBttKyvhxLd+RrBMkW
	y5nWBYK/yGBw3G/hRyypSw4XyW0G7A188rF7zGYXAyFaCIj/iA==
X-Google-Smtp-Source: AGHT+IEbYz0zL6FUPuBDK6XmqwcyKT86zRveJT1Y3LuagJ7jKeVl+9KS1OpoBAzzEnt7nUQYsecdDw==
X-Received: by 2002:a17:903:228b:b0:231:c05f:29d5 with SMTP id d9443c01a7336-231d438b54emr111092345ad.6.1747573587958;
        Sun, 18 May 2025 06:06:27 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adbfe1sm43469475ad.66.2025.05.18.06.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 06:06:27 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 RESEND] clk: qcom: rpmh: make clkaN optional
Date: Sun, 18 May 2025 21:04:03 +0800
Message-ID: <20250518130403.440971-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On SM8650, clkaN are missing in cmd-db for some specific devices. This
caused a boot failure. Printing log during initramfs phase, I found

[    0.053281] clk-rpmh 17a00000.rsc:clock-controller: missing RPMh resource address for clka1

Adding the optional property to avoid probing failure which causes
countless deferred probe. In the downstream tree,similar workarounds
are introduced for SM7635, SM8550, SM8635, SM8650, SM8750.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v2:
- using capital letters, sm[0-9]+ => SM[0-9]+, rpmh => RPMh (Dmitry)
- correct typo, alform => plaform (Dmitry)
- remove tested-by tag from myself (Dmitry)
- line break to keep 80 characters per line (Dmitry)
- Link to v1: https://lore.kernel.org/all/20250404072003.515796-1-mitltlatltl@gmail.com
---
 drivers/clk/qcom/clk-rpmh.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index c7675930f..0aea8e1b7 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -66,6 +66,8 @@ struct clk_rpmh {
 struct clk_rpmh_desc {
 	struct clk_hw **clks;
 	size_t num_clks;
+	/* RPMh clock clkaN are optional for this platform */
+	bool clka_optional;
 };

 static DEFINE_MUTEX(rpmh_clk_lock);
@@ -648,6 +650,7 @@ static struct clk_hw *sm8550_rpmh_clocks[] = {
 static const struct clk_rpmh_desc clk_rpmh_sm8550 = {
 	.clks = sm8550_rpmh_clocks,
 	.num_clks = ARRAY_SIZE(sm8550_rpmh_clocks),
+	.clka_optional = true,
 };

 static struct clk_hw *sm8650_rpmh_clocks[] = {
@@ -679,6 +682,7 @@ static struct clk_hw *sm8650_rpmh_clocks[] = {
 static const struct clk_rpmh_desc clk_rpmh_sm8650 = {
 	.clks = sm8650_rpmh_clocks,
 	.num_clks = ARRAY_SIZE(sm8650_rpmh_clocks),
+	.clka_optional = true,
 };

 static struct clk_hw *sc7280_rpmh_clocks[] = {
@@ -847,6 +851,7 @@ static struct clk_hw *sm8750_rpmh_clocks[] = {
 static const struct clk_rpmh_desc clk_rpmh_sm8750 = {
 	.clks = sm8750_rpmh_clocks,
 	.num_clks = ARRAY_SIZE(sm8750_rpmh_clocks),
+	.clka_optional = true,
 };

 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
@@ -890,6 +895,13 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 		rpmh_clk = to_clk_rpmh(hw_clks[i]);
 		res_addr = cmd_db_read_addr(rpmh_clk->res_name);
 		if (!res_addr) {
+			hw_clks[i] = NULL;
+
+			if (desc->clka_optional &&
+			    !strncmp(rpmh_clk->res_name, "clka",
+				     sizeof("clka") - 1))
+				continue;
+
 			dev_err(&pdev->dev, "missing RPMh resource address for %s\n",
 				rpmh_clk->res_name);
 			return -ENODEV;
-- 
2.49.0

