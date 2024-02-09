Return-Path: <linux-arm-msm+bounces-10376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9DC84FE3B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:10:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C905284C5A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 21:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B97018053;
	Fri,  9 Feb 2024 21:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FjuCx022"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1772E646
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 21:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707512984; cv=none; b=BPJcsdN+7NBuyrzz1wclDgfVSkWVqJqMaKFtxX9qlrt14Vi0QQ00Gf/HLFPEQfvMazkDYU7TlvG/KR3MFuoUSENjCuh0RSnL0EaezqLGuzI4nCD8PBgrz+tKrgIwbSZYg/rsylHI5mr+/c0e/DEPt++lofAfIt3QrPZftoAG4Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707512984; c=relaxed/simple;
	bh=y2JWZvHJdVFdS2JPzFc6K4lM3ffIwu7LSCAQM8cYwps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MlJVKJcgDShwRnx4D0F8qD75AOHl9KG/ZdfTO/z0HFVGW+khPmn9h4HZDET5LhaORXiQtg2NF9wyydCM/y4XarXUEv0uW9VAzAGQoEV6e5QdV3LbU2OngSC6gGQ254vRJPN3yReFHgT7mEtT18uQlNqXy+5Ue3QcK+v5kiFSELY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FjuCx022; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-511531f03f6so1646096e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 13:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707512980; x=1708117780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHqRSPmMg9wEwP3rMANc1kfU5BrHC67r5uXE7Pbrcfw=;
        b=FjuCx0222QC2Z6NQf1NFj3A4yr/d/F6bPDQlORaxbthOvgxkjBwPxjNJAcLPrzic7m
         rCHVGiGyhRpnaaibWofHYhwbvIgZEkdxZ/VhdjVY+3zxGV0wdgYk6Qaw/G79/RbNCMGw
         LNwX0zfXOYjhfiz5hC354fbjR+7ooG1SQxLF2c2rgIvid3JGhv1WJKYlVcQbQzMlMazI
         APfAnHCtAf3r9Dq51tcEltbogOi3hnN9u81pgs3al3GLqSoA1k8fPrMXQRlx3cusbNLJ
         yl28ekJnCic1PXyuT563wR6MZUKHXPBdjvj7qENTFcwMAcM3Vier1PbTOMGFUH4npW/z
         YrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707512980; x=1708117780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHqRSPmMg9wEwP3rMANc1kfU5BrHC67r5uXE7Pbrcfw=;
        b=ogpJtbxuonWSEnBnou8Y8yrNR+3zuvLMeazfSf62ij3GEJr01DBjpfUjSyeZl7n42o
         9KpTK8SWbI7M0xx0WeiXgwam7jFB8t+lQ2jp6F6E5OlNWPmLgDqfTE7CQtYgBDgtYBYw
         Z1MMC6w4cv0a042tnBZ0NqYdceB91PBWaj/olIaHZg5EenogpP4EJsMv8qs0KMhC3Vnb
         QmtdhDN+nz0KHlx6T3DZYwcPNxzl5bf6zMRQxrFw5OSsy0hEAdoOxKcDSTDDvvrv1tN5
         oIm19rDuqwqqWCLlrqpqvfrjiCQvXaMwis/QJd1QlRvk2lmbnrhqIuLRlxfX57WWDQ/x
         ezmg==
X-Forwarded-Encrypted: i=1; AJvYcCUM07qx35+RkplyIpqtzNhNpn5v1L3Cvxoatx4pI7pwYt2kq//vFSdeJhZmwUHcCU4jq/Vxi8eIn2/eb/I+uk0ByfuwyopHtBEFS4zLYQ==
X-Gm-Message-State: AOJu0Yy95NvXo4jzR/uYlEKMxzN/XseBXIcoAWIhpxNXLkIa7njhSca2
	4Vw3G4WMbSIz3w4IMJaAc8vjzzqdnihRWQ1Qs7Sr7zPB17Ng5yFAeqh92xXtKZc=
