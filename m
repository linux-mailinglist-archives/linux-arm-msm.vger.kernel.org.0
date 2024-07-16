Return-Path: <linux-arm-msm+bounces-26379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A37933361
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 23:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6434B2256F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 21:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E78143C70;
	Tue, 16 Jul 2024 21:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VifKzHAt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBD813C9CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 21:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721164419; cv=none; b=G1Ua7KSntQhA1sMCx6iN3WIhtRPlVMaqMnNUfrsi/VTs9zDkCtI0QOry4DXt0TB/qtIt3PdWE4nx9WK3fCD5cleJ2y5txq3X8qu8/3r9fI97HIQiS+47T/TR1VvCgPmt3/Gkj8JFIjHwfC8Srnpq8ohG/MiIUb/jFCfqXDzD4eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721164419; c=relaxed/simple;
	bh=11oFdYRphnn3+d4I1yU6g86bXNCstC7PZcZD5H1uSW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gKrkoZgozpM1GjGi23nx1e8aa4gGbgS3TRkfecWoPajGi5O2yZq7EszjXAF8Gxf3FB5yWzlfjEuVmCCzwD8R9kOzsRhQa8iEl9oG7TfyAJAliJq819teYtmFgifXad318RLQlmrDHROLGzG2OUsq7YLwrwNqbVa1Bs0fuhsr6jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VifKzHAt; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eedea0fd88so41918301fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 14:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721164415; x=1721769215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQlwCabAr/hMVFQmRQ8A6rTLaWpzDfFyaQNHtYxsnJo=;
        b=VifKzHAtuyUuj6mwhyEuVsHkPQiB+JUQau+aNHH8kNS4syPHL8b7J7RUIqK+D2OKpc
         9FyxmamJSBnUPYlgmcnlYPXKV1/54gQzuMOL5gnnRulmpYBgkqdtiIhk1WO04fBz1ROn
         Kd/cPm46N0mWx4SJfvsrKJaUG++h1iuvWXf+aSJnybRRNDlQ2x9cwlV22JYH9psdc0/h
         5Ko5YxxlaG0WpAnHIJJLmM5lRHbGiKsA7MMDIlNMS8rRsxBAKadhaQ6/h0dAYRJvzzD6
         I4+ZyHtkyqT+Shuw8sUZ6ADzNeyccDvKW3uwI6YI1wLWRp/HUUWmX1tBkxlxVGpzlZhh
         w03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721164415; x=1721769215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQlwCabAr/hMVFQmRQ8A6rTLaWpzDfFyaQNHtYxsnJo=;
        b=QZQ1xLioiHnY6kucY4/c9SZgOx25kuyKGzNFQLNo3T7EdpDzcrPnqIUkLvkciosrdQ
         1G+4LOI+WjPjkw8ymOY38Iq019yJx76ab2Tk7SpgqTSf9Kk3paUPxy4VlsqgN5ERgN8V
         mo92IjWlHM6ACi9Vt0DyDJYxwUz2CdFGGsQl20zkFiY8zlMnW4aYaAIFUeaTr0He5Yyk
         WRa/plbzF71C+vK8WWmyxFBFtqw4+Bwq8TwGqXEq6bKC8zhpVnPSm9KNDrVP2/rk/MXA
         nVtnDCDUT2GzeUcqHSqLGDsSI8ObrM6CUdnxtfU+jVLuzsd48GdMLYIWX2UXlxcmlgKS
         z6Kw==
X-Gm-Message-State: AOJu0YzZVK6GBtzq9CGdv/oDBxZdqcfiyMItsEk/mIFr5d9TTRwETHQJ
	Jq9fzAgMTv31TYnvWgXzV0YaubuZJYIyDLWO30pvWuEGDFf55q9FNwAGscmvgGI=
X-Google-Smtp-Source: AGHT+IHpjGOJTLSOg9LNcXrSDD+AVI3w/jbSxPVn+eESHUSv/2pMDUxFYt3wrREceMaJU44Rvw4AnA==
X-Received: by 2002:a2e:3015:0:b0:2ee:8bc6:6826 with SMTP id 38308e7fff4ca-2eef4192202mr22820931fa.26.1721164415002;
        Tue, 16 Jul 2024 14:13:35 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee179e723sm12433871fa.24.2024.07.16.14.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 14:13:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 00:13:31 +0300
Subject: [PATCH 4/7] clk: qcom: dispcc-sm8650: Update the GDSC flags
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240717-dispcc-sm8550-fixes-v1-4-efb4d927dc9a@linaro.org>
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
In-Reply-To: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=11oFdYRphnn3+d4I1yU6g86bXNCstC7PZcZD5H1uSW8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmluJ6f4JjsezwsgtXdzKA495WF4MzX47hWyDuP
 3iDFuA7FA+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZpbiegAKCRCLPIo+Aiko
 1SYmB/9IAt2RjlRrRsYAb6VqqD2qpi6sbAQc6rCwRMtQr/TRWIM5Lz1bEi0ENP26qNjRlPMIxL4
 vWwCwQjKx2eQODURXJxMucMR6lqQqn5gcnxDX1C6yHQ6Qz+7VLT4tB9lqIz0jgUDivyLVUHTt6c
 Blc6RvlLr51VforXlB8NEe/Ym0tTMgg6o8etZCtpLXXaLeaUuEcVa6WcVu3tl30gi4dco0ufEhK
 /Cmb1nSb30SjPNNUJLj/5WQW4H4RctGdhw4Yrl8GJQPMwq81H+vdh2rNAs7Xwg988i9/fluSITA
 TmxO8OFaaAXhlqoJvkgaZwUl1KTy6VgakUKxklfw6wlGE4Sy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add missing POLL_CFG_GDSCR to the MDSS GDSC flags.

Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8550.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
index 6bda15bf09ce..49dff9b81fa1 100644
--- a/drivers/clk/qcom/dispcc-sm8550.c
+++ b/drivers/clk/qcom/dispcc-sm8550.c
@@ -1611,7 +1611,7 @@ static struct gdsc mdss_gdsc = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL | RETAIN_FF_ENABLE,
+	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc mdss_int2_gdsc = {
@@ -1620,7 +1620,7 @@ static struct gdsc mdss_int2_gdsc = {
 		.name = "mdss_int2_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL | RETAIN_FF_ENABLE,
+	.flags = POLL_CFG_GDSCR | HW_CTRL | RETAIN_FF_ENABLE,
 };
 
 static struct clk_regmap *disp_cc_sm8550_clocks[] = {

-- 
2.39.2


