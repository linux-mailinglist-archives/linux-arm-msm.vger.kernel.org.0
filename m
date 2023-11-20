Return-Path: <linux-arm-msm+bounces-1143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0A77F143B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C59931F244A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 13:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01941B26E;
	Mon, 20 Nov 2023 13:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="06ENAWdG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 026DE113
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 05:21:32 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c871890c12so30648601fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Nov 2023 05:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700486490; x=1701091290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVNRTBYkQ35refPua6fnWM3rCBTplvWDVxVAY6Q7+Wo=;
        b=06ENAWdGBeAnHR+lsgGj3XxK1mVXckIWesjfGY03ucUnLrKvBVCmCXeUj03l5U6Bsr
         2wrMSsw3b6YS28rOb8dtzwWyU0G5wk3pTEnHNEa4C4bdvUa01vw9VuiVMMPWu3NiUYdk
         JRgtARoc/sQySnlRXNVJ+icaCx3v5btjtWnnlhCx/48PXElyKNTqWuT0ruYE+YdK86ns
         woEV9DNr+n5jgSDunn847w3QFWDnBF+s7ngYAEh4BROGviCkN26SEVJSRpdACoi/sLY6
         R4PSQ1YFqcYL3u/4MfFF8SUmL96lnKlp9Jdjt/4ZPa+WC1kUQLyOUWHgObcFEERe8iWl
         zXRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700486490; x=1701091290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVNRTBYkQ35refPua6fnWM3rCBTplvWDVxVAY6Q7+Wo=;
        b=PNp56gcxLW6dBcCpGdg2HK1iEaRyFm/2sAjEt8y/0FavL0Ff1CKJ3IZH20xel2uyny
         W1Q8Ain1VCdXL+iyYBmx6VJ9dIsoFM0+nz69PIdaIA7Ro0QtiUD0V9f2EfzUVmN7CYqH
         gMdUfizpZn9Cm2799F3atmCXtyNT+lfuh8wQLZX85wPxOry2u6qpUWkP/Q/HKDTSS/1U
         yKT4ThElhh6MHO27AxgEybExDtpz6XeaodQ4hjQ0Gj/2t81HMgsgn70eWXpxTUvmJK6A
         sHHD9dN8kNMIPfbUXp36YcHquueKbQ57G/QyHafMqXMyyxKy4ZkLw/nEE99FR6nidyTq
         fo4g==
X-Gm-Message-State: AOJu0Yz+SNsqcWsKtbVNWhRO2vwvhfb3las/aojPQSRFjNFTO1EEvK5u
	y9oUZ9VxNn0ISvbd3ba4rsnnRg==
X-Google-Smtp-Source: AGHT+IGZVi5PIyt/naysMy/l3CCxHilzq5RzodgjAfHGRQrkpAQX3VzFLsaHZFvcAI1N+W9PdBBvUg==
X-Received: by 2002:a2e:5314:0:b0:2c2:8efd:a52b with SMTP id h20-20020a2e5314000000b002c28efda52bmr4357960ljb.36.1700486490289;
        Mon, 20 Nov 2023 05:21:30 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c590:a7ce:883:eba3])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c0b5200b004065e235417sm17329192wmr.21.2023.11.20.05.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:21:29 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [RESEND PATCH v5 06/12] firmware: qcom: scm: make qcom_scm_lmh_dcvsh() use the TZ allocator
Date: Mon, 20 Nov 2023 14:21:12 +0100
Message-Id: <20231120132118.30473-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120132118.30473-1-brgl@bgdev.pl>
References: <20231120132118.30473-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Let's use the new TZ memory allocator to obtain a buffer for this call
instead of using dma_alloc_coherent().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
---
 drivers/firmware/qcom/qcom_scm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 31071a714cf1..11638daa2fe5 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1340,8 +1340,6 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_profile_change);
 int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 		       u64 limit_node, u32 node_id, u64 version)
 {
-	dma_addr_t payload_phys;
-	u32 *payload_buf;
 	int ret, payload_size = 5 * sizeof(u32);
 
 	struct qcom_scm_desc desc = {
@@ -1356,7 +1354,9 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 
-	payload_buf = dma_alloc_coherent(__scm->dev, payload_size, &payload_phys, GFP_KERNEL);
+	u32 *payload_buf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							       payload_size,
+							       GFP_KERNEL);
 	if (!payload_buf)
 		return -ENOMEM;
 
@@ -1366,11 +1366,10 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 	payload_buf[3] = 1;
 	payload_buf[4] = payload_val;
 
-	desc.args[0] = payload_phys;
+	desc.args[0] = qcom_tzmem_to_phys(payload_buf);
 
 	ret = qcom_scm_call(__scm->dev, &desc, NULL);
 
-	dma_free_coherent(__scm->dev, payload_size, payload_buf, payload_phys);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh);
-- 
2.40.1


