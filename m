Return-Path: <linux-arm-msm+bounces-34781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8589A2A11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 19:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EE85288321
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 17:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A801EC000;
	Thu, 17 Oct 2024 16:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wYzjG2cf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC0F1F941D
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 16:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729184247; cv=none; b=hjhIwAcCBNYHKJ2Z5ygnYldt1loPA2o71tDjcvxJ1SHUIJpvr6p4h7zkiwXLs+mTJR+bpLBcPYLYyAgK7bZ56Xgy8GkCdJbTPWeuEnV3tOmMW4K+LBn+jENwc55+Z9wJ0NQY83bCI9ueo4XTFirDa83+DpELyesbVXbCURDtH60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729184247; c=relaxed/simple;
	bh=t7hDrtx4kJ5DeVsIbZmhYCNSETknrAFehSlgXsa/aQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BUH765mo5z53Mmxeg+TTL6DZqcfNDQ54+Psm/cIu67JZygSy+oJrdNsHYEbtghRe5xz9ebyfnainAdf3CU899UKEYtEr2wKASwxqFoHJ8zBHXqONTndgznTVTI5LHmp6HEqcHCzQS1emNjH0+2Dm0si3531PyW3+OA4sIaVrnoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wYzjG2cf; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so1918806e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729184238; x=1729789038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUEt9TXBCKzq7zig2rJbZI6eJjpDUgZF5RCBfHnO/I8=;
        b=wYzjG2cfE1PtDDXEf4iQoTFJRG8aE5flZrwKDZenLO7mFU5kDG6r/fcdrf8ust/uf0
         ikQEEg9HSl6XMLX47/94GiFOAJpX92hqhDL0dWSZO8P4Ir+J1DksNfeTsqdGVoGBLDA6
         I9tFS92R8QhyA0hk7NlLhRmBKOSaoZHLKxeYUTW5VbGn8t/uq90UhTp7XgCUs92cSGLe
         k5zemYNWBp0ZYPYcvVwrIE+chFOmMOerzG7D5teG7hGKemLZSQ+MztHtb/O0MEoNqBva
         2e4coCSaaWv0+OvdVLumCiH2PDPXvDANl23k8Kj/muCkkW5dS5MIlDIpCKQVeatRxCcD
         +4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729184238; x=1729789038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zUEt9TXBCKzq7zig2rJbZI6eJjpDUgZF5RCBfHnO/I8=;
        b=JCZrlCCLrTo+w9GHz/g50MWmx2OnjBjpb/uCjYwEhAbqypSQMWu5bfrX8Kw9WUMPHo
         /cMfvGmx1fmM2gmcIYz5EXfA4icdgZCkStTy3QvRaRLAjRlhuuz2dhxZw6kjY9h0E/F8
         zKwLcQHiR0hLokzAFtAnpBIaoWe3mhAclO7jA93dvfeHsepv9QwcJWWRnrbIqdRhFN52
         scRFi8d7z33T66ebsIDVe5iZqfLulekGCWDJ+ecQsNJhov/g7mAMpjngVBAEHpN11fHB
         LoDqchC+U8BtdmfWYFOCRczTyShR6Qg9Zg7YvjW/hyAHyUq9dQMP8YvdtfJoI5xnitqg
         EOpQ==
X-Gm-Message-State: AOJu0Yy02AccJWo63YqCO2gIE4naGKCgy5TyKHSlsnxa6QpQ5LAdJ/CM
	ibVaCvP4EXoGkCgx8GJjUbj55UGK8CJtRwEb5AH+OAk83AMSSLFgEPIGCFAbY0bznmAwtv45EEj
	zxa8=
X-Google-Smtp-Source: AGHT+IGOWUB561YpWd2tKA2ndsbQ0khheOBYIP3sTwBbZ59vgcrCXMue15aZloAAQ/GDwAeSAU8wdg==
X-Received: by 2002:a05:6512:2313:b0:539:edbe:ac86 with SMTP id 2adb3069b0e04-53a03f0739amr5883447e87.10.1729184237543;
        Thu, 17 Oct 2024 09:57:17 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00007078sm821563e87.212.2024.10.17.09.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 09:57:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 19:56:57 +0300
Subject: [PATCH 07/14] clk: qcom: clk-branch: Add support for SREG branch
 ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-clocks-v1-7-f75e740f0a8d@linaro.org>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
