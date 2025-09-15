Return-Path: <linux-arm-msm+bounces-73565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7A1B577D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B93813BD220
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 11:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE4B4A23;
	Mon, 15 Sep 2025 11:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="MWK5OpOa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0212FE596
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 11:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757934939; cv=none; b=NuGdIngMC+/0Nx9x6OakSp6WbK/hrU/7ed+XuViObqRc7CVy1h+CyQSkWFMQtmNXxQhMumQu3DDgwFSArHtPIw+df6HEpGHYjc5Dwj/UXrPUFxp34FgtUuzSjX/O+nyyQRVnhxcZZB5czphedh+su0w3aU1QjtsgGV6jY6eNHMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757934939; c=relaxed/simple;
	bh=+N860jjILz9WjHBmzobR6cwMMc5hddgDbocup4wZWZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BG+W0ZLKVWt9gbhjdSi9LxFc7gIZ/KmChZ7gu1CLsjYWAD5fORp9Ww9WNNi4BM0hKUv8pXqyVXFDB5ZHKQSw6FAWoeeGgfyf6v/6r4qnUnVVx/XXLoxp9Z9Yqu+Jw3f2D8jXiQw4niKSUNbgIc9G2uBprgeVICOVhJD8sy6xlZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=MWK5OpOa; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b07883a5feeso694370966b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 04:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1757934936; x=1758539736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0bwrK+W/kVJgy2ql0Fi6gGVV6KZbMNKdsTPaoo3b7DQ=;
        b=MWK5OpOaIlc1OEADg7O9mJxX2UG99rpTo5ip+3avrMeahnidtn6WmAdYPmNRQRSwqq
         zlwBwS5Yz38B6ragbRRG33mNEAXvOg6C+lmpeoK4qhscaqzezgITxvZ4uRe+zbUBfmPi
         9HJR1o4FOuFEoRMVM1CB0qmbUBc7ZjWa7DuBcX+M1ClRYQEP0r5d7CIEB5lyel+NFtA/
         4n5uGaAPSN73J8zR8uQp0vsiwKfQA++wcsa0LvohFmOuNiTd47Qoo5NCEnZ7+OpUwd2M
         MM1nJ+LNljPBlyaoR/j8MwGf4wZT1xnHnrwlskI5idfdGELMoAlmbeQr8AIjS4drUx6H
         q2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757934936; x=1758539736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bwrK+W/kVJgy2ql0Fi6gGVV6KZbMNKdsTPaoo3b7DQ=;
        b=N9c1iV17D76IwecTNFW1xImruREsk5xK/lzN/stg55xIqLdRDPLmC84pNx44Gui1KB
         tKj0FFgRtKGDg/ZhszuN6aStmXM94Ks5l5h91hkw9Dbsydu5avjLEZBEOd1EU/7vyapD
         CyVOHoNqhZwCyybLPLJ92MgjcRXp5XF0rjNJNrr+fLSAm8fCmyzS/YD4Gvw3UMjAy75Y
         8NR8DEzKcYlNrFf4tbz5dWFM83AZiKvJFtS2mnC/L4vU66r/JxC1G8T5gO+2MRn0lsGt
         RUz4ZXkEAzJmnOgv3tIfgt/r3C9ccEq6P6afiQ4COc0JrbrP73J9OdWwQ/UrM5PgKg2m
         1Fxw==
X-Forwarded-Encrypted: i=1; AJvYcCXmsiR5c0IfvKHYpGQb5jZHG4/hLWH6WlLOYSXO70SYuhbhiR6xeokWDK3+nFhx9Qlfzh222apjylIWpIQ1@vger.kernel.org
X-Gm-Message-State: AOJu0YwjgFFuZSmn1JR7OmGU0AhhRwDVa6qFjnhDxJ7agQzTyQIiiJf9
	ileXut5L8oT/J6PuNFoV3Au4rmZ8M2pOTgZSk5vrVk7unAEWKtQV39Z7MH5RwdTl4bg=
