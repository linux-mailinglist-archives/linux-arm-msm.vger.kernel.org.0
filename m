Return-Path: <linux-arm-msm+bounces-6622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1C6826E74
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 13:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A82A1F225C6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 12:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C86454BEA;
	Mon,  8 Jan 2024 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MJqwYxlw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E5453E3E
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a27e323fdd3so162605566b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 04:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717172; x=1705321972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vLhCr+SPstjxHdQZgARLGaDcWp07I/chnTOLHwQLC8=;
        b=MJqwYxlwQygICwyVIB2pu3VTH5MFmqVCWq8hkuth7T2a8+ujfvLLtCoGDQyA88jgtc
         nmUDc0h+H+M2WsOtRcUSS1XplzXgXEUnZMoJVLBSO5BI0NMG4XeShFSekKfGRk4pT4WT
         qjorgGo6HPAG65Vu2JhHVYNR1s2jN33M6Hj719rnPSFEgdJGxl9XcIFrwWB1TqjJa2WT
         G+e/pp1edVfe1JgLYb6LICUlS9l2TwN9zifymKKh1Nv0I5b4u6/rZAyaKzcFAM8Voer0
         Sq1ORYYplNd+HDvQWijWfgPJr7uIEvj/62MRnDWNI/zjYg2wjoJB+Mk7TDn4xSRgUiaT
         9XHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717172; x=1705321972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vLhCr+SPstjxHdQZgARLGaDcWp07I/chnTOLHwQLC8=;
        b=KxUtLWKLOMJrCXTAGVFjUvtFMASGy4Qz0AUO8WYRHjCwImTboYL19jV/zmt4H9jHaq
         RdzdQ2JwPY3W7JkPmLwqW8XqGj461AfTcGHESQGheVKU8Q6fQ0BgFlyXco0CnqZSGjPU
         bOGJgzYQuRVWJlN1g+8UOFPHRMg9NTIEoRi8dmIdiwDfwJTABXy6/ygM6KblXfuH8fRK
         0hFEbVbKJkRc+heuU2IUs+Y4juXbIbKUy+N1vmrTIhee6UiZtX+1yg/VwlkU7gxldM9G
         /tLWNi1kK+8bzVzmVMudq1oclWh2ct/dQe0AEdPC5WC117/Q6RspBPgGRNYgEW+T5qey
         RC9w==
X-Gm-Message-State: AOJu0Yzy/MdYJxkZ5xQpziGjkmU/bX3Soxinyx7mvBDV2m+NoWHig2F7
	Cp4nFBPtIW5kgR6T++3lYq5kq1iYOLCklA==
X-Google-Smtp-Source: AGHT+IHhr5Lixf3D691hxSrMZ/vI7JRYAa+5ohN9TH4Xj2qzrd7DpIVuQEAq0znjmRzmFNdDX3UStg==
X-Received: by 2002:a17:906:b04f:b0:a28:813c:78d6 with SMTP id bj15-20020a170906b04f00b00a28813c78d6mr1478830ejb.45.1704717172099;
        Mon, 08 Jan 2024 04:32:52 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:51 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:29 +0100
Subject: [PATCH 12/18] clk: qcom: gcc-sm8550: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-12-981c7a624855@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=943;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=P2t9CBXAvKAGt8inkQzH2zUbbJBDolk9ICGghkJynHQ=;
 b=trSwEIKyVfYX+RmgqG9/jg+Bid1vwLiLuUErE5laeeYrWo3QeO7mqYAZjK4zgrz++ge4kPk7X
 x1AS523fSMHCvrTR6Ya9NawJ3K2ddAIKN4MLzF1SNMorHbbAUvZiAgM
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm8550.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index b883dffe5f7a..4cbc728f5c72 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3276,8 +3276,8 @@ static const struct qcom_reset_map gcc_sm8550_resets[] = {
 	[GCC_USB3PHY_PHY_PRIM_BCR] = { 0x50004 },
 	[GCC_USB3PHY_PHY_SEC_BCR] = { 0x50010 },
 	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x6a000 },
-	[GCC_VIDEO_AXI0_CLK_ARES] = { 0x32018, 2 },
-	[GCC_VIDEO_AXI1_CLK_ARES] = { 0x32024, 2 },
+	[GCC_VIDEO_AXI0_CLK_ARES] = { .reg = 0x32018, .bit = 2, .udelay = 1000 },
+	[GCC_VIDEO_AXI1_CLK_ARES] = { .reg = 0x32024, .bit = 2, .udelay = 1000 },
 	[GCC_VIDEO_BCR] = { 0x32000 },
 };
 

-- 
2.43.0


