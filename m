Return-Path: <linux-arm-msm+bounces-9984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ADB84BD2D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 19:45:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6A9928C82F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 18:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19B01B803;
	Tue,  6 Feb 2024 18:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zcED3LfK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1773182AE
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 18:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245035; cv=none; b=MzhsFQOtBXgYBGtws4ZX2e3JGqhlvuIg8PM0dL++aB/KcX8vU/WyDZF6X4Q9h6mt0t66o9JPRjAPg50wywd4OqKgiGeOtKnDF7rW39fY+gBkBXx/ATnmxvbIciHY209mkjiiqeGOhWMtB7IwJBqXUwefQeGFMRUAHcxJiWA7hUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245035; c=relaxed/simple;
	bh=EXwKkMgBsd8MhiHSlPwnGXPooFCi9B6+ZF9m99buTKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gfc0w1t0BMuDheX+ySBvhca0uO0nRX9JNE+h4CL4bUoykiirMRgPpuifoRl1brillwJnqp/KdPDwWvcm+DFI6pkD2bmKXElIxiwhopFjs4SoalTzcAGCsxLEGGW3iT2fEmZHmfwIQbvwd5r3UK48cxQEzpkhSrYQ6ORCxWZQ8fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zcED3LfK; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so783320966b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 10:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245031; x=1707849831; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rt7VV0Ge1sC3yLt62kaXgrxl4JcnOpSTrN15pKlZhq4=;
        b=zcED3LfKRNHgGI+xAuGGM/Rj52WvA4O9WC7K4+HYfPUbjg51eM3smZBuVD4JRY3vDM
         AWCGNwgtigG9YTcElv9ShdtwiF8DK7mPLi12TjRlyeIDxIRpIFVYgkzW6rfRriqiXs1x
         CQV5NNDIrg9Jmq3pob9YNOSK5jRJnYujKDQmaNHMcILCrYhQQnX5kvMXX6+v3Iqr9L9c
         Ce87c0/gyov013hOaHI3iaJafLuuRY/CjJhbWQFTtuyz3hQ30jU0gHg7qg0KzLPnmIy6
         9ScJfzBhUvuyAFHxcSxjBNc/rcf0WgA7f70RyLv7nVO37L5bqOHCjhwW2p1zezIkmrST
         y1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245031; x=1707849831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rt7VV0Ge1sC3yLt62kaXgrxl4JcnOpSTrN15pKlZhq4=;
        b=l188brTq2Mem0+oIeF+TfEFtqEsl0e06K0tX5A7oBmUcuft8tLNsnq5JQCvNnUXKlk
         pQ0PLm4KX0g9z53HC7obkQT7tg5ujcTJDQyWm43JzSdIqQfPzdRbs3ZQd4tc7dsASDX4
         wxYbGx1/reW6nFq/XD5/TtKLBbD33FsQY9Skfo/VBwq01IX6jUrvWSZ7EeCEhOkMYpBY
         bgJSgpyUobszmiu+/ZblF1bL2DhjCJiCOfBwrtDOv8G+rdzxW8ug14ZTI48+mM8U9gLW
         dMp70nbm+Fgqv7lbXKCFMnAoqz1gnws/u4zD5rbHMgGZTCriKnHSESS5qxKwSX+/ChEK
         OTYg==
X-Gm-Message-State: AOJu0YwHFtwNijEFR2H0k2KKah0MpJwiprpQi6VmtAsZT7f/KKczRi2j
	Fn/Lx3eqUuG0sJJLdKm8dBLrvfLq52yEkgaRU0N13EfQ/OfbexJySsx2smTWd+g=
X-Google-Smtp-Source: AGHT+IGLfPHIcth7V1P8PHbajyViGTDYG4qmty2wAY9eOATHRzTNHZtvs1iVdBf+F24UxgSsQgLcxg==
X-Received: by 2002:a17:906:191:b0:a38:53df:4c5d with SMTP id 17-20020a170906019100b00a3853df4c5dmr556223ejb.34.1707245031242;
        Tue, 06 Feb 2024 10:43:51 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVHrf5Y2GiDBabUY+/8vt4kdCuTVp1aDu+19FnW5BYlpFBCOQEcJdG9Ji5bo2AXr7jcBJYiBt3NNLv4roYU2UTqkXfgnZyiDIdlM62GxPp+gesRznRiJg5x5loFV3tkulS4hMb/UP6zMhwmDeXakAibCSsI1FMt2VPJJqo+h7foAZdUB0Qa/mAopZEFSh1SrXz2EtkMy325uRh79nvNMCIyRhnacAa8W2wZ1+n+QcHdVkeLm40ITmRtUQU9dxLWZot4d52YcH8GWJdSAzmrm9pONdyBIxlNKLdjV4UDZm+HKvt121wXxe4pCad1pUZCDSzXzm3m+EUnmtoX8jT/ZykkXMiiGZm0p6SoyvK/EDWBYBxjV2ziF4WrEILR21IWFf+oh9WXRNqPKmLzjHYgKBVOLYfgB/LX2BmAGnIeY4NnzUbdpZ+wxZIgrcZqRPtWaThYixyRX6U8
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a384365e3b9sm562305ejc.195.2024.02.06.10.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 10:43:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 06 Feb 2024 19:43:41 +0100
Subject: [PATCH v2 08/18] clk: qcom: gcc-sm7150: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v2-8-c37eba13b5ce@linaro.org>
References: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v2-0-c37eba13b5ce@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707245017; l=1091;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=EXwKkMgBsd8MhiHSlPwnGXPooFCi9B6+ZF9m99buTKM=;
 b=5v2USoyqmz+31QwL5rklkv0hk80+UpMpJDRSY6WqLzqv1L+b6x6kof5JtwD1gvITaGLk1Q1Bn
 UF2KxonNmu3DCGXVaEhn5mnHhFxkmTUBqcgxevSC2cboEDLKEmDAwDO
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

The value was obtained by referencing the msm-4.14/19 driver, which uses a
single value for all platforms [1].

[1] https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/-/blob/LA.UM.9.15.c26/msm/vidc/hfi_common.c?ref_type=heads#L3662-3663
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm7150.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-sm7150.c b/drivers/clk/qcom/gcc-sm7150.c
index d9983bb27475..7c5596331c30 100644
--- a/drivers/clk/qcom/gcc-sm7150.c
+++ b/drivers/clk/qcom/gcc-sm7150.c
@@ -2918,7 +2918,7 @@ static const struct qcom_reset_map gcc_sm7150_resets[] = {
 	[GCC_USB3_PHY_PRIM_BCR] = { 0x50000 },
 	[GCC_USB3_PHY_SEC_BCR] = { 0x5000c },
 	[GCC_QUSB2PHY_PRIM_BCR] = { 0x26000 },
-	[GCC_VIDEO_AXI_CLK_BCR] = { 0xb01c, 2 },
+	[GCC_VIDEO_AXI_CLK_BCR] = { .reg = 0xb01c, .bit = 2, .udelay = 150 },
 };
 
 static const struct clk_rcg_dfs_data gcc_sm7150_dfs_desc[] = {

-- 
2.43.0


