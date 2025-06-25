Return-Path: <linux-arm-msm+bounces-62345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFACAE7C14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E2EED7B1B81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D4C2D8790;
	Wed, 25 Jun 2025 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1wYzlCBX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FC629898E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842800; cv=none; b=bVG+JAGOkW51PtNEw8AlMFDXyWuin05JZyQlElxRUfay182wpZeKAVs00klwfPTcrIYHCf39CxJhpCkVuSryAeFbapTX2QdiYFW29cBTKKMZh4AhFgjvhelnX+T88RU4vA6Xl9QVroSVUG8tZ+bGHeqQu+sjiHvt7cu1VrQ2DRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842800; c=relaxed/simple;
	bh=33aQvmJdtCZ4HVQ5M3x8OGvqlh+JGvl1nGP0weshrCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R7D1YinrFhVF11bkVg8rM1Sj2B/wEUbVtTFdIkOpk1dnvQSoMJ7k7OKqRluAbe98FimdyM2dX1rhUgP7bNlOPHxPQm3/zaqAgc2GxYWc2cWH1QSU0gkYwKD7bcA3mqjK8HztK/SwhS5vjWli/xsFUJYNVs3qNIeexK0LQuJForY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1wYzlCBX; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-adb4e36904bso1241464366b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 02:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842794; x=1751447594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gy7AzhYFaEI9pZ7ea04p55QtlZnkaCQmLbJHyD0ZDVY=;
        b=1wYzlCBXoDeA/J8PrZXIKnNGzMMRgvxpqqc3s8pkEma/ePBof9AGbMY+7bcX4Jh/47
         magv1WJxby2P/IK7Ffr3WpW6MalycuL926Lum5igFLJPGELJgS82z9TcPyfXPvUuUX+g
         7jIMfBunO24mYIDhXaSPcsKcW7INZXm8PkA6Lk5SGgPskqHEihfNHEA53UAoOLkP2fB0
         PnrKL0ikrK25Gnk1SfovrtW9yJoIZhO+uUtbq/Ln0JehFjb0cYNZvNEk6kMaana0ZQzV
         rVVXvYp7LYd3I4COt3i1Ufc/ao0iJcz1ejsjT9oFzIvNv4Pyv15tUZl/hpVMqyuDJxpH
         jaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842794; x=1751447594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gy7AzhYFaEI9pZ7ea04p55QtlZnkaCQmLbJHyD0ZDVY=;
        b=V3p9HBwKoPNo2SH4+71NzhT6MSN3otQyyXoanza0AUKjrVyD7FbJ+LrZLOXrerUBhg
         1iSsqx/+5s8CgzGhVhgkXWJ6hOWAdk/18YOLqw9hS/nL4yASH8EYq/+7SRi7x1UIxigS
         6r8uzwB7J1hwFCz1Xfe282M+XwshmMEd9WJKk8nrkeiFw5CbdBkOcerfzhZ+8zpkpfN+
         eAq4+hJ07bK7ZSzwSksQuPHYVfflRU2QlgGVcTBy1ZcosF1ZgiO2WJM4UPRBVINx6gUn
         oCPoklZpWnozQTSW4qFRhYUpfbmbbwT/b50yJBLLDTwLpjvP3ehwud9E7axrMUh/DKTf
         OhjA==
X-Forwarded-Encrypted: i=1; AJvYcCUA8ZNCfLOOg4Cbs8Ig3Ji1hbdv99ZWPEDOUNbm5GNIlFjKB2CUAcFiodaoIhWZl12UL7dFF9iz0SQyeUFW@vger.kernel.org
X-Gm-Message-State: AOJu0YwObdvBLO7Oq8L+OgUfwyWEaC6ug+HvozbzhDcMvLXpUZHjYIsE
	JYKqkZV9Kutjya7IqhOOzvC9QKroXFF+afYKY55UwL2x8VTQpfOhCLJPqPznx6JQeOY=
