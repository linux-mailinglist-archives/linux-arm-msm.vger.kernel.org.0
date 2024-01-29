Return-Path: <linux-arm-msm+bounces-8804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6628E8401D3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 10:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2341228331C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 09:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFA455777;
	Mon, 29 Jan 2024 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZYVK73e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224D155762
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706521046; cv=none; b=C0j+1XmmOVYizGFfRIez5/7G9j1kxe2iFDROHBnGVHFHirfh+8OnJ1aYLY5K+qC94WSAoXAKwazb/f7iTVza51V4EzHy3rBVE379Z/UO1smx0FbcSPvIne3EwCS2wDsZdIQPzCxNHtSopL6FKdH8kTDsTOW865uuR06DYXofZKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706521046; c=relaxed/simple;
	bh=K6DKN7aRQ/8wQcAXTGDdg1XPH2FdSTVkBOvXUiptcTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=T29bI++VRzSQlfTs4ikhczjRXymu/NrYOYlTjTOss/x6vFZTIhA/1RpZeYt22wSJ9GNyo5BIkDNPjv3rMQzjnP7p4tz3sy+45EV2Z1QuZbAvk9ueh86s/YY6Pdz7ngWuFXLPxzklXS2wxOB8THzU7nicV9Nw7epC4+jAILgpFkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZYVK73e; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a2d7e2e7fe0so474162066b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 01:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706521043; x=1707125843; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr1aupACniJ4UNOaCKg9pFxJXCNdS1do4M94/4Seezg=;
        b=NZYVK73eiudWNyOJzzeQDm/d/A1O4ILNDAJdPsOl8X6GpCgY5POy+9ob9X+DQvPnlK
         TX8Upj4cDv524YGUic06I9Iv3MN+jFx6LYmFN8UcpYKL6i3Mg0c5aLO+h/v6zv9s9ehX
         +89GibB2YYnlf4vUBKCmPxSBAS2+jTZWfJU5bEdtAaowk3yzPoBEeE3ZpEQYX75uweHE
         Gz6diSgxMaFjRWjJZH7qWReeDxPFjYF6Mqh2Ii2QX7aOThWaGGcquY12P6jK9D2aT5h/
         HhQCUgaYWRzGC4q/qhueRj2wWxEMIAsohm5EUI4p5u0+cURl/ILgYdC51k99FIIxgYrZ
         4Eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706521043; x=1707125843;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jr1aupACniJ4UNOaCKg9pFxJXCNdS1do4M94/4Seezg=;
        b=qOYdlnL7BUZln0QwDM9U+O3LjwPXB9dz5w3+MUT2zahN7NshSL2vFTHUzpjttezY25
         bhLQWhrr9ucrShsdQld3Nsr35+sLrdIYsx9Hajg1UIUSVfrBX8jkhjtvWYZLdRA1sSsc
         Ol2ofK/QLfYSW97ivJ8hhrug9ffg2wyrSd04jxccg7EZPgJYf7e87TWenEozdgrQcbK0
         GmbgcfsyD4HgTtlQWcshKqK1dBRU/zEXvAu8l1ih87oXbm1ODW8xCfVUTFtWdxkaWjS+
         uiVqYXCLHE3ogznVHqc5NaVLR0pjJCsejujA12+kHSvtJTWUqF1x1mw6hnsJto0qNE+O
         DPNQ==
X-Gm-Message-State: AOJu0YzHSYjUti/0H3/7GT2hYYesk35HSrzS7BXgyBFluxbSZ6KF6xla
	75omdZXFmEtet0rfNRsqkr0Xeq1yN4DM6wAcj1fQbC1Jg19l8LXrSUcbEgf9AeQ=
X-Google-Smtp-Source: AGHT+IEomOmMK6WeUYqxXrpYt64BzH5q6jwxTBS+PNp9UjG0r/7N0mbKqzWsF0v7XBb/az70GAlISw==
X-Received: by 2002:a17:906:d96e:b0:a35:b780:9315 with SMTP id rp14-20020a170906d96e00b00a35b7809315mr1739462ejb.10.1706521043246;
        Mon, 29 Jan 2024 01:37:23 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id cu7-20020a170906ba8700b00a3527389447sm3000379ejd.142.2024.01.29.01.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 01:37:22 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 29 Jan 2024 11:37:00 +0200
Subject: [PATCH] PCI: qcom: Add X1E80100 PCIe support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240129-x1e80100-pci-v1-1-efdf758976e0@linaro.org>
X-B4-Tracking: v=1; b=H4sIALtxt2UC/x2NywqDQAwAf0VyNpCsFrb9leJhH2kNyFZ2qQjiv
 xs8zsAwBzSpKg1e3QFVNm36Kwbcd5DmUL6Cmo3BkRvYEePO4omJcE2KMoT85IeP0Y1gSQxNMNZ
 Q0mxR+S+LybXKR/f78Z7O8wKR4Eg6cwAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=935; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=K6DKN7aRQ/8wQcAXTGDdg1XPH2FdSTVkBOvXUiptcTs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlt3HL506BtaTcU/4MXKsPmBsLPwpie8TyYb+tk
 J7evlgHpMWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZbdxywAKCRAbX0TJAJUV
 Vl+4D/91O3m6uDUjTjzuQcLRW1kQ2aXPp9iPbBrTmnuElwJm14JZVAlcMQf0vYUW2eQLb1oUWiU
 QBzzQVMCYuBFyw6yJp849SeuCQ8oCvM5HC2z7K9T9OjIZ9teqG9ZZa73TWQO2KSCAQvkty+6Nj0
 LedUO2vvVj8nxXIjuiwlOdUmt1NmsG0dn3nxd6wBEKi0rw3XwEwIXZGWluhdhOrI8LqxVs/w/CZ
 5nBqhNgcmzcr00KSUY9DtTxJ5QwvLivAKeP2x6mlcVeyGvt7miFNJQOtAxpXk9/KcPFsUhMZbNg
 WfCc3mq4jVeQjMl1sWRVVOrr0dAFt8Qiupj43Sa97ZOwX2qUluxDCuG/8q4V2UmkYtv21dnyj6r
 jRgXZZ2THqpuFAjr/AWJzcE6QVdqVSC5exDiPNr4kN6ueUeIUsRRqouRzJm+WQRLvfmK8azN8OE
 8TXqhFTFwWJEwyqHNoDVaXg3LPHDm8I13A/geTUgspVlAocl3Jbp6ZUu8254AikMBlPi64aO0mu
 yu6kym0QKjyChMEcgJJt1fT8yLgeq1/BTFltAtD2eO713ASuyX2N/ew4jJz/99pvO6f5mCj5Gtj
 mvZV+0Q4nJR6HcFiGp9pWJ8HoDLlgDH/vQTlq0H0vDxQbtWZJ6w59sfNgsbT0le2GtXhGTh8Kuc
 jOlrtvcTlY5ZaQw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add the compatible and the driver data for X1E80100.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 10f2d0bb86be..2a6000e457bc 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1642,6 +1642,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-sm8450-pcie0", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8450-pcie1", .data = &cfg_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8550", .data = &cfg_1_9_0 },
+	{ .compatible = "qcom,pcie-x1e80100", .data = &cfg_1_9_0 },
 	{ }
 };
 

---
base-commit: 01af33cc9894b4489fb68fa35c40e9fe85df63dc
change-id: 20231201-x1e80100-pci-e3ad9158bb24

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


