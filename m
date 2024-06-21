Return-Path: <linux-arm-msm+bounces-23588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9E5912725
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 16:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5973FB21063
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 14:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F311B7E4;
	Fri, 21 Jun 2024 14:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JOHyWcz2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D042F2F
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718978507; cv=none; b=EVDimBWhJoFqbEhIJRb96s9mQdXPwjn6L1HJU/iFumcmKtgvldpVVp54InEoBFRjnmQhu7ohesCSgMf7ANmYKdHdxryWmq8ySQfSanlUfLNAT8xAWUz1vAwWR703LeX9WRd8HDRws1ZmhwWve3gZj6cWgz+8Tq7aG3LTv50wyG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718978507; c=relaxed/simple;
	bh=o8Jk/KDgS55zSjUEldegAfGbkL6Ys6e48LJPFBGTp74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V2wVQcQU4Ca5iF4bVed9U56XGiNbNFw9zBw61IDCWxgnFkMkLbcm24N7uSMZSAl9sokHEo2ZPire1Q0KK3Mt1BPl6jsPP29Pkbsg8qL2eZmEsbjrt4OcH8TzdxOwiAlm0n/LPXwAqcfSjCaVSh8dLoFI3pit5cOw9oXOEbayQrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JOHyWcz2; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52cdb0d8107so537118e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718978504; x=1719583304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVyK8gM5VJzx24ZCzyzdqKTryh1LaYBXMgMLguRXSY8=;
        b=JOHyWcz2q+d8RRzLnuvRvRtvMq9p4cEd9f4OeB4sGyy+ewVgUpBpBYhahbsQXb/Xxl
         +OVg+J346NSnVcDfzJhfhKUDLXNG9DSdl+y8S4cJNIArYsI4PStNcT7ZKvh1x8dFjLaM
         zSrDMj2382AJ8vJIIS5fHhbGDk9DbLV4VOlYAYfSgjHUDAIOTFOSJuRDE7t5enwYSuHj
         hMqQawQcQBT4KZT7sr35smN+4fpptxtqG18xkEFb8qaAgG6/uNnx1ZHeS08iAa9Ova3+
         icoLi2rORUktZ/jXjnCFOj/NecbiI042eKbeWIa9hcyXULx1EpBOuts2PpJ9/+AQdAIy
         tqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718978504; x=1719583304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVyK8gM5VJzx24ZCzyzdqKTryh1LaYBXMgMLguRXSY8=;
        b=gRKHoUG41Xp/RRsw6hEgd3hjeuADrf9+7uij4/j9tRp3gdfEQzFU+X4ZOjgduo4LF3
         8CB1AmL+7Q08Hnt/mhKZOM5IKDc20wiKyR7xLYClF5esG1I2DakNUnwoGDXcUOGPOHTS
         EN+npvdQPmFF4J9sWcgdgpWYfOHON/k2RN3Zt+OASZ2Ae9CeuE5K3cKqiAV17efPrt/k
         ZACtUj561D8VPKYH8ift+alWGmomKfZhFJFuByeU7l+BaCqnDX8duHtuqWiWL4mFs908
         MCY5pC2IKSfgIBVvVZtItjf0BCEJyusoy41x5zq013JpXrxrl2CcANT7ltr5OCfgu9PY
         UCVw==
X-Gm-Message-State: AOJu0YxGw5BW0RUnF/VBGvuHtx5OD1aSpM9FfQxjNDg/fg1SIQRpKYQJ
	2/kxZ35YksBpOtyaRfZ+0oe4ijD+9u3m9x4rRkZW7kTrHm5qyFWrN6Y2zrOcawI=
X-Google-Smtp-Source: AGHT+IGn90Vc/K7XSYxwzxsNwSduYALlV+IHzILL024upvXUNpV36AAp+B2C+5pdwrjg6G3MFeWPWg==
X-Received: by 2002:ac2:4317:0:b0:52c:8944:2427 with SMTP id 2adb3069b0e04-52ccaa61fc5mr5134234e87.31.1718978503388;
        Fri, 21 Jun 2024 07:01:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f6722sm1847342f8f.24.2024.06.21.07.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:01:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 21 Jun 2024 16:01:14 +0200
Subject: [PATCH 1/5] clk: qcom: dispcc-sm8650: Park RCG's clk source at XO
 during disable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-topic-sm8650-upstream-fix-dispcc-v1-1-7b297dd9fcc1@linaro.org>
References: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
In-Reply-To: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2843;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=o8Jk/KDgS55zSjUEldegAfGbkL6Ys6e48LJPFBGTp74=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmdYfDnD+UDG34Hq8SxNde8xLsCxAmu9Zzo8CqFw2x
 vfwtYZyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnWHwwAKCRB33NvayMhJ0a+pD/
 9Pj5oFBpclrEjkPLmY5u7a/C8FuDKtb2YBM+SrWBilpqGoUo0F7A6U3iuqvpvA/6GPGRHwZMKnC29X
 8W4OWwUwIiJnc6a1N/3J7eZC4OFE0HwiWxiF8dVPKj2BPNeTFVungpupJ11ODK9ZzzgpOAqNZYxyXV
 YDTvyJCvFsgMmL18Es62eiNbTPkMnvayk0DJz+LYkDIXNrFmHaiedzT8yZM9yF2ONkfXCJfzeGAQ8q
 cHW2OkAgRWDu++oL8SpOrjFCLRVZcziUXvVgEfbNUe3Pns64y2x4meC2s6bEksj/xjm3j9ErxzUU7u
 T/0ffojPHMAm0SV2uFDOKAyKE/2lyz5IX5APxaup+sHUvTBNs9+AssqWTzYWcpHOd4sR32iNL6Xiut
 GslGCicZPdBgBMneR2p2n9HYLHPbyQakx7d6hf6r9l+C0oXrVLMv7EagnLsKwPMT6Wz6DmxhxS+CWi
 sf+vnBr9jxhSV049aCdjNWAFf3sgI4YUBNH2NxwjjjaE0hh0SNPLVKCry7MGDRch5lacgjX+3HOaAm
 pdSxpk8nfzFL5KiCZgLSGmoUVGQz2p2UEnlaJNmm44d+K67vFfLDUdD+ACJGxvkN+AZPKFGhKEIz1h
 A3UFwwqKlZ8stW01HdW1tTBMhIE90liIIBRv2wA2JLshPH/wQTGpUAo3f8cA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The RCG's clk src has to be parked at XO while disabling as per the
HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8650.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index c9d2751f5cb8..31c82f791b44 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -339,7 +339,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -457,7 +457,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -516,7 +516,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx3_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -560,7 +560,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -575,7 +575,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -647,7 +647,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -667,7 +667,7 @@ static struct clk_rcg2 disp_cc_sleep_clk_src = {
 		.parent_data = disp_cc_parent_data_9,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_9),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -682,7 +682,7 @@ static struct clk_rcg2 disp_cc_xo_clk_src = {
 		.parent_data = disp_cc_parent_data_0_ao,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0_ao),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1


