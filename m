Return-Path: <linux-arm-msm+bounces-49863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CE9A49CA6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 16:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40B527A9172
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 15:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633211EF37E;
	Fri, 28 Feb 2025 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vp/La6PU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632B11EF369
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 14:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740754794; cv=none; b=Y/bHF+ZmoS3aGZaoBUaaAIe1TD9V6l6dS0kqA0re58Prwy4som3di61CdRECFuMav2tsHaVowof+O+L1Dl5RxPh/AuFVXRYYo+rsAggVSUO8rLeylWTP+/JVgvlEYu1Ts33dm7ilmmwAvqd53tl9RGboyQW7vkRclPiSmTy/I34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740754794; c=relaxed/simple;
	bh=vHAyh+aZtjj4UVbfYiEg4XiXV+9PKgdjaYaSe/RnITY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HPlDWjvlcd2hFFxXO0cLeNEQCVe21PuH3RQVb5otNtpo2kKI9XoWMuxUCzTR8RVRgtIv3BpZg/3LSHFp2xpUyhEHE76J1t6ZBiMjIbUGBJHQHFLLivX6R5AtLYY6YcnQY8zXTE2nJTQeF5fU+UKgtcLCmJWxkZOOzEpqSeO+9GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vp/La6PU; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43982cede30so2505735e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 06:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740754791; x=1741359591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lM0h2QvytSMEiRvZJhoZFe3KFdb8Rgyhv/wRCO7DzZo=;
        b=vp/La6PUC+E0vhUY1Oq3gpRugzznChjuMAsOkPLQtBFiV6b1sZDAIULaa1IxkR8UUd
         4FzxpW78Di5NvkW/HafnLBG6TX3pWBHwIJdWnPUTOWIuXSV3IFvWXCOd4rfJWUXzS7Aj
         0i3NC2UxAjuIaEWY4uM0xZy0q9dWbivMNyODVLRqAQi5y1OIfFFoXya2y8WE7HElM2Y9
         kJHGqSjTGuJHpfjXsuUXPfufDsBtTNWK4djOUtpK6d/BnMSjUhSbcFVWwTk5ecRnawEc
         8fea2bSNyuAsI9RkSvsqrjbY7BtnQE7Q0YUChi8CLI9GntpmaUrdjY2YQZ2ZAP8tDOf7
         cfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740754791; x=1741359591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lM0h2QvytSMEiRvZJhoZFe3KFdb8Rgyhv/wRCO7DzZo=;
        b=cRFrD262unPamdCNSo99I47hAAjGHH7HL3qWUYjRteG8GwLLCbq6lrwuhqDSi/WzyC
         C+TloLeyykNuzCnn9+IMDE6Pd0xeR/6lCPf03hl3vqRZkzWcE2GbSoIchYp78ddZxjpd
         VWry0CC5FaXnPfrEQPDdT+a287GkqZaFNLSreOyNJOt++HYsBBgkE4uv+JSiJsHbRlBi
         QadxpdQn2HLPZWKEN2PcPD4FbaYKhjsxePPywN2Owt8EnH577qSuxL8PmS7zjsXHxuEG
         l3cEgNrKEr1CBXClek18IvmIYa6PyU39IcRvDXI0Z4G9HaTDJuKn4B14z1lvPMvLT8Tj
         QgJw==
X-Gm-Message-State: AOJu0YxC7FhbC8Pqyo/MkZ4Oxr/xKveJBc/VlE26W7UOj9wJbnT7vkLf
	ovTGsAhNWxmivwat0cf/WMtTM08sodevZn4rM3Fpp17wGrCwVN6V59gyD8ezJKY=
