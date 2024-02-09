Return-Path: <linux-arm-msm+bounces-10395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BECE784FE78
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B7A91F211A7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 21:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E684439E;
	Fri,  9 Feb 2024 21:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QikG+afM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A3D28DD6
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 21:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707513021; cv=none; b=EBzmaAsiQ+Xg85AOadJLIQFwZUkqqgydMLZDG32bAzJESWLKGLT3WqYarfSG6WgPcThMcDFFUom0NG30XTu8IkuV85HOkzA9reWvw8yek6WLbzzigtjbv7d6cbA3r04RX9vkIFy3cNES2zoyido3G3qwk6jIhsMpXbJ9/ldhvQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707513021; c=relaxed/simple;
	bh=MLv2EGPhgvWgejpl7fbRFyjPDkfZHFECDfabJtkG8Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qs+dyITj8d3F15tfgAEoU9mH80fuGx0mYwe6zuyE2eUjP5zkaYj5Lj4FvGR3iwwRwoUc9o95GcOI9obR/jeiW9h4ZzqMm0TJ1bN+Y2C/aJog9GrbXNWwCZDGelsO3QYvXwaFoGZ9FkMwxVOawYq7SxVukfS5mil99bQ+iobRFLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QikG+afM; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d0d7985dfdso19087181fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 13:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707513018; x=1708117818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AlA4ayOmstDeitRRZ2W2c5UllMpUVoGUwWdDkp9v1as=;
        b=QikG+afMnsM1kIM/Nzem4BffRaN2JoYMSspKt/5ZFkD4LBq8mEIg5ArRpYZCjyLS2m
         K4Nyr0q6AczPm6A3PYrol7Y9+el4d3dCsMdRYuEwyJI4mfmfbfie2dV/u0BxLGDd3Ev8
         VhVcET9DcD4HCBR/d8122dlICEbLTRofa1vWifljz63CP7jo6xxnvzrA53rl8MdZHFmO
         IoErZn0/F9b8/XffsEeTyNoxh3iKlzKSfsky2FqqFMt49ZVDIUwnEp670e18JVDA/NGL
         iYzJm1ypLGQIfkVxWMmxynf0fQfUi16b/SOEgR74TdhS3vdpG3CiZtL8FHkTuYhhE/Sp
         n+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707513018; x=1708117818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlA4ayOmstDeitRRZ2W2c5UllMpUVoGUwWdDkp9v1as=;
        b=A7XzFeq4KLFLu01vuuZ5N8dDZpOy6OumqBVwWrlE7sWjqJyX/lkE80g7jmYfoZJEao
         PVz8+sR/RfEUUU1CpNpDbfAto4GJDCXd/Ntz+7CpZx+OEyOVu7CKL9mxspAkY/bhdk+E
         3lXOBHzHoIplWR0UU6Fvspoz7vRGYKotgPm7QIof0XmSgK8lQM/OFUZb33XIJYZxIfrJ
         b5Qn+pRxjTGJlzfS/NkKyrcGqvqBi663zlBsp3Vor1gFxUjJLSQ62dSqoA00xYOu608A
         mgS0+omknJdvaN1/SpDDykWKjSFQPRGwFv1xDNtH6vEYSj5tC73/ANMnRLtt2X/1HSOz
         1hcA==
X-Forwarded-Encrypted: i=1; AJvYcCXk5fGhOhFroSjxqukZN+evuXQ/nWmLlbR3GejSDY3GJTOam/Uv5+UaI7exbVdajMVsrI5pJozI36n2jK82ZD2ICgUXG3x4Bqmmx7+lpg==
X-Gm-Message-State: AOJu0YwCZf1XlK5SFykeLOPpTKFlSvQ7cNeFF8Rjh/5ne2fRsfiNWYGQ
	i1s3fbHMepwwUuMpv8nA2yQs3flHXGKHYGhOWmV/Kr+NrugGOMNbKj3BnfJil/Y=
X-Google-Smtp-Source: AGHT+IFzzZN5KL4cYG0hicyLZubpRFb4oezMjYE5cyxLTyWE7sgQ6y2pJ7SpOmZIS/sM1SfYlpEBjw==
X-Received: by 2002:ac2:41ca:0:b0:511:1ed7:61b8 with SMTP id d10-20020ac241ca000000b005111ed761b8mr138919lfi.30.1707513017891;
        Fri, 09 Feb 2024 13:10:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2vSXOWP0zPTdPzgr2OB7mO2zO/BBUb6MycDmMBo7iyCA2zGdMN08BEZkTi3oXHkq73Gyr6mJnMewJbhfCN0g3QgXHZE83t99O5gMpRiQ+ubauJZ069Kj4IH0j8fil17TwydvqiE7EyqiHHrOb/UA6FKnEiZJNKUHfSjovojWbyHOaHpYLii5mg5HTYW7nYf+rwGwyLwvqeDf1RQg7qpkrwja72n3pUtqIarC6ZjSKd4ffjkRFoiuj56ZKnjT/NP/f/8Z7Cz/WRodOnc1SJRsNEluaneAid6a1yoUhjvPYmgC+F+JBPRVdYbOgsHiruBK3bZQAhNDQYK785jNLXe5rGkMh/BRIzhzLhpTZGDUElUAvyrdhRYyVi3ScwZqKb7xeDiYH8VQyF09qpIx7yzzyWVUUyyS2pC1mZeifVQSKzHq/GzWUaMD5FLcw6vXU4ZCR86UO3Q19vs4Ql+yePMEtaF0N1jyReWzrh5HwS6usTMkP9XL6XtgESVKeiroCgPHkCQ==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id vo5-20020a170907a80500b00a3be3b27d0bsm1056517ejc.49.2024.02.09.13.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:10:17 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 09 Feb 2024 22:10:01 +0100
