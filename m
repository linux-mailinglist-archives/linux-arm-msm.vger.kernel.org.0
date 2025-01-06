Return-Path: <linux-arm-msm+bounces-44004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC57A026F7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F1F8164A1E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 13:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E151DE4CB;
	Mon,  6 Jan 2025 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tn3DlaKd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582581DDA2E
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 13:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736171086; cv=none; b=ZfRsrBeJ28rWPtrr3MCJKbf4RqsAvw6U03i/+V71X5CO9fxGPqDhiARvda7vor6tDElHx9MqeEho8mvfU4kMdLGVYmMTlfD+gV8+zoanaZTsrBK2edCHAh18WdDTerBeV94hCi/7dBr4smhdyTmBYNW23cN5fyDSMzFOuAuv+Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736171086; c=relaxed/simple;
	bh=ey4i06XsJ6chSmPblLF8uJUW8RLOYZRQKUh/x6yaUhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HlZIxcF56Q53a7mF6ZsEMNW33BNAxBxFrI/OyAR8SbKsbEUk+ZbVCMxnGCRI7xMUAA3vWRNfjROltTzU6LlSscWaVe1R+XQMTSGxKkYYPtMC/+7zeCYcVzjYAEQJ/Ji0FrLgU2SOUqLmhYazXZPgOV9TBgX4SrKaoCAHx233N8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tn3DlaKd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so22967185e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 05:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736171083; x=1736775883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MCeVkTO7HVSj79SPR3UYJj7dWwSIuDyfyGRyxF3nOZk=;
        b=tn3DlaKdH6i7sxZfrrMfnIHvo3mg94KRjEF1KMOEWrL2oMYFjF3kBLa1OWHFuABN5h
         a9pWBv6vUIua5w5MFbZRHOocInujYseLhAAZSX4/K71oLRtjQUJFuYyatYDGlBn68sbD
         GMlhoFVwGJtkvh/Qbwj+a89EBRci8ZSvkPMB5bAui1ds9HRnO+/TMQfZ1R0mhRBunO/Q
         3zINnwRrV0yjyXKWEzkUFal8218R9P+Bum9NO5aNYcesFYhCCsV2aQABcAT3sqnNnlyN
         JmpnkNVE7AwDCifAklk0EaZOQ1bgnPzAd71G1RIiFxynwjIF5RDtWg6sYSjTVcaGEIKT
         PK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736171083; x=1736775883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCeVkTO7HVSj79SPR3UYJj7dWwSIuDyfyGRyxF3nOZk=;
        b=NPA/PgAl65l4Wl55R6n2ktzA4M4O3ls50zB9qCgQLGS3hIgRp1OgH/33YxPlWqCZyy
         wKAADT0K2WzbuFlGkNo9uAbUPG6v2W7N7eRxYlpc0hZ6sLfYevmxorm2GWHWf+ms9oqH
         sNuYs2l5nnTNtdvAsAhaeWYF/K/prFqK09jkyZMhlt1aNSRrTT+Jrl694FLUvjkzc7AJ
         aRfEJg24ZL4rOKFPxkLt3VyfEvGi5s6XzY65gFh7NlAoqJZlf4/WHKpEFZc9axtooqTm
         FVQ5FMMy+XP8BfC8nyg1BbSFSXcV3ec4EfEUbwLgKhLLhm2e1k2Ujp5+IXX/l4vyVoAL
         tJLQ==
X-Gm-Message-State: AOJu0YzesioDXpvQryTOThTJFdtIN88V6zw3xFRDHKxbpE1AHmf0qWIg
	HGo0y+6h2re4+PqxSchUNih/O7QWCd+1O0q6/jEBJysbTpiDijVxOPGaJmjmrZk=
X-Gm-Gg: ASbGncthVLbeYaXZ/zCHN/ATxC6PUFz1Yfv3RGIQwc1W+MMsmqPLJ1xDZektoOM6RdL
	3joEgvznCxyHVRWowPN9J/qoZe75fSpLPou4Tjqa1tZTtWS99h1Ft7XPcRCmeQcDRySNLxtshZn
	YyV3ukW5RGA4PtLhsx9LQNJ879081/W8r01238WWfb1oOFK9f3zRgPu6l15BNfZqwVQRQAnUogE
	Fy2zZDBGp8W2G91XSR/jgl+sVpn+eAwBe4rFnRCypt0NLvP1IcBVxKCTl5IUb1o93fVd0hi
