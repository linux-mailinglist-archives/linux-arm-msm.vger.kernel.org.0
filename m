Return-Path: <linux-arm-msm+bounces-46522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8BAA220D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 16:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE4571881437
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 15:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DCB1DE2B1;
	Wed, 29 Jan 2025 15:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJNTIU9t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F0733997
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738165527; cv=none; b=H4GJL9Uh/ihD1HxhuPbeAhsoLxkUa/d4HYARdVTMVKZx3Ivt9qIXjHk7miT1D/VvwzIr9Oht3Pe8b5bwklH47e+mZLXvtMrHS6Tm799OTafqNjd+QZ7m1Vxc0hRvlYqaSELDL9LFwMLPoEhC6j7lLHJ6ij5MM5pSZodyJDUU4BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738165527; c=relaxed/simple;
	bh=BA64t5SYSYkOLxkZWrGOQjE+0SMxTI7sjqP+S2gmT/g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=HcLfMdaw1zGt1o9Mc5XxRM3n3jrtlkWLcom8JYv5ssOrGywHEvyRG1ZynLth3dpbt5GyG/UFZujf0Anwq/7IcxYTgjhnrGLyHfbZUL4X6H1XT+SQ+FiYe1QE/b7NDliYN6Bz3uQdyRMThqeUcSofVC3vMJlehX6R7c45q4M9UF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fJNTIU9t; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361e82e3c3so10716995e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 07:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738165524; x=1738770324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1xwoQGzhrBwYofIiNp2Mcwgnk/Tu/TxGj4txKCeU0uI=;
        b=fJNTIU9tqxmyBQJH+mPdw7G6dm62vB3MFhPEHprnARB1NZiMVPuHU0SMcyOkp5+sfw
         K+hwqlHXD9y+J6G89Jd9FU457KVx2PPHOxpLrkLt0fgJ1IdGwqKgg26Wua6cvrMJYD6x
         NqLckVTIr+FojmhezjrorrL0J795IZ+TPYO8JypnZWycBdhCOziZo+y9Vzwfjv78WmQN
         xqtg0HugT29BWA5GKqZAHVMaXnTWkkBOeaS6eohDvr2Kmb+wv8F9Z13QQp72MlBh663w
         jPCuwweHSNfIj+7T9osw7SIoX70pbbLPgp+UMSc7u7pmjoQ3Hzml0Bq6GGlt/rchzkFZ
         j3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738165524; x=1738770324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xwoQGzhrBwYofIiNp2Mcwgnk/Tu/TxGj4txKCeU0uI=;
        b=xQd4ljSe3VbLGqpwXrUpEX5fyS6RhM6mlBU5kPdGWXKzEeQEntXyB1tFStKKSbvWI+
         v8yzB/mQdPwxBxb+e5fuX0xlqaGbW4WH9hyLLs8yWTGFkatypgT2fh8M4sqrmJ+2x22g
         GLlTtsx+0bDrbRVsHFCKv/6vIMuTv3mi7IwA5ldJImExYeAEOKU2+gfaSeTSKSSpcwru
         TP6PmaHeu4OwolZrBQHEnzloESwkDROtd00DaqZCOyXIXV2FwhnfKv+pz3A6BIQ1y9om
         kgyezTZjyNBv3V9aW7zcp4kSkBZDKr+hbKqvgjG2rIa5SbJy4ir1y7UXJPyGYiTg9iOY
         xWYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlMX4wsviXwu+h+7PDWVr2Bk1ZiHBQBvnL0oqz/TuSBnyqBQr11ZdEodyzPEOcSaD0X8LOuXMfyqcETeV8@vger.kernel.org
X-Gm-Message-State: AOJu0YxynHAu2KRVBVEHMYVA86RnYTteCOX9HCO8L0sllyZm8+ktWZ/V
	PZ95z97MrKo2yByQ3RIXQBG5XBxPinjzLIE/mNYr2hlUiXlQC2cbWt02EhXAE0s=
X-Gm-Gg: ASbGncu7PA50jiZIKYDHkqaD3k7uw6to3+hOy7c0rPIKbTeTkRasHCkCCDsyMiIY2/0
	G2v0oZhcXEE3Z8JoKEHAmDAp3QxmAU6RDIbpkD/Qo6ikhAIQSKm2jYKmct+aJu/z7KzkkL0oUu2
	1uA78UMfNZVXVnjMQVlJu1kRRDawsJonWvaRPyOqSw4qW1gKZko1MhS0M8Ate2dUG104F1Pbk6U
	M7BOAFYMJXdfyM2oTv1PeHLRVXM9NcdC07PZ0yorcch1d8JGDiQzRHQ2GpsNccmMv4NSq4Fyy6J
	1CrXvxZFiIUY4sPhjwgpAyP0ezjdys6zm/jYvzY=
X-Google-Smtp-Source: AGHT+IEk6tZpuUhcKuvgEnJpRzTURe8077PPeQePy3IFm2+dKtAmJ5+B9AOZVnD3MmFn3EOLwAt/aA==
X-Received: by 2002:a05:6000:2a7:b0:38a:69a9:af95 with SMTP id ffacd0b85a97d-38c51b5eef7mr1334149f8f.7.1738165523755;
        Wed, 29 Jan 2025 07:45:23 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb040sm17528115f8f.67.2025.01.29.07.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:45:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: dispcc-sm8750: Drop incorrect CLK_SET_RATE_PARENT on byte intf parent
Date: Wed, 29 Jan 2025 16:45:19 +0100
Message-ID: <20250129154519.209791-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parent of disp_cc_mdss_byte0_intf_clk clock should not propagate up
the rates, because this messes up entire clock hierarchy when setting
clock rates in MSM DSI driver.

The dsi_link_clk_set_rate_6g() first sets entire clock hierarchy rates
via dev_pm_opp_set_rate() on byte clock and then sets individual clock
rates, like pixel and byte_intf clocks, to proper frequencies.  Having
CLK_SET_RATE_PARENT caused that entire tree was re-calced and the byte
clock received halved frequency.  Drop CLK_SET_RATE_PARENT to fix this
and align with SM8550 and SM8650.

Fixes: f1080d8dab0f ("clk: qcom: dispcc-sm8750: Add SM8750 Display clock controller")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fix for v6.14-rcX.
---
 drivers/clk/qcom/dispcc-sm8750.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
index 0358dff91da5..e9bca179998b 100644
--- a/drivers/clk/qcom/dispcc-sm8750.c
+++ b/drivers/clk/qcom/dispcc-sm8750.c
@@ -827,7 +827,6 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 			&disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
@@ -842,7 +841,6 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
 			&disp_cc_mdss_byte1_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_regmap_div_ops,
 	},
 };
-- 
2.43.0


