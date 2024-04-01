Return-Path: <linux-arm-msm+bounces-15947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE73893D4D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 17:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8F1C1F218BF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 15:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985454F60D;
	Mon,  1 Apr 2024 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RUUo4dZm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C504D9F2
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711986669; cv=none; b=H01HRNiEFQiCckfbvP1u/0hWue567cO/msVLViMOR+YmVpas/CFvjoGVa6baVE0UtIxxNma7Pd6XboruQrMI6yVAOHuWJ7StkjFuA+JlejTdBwrOm0F1D8zwsILlKhLQ+vwqsknMom7ET5mJ3IS6uaHGXdsnuGEN6Yzdl3Hka2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711986669; c=relaxed/simple;
	bh=NTOjNFStN9Mh4j+b7clh1lbnhfGj8ME9hVFJ3hTsGNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tk0UmC+BoN0kpevFxopet7ice3tnrru9VALxbVAfwthxHm328N+hw7q3k3C3PcdKQ/LhetAUxnkyiTKw9iR6yMWtcTBnAY+gcN5h4l8sNX7Xag4Yae6Db+uRtk8V6ZwgWJ1qQSioiA/ZadO46F4ua+KOrstIqwVoPQN6G6bS9dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RUUo4dZm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e23c210accso16170665ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 08:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711986667; x=1712591467; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6tzY8d/xfIhFb+ZbL3y2BfcCJ2gq49NENfnmt3naZI=;
        b=RUUo4dZmWmqppXK116hHg8MW6QumWq6rkywFXhXUWbrDqU8f+9RkDh/+MHkQsSA+Iu
         9KWwqaSGBzLrq9N8+F4x6UjGrFp1O7cnTT4kIla1SnZoPH1oolkfVaqL9wvs5u0pIVtB
         noT13VaS7VVOhaI23E2NiIfGQ1WjmFLGKplHG/WCKNDzRqcuAdLKRvBL3aOfb3bYfxgd
         J8LG6sARLr4dp/boy4XmT7WgdvUOD4HTOD3se+LasPQ73UM1JcJeXnaD3FtPWVT4Q8Jy
         xm4j7F3fervg1pOKw9GBKBvN4j4yv8LJukQOftdcZPQNULiGYUBXr4il0wrqJhMeXIWi
         hiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711986667; x=1712591467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6tzY8d/xfIhFb+ZbL3y2BfcCJ2gq49NENfnmt3naZI=;
        b=NrwycH9C0TKHs/zD/0CMgyKHkPmlO9o/nU4ZlX1AJ3va5ToR4RdYF3n69YbbAC0L+x
         Se3NfItSkiUGdvr044KRFoDOgzQkOor63LSSWEv/YtGzNQxQLHxI2+1sjgDLV1ZvPQew
         FIQe+S6alUtDmZr2baA3ZHXs+41mZKkSydtNj+HW8nntTAAL0YPLaj1B8JfRnX0lPPY7
         9q9IHQBjCoylho6QByiGSeqK4G9x2tear3uC/3DG10ZafuEb4STAHubIXsXVLui2cbm7
         cylPGE8uRxaQ7/z9AhftqKOzCKqaE1e2yvY1ODcMOIfjdEaQurk5YnzT+0brwKLgEYdE
         +zjA==
X-Forwarded-Encrypted: i=1; AJvYcCWG5Eqd56XTHO6nTNJCQcYbNGV/ZQ86NpbRjBb6KqXXoJWsneUsr1+qf69r1/BfpC40N8rUoGX9Q25hPUSi/XGKbgu7VyjdlJvMcgKo7Q==
X-Gm-Message-State: AOJu0Yxw/yyGtltMjCUJCL8nFg5KP1hd8+q3vzwynwFcRU3BgcKfNQQV
	JBwGM+Kyn1ngOaug7ru/cS2uHsmAg/xd6bPDjl260+VMaEPJpup4Qd7zp8nNiA==
X-Google-Smtp-Source: AGHT+IHyJekoMaeQcGcozgAM5pV2dqnXrvcwmxmXkRdSAM0lPTKOjocAwPdmy4VAU/YzGfKeRM/5cw==
X-Received: by 2002:a17:903:244a:b0:1e2:6191:89a3 with SMTP id l10-20020a170903244a00b001e2619189a3mr419731pls.0.1711986667236;
        Mon, 01 Apr 2024 08:51:07 -0700 (PDT)
