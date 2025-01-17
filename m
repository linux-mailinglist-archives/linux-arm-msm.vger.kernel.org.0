Return-Path: <linux-arm-msm+bounces-45414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBDCA15195
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 15:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3D483A8EDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 14:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6859815748F;
	Fri, 17 Jan 2025 14:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFLZapW2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67B2537FF
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 14:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123550; cv=none; b=dHE8oMaDwu59NKYb2y7TsmiIJb1KSxuMPuCScym5v3GQeWHRrFMOcnfq4sgYJbmT0raCzg1MsxJ82nRNy1TrsNOxC4CWjksN91Aj34Kp09mJ5azHAi6prEmHCKC5kOF8PaSblTvRK1+QYTnT80MBDFcwpnbAE51eyHakCbWR9+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123550; c=relaxed/simple;
	bh=rkN16KFyfCGbANv1URyC5pgmPDjOKr7gcHvrAmLZiGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dUfOCT48ZNuqg5mBY1IiiKmDJ+EZ4oMHUaLmV1jC1HI9qFeKL4diCHtc101A98kq/EH2OicKZo90+1oEGh4O141OOQF+0bdwcpO1tM7E3TWxihtjmsdGDJH6cuFM34DqzgxJU7waRM/RjZoeJ9laHl+MA3z99zcmihhnLPTZPIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFLZapW2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43635796b48so13816775e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 06:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737123546; x=1737728346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iw3hbPMx3DDHttAVH5KXQAb7aC6TLapsYr3FJPMUjSk=;
        b=RFLZapW2iKxxI8T3dcu5OKvgO6KtaG5AFr2Y+YZdn+ocSk+15Efbz7fjDPCQauc/Of
         5MqGBrnQdmdpO/oyYETWL4wb3lcTg1qkbriLA/qjqAM+xF3w476xErqlA/GMrEEk9pcc
         pRuLppqbLvw3kDNiVQ/+Fx+dxMu/uq5tuMlMWCj3ek68UzP1bRzR0wzWG7XNRp0xqocd
         WmCfCOxjtcKqpB+2UpVUPBuCzejZbjsUjK556UQ8BrBLiRTRCpuj0VVk2b/Jc5CeiH8z
         2U9+PqEa5p7kpPDyHiWSMLJzlA+vKfKkHqmgcxtCbUQs8J80AEQyijVB6GKLnrS9+hWj
         dD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737123546; x=1737728346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iw3hbPMx3DDHttAVH5KXQAb7aC6TLapsYr3FJPMUjSk=;
        b=e7nTNjg0km5C+qy+YQTiVPEfasoaVm4euINdsvPOwbZ5+14dj5QHY+VvdI1XsUyKA6
         1205FWNTIuEDktx0PEKAQPwaNaDwTseW7ywN/aL9Ap6VCCFQQT6I5zclJLLtPsgMSQKL
         IBM3L87IEy+WANosA/fEqPmeJbx7cIkKYBmYTBol4/jzVSDWXpW2bPM6YXmSavP/6yG9
         /4HAXqQOVvxy1uJ/+4EL1asMiaNEtFRbWoNKLG+sdK96FFK+sRzNATxn0t2KODEqRoDW
         2iOYEWOkgekUhLWuE0apLGA/fG3ueNHX4zBbZ4gxTVxrm/vQHKVZ4Tko1oMKz7IFm6iA
         9v0g==
X-Gm-Message-State: AOJu0YwDPSCMx6C3D7oJv7krHKffZVRm4zcYsVxfxcIm1N7gRLAeA6+p
	sje0tqBxlg2AfzeEbCrD9npNf3D4U65nLwGCb+SxpzICfbhqIRcoYZwf/YxeONs=
X-Gm-Gg: ASbGnctGcYnq97owCPCrEBPLxxOCez1vLzXlspai1O+EwkkH0iKM/yltq9dA93W1UQU
	HmnaTBviI9EY1OeiSNZGeeH6RG2IGDSaWZqX2cDgnBKxRGOsn9uf8lerhnE/PG8Q7v6qhwD/i7l
	YVHymyEkUZl0l85KFobjtESel3KzHkqgIc0uQYK6fHjNKp9rCOS4SXOp/uJdI/DGIthsP8knmic
	49BulXq2zNiMEDTD6pGneIVecVDOwJHxCxJI/kjX6LWBRdcd55l/wb8Bi8O8BgvvrIVABU0a9f6
	WezD043YUYAohNHM3WvukkDGSZHRQtKUK2at
X-Google-Smtp-Source: AGHT+IETblMrx8KIRmwK9VCr83hmCG0f17UdDxWZUvSUIiOhoWXqGDdx+je3BMGMgRQiM12epULhgw==
X-Received: by 2002:a05:600c:698c:b0:434:f9ad:7222 with SMTP id 5b1f17b1804b1-438918d3bdcmr26937075e9.7.1737123545938;
        Fri, 17 Jan 2025 06:19:05 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74995f6sm96764195e9.1.2025.01.17.06.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 06:19:05 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 17 Jan 2025 14:18:53 +0000
Subject: [PATCH v2 4/4] soc: qcom: ice: make of_qcom_ice_get() static
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-qcom-ice-fix-dev-leak-v2-4-1ffa5b6884cb@linaro.org>
References: <20250117-qcom-ice-fix-dev-leak-v2-0-1ffa5b6884cb@linaro.org>
In-Reply-To: <20250117-qcom-ice-fix-dev-leak-v2-0-1ffa5b6884cb@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737123541; l=1621;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=rkN16KFyfCGbANv1URyC5pgmPDjOKr7gcHvrAmLZiGk=;
 b=GkVvea3pMVMpJEOFkCogbzhGJLadWWc2COyDHp4IFtQvqwN8HlMWhUl0amrJXjGiMy0W2cgM3
 AqCC1xa+8FLC3UvoQfVuAwJIX32Ugg/vLxSxUTTBxQ4yk/FSRFpuR10
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

There's no consumer calling it left, make the method static.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/ice.c | 3 +--
 include/soc/qcom/ice.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 79e04bff3e33..2310afa77b76 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -262,7 +262,7 @@ static struct qcom_ice *qcom_ice_create(struct device *dev,
  * Return: ICE pointer on success, NULL if there is no ICE data provided by the
  * consumer or ERR_PTR() on error.
  */
-struct qcom_ice *of_qcom_ice_get(struct device *dev)
+static struct qcom_ice *of_qcom_ice_get(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct qcom_ice *ice;
@@ -323,7 +323,6 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
 
 	return ice;
 }
-EXPORT_SYMBOL_GPL(of_qcom_ice_get);
 
 static void qcom_ice_put(const struct qcom_ice *ice)
 {
diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
index d5f6a228df65..fdf1b5c21eb9 100644
--- a/include/soc/qcom/ice.h
+++ b/include/soc/qcom/ice.h
@@ -33,7 +33,6 @@ int qcom_ice_program_key(struct qcom_ice *ice,
 			 const u8 crypto_key[], u8 data_unit_size,
 			 int slot);
 int qcom_ice_evict_key(struct qcom_ice *ice, int slot);
-struct qcom_ice *of_qcom_ice_get(struct device *dev);
 struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
 
 #endif /* __QCOM_ICE_H__ */

-- 
2.48.0.rc2.279.g1de40edade-goog


