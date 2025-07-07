Return-Path: <linux-arm-msm+bounces-63912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86985AFB07D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 11:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CC991895D74
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 09:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5519296151;
	Mon,  7 Jul 2025 09:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="32CapVuE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B745B293C52
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882227; cv=none; b=Anlderimq47zwk64fdJ6orAeMXYq2vDCiBHqoSYByMUKiNvbR4XY9PaeTGQw57pd9D/QaT5a2aXzH2EEDQ/qEyVNQvfaAdFG32mkb6O4DpNVz60OIYSKiyBQwCn6/coVaD2wAn0NnCYwKMsOSKFGvsop4R5QLf5NukFOCqC6Rso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882227; c=relaxed/simple;
	bh=ydKWhcndlxl5MTvw05hlMC5KMJvA24bWbtmGnXg5050=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DsxjwV4017Ym3os3mHMDLElezh1vHkRQwdwFKeVB8OJVxVMxdANimraEhORz+3D8ap7jceb/koaagiyN+RkYrrsLrfiB1TsYEXDkzY+WRqaDADxszdD97HXWt5XotFSQatXjmSFE75RGlo4QnFgFs51vHa9alZOcXg4PlqZ32/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=32CapVuE; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso5029309a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751882224; x=1752487024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Hp01VtgUu8LOjxJwWCUeEyd5vmcaSl1UkWxGIhB2OI=;
        b=32CapVuEfqfRaTxam44f9EFidzYrPDoLkUlXECVaQm3tMlupak8U/2nJUhnvgH/BVz
         7w+wdL8wqV2DB4tyVLf0Vh89LJE8/itp74sG/tdvJsoMPsiY31BZharvQX2c3f1jjdiS
         WQxg44/IGYPRiWhyCCVI/qS621zuqDoJ4U1IlgDs/8yOiG+pbbdiQATUYg4rb9aNw5nP
         rwVe/+Kgoz15ufU0H+nnxmCdLTh3wLx8Gh4QbnwniYUMo11uHomqOz0XUxr9Ak0kTscR
         P/c6xafgDZ9tZGTsQVLo7Eq5yj8CeThvPiSzZ5FHERzyPEdgr0Q92qWZE3grgcCn0Re8
         +jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882224; x=1752487024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Hp01VtgUu8LOjxJwWCUeEyd5vmcaSl1UkWxGIhB2OI=;
        b=ZUzDN/MIZdDZv5eX1ItnDkRzR9w7Z/wd0cGRGYo0gUa6xOlAeo2K9xS16GOyi7shhq
         z46Q2QDSlKX361CFM4qjFlKWT7mHALWFXxbcEirKT3iO4vwmiBa6Lm/9D6PQzN/3MWUp
         tHAwAt2I2I9/ju2OEGFMXidtZ57MUP43dzoNfRT9b1vzT3sx1I+mpuIgPvGxZp4DvCMB
         v6V6RwDoRgj4i99zkWLgDN/50xSldCq8tOg3/YQX5lb1sWQ6Grl1SybW3CdTKZbFKVBI
         Mjf+BuGIG99lgwcmUJ+T3jaQ7680WJQ4OUgiiIE5Ip+yd0ogI4SwBv6xe+lJw3Cs/Hc8
         B/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEiAOjoHm3P/Seo3XulAd5ZxwNckjze2dCMe930GUvdcfr9+bgZxlJ41I0R2FguSQMA1oUXcsdM3VJx0xO@vger.kernel.org
X-Gm-Message-State: AOJu0YyUdLPHgOAAZuMqKU2lBrb4tsm9ukfS+Wk1lNTvCdU80yvB6WAd
	g/5x3qw+pzlgVeaJAyPHiMHZaOOLfBK1Zk9BrGmbKzKUJtVEjfzidgp2KxVuNld1Sl4=
X-Gm-Gg: ASbGncuVyeR4UtPfZerEAMfYgbSDCE8AZHjO4Cw4LrVqx0pGF3ZCk6bIpne8UDKQL6i
	DzRHa4CrAUVS0YQxMD6E+Kq058tpJmIRpKQ5BS0XdFzYwjH2unl7WO5RwEoV2K7YclF0D9iGSFB
	e08DrtHwvyhq5xr4Bj+X1iRDsWXeGpyhtj/uxXvj/xCHQS7E2IGBrPDkcIhitD6qEd4eFZ9IKbG
	HR8q8O3oQElClQN+JpEpZfAbTnahVVIAdr1I97IaegoID+xxoYHdQXvJNd51oderc+Cb+s1jKGd
	/9TnBSX9sZrbo2cX5uYCEdS2n7wZDPrSrDbOAtUu7Z+k30A0lSvtYEZP2+8OqmjAkRuUkEZGDJ7
	iqZruIwl4cNdqUldM0Z2cIAjJiw8tosaf1M9kB4BtN+c=
X-Google-Smtp-Source: AGHT+IHRrj/KbzA4A7ianBBPJk4PzGywdN0ABPWk5wsDmEPvJJ/W+8MCk3Vc++G3/K90MzO2ya+HxQ==
X-Received: by 2002:a05:6402:4310:b0:60c:3cca:6503 with SMTP id 4fb4d7f45d1cf-60ff40235camr7053514a12.32.1751882223938;
        Mon, 07 Jul 2025 02:57:03 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca6641fbsm5235815a12.3.2025.07.07.02.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:57:03 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 07 Jul 2025 11:56:38 +0200
Subject: [PATCH v2 2/4] clk: qcom: rpmh: Add support for RPMH clocks on
 Milos
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-sm7635-clocks-misc-v2-2-b49f19055768@fairphone.com>
References: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
In-Reply-To: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751882221; l=2385;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ydKWhcndlxl5MTvw05hlMC5KMJvA24bWbtmGnXg5050=;
 b=mZ8V0I7sSXtK/N77Xlv2qRGj//UYkL16sy/wEyB342ppCuBE5Y3dR2wX6XcbMlJROchaA82dV
 sjYfRkRsG0uBjTMYqUe+Z2dLGa38HmumpoqJyJKbpzW3vKbbTAYn5ow
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for RPMH clocks on Milos SoCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/clk-rpmh.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 00fb3e53a388ed24ed76622983eb5bd81a6b7002..5ca43776f1bdbaadeefbdeabeb557810ff0071ad 100644
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
 
+static struct clk_hw *milos_rpmh_clocks[] = {
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
+static const struct clk_rpmh_desc clk_rpmh_milos = {
+	.clks = milos_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(milos_rpmh_clocks),
+};
+
 static struct clk_hw *sm8250_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
@@ -943,6 +968,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},
 	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},

-- 
2.50.0