X-Gm-Gg: ASbGncuqF4Ca1s1LJSS9/b5WZ9csrDhnBIoU3utMBznxtOgQuLvo+m6uVW2Ad7+PWSf
	HfgiRGEo8ddDy/nv8161kZPt8MkTqeqBqTJk+gW+7H8IdlN/0bA8AblD7m1jK4ZRhueqa/sCXcm
	UqGPpVT0auWgvfYc9iS8YIMeIK4VlMGHcPzfi9CLa8m5h56Ad7TcKDXmHFlF+Vl+OQUBoTG/cB0
	xuSKWUqOSVdR6UQIW1B3D1TSb2sht3QYAdvCxyy79EeXAmj11COuF8HHlCuN8ZP+QoajtUaqNwI
	2cZzqT4gb7NxrNqkFYrJZKvVSoCh9KxInIQxDC1vlQ==
X-Google-Smtp-Source: AGHT+IEzu1FJ9sIFN1WjtHGbB206s9n6kqpGkcZ9NK2E0J9rvZXRVnox5W2zfwM153wD3iatn0djVA==
X-Received: by 2002:a5d:47c3:0:b0:390:dba1:9589 with SMTP id ffacd0b85a97d-390eca88e4emr1174577f8f.8.1740754790665;
        Fri, 28 Feb 2025 06:59:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d785sm5450770f8f.83.2025.02.28.06.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:59:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 28 Feb 2025 15:59:38 +0100
Subject: [PATCH 1/4] clk: qcom: camcc: Constify 'struct qcom_cc_desc'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-clk-qcom-const-v1-1-611ab80d45e4@linaro.org>
References: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>
In-Reply-To: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4210;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vHAyh+aZtjj4UVbfYiEg4XiXV+9PKgdjaYaSe/RnITY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnwc9fLF89orSMNw/fsXUhzIRlXIPq/DD+PRu6Z
 O4OU8JCmo+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8HPXwAKCRDBN2bmhouD
 1/OxD/4xCZTpFa9FC4K+lTpTzvErE9zIrHd47L3lg/iDnuSvJBdwo8FWwxNmJn6vEpPn9+cNAfR
 7XyqzQt2vorxAkgtRr3IlheUE+0ipV0Kp3hy+LXI5T2SxacHPl/EM8ZGf6wKrneIXZuyBFhle3J
 kFu4ODNtxQH8fUOjmfgDyAga4wLCYv+VpFtxDUpGXRtfPQtc8ypD5pfjSKtRccl20d0H5Tj657W
 pqfIvw/FNLRmDCjWisJXRKQ5C3ZWWK0urxDzhoRd52AdSNkKFgZ7a5Mr5+kS3Y84B1qzOgyGWJi
 Zie4CkGDFxEC6BCAs5kRCv2Reh2u5x4DvDSENJ6NYI2A/W2sW6mUWtWPT6Z6ZHO23hxt3xYvKQo
 JhcqzdYRtUPUNsJjHqCMYCwECTJDtJHlBWUWN98j1W/44B11rZSW6L9ev33L024Yyu+YhFh1Y6T
 w0nnktNJPdYACxku58+wdhRxbmoNwNzBG2IsntcwY1smQawdVRoBSNGEI53jX+lmDMldYvAfyDT
 w5Tr9X9W8iMj3J8MALSqodOOEjSkPmaDp3hJjZ016oucktOI8BA6j0/oPyDRRqn6N6uQlTMo8n3
 2zNhLjg4XhRpH5GxK5AQSJL1qkZVLI5YmJACd3EY19m8yQR9X0bmihnqtPB1/FBj8G0PyMLZXKb
 /1DuHOo22WxbjdA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

'struct qcom_cc_desc' is passed to qcom_cc_map() and
qcom_cc_really_probe() only as pointer to const, so make the memory
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/camcc-sa8775p.c  | 2 +-
 drivers/clk/qcom/camcc-sc8280xp.c | 2 +-
 drivers/clk/qcom/camcc-sm4450.c   | 2 +-
 drivers/clk/qcom/camcc-sm8150.c   | 2 +-
 drivers/clk/qcom/camcc-sm8550.c   | 2 +-
 drivers/clk/qcom/camcc-sm8650.c   | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sa8775p.c b/drivers/clk/qcom/camcc-sa8775p.c
