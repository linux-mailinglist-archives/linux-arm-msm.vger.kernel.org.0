Return-Path: <linux-arm-msm+bounces-6617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F241826E60
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 13:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E65601F22C5B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 12:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D792053E19;
	Mon,  8 Jan 2024 12:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zNn54Rcl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D36F53815
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 12:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e7f58c5fbso2016531e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 04:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717163; x=1705321963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNtUNkUh9FGJbdZOMIK94mTgP7TeoEvTtcC+EeetQyY=;
        b=zNn54Rcl1qOTFSOWX3KPUUk0KbwDoooQpTXWDP2aRuhUwF23hc/RkETi50jGCyijaH
         wXQbUf7lJyjhfzixITMoHk1QzkYAz9bCQYoZlc/zKok3/V3T9m9I0tdIm0le5WtKVtQE
         xiYTJwnXbASPOrg+8D8Gb+qHt6g0hjjG89TtC+czvj3xGBTAEX7q4elUyvhsdBCA1HJN
         CkCC7x72w1EiyI1yBTSDHbmige6xVlzrEBwbTpC7pX8DPRZ3geWKWHnHAdIrV1fa6nYf
         wT5mz3FAJy3YvImv/16g7QECqL2xHSNHi8l8nFd4LB3zHRe1Lku/49+ADB6MKwPh5B6b
         YgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717163; x=1705321963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNtUNkUh9FGJbdZOMIK94mTgP7TeoEvTtcC+EeetQyY=;
        b=Nj0sgU7upGitrMsITsTKED7JuV74LEaRZe6vywVGpPqHQIAH6BrhjEM4TfTdtrWQsI
         cPhyxkPt8a1gFpp5YGn32/0+UwnYzQqfHXw8Cm7SUhMFi6b0A5W8KZ68psTkFemmE4iM
         exmTkyNMS9K2sPlQD6zt3Iwmvfmnr7KdOibsLmyz2bebj1yInBdtZ0Pv7hGKmCyCNR4p
         C5EV9ZY8ZJ2dytMi1xZ8ra3K/YJR1BrprYgkU5aXC44j069bMuA/7ES3lKBkjrFZKjyk
         2kUPtAyQY4NM9wbzH5DqzSn+WS+2BKyvi6OCsFliMgZ+33cQSQ+5GKwRAdhBq3Fct0SY
         rTPQ==
X-Gm-Message-State: AOJu0Yx9OmFRCSbgIH0q29Hqze4RRYe22zRRyfG+Lrsb/bPFmrSv4kBF
	y9aYkNspanUPZnTVAR5ismZS63T6B3quMw==
X-Google-Smtp-Source: AGHT+IEiAnD+s/Ww6yB1jo8E1/fS0G/tjzUMzG6PR8Zn7EKyqlkNO1H+B7HWCvyJOA8628WTrSiGgg==
X-Received: by 2002:a05:6512:3b21:b0:50e:aed5:ec06 with SMTP id f33-20020a0565123b2100b0050eaed5ec06mr1899879lfv.87.1704717163102;
        Mon, 08 Jan 2024 04:32:43 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:42 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:24 +0100
Subject: [PATCH 07/18] clk: qcom: gcc-sm4450: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-7-981c7a624855@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=954;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Fxti0GA8oke9cfmTk8lezOQQ4xqJ9ulz/6+rw77WHBc=;
 b=T9h8+bQcnBpTMQ95RCuWK06WIgUjFTQ0caVsHrO2vUMljG4A6UGeougSk6CMJZXsQLX9HipA2
 AKpZMqk2QdUD0CWELycAu9jULjvQ9L0SWlJy0uA4HDDZt8IkkWa0VRS
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm4450.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm4450.c b/drivers/clk/qcom/gcc-sm4450.c
index 31abe2775fc8..ab8fb77d15a2 100644
--- a/drivers/clk/qcom/gcc-sm4450.c
+++ b/drivers/clk/qcom/gcc-sm4450.c
@@ -2791,8 +2791,8 @@ static const struct qcom_reset_map gcc_sm4450_resets[] = {
 	[GCC_VENUS_BCR] = { 0xb601c },
 	[GCC_VIDEO_BCR] = { 0x42000 },
 	[GCC_VIDEO_VENUS_BCR] = { 0xb6000 },
-	[GCC_VENUS_CTL_AXI_CLK_ARES] = { 0x4201c, 2 },
-	[GCC_VIDEO_VENUS_CTL_CLK_ARES] = { 0xb6038, 2 },
+	[GCC_VENUS_CTL_AXI_CLK_ARES] = { .reg = 0x4201c, .bit = 2, .udelay = 400 },
+	[GCC_VIDEO_VENUS_CTL_CLK_ARES] = { .reg = 0xb6038, .bit = 2, .udelay = 400 },
 };
 
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {

-- 
2.43.0