Received: from [127.0.1.1] ([103.28.246.102])
        by smtp.gmail.com with ESMTPSA id kh6-20020a170903064600b001e21957fecdsm8949076plb.246.2024.04.01.08.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 08:51:06 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 01 Apr 2024 21:20:30 +0530
Subject: [PATCH v2 04/10] PCI: epf-test: Refactor pci_epf_test_unbind()
 function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-pci-epf-rework-v2-4-970dbe90b99d@linaro.org>
References: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
In-Reply-To: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jingoo Han <jingoohan1@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3105;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=NTOjNFStN9Mh4j+b7clh1lbnhfGj8ME9hVFJ3hTsGNo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmCtfUeBbFz6ykVhE/8sBoCrGpBkoYycOQ+OGli
 s6ZAGyAD9OJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgrX1AAKCRBVnxHm/pHO
 9bXSB/4+zDeChvCqyz4AE3yw/LRmzQ+rlSiVQDpQahPNavfvnn0+1pgpkCQfnDMbChWpnzUCYNP
 EJtQO+6sVuNXRdHpb/hokpr3G/rrpcup3rrMpDO7j2vf49DYUJ20H7bdDvU6KrjGvup1jBE8JmR
 rzhqzERdqMM4k1LyMHwV/89+FfrcAnoQNWoAVVwrteSnBSnw5YyKEsESWEDkaxOj59WQJrZuDsY
 E7Xd+YuWSpNunAdxOZJAQadZUxkOM8HVdoyixN+jpxLeaPHTxrHq5X3ZPnTZbOYk06bKtlCIjsc
 lRgaWpBoo6zsNvmr/O8esTCsLHkVpzp/TU6kVQBC2CilHkSp
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Move the pci_epc_clear_bar() and pci_epf_free_space() code to respective
helper functions. This allows reusing the helpers in future commits.

This also requires moving the pci_epf_test_unbind() definition below
pci_epf_test_bind() to avoid forward declaration of the above helpers.

No functional change.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 58 ++++++++++++++++++---------
 1 file changed, 39 insertions(+), 19 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index abcb6ca61c4e..1a4a35e7bf94 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -686,25 +686,6 @@ static void pci_epf_test_cmd_handler(struct work_struct *work)
 			   msecs_to_jiffies(1));
 }
 
-static void pci_epf_test_unbind(struct pci_epf *epf)
-{
-	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
-	struct pci_epc *epc = epf->epc;
-	int bar;
-
-	cancel_delayed_work(&epf_test->cmd_handler);
-	pci_epf_test_clean_dma_chan(epf_test);
-	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
-		if (!epf_test->reg[bar])
-			continue;
-
-		pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no,
-				  &epf->bar[bar]);
-		pci_epf_free_space(epf, epf_test->reg[bar], bar,
-				   PRIMARY_INTERFACE);
-	}
-}
-
 static int pci_epf_test_set_bar(struct pci_epf *epf)
 {
 	int bar, ret;
@@ -731,6 +712,21 @@ static int pci_epf_test_set_bar(struct pci_epf *epf)
 	return 0;
 }
 
+static void pci_epf_test_clear_bar(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+	struct pci_epc *epc = epf->epc;
+	int bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		if (!epf_test->reg[bar])
+			continue;
+
+		pci_epc_clear_bar(epc, epf->func_no, epf->vfunc_no,
+				  &epf->bar[bar]);
+	}
+}
+
 static int pci_epf_test_epc_init(struct pci_epf *epf)
 {
 	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
@@ -860,6 +856,20 @@ static int pci_epf_test_alloc_space(struct pci_epf *epf)
 	return 0;
 }
 
+static void pci_epf_test_free_space(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+	int bar;
+
+	for (bar = 0; bar < PCI_STD_NUM_BARS; bar++) {
+		if (!epf_test->reg[bar])
+			continue;
+
+		pci_epf_free_space(epf, epf_test->reg[bar], bar,
+				   PRIMARY_INTERFACE);
+	}
+}
+
 static int pci_epf_test_bind(struct pci_epf *epf)
 {
 	int ret;
@@ -897,6 +907,16 @@ static int pci_epf_test_bind(struct pci_epf *epf)
 	return 0;
 }
 
+static void pci_epf_test_unbind(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+
+	cancel_delayed_work(&epf_test->cmd_handler);
+	pci_epf_test_clean_dma_chan(epf_test);
+	pci_epf_test_clear_bar(epf);
+	pci_epf_test_free_space(epf);
+}
+
 static const struct pci_epf_device_id pci_epf_test_ids[] = {
 	{
 		.name = "pci_epf_test",

-- 
2.25.1


