Return-Path: <linux-arm-msm+bounces-26442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B67D7933ABF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 12:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 737AA281349
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 10:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048F61802A3;
	Wed, 17 Jul 2024 10:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cc+EyKcd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6F917F4F0
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721210680; cv=none; b=segMo44coJOY0P/HsDQBeiq/vQxJOlD7VA29oxzziV+xlGiAoVw74QvH/kXByPa5P2jQbcy1KyxeiJz4kvlaqb5K475lcXn0fAYYcHYgtOmbpM8mdQXw7Sm24AuAGlneBrtE9ednIk8tQI3Ul2jeKcdxPjVijO6W3G8FPDDnLl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721210680; c=relaxed/simple;
	bh=1SHzX/4uku2BSzz1JoOSyunNDM5LXA7dO1BSM2h+qfg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NvzmzkQBziQA3QedOqmxZl0D0279psG4oQDyRxobBBSKwFANrFo8GNuCGjjzJ7qrInwPZd7vGo/aPCTJ1qC5vfUMvKDDHvPqr1m8gDof/p8xGbywOznkwgO+KNm2FyuWksdUr+bt23bDLLUUGLkuqh6MbaMJkJRktIl/Ax/U6J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cc+EyKcd; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ed741fe46so3903659e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721210676; x=1721815476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ob6H+KTmv7s1Rzde0S99FhzJiSqflM7VrBPJjyTS6zU=;
        b=Cc+EyKcdxBrcoKD9K/PVNP1ThsIqWaL/6cqG0WfIdSJ4lJ0mY+WXyQEgUqXZSuDLZp
         epEld2ECR+EVo2fFqqB9OlHYT3UJohjEhpfmZ/MsBbL66CK7um9xycHvVr3XKgma2MyF
         8GqyepRmTNFztDNj8fo/E05AiM66VIZxgtJeSAtCbEgQF14d4/EizKmFpIAoo0Ctqv2B
         ctTiVrbiRRVrgLZO+zKCNo9G4WxNb3jceuSJI7W2xhSfoZwM2SAsWOL0zmK9AsGw8B3d
         oxk805r8VN0/rrbY6+07/57Rf/e0fRal6LiqAmRw0s4X+1vvlCUVGe+nUOS4I3r+R/h2
         vgwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721210676; x=1721815476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ob6H+KTmv7s1Rzde0S99FhzJiSqflM7VrBPJjyTS6zU=;
        b=xGapTS2vQ8TTYgTNTBMgGOmb+qa68EVrLeWWFsFmjlYTsKFg4gOUO+KgcAYD6o5jZm
         iif7DzYCNhX2KqSmivOUWiiJNHnuWI4aHx3UsgZrGpgO2pUA02jIbzq179ugxcxb91Vu
         ikLVYbRtmWWL2MaSM1YlnW1M5hJIsTNM6VFePaohw5+15xRlB2F5x2cge27W6yAgMiVS
         hQwVUBcwkn0jbUiIsrywPoN2UMy+iE3pT4MydqrotSDMdCtkNv7qqintmiD2Rqu/nwEU
         POWaCVnnnbEEg87/p/GNAmhVhnLnoRHQ+8UyRaBIF7Rusc3WjlxtdVkd9pTJM2ol7zpA
         tulQ==
X-Gm-Message-State: AOJu0YxYandqiVTlO+9vrZ6ct5ZcJLT2GGrZyzGZG21zweyo+ud6e5GA
	wr5XbLbYPNceApDpr11LeKc3Vr2WJ8l/KbhcOrJO9/XZIfmYiysCbwOs+PoyxEA=
X-Google-Smtp-Source: AGHT+IGtmH4R/tEmsRK9JZGrQhGH89O2TPrLe7vuBJbJE7Dapbywn77la111N2y6uMAZOrGNe3Q/+A==
X-Received: by 2002:a05:6512:2384:b0:52c:88d7:ae31 with SMTP id 2adb3069b0e04-52ee54271b9mr922045e87.48.1721210675862;
        Wed, 17 Jul 2024 03:04:35 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed253924asm1425391e87.262.2024.07.17.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 03:04:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 13:04:32 +0300
Subject: [PATCH v2 5/7] clk: qcom: dispcc-sm8550: use rcg2_shared_ops for
 ESC RCGs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-dispcc-sm8550-fixes-v2-5-5c4a3128c40b@linaro.org>
References: <20240717-dispcc-sm8550-fixes-v2-0-5c4a3128c40b@linaro.org>
In-Reply-To: <20240717-dispcc-sm8550-fixes-v2-0-5c4a3128c40b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=1SHzX/4uku2BSzz1JoOSyunNDM5LXA7dO1BSM2h+qfg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBml5cugqBKyuVhQFvmN51DuCTngJDeb5sBDF/Q4
 zSGnSN2FV6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpeXLgAKCRCLPIo+Aiko
 1U39CACRuxgKzRLpsillvacFNUbAIcul2uqYpxxIfVzVv4nLB+f0+x4+kIyaNeZn2qgtRw+XPDk
 hmVQkGuuF755g6WCZ8HeswxWbgVCJm/m29vTEYks4uf+jmI4P9T27OMbMntxDjz9hBj5bui4Zmh
 gUb2z9zy3p9suvDeiTk41aUM/FqiucfWqhviLUIIXS2zW3QwJa/DXsbzh7UIgZHL5Km3VM0VJBO
 nMXnpzPHJfMOUv6BajfbfHUyEgmJLcOtHIVgLdKiTurNQTQSe0dSFtJxNd2URgG+TGs9qtethv9
 OMdyJWSJN9kfCfJfi0dxObZ/VDpyaEfI78Eb7DOsQgoAgwJz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the recommendations and park disp_cc_mdss_esc[01]_clk_src to the
XO instead of disabling the clocks by using the clk_rcg2_shared_ops.

Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8550.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index eebc4c2258d0..1d884e30d461 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -562,7 +562,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -577,7 +577,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.39.2


