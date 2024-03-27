Return-Path: <linux-arm-msm+bounces-15439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B37888EDDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 19:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02A3F2A2A9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Mar 2024 18:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442FA153BC1;
	Wed, 27 Mar 2024 18:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nLpe09sy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F07153825
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 18:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711562956; cv=none; b=UdVV71fJSYmSumzOKBJnwrqSV7dsUqg8/i+gPfE4mUh627H8KtKhuXyehnDqVVD+eZAkyOya+ul6YQTqKHeOO67Xhyn8k+wgr0G9MrEKwRGTv7XmBCjlXGGZCUVRarTx4hJTnQet7zzQQXlKqZn8dAUloo0LGEKzhBHrqZtgzII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711562956; c=relaxed/simple;
	bh=N/+DdFoVCHF23AQ+OjDZ00SaK75sELYmsLPOH0p2aT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PtfmK2BeAdTtkby3+8x0rDJaBNasnb53HPctvtYmcF5r/SsT6GBaD76bBgoCzFoUg0e2o+wAf9UzmNBwzsC5biwiqL0bb1vjDSpWAPRSyH5H6TxA9OXeCMu6fdLOoeVL0IvMuF9c2v2nQjJ2EJYUVepfOl2ZgaW1vVFnpneeVpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nLpe09sy; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56b8e4f38a2so144106a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Mar 2024 11:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711562953; x=1712167753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/CQd/17iJ2kwXZI1u99C8d+fll4NuRn/euAOmsXPlU=;
        b=nLpe09syAhOCWd9tQd+MwornteZb8fNr5WtkOEhJGMVdkuksIVwiE0gddSqAuOe+1B
         gVL4sQE3VZj/f9sNWnSZcz6rmCvZ+6vF0Zgt//X+0KT/oxbro5QATKyq0DDgbi7I/67X
         ICc71XRNgOG9avnZ8+Aw+xWLbSNAL0QW0SiMqCN4UlXucWDnkZXqN3G4KHtzF5lEUveJ
         ZIIxIzD3uCNBYA6zjCPdQK0wt42Km/LXj0EZbymsC6Jw59Mb/vVcMGlQAYaofAjzJAy3
         m0lhGonDUAv7jG54pe6PgwYADePQ8Ojeov2GGT9uTI0BCAgCkAsv7YBcGFBk/AAilmrJ
         ln/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711562953; x=1712167753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/CQd/17iJ2kwXZI1u99C8d+fll4NuRn/euAOmsXPlU=;
        b=aUirCOjGT7q/kV7sApgqUMAioepuejuCWbDGRVUpOAi9XhlfUiJPUoGHQnpzZ79ODL
         n3K6tlE4lDwlSD9DvuoLUhVthIG1euBxvvUokZVcjYH/yEtDiN76n0p1x6oTVAGu6wtz
         d6pQVdwtU0Np7GjKj5tPirB68JW8Lvo9CBaSz9hXNi2NWMt4Qb8vAd6r3S7H6tH3BnvF
         c1kDs8Ds6wNsV+ukpWYxegwNxIgoLFPIlRQwkL/bFVpcfCrofcY630mPKHGtLeJwrD7G
         V9syHOnFBz8WXXwGNG3GIr6TQ2lzgLmMrnk5UY7jD0hnRS93O3xz1wdsODnoMzBK7jrr
         jYFg==
X-Forwarded-Encrypted: i=1; AJvYcCU3HjYhMjuZrON+VZo+Cl2u5rPuoacpBgG7Hbq+nPhA7DbAKO6lUpO9MBWHFn58oXAElKD+cx8Sr3Ut/amFbOZcWfzfCunGFXEXsIDKjA==
X-Gm-Message-State: AOJu0Yz2BKVv2EsYJWS9D0JPpTs5t2Jk90wnTKD0HR94UFRvPR6xI4yP
	Bu7Q7CtgcKZaeiDQgX6aAOHaw27UaXf5nF3MwXiq3ZYKMDK4NMkfnwTwfrtNIuY=
X-Google-Smtp-Source: AGHT+IFlkgzqIP+Q1UG8pVb70TSNRnC5zHkS+ExOzcbgp11+GWgEylpMe38xvrUC1mvRu+IwuYKU1Q==
X-Received: by 2002:a17:906:3c51:b0:a46:e595:f357 with SMTP id i17-20020a1709063c5100b00a46e595f357mr189730ejg.9.1711562953062;
        Wed, 27 Mar 2024 11:09:13 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709060be200b00a45f2dc6795sm5702733ejg.137.2024.03.27.11.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 11:09:12 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 27 Mar 2024 19:08:52 +0100
Subject: [PATCH v3 14/19] media: venus: core: Define a pointer to core->res
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230911-topic-mars-v3-14-79f23b81c261@linaro.org>
References: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
In-Reply-To: <20230911-topic-mars-v3-0-79f23b81c261@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711562924; l=1808;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=N/+DdFoVCHF23AQ+OjDZ00SaK75sELYmsLPOH0p2aT4=;
 b=1gxBTxoz/cxrMX0RUDFm+MPnu8jLxtNwBQRjFbmiKwfrMWSZ2mUQ6GbUHNJot8qeaX5xQ5sw6
 0G9hX+ocBcYALouuYtXDuLwShrMO/8+6DguNAgv1Iz8Lb2t+ZwkTf/2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

To make the code more concise, define a new variable 'res' pointing to
the abundantly referenced core->res.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 5b18b1f41267..e61aa863b7f7 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -285,6 +285,7 @@ static irqreturn_t venus_isr_thread(int irq, void *dev_id)
 
 static int venus_probe(struct platform_device *pdev)
 {
+	const struct venus_resources *res;
 	struct device *dev = &pdev->dev;
 	struct venus_core *core;
 	int i, ret;
@@ -315,9 +316,11 @@ static int venus_probe(struct platform_device *pdev)
 	if (!core->res)
 		return -ENODEV;
 
+	res = core->res;
+
 	mutex_init(&core->pm_lock);
 
-	core->pm_ops = venus_pm_get(core->res->hfi_version);
+	core->pm_ops = venus_pm_get(res->hfi_version);
 	if (!core->pm_ops)
 		return -ENODEV;
 
@@ -325,8 +328,8 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	for (i = 0; i < core->res->resets_num; i++) {
-		core->resets[i] = devm_reset_control_get_exclusive(dev, core->res->resets[i]);
+	for (i = 0; i < res->resets_num; i++) {
+		core->resets[i] = devm_reset_control_get_exclusive(dev, res->resets[i]);
 		if (IS_ERR(core->resets[i]))
 			return PTR_ERR(core->resets[i]);
 	}
@@ -337,7 +340,7 @@ static int venus_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
+	ret = dma_set_mask_and_coherent(dev, res->dma_mask);
 	if (ret)
 		goto err_core_put;
 

-- 
2.44.0


