Return-Path: <linux-arm-msm+bounces-41411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCA19EC651
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20136188AF73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BEB7DA6C;
	Wed, 11 Dec 2024 08:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="okXBaSB5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F171D5ACF
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 08:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733904100; cv=none; b=bk8cshYkJqijyVrIjqt9TlJnjyQL6THM75ejqX3Q+LlhX/hXdkcxYFbJcOyNFL+MSZAYx1CIIcRp0Gn4hug/T03TRZaelFe2hIe9FKdPzuLF67PWCUaDQldMf81lK5EmTade96i4OgZ926y5OzcDj2g6GaLHhQKMgK8bRwD2yO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733904100; c=relaxed/simple;
	bh=ipm6qELbYTfXg2hQT0IFc0rvkpX/x/nt8LPfq0mYElQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KmFv3I4s/7T0b0nZf9mZ91M+mBa6OrYXHpGpo7L9WhzK70seyrxF8HPpJ3cLC+nz4RJwRQQW83PQyQNzdknPhjsBzVMa1Ak3iG2bjuaVKYjq/UyNgAwI+CTeTD7wS7kKdt8yZsRIvmvUh0bn+dvX4FZqfAyJOF45Cyh4OVckY4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=okXBaSB5; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7fd4c0220bbso3217178a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 00:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733904098; x=1734508898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8q76q7eUTECAS81ZcaHstGwKhBK0vE68IjtIJyIAI+k=;
        b=okXBaSB5VRecPpORrr27JIy1sTCPUUNRV0odBObWz3Ht+9bFLY0YnmeDsV714Ckbz7
         MwyIt5DZcD9ddsMexFwlu8czwz9oj/gA/F67OkHkP+5vFtJAJnTCXA2uXqmDcCwKK5f3
         iZPsg6/rhyj36hHZiAzMaVQrup5CS9S5M5T/IzznGbrwDlYzmhyRcnH3a1bGKB5VZKRf
         Y9UvNyynuAbfv9AUWpHI/LgTnIMYWzhB+ttKGHhqX2YEd9HMbA/ZdVQI0wKNmrTHTw+v
         jv5YP/tRNiUJos05+QetafOXatKXGQLH1BCLEtA8wA65h/yxf4BOJeOhVJLObDf3HXek
         xUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733904098; x=1734508898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8q76q7eUTECAS81ZcaHstGwKhBK0vE68IjtIJyIAI+k=;
        b=QiFSAi0jkGqKvEMDl98dhy/MgJBCZUrWEsgiCpKPtEAWYK5Zg8nkgOP8OdXBCfSTn0
         CLzHFwJ9d1DZ9I0CzxtuLJf+cSbo1sjzUFU110kPpAkEGnsSnSpUJQ6TtL2QCyYGMEQI
         bUF79Yk4sTKiza9yLoZ6h/QbPZ4elfIVyk7xOmGlRSpgvqdK5832UnxrzoDmX5hkJ+xw
         ZzFv5LdXEQ+QFWZZ+0XIPd/MkWB5Rll5mVRXd56OH6u1YLPQGsCTmME789Y33aVFhx/7
         jiDuMNCf1gWw5FZ+lh7jKcnMj3P3gTNXh9Ia2o7V/Jq+ZaIAadJLOpVyxq/Q3+t6vUNR
         DgKg==
X-Forwarded-Encrypted: i=1; AJvYcCXpMSexxeGa74+7KZDcu0YAYuv4cjfE6I1MSB/0g9Sd3DoAVJpyMjJVHy8fAyILDxj1+nFOhg0TqnJDclK7@vger.kernel.org
X-Gm-Message-State: AOJu0YzSWhzl+686c9qPqpPveCqbl8034073gURMc1pcAJbxOc5TGLbT
	Kxm7fvDD32XC8XLSxPJYq9TZLnKRKcp0VYebBrZpJPDHP7+T35KM7iPKEl4rDA==
X-Gm-Gg: ASbGnctr/Y+DoSCb/VR4kjokWDxzryyRLQJHf3GuWcKRXE6+OFdkDAzBVRF5fJlLnPY
	qVsRdFzgXZuohiPeZLHww/PnzoUXxDwbYbjNvvCALXowyVEpXIjWUR7oc0/T2ZLJoKNjNuM4dWG
	2biDLtQgvXlepIcptE4swTdDo0ndFmkVFkLIzWcvX4OJ+ZyG6Ne4eCx5a/cu2MFAvlHMmB2VSyN
	4qCaho10cO8DmQZ3bm76mFtq414scoNGelnGOz5i6nBNKj1ib1QY1Xz+jUSR2gLKlE1nHvBKbt7
	s+lz
X-Google-Smtp-Source: AGHT+IG99qcIr9GvfITm98ryc2AXYkrV8pH6ZRMpAt1heLeVZuLUM1sds1scrjNv6/IS5BWcXLa9WQ==
X-Received: by 2002:a17:90b:224b:b0:2ee:8430:b847 with SMTP id 98e67ed59e1d1-2f127f50a32mr3250201a91.6.1733904097941;
        Wed, 11 Dec 2024 00:01:37 -0800 (PST)
Received: from localhost.localdomain ([120.60.55.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2708b93dsm12929775a91.51.2024.12.11.00.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 00:01:37 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kw@linux.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	lpieralisi@kernel.org,
	shuah@kernel.org
Cc: kishon@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhelgaas@google.com,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	linux-kselftest@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable+noautosel@kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 1/4] PCI: qcom-ep: Mark BAR0/BAR2 as 64bit BARs and BAR1/BAR3 as RESERVED
Date: Wed, 11 Dec 2024 13:31:02 +0530
Message-Id: <20241211080105.11104-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211080105.11104-1-manivannan.sadhasivam@linaro.org>
References: <20241211080105.11104-1-manivannan.sadhasivam@linaro.org>
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
index e588fcc54589..f925c4ad4294 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -823,6 +823,10 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
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


