Return-Path: <linux-arm-msm+bounces-47818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8D1A3305B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 21:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02ACD167539
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 20:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4870202C20;
	Wed, 12 Feb 2025 20:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l9GeHGms"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D51E200136
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 20:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739390520; cv=none; b=PVCqZAXdUML2jOcjvlZWZC2UzCKEqeEcUsmjfqyBBu1SL1q46L0OKNEHC4ma5aAu1xZbmbCX8Zs3cWpSg5t69hHisr9HnZyeqTRNlmMRICCFEwY6Cb/cdk5RDWi9kAmiJoRWMSn3bDxsYOgSv5xyXS+HMTtmsmZH+MNpe1fDwBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739390520; c=relaxed/simple;
	bh=09Zq1wvYiAPyMIJJUWJ+HB5emBm/KsHziF4Pi65X4WM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AhGi7I8p4hqF6/aNBeFVPDYTB7lT+L2xjMrTrPiwqItKlyMNl9OJTP28PFtblVIbPlu5Oz8twgZclTccvUp7jEkwqhSaTUVCOmbKG61CbQTubZQqYpFs6qY8fG93JpOnAtmG//XLKsPN9LEg5cZIVokY+BSk+VVgQ0C8lMQ3eEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l9GeHGms; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5debb4aef2eso5275a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 12:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739390516; x=1739995316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=doXaPbYwDYHThLE3/vOulSah/CgrJWiEDAqjt9r9dc0=;
        b=l9GeHGmsNrS36oD0eWRk+Wf9+HbPA5N6mzmHZaWbsVFRbOXn/3tTQ5oM7LDM3hRVsJ
         qPJ2NGF7u6G1iMbesLwewmh93oE0oRccLLd5+bRNiBRxtY2IQmriD7B4wqynJJuNj2pb
         WwZwuYkHW5GaPAIjV9j5ZDIt84JfT0oJNnhKZjQX9elDiSL6Tr/seup36Om+g9uUZVZq
         XwH38iBTSu9/zh/dDjaDhtG543bY8koDQPIpONqYtlt3pNbxseY1FrcCgdGyyfSdRKUw
         aNdJaPF9nY1MDTl65z0bURo1efRm2N/eTAZSiYj/jnb6h/MDZTOY5nGJ++EuvmcSAL8F
         XhPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739390516; x=1739995316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=doXaPbYwDYHThLE3/vOulSah/CgrJWiEDAqjt9r9dc0=;
        b=HPSDJOxJwwqf2ATLzfCreRxCwLrXy27QE6T+UFreQAOqTbuekv9Iz3pvV+LGVxeWPB
         9y4Aop0Y5CfQF48wpUEbaKE5iridjgiazRPp88H7BkmDzWjohM8RuP13TQp9WJufd5ig
         F+4MLVL7Jx8HJjT89s7eh4oL/EZ6AZdJbgw2FQU39wCU/bUHjuSFu2FiDinwSXstLwrl
         QOkjFgEBy15xef27CcWCnEcCs3zWZ5ylCWqt9kNob55rLxtHd92uITWpsvVt11klwQc3
         CnC6u5Z9qySOe19hMu8+qq0Tfnhi4A2fr1UHYKge2d3kngWH6ibYkYM483WR0otP9yUl
         BQUA==
X-Gm-Message-State: AOJu0YwpUAi0EJcZvlzzpxOxcbyf5e/6ine9JQf8kAl1Lf9AnpTg8Qxc
	NSseXQXuO00YJ6OnlczR5U7xScBilZ9tQUFQhYY9r0MWLWjZjuQemRf+qcHabZRsRHRoeh6QPpG
	f
