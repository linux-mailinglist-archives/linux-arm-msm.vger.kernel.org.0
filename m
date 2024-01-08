Return-Path: <linux-arm-msm+bounces-6625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3293826E7F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 13:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D3081F22D1C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jan 2024 12:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11755576E;
	Mon,  8 Jan 2024 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b0xjjUrj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EE454FB3
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jan 2024 12:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a28fb463a28so166558866b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jan 2024 04:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704717177; x=1705321977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=muMibjVOlrdUaMKZav4q1ZM93Uv09LtyKsx1ZeFf7Ds=;
        b=b0xjjUrjL9DFSFXL/wLA/LY+j+ceplfKfYGxRZCWSSkf4KrFMByto3tQAnWG7WF3Oo
         qNhgxVD626dYQBqeGeTAs0JjZXeT92kdQ7M8BNh8Encuaixa8170JAJi8DJboQ15/GK+
         tCFSvnSCRPHBsON8SwxHpHxgE4XsKOgVtBee5LEk9o2xIZY7HWvccu8bRGkohnO7EFZw
         g3QMEM3XGTEFBnpV0EipkLSmhCVhGKvcNuJbaVsUN3umiavj6C02+hd8aXwkk+SuEIx6
         zm2sC5DiZMVAZgEZH6fGe1ZmeWO9VYExp4LYfuu2owfKE7vs+3KCHcxfCDjGwc02i/mD
         U9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704717177; x=1705321977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muMibjVOlrdUaMKZav4q1ZM93Uv09LtyKsx1ZeFf7Ds=;
        b=Hl1sveY8tIl4NPjwJNrXwmgbl/704CllQJYhpps2fRp+3IZSwLmom6g+4t5yQX7Se5
         oSNoNazpLxIsi0ZPY2D6zRY8X0Sg/zj+EBeAetQxy0ypQGrmy/yHLeaboKjJxYW9Ty7s
         cMVcBF15PN7hk6W6QiPZ2Jju4nVBS176LGLdB317jhIFUqoTz7y/2XjIV5oBUgo3ThYB
         BG0Me/Spm7JjHh4tv61Jdn9KX0kpoXzjD5/LezcE4xk+jdmYpuPIMao1GLGrJdxtI2nH
         e6S9w/CxpkY4tYDbUK+eHTj5jyvgOdc8GcfSRODoNIBzORydHOg1+aBdoF9g42doQFbA
         NaQA==
X-Gm-Message-State: AOJu0YwIbCV9fHKLVHHmdxem1d9n6XqT1x/huN4ibE+tX7gjxHvZJo7i
	ylWleoPzRto89FK8fl6OQD/0+QA2frqjoQ==
X-Google-Smtp-Source: AGHT+IEQsSRheGxkkY3GrjQPlqIAGXYcg8bZfwQ+m0y791JrsvBZnusA7jjqQpqLw7bCQ2jIeJ0r6g==
X-Received: by 2002:a17:906:d9c7:b0:a27:5343:d3e8 with SMTP id qk7-20020a170906d9c700b00a275343d3e8mr1565354ejb.97.1704717177663;
        Mon, 08 Jan 2024 04:32:57 -0800 (PST)
Received: from [10.167.154.1] (178235179081.dynamic-4-waw-k-1-3-0.vectranet.pl. [178.235.179.81])
        by smtp.gmail.com with ESMTPSA id bs18-20020a170906d1d200b00a2808ee8ab1sm3892978ejb.150.2024.01.08.04.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 04:32:57 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 08 Jan 2024 13:32:32 +0100
Subject: [PATCH 15/18] clk: qcom: videocc-sm8250: Set delay for Venus CLK
 resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240105-topic-venus_reset-v1-15-981c7a624855@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704717148; l=1037;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=2KXDcxNc+90aqcYluynodpAmNWUtQOGZRI7j2BxqGMQ=;
 b=WN9XeTGGuiUfbvj4nBcDQjejD3CIJUS6NiBRUbn2FemiDEACbGE4J96REq+UinjEvvWivtYQu
 602fsQTEwZlDE93JNX8sWGYvvf9MY83qr1tEbqLarWRc2WKK42w+u6U
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Some Venus resets may require more time when toggling. Describe that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/videocc-sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8250.c b/drivers/clk/qcom/videocc-sm8250.c
index ad46c4014a40..51b9816ec458 100644
--- a/drivers/clk/qcom/videocc-sm8250.c
+++ b/drivers/clk/qcom/videocc-sm8250.c
@@ -323,10 +323,10 @@ static struct clk_regmap *video_cc_sm8250_clocks[] = {
 static const struct qcom_reset_map video_cc_sm8250_resets[] = {
 	[VIDEO_CC_CVP_INTERFACE_BCR] = { 0xe54 },
 	[VIDEO_CC_CVP_MVS0_BCR] = { 0xd14 },
-	[VIDEO_CC_MVS0C_CLK_ARES] = { 0xc34, 2 },
+	[VIDEO_CC_MVS0C_CLK_ARES] = { 0xc34, .bit = 2, .udelay = 150 },
 	[VIDEO_CC_CVP_MVS0C_BCR] = { 0xbf4 },
 	[VIDEO_CC_CVP_MVS1_BCR] = { 0xd94 },
-	[VIDEO_CC_MVS1C_CLK_ARES] = { 0xcd4, 2 },
+	[VIDEO_CC_MVS1C_CLK_ARES] = { 0xcd4, .bit = 2, .udelay = 150 },
 	[VIDEO_CC_CVP_MVS1C_BCR] = { 0xc94 },
 };
 

-- 
2.43.0


