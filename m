Return-Path: <linux-arm-msm+bounces-10384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E0E84FE55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 22:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D5AF280E2A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Feb 2024 21:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4C33B2BE;
	Fri,  9 Feb 2024 21:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iNoQflyD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1463A8DD
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Feb 2024 21:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707513003; cv=none; b=FbdFefN8TPiEZ9PxEkwhiGzqxaavuVrp655KDPwyXuZyEDeN/X3s9fihFDlT1W5F0P+t40rhp8T08qsewAiAD829xSJdxywrcgFDekn4n9cmigHOuqpXzICaTon8TswZevG6Y6/qWUUaSK7TdESdlJ23qvmq7ztmFQWNuxfIfm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707513003; c=relaxed/simple;
	bh=emlasjHcZnzrIjnafSLSnzSeNd3kwBS4D1Wpb2NJwiU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F5fI9X0fmzDiMfP8vrWCQ2S29Nonb+8h3hQZCsCT8fkTuLeWQ0aaReR/K2us8O6ITOTI9OSBlxwb3fz5sLaRowoJQ8KmXCQ7Pil8uyG9+Cog4tn6rzH+Eat5YCrl35vU3NFgvvj4uSIBFEhosHSN3iX07MLH4EnZ8/CeCBbIySs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iNoQflyD; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a38a1a9e2c0so172418766b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Feb 2024 13:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707512998; x=1708117798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2YxXA2KQwmYTykbrsMuU28ijcqoH+ICj0PO4K3eu3g=;
        b=iNoQflyDa9h+8hwiffRMHkHBj6JC98z0hs8qbYw+k3TZe2zAhzBzMoNq6bWrOC9B1W
         A7miC+LAT+jpaXJu9iscfQcPZ6QKUYFb0y3vNUXpx6EyNp/ElfFKnKsiRCWt+rLRcjPW
         SF+JLQuzx3FviG2TveKI05CqX+C+5RWScJvYpIZvp9Bvvbq/qsht3uthc85TRsPuZFaR
         J4gairJNc2urNhICduT9CughT8yF8iKvly/qOIvdXqJLngXxiv2LMWyDGJnQj+PDhkfh
         5xsWyKmceaUtwIGk32HZElWONsByN+VdCZ7MmLZvpKWhAjeccQDgg2P9gil3Wq19pwuK
         KnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707512998; x=1708117798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2YxXA2KQwmYTykbrsMuU28ijcqoH+ICj0PO4K3eu3g=;
        b=scOIWGB9Y1obOCpAYkLlkBv4tt0J4T2+1x6OvlZEZp3VnvvyTAPjhMD+fI3TEajO1y
         ngd/nmF462uuHieyOcgVWxvd9MsvWyNGuG0MmGFP+e68WSmtyCpFOh9/7JnRpre1fcHC
         fN3SHbkNzr6LD23eyDAqoUEE+42ZwY8g3WILPxbbFzSkBRs5gfJ4S5JitaWtjlhYrWyT
         TwuIhoW6KvEIp+eyNcUkYNVwyFQRKulOvwxd3dlVdc4OUJ236ZHznVzK8vf12mMxABbZ
         q64UAUpSdmokxiB8XsekufMNwFphNzCwAON4Q57OolFo65NRw54UAw0ZA20/GycojaPD
         qWUA==
X-Gm-Message-State: AOJu0YwnBShGstiFwMkz6MmXDXMjuXIuE30VscOq4USWNFlPQNfiwKlS
	0euGn8A2ZGsyx6ELursjLrfAeTKN2uMV4bzsv2KYq/sMT6n2Ebl7h4ayCO4TbyQ=