Subject: [PATCH v2 17/20] media: venus: pm_helpers: Commonize getting
 clocks and GenPDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v2-17-3dac84b88c4b@linaro.org>
References: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
In-Reply-To: <20230911-topic-mars-v2-0-3dac84b88c4b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512986; l=3311;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=MLv2EGPhgvWgejpl7fbRFyjPDkfZHFECDfabJtkG8Ts=;
 b=nU5akJ8S6NPlZWhfphKzyqepTvPetn6PGSgT5P4fuPWJfhCa9tlFcNZQek5SuRx1S+ZmHp2PL
 7G4hT8ZVxMODhmSzX/S3H5V0Bz6ZahTDetAMN4Kw5+Ry9JuFZHzA73m
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

As has been the story with the past few commits, much of the resource
acquisition logic is totally identical between different generations
and there's no good reason to invent a new function for each one.

Commonize core_get() and rename it to venus_get_resources() to be more
meaningful.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c       | 8 +++-----
 drivers/media/platform/qcom/venus/pm_helpers.c | 5 +----
 drivers/media/platform/qcom/venus/pm_helpers.h | 3 +--
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 680674dd0d68..873affe17537 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -334,11 +334,9 @@ static int venus_probe(struct platform_device *pdev)
 			return PTR_ERR(core->resets[i]);
 	}
 
-	if (core->pm_ops->core_get) {
-		ret = core->pm_ops->core_get(core);
-		if (ret)
-			return ret;
-	}
+	ret = venus_get_resources(core);
+	if (ret)
+		return ret;
 
 	ret = dma_set_mask_and_coherent(dev, res->dma_mask);
 	if (ret)
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index a292c788ffba..1cbcffbc29af 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -326,7 +326,6 @@ static int load_scale_v1(struct venus_inst *inst)
 }
 
 static const struct venus_pm_ops pm_ops_v1 = {
-	.core_get = venus_clks_get,
 	.load_scale = load_scale_v1,
 };
 
@@ -395,7 +394,6 @@ static int venc_power_v3(struct device *dev, int on)
 }
 
 static const struct venus_pm_ops pm_ops_v3 = {
-	.core_get = venus_clks_get,
 	.vdec_get = vdec_get_v3,
 	.vdec_power = vdec_power_v3,
 	.venc_get = venc_get_v3,
@@ -920,7 +918,7 @@ static int core_resets_reset(struct venus_core *core)
 	return ret;
 }
 
-static int core_get_v4(struct venus_core *core)
+int venus_get_resources(struct venus_core *core)
 {
 	struct device *dev = core->dev;
 	const struct venus_resources *res = core->res;
@@ -1109,7 +1107,6 @@ static int load_scale_v4(struct venus_inst *inst)
 }
 
 static const struct venus_pm_ops pm_ops_v4 = {
-	.core_get = core_get_v4,
 	.vdec_get = vdec_get_v4,
 	.vdec_put = vdec_put_v4,
 	.vdec_power = vdec_power_v4,
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.h b/drivers/media/platform/qcom/venus/pm_helpers.h
index 3014b39aa6e3..7a55a55029f3 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.h
+++ b/drivers/media/platform/qcom/venus/pm_helpers.h
@@ -10,8 +10,6 @@ struct venus_core;
 #define POWER_OFF	0
 
 struct venus_pm_ops {
-	int (*core_get)(struct venus_core *core);
-
 	int (*vdec_get)(struct device *dev);
 	void (*vdec_put)(struct device *dev);
 	int (*vdec_power)(struct device *dev, int on);
@@ -28,6 +26,7 @@ struct venus_pm_ops {
 const struct venus_pm_ops *venus_pm_get(enum hfi_version version);
 int venus_core_power(struct venus_core *core, int on);
 void vcodec_domains_put(struct venus_core *core);
+int venus_get_resources(struct venus_core *core);
 
 static inline int venus_pm_load_scale(struct venus_inst *inst)
 {

-- 
2.43.0


