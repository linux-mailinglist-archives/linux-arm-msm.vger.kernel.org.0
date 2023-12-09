Return-Path: <linux-arm-msm+bounces-4100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5CE80B699
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 22:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26FF1280CA5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Dec 2023 21:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F8C1D6BC;
	Sat,  9 Dec 2023 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lkAEoxxP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B85E10A
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Dec 2023 13:56:06 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c9f559b82cso36477801fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Dec 2023 13:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702158964; x=1702763764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Xe0ItZ9gNc3ezmOAnEcbT+smftoMzThFnuNn/+rBU0=;
        b=lkAEoxxPZznLyp/1759OSQ4TMtlb6l46PbEbfi6rNL2fsCODwSjGAbZjLz1h0ePU7B
         oi8qGWC7X+v3ybIvvkzKsOPAaGEe0bi2R9sQjtmWdqoSGP2wP6PVMXE6QeSV0eLkbBDy
         p4lMcTmR27/MRz7FWynV80H4ltqD3eJfHFBYYAuqveg7MtBSYyEe2rHuq/Adg7bCL366
         3bumlYCu+bDkxeQFm8IZlsfAiKmuKzUJvjncIrezxBzYOguc4h5Bg8YFUtRSMJgTfloP
         0USUll3YfMMqhgyw8OrP2pJT8M8ndWpq98JybZQn1qV4r70YcQAbdOz3RPYL9rNXpbse
         L1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702158964; x=1702763764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Xe0ItZ9gNc3ezmOAnEcbT+smftoMzThFnuNn/+rBU0=;
        b=SHIF0lqGmT6ZCjAncJR8z4Tfic2KJY8A3OvWW15vBsPHJeKtdazCjQVkZYTKGkhYab
         rkVGJRLzPGHueFWw+xLRlcH4UWZrzpvJIHKpAQa3O8D3V13yfJr3M+mX7ny0EArR7VWz
         8+iZOF0MHg/D07DhpZZJCknmYmITAaTGgflwQvviBWgkwaQnHERApCyo5UCV/vwXT/LM
         BNn/BbnDBO9ZuM+6BblFPbaIKt1hNtGhkY+rKpXpFMA7p5SorrPUSDE9eFgx3wfsY1Qp
         8C9B6QoS3t/pFRG+r5aRKP9WY7g6SYHpRUVCaZR15H2PCpaA73Dxv+ZzZMsx+7D+Lwkq
         7FcA==
X-Gm-Message-State: AOJu0YxL2N9Rk7aGLluV936RYxBqIf9e3st7V7UY0tPcwH+5d/6HJAXe
	EHpjN9krxM+zsVPYgZ5PWMiwFA==
X-Google-Smtp-Source: AGHT+IErQmHVfNHx3Ohpg253x96JGBoeWyJxk1TcVprDIAcd3s5js6efjoe7bTTdOLUjsUL3pBlrOw==
X-Received: by 2002:a2e:a22c:0:b0:2cb:82a1:9893 with SMTP id i12-20020a2ea22c000000b002cb82a19893mr174778ljm.88.1702158964615;
        Sat, 09 Dec 2023 13:56:04 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e22-20020a2e9856000000b002ca061aa9d1sm665103ljj.88.2023.12.09.13.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 13:56:04 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 3/4] soc: qcom: stats: support SM8150 platform
Date: Sun, 10 Dec 2023 00:56:00 +0300
Message-Id: <20231209215601.3543895-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231209215601.3543895-1-dmitry.baryshkov@linaro.org>
References: <20231209215601.3543895-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On SM8150 the RPMh stats have 3 data records, but no DDR sleep stats,
which demands platform-specific compatible and data.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/qcom_stats.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 813c9f3c6bec..dd1b6fee7739 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -438,6 +438,14 @@ static const struct stats_config rpmh_data_sdm845 = {
 	.subsystem_stats_in_smem = true,
 };
 
+static const struct stats_config rpmh_data_sm8150 = {
+	.stats_offset = 0x48,
+	.num_records = 3,
+	.appended_stats_avail = false,
+	.dynamic_offset = false,
+	.subsystem_stats_in_smem = true,
+};
+
 static const struct stats_config rpmh_data = {
 	.stats_offset = 0x48,
 	.num_records = 3,
@@ -455,6 +463,7 @@ static const struct of_device_id qcom_stats_table[] = {
 	{ .compatible = "qcom,rpm-stats", .data = &rpm_data },
 	{ .compatible = "qcom,rpmh-stats", .data = &rpmh_data },
 	{ .compatible = "qcom,sdm845-rpmh-stats", .data = &rpmh_data_sdm845 },
+	{ .compatible = "qcom,sm8150-rpmh-stats", .data = &rpmh_data_sm8150 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_stats_table);
-- 
2.39.2


