Return-Path: <linux-arm-msm+bounces-69737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 771F3B2BFE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 13:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55C487A65E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E82CE32A3DE;
	Tue, 19 Aug 2025 11:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ImeXTpZf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6649B326D4F
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601707; cv=none; b=LU8BoCU1ioZANMvEAibew+7895iv3IQuRLiBHYzeDBK7XJw5ablnK9xByMAjmBwxl7iPdD/zX9vwHUW1s1LvI7XVPWClcJYt7etTCDUIefdRfQ2e/1OLAuXahjZRA12CIeLl3LFpmFqBs9Cb7k5CPOFhxRxlYKClRoQVQOm7WDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601707; c=relaxed/simple;
	bh=5Cm91oSUyXHyy6yreXV4rGUm1byh8yAeFEZWmdl7qEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h8Nko3TqUtrlHi/YRXupNADGFuw4YsB1f1cwZxJ5/XOW/nFhyTL8gUkpgCVfJFILN9Vx357QWRYsR9qcbH83/U2A23FU4IvQ3xK2zRg/Fz2nC+XqYJKx7tKuFAqVaZTaCdJ/17BWkagJFFwTmBxUPEd5BKIE5fbn2QzchMgHV0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ImeXTpZf; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb72d51dcso726216466b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 04:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755601704; x=1756206504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DpDAKcv7fLih20nGtOlLdXsRYm0EQxxtEuxIHxz2kTE=;
        b=ImeXTpZfjkqV5CVBFpw92I8cX7kNOI6rR4SgQgh9FU6T6HCl0HVkG0WABHME1bIr26
         4WD7ijmXA/DQmwcHkp3I0Yea4Slfle96l6nbhhPOaGYdFGgyCdufiO+X+libA7uBBnqP
         Wxer5K0+RG0HjlNbJxV17NO/7+f+MrTLwCiIHFJtp1EgV06v/XRP9QCVDsGqKORDyWEH
         FP+2L8EFsi3+Zd8j913MDWktbR3mslk7pgmhaX/seHe1hwbEeKDXSheEKI8V4ooVar1j
         69D2DphTA5o2KKeVoLa7TtWen6FFh2VqJkQsAmonjbFBnO28V4fxIUMLq3oXE/CrbtZJ
         vENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755601704; x=1756206504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DpDAKcv7fLih20nGtOlLdXsRYm0EQxxtEuxIHxz2kTE=;
        b=glJrpsm+MhMnPEcQlr5kDmTa0ZGKZl080+ZbM4uOsV606ytgPmiMhSMGkfnLFWkosM
         zxLNsDCP9a05k0ULUZ4SJeFdwEsJEK5P3SipisHZZWJP23+SK5KBQrehP/9RTzu6YEzr
         nkMG2iHJV6at0YOSvujoAyTDNGIkNY6Dwib1nqompGTd0No/pWE+SiWBtcrIKO22iRw9
         z7QeiavcFh2TijT9KsYKBbIlQYKRqC8g/6Zwvg1n+2zkc7BFt4r9RCyg4JELgWM0SuMp
         zX3EtQ+3cPPaFO63Ol/ZOc+WMH8vxzeshVinT6N6m/VKLLBBF6+F54yF4YAzV+XWxS/I
         yaLg==
X-Forwarded-Encrypted: i=1; AJvYcCXF/E1Z7yW/CTiQ69dVCiwuN4P2h9kWcYjvyl7ymTKT/mafQQ7WbK5L9ngCNu50qIXztDepcmH/hqHZrxHN@vger.kernel.org
X-Gm-Message-State: AOJu0YxGKnkyhuq6n2knOjC/qJUjk8zJYGcNn7xUcUgN00IvU3EKIFev
	3sM4ora2NkEtL08/kqoWJm1GBn46wv+5qAtVdO5yGSR5nqu2jq7+2g1auJ+08ynzyPE=
X-Gm-Gg: ASbGnct2d6xQ2pc1AQq0n0oaICUMfTJmg/YZQQy9YpL1q+j+KE5q8V50Euf8ud2Wea/
	pBXaPBzPRuTiF9NiwTl1Aedpz6qDL30pO9Kjf69Gnpv8YuFWTwa2chuo0B4LY0pGaoSb5uzjB26
	3Py5IL/2d+AIKSOxmIaPGYjZuxZiW5yM+NaVCGwTtyfdjjMsD3bhQs+WHCit/ZpcM4Zd1NjzsCJ
	nv5YtT9WnLYRsjFBPgOzIFEPg4T6mAtrA1Tt9o3wAdWCo2nBbU8Llub2KGh2Q0Th76uH6s31T/8
	cO5UzbL/ViPZiXNt36flFVKg9sWYObJR2MoaOiRRxRHNhxjD+0VaNotsTj3bqXSRgIpi4rLYS/f
	rZ7HPstWaLCcnwbXhFd/P/N7ipL6KZxPmqt/9W3p6VYqtmDA8
