Return-Path: <linux-arm-msm+bounces-9989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AC484BD3B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 19:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26E441C21255
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 18:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6BB61C2AF;
	Tue,  6 Feb 2024 18:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BDvSG3ht"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE021BF2A
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 18:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245041; cv=none; b=qWAdWb/VgUAaKvCKDNIFPaiYpQguI8WOTq5l29/2XCV4eQZJ+ZPFM+Qpda/lRW5WVQ8qyYZoYhOpmoSugPOccpoPZYN9cHAjhq0+vLxm6wkJeFhY0+5zddzqYK3RLh1kFgnX70KvZ8qmAzuTam5k+yM4EkY7rOXx7vEBBh8sbVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245041; c=relaxed/simple;
	bh=8KOUxxHlTkggQTw7pN3WXloq1WdTnUWQp8JLscQ7fqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jR0yUMV7F+ZR+MIba5H/ioIyhod9xxpU2JOPfWU7iF9ljh3SUT4ToPp3jOWUqUEfB0hk3ti1yl2OyisrfQgCdUPpF5QbNhLnyzwzNKZznhYjPY8lIJWA4JIvoAbA1osKygcL3IDsxt2gqKsApogFqz93PnQLAEI/SZWHNRFOqkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BDvSG3ht; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a380c98e824so164343266b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 10:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245038; x=1707849838; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKzZAHgHTdg4BbNqiHqVVtnjbyCumYhOTEucfxgTrIw=;
        b=BDvSG3htV++/trWPPvgIPCvOpvquduoUWmpWZZjvevEw4/Q9dlGofCPWF0zU105y2N
         S1QNbmqbSboYeU3x0SKUZZg5nHhCY4qiii/MsWsvnDqntQ0jwR++jw4g6uFyS2R159fk
         73H2uiqQ7AnvmKcprGgq7Z9vTGdPR0n+JJ4HaW07J/nBGqDq16qqIleltqQt4wbqNsXZ
         EjLWSc5HP6ichJqvZDYnyb61I3aF4bEMkh0WpgH/nVec97R1M+zj4wvDl5r+KPze3rMC
         YFj44hvtThJZHG7nM7D+uwI7/qE2arZd5SmWUQBD3TLDs1+qtyJBpm/aKi5h4kCYHZMd
         6MIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245038; x=1707849838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKzZAHgHTdg4BbNqiHqVVtnjbyCumYhOTEucfxgTrIw=;
        b=OtZoAWgjSlOtzHsMbdH2byaHgbtdL3NUJjaQzn00y9Sgiyfo9TW14AaESzjlnz1fag
         zTOQlQ1ygVPCtiC1GZzaRo6mUkkE/o9pXSuk/akFhpcsuu4bcE3rTK1fTxp970YK21FN
         g5pC0c7gVXCmvzAJeeFjZKNDVYkIXrza4wCw9W+TZfjyOTGW9sQS/0Dp35EMh2/TZxNP
         NaUqCLU/ym7uw0NiTaGutJI0ehCT5kRPusG0DTFkjMFq048byxUJutGkfHJEjzzAniEA
         VSnpiWbW+7TlwfeeI3gUYYjrJzj6d1nl+D9bkcWAcDhS14jZ0ClBAaFZEstUB+tIWrCa
         hilw==
X-Gm-Message-State: AOJu0YzRIlwr2PdK2vt+4IBoeyWqlM7SiYeByGlUNGK+PeQ2u6AmXEqA
	ZEE+AjuwfOtvLlKPYeJ4jFGFnLavFkjxYGnmoMonIR+FLHIBZd7MvDk9YbQjsahCaIXSpCeBiXG
	J
X-Google-Smtp-Source: AGHT+IEpxaqbXk/sCzajWJj1TSeZlTVEf+GgKyUNCFgxhTbHZQMVybKGhSkVSF50B6HQQh9UUw/G5w==
X-Received: by 2002:a17:906:6acf:b0:a36:c353:952e with SMTP id q15-20020a1709066acf00b00a36c353952emr2677030ejs.41.1707245038414;
        Tue, 06 Feb 2024 10:43:58 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXNXsO2PoV0ZOcB7JTVIQvy680ITZXlBp7AmI9t5ymHnrrKMbUlXoqwCaNG0kQgk3RjxPJTgqoV5tRcCDwRRxQJBiLgBwvKo8VmdfoIBRP0Fp/5sVtAy06KldUaGyeEGELtSB95e1cVTMmYa521RO6u7uTXxPZapPCSKPaokxVJF84odL3XLAMCYLnM7siXsAs0M68Qf3evIG9D3F3Fr9VOo9Mr1STvixzR7YJLyQX9RXEZkF//Mao99kDUsYlq9C9xLV2DWWubZzYzpkQqDA4Vf7EbysNDWPmS95CMCDEBIxlVBhmN9y1baDRSnA1bJlfSi5Lykbh46WbJQPy5IcStjhGEMfSlT2aj96phzfDfBQNcKhb8WgrMEpL/H/6M7BqfBBG16jelpW4x0rJOebUWHriVVhH97+wVm7JBGOvBxUXg6z2JGoTRZQkMCP8GS5pIqFpZmVfA
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:43:58 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Feb 2024 19:43:46 +0100
Subject: [PATCH v2 13/18] clk: qcom: gcc-sm8650: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v2-13-c37eba13b5ce@linaro.org>
References: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=1017;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=8KOUxxHlTkggQTw7pN3WXloq1WdTnUWQp8JLscQ7fqE=;
 b=y9cwir5KB6HgBFeoRBqgqFEwRDH0tpnirUD7O5WzDrrGFcovKkl6Ndal6mmD10FwERgIQAyvR
 12wa8gOU6loCmR5UvcOT5Bz8D3paNH3ZrNaQMM7EnCvt+AP7Ts9U+n3
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

The Venus hw on 8650 is similar to the one on 8550, follow its
requirements.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm8650.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index 9174dd82308c..63becb03cd90 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3734,8 +3734,8 @@ static const struct qcom_reset_map gcc_sm8650_resets[] = {
 	[GCC_USB3_PHY_SEC_BCR] = { 0x5000c },
 	[GCC_USB3PHY_PHY_PRIM_BCR] = { 0x50004 },
 	[GCC_USB3PHY_PHY_SEC_BCR] = { 0x50010 },
-	[GCC_VIDEO_AXI0_CLK_ARES] = { 0x32018, 2 },
-	[GCC_VIDEO_AXI1_CLK_ARES] = { 0x32024, 2 },
+	[GCC_VIDEO_AXI0_CLK_ARES] = { .reg = 0x32018, .bit = 2, .udelay = 1000 },
+	[GCC_VIDEO_AXI1_CLK_ARES] = { .reg = 0x32024, .bit = 2, .udelay = 1000 },
 	[GCC_VIDEO_BCR] = { 0x32000 },
 };
 

-- 
2.43.0


