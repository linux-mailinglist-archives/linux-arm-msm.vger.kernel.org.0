Return-Path: <linux-arm-msm+bounces-36049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A269B1B38
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 00:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60C0B1F2017A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 22:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DADE1D9346;
	Sat, 26 Oct 2024 22:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B5UxA7Dp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4A01D89EF
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 22:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729980595; cv=none; b=lNoFyVyQYLOxuGx45K9okA3aCP9LbVAfqWlU4oIR9TmT3oyVMlvU2LbwpX+Y3XWKmmfHBitNA2qnsVcnzuaPxb6Htb3dRi3nYSlFTqu5K6dv89wZEUgXXCfTckvfoKR47SrpdwvCspR7h/5NzYRcGUV879r6OFMbpDmmaQOf6Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729980595; c=relaxed/simple;
	bh=4aCwCyrvNIh01qFZk0SsVn3TS2G8jD9/kSZIAalF8fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KAUnOJieMgtX9/vkBA2Mm4uI4tUSkmEMq9Tozw7Yk8NGtkz3RPLrvY7nXE7vk1soXApfEOWq4/GUcKTcBFTR8Z6/8m4hHxPmUN3dcYHm8t8PerCNqgLWrll+0pj3zYmR/X9xGUZpFbWEHQCYw2Rs0jq7bn1C1QnyD0wYISJD5Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B5UxA7Dp; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f6e1f756so3514948e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 15:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729980591; x=1730585391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CfUG07W9abS4weAdYYdZr9qWj6lPbq2+vJ4O8l5HD4E=;
        b=B5UxA7DpFkXfVWDaRSi7HcnYowmmqiPOIxA/lfyejUWRYO5Qee6as6b9uaTugg/gkr
         Hi2A7JlKDWrx98m+dTnIFc6ZhSbIHvez6Q+cKRMix/jeeTB2JaaDW/BHk0Rr17Eu8DEy
         h5n+oFa3dbk+pD+IEPa7AheEjIc/M7xGZnzYh9wBeUTjNmJoCaV5EcO5sTiqkjUp4Myq
         DlDgvi1BLNFIcr4pw7aGRyec/FZsXyOELF83/DM2i9ZTddZfx524SQWkYC8lVq34p8sX
         AIreR87dI9NmOzqb94Wnz0m67zd0fv4agiTIpsUBcIP01YB9gubQgPfw4jcihbidYwUQ
         jU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729980591; x=1730585391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CfUG07W9abS4weAdYYdZr9qWj6lPbq2+vJ4O8l5HD4E=;
        b=YNulieK/ZrzgWDpYT9WEBDXQ79rkL4ly6q+obujtDuFNV3UsnMtJAwyV0H7XasZAhl
         0qHCQTh1+DSu1nAIGz439mYVew7rq+tlJmP/6ayr1vLH3RmHoGhY5JLQxy99qC7yxZzi
         FL/QX4ygRm6bml+2H2pasxQ9dEV0v0YzfNRRPn8MsTyPQCHFJHYBPrbXFvkYTyMHqVZv
         C/Vk3m/JjeckHtrQXVBgF9il4ZcO325wNAjw9UY5K5+d5wm1SQ4DDA2S8RfYtRbMPupq
         UVC3Ew77mN05UAfKKPKx7JDNPrTZqBaWx/sdg2tQEQLOR2BnkTHgb1E1r8t2qXPI3uiH
         Bjog==
X-Gm-Message-State: AOJu0YxSBItD34ROL2dsnmJe0KuSL0JOvZ7LAmYkRbTS9tspBvr+UoLy
	tmOrcSog30NnH/J+WaDd4ZHKn37H7p2KUql3JhMx31oGC6QKn25QqmgbxHI0nHQ=
X-Google-Smtp-Source: AGHT+IE4d85Xdew7pmOOtarrw7cEHxLVN8rYUpe64R0ocf0wS/bpKczXfFyCVgdJ7YOR/ZvsRw+NpQ==
X-Received: by 2002:a05:6512:6ca:b0:539:e88f:2398 with SMTP id 2adb3069b0e04-53b34a19082mr1234918e87.39.1729980591209;
        Sat, 26 Oct 2024 15:09:51 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1adf35sm615934e87.130.2024.10.26.15.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 15:09:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 27 Oct 2024 01:09:44 +0300
Subject: [PATCH 2/3] remoteproc: qcom: pas: add minidump_id to SM8350
 resources
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-sar2130p-adsp-v1-2-bd204e39d24e@linaro.org>
References: <20241027-sar2130p-adsp-v1-0-bd204e39d24e@linaro.org>
In-Reply-To: <20241027-sar2130p-adsp-v1-0-bd204e39d24e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1141;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4aCwCyrvNIh01qFZk0SsVn3TS2G8jD9/kSZIAalF8fw=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHWiodeYU6VSC0qR4QI689F6J70DeTWni+rJE/
 4tTUX58f/yJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx1oqAAKCRAU23LtvoBl
 uKoREACU5XPOGqS6Jzx3MajiokuIUtOFbzk7XWY/5H3Q5jAgmQnWpD8Sp6q9XjwU+lJJZlGjzuI
 Dphm8h+2hMhQkmJKiIBO8a1oMBo1belwiDkhfMf7+MjIatQ9i9Xfz4JTMwQEnmXGZPVDRTYCl9h
 QaNEYkrd28hGj05fCQKsYN49vI0dWkKxvqs2l61hi7RTA0W37hl6wvSQDA+PHl2UhoCWQXUdZdt
 rOG3ejuEVvik7dEYTi73uC0Z8RXmagZDAJRWI6QaSnJbUJCGJVS1z0ch79UKbxE/U/A7hXgvSGg
 Ux3tLPaIsuNrRxQFVrS4j7WVFnMRCMTsvcijnbLzyNKbAC9TXdCRbko1UEjHMq7CdiamueJgaK2
 Yujv8k8tzRj0tGvU8hsl5ZD7xPngJjlLbElwTCCVZMi4txBWbEYHzrFnshj0FFqJnCU7M66AaOO
 f+e66oeUEh69hyI7SOo43m3FoQWxt67MYgA6BDuYfFX0sV7Ze76t3rFIE6i7N+uIRMABKVQKfvK
 06fDkIexBkmmNs3vkWg1IUEJhDz1xIVn29vO/bTDcywiUleKVDu8h2obhWQLvF1N3iSBKHAsejJ
 Dw2WwTvQdj4EH0cQ+oqSli5Q8eSmC1sBNZLOMnweoI5cyKixrhWemBhpENVLT94dIQlV66jpv17
 fInhHVqQSS8eKUA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Specify minidump_id for the SM8350 DSPs. It was omitted for in the
original commit e8b4e9a21af7 ("remoteproc: qcom: pas: Add SM8350 PAS
remoteprocs").

Fixes: e8b4e9a21af7 ("remoteproc: qcom: pas: Add SM8350 PAS remoteprocs")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ef82835e98a4efd4bc603cff604d531a51fe9f9c..b10b4fc84f14eb40d64b278a339f2ceb45250a62 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -923,6 +923,7 @@ static const struct adsp_data sm8350_adsp_resource = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
 	.pas_id = 1,
+	.minidump_id = 5,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"lcx",
@@ -1124,6 +1125,7 @@ static const struct adsp_data sm8350_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
+	.minidump_id = 7,
 	.auto_boot = true,
 	.proxy_pd_names = (char*[]){
 		"cx",

-- 
2.39.5


