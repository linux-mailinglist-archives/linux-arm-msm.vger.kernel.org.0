Return-Path: <linux-arm-msm+bounces-39549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D339DC175
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 10:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60496B2157E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 09:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902A8177998;
	Fri, 29 Nov 2024 09:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ot+cqwyk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C8B175D47
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 09:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732872410; cv=none; b=nlsyOTIIM9ADvFFnkT+u/kFXvDV+iwuvUq2PtmMizLUvTNU741do1uV8DaFM2FlL/uc+3atEa+3uCNtmPiPy9shTBThKDaFWO9gkU6GjIRA6V73JSy4SgM0etVAgFScIgNFtGFan+/bap9eWo2EDdB4HXF/DI0gGLwcqQo/UYMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732872410; c=relaxed/simple;
	bh=MHlRYTDbzpte/oyaFieIs0N72WclEbQwNH1n/UIc3uI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SOinklrTZ1Psi7rLVIkCt7S1cRuir1jQdYFf0zQdQVs02pfDs2nKjSmGT30A5GgAiSBK/zhpZK+lLpL7YAyqBI6//0jgOjixdCH2iA4SzJvE6imC6oHA5gbWkr/gomKxpqBSds2jlzaEJlfdyTQFFWEXki7dBn45SfnAuJnBCIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ot+cqwyk; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21288d3b387so11116415ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 01:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732872408; x=1733477208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/FAcNUtBN6sCO+JgOTDya+HEEM74CaemwD9wkIfazI=;
        b=Ot+cqwykEJ6tpRizYZrjGGudxgT2+5Eo9NfsK6wGtjTq4l3pZjEgiH+0swVKVKO7KH
         AahO+SOxSswK9Xx0WGozHh1RbLODzY9h+3m5IyZN886pl6kavX8mUMHIoSeC+9PjT73I
         8ppzS3t7xPmyJa+T+4cMIeGfQ4nyGxg74WC3XGirIg4oIRWUl0t/748OYTkRuiqbiko4
         tjpImJhzRMXAC6WPAsL7QWLLmA1CxerKDV33Rl46XzxJkVpeEi7NPBVYTuOlgTdR/AEH
         JoGaqsZSFURplxNxIWavekQ2oIEznKXxpgdhOEYHdZDIjHruosiPrN0CWoIphUltiqgl
         2pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732872408; x=1733477208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/FAcNUtBN6sCO+JgOTDya+HEEM74CaemwD9wkIfazI=;
        b=S7TzxC4M8PkP0zaGUnYiBriu8b3+eUYaSnfpdMIT8TM9CzpSAVfTGlwqDXC/3AV8Pk
         YZRjgRc4+C6VUCEGYEpKLxpc/pktNyPIqwBV7HXrB4xuKMofoAPCfkXWMI3eHvNFQ4uv
         oze5Edwj9mydCqIjZhQdaFfMk0PfC91TsrrfdzO4lK2qvbfj/tlnh7u1mSAewCB433Wk
         x0/0o7857DGPt2/3Stj7xmBVhftp2pAQmKvpRrt0fTmfZ0I7xdBr5jxE2vTAr/XIG67z
         y+eyxvNF2oPPPiiBvUwY497qK+XhtpYlmaEhS4Fd7QLghb7Q/A5ubhBkRNwrIKVfGiS8
         1DmA==
X-Forwarded-Encrypted: i=1; AJvYcCX6qgopsHJ/1lCFK5WC8dv78m4twGQaPZ+zYxMIz8+G1jk7i79SwwD36UxIP7ragtfWV9FCq81TDk+QEPZw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6aMhDkn1kqz2Bzpn8mDXTHagoeDJexMoJV7Wolk/+jmlY8Z0u
	IA0sYQ8HEnHgACNlFlmOkBxgzxuIrqyTnp5uwIfuZWiXqkE7ECrdvk/gSjaKwA==
X-Gm-Gg: ASbGncvDorMUMXCRvKcW6aciNu+TQWXs0w7f0lYbcE9ZIyKRSQSBNBXI8CS0AIYOV3F
	4QJqthmAUSiVLaDEHP/Bxeu3oO5GD3YYd+ljQw6/tVrvCJlfOZsWvdawxHqA3PbQoxmi/u4PZuS
	9Xjp+G7OjQKopg5h9oWQ8EHzFIq/uG6ZXV9fuN70x8pRUlm9f4YUwBpsh7O5yuVIv3A1VdxlmN2
	G500BX/1Dh8XgAQsOfFWC0cVwi6s3Q3+nNMQegtATZspSauooQ3Wi9DxWJZtrQwWMI7VsRzfZR5
	+Q==
X-Google-Smtp-Source: AGHT+IHN+l6NK+tC7x8F9oy13xLI5GVuVEUr9/bO5jZlgYXRjM7dncdGqnj1qr9Z+oTM9kC3RI9r8w==
X-Received: by 2002:a17:902:ecc1:b0:215:4d90:4caf with SMTP id d9443c01a7336-2154d904ddamr4433805ad.14.1732872408394;
        Fri, 29 Nov 2024 01:26:48 -0800 (PST)
Received: from localhost.localdomain ([117.213.97.61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521987f17sm26648115ad.211.2024.11.29.01.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 01:26:48 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kw@linux.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	lpieralisi@kernel.org,
	shuah@kernel.org
Cc: kishon@kernel.org,
	aman1.gupta@samsung.com,
	p.rajanbabu@samsung.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bhelgaas@google.com,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	linux-kselftest@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	stable+noautosel@kernel.org
Subject: [PATCH v2 1/4] PCI: qcom-ep: Mark BAR0/BAR2 as 64bit BARs and BAR1/BAR3 as RESERVED
Date: Fri, 29 Nov 2024 14:54:12 +0530
Message-Id: <20241129092415.29437-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241129092415.29437-1-manivannan.sadhasivam@linaro.org>
References: <20241129092415.29437-1-manivannan.sadhasivam@linaro.org>
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


