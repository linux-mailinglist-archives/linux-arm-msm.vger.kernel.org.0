Return-Path: <linux-arm-msm+bounces-43743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 279AA9FEF75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 14:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DCB01883408
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Dec 2024 13:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB88819F424;
	Tue, 31 Dec 2024 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xT0TM8+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F13319EED3
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735650166; cv=none; b=LEldyLNrCGWWT2UrYRK8gLMxD8xxFxoIfK6+fKncLdGc6OkD+9IFThVohvCpkO8VGGWLnbWGfSMwMCGVhlZpzdGz5xwAf9ODbGyklqvbNxtEFyQB0Pmo3obPiy20ncbEfiofjJ78Ud5be/X2gctU8BY/duMB5TwmarjFm2WgvYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735650166; c=relaxed/simple;
	bh=6RLdN2eI1UpuHGQ9IxNEel32aW76eUXl9jMEDUafCiw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TLu+VtGQe5GNm7i+D2XNDbJ/s5mvjWBxNHs7nIaIl6s3Smq85UeDvVlWvAGtsgxPqK+UCddEWltDMJarUHzlw4tuokp36k5unVQDHGITOSvScPRfixdw+Zf2lp6IWJQloecHYNnGylFY08Hz0h9TKzbLdQ4S8UQAUublW43h7RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xT0TM8+s; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216401de828so125972415ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Dec 2024 05:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735650164; x=1736254964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQg0uNio4nJAv3CSDy6Q0G3Cclik4QaoMqYrEiDMWr4=;
        b=xT0TM8+sgoY+tDimwsdBNlhxp9oRr5OLhX1uCHEOS1TuAFz0XKgFXYghOH5DTJTSQ8
         tE+RYhoY9d5LyfpLR+8kUbQrTvrgvdkmqMbi1ywVpMLG/lb/eJVDi8BAIfe52MfOlIsO
         IytYpWPInWE30rpxoprdJwsc6AFAO+MaHvOx5+7+BGQCESo77ju0eVv/emNC3i3bhqHW
         2SYuCjCnqluDFpEupOgVF+cZbi5D7MOEySloKoDD9LRdtnIheymrrn5swhWC0EnUHfM/
         z/BalonrmaPmkc/aTagpsIvtGFbw6acRpshLUUbZGtBtEIyTeEp7ht5mWd4+e3QsFeX7
         TpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735650164; x=1736254964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQg0uNio4nJAv3CSDy6Q0G3Cclik4QaoMqYrEiDMWr4=;
        b=NNd5YTeLHL1E1MUluZ1q3H0ZVZcFR3i4LIzUvu4XwbYECWIuu2lCWGqWqhDp6IoJtU
         laQgmWmdk6moRI+iIU+uniabZx2lz4PxPQ44dRfIn/GcD+rrGznBM0VTrTZ7s7ELWpES
         vDruYxfVHKzTPPOwG+TlDzeTquD8neoDZP2oUvke9QOoTGQGByuGyflZhp3gwpjY/9PK
         e4Wyqq4Ggl5ujZzp36WYIK0gQOWpznREotcu2rwB9omGEYTgXn7Y46aW4lKOqOgrp4Cz
         g2lBg/GxF+GPxQUKHN0PFl8TkrRFeCJB4V4tfuD0ih+gIlnu0O08jTKpy3Lapz4L2oLq
         qtmg==
X-Gm-Message-State: AOJu0YxoSFL/afRNmRLX+WiwRkxkCG67WjGxmATFCZ0U/YEvkiKAAM3u
	BSMRbD1U2NaGm9rOU3V2Bi6XlQet2Z06OvScZ37uK0nvYWY41X7IiVGYAJFFdA==
X-Gm-Gg: ASbGncvKJUoGhcshPtQ0zeRp5Jp8FWCDCQeGTwzzq8IAPvzPa1wI9pFYD1cpLVXfx7A
	xmS8jE/e4VGdK6FdeMEueQPpvjsrs25acP7Mm8hloQnvunldkbWsB9Xvnjn8OsgjGLfqdiHfcg6
	z5aw1uOj4hSnGuFwBxDjQrw/TChwrEfBa62G7sxW0SGJqubEuZvUsu5lTJTgwA/E4nJU01PbrSO
	mDM4TxkqoqHQ2Qb/nTYXAJRBaaB3QwzNSBunbvguaaclfHBXJwi9rFyNBcU/kIaLT5Wtmhv2Xh7
	bwUWn442TKc=
X-Google-Smtp-Source: AGHT+IE45qDDNc5YRYSihN/fWzwP55+6ssJKbZvchos2PE0NP7maDGJ62ORojGn2Lyy1W4PdSTjtog==
X-Received: by 2002:a17:902:d551:b0:216:386e:dca with SMTP id d9443c01a7336-219e6ebb750mr600763705ad.30.1735650164377;
        Tue, 31 Dec 2024 05:02:44 -0800 (PST)
Received: from localhost.localdomain ([117.193.213.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d945csm194514275ad.117.2024.12.31.05.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:02:43 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable+noautosel@kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 2/2] PCI: qcom-ep: Mark BAR0/BAR2 as 64bit BARs and BAR1/BAR3 as RESERVED
Date: Tue, 31 Dec 2024 18:32:24 +0530
Message-Id: <20241231130224.38206-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231130224.38206-1-manivannan.sadhasivam@linaro.org>
References: <20241231130224.38206-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On all Qcom endpoint SoCs, BAR0/BAR2 are 64bit BARs by default and software
cannot change the type. So mark the those BARs as 64bit BARs and also mark
the successive BAR1/BAR3 as RESERVED BARs so that the EPF drivers cannot
use them.

Cc: stable+noautosel@kernel.org # depends on patch introducing only_64bit flag
Fixes: f55fee56a631 ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index c08f64d7a825..01d3862d7003 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -825,6 +825,10 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
 	.msi_capable = true,
 	.msix_capable = false,
 	.align = SZ_4K,
+	.bar[BAR_0] = { .only_64bit = true, },
+	.bar[BAR_1] = { .type = BAR_RESERVED, },
+	.bar[BAR_2] = { .only_64bit = true, },
+	.bar[BAR_3] = { .type = BAR_RESERVED, },
 };
 
 static const struct pci_epc_features *
-- 
2.25.1


