Return-Path: <linux-arm-msm+bounces-49865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A07E5A49CB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 16:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD4FE189AA20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 15:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D1027604E;
	Fri, 28 Feb 2025 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="muznHnCB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86F22755F5
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 14:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740754797; cv=none; b=S+FW6pAtIKXHB0/7bm/OHWbEJbK6ubU4OWJCoKQWWPFoGu8YIvT+bATy1BwXy8086gxQe227IdVyzxzlKZAg9Nig+M5mVh4Eg6SiAC40UUVNYtG2PopTtxVF+NpumvxFkY/e1yy/U+uB4il72un0+3RmKfNrvmOALPq7jbZoPW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740754797; c=relaxed/simple;
	bh=t4qbeog7E1aqUQK6n2S8QKAoBM4UxRfAdV0Upm9NGAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTngpxLo+ZO/8u1bhyzllnlS8bAqn+HXd0XW6XFls4DuUsseWWf1sLtaFesuI2slFGmyv+eYv6o1OyptFwb4kMM4ipQcElblfQ7pFOwBJOaWTBgeQS41dBrlbeKquT5XR2f3HsdbobKKemRIiOK6y08vTaUoNy6jKabxSKo1LqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=muznHnCB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-390e1084fdeso217170f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 06:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740754794; x=1741359594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQNL0DTFNdponNENZJHjJr9zvCXn2Whem0hBaRtmthU=;
        b=muznHnCBoXdxzfoosIuP7UMAJ+Byu7QIBkxVwEVkqjZj56p5U5CrM5Felc+8Eleq93
         W8QGsWJlfT/8nQuKlwrwyv+c3fF43imPHz6KFZ4wVSoEK8hFLihvAblwcBUDEw527Vst
         gp+ybmtxiwfFwE6dBDE78OdbxWvfwZcLUHNXdO0f4xzttXLl6YUQuUETapiibqqXzrC5
         SMx7glK7OWfid/qP4vUCRXCEEvStcGqivN66hlWs+K3amwOXAkS2J1c0EVEYIfsDTyMk
         eDuC9f5FNNeLRwu3ehg5Yj5DN+GiSidIZ+HvvP8FQzIUwFG1wHXVblWzXzRmzbBBQzbB
         YR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740754794; x=1741359594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQNL0DTFNdponNENZJHjJr9zvCXn2Whem0hBaRtmthU=;
        b=pSyVTPzVLQVREiSAnlaUOkc28JB38GAzydfGMOZBWT5OXssP7tuP49nATb4By7wPnl
         /2MOLDzGu8heKyhkwtv8NRmPuHfvsM1IZQZuqwgwnK5JJVnLC1l/wXm56rED4y5MFhWl
         FFS5GjyjIK9Ccw+KgtsuXkUUwdPBCrhNk34GXnpaXqjyvw4U+1Yvd5kGd+/F8qvZDJnj
         vvv7HHOhqwFpn17OKdaHFhc6xbnsadTiZd3Nt0v3eLy4KYqqH8GYquGGpfiPIeABLLXg
         Tg5U/WoxcQNT/J+X5OPqilsH2bilh+JYgzS7xD2qgeinTWtHSiSyVtmsz2iPxtyFzKT0
         CIVA==
X-Gm-Message-State: AOJu0Yy2QUS7h36xYyx7WGTZzUDfRIv8ygC1Mh9pLtbywAcTWHTjYQUj
	1GXToFYItI21gTa3jZM8LCsULQe8NvB/nbxn/8KFMK7Ua0IbX79lUQGYe9OQdGc=
X-Gm-Gg: ASbGncseYUbqnH26xq4C1rLOKzxmg92OGcBWzXisCBRp1rsLVOymMJZmogQ/GkET8OH
	wI+dsP7wSj5HyU0MNm4AfrKiMLhf/rxRisFB9T+yhUPhHtf8XF1ObZPPAKK2TUxzVyAxTriY0BS
	g740IZpUHS2bBkB0S7he6SlFt7OpsWSrudEiKb7aaP70g926ZEJErs0iB08cIDar5CcjW4sfApW
	N6tvgeOj9nl/KHB6zW9iCp1MNH3VgceyEemjh3G2ZE+0lT3fVfT5OroSYRfSPiN6l1jCcunPDH4
	DqR7ZZH7XQ3LfBihac7KVu1CcZqFs8DdlLrNd6yKYw==