In-Reply-To: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kalpak Kawadkar <quic_kkawadka@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lk5Jzsxf7Q9DWyX31WiRZKJBTl6ko04MqIlsJap0u5w=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEUHbBZPdRgefZdHDDT5GfTwUsmLMj9DYGrvuj
 4JJYFnfOtaJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFB2wAKCRAU23LtvoBl
 uJvLD/41ycyKcCJzBRuYDx7+AZNHXyvhVcbB6+X99Ny43LGteSj8H9z9c8SVkOL6ZziSmGXq7tW
 HmpipYEwHdwUH+2tKUro7XoEwfLDN/DzTVnBr5FQmWdwH/+FPMUwVHK1xsMXtjCDam0Vhmm2i76
 VJw7rCU2HfruUuxBKuUg24TpEPxHX0KelUtDxozr98odKOhHW454zNWlmMAgp26RMVoRh93+zHw
 snxEFxaE4xV4P2MVwwX9XZmThwxZgocUxxupDx3EV+Fey8+iH0sJcJxDHuw/xvR8DmWJDte8I2S
 Dw+po1Od9c06k5KxPSLkF+LSNc9//gtzzxOI9pd2nDwZncmvGkmQQ0hY9WAXyEf8WdQ5I9epUg5
 CORLDZ1A6pGS3F5DTw5+xG1e9w8O7bfY3h05cE2uzz97eL+73MmTLOYl9bWBavNlJKhYROZsc2z
 jKhEbtUpfK+Zg4CjIeVOUd+juoGq9vH377vCqN0GqgTWVwlqfE+NXmQ+5GcT9LeWta6hd8P5yHW
 46hV98zIOA5zcqfViQB94LPx4YOpwZ+Kn2K4b6tk88FrU8mKBGxVHwcqGgb9JQc0QOqGGJ6PC1+
 V6WZnsww6S15D1jJEboMq93JvWLEJL7HKsSqNeXa4/CW4sz6YiUFDAmOThaPyQ3WNzRgj5UI5S1
 luye7dxSMGDvhmw==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Kalpak Kawadkar <quic_kkawadka@quicinc.com>

Add support for SREG branch ops. This is for the clocks which require
additional register operations with the SREG register as a part of
enable / disable operations.

Signed-off-by: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-branch.c | 32 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-branch.h |  4 ++++
 2 files changed, 36 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index c4c7bd565cc9a3926e24bb12ed6355ec6ddd19fb..9142a33b6b3ba72a7dd9ff80a64c17f2a1746e8c 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -170,6 +170,31 @@ static void clk_branch2_mem_disable(struct clk_hw *hw)
 	return clk_branch2_disable(hw);
 }
 
+static int clk_branch2_sreg_enable(struct clk_hw *hw)
+{
+	struct clk_branch *br = to_clk_branch(hw);
+	u32 val;
+	int ret;
+
+	ret = clk_enable_regmap(hw);
+	if (ret)
+		return -EINVAL;
+
+	return regmap_read_poll_timeout(br->clkr.regmap, br->sreg_enable_reg,
+					val, !(val & br->sreg_core_ack_bit), 1, 200);
+}
+
+static void clk_branch2_sreg_disable(struct clk_hw *hw)
+{
+	struct clk_branch *br = to_clk_branch(hw);
+	u32 val;
+
+	clk_disable_regmap(hw);
+
+	regmap_read_poll_timeout(br->clkr.regmap, br->sreg_enable_reg,
+				 val, val & br->sreg_periph_ack_bit, 1, 200);
+}
+
 const struct clk_ops clk_branch2_mem_ops = {
 	.enable = clk_branch2_mem_enable,
 	.disable = clk_branch2_mem_disable,
@@ -203,3 +228,10 @@ const struct clk_ops clk_branch2_prepare_ops = {
 	.is_prepared = clk_is_enabled_regmap,
 };
 EXPORT_SYMBOL_GPL(clk_branch2_prepare_ops);
+
+const struct clk_ops clk_branch2_sreg_ops = {
+	.enable = clk_branch2_sreg_enable,
+	.disable = clk_branch2_sreg_disable,
+	.is_enabled = clk_is_enabled_regmap,
+};
+EXPORT_SYMBOL(clk_branch2_sreg_ops);
diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 47bf59a671c3c8516a57c283fce548a6e5f16619..149d04bae25d1a54999e0f938c4fce175a7c3e42 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -24,8 +24,11 @@
 struct clk_branch {
 	u32	hwcg_reg;
 	u32	halt_reg;
+	u32	sreg_enable_reg;
 	u8	hwcg_bit;
 	u8	halt_bit;
+	u32	sreg_core_ack_bit;
+	u32	sreg_periph_ack_bit;
 	u8	halt_check;
 #define BRANCH_VOTED			BIT(7) /* Delay on disable */
 #define BRANCH_HALT			0 /* pol: 1 = halt */
@@ -111,6 +114,7 @@ extern const struct clk_ops clk_branch_simple_ops;
 extern const struct clk_ops clk_branch2_aon_ops;
 extern const struct clk_ops clk_branch2_mem_ops;
 extern const struct clk_ops clk_branch2_prepare_ops;
+extern const struct clk_ops clk_branch2_sreg_ops;
 
 #define to_clk_branch(_hw) \
 	container_of(to_clk_regmap(_hw), struct clk_branch, clkr)

-- 
2.39.5