X-Gm-Gg: ASbGnctUTRW0Z9plToEM52VpOTsXulB92LblHmiuguQpFHYx9IAg5u7DRSbAiVraJWt
	CKBhGSxjjKsYMMG42wOLEMqMnq6jB7ZVPg1dcKcztDKMkiE+lpMqT6qAnxYn/QlLeXoST7nqgId
	I25HIpBR5KhOTCed8XgzokMhSs8PponE6dRVQhqBcotxWIzv54h6vBRfFN3g/IaxaTWuAsyahsq
	sMHl7xWfN4mcn0xFXpESANhUNaQh1Jk+WytA5RPJb5h+YaFdnNWlRIxczSoKphqxg2nNBYoBT23
	ut4I4YJHIhO0/Bv5LGLRSpDvcVxl1HXwuilXQoiBzhedIbvP4ypLjjK1QuWBKTP6pBo5jj/T1ee
	shW+k9RKsmjctzL6tJLZnZz0lQIqi8nYqeav+akMOJS0=
X-Google-Smtp-Source: AGHT+IFvF8x9uHbtysnAXyfi2dOz4+belael0w8BOhLbLcXWnPa/PUMKNrwSjVsMWvVc15op1RjLAw==
X-Received: by 2002:a17:906:d7cf:b0:ad8:9645:798c with SMTP id a640c23a62f3a-ae0bea2df07mr203465466b.51.1750842794312;
        Wed, 25 Jun 2025 02:13:14 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0a93f5e96sm272499466b.74.2025.06.25.02.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:13:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:12:48 +0200
Subject: [PATCH 2/4] clk: qcom: rpmh: Add support for RPMH clocks on SM7635
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-clocks-misc-v1-2-45fea645d39b@fairphone.com>
References: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
In-Reply-To: <20250625-sm7635-clocks-misc-v1-0-45fea645d39b@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842791; l=2471;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=33aQvmJdtCZ4HVQ5M3x8OGvqlh+JGvl1nGP0weshrCw=;
 b=IsOl1W8gyKyVDOMnYOZzWLyktLzpaDaQg52tafRQzcs185XnFZiDeolLZ0XlVQxPUj/eweCHg
 X774OETGXZHCQmo6/UwwsmadpZXD0aNU/CPxeD3eLyMa/ZoW0YYmCGz
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for RPMH clocks on SM7635 SoCs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/clk-rpmh.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 00fb3e53a388ed24ed76622983eb5bd81a6b7002..3c953af51b37bb998020512ec29bfaeb38ba6881 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -386,6 +386,8 @@ DEFINE_CLK_RPMH_VRM(clk6, _a2, "clka6", 2);
 DEFINE_CLK_RPMH_VRM(clk7, _a2, "clka7", 2);
 DEFINE_CLK_RPMH_VRM(clk8, _a2, "clka8", 2);
 
+DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
+
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
@@ -541,6 +543,29 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
 	.num_clks = ARRAY_SIZE(sc8180x_rpmh_clocks),
 };
 
+static struct clk_hw *sm7635_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_clk7_a4.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_clk7_a4_ao.hw,
+	/*
+	 * RPMH_LN_BB_CLK3(_A) and RPMH_LN_BB_CLK4(_A) are marked as optional
+	 * downstream, but do not exist in cmd-db on SM7635, so skip them.
+	 */
+	[RPMH_RF_CLK1]		= &clk_rpmh_clk1_a1.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_clk1_a1_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_clk2_a1.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_clk2_a1_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a1.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a1_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sm7635 = {
+	.clks = sm7635_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sm7635_rpmh_clocks),
+};
+
 static struct clk_hw *sm8250_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -958,6 +983,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sdx75-rpmh-clk",  .data = &clk_rpmh_sdx75},
 	{ .compatible = "qcom,sm4450-rpmh-clk", .data = &clk_rpmh_sm4450},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
+	{ .compatible = "qcom,sm7635-rpmh-clk", .data = &clk_rpmh_sm7635},
 	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
 	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
 	{ .compatible = "qcom,sm8350-rpmh-clk", .data = &clk_rpmh_sm8350},

-- 
2.50.0


