Return-Path: <linux-arm-msm+bounces-54135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F31A872F9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 19:24:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04CAF171EDD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Apr 2025 17:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0914D1F2BA1;
	Sun, 13 Apr 2025 17:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kjj2tDfc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7231625776;
	Sun, 13 Apr 2025 17:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744565060; cv=none; b=nvIuY2vRLtR/KTvoCJhDvIRu07hTKP/kLJB4GTJoiHXzXtvU0qTM0s2DxDNimBbVfrQyPymXct66FNpDBZpmV0jxxc0jiV9BUfA/iCoAMm/AnjF15pU47x09yRVqhy7Xax0q4/08kucX4WPNTwOWfc5TLxDYB25i/j7ySAE7bSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744565060; c=relaxed/simple;
	bh=B0lZVmtJX6R2pQDZ1FDI1ncIUlIzvBvjZUMD1zliFR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cn9VCOL44UWuTz41OtdQWkmDFNwiIAr0USddxE/mTKKXuGGhHxWu3piLSQ376fBql3hNKquyoUrzGfGmHVXvHCYV5uNFX52OglpbMf4GVoykZWBVCC6ht/fhtPGzG5KEq9E7MYdRwT3Gqo0bdf80UmVLeIvLqXElDtmzu8GDXTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kjj2tDfc; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af93cd64ef3so2449875a12.2;
        Sun, 13 Apr 2025 10:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744565058; x=1745169858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GQzOnhmj39ccEfRo0gYtUZqATjFu0/HR0pPxsBGgL7I=;
        b=Kjj2tDfcZb6pHXGvrxfhRluDGOInodqHjRg8xTJU361YQsS4slosSnTe9is5VQnTri
         eAEbV5BaMPQ7kpg03Us/m1c3JpN7vLv38ScdEJxjv0kgzXSx1SIyVX50ZQAe7Z5Dn75Z
         fhbg53yqMGByV/0f21cZnKj+baojHdIS1VvDOdyxjM5ifpffuMeyVXT13DadpFy0hf3B
         XkmDZbOiLxx7ads89jBqSL2tNIjyznoB5lM//rkHxgcyHvgAk+Sxv4m+CCKVax0gKNqr
         XvzMwh5Ay84XtyN6XcNF2el9HTIRyei14EDO2Bep537bs/aTkbWbKnoaO7KAX/7DVheW
         q27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744565059; x=1745169859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQzOnhmj39ccEfRo0gYtUZqATjFu0/HR0pPxsBGgL7I=;
        b=r96y5bO48S/IqZGbN/xHYiOZskLylP+bhETbXMUsqAHOzjZkuk0RASUpSVhRFISVb0
         1e+maM0IDdlaotkK2p76hFdGFxoJFXfF85Dk+WwH3GSfXs61MBlZC3LzdMK9sbZSXvYg
         YAdttKtjxP82daog3qMd58LQU1grw461St0gJgTLRtU+lxOSM3hbh2NLggYn+yNAWh/p
         zHIDkS7XxWSXFAc/C0X0M69evyRFYjrNzqyxflpFWT2ZEA+GnWeXxHOHxtiybYiL5uDc
         UE1y7nTxWtrpMx8Y3qZA0B4wg+iqJEtoZRyCzjI7ymegNwmmv/lh7n0jIgo/c/de0MAN
         OTxw==
X-Forwarded-Encrypted: i=1; AJvYcCUorRlOY1j4ToEA5SKdQH5s4RU1dKWqPRMEiza6TmhIPI6ZtHYGX6dJo48n6J8BriVSYN0ufQBL4KFBt+ga@vger.kernel.org, AJvYcCUpgYAYvguYiJ4iSXMtihiV4Ej28QBUBAwRtLM8/o+6bTtAAIL7rLvW0CLhau0FPtoD/Qmw3Vzg0d0sPabu@vger.kernel.org, AJvYcCWyYAvZUvmkkNi4Ufsb1wfM9Oy53uW2E9rZG79WuRQgzuWl1HQYRmpC09j6kGCla3AoR7VPmyrJ4ThQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwhD2eoN79+UiPlZ7v5uQIUuLk4UhORtz3d0sLUAkBQjb4cfwuk
	wL6cibTaaTJO/bgeb3/EtPpMTT4C7DXJD5SxVIIhWRrc6mqKa5rRQL9hI+IOW0hmqw==
X-Gm-Gg: ASbGncuzt8t1rIUjCE/KNNMzKieodwk1jJOwjXOoiuFCbCWhxgj9WKSatbzolLVcx5z
	ZaY4YyIRXj1VyZLFLsgoQ9IRbhsj1WyG4upnYPwZmtjWQWI3vzSPzUgWfiuahPMardHmfaDIEzY
	oO+Akjjtj4pCutKMy29Q6299JK/r0f+L36oTECQtxM+CrfqvlkYoQI8wgALnkmjXTXjvT/6d7ej
	Ylsja8yicaqGJde8WhAn8NKaB4yvTV9bpNpdgUDWiU3BN7fO5UncVnKw8me82XpiWItKg54Uznc
	Ia0lJ2HSSypiPxwfkbtOvfa+S/AT1myY1z3si+0=
X-Google-Smtp-Source: AGHT+IH5/9WyTYEfEuGmbLjgtRz8cZ6K/96p4jvqiT7FjoLDWP7BHZ0rL749oiPM5uogUB12gFX56A==
X-Received: by 2002:a17:90b:17ce:b0:2fe:a336:fe63 with SMTP id 98e67ed59e1d1-308237a833emr15798291a91.24.1744565058526;
        Sun, 13 Apr 2025 10:24:18 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd04e9a8sm9739654a91.0.2025.04.13.10.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 10:24:17 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: qcom: rpmh: make clkaN optional
Date: Mon, 14 Apr 2025 01:22:04 +0800
Message-ID: <20250413172205.175789-1-mitltlatltl@gmail.com>
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


