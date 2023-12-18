Return-Path: <linux-arm-msm+bounces-5263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C73918176D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 17:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DD8E1C25050
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Dec 2023 16:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262C272065;
	Mon, 18 Dec 2023 16:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ehDi5kpt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7522C71459
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 16:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a236de428a5so18785766b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Dec 2023 08:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702915354; x=1703520154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tmy1351WhysY14MPIZnZg7MaXR9rNDaM54jz8n5nT/I=;
        b=ehDi5kptvKU54+C0MdUUWDTfvdiXmcjw++NvWgrg4696yxZ4A+FRzQp04CN9xNVGW7
         lJg9lPMFcIBwsNabmPqMgu/LGbceAXAERljJ423p6tl+8j2NuCGz3SLy172/vBfLeoly
         hgQ5p8UKOczi1bqvPCebvMb/Wp3y0eerCIXMKpHbTkW7ZYn5LTsvLcWbq19/8L5p6q03
         c3wZc3NBcVY0dfZMsdyMnFPVkwWZbKpsZOPZPu0xELjz9RMWCxFrJxZyLV/v96gl/3dT
         rMMpTeVkJMQGSfgr255nmLXl6L3gNynHz0u8Rd9Oj52bxKkBFn64BIXHtYGNGCrAkjyT
         bI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702915354; x=1703520154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tmy1351WhysY14MPIZnZg7MaXR9rNDaM54jz8n5nT/I=;
        b=bLIXP2iLLSOrK1TSj4Y3+fb06iJODOmBHBhnHsCVA8t6yZPO1w/87y+TeG8onsrFfT
         UG/o7q+u+HCaYTRYZQf40iivx8ePtR/reVuVVMicU10SFN1SA/NrbmOX5KY1Pgys7oYU
         OId+HETQJmghEwB81FG6l0LW/KO8P0fQGutvqA7zPA57i+c5Dyd8wziom8MgiksVQsD7
         3TpXCtRNiSrVoVgdbPejciJ/CI8kBqQukfeMTYMVk1QEcWTwW8EYRSHFi2IfFT6HAL2o
         JYMBFtXM/8In28cipLTAI4Vz0esum60CdAdSu6SoCkQViTWU+146tGQ7ur1BWwfQgfxN
         JTSA==
X-Gm-Message-State: AOJu0YwaiFd1fSm4s9slYI35wf7DY15yZThRT/zVddSmXgyhUzirOvsi
	TWidKliDPaG3g2ArSLlMuvEENw==
X-Google-Smtp-Source: AGHT+IGcqpIXK1SZf3aJgxS6kUFd914bHdfsLtWun9fItQQmOUlIgZFtTPDZNi1nFZH7NOFT4IlTaw==
X-Received: by 2002:a17:907:c999:b0:a23:49f7:a132 with SMTP id uj25-20020a170907c99900b00a2349f7a132mr1210916ejc.44.1702915353771;
        Mon, 18 Dec 2023 08:02:33 -0800 (PST)
Received: from [10.167.154.1] (178235179137.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.137])
        by smtp.gmail.com with ESMTPSA id ts7-20020a170907c5c700b00a1dd58874b8sm14260693ejc.119.2023.12.18.08.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 08:02:33 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 18 Dec 2023 17:02:09 +0100
Subject: [PATCH 08/12] clk: qcom: dispcc-sm8550: Update disp PLL settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231218-topic-8550_fixes-v1-8-ce1272d77540@linaro.org>
References: <20231218-topic-8550_fixes-v1-0-ce1272d77540@linaro.org>
In-Reply-To: <20231218-topic-8550_fixes-v1-0-ce1272d77540@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Georgi Djakov <djakov@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702915332; l=1329;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=5tbiuHAzVzq42DxvRzRnmc/Zm2HLv3YyRRdXfzE5DAk=;
 b=Ml2SoneCW7eoztQueMMtroWW6FEuyqSxKRQRSzXBES8NAlXPnbPsg4hQNwTHWSOgfF5q8Cj0e
 USMLm3l023jAJ13fBcautlg7huj/piY49NzF84kNnnyz5Mt5qBm41hx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

The settings in the driver seem to have been taken from an older
release. Update them to match the latest values.

Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8550.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index aefa19f3c2c5..0b8f0904b339 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -81,6 +81,10 @@ static const struct alpha_pll_config disp_cc_pll0_config = {
 	.config_ctl_val = 0x20485699,
 	.config_ctl_hi_val = 0x00182261,
 	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
 	.user_ctl_val = 0x00000000,
 	.user_ctl_hi_val = 0x00000005,
 };
@@ -108,6 +112,10 @@ static const struct alpha_pll_config disp_cc_pll1_config = {
 	.config_ctl_val = 0x20485699,
 	.config_ctl_hi_val = 0x00182261,
 	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
 	.user_ctl_val = 0x00000000,
 	.user_ctl_hi_val = 0x00000005,
 };

-- 
2.43.0


