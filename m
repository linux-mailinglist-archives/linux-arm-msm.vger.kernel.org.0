Return-Path: <linux-arm-msm+bounces-6628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 755E7826E8E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 13:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13A421F22D4A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 12:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2837A55C1A;
	Mon,  8 Jan 2024 12:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jwHWKG+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7A455C00
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 12:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50e5a9bcec9so2010574e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 04:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717183; x=1705321983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qAbsh2raT0T0gFCQooD4qLMuLwM2nwWqes0FR90GOPQ=;
        b=jwHWKG+Y1RX6AMZO0dHmwAJDlr1y9JaKKeEa8R7rJ4uN7tmIoEmJQ3IoS8Z589VCdQ
         Gq2UqbkXRU8qOqFKPLeIfyE7M+a+Qpi2S+72MdZeMo3Ljj9mjSrtj7MLcayVb/UbZW1e
         bJx2nfSBEPgphgbDid0WJm8wYUQE2HDsZWUYn9dcZ4Bs178t6Zi1FP1dad72LR8FPsMa
         IljsWX2HbhfBWj7IcfGNylFQTJ32FMuXH/z0LxXJoG7AAMSG7KnCYjMyv3jc6H8r4vQm
         yi8qpXSEHuPgOSl4w4rNcJS4Lg9+1RKNZbMWva/wQmeoL7lQZtxWCY7YVoQuVXVn9VWz
         97Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717183; x=1705321983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAbsh2raT0T0gFCQooD4qLMuLwM2nwWqes0FR90GOPQ=;
        b=D+5FAEx1BTz4BsROK2vtSzmifGWM0Pphew/ti6Oc113ucFr2KnrDtdABvec5izdhG5
         JV+tPEWKM62TvMf9dQ4MNLBmGXqMvQIsfRD56p7mSvahlquYyvPR8D6BqZKMc/0aXScJ
         Z1DGcBpLjXtCuzTa36zHndOPd4fKwM5rVN0Yxx2TzPgAHm6rPn9v63r5AIuTh+mZXFl0
         Ks5y7/5vc5mNfN9PjFtcAPN1pfjbZZxHV1Vlqpf9xWPRD8DxLngb8JSBWG0kKjNr91L0
         pZXvC3Jm6nqwTZTB2JHmeEwrsDLW1oGL+xzvTpAgMM2U0I0zpkQfg6tR5A2QFtHuPgLP
         BiVw==
X-Gm-Message-State: AOJu0YyLqAc1mhHUHJ0biMqFzsEkVljCLbeVWvhPogfJ2m+6YwjpN8op
	yauBEdBd/mL4AwipQEpE9Lml7LHS6Rnvkg==
X-Google-Smtp-Source: AGHT+IFYUuWFbF92DbLRI3ofhjcvCWjuhJs6/xR0HUwQ2WQiMchCs7oplVKkz6Elf8Lrch1L9GMPFQ==
X-Received: by 2002:ac2:4822:0:b0:50e:6ddb:551d with SMTP id 2-20020ac24822000000b0050e6ddb551dmr1300789lft.73.1704717182919;
        Mon, 08 Jan 2024 04:33:02 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:33:02 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:35 +0100
Subject: [PATCH 18/18] clk: qcom: videocc-sm8550: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-18-981c7a624855@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=986;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=nUkji27joUy4z7sSoyVsNLtQaWjmCqTk31+xfHWXM8I=;
 b=w4g8AeDrPElFZuWnShULIUezl/D8Mown8pWJMvSQi8+U6rX64xETD1nQ/r4IjQuIvmP9ljfUk
 P7na2O9tyb4B4xcuvQv5tDQcZWCiODy4K8z0qMFVpLRR81QOZKxrfOy
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/videocc-sm8550.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
index f3c9dfaee968..e3f146347da7 100644
--- a/drivers/clk/qcom/videocc-sm8550.c
+++ b/drivers/clk/qcom/videocc-sm8550.c
@@ -378,8 +378,8 @@ static const struct qcom_reset_map video_cc_sm8550_resets[] = {
 	[CVP_VIDEO_CC_MVS0C_BCR] = { 0x8048 },
 	[CVP_VIDEO_CC_MVS1_BCR] = { 0x80c8 },
 	[CVP_VIDEO_CC_MVS1C_BCR] = { 0x8074 },
-	[VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
-	[VIDEO_CC_MVS1C_CLK_ARES] = { 0x8090, 2 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { .reg = 0x8064, .bit = 2, .udelay = 1000 },
+	[VIDEO_CC_MVS1C_CLK_ARES] = { .reg = 0x8090, .bit = 2, .udelay = 1000 },
 };
 
 static const struct regmap_config video_cc_sm8550_regmap_config = {

-- 
2.43.0