X-Gm-Gg: ASbGncsqNCp2wIY5EOAdeE/xCool8K/PkWuqQh6YK+pGUszxGH2rE9gryW4OXud6fHX
	3UmTBedaBMEKUBNf7F7nnVgJHGKfLKTP260cYdQ6BfF/JEu4n9BmhvqS1AYOA4Ddr3Rzt2T+ShC
	3Mkr13yCOv5yz6qe57sxrc/TDV9bfBJQOV0zObxYqvA4UEl14Mg9PTNSM36ct58z8YCEGNUuyoU
	pDTUmggPvh6b34SRvNmXhp7S3vDsaUyv8YpnJerL4bzaqcWp/g+BGzk290SVgqclp1d8SQzhzt5
	9Rz1+TU4arOY9L7M3TwloI97GKaxggo=
X-Google-Smtp-Source: AGHT+IGD6cCYj9qKz5WKaxsvW+XDTfA8mWTCtGfkaZXYzOiNHvAFMHZ0mZDrQn8XBY7irOL/j5+kLQ==
X-Received: by 2002:a05:6402:278a:b0:5dc:7374:2613 with SMTP id 4fb4d7f45d1cf-5deadd75063mr1608045a12.1.1739390514763;
        Wed, 12 Feb 2025 12:01:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5deca41378fsm144527a12.74.2025.02.12.12.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 12:01:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Feb 2025 21:01:37 +0100
Subject: [PATCH v3 3/3] clk: qcom: Add missing header includes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-b4-clk-qcom-clean-v3-3-499f37444f5d@linaro.org>
References: <20250212-b4-clk-qcom-clean-v3-0-499f37444f5d@linaro.org>
In-Reply-To: <20250212-b4-clk-qcom-clean-v3-0-499f37444f5d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=18880;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=09Zq1wvYiAPyMIJJUWJ+HB5emBm/KsHziF4Pi65X4WM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnrP4oyRv1w3czNbCi79AVCzuo6JG4C9dG8Dnnd
 I2FN5qiC6WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ6z+KAAKCRDBN2bmhouD
 1+5zD/0fK4N5Gxw4q4GjehhsmHnlaXH7sYBGP1EKNwJv2oC1jhZXKIkAxA1x/SiCduR7c1guLGJ
 VIAMQMSBwneYUuCsxCGSQ7/Qe4PCKcp/V04OviGo9PSwWAGmm0T64x7VJFPKLPwT3jBzL3kPEsW
 1BwLCspCNtUYVf3fHCkIr8IIaXBfsjXawW0XwXbxhOlDo9FQUU2biO7mhv+ebLi2As3MaabmsQv
 ONkwmFi6Gyk9fcVP5/HvwH4SRZ2KAqBEd8szZFUQ1Y82u4UZeCBVygPryEh6wUZTtqvHBDvNYa2
 qFPq3wgQZCUxorcCALVM3seG6bm/Dkd4wtabx4A2xbSzJxHFLwK9Le0x2F93ToHS8h8hq0TSKo3
 oHIOf+wTqRFDEHPWGUyftjRNl0kkgYe4otuHTRPvhUkeFPk82GndNco/ToA/Ph8musOWU/IeoHP
 GtPv8oMfRiFf7FOkO5XZp0eVPbjEQDrVxd25hFuYB+urgjZR0xBvRBZKXYumk7q++LJYunjb6ku
 cWRDWfreRuHMf6Lsgkwu9fyUl7lbxmspZaBJNoCJqY+OGLQLcwV/ach9H2Pb+WCXr4VfWQhIRU5
 cq0JmkButOpvN7nhDi1XIOp5yNCwtM2Pm/zZbFxLe8BzC33UNS3V/DzM3N+z9mXb0XvcGisNoiq
 cTmRvrDeYEjge7Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Include mod_devicetable.h for the 'struct of_device_id' and
clk-provider.h for the 'struct clk_hw'.

Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Drop change to dispcc-sm4450.c