index 1df86da419406f90ac6fdfc671ceace4acef1658..11bd2e2348119d4238f2ad084a00983d2b219fbc 100644
--- a/drivers/clk/qcom/camcc-sa8775p.c
+++ b/drivers/clk/qcom/camcc-sa8775p.c
@@ -1800,7 +1800,7 @@ static const struct regmap_config cam_cc_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_desc cam_cc_sa8775p_desc = {
+static const struct qcom_cc_desc cam_cc_sa8775p_desc = {
 	.config = &cam_cc_sa8775p_regmap_config,
 	.clks = cam_cc_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sa8775p_clocks),
diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 479964f916086cc077ea4a9be8de11570e4ce2cb..18f5a3eb313e15d347801bae6d6d0ba42605c34e 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -2987,7 +2987,7 @@ static const struct regmap_config camcc_sc8280xp_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_desc camcc_sc8280xp_desc = {
+static const struct qcom_cc_desc camcc_sc8280xp_desc = {
 	.config = &camcc_sc8280xp_regmap_config,
 	.clks = camcc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(camcc_sc8280xp_clocks),
diff --git a/drivers/clk/qcom/camcc-sm4450.c b/drivers/clk/qcom/camcc-sm4450.c
index e51590d89a3cbfef25b1023950fc4de7b0b0899a..6170d5ad9cbfa7c7e24efa448dded98682d7d686 100644
--- a/drivers/clk/qcom/camcc-sm4450.c
+++ b/drivers/clk/qcom/camcc-sm4450.c
@@ -1640,7 +1640,7 @@ static const struct regmap_config cam_cc_sm4450_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_desc cam_cc_sm4450_desc = {
+static const struct qcom_cc_desc cam_cc_sm4450_desc = {
 	.config = &cam_cc_sm4450_regmap_config,
 	.clks = cam_cc_sm4450_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sm4450_clocks),
diff --git a/drivers/clk/qcom/camcc-sm8150.c b/drivers/clk/qcom/camcc-sm8150.c
index f105534cb318069d71590fbeb2d6aa181c621af3..62aadb27c50e0690ceb932829e4666987a622498 100644
--- a/drivers/clk/qcom/camcc-sm8150.c
+++ b/drivers/clk/qcom/camcc-sm8150.c
@@ -2094,7 +2094,7 @@ static const struct regmap_config cam_cc_sm8150_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_desc cam_cc_sm8150_desc = {
+static const struct qcom_cc_desc cam_cc_sm8150_desc = {
 	.config = &cam_cc_sm8150_regmap_config,
 	.clks = cam_cc_sm8150_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sm8150_clocks),
diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
index eac850bb690a276f52f7565f8f3b923800bcee22..871155783c798fd9245d735642272eae2a2d3465 100644
--- a/drivers/clk/qcom/camcc-sm8550.c
+++ b/drivers/clk/qcom/camcc-sm8550.c
@@ -3487,7 +3487,7 @@ static const struct regmap_config cam_cc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_desc cam_cc_sm8550_desc = {
+static const struct qcom_cc_desc cam_cc_sm8550_desc = {
 	.config = &cam_cc_sm8550_regmap_config,
 	.clks = cam_cc_sm8550_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sm8550_clocks),
diff --git a/drivers/clk/qcom/camcc-sm8650.c b/drivers/clk/qcom/camcc-sm8650.c
index a37e52a67ed4dde59731598bcd4b8e4d1bf9c546..0ccd6de8ba78a3493f8f853a4330d2676b5743d4 100644
--- a/drivers/clk/qcom/camcc-sm8650.c
+++ b/drivers/clk/qcom/camcc-sm8650.c
@@ -3517,7 +3517,7 @@ static const struct regmap_config cam_cc_sm8650_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_desc cam_cc_sm8650_desc = {
+static const struct qcom_cc_desc cam_cc_sm8650_desc = {
 	.config = &cam_cc_sm8650_regmap_config,
 	.clks = cam_cc_sm8650_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sm8650_clocks),

-- 
2.43.0


