Return-Path: <linux-arm-msm+bounces-49732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D123FA484A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 17:20:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B18CD16D2BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 16:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08A526E17D;
	Thu, 27 Feb 2025 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tbd0k4LR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEC026E151
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740672279; cv=none; b=EGSL9FAPzuuQuW7+M5LOyjpBj4QqPBRh9o43bM0epVLw/NLZFtfAX7WzUvcXsGJ0se8kCRDjHXxCQtPj1ChZBG845FLbfDEFECC/qExZcitYoaL1CoMQ+XSk+H60lg2YMWeRJkQgN63b8jc+mf4BGrDGSiYl1RIEWADfJZNu/jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740672279; c=relaxed/simple;
	bh=5crfA43Wc1eshy40EYAu5JOOOnUyb0U245+kFC1E5l0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qDN89eatdc+YIbeLgHQ4akjdRzssMNd0RIguEZZWHD8Aapfr6Qrw1EPGk7577Zco4Uu3jAHT4jcIqik8J0ePUUjXniAQPMR1i07eQ/by7Fs9x1zxHWSwP8VjIbfPQXJAJh5PXfeB1cNeEbm/rHXG/RB6MVus7kzlo1R/1KvUGXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tbd0k4LR; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4397dff185fso10403575e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 08:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740672276; x=1741277076; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooJ/hYw0wA6kIng2NE6ZvceF9VdgEvsQvsmSqmonZcA=;
        b=Tbd0k4LRJgj744ZGJpk5f5ms3DptBEEmzAFB5i1SiKcHP1u7d1AWOKKNYMoG/F88YA
         8g+BRlaQGX9ddH6oGoMgEl0pg+cUQCbSDYZ5aH/VdbK9IQCTxj0crRWDvOIlRp7KChAG
         ZPc3+GcHscTsv9upokNBvDPfquAtgvAVTS1LphxeFStFo2h/IvRTkzMFF7oJx8GO/dRD
         i1Dj98knflc7cO2YtepG8FEm/+vn00cUSYkcad93bc4FNRLz1VNE69UZ7TWWTgN51RTi
         0ln/fedKvGVGgKDFolmi0eyPcZM+0yLgEK1RjmfYMF9IrB7GTSDqf/WSJAQ9zV7BzAXd
         /BhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740672276; x=1741277076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ooJ/hYw0wA6kIng2NE6ZvceF9VdgEvsQvsmSqmonZcA=;
        b=sNzCzuzP6IU2eVrLrDf7I5tEvQxsWvqgLWEc006LaD+T6FXzv6Vr8YaktpSXSNUh22
         IEdHr0H3D0TgY/DMwRmKAReKDdmAgmbJmvyNxA+oejhz8vDurJcyHOqkhkbDDTzv/ZuH
         9VkOtABQM39CWkhtSRxJoLP+78NaacMKugjJI4d3MsiebhGDg/tqQc/FKRBxUUqgh4sB
         E9CAyAl46J15LB3gbQxFGz77kKfUzGLvjM4SVQG5KE1ILgrbKk6cC6wMDYAgAHRW2hiB
         2yyBDA3vS+NYWk8A7glM7/of97Zeyy+ofMi/LO5Mho9fyyz/YzHcAN3LpNGn5cCd2RPu
         YBiQ==
X-Gm-Message-State: AOJu0Yy8zY9zPtlZnAouBtcfOmJAwKbx6redHCPahD0ipkVAv3kzP+g3
	ePRlKL+mcZxG+QAS8n0DRa4O5EyjsLDSoOGJ1PybdNy2zwXLW6Ct5KKwomJPxppihqQkjm25JHA
	w
X-Gm-Gg: ASbGncu6ABaZ6ZftlgUEEe4q3FOWaL+vOAkIY7gxZRc4Ft6Oxp/u1mxRwlpdSPjLSLa
	Gv+N4okwSWHLKT0b3m2OWkb6d1KWdVuVTLVkKyQu1MEbMkRVvNvSbkIerMTmjSy2AYMVviYZ4y9
	ttI7C496p+tD6XUSVjfQT4eH05s6316F66pIIf+1/7aOB6E2bIqQdTWvMhkLNAeSa3R6wG9I2En
	KsbkIARVnTPQwuL0CVpYxE0W2WDao7n/aHGT7VCVjPHG5Yxgg263YE/OQmPwtI0+2E28v7Bbc/g
	8GWrUvsbnKkFaJhCoTkkcDb/KS8g6C68TuWEcpjeSrvGvpY=