X-Google-Smtp-Source: AGHT+IHKeFpvpCJszpvfDnW0xoJSU0+b+hb8GloxzgRp1+C0aN+PjLt8GIouHDl9EE5DZkh+imlmbQ==
X-Received: by 2002:a05:6512:308e:b0:510:a0b:52e3 with SMTP id z14-20020a056512308e00b005100a0b52e3mr108452lfd.68.1707512979829;
        Fri, 09 Feb 2024 13:09:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaRJINx/8wiN+GpFD3aVObJUom5I8zUiQqvAZ4XJQpGDoIz6sch5lV5joqsjlqVv83S5JlLbOAxLQCxaFkw2ZxAFRVF8SB3ysXQtTrLJorjZ+PPC0Ch2pevqTg/7mgq6H+YSEjJyMdJwc5PzCz1BG7eWwsGjZqKa0IB2V2hV1b26TeZpnen3vjkMvrUioBQgSGYMnuOznmVY7tgZLCkGM5hQihH+HoHgPx2jGZPnlrgO0BNsoyI5JOOrhfRvC/E6As1K6inCIsRm+yWvlVg9jUJLxcFoTCHPueZDZutrj5aR3EY9jg0ynLjYkr73QKVhrm7jkA4sBto1i2KP+7F59wWc6Jbi7OqdKQG1rnCXWwLfDNHlUemKxT15AmgEHTkijGEwIhni19Es/8qLXrGNRjbDP0Gy8n4oJCAJYRDXqGOlUy61CkNMX6Um188tMvY7WWSzhp9HSIQYPaHZhYnBikQzl8gE/cTqMXzwKkS5+g8m8ryKvzCRGsfu/+MiWmEkTGww==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id cw3-20020a170907160300b00a381ca0e589sm1108516ejd.22.2024.02.09.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:09:39 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 09 Feb 2024 22:09:25 +0100
Subject: [PATCH v2 04/20] media: venus: core: Set OPP clkname in a common
 code path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v2-4-fa090d7f1b91@linaro.org>
References: <20230911-topic-mars-v2-0-fa090d7f1b91@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-0-fa090d7f1b91@linaro.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512970; l=2649;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=y2JWZvHJdVFdS2JPzFc6K4lM3ffIwu7LSCAQM8cYwps=;
 b=vqxjZLB2wKoZeA1sqxtFieFX/lmXor7OSCMGzaJ/ZLT8fJHwP+eUBcMnhStwX1NiWW8JecbfT
 V8HD/gEQuZKBNG5ojniHgOZ7IHd4sYDc3uhnMC5Um+DOPnB1f68hOqQ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Calling devm_pm_opp_set_clkname() is repeated for all HFI versions in
pm_ops->core_power.

Move it to the common codepath.

This also lets us get rid of core_get_v1.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c       |  5 +++++
 drivers/media/platform/qcom/venus/pm_helpers.c | 23 ++---------------------
 2 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index ce206b709754..5ab3c414ec0f 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/pm_domain.h>
@@ -319,6 +320,10 @@ static int venus_probe(struct platform_device *pdev)
 	if (!core->pm_ops)
 		return -ENODEV;
 
+	ret = devm_pm_opp_set_clkname(dev, "core");
+	if (ret)
+		return ret;
+
 	if (core->pm_ops->core_get) {
 		ret = core->pm_ops->core_get(core);
 		if (ret)
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index ea0a7d4601e2..1ba65345a5e2 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -318,21 +318,6 @@ static int load_scale_v1(struct venus_inst *inst)
 	return ret;
 }
 
-static int core_get_v1(struct venus_core *core)
-{
-	int ret;
-
-	ret = venus_clks_get(core);
-	if (ret)
-		return ret;
-
-	ret = devm_pm_opp_set_clkname(core->dev, "core");
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static void core_put_v1(struct venus_core *core)
 {
 }
@@ -350,7 +335,7 @@ static int core_power_v1(struct venus_core *core, int on)
 }
 
 static const struct venus_pm_ops pm_ops_v1 = {
-	.core_get = core_get_v1,
+	.core_get = venus_clks_get,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
 	.load_scale = load_scale_v1,
@@ -423,7 +408,7 @@ static int venc_power_v3(struct device *dev, int on)
 }
 
 static const struct venus_pm_ops pm_ops_v3 = {
-	.core_get = core_get_v1,
+	.core_get = venus_clks_get,
 	.core_put = core_put_v1,
 	.core_power = core_power_v1,
 	.vdec_get = vdec_get_v3,
@@ -1013,10 +998,6 @@ static int core_get_v4(struct venus_core *core)
 	if (legacy_binding)
 		return 0;
 
-	ret = devm_pm_opp_set_clkname(dev, "core");
-	if (ret)
-		return ret;
-
 	ret = vcodec_domains_get(core);
 	if (ret)
 		return ret;

-- 
2.43.0