Changes in v2:
1. Rename subject (Include->Add)
2. Rb tag
---
 drivers/clk/qcom/camcc-sc7180.c    | 1 +
 drivers/clk/qcom/camcc-sc7280.c    | 1 +
 drivers/clk/qcom/camcc-sdm845.c    | 1 +
 drivers/clk/qcom/camcc-sm6350.c    | 1 +
 drivers/clk/qcom/camcc-sm8150.c    | 1 +
 drivers/clk/qcom/camcc-sm8250.c    | 1 +
 drivers/clk/qcom/dispcc-qcm2290.c  | 2 ++
 drivers/clk/qcom/dispcc-sc7180.c   | 1 +
 drivers/clk/qcom/dispcc-sc7280.c   | 1 +
 drivers/clk/qcom/dispcc-sc8280xp.c | 1 +
 drivers/clk/qcom/dispcc-sdm845.c   | 1 +
 drivers/clk/qcom/dispcc-sm6115.c   | 2 ++
 drivers/clk/qcom/dispcc-sm6125.c   | 1 +
 drivers/clk/qcom/dispcc-sm6350.c   | 1 +
 drivers/clk/qcom/dispcc-sm6375.c   | 1 +
 drivers/clk/qcom/dispcc-sm8250.c   | 1 +
 drivers/clk/qcom/dispcc-sm8450.c   | 1 +
 drivers/clk/qcom/dispcc-sm8550.c   | 1 +
 drivers/clk/qcom/gpucc-msm8998.c   | 1 +
 drivers/clk/qcom/gpucc-sar2130p.c  | 1 +
 drivers/clk/qcom/gpucc-sc7180.c    | 1 +
 drivers/clk/qcom/gpucc-sc7280.c    | 1 +
 drivers/clk/qcom/gpucc-sc8280xp.c  | 1 +
 drivers/clk/qcom/gpucc-sdm660.c    | 1 +
 drivers/clk/qcom/gpucc-sdm845.c    | 1 +
 drivers/clk/qcom/gpucc-sm6350.c    | 1 +
 drivers/clk/qcom/gpucc-sm8150.c    | 1 +
 drivers/clk/qcom/gpucc-sm8250.c    | 1 +
 drivers/clk/qcom/gpucc-sm8350.c    | 1 +
 drivers/clk/qcom/mmcc-apq8084.c    | 1 +
 drivers/clk/qcom/mmcc-msm8960.c    | 1 +
 drivers/clk/qcom/mmcc-msm8974.c    | 1 +
 drivers/clk/qcom/mmcc-msm8994.c    | 1 +
 drivers/clk/qcom/mmcc-msm8996.c    | 1 +
 drivers/clk/qcom/mmcc-msm8998.c    | 1 +
 drivers/clk/qcom/mmcc-sdm660.c     | 1 +
 36 files changed, 38 insertions(+)

diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
index a69b70ab1a7090b15fc3378afc200f37a66baa4d..5031df813b4a7e40cc45641d27478429c08b69bc 100644
--- a/drivers/clk/qcom/camcc-sc7180.c
+++ b/drivers/clk/qcom/camcc-sc7180.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/err.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
diff --git a/drivers/clk/qcom/camcc-sc7280.c b/drivers/clk/qcom/camcc-sc7280.c
index 5a9992a5b5ba5d4aec533c5cd9ef5c9e549ee40f..55545f5fdb98c94eb0557a94db683d2108311f61 100644
--- a/drivers/clk/qcom/camcc-sc7280.c
+++ b/drivers/clk/qcom/camcc-sc7280.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index 40022a10f8c0b5392da2f7db90db38c2c7c8afe0..cf60e8dd292a93d0bbc4f77aef6dd90a6943f269 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index f6634cc8663ef63b372183063d78cc89f5321268..1871970fb046d7ad6f5b6bfcce9f8ae10b3f2e93 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/camcc-sm8150.c b/drivers/clk/qcom/camcc-sm8150.c
index ed96dcb885b353b2f1b915116fa4b357de91ff0d..f105534cb318069d71590fbeb2d6aa181c621af3 100644
--- a/drivers/clk/qcom/camcc-sm8150.c
+++ b/drivers/clk/qcom/camcc-sm8150.c
@@ -6,6 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
index dcbc6c354e5a0fcd36f289568eb35ee36bb1bb16..2b84b1a0ac9c4f5273d488f6fa0445613efba1c5 100644
--- a/drivers/clk/qcom/camcc-sm8250.c
+++ b/drivers/clk/qcom/camcc-sm8250.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index f72e9585b4fb22ecc227a50dfaf2d54117882c3d..6d88d067337fa132114b0d8666931b449f86de17 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -4,8 +4,10 @@
  * Copyright (c) 2021, Linaro Ltd.
  */
 