X-Google-Smtp-Source: AGHT+IH8doeNIsGIgaprszLsrMy6PYYlH+q9gCqBBM6/GXlFjz+BmBNHDR2riaZQFUTqN2YaKlHIbw==
X-Received: by 2002:a05:600c:19d4:b0:439:34dd:c3cc with SMTP id 5b1f17b1804b1-43ab90169c6mr63727665e9.22.1740672272193;
        Thu, 27 Feb 2025 08:04:32 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5393e5sm58811225e9.20.2025.02.27.08.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 08:04:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 27 Feb 2025 17:04:28 +0100
Subject: [PATCH v3 1/3] arm64: dts: qcom: sm8650: fix PMU interrupt flag
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-topic-sm8650-pmu-ppi-partition-v3-1-0f6feeefe50f@linaro.org>
References: <20250227-topic-sm8650-pmu-ppi-partition-v3-0-0f6feeefe50f@linaro.org>
In-Reply-To: <20250227-topic-sm8650-pmu-ppi-partition-v3-0-0f6feeefe50f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=5crfA43Wc1eshy40EYAu5JOOOnUyb0U245+kFC1E5l0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnwI0NL3w2Sov2sZjc6MlbPHSm2hC+bhw4CDpnoVdx
 9/maLN6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8CNDQAKCRB33NvayMhJ0e8cEA
 CI0B3gu/m+jloy4MMcR/JYiGbo4z3fVTEh6VklmJUcGisIp2AURsAAGEdoIret1qw2wHQ8Mdw1zEpN
 esjnZhDvcY72cu2GpHM2iWJdLTIu7iqUZBlaDgqC4OvtA6KNUUJOZXkMbwek0/ZG36QTfqi+LKtZ4a
 0opiDY7wdToRZCjLLS9+x6bRbJCSb6bSuWPcV490jmnyIHr4/HG2mg0wAfWk0l5XRsYgfUhNkUXEc1
 qhDVDBof/aLu8LUcXlWOSBjYnD4XlmYeC1umSCxX/OCR6kH+0hId8YYpXSqPA61HHvM/MH2vUJXIyB
 DXRh7os6mcMlBM/I8iz0tKi3lNIUbSWl98DGb7Jc6ZkD7Llv4x8Mv1yWt7BxrgbG2OpJ0vRrqOPZDk
 IvlwrNjybmclhwXxQGYDkYDZLSJjbjxDscnDZl9GZL61qEF7KYtqVhZh8QB972WcGxpgIivnCwMi96
 ZlhaibpMy6ehEqlXsLWSYNBBOZDB0r7TDjao5ixIkXwcYDaxlvdQFcQWVvye0PDS397FXZH25joPv3
 FyE9UbpBoGIA+sxrYt4Wm21CIKg/xmDbQ/SccHq2mgfR36F8nEdzJR6f8jZTSznJnBxTpqP9GABzat
 9eiYNYG8ROeAD1GQemARnVLtOqGwA9EnqEKetlF3Vs76GWs2eKQwDX0UpazQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The ARM PMU interrupt is sometimes defined as IRQ_TYPE_LEVEL_LOW,
or IRQ_TYPE_LEVEL_HIGH, but downstream and recent platforms used the
IRQ_TYPE_LEVEL_HIGH flag so align the SM8650 definition to have a
functional PMU working.

Fixes: c8a346e408cb ("arm64: dts: qcom: Split PMU nodes for heterogeneous CPUs")
Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index de960bcaf3ccf6e2be47bf63a02effbfb75241bf..895f70cf6f57a84dda38604789d5ad6d80471944 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -1417,17 +1417,17 @@ opp-3302400000 {
 
 	pmu-a520 {
 		compatible = "arm,cortex-a520-pmu";
-		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	pmu-a720 {
 		compatible = "arm,cortex-a720-pmu";
-		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	pmu-x4 {
 		compatible = "arm,cortex-x4-pmu";
-		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	psci {

-- 
2.34.1


