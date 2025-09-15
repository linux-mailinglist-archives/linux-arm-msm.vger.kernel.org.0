Return-Path: <linux-arm-msm+bounces-73530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAB0B57583
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 199807AA891
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 10:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88CCF2FB0B5;
	Mon, 15 Sep 2025 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JQUFde59"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A06E2F99B0
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 10:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757930791; cv=none; b=G9SuUaPTk/jlaMapcqHs7HUIV89c3UYbXMQiXJ5if37pwutp0uvyI1Lvzsy1fxvh6Gf/MLVnfGk7SKXkujDRC+BK+TwkZRyUhmnPteN19rzbXfv89EWRLyQFidU2x5YFiLLVmcgMM3dy8+HYEHX9C38cnG+o40Y+KuN3ht1My9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757930791; c=relaxed/simple;
	bh=JGji80klp66rQ1832BdwwUkhaAHryTM7+UK4ivqtNEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iXHXsFEXC6TX6uMkKnnuXFsPU2L4CySGt/XbT/9+UG2TLyDAohyTsztFTmk4cba3Tt92qL2SFrbbWTOHgn6Mbz6j60+mdiKuQxE82rQkjqiIc3dy1C556c3gV6IC1DncCVr65+EqPNVTa1iFyo84GFIbCNmoD6H6d6yknEHOQ4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JQUFde59; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-45f29d2357aso9156345e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 03:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757930788; x=1758535588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4Cu4jlvHGZG1vrYyhNaU7JIiE6KW6coiFWmDAcYM9U=;
        b=JQUFde59EFvsCQv44yM8jP7K/oIjndF9OWalr1ntEfx+Kb/L/u36AResdJSS8NQEYy
         9XQp8nm5RC0DZVMzSHzRQBZ0L7SAM1dlJxUntVAFbpSFqKVhMZN79m9QN8vraD9aGcFD
         IwGg1S6aCUgL/KRiJjZ+WjF4IoEv2Zgi4Bym4pN98NT2ae9EHG4ibAwfUxo8c4OgH2zX
         m8yedkQg+gKam5owHdJ+QejhcV+fe7VdP7ZpPjdPIZTt6OLMwLN02C2XeLVkDoTgYyjL
         n8GKkQEZuzyr0R0snpe5vYVraSsqv8FvBXloRFqyiYG7F8NFOVg0oR1jG0vPWmrIx3nn
         DUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757930788; x=1758535588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n4Cu4jlvHGZG1vrYyhNaU7JIiE6KW6coiFWmDAcYM9U=;
        b=SaS8EqXD0OdV7uogbHEfrLXwFtTwxRvsQ2vGiaHTLRYRRr/HXATll6bPqWTn6ixF8D
         iWW+YraoymChbwsWUt6T8XYmuIPHB2+oTweSx1+OxhJSViCu6E7TpDd9IKTAk0LdQSgc
         YXOTCI1bFEBPqJ6DRE29G5++hrRjszr9SRjLO5F3wq7xCLKbwInMxWDj1ZXwdIQnadFy
         0Tk1kk0018nAx2ZvnGAylm6hk5s6SJ3gfAZgJLQjsjqfqsjNRIdY9EHQa7aRlLeLyJPe
         pNiozsTqmsTPm/TaQyxqbgA77yz3avevqAEtrLJHoLkD6ayvQSS70QMZu7gkMl9i4mAy
         q8Uw==
X-Forwarded-Encrypted: i=1; AJvYcCXtObfyWiCdKiHz1CfRDyjeFSTeNqFRI6xBp6O2bEXzOXYYz5N1p2K4Rkhyx05r5ouk2FkdPIqTmve2/7hM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1fvQ7RXDr9hb84/RSn/CljLGvVGnj+UpD2jD7ZGCwgvQ0vV5f
	BvjmZyDqBnLJtEEGQ8J8NbLiROq9Sy1fq4l3t6n2fKLWqKkian+QyslKHVX+iF8VDmg=
X-Gm-Gg: ASbGncuJ1tiD6bURqpozrXGgtLV5ZuQrrcpFibMXnzG2zclbBvy4sXvQjJIGp55Vsal
	NyAwyKX66yY3xkyEMXXtloYOjCaD+xQt741q9Id5PJdsbZ7dZ5AKfyJPL5NYjYzYL04II9sh7Eu
	9bMIwBf+S9gMATmV9cZNKUKYn2p+xnx/rFPZULTYasRefiGjJqiLxde+WoWVUtbSA1cFq1PMkld
	Ot+Z69881Y7wDFjaGtkL3tSd1B+EDWeVc5fUB2sWPje6zWe/PTBe8wnQC+5HzVlkB3+rwtn7dLL
	y6nFqXoORTOrmqqaj2RcQXt1vCQfpOO+6hTsu3e8v7ZDuueibRWIjInFTkTg5OuzCijHFxiCYXj
	hlJ0XGMSW9d/nOOLIuIvkTqAkhWEiFymJNpA=
X-Google-Smtp-Source: AGHT+IFkAq8ub1X/dEEk4zZSV1ran2kYTxb2Dm/pCgwgP6bhwW+o2v6NIDlWFlb++BMsIuWvSvu+ug==
X-Received: by 2002:adf:a1ce:0:b0:3e9:4fe4:2632 with SMTP id ffacd0b85a97d-3e94fe45e49mr3763503f8f.46.1757930787745;
        Mon, 15 Sep 2025 03:06:27 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:41:eee1:5042:e713:2e9a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd4cdsm17209127f8f.37.2025.09.15.03.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:06:27 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 15 Sep 2025 12:06:12 +0200
Subject: [PATCH v2 1/9] arm64: dts: qcom: sm8550/sm8650: Fix typo in IRIS
 comment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-x1e-iris-dt-v2-1-1f928de08fd4@linaro.org>
References: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
In-Reply-To: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Anthony Ruhier <aruhier@mailbox.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>
X-Mailer: b4 0.14.2

It should be "enable on boards", not "enable in boards".

Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
Closes: https://lore.kernel.org/r/DCQ8G73ISXHC.3V03MOGB6NDZE@linaro.org/
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 2df6ba05e0cddaebf3d35a4b4b8e5cbb9048dfb1..ec67efd64b78673352c4c6e3a4e7e504d4525b46 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3262,7 +3262,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 
 			/*
 			 * IRIS firmware is signed by vendors, only
-			 * enable in boards where the proper signed firmware
+			 * enable on boards where the proper signed firmware
 			 * is available.
 			 */
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 367f448a743a306993b40f6c6b8a23a816744afb..e7582a19184b48de66d572d6e98fbf2f36a8c17f 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5186,7 +5186,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 
 			/*
 			 * IRIS firmware is signed by vendors, only
-			 * enable in boards where the proper signed firmware
+			 * enable on boards where the proper signed firmware
 			 * is available.
 			 */
 			status = "disabled";

-- 
2.50.1


