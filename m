Return-Path: <linux-arm-msm+bounces-18881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFA68B6A63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 08:16:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 192822822B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 06:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FDF74E11;
	Tue, 30 Apr 2024 06:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MLrE2vyJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D581B963
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 06:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714457676; cv=none; b=jJjMs9GCZWpTE2kO3Hd/KgrWiQ6QT0x04vXOhlOmGcfR7xt9l4qQSseIVawVJEtX/6TWfocq+RemPYmc8VE+j8JjiQMhNZeVEsfQ72cbR3F6geJa363W5/Fv7RBBz1XusL+9+aThNqKDqV13y3VXO8oHD1VHlHr+JoVAgsuy3+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714457676; c=relaxed/simple;
	bh=k6wJF3EN6aRmkmMhxj7MuPWYMx698jnme1fa7UNZ/38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=chDdJWu8vFLjnHYgzfm0E+h/yWS4uegfrk83LhBlcrLlC6/N9fdtbowdrslijFucwjy1YfB61waOWB03nJnkecvelL06oV451DDhPMk5k2EojmaYRxrSuHO+jlCd/LQaZyXgSzpACzHq3JhWgWkjNL+pIrCjEwH6Y+KVgzdTnW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MLrE2vyJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e834159f40so42655285ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2024 23:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714457674; x=1715062474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5hSvb4uyPJ54kPzH7K5/6HoCGv5wEu2F/LB4hbEFp8=;
        b=MLrE2vyJDfRRYFesre3IbxoM0M6ZfSCzoUuhTUB9pKg/JbzW4fXLyTSquMuuJnLuSS
         GfPGl/XK8wRf5cJ1BQM76xI90nJ50z3jn4e1sxl/V5x3DBWzUyFHZ+x+NfL+3+G0PzoI
         /+RqdEpBMWZzl/yXIOdkMi8LwbX37ii8AVVWz25eKBYTd1yLi4SVOmORjmAhq//1Svln
         crchGUnLNoOKXDhnFWoDzpMfMoS4H7hFblpRpEsoKyQXG98Vq35GB0NQ0hd2qNtTVeip
         jLE0PwFEFLYyzFsN5ClXrT6curAz6Or7YVJ2+F2C0X6sy8vhbyweJ1qkiBbCz77MAPlm
         s4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714457674; x=1715062474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5hSvb4uyPJ54kPzH7K5/6HoCGv5wEu2F/LB4hbEFp8=;
        b=HYhCktJKBBZ7b0e8AD0LADSSJQUhxinuCJxVL6oZmQEbhYOENSCgcKK+/sdM3IWXPW
         seXKMzeMKLp3Hzsp+9dhjDM+Jn+UczEifZX0vZel+NZMh2jIcgOqVamQpKxxP3kdCHY9
         T+TX8zxp5XPTzeMjMN5qHaDLerMhNABa/zjY1YlNiF6wnG91BjOd8Hz+5suHTcTMwiaN
         zd6h9SQa74cSmsZTKyo75ejtd+yfPclKxymlqBr0h8z2uD5jGyzVnVNclu1HYkPrfgv5
         UIRzwbE5KpEOKeZjRuoh/xXra4/tb4haoNDep76k6S2FFmbkZksS4/l6P0iIobUpReFK
         i8lw==
X-Forwarded-Encrypted: i=1; AJvYcCX1i7d7YDfmS8ptHjD9YMaT0YXRvZj1peHzayXmlSqRqJ2/D1COLtpLRElqYQcD/LgUw8KtnP9PVnhJOVd5USEUNCfVSUdPvWtTczi04A==
X-Gm-Message-State: AOJu0YwGkBxeJBXajgMT+722t/1O2alZ6hvphj4Y9oQRgic4i2TCf9DG
	CGLwbauU/eXfli0r9EWuown2m3fN/ON1paSeeYky3xTxa04TVaECrU/VTAfSZg==
X-Google-Smtp-Source: AGHT+IGX8lbqUAItQ0yMmEiPFz/NJHhGg51DuVNt95DDcQS8ZGGfIFPc6uVZ0u3523qwhTRTM0DXlg==
X-Received: by 2002:a17:902:e808:b0:1e5:86ba:88b5 with SMTP id u8-20020a170902e80800b001e586ba88b5mr15538076plg.7.1714457674018;
        Mon, 29 Apr 2024 23:14:34 -0700 (PDT)
Received: from [127.0.1.1] ([220.158.156.15])
        by smtp.gmail.com with ESMTPSA id bi2-20020a170902bf0200b001e27ad5199csm21393298plb.281.2024.04.29.23.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 23:14:33 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 30 Apr 2024 11:43:50 +0530
Subject: [PATCH v4 09/10] PCI: qcom-ep: Use the generic
 dw_pcie_ep_linkdown() API to handle Link Down event
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-pci-epf-rework-v4-9-22832d0d456f@linaro.org>
References: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
In-Reply-To: <20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=k6wJF3EN6aRmkmMhxj7MuPWYMx698jnme1fa7UNZ/38=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmMIwcrYzciZg9ws1bBqYoxIutXEpuRniXqU0RC
 Z7E4BagdfqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZjCMHAAKCRBVnxHm/pHO
 9ZYUB/95SvHPv2j7LsEiAwDAMAlNSKfTzd90sEzInXtrvlRTVsUI5zSswK/S7crXSbscV/TlPEm
 BWhHSdxSvQwPwmjiZ3Q+Qgu79cJG5JPjjb950Xkm0bXreZL6SKa1ACLc39OjrB+XsmjxlwbHWl+
 RE/igJ2z6DSW2QRUyh50nANFwqBqg68+T5ARZ2McCRXsxcCShb3RgMXKgW52kOIBKuWTlVZ8lHV
 f3yuwMgkrH5s1etLMbGA+j3RAn/fNo526Pk8phIxs5nQh17q9KkfcP5YHeJGzM5ZvUxljWzxnHZ
 GPI0pgwZoOi3dMuZxzPZjeTXCsuO982uE8XY4Rc2TPAilmtr
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Now that the API is available, let's make use of it. It also handles the
reinitialization of DWC non-sticky registers in addition to sending the
notification to EPF drivers.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Tested-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 3ee715df36ea..6106b005e66b 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -635,7 +635,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
 	if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
 		dev_dbg(dev, "Received Linkdown event\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
-		pci_epc_linkdown(pci->ep.epc);
+		dw_pcie_ep_linkdown(&pci->ep);
 	} else if (FIELD_GET(PARF_INT_ALL_BME, status)) {
 		dev_dbg(dev, "Received Bus Master Enable event\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_ENABLED;

-- 
2.25.1


