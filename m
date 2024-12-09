Return-Path: <linux-arm-msm+bounces-41064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FE39E93CA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 13:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EC4D165C33
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCBA2248BD;
	Mon,  9 Dec 2024 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TSkfFdnj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9EA223704
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733747059; cv=none; b=Oncj9UTbNhryG03ZUIMwmMxxlQ8BzKayFSLquxWymdL53l6W/cj+tn5sUAgfyYA6o1u6ZE1oIqiOchQyVvtrLW3AvgF2sSiQ/15V8wNWbcg1vqE7w1PNwbk/9ZDvbWSNeUcYZPLEGp1aUxJEOhH4RtcRV8B3Qvit9i2tvdAgAQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733747059; c=relaxed/simple;
	bh=rkMjCrwS1+wByjVOGZBOyBmwHcPRefAACRVZAjVFMrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KxgURKYKKwl4ztEUEgLY3gxEf/x+aK+pU0ODjFWeWYeY+wP3sM45fhQ76t5rPBF4IF7uakbWeQlmJKEdiJ7toGfMKb3bbEQ91pbFDN4wO+M7bDPs0uQNf+kWt45/nAhrlU+wDIqZgnr2Ejh1lbmROhMUaVT7crnuM8k39R3Pw/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TSkfFdnj; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa67ceb4e31so27183066b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 04:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733747055; x=1734351855; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VS86PQrU3aNTPQz7X0NdV1vS6PaGx8hn6CNMCEHmEw=;
        b=TSkfFdnj85CTjX7fstayGkA+yd08BtcXBT/3toiUjY3nBkkYZBXSHhN3uk3kBVpPMc
         vAexlKp7C2eSDL63Hz7EXl3hZSBshsIx/mqlkgt8AR2Yh2U1JYzuWX4u2GKtPjE/ujVs
         RAykGzOOb37O2A/EDHjXwX7tWS++CrZI5fNBDrTMVIl55WgvPENwXKfpEq0wKsYToyBG
         uDkaT0PcH/XRXTTBZhD/RgZzA26FxUcOKXXR/wbkCI8JHxMO3WFFKdnTAIOWpjpKiy02
         7dhz+75DkHynof/09jlwwFvPdxmM9C33wIwuWayf3bHuZUsMy2WenQKMXRmVSLxNklM5
         W4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747055; x=1734351855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VS86PQrU3aNTPQz7X0NdV1vS6PaGx8hn6CNMCEHmEw=;
        b=thgPxHuekXgXxsyp/gPvGR2RfVzDecsZ5S/bMmxWVPcOV3LitDbj4aATCe+B9GNc+Q
         zUW9EdvaVZQ7wCYIi5/fiQDpXNrgBHge3yXWgY6UkPM11L1bJjEnztn29D4v+Hm1r1Nx
         Wul+ik06Jotpjgoc1SNgnPUnwxg0Tbdz5zqSPVOOjSKmvpNqIDJ74U2o4FtSudZnmvty
         WQcfUhvkCFk7zXKSuL4j7R5O9OpggMEnKNrSn+K1xfWAV9GLJy1tMLq3/P6Kxh/PtbP3
         PYBA9M9Oup61eBgeAzeoifXeoY25iQPabtGY/QxxJ1HluhUGgFE4yXhtJPSWT57LG4nz
         QMSQ==
X-Gm-Message-State: AOJu0YwXIBH5GXbzUDqQi3iCjDxlGMLBiUQVHQTU37SR9A2nTLysrkfq
	++m4a1fuc33BTI3/dTj8cmzId5+rGOnYCjaURQ9DByaQhSgvY9ZrYxvCT1uSGi8=
X-Gm-Gg: ASbGncuwdgYg9A42BtwCSus2vDejh5Jh3ECtUcGWB/vHDdG+6qKwbeG01i4eiir0UVw
	MqvvzM6f761c5UF3R9ZlnC653n11Patbv/DN5uXYtnQ9ytGEFcOjzcYOKenawsgnup+bXZ0xd7x
	i8gPyVd0BzyOdYmACRYarU+VKJyxi5SVcfClUhfyx9ScTXIRk0TTlLX8Jz4yTCCt2CDSEEh3AQl
	1qyafbfTpy1NvPlNYX7E164LVB5JRqnXjUPJUoSg6yqS/c0LYS07mLXQG8YYE0qDQ==
X-Google-Smtp-Source: AGHT+IHMa1lVKER8h4Ap0+h8iEA/ASsQQiOkTcbxptlpeVP7AhBWBqczT0R0GsKDETc4Mf1TgulAPw==
X-Received: by 2002:a17:907:874a:b0:aa5:3e81:5aa2 with SMTP id a640c23a62f3a-aa639feb836mr488047766b.4.1733747054666;
        Mon, 09 Dec 2024 04:24:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa66b96a249sm309925866b.159.2024.12.09.04.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 04:24:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Dec 2024 13:24:05 +0100
