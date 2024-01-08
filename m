Return-Path: <linux-arm-msm+bounces-6615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26783826E56
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 13:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD5231F223BF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 12:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F46524B7;
	Mon,  8 Jan 2024 12:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpMMIsN6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C52C52F6D
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 12:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a293f2280c7so186361166b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 04:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717159; x=1705321959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZvojekarEa25/JgD1GVRTc3l09GZdvUZ3Rwwz29QpBs=;
        b=QpMMIsN6T82nKrTdcaAHT1AKq+0rdshq9sdyyp8Sy+AMbvmAjJCUJ0/XE7wlj07s8h
         1EJNHdjGXiNx+7IyVLFXf/Twz+dNSCRT7O55/+MFVB0jK74fM9gclZmLPY2+X45uB1R9
         336IXwXvESur0UgC+2RCxdXBhQDqxyjK96JHcKzfhUO/4lPUr43r6lXDgg4npOX7U0qA
         vATK5Eoi6SBUQh6ExJDcCIu7wjRryGghuJcof3p1DvjrlH2S4h4MP56lnagXuT44IWTO
         dUnHpeMgr707PhXwgR8A6uOZ/wvO2kDc0DYB5zSYeEXiKEH31Uv++JHo8SCasEyI7iQ+
         Sdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717159; x=1705321959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvojekarEa25/JgD1GVRTc3l09GZdvUZ3Rwwz29QpBs=;
        b=qv9RWNQBRTD9QRcYctnDb8xyRlgTVqHa57GRVyCRd5QD/0INh+b/L88FDXsV/eHWBV
         WmmHBqU3BWEpRATnwV5wIA23edV1xcsQBuYlmOvrBlURsAg8MIsoDdf7XeSQX/K5lmDj
         XyCC5IneLlViSdc26ROrqTTtQZY3jJTLhtBOJ0oqaU2ZPKnpEE9wmsR4BdXoYadjPFA8
         lk6XkrdnJ3UatMgt81yVQfwj8UAHQqyyo4dKdXdMaq5o1vigmMHCZmDq+BPX2zp02nrL
         cSjiRR68eXL6KsnIsZ0T/xg04u3NzVxaG4jxavLFMygdiWzxIdpSErxSiZFGnum2lImJ
         9JmA==
X-Gm-Message-State: AOJu0Yxer/cAPYvMcMV7X5y04I+vG5hB5dkwLGl64rwLuyKRjcLJqF7C
	YturoC00Re1lveViTwwINWPfwXgE2xKm4g==
X-Google-Smtp-Source: AGHT+IFJHtLKceXbg+EQ3pzgQNqDSAZM8acrlFYqVCV4jQfvbP0JUiKVJSbUYPV37LDRkEEGdl5OKw==
X-Received: by 2002:a17:907:701:b0:a29:a65c:4f7f with SMTP id xb1-20020a170907070100b00a29a65c4f7fmr874487ejb.63.1704717159539;
        Mon, 08 Jan 2024 04:32:39 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:39 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:22 +0100
Subject: [PATCH 05/18] clk: qcom: gcc-sc8180x: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-5-981c7a624855@linaro.org>
References: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=1059;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Hx4TRbgTScKyTQxQMgBp7A3R4IUgEVBr0AkzhL3Atn0=;
 b=bZ3z/L1OPEYXX/zph4gQh3yJaeAlA4Yi/IQb2KOqQafVyejTli11awJnLnReDOeuv6h8Bo/gd
 GHwJ13oO3LUA7nNF2VizjUJa8h9v7txjaPhTULJi4eVKSk0XrDrXfOw
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sc8180x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8180x.c b/drivers/clk/qcom/gcc-sc8180x.c
index ae2147381559..1351c52bcacb 100644
--- a/drivers/clk/qcom/gcc-sc8180x.c
+++ b/drivers/clk/qcom/gcc-sc8180x.c
@@ -4528,9 +4528,9 @@ static const struct qcom_reset_map gcc_sc8180x_resets[] = {
 	[GCC_USB30_PRIM_BCR] = { 0xf000 },
 	[GCC_USB30_SEC_BCR] = { 0x10000 },
 	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x6a000 },
-	[GCC_VIDEO_AXIC_CLK_BCR] = { 0xb02c, 2 },
-	[GCC_VIDEO_AXI0_CLK_BCR] = { 0xb024, 2 },
-	[GCC_VIDEO_AXI1_CLK_BCR] = { 0xb028, 2 },
+	[GCC_VIDEO_AXIC_CLK_BCR] = { .reg = 0xb02c, .bit = 2, .udelay = 150 },
+	[GCC_VIDEO_AXI0_CLK_BCR] = { .reg = 0xb024, .bit = 2, .udelay = 150 },
+	[GCC_VIDEO_AXI1_CLK_BCR] = { .reg = 0xb028, .bit = 2, .udelay = 150 },
 };
 
 static struct gdsc *gcc_sc8180x_gdscs[] = {

-- 
2.43.0