X-Google-Smtp-Source: AGHT+IH9vzrOOzeP1dBM4pFoF33YFeXNtK3jHXKDBLebjoeZjTOHNNMM/dRMFIrqI+YVvusdLzCH2A==
X-Received: by 2002:a17:907:3da3:b0:ae9:c494:1ade with SMTP id a640c23a62f3a-afddd1c9e57mr200862566b.53.1755601703592;
        Tue, 19 Aug 2025 04:08:23 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:db5f:8096:4609:9b24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01096csm974845466b.88.2025.08.19.04.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:08:23 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 19 Aug 2025 13:08:04 +0200
Subject: [PATCH 3/3] remoteproc: qcom_q6v5_pas: Shutdown lite ADSP DTB on
 X1E
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-rproc-qcom-q6v5-fixes-v1-3-de92198f23c7@linaro.org>
References: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
In-Reply-To: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2

The ADSP firmware on X1E has separate firmware binaries for the main
firmware and the DTB. The same applies for the "lite" firmware loaded by
the boot firmware.

When preparing to load the new ADSP firmware we shutdown the lite_pas_id
for the main firmware, but we don't shutdown the corresponding lite pas_id
for the DTB. The fact that we're leaving it "running" forever becomes
obvious if you try to reuse (or just access) the memory region used by the
"lite" firmware: The &adsp_boot_mem is accessible, but accessing the
&adsp_boot_dtb_mem results in a crash.

We don't support reusing the memory regions currently, but nevertheless we
should not keep part of the lite firmware running. Fix this by adding the
lite_dtb_pas_id and shutting it down as well.

We don't have a way to detect if the lite firmware is actually running yet,
so ignore the return status of qcom_scm_pas_shutdown() for now. This was
already the case before, the assignment to "ret" was not used anywhere.

Fixes: 62210f7509e1 ("remoteproc: qcom_q6v5_pas: Unload lite firmware on ADSP")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 02e29171cbbee2d305827365ef7d2241b6eb786b..6faedae8d32ef6c3c2071975f2f1e37a9ffd8abe 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -42,6 +42,7 @@ struct qcom_pas_data {
 	int pas_id;
 	int dtb_pas_id;
 	int lite_pas_id;
+	int lite_dtb_pas_id;
 	unsigned int minidump_id;
 	bool auto_boot;
 	bool decrypt_shutdown;
@@ -80,6 +81,7 @@ struct qcom_pas {
 	int pas_id;
 	int dtb_pas_id;
 	int lite_pas_id;
+	int lite_dtb_pas_id;
 	unsigned int minidump_id;
 	int crash_reason_smem;
 	unsigned int smem_host_id;
@@ -225,7 +227,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	pas->firmware = fw;
 
 	if (pas->lite_pas_id)
-		ret = qcom_scm_pas_shutdown(pas->lite_pas_id);
+		qcom_scm_pas_shutdown(pas->lite_pas_id);
+	if (pas->lite_dtb_pas_id)
+		qcom_scm_pas_shutdown(pas->lite_dtb_pas_id);
 
 	if (pas->dtb_pas_id) {
 		ret = request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas->dev);
@@ -722,6 +726,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	pas->minidump_id = desc->minidump_id;
 	pas->pas_id = desc->pas_id;
 	pas->lite_pas_id = desc->lite_pas_id;
+	pas->lite_dtb_pas_id = desc->lite_dtb_pas_id;
 	pas->info_name = desc->sysmon_name;
 	pas->smem_host_id = desc->smem_host_id;
 	pas->decrypt_shutdown = desc->decrypt_shutdown;
@@ -1085,6 +1090,7 @@ static const struct qcom_pas_data x1e80100_adsp_resource = {
 	.pas_id = 1,
 	.dtb_pas_id = 0x24,
 	.lite_pas_id = 0x1f,
+	.lite_dtb_pas_id = 0x29,
 	.minidump_id = 5,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){

-- 
2.50.1


