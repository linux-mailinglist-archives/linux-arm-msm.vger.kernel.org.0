Return-Path: <linux-arm-msm+bounces-6624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9132E826E7D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 13:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E7CD28245F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 12:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E050C54F88;
	Mon,  8 Jan 2024 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IQs2puFS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FB044C87
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a2adc52f213so57131066b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 04:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717175; x=1705321975; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=orEW3CZzVxt/2JDSHmVp7zXCvhfiQJb49HDxyFFsS+w=;
        b=IQs2puFSkLIAfaVGiSRp30E3ty/fn0NFSqNNm523ZwDf+y1hJGIniyx83JF9NQkQcD
         q5I2WEGZkLWa6aYIrM0TzvjIle1mOeZRygRNFTJFHiOKcR+z82GDsXoi6J01Exh+68o9
         h2TuZWm20LT2Pox0mRgjwTT0qjBOP9VVn3JAUvwIJ4m9mcSpc0ZpNMvSpUFaDnAcB1D/
         XSVhZYLw/fSsLRWasq6RboSfdSlYrGjUBh2j9NvExvmNVxQJ6IT8VP7hz/6M5Y68702y
         Kj8ikk09VcqegxOaXCC03gz7YuW2xngZ1wjVvnUuoGFeLZnXIHa9gKeMUsolSeIagvu9
         gSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717175; x=1705321975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orEW3CZzVxt/2JDSHmVp7zXCvhfiQJb49HDxyFFsS+w=;
        b=ivgiLHXW3TW3eNSzWroVojoycNXKmAOgNDsSkB0i+Z3Z2Z2lkJWJmjh/zv7d1ZMLwY
         hD1eNQtahbHmH+GA7O5nJDcs6emDZAtIEbzqfygJsXvr+G3yc4gQbKOlZ11CU4JW7H6/
         WmVgvw3o8B9/0du+fQAM+fo+G7YxActNG892j897BbnIveIOaTfpT0+Vgr/zrWXQN80x
         nzNzlfUS/aJX4oIdDmnrFi9M+WmsJ12mT5c1zovnsW9RdeVb86Ld49/JaRvpAeoPON+X
         8N/DGpaPlt4X6+SgkdIadTrSEhaZG+op0f6rWYfWivLZ3Nwciivw+oeVZQnPKC96tijp
         qhKg==
X-Gm-Message-State: AOJu0Ywlll9urT3D0xRfDuWlMtsNULOY8qDjk1ubkg20DFP0yfV3g3JL
	P9ByRuvZvOxXmXQi8qeCTL4MxCLKzomG/A==
X-Google-Smtp-Source: AGHT+IFDeH1FYnp98jj2eDmDzR2JMVj0P24xC2FKdZfmi5I9FBnMeoL+P9boZfAEyZ2P0Pg3aejUYg==
X-Received: by 2002:a17:906:7c83:b0:a27:a236:8be with SMTP id w3-20020a1709067c8300b00a27a23608bemr1735438ejo.3.1704717175772;
        Mon, 08 Jan 2024 04:32:55 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:55 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:31 +0100
Subject: [PATCH 14/18] clk: qcom: videocc-sm8150: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-14-981c7a624855@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=851;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=vIWWe4F0QFAfFwANwsubp7EQt8hjOIin+CjR28FQWLE=;
 b=389KJlGYvuA+BfdullvLtbyrqDDJmucrxQl7l9ry810m5jTGduSrtabxXx2licUEVOwJZYSK7
 X4b0VokWRZCC1Frf0C0nHnc7OtfKmRYHp/dEeMz5wCKdo2kVK+TB+J2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/videocc-sm8150.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/videocc-sm8150.c b/drivers/clk/qcom/videocc-sm8150.c
index f1456eaa87c4..bead5186a5d6 100644
--- a/drivers/clk/qcom/videocc-sm8150.c
+++ b/drivers/clk/qcom/videocc-sm8150.c
@@ -215,7 +215,7 @@ static const struct regmap_config video_cc_sm8150_regmap_config = {
 };
 
 static const struct qcom_reset_map video_cc_sm8150_resets[] = {
-	[VIDEO_CC_MVSC_CORE_CLK_BCR] = { 0x850, 2 },
+	[VIDEO_CC_MVSC_CORE_CLK_BCR] = { .reg = 0x850, .bit = 2, .udelay = 150 },
 	[VIDEO_CC_INTERFACE_BCR] = { 0x8f0 },
 	[VIDEO_CC_MVS0_BCR] = { 0x870 },
 	[VIDEO_CC_MVS1_BCR] = { 0x8b0 },

-- 
2.43.0