X-Google-Smtp-Source: AGHT+IHDduXE6feHEfBorIgCVQWl5Jn+Ve4Cd9AvURZgwCUnQ77qWcE4yem/H1l6J8EWd0F+RIyEqA==
X-Received: by 2002:a17:906:a92:b0:a37:f129:262f with SMTP id y18-20020a1709060a9200b00a37f129262fmr221597ejf.12.1707512998289;
        Fri, 09 Feb 2024 13:09:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUc8bLRgweiBVuk9eczSVYfpuNQRnuIh3vZjAIZUIJWRHTF5591PApKSgTs049Uhc/jfFXkI5reynt3T355snl3ywCzO9R6GuUzhr8cdA/UHQSluHSMVbSLVNCpQAmO8yEYqwrTLpyo18PgE8vBSmUYJPN0EKitZ7cetILptYZex+43rxpnQ+txWDgidr8kjTzy5DWjtQe87KAQsJGAVGSYfzhoL1F7fKlTxBwXTxe9uEfA9NmdVpKYTzbXuEjn8YDzGRw9YAryTq3wbMylQj9AuKtcsjCQ9O4cRvf7yDjj8ZUy0NC7GjlmLruofgpJ3eV7JqGDV5Au+APVQGNw2o0y9ORIEQYZZIU/j9QBF9SJw3B46MJ9pExMfZ5xVVkguDzpC0KJZTKsB4oBDAnIL+oKj4G7TSmHJ4NVtQqBBg9iMwdy/R745K0TMZYVfNlcvT/b1zr+aifH5JJDyapdG8bhpXWHGJ7atx4rfpk2y2wrEIVKwsgfSaaQ1tTWPhSdnmjH0A==
Received: from [10.167.154.1] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id vo5-20020a170907a80500b00a3be3b27d0bsm1056517ejc.49.2024.02.09.13.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:09:57 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 09 Feb 2024 22:09:50 +0100
Subject: [PATCH v2 06/20] media: venus: pm_helpers: Move reset acquisition
 to common code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v2-6-3dac84b88c4b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707512985; l=2551;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=emlasjHcZnzrIjnafSLSnzSeNd3kwBS4D1Wpb2NJwiU=;
 b=pmdE2ES1G6/MKZfX3GzMyvavVDPlN+plxhvovU/PoEShg7rUaVAZQB3iuBi0KNpybJBJipvMf
 wdDfzCVsd/bCwFW/C/FUH3PtUuslzktUB0X3uTw3kGdcrfgsmmrSVwE
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

There is no reason to keep reset_get code local to HFIv4/v6.

Move it to the common part.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c       |  9 ++++++++-
 drivers/media/platform/qcom/venus/pm_helpers.c | 23 -----------------------
 2 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 5ab3c414ec0f..0652065cb113 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -15,6 +15,7 @@
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/pm_domain.h>
@@ -286,7 +287,7 @@ static int venus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct venus_core *core;
-	int ret;
+	int i, ret;
 
 	core = devm_kzalloc(dev, sizeof(*core), GFP_KERNEL);
 	if (!core)
@@ -324,6 +325,12 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	for (i = 0; i < core->res->resets_num; i++) {
+		core->resets[i] = devm_reset_control_get_exclusive(dev, core->res->resets[i]);
+		if (IS_ERR(core->resets[i]))
+			return PTR_ERR(core->resets[i]);
+	}
+
 	if (core->pm_ops->core_get) {
 		ret = core->pm_ops->core_get(core);
 		if (ret)
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 7193075e8c04..6017a9236bff 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -939,25 +939,6 @@ static int core_resets_reset(struct venus_core *core)
 	return ret;
 }
 
-static int core_resets_get(struct venus_core *core)
-{
-	struct device *dev = core->dev;
-	const struct venus_resources *res = core->res;
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < res->resets_num; i++) {
-		core->resets[i] =
-			devm_reset_control_get_exclusive(dev, res->resets[i]);
-		if (IS_ERR(core->resets[i])) {
-			ret = PTR_ERR(core->resets[i]);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
 static int core_get_v4(struct venus_core *core)
 {
 	struct device *dev = core->dev;
@@ -981,10 +962,6 @@ static int core_get_v4(struct venus_core *core)
 	if (ret)
 		return ret;
 
-	ret = core_resets_get(core);
-	if (ret)
-		return ret;
-
 	if (legacy_binding)
 		return 0;
 

-- 
2.43.0


