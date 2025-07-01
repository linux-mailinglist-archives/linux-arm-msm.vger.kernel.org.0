Return-Path: <linux-arm-msm+bounces-63275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1B1AF01D3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 19:29:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 888727AAF9B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 17:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73F3283137;
	Tue,  1 Jul 2025 17:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="trNl/sC6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE97280A5F
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 17:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390942; cv=none; b=Qz5K5T+kYsLba7l1BhcjSpEHZYrSDGTzDyGYcWoFFlIVZivqPkKs/OR+vdYJYkOFry1YJJjZuc7lQGOHdNlsdbQ3yISTIvLJmspqyG5KDb8CaG94Jsd9EfCEoN7WevGRZXp4SnCJ29JZEoWwHTyuPst9NUoNo5jzhH3MURFVnlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390942; c=relaxed/simple;
	bh=uTC4kzf1I6Jz+bT8kOF3LyapejFqA2G+/FXP/SQ4Ej8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G8sF18osp9EcTqCe/rbETczenDytgSpfhJ6USN+Q5NZWAx6AxOeb43nr8yO4PHrYmjrPXmFyWm1CK1G0Xmp38YiMWbwcmVddrDTkzCQYDdcCDAilGpjM0wJKwfyr8jT/1fD1hkIMvz9ddW1K+mnsBl0yFCjI5gtxIK7YGg2efT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=trNl/sC6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso23235775e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 10:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751390939; x=1751995739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PQE74E3+f+H3yVXqbUucK8HKDi4aSq8B7tA2u++UxY=;
        b=trNl/sC6PXa2bpFq8u5PC5IhChKNlwHTmFtLeWExI1a4Vj+IzWoOtYlKZTwgVWEh3E
         cK3W2msfgkhRI3FtQvrMT6/OgIvejZT7mj1VW3eidlcIJr3ugOIaO146jHmb6SnnrcY8
         4wwyQ91GwlPZuAsuJ+gO2wCFwgoQdOJAWy9LRd2UcuUrMbX2Whevbef/qInFiZaty50q
         /UzyYoMptzH9THMXqlKs785+H6IMYlV1KiVB0LRA6iGIWrv7LXI2Y9qTh9g9FTqbd0pm
         8CJUm/jbW8OMuqxduQyIlGhOY8QOleP8h6rGuSrxrhugEifSuCIO5hFIBZ9NJecV3cFg
         1NVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751390939; x=1751995739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PQE74E3+f+H3yVXqbUucK8HKDi4aSq8B7tA2u++UxY=;
        b=fhzFgNrGsyJTa9rQpiwysMMU13X5OfIZPio5dCmMM9eGvXYpsXcDms4hfHxjQKitEJ
         qv4Q7QU0F4iPyVPRW8TTreSvbsn6QH7mSplP1FzUgJ9wQy9HkF5Z+ziyysQ9H857svBA
         nD9hv/So0rV5Q296nhUmSbF0kgoY+deI5D2Mje9K0TjYhdVGQ4SX3LQTKUHL3neBeRBW
         Sjxug3ZjykIjHOb/QrMjP1WiyJUUoxxl3nUsXt6dkPdcyzTGs9fGfhLWZvsJOrc8FLc1
         X76Uk0MCwluFsy6R3eg9araSo99ZHJ1R3FP+YZXckypGYrpq2WmIP6wy721sga+h5k96
         KQBw==
X-Forwarded-Encrypted: i=1; AJvYcCWOx1xIqudJ2z8xa5xK1LO4dEaH8ruQvUX8jdQaOdjWdE1QRIYUQSGHARqUn+4Z4csuJjVUTBfGV3IqvM5o@vger.kernel.org
X-Gm-Message-State: AOJu0YwQvk4Ahv30o7T5MJC8s0KOTTdbh6U+UmWE7wBFCcnC42TWSZa6
	AHiR8MTwvMAXw1WjONxeYnLtf60kdU/Z9PevGrmBuTu2RZ4g50Nkt08sHBc4jkTtSsg=
X-Gm-Gg: ASbGnctGePym4UmxGermdeHFBqkQVxxXrTqhqgHoOe2dr7eUmeIpL7dRe1ZI8vbh7tW
	87tDZQQfWAZxkslEa+97/3XjWn4Vajxv0FdXSs9YopOHJkLUHE/ZY8uDFK799rItxEKSnYMInbY
	AiWkA4jpzEczgJE6N1Bw/Uxj3jynNpzT21cKY4JgTlrqLcsLk8FpgejrhQNqMVoo3eK35qb542t
	ghZtxczha1P2HRv+KwMh53D9L1FB5+y63tqQwU5qJZGsitQKRXoQOA0Hgz3gX81l2pbJ4OE7QX+
	Gxy0QOegSex1d5m0m8k1XAHd+wpD7Lhp8EhjDts953rp2kK/P9TJg+1WpjH73C1Px3YM8NHK+5D
	1ew==
X-Google-Smtp-Source: AGHT+IGZP4VK3OGEwU0CEzKIJC5X6rK51GL6b45SeBsta0YIlXh3TGxScJL99EYRJd42enR5wJE46Q==
X-Received: by 2002:a05:600c:3b9a:b0:450:cea0:1781 with SMTP id 5b1f17b1804b1-45395338d3bmr182966045e9.16.1751390939051;
        Tue, 01 Jul 2025 10:28:59 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:1425:eda1:87ab:f850])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b1b9sm198716175e9.11.2025.07.01.10.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 10:28:58 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 01 Jul 2025 19:28:37 +0200
Subject: [PATCH 5/6] clk: qcom: gcc-x1e80100: Add missing video resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-videocc-v1-5-785d393be502@linaro.org>
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Add the missing video resets that are needed for the iris video codec.
Adapted from gcc-sm8550.c (with adjusted addresses).

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-x1e80100.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 3e44757e25d3245e455918e9474c978c8dacaa5e..301fc9fc32d8e6e1ddf59c1d3350d84f6c06e4b6 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -6674,6 +6674,8 @@ static const struct qcom_reset_map gcc_x1e80100_resets[] = {
 	[GCC_USB_1_PHY_BCR] = { 0x2a020 },
 	[GCC_USB_2_PHY_BCR] = { 0xa3020 },
 	[GCC_VIDEO_BCR] = { 0x32000 },
+	[GCC_VIDEO_AXI0_CLK_ARES] = { .reg = 0x32018, .bit = 2, .udelay = 1000 },
+	[GCC_VIDEO_AXI1_CLK_ARES] = { .reg = 0x32024, .bit = 2, .udelay = 1000 },
 };
 
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {

-- 
2.49.0


