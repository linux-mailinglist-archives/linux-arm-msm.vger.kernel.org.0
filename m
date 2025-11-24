Return-Path: <linux-arm-msm+bounces-83122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D77FC8283A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 22:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5C61F4E340B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 21:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB172F6921;
	Mon, 24 Nov 2025 21:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GflOPaMN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBF232E6A8
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 21:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764019228; cv=none; b=Ry0lddmGF6hk9RCSEeTaRnbdpGQ8zT3For7o4XpTw42fWfaaDqf0Dqll9SZRYyRRpr9zGlEFDao56zNqB5c764xLxoPF8+nFyEblRZlvBV4UW2SoMnePGA+qHyhF7TOYZvo1Ypb8GdgRO1yBsKWwo5TfJB4QR6+IiDUhmX+VOog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764019228; c=relaxed/simple;
	bh=yfpYCzYMlpDVkpaCEmrul9emFoZ7C7N5YW9SPhLPWHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFosGgrKbF7MqMyxQBKxPlrHcazyu4Dq6JLtyxCwxEEEi4MYnvD1y0ZZDooUffz2EpHE94Tak8EbKR2J7QCh/YLgJ9oq5F4/JQINt5toMO+/cor2r/EHGU+3U6Uc3iLI6jFFKhQJZcfQaXQ/NbiSgtpxzMznkG7FPSv9DjjNm2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GflOPaMN; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37a33bd356fso3269651fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 13:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764019224; x=1764624024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RM17JM17IsvfEPdE+PGl9IvMeRM1R81r5bb424J3ViY=;
        b=GflOPaMNnXXnkeaL0lpIqibWwBT/3XAcKUwYz1FX1JZu8vZOBDBgsUZm9O1grduDCo
         Upxkq1Sll/PywUA6SvK/BMXKOdcfM7K6cPEhZJZBGwu7CMzyhWnfIQUz8iKprGKtzyzo
         dStjnZnyHwPHb/U4geU7ui94T9yilKuUv+7vS6TrImEMZHuyJtL2dSOBBn77jGhcS0eK
         FLZIKuj0mLnq9xM8il3eKlBEMJ1N4t0AEH0oMo/PAKMWD0zWeoUJe40Oq+hoKcMM6PsT
         ZXik8rE/ULZfqwliTHDqH3aCWfvVcLwerVZeeqzuleOBUBsdftX6DKhrW0hns0I0DjvF
         LvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764019224; x=1764624024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RM17JM17IsvfEPdE+PGl9IvMeRM1R81r5bb424J3ViY=;
        b=ca7GzErf4dfDCyERAD3A1eM///xXfM96nv3KVDbxfHYhfkuEWJcLW2j0j9yFxIDM2A
         Cl3dsaSkfM/E7DAFj0md3jMlRj7EH96WmNvIyQdxtIn9cCiZceRYDgSArq6p9NWRvBkK
         jfhfz619Fvy1rx7/CLmem5eU/RiYXthF5w/7NibdHX5KckgICBebPJdgsprdWGgYYrOj
         kZX4j4UtdioHZPUQ6uPwjZJcQ+80yTfa3O8gBGFS18+8qCr2WwghTw5tBMOMGQu2P8h0
         ACAUKABJyazvG3nPZ3GKXTG0LNibWYQW/KO4VqrKDsHPl4yULCzZobu3uARVMK6gPyOS
         A+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVWeQiRuFpPx0KPTlCoU4MPgIJD6u7eWbmYoTjZoJ2m9vlmd7gEssV/pIcG79m59GHf19f0S3TV0gDaqVv7@vger.kernel.org
X-Gm-Message-State: AOJu0YzF0i0tC9mSS6YIm0mP7BVZwp6sDnIOeIJAO2pX1yHkflDr2CoD
	TPXxFZyjGw0Wzu0DiCIpKyr5lFSGdkwTShym6N2csbYkExDMmT5x+D1SYVOHHBRSilw=
X-Gm-Gg: ASbGncuA55ycEvMxYCwI8Jw7LEumt0GEx3DkH0FuPr65+1PYrUUWoxD+2pt993q+5VO
	UAgKPNkrY24ksOVAdr7SwghH9P3VbSB/OJPze/HsHkRCIXCCsFk5NsC55lPNyKSkKsfsIBl0dQU
	sE+LlozmEEEx/JwY7RoOAgm/hqXVRuEdfpy+Y4xY7eaq49hlF67MXQdhEqkdROQdXyLnM8piYeq
	gBdzJ567MseJY5WOL3DOxN+nuJgqhE/QaYbLYyj7pkL+ZQjGccrJrn23kdBjsyezpqs8preUYsX
	WrFKQuuCP432aTcuEtawiADSh676oicrMNvOHg0YXLZu0bibTayenBKiwE2WNAi5YoocLq+lltO
	Tckieot7EKS0WHK0SMZqfI6qmGtYSc/a/dWc/bTgTfni2/VfXKUsOqr+woG8HaVAgKux7TtLOA9
	/MeYRU/r1D8+7HiysFLjNkZFu3i2chDPa6mTUQAw29/VL5bofInmBRLA==
X-Google-Smtp-Source: AGHT+IHCZbm3Y6KtIoBh+AUucs+OuYTytTubjvQ+jSXNmcAV6v+qUXlEhTD84/pRoifIzHCFzKx4gw==
X-Received: by 2002:a05:651c:3053:b0:37a:9558:5bdd with SMTP id 38308e7fff4ca-37cdc367f8fmr16026271fa.3.1764019224427;
        Mon, 24 Nov 2025 13:20:24 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6b59744sm32905771fa.11.2025.11.24.13.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 13:20:24 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: gcc-sm8550: Use floor ops for SDCC RCGs
Date: Mon, 24 Nov 2025 23:20:11 +0200
Message-ID: <20251124212012.3660189-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
References: <20251124212012.3660189-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In line with commit a27ac3806b0a ("clk: qcom: gcc-sm8450: Use floor ops
for SDCC RCGs") done to fix issues with overclocked SD cards on SM8450
powered boards set floor clock operations for SDCC RCGs on SM8550.

This change fixes initialization of some SD cards, where the problem
is manifested by the SDHC driver:

    mmc0: Card appears overclocked; req 50000000 Hz, actual 100000000 Hz
    mmc0: error -110 whilst initialising SD card

Fixes: 955f2ea3b9e9 ("clk: qcom: Add GCC driver for SM8550")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/gcc-sm8550.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 862a9bf73bcb..36a5b7de5b55 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -1025,7 +1025,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 		.parent_data = gcc_parent_data_9,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
@@ -1048,7 +1048,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_shared_floor_ops,
 	},
 };
 
-- 
2.49.0