Subject: [PATCH RESEND 2/3] clk: qcom: smd-rpm: simplify locking with
 guard()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241209-cleanup-h-guard-clk-qcom-v1-2-b1077540230c@linaro.org>
References: <20241209-cleanup-h-guard-clk-qcom-v1-0-b1077540230c@linaro.org>
In-Reply-To: <20241209-cleanup-h-guard-clk-qcom-v1-0-b1077540230c@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2526;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rkMjCrwS1+wByjVOGZBOyBmwHcPRefAACRVZAjVFMrg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnVuFpiHvV0uVRDjZL66G52Y9rZuBpcDh97yVqm
 7VCNFzDmjqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ1bhaQAKCRDBN2bmhouD
 1z6bEACDJRMV3tKG8OzJzEzGyfz0lOZpMOl3jN/tTBoHX1ttuGWTy4ndNdqgrS10DEBZX6AukHR
 2RkvqWkTyKKdNzNQuzOUVZceVDzp6+14dJh8OmLv9rh3T1CybD01NWxDyX9E7dHwpzdzjKuOzik
 ysttIokEqGs7IBZ/l/nokgkJYYEd29LH5YirY5+WRuNafy79CfiPlh6J+BUxTMaw+qQuWFmoD4t
 PQFyq2OQiBrgTYYxqsxrT4JmK2wXe6+MD2E7A6hE6VJdr1O23cjjMVX3b6+Y0+zZbP6h7VO6cUc
 VyQzxXWG70zOEUW0ncp8VxGy836HsZoZT6XQuxBfOW+3dq2jEzkzDA3JMmNc/gFNaqb2eOHd0ll
 P6LbKNLNdJScsdo+7cCv6RlcXMffERSL6CNnOY62KiEfAIJyXrxcvOL6RvGd7qZA6Dom2kJeNAq
 6M3qnKP7ZQsFDIENjvEUPMTO95+zN6Ql5fL8pkAPLtsOESS6QvIBV7qnYM+dyTwGeTMJzqk9LZ6
 g/725GdkH60DSX36J3YUYaUjUqos7CJFgBuENmayd8k+e+t3MOOzpeh9pEF0K++9Z8PV1kbpVOP
 LEy2KoplchfXrzS10mQIx+q5O2+boaYrOiH4dh5kiLIoLpYZv1npQMxIclDZpW2qHr0xOE8sctQ
 WzPlTI+EO1P8OkA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 45c5255bcd11bae69b83138ba1d5e52a8a3f3be8..b8cd9f7301194a539d5fb18f974a5600496a1032 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2014, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/export.h>
@@ -309,10 +310,10 @@ static void clk_smd_rpm_unprepare(struct clk_hw *hw)
 	unsigned long active_rate, sleep_rate;
 	int ret;
 
-	mutex_lock(&rpm_smd_clk_lock);
+	guard(mutex)(&rpm_smd_clk_lock);
 
 	if (!r->rate)
-		goto out;
+		return;
 
 	/* Take peer clock's rate into account only if it's enabled. */
 	if (peer->enabled)
@@ -322,17 +323,14 @@ static void clk_smd_rpm_unprepare(struct clk_hw *hw)
 	active_rate = r->branch ? !!peer_rate : peer_rate;
 	ret = clk_smd_rpm_set_rate_active(r, active_rate);
 	if (ret)
-		goto out;
+		return;
 
 	sleep_rate = r->branch ? !!peer_sleep_rate : peer_sleep_rate;
 	ret = clk_smd_rpm_set_rate_sleep(r, sleep_rate);
 	if (ret)
-		goto out;
+		return;
 
 	r->enabled = false;
-
-out:
-	mutex_unlock(&rpm_smd_clk_lock);
 }
 
 static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -345,10 +343,10 @@ static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long peer_rate = 0, peer_sleep_rate = 0;
 	int ret = 0;
 
-	mutex_lock(&rpm_smd_clk_lock);
+	guard(mutex)(&rpm_smd_clk_lock);
 
 	if (!r->enabled)
-		goto out;
+		return 0;
 
 	to_active_sleep(r, rate, &this_rate, &this_sleep_rate);
 
@@ -360,19 +358,16 @@ static int clk_smd_rpm_set_rate(struct clk_hw *hw, unsigned long rate,
 	active_rate = max(this_rate, peer_rate);
 	ret = clk_smd_rpm_set_rate_active(r, active_rate);
 	if (ret)
-		goto out;
+		return ret;
 
 	sleep_rate = max(this_sleep_rate, peer_sleep_rate);
 	ret = clk_smd_rpm_set_rate_sleep(r, sleep_rate);
 	if (ret)
-		goto out;
+		return ret;
 
 	r->rate = rate;
 
-out:
-	mutex_unlock(&rpm_smd_clk_lock);
-
-	return ret;
+	return 0;
 }
 
 static long clk_smd_rpm_round_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.43.0


