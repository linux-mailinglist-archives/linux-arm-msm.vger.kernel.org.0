Return-Path: <linux-arm-msm+bounces-6614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54534826E52
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 13:38:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6EC01F22C51
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 12:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1509B52F6A;
	Mon,  8 Jan 2024 12:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nDxKYr++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0BE524BC
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 12:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-557d554ca30so386927a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 04:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717158; x=1705321958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZbqxBx0E5dp1fRCBtciunv9V8jUa58umzYW7Td8kFyw=;
        b=nDxKYr++N46UfBavf7faB/nd1xncr7a1ztJaPW9xU5R08WYcWj5/iGdDfpP6xZLEVP
         i42H+MNKBRyWLnviFqywrQfUoC9+ECFlyM91DOkLWRjHnd0iMQedKbFnvKmAEw1yes+i
         Dmx6W/fbki1GLgyrp6omTSmwJcLBAIdDKa7HO1vZSixidk53C9Jzks/wxNLg6CtqdFUT
         Y3YpDZObByajWjPb8msJ0pgCpS718RB17+QiQcYw7Gc/27ERjnCYtTRLUQ7xN2ir48/8
         /+1O29+XvYz/2om82FlgFlCsNUiBFLuRkbv1n1eK4UQar/Eogh3CwLo+fL460N9w14F1
         mPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717158; x=1705321958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbqxBx0E5dp1fRCBtciunv9V8jUa58umzYW7Td8kFyw=;
        b=dNjb7jjA75BWwMx/SvpgRZ4JQ1pVNOO+fXrnt48WZVj6SxdHXmbzZXjD2KCXoCKaic
         wVoCzHqrLYPYIlxht3Eeq+d//ZB8k68+H1OpuJEX7lu0gz5W2W4uqihNP33veGJDzxhs
         JFs7ECRCL0YoNfEnQEfVkFDI7t24g9mIFnKb2jItVPq3Nkm+oeTxnRcO4JF77Ktz4SpU
         U/cuWRpX26+AUtXo2MEDi2u5fsPa7teH5gCSf2nMcH9PMKw+RlC/AyXQc6VPSeIg0jMe
         wElEttpmWuc5mBMm7I0CEUVRbTqqJzaQQQBhxWbAj1V7Q5kIXkn46sMDrBmBziEIohYD
         oBiw==
X-Gm-Message-State: AOJu0YxrFikclco5bE5yI1i5pdL/XAWiVZUAS0oX3S0cNpQebR/gEize
	9Dab93jsMSmhkKLCA3vjfmkxYJPTmDKJcQ==
X-Google-Smtp-Source: AGHT+IHqHmFyu2rSagmuE6RZ/q2A1ktp9lsoKht27IATmF7mQ9Zjl/CXdDYGs26vabBlGhOVoI1B/g==
X-Received: by 2002:a17:906:2bc1:b0:a27:8953:a710 with SMTP id n1-20020a1709062bc100b00a278953a710mr1177702ejg.155.1704717157969;
        Mon, 08 Jan 2024 04:32:37 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:37 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:21 +0100
Subject: [PATCH 04/18] clk: qcom: gcc-sa8775p: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-4-981c7a624855@linaro.org>
References: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=952;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=k1+Llq4BWFORa9650sktN+7i8cGBVSjipUz4DricPxc=;
 b=qh+MgjGLec4wTm3sS0J/P6R79UqhgmLB2oNC3ezUghgrAjRXOWcqOwnzrXWD5I4dbii67gwWN
 7yFkUe/Q9rhB+qxsGu5U4ipZTLb3di0Wk+wmjNkj25tSHiwQDNEFye4
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sa8775p.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index 8171d23c96e6..c2b403cb6301 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4662,8 +4662,8 @@ static const struct qcom_reset_map gcc_sa8775p_resets[] = {
 	[GCC_USB3UNIPHY_PHY_MP0_BCR] = { 0x5c020 },
 	[GCC_USB3UNIPHY_PHY_MP1_BCR] = { 0x5c024 },
 	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x76000 },
-	[GCC_VIDEO_AXI0_CLK_ARES] = { 0x34014, 2 },
-	[GCC_VIDEO_AXI1_CLK_ARES] = { 0x3401c, 2 },
+	[GCC_VIDEO_AXI0_CLK_ARES] = { .reg = 0x34014, .bit = 2, .udelay = 400 },
+	[GCC_VIDEO_AXI1_CLK_ARES] = { .reg = 0x3401c, .bit = 2, .udelay = 400 },
 	[GCC_VIDEO_BCR] = { 0x34000 },
 };
 

-- 
2.43.0