X-Google-Smtp-Source: AGHT+IHaKyH9IMjK5CR/eYxW1u4ouesAuRuIcMLAbRK8LKw07p60eIEp1r1put/PmCa158oCnZFqrA==
X-Received: by 2002:a5d:64c4:0:b0:38c:5d0b:71ca with SMTP id ffacd0b85a97d-390ec778bfemr1208401f8f.0.1740754794024;
        Fri, 28 Feb 2025 06:59:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d785sm5450770f8f.83.2025.02.28.06.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:59:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 28 Feb 2025 15:59:40 +0100
Subject: [PATCH 3/4] clk: qcom: gpucc: Constify 'struct qcom_cc_desc'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-clk-qcom-const-v1-3-611ab80d45e4@linaro.org>
References: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>
In-Reply-To: <20250228-clk-qcom-const-v1-0-611ab80d45e4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1622;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=t4qbeog7E1aqUQK6n2S8QKAoBM4UxRfAdV0Upm9NGAg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnwc9h0ypmhFjJZAAVRnFOxkGet0l4nMnufkzto
 m7heEkSSGmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ8HPYQAKCRDBN2bmhouD
 1/DMEACDm8+3Ue4EgA2JR8UXp87IcqZBqVGR1/4o07ny+jSXQhFJyUAONT2lQtISto+DHScrI/l
 3WT7889gYQJLr6KqeBoSa5rb73XQ0mdPlwoeN2TORmil5v/FDq/U+Joj93+SpOueKNTZ1Jtsqt7
 iGwUrQWyw1S7aOKBgieFD0GRMKsfoWaifLedquSCuH02rWoFhShsXx2dxMqkn+P/kk0fFxSlMXd
 cafwjW+TdEnWjBPvTIn/0oh1gZ8PGRb0lEGS6lknxt/dMMZouKME5p5deEozTL73r6sRA4ynl7A
 tAKXDDkGM5Ro86bMpKUu4WpPcRYjIBFkC4/NoA8oooJtYaCusGjYrA8CVlvS4Ldu+1gZndq5naU
 yjEoKMMt97nfJ1p7g2zsNSsxs38K1QxlKdfxIexMuIa7qZOaxJj9YEw2e4tQyAXbG88yVWOQ5RT
 wVgzl98RuTHmvRXYY0Wj2+6SNx4pxWqbExMLZ9AYsl9wFbJo7yL4xb05uj013vBiSZgykDR3e79
 OZawkltbqCLamU0lYb10zlF3yj1zGUUZqk7Ngl4uR7S9vbGpt2EhrfgQMrf2y6JOiR4Iva4MOw8
 C6eo2mBGnLPaUlaVHqhfAeDZrZlgnztg20IWgN87FB3nFrilaXOFiomXRBu6mfZI5uei+Aqu5A1
 GBzX54SAjMlw/0A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

'struct qcom_cc_desc' is passed to qcom_cc_map() and
qcom_cc_really_probe() only as pointer to const, so make the memory
const for safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/gpucc-sc8280xp.c | 2 +-
 drivers/clk/qcom/gpucc-x1p42100.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc8280xp.c b/drivers/clk/qcom/gpucc-sc8280xp.c
index 913e17f101967036bf1dde7a3282c0155ae285c7..2645612f1cac514e3e796257b4e7d54742dbdd20 100644
--- a/drivers/clk/qcom/gpucc-sc8280xp.c
+++ b/drivers/clk/qcom/gpucc-sc8280xp.c
@@ -416,7 +416,7 @@ static const struct regmap_config gpu_cc_sc8280xp_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_desc gpu_cc_sc8280xp_desc = {
+static const struct qcom_cc_desc gpu_cc_sc8280xp_desc = {
 	.config = &gpu_cc_sc8280xp_regmap_config,
 	.clks = gpu_cc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sc8280xp_clocks),
diff --git a/drivers/clk/qcom/gpucc-x1p42100.c b/drivers/clk/qcom/gpucc-x1p42100.c
index dba7833396130e6f25baf078aeef466c89597976..4031d3ff560a8b18831fdb2480bc5c22d5b5d58e 100644
--- a/drivers/clk/qcom/gpucc-x1p42100.c
+++ b/drivers/clk/qcom/gpucc-x1p42100.c
@@ -523,7 +523,7 @@ static const struct regmap_config gpu_cc_x1p42100_regmap_config = {
 	.fast_io = true,
 };
 
-static struct qcom_cc_desc gpu_cc_x1p42100_desc = {
+static const struct qcom_cc_desc gpu_cc_x1p42100_desc = {
 	.config = &gpu_cc_x1p42100_regmap_config,
 	.clks = gpu_cc_x1p42100_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_x1p42100_clocks),

-- 
2.43.0