X-Gm-Gg: ASbGncuDiq6jG7P0CglNpBgB/IFHRGyt+Z9XA2I31ZGeL8EbYO8FxhMelYLm2RSEJOE
	KrzVBhPs+LlDn5bNMdyxvydMGOjO6hjCRbBvRe6RkF/i4nHb5oCJ+darwtssQ8WPzsT2sjF2iUe
	v5j04pixwDIodXR5FrakWJmzC4RqqIPO3duqyyGEOdEopuO/JVZAU9pWPcm+l0QYie/hZ06Syee
	xuY1/q88OnNtI0kUTUXMcJg3OHQ/KMynTOyNsHOu4jrHb3AJwUpGECNftNY4IbNakaGb20bDKLt
	gvZuBjfYPmln7Y8RJgpngaLgflbU3uMh+Mk85LrSVOmrgxHIkgnPUOjW4VEWUfxhqmIQLfYWmgi
	huLZdGhCWnE29c2BMG2VP6FLXqy5HJxYs6Zj/qt0NYBb8OwjzzwywSiSyNbFyWMZBg86HBzH8bR
	Mmv1U+
X-Google-Smtp-Source: AGHT+IEmXxvaJJ9Thsbd/yEZn6zSBCmcT2cqQGQCUUMD42XZdQIGQ90LE23Fm93l8b7j1T6PqUPG3g==
X-Received: by 2002:a17:907:983:b0:b0c:a265:c02c with SMTP id a640c23a62f3a-b0ca265c314mr699765966b.12.1757934936083;
        Mon, 15 Sep 2025 04:15:36 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07d9e18c24sm561851366b.61.2025.09.15.04.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 04:15:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 15 Sep 2025 13:15:19 +0200
Subject: [PATCH v5 2/2] remoteproc: qcom: pas: Add Milos remoteproc support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-sm7635-remoteprocs-v5-2-96526cac59c6@fairphone.com>
References: <20250915-sm7635-remoteprocs-v5-0-96526cac59c6@fairphone.com>
In-Reply-To: <20250915-sm7635-remoteprocs-v5-0-96526cac59c6@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757934933; l=2001;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+N860jjILz9WjHBmzobR6cwMMc5hddgDbocup4wZWZU=;
 b=wAZfi6x3+OqVADm1Ao+uS/Jrnveeo2PlNBkQppNDqF9qOMZo9JF1bMv9l3fr+CP7PWOz1RDX1
 PXsvGtR/STLDD+3hxmpvTuZpyv1TDlU4uNIyCwOSNjyvtA+yloZOjtS
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the different remoteprocs found on the Milos SoC: ADSP, CDSP, MPSS
and WPSS.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 55a7da801183d54569452dbb48041fdc52bf9234..be4edd0c3eeefb80d3b25a48f6dfe0b7590bc624 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1255,6 +1255,26 @@ static const struct qcom_pas_data sdx55_mpss_resource = {
 	.ssctl_id = 0x22,
 };
 
+static const struct qcom_pas_data milos_cdsp_resource = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mbn",
+	.dtb_firmware_name = "cdsp_dtb.mbn",
+	.pas_id = 18,
+	.dtb_pas_id = 0x25,
+	.minidump_id = 7,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.load_state = "cdsp",
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.smem_host_id = 5,
+};
+
 static const struct qcom_pas_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1429,6 +1449,10 @@ static const struct qcom_pas_data sm8750_mpss_resource = {
 };
 
 static const struct of_device_id qcom_pas_of_match[] = {
+	{ .compatible = "qcom,milos-adsp-pas", .data = &sm8550_adsp_resource},
+	{ .compatible = "qcom,milos-cdsp-pas", .data = &milos_cdsp_resource},
+	{ .compatible = "qcom,milos-mpss-pas", .data = &sm8450_mpss_resource},
+	{ .compatible = "qcom,milos-wpss-pas", .data = &sc7280_wpss_resource},
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},

-- 
2.51.0