+#include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 4710247be5306945838d9858c1af3fed70b04b51..ab1a8d419863df28da852a7d3467f09fb5e9d8da 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sc7280.c b/drivers/clk/qcom/dispcc-sc7280.c
index db0745954894d4de2e2f3de95fdfa5b864c67ac3..8bdf57734a3d47fdf8bd2053640d8ef462677556 100644
--- a/drivers/clk/qcom/dispcc-sc7280.c
+++ b/drivers/clk/qcom/dispcc-sc7280.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index 0a810fc847ce0d8b4f14e00a6983aa83c728f1dd..34fae823423a9035bdd39517ef7ac429140a43b5 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index 94079c54333fccc9b06cc9f82f4b9111b40f8c22..2f9e9665d7e93fa73e8478b055bd73bdd9f13be3 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
index 89f14cfd92336e6c28ad3eeb2ae9ef4219eb0555..8ae25d51db9463b3fb6452ca5b99662b1050f777 100644
--- a/drivers/clk/qcom/dispcc-sm6115.c
+++ b/drivers/clk/qcom/dispcc-sm6115.c
@@ -5,8 +5,10 @@
  * Copyright (c) 2021, Linaro Ltd.
  */
 
+#include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sm6125.c b/drivers/clk/qcom/dispcc-sm6125.c
index 51c7492816fbd397de881e2f42fc6f55d5b25fe3..851d38a487d3c95c29e90547ff90ad6386e0bb89 100644
--- a/drivers/clk/qcom/dispcc-sm6125.c
+++ b/drivers/clk/qcom/dispcc-sm6125.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sm6350.c b/drivers/clk/qcom/dispcc-sm6350.c
index 2bc6b5f99f5725bf56c63623c3d5c16c25879d9e..e703ecf00e440473156f707498f23cde53fb7e22 100644
--- a/drivers/clk/qcom/dispcc-sm6350.c
+++ b/drivers/clk/qcom/dispcc-sm6350.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sm6375.c b/drivers/clk/qcom/dispcc-sm6375.c
index 167dd369a7943655a5524077884e89dd148ce829..ec9dbb1f4a7c984a1f8b286fe448d61169ac0bea 100644
--- a/drivers/clk/qcom/dispcc-sm6375.c
+++ b/drivers/clk/qcom/dispcc-sm6375.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index 1f48e79acfac31641a1cccef895139fea9336a47..8f433e1e702839daf62c0a65992bc89927cac266 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index 96987d8445cb09085b8017e7f18824a643e677bd..0b76cddbeb940bcae5f37f4a226a204a6c608f47 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 4c5feb96ae53d94b34b671da34ad090b80a9b247..a373c92a10aaff78172bdb44cafda82f564ea19d 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index 066793e47f79f42dfdf9895bca33393455925ee3..7fce70503141bd91b1503e71a4972f188ae8c90c 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -7,6 +7,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sar2130p.c b/drivers/clk/qcom/gpucc-sar2130p.c
index dd72b2a48c42da1e14fb1e87a7dcd5f17b1a43ad..c2903179ac85db72f2b927623e437a12c9985679 100644
--- a/drivers/clk/qcom/gpucc-sar2130p.c
+++ b/drivers/clk/qcom/gpucc-sar2130p.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index 08f3983d016f3f24b1e613de7d7391a8fe428c61..a7bf44544b956db3dd476869177ba9858401e7ac 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
index bd699a624517846a289fa62ed8639579a0bd59e3..f81289fa719df42e659e681254d05c7093d11468 100644
--- a/drivers/clk/qcom/gpucc-sc7280.c
+++ b/drivers/clk/qcom/gpucc-sc7280.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sc8280xp.c b/drivers/clk/qcom/gpucc-sc8280xp.c
index c96be61e3f479e1a8098e29a95e2a09f510dc258..913e17f101967036bf1dde7a3282c0155ae285c7 100644
--- a/drivers/clk/qcom/gpucc-sc8280xp.c
+++ b/drivers/clk/qcom/gpucc-sc8280xp.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/qcom/gpucc-sdm660.c b/drivers/clk/qcom/gpucc-sdm660.c
index 6d37b3d8d1a40dfebbfa8ab89bf0459f041994a1..28db307b6717cc666a006c5d3ceb70c30f281f0e 100644
--- a/drivers/clk/qcom/gpucc-sdm660.c
+++ b/drivers/clk/qcom/gpucc-sdm660.c
@@ -9,6 +9,7 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index ef26690cf504237f41acfd2ddea498b7e0eda5d3..0d63b110a1fb21a9026805c4245df6a440d4090e 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sm6350.c b/drivers/clk/qcom/gpucc-sm6350.c
index 1e12ad8948dbd8ecc7cad421ebe77dd047ff928f..35ed0500bc59319f9659aef81031b34d29fc06a4 100644
--- a/drivers/clk/qcom/gpucc-sm6350.c
+++ b/drivers/clk/qcom/gpucc-sm6350.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sm8150.c b/drivers/clk/qcom/gpucc-sm8150.c
index d711464a71b6d8ddb5e0a86d6dbe3c7035577b7f..7ce91208c0bc0fb0009e0974d7d45378d8df8427 100644
--- a/drivers/clk/qcom/gpucc-sm8150.c
+++ b/drivers/clk/qcom/gpucc-sm8150.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sm8250.c b/drivers/clk/qcom/gpucc-sm8250.c
index 113b486a6d2fbfdf9bd2a6e3ba7c9b8999284eb3..ca0a1681d352c41bf2dc4ef7746ad7e5ec1626e2 100644
--- a/drivers/clk/qcom/gpucc-sm8250.c
+++ b/drivers/clk/qcom/gpucc-sm8250.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/gpucc-sm8350.c b/drivers/clk/qcom/gpucc-sm8350.c
index 6d2660bdd82549806e1eb0d8fb64b1b2523e67d9..4025dab0a1ca9a37fa79f705e3be5e0e554737bb 100644
--- a/drivers/clk/qcom/gpucc-sm8350.c
+++ b/drivers/clk/qcom/gpucc-sm8350.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
index 3affa525b875c3b313711a32f6d45133a09a6813..2d334977d783253e75d989f1623c5a3ea4444b97 100644
--- a/drivers/clk/qcom/mmcc-apq8084.c
+++ b/drivers/clk/qcom/mmcc-apq8084.c
@@ -6,6 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index a23440e13b71d67c4cc4c5efa3f7b5c927cd110d..cd3c9f8455e5e00bea2c2f163db41a1a6059e153 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/delay.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index f2e802cf6afc558672f70f407d7538fde2a555fa..12bbc49c87aff41d18b93e4ff326f59526a7a5e1 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -7,6 +7,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/qcom/mmcc-msm8994.c b/drivers/clk/qcom/mmcc-msm8994.c
index 0a273630e852c978558d13a36ed4d8b3a4d339cb..7c0b959a4aa2075b6cd6ddf3fc2b62ebc488d0d5 100644
--- a/drivers/clk/qcom/mmcc-msm8994.c
+++ b/drivers/clk/qcom/mmcc-msm8994.c
@@ -7,6 +7,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/clk-provider.h>
diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 3426e3dde92478d6853e724fb2f555d1a1e31bdc..7d67c6f73fe138e37189a7459ff784a8fc0b8a7a 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -7,6 +7,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index 5c37be700fa77985d0806587e80ac465956c5762..e2f198213b215d0bdd9bd463b7228ca13a966e5d 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -7,6 +7,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index b3beeabe39ed1d9c66508dacfad904aa379b9a2d..e5bdcc75a36ed24a8c72d1fd6ee57083a7f5c499 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -9,6 +9,7 @@
 #include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>

-- 
2.43.0