X-Google-Smtp-Source: AGHT+IFfng3FS+Or2CimhenZtv8taGgmbGVi9p7J736A+0Jnu5KPVn9KPItLt6Po7n7LMv6qVYjGMw==
X-Received: by 2002:a05:600c:3ba9:b0:434:f586:7535 with SMTP id 5b1f17b1804b1-4366790dcdbmr209866755e9.0.1736171082571;
        Mon, 06 Jan 2025 05:44:42 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acc02sm47383151f8f.104.2025.01.06.05.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 05:44:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 06 Jan 2025 14:44:29 +0100
Subject: [PATCH v2 1/3] dt-bindings: clock: qcom,sm8550-dispcc: Add SM8750
 DISPCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-sm8750-dispcc-v2-1-6f42beda6317@linaro.org>
References: <20250106-sm8750-dispcc-v2-0-6f42beda6317@linaro.org>
In-Reply-To: <20250106-sm8750-dispcc-v2-0-6f42beda6317@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6599;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ey4i06XsJ6chSmPblLF8uJUW8RLOYZRQKUh/x6yaUhM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne95EB0GfXzRYpVv0ZNlD3g27bV3HYG4gMBpip
 9sv+kIDQEaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3veRAAKCRDBN2bmhouD
 1x7TEACUyVjSCdFbUkd3jMz+yeRH/K1Sm8yK12Meo8ZYLY02BkoU/CTYnu5LyVEK9t3OVuC/PnL
 IjgWxEPMbDcO6jK+fEs46I9jL1cYdcph3RIxt179VdRK7BgkiaK1ABnuTG3nwpt2Q5Rac9lhk7L
 kjsYTbcecHbDidtpBwLbb0okBfJ3q9vW6EldxUABLZUA3barh0pLr/1fJMw1TwqNoZReSdvUoxh
 mX3jrJEhUp4SxbnaVxVo6LvCX0VDoTzT3pxeEabqQRTLJ4dRGPDkM7ZY7pnJoUms+vfOKVkaeMQ
 j9acsrQ125sBjIFMdD4ZZ4V5VB4b00HyLdIgX8wS7aA3BeUwaAtHRSdHEGAffP3y2ABlBOXiRIv
 JbMKaseQGJkESeMV5SAmLAeoq6xtg1DwnQF88gMZUeeRfsp7Sbv25i3ejqL2XkCdg/o/qHkg3dQ
 h12KtW2KcPLCKeTeJrXyCh0Nv477afBNjQLiPeTlfnci5C2xIeJ9qZepc9qAjoGJ2D/bKXe80uk
 CkJWTdBAa3Ieq55n7MGQLRSSVyVk8PnEu25sxOJvsoHYamXc2HAMlkTxdBmWs1g0Y3xUFNfnLgb
 K1JrWuZ89nrcxADTlIgqZw/1nXnTiY+2sOJrMuLFd4QpY+a8tXnH6/jOtRhhflFyaKPKHpj7tI0
 KfJCHyFbqCmpu9w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add bindings for the Qualcomm SM8750 Display Clock Controller (DISPCC).
Bindings are similar to existing SM8550 and SM8650 (same clock inputs),
but the clock hierarchy is quite different and these are not compatible
devices.

The binding header was copied from downstream sources, so I retained
original copyrights.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

v2:
- Add Ack
- No changes
---
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |   4 +-
 include/dt-bindings/clock/qcom,sm8750-dispcc.h     | 112 +++++++++++++++++++++
 2 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
index c57d55a9293c214c4c101902cdd9603074e2243d..30e4b46315752b93754ab2f946c684e13b06ab93 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-dispcc.yaml
@@ -12,11 +12,12 @@ maintainers:
 
 description: |
   Qualcomm display clock control module provides the clocks, resets and power
-  domains on SM8550.
+  domains on SM8550, SM8650, SM8750 and few other platforms.
 
   See also:
   - include/dt-bindings/clock/qcom,sm8550-dispcc.h
   - include/dt-bindings/clock/qcom,sm8650-dispcc.h
+  - include/dt-bindings/clock/qcom,sm8750-dispcc.h
   - include/dt-bindings/clock/qcom,x1e80100-dispcc.h
 
 properties:
@@ -25,6 +26,7 @@ properties:
       - qcom,sar2130p-dispcc
       - qcom,sm8550-dispcc
       - qcom,sm8650-dispcc
+      - qcom,sm8750-dispcc
       - qcom,x1e80100-dispcc
 
   clocks:
diff --git a/include/dt-bindings/clock/qcom,sm8750-dispcc.h b/include/dt-bindings/clock/qcom,sm8750-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..dafb5069c96a0c3f83c15f3c61978e138baa886c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8750-dispcc.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024, Linaro Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_SM8750_DISP_CC_H
+#define _DT_BINDINGS_CLK_QCOM_SM8750_DISP_CC_H
+
+/* DISP_CC clocks */
+#define DISP_CC_ESYNC0_CLK					0
+#define DISP_CC_ESYNC0_CLK_SRC					1
+#define DISP_CC_ESYNC1_CLK					2
+#define DISP_CC_ESYNC1_CLK_SRC					3
+#define DISP_CC_MDSS_ACCU_SHIFT_CLK				4
+#define DISP_CC_MDSS_AHB1_CLK					5
+#define DISP_CC_MDSS_AHB_CLK					6
+#define DISP_CC_MDSS_AHB_CLK_SRC				7
+#define DISP_CC_MDSS_BYTE0_CLK					8
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				9
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				10
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				11
+#define DISP_CC_MDSS_BYTE1_CLK					12
+#define DISP_CC_MDSS_BYTE1_CLK_SRC				13
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				14
+#define DISP_CC_MDSS_BYTE1_INTF_CLK				15
+#define DISP_CC_MDSS_DPTX0_AUX_CLK				16
+#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				17
+#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				18
+#define DISP_CC_MDSS_DPTX0_LINK_CLK				19
+#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				20
+#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			21
+#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			22
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				23
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			24
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				25
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			26
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		27
+#define DISP_CC_MDSS_DPTX1_AUX_CLK				28
+#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				29
+#define DISP_CC_MDSS_DPTX1_CRYPTO_CLK				30
+#define DISP_CC_MDSS_DPTX1_LINK_CLK				31
+#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				32
+#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			33
+#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			34
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				35
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			36
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				37
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			38
+#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		39
+#define DISP_CC_MDSS_DPTX2_AUX_CLK				40
+#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				41
+#define DISP_CC_MDSS_DPTX2_CRYPTO_CLK				42
+#define DISP_CC_MDSS_DPTX2_LINK_CLK				43
+#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				44
+#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			45
+#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			46
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				47
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			48
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				49
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			50
+#define DISP_CC_MDSS_DPTX3_AUX_CLK				51
+#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				52
+#define DISP_CC_MDSS_DPTX3_CRYPTO_CLK				53
+#define DISP_CC_MDSS_DPTX3_LINK_CLK				54
+#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				55
+#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			56
+#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			57
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				58
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			59
+#define DISP_CC_MDSS_ESC0_CLK					60
+#define DISP_CC_MDSS_ESC0_CLK_SRC				61
+#define DISP_CC_MDSS_ESC1_CLK					62
+#define DISP_CC_MDSS_ESC1_CLK_SRC				63
+#define DISP_CC_MDSS_MDP1_CLK					64
+#define DISP_CC_MDSS_MDP_CLK					65
+#define DISP_CC_MDSS_MDP_CLK_SRC				66
+#define DISP_CC_MDSS_MDP_LUT1_CLK				67
+#define DISP_CC_MDSS_MDP_LUT_CLK				68
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				69
+#define DISP_CC_MDSS_PCLK0_CLK					70
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				71
+#define DISP_CC_MDSS_PCLK1_CLK					72
+#define DISP_CC_MDSS_PCLK1_CLK_SRC				73
+#define DISP_CC_MDSS_PCLK2_CLK					74
+#define DISP_CC_MDSS_PCLK2_CLK_SRC				75
+#define DISP_CC_MDSS_RSCC_AHB_CLK				76
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK				77
+#define DISP_CC_MDSS_VSYNC1_CLK					78
+#define DISP_CC_MDSS_VSYNC_CLK					79
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				80
+#define DISP_CC_OSC_CLK						81
+#define DISP_CC_OSC_CLK_SRC					82
+#define DISP_CC_PLL0						83
+#define DISP_CC_PLL1						84
+#define DISP_CC_PLL2						85
+#define DISP_CC_SLEEP_CLK					86
+#define DISP_CC_SLEEP_CLK_SRC					87
+#define DISP_CC_XO_CLK						88
+#define DISP_CC_XO_CLK_SRC					89
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+/* DISP_CC GDSCR */
+#define MDSS_GDSC						0
+#define MDSS_INT2_GDSC						1
+
+#endif

-- 
2.43.0


