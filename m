Return-Path: <linux-arm-msm+bounces-48713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD93BA3DEF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB67B17F71F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 15:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D771FE453;
	Thu, 20 Feb 2025 15:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vINIICQt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D711DF26B
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 15:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066101; cv=none; b=I6zIE0jV9fp/H28Rhx2KwyU0MfK0YX14nBAN2a7EawakzAxotySxsUB7Hwbw/bzm/7TMuZa1ZVMyTM7zsaDIR2BFCRUtgBKpIjwmmM7IyVxMj31fZhhTcm5Brh1xZ6Xu2WGZg8ZFGaS9dqXyWZ/z0FiVfVxDPdtXhcUHwZY7Qro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066101; c=relaxed/simple;
	bh=iDnkUJ6+qKrz4yi0lcczfYKLL8cZ5N7uOIHYPvi8lfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3KVXJcP4zV5AILrVWI1cI/deq6xtBWCsgPGnmsq8sKJ/erJBQlORqF6RhyiqLiOtWWuXOJqzpRnphBOtTFp5kex2GTiTXc2kMor7G6PNEqSBwrD7Ph07Qd5eGM4BkDVyN9SBjnNUU17pDd/JoxkQ7UXg/+OneZ3ddJ+f8zIhDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vINIICQt; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dbf7d45853so168136a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 07:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740066097; x=1740670897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMexPyi4X/XFWoEQeqC/jUtxuZa+FuBdiAX8hec2Nrk=;
        b=vINIICQtPZ1LNH+8AZ6DutURhlBEGPHhCRB47+ys321ojK3YzSDKPV5H5hrSbxR0or
         SmqhQhbE9yIWLF5ezIv/62pwlG9TJ4Zht50l2IfFW14pDtR4iWlfzNRm/uJSE6cFwFW1
         3ZoX9aLGWHGkGcbhyfWj9qCgmaMuPd/skOk8fRtHlUsp4ZI/7gOSkobWJNaqvo+CdJu0
         /ZbfXMYWqyYqg75DfU0KEhaWDOrlJAyzZdmX4QGAZGzEBYKl2QG9NY+e0H+gPbffpl/M
         u+I+p/cBh8HjNSZx4myrleNepUIbUJA659TyNgeQp+gVo3KNIj1L2AvW5i/14gygDM0p
         hKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066097; x=1740670897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMexPyi4X/XFWoEQeqC/jUtxuZa+FuBdiAX8hec2Nrk=;
        b=ICdorugvelNHnz4VAD2FYzlE0up5MvikTOmcDNSaTP5AGqL70mH+BUM8tLQSsiO7Zn
         cxOGGtJ6sTmtv+5eZrE+iF4f+DDMRH5aqsCOQ+jSHlnZ4Qq8UjAzafPQSv1YWMgjK/2K
         lJT/1T382hu0j7U3jpyCYaJ/rssxwm3uykP7lwh+656ICEx0jWN10qn9jbdmBq8h8SMS
         1X3mdQZ82dubDT9rFj55bJma10D85nCHhcnFWfNIoGKNIie23KPOr4Rr8ehAPAn9bmmz
         5Q08zjjAwle9J3RJseMRak64HdTdKVvkQvfiLY2Lmv80cTiXbZmndJ7J+wEo3vqFALFr
         QwBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbXWmLWGwywJIn2891PpcSNg4xFZ0ycqsN+ssMWt7BsiNxniV/2LXqk9m6+i8A7UfpYoXINbF3HW4ALlgm@vger.kernel.org
X-Gm-Message-State: AOJu0YyMWJKYtJR4lXSqvhIfmrb3V0NpLzye1opCUvvsJHkNjsCZ+vvi
	C1XWJ4w5w75uFDyLJdw3lEqF59Z4J8CvT3DhEQ6QagvzJz4He0ayRidId+OO7l0=
X-Gm-Gg: ASbGncuj/UnC/c7i2Yd3Sgm7c+hZX7CzFgh1SrRDETS5rfHFX+uihWvAuCQtpsTSmnT
	BcSRFHPBErTyYN5rIcV2c+Ulxjh2sf216Bs1NTFBOKCKVkpt94xzzZUv9QB9ramllzegEgfJExM
	eXtB+mBvYoSR8alVyQbQ0IUMj0uokrwDeSwGTZalnlE+yuCca/DUyqRbmvf0No+w0/NSgGXMHgS
	W+MBPinM2GqmhpPtz1CKk4BQAOQljUDOsBQe26dUx2MT/7H6+1GfXFTdCmacbb/bfwxUZGG7SaC
	msDMIoLt+nhv7rxkCRp+R+BAI9fP1U+LLk8plonCIXURfzpfyC/eIyfCS+RhopOI
X-Google-Smtp-Source: AGHT+IHVrRSBtxWk0xruTGzrrqWlO/GFxEj4pebcghpMR+QZr6zgSIjoWLBIHWmQUFf2sytBbCsuiQ==
X-Received: by 2002:a05:6402:234f:b0:5de:ba38:b691 with SMTP id 4fb4d7f45d1cf-5e0361db9f3mr8506084a12.9.1740066097529;
        Thu, 20 Feb 2025 07:41:37 -0800 (PST)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece287c7fsm12097608a12.70.2025.02.20.07.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:41:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH 2/2] remoteproc: qcom: pas: Add SM8750 MPSS
Date: Thu, 20 Feb 2025 16:41:32 +0100
Message-ID: <20250220154132.199358-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220154132.199358-1-krzysztof.kozlowski@linaro.org>
References: <20250220154132.199358-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add remote processor PAS loaders for SM8750 MPSS (modem), which differs
from SM8650 by lack of fifth memory region for Qlink Logging.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 97c4bdd9222a..c34b7780f786 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1409,6 +1409,30 @@ static const struct adsp_data sm8650_mpss_resource = {
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
 };
 
+static const struct adsp_data sm8750_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.dtb_firmware_name = "modem_dtb.mdt",
+	.pas_id = 4,
+	.dtb_pas_id = 0x26,
+	.minidump_id = 3,
+	.auto_boot = false,
+	.decrypt_shutdown = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mss",
+		NULL
+	},
+	.load_state = "modem",
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+	.smem_host_id = 1,
+	.region_assign_idx = 2,
+	.region_assign_count = 2,
+	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
+};
+
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
@@ -1474,6 +1498,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8650-adsp-pas", .data = &sm8550_adsp_resource},
 	{ .compatible = "qcom,sm8650-cdsp-pas", .data = &sm8650_cdsp_resource},
 	{ .compatible = "qcom,sm8650-mpss-pas", .data = &sm8650_mpss_resource},
+	{ .compatible = "qcom,sm8750-mpss-pas", .data = &sm8750_mpss_resource},
 	{ .compatible = "qcom,x1e80100-adsp-pas", .data = &x1e80100_adsp_resource},
 	{ .compatible = "qcom,x1e80100-cdsp-pas", .data = &x1e80100_cdsp_resource},
 	{ },
-- 
2.43.0


