Return-Path: <linux-arm-msm+bounces-15952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0842F893D6B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 17:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 629E0B21438
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Apr 2024 15:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 649CE54FB1;
	Mon,  1 Apr 2024 15:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P9pXu6xj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D4F54FAC
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Apr 2024 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711986691; cv=none; b=aYilBzCRlFP5IWEtPMRCH81PTG14G3cWWsMIQNpfluuCSH7sfw1RrvDApflznD/Z8Ga/zUI+N5XU7KLtFOlG6UWgZCH3oRAKYf+ua8h0grB4lDElkko0Zhg7+Xt5IHltM6+2XkVYRbMPsdY/ay1CX44MlICChGvJ/9pXPQKWU3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711986691; c=relaxed/simple;
	bh=0VVJOyo7HYBClUhbt/r9EGxfFQ/l05qtU//Fuoa9X0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=trgK7xM5sCEdbZgwupUUE77hLxezdYO/mFQF2Ub+EU7mTNLeWGEpDQlua7ZelfeclyfpIz6g73PzdeyAxnGLwn+qeo2USiR8SRisffE/uddIAKVqu7Hqi9QL5RX4rRnsN84U3nqZGaPnlSZVt2cUrLFNPiy9qlCpEOFhtrkd1nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P9pXu6xj; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e0bec01232so31807295ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Apr 2024 08:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711986688; x=1712591488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Egao7uSXQjGCmJvCzduzURkl6MWaOn6AeXM5PE50vzE=;
        b=P9pXu6xjiv1n2LdLz9sxrbaNNK1ooye2idGcwBaNZgmM0t6k1pP2DNEadAkkZJEzLh
         oHjXiEWAdwwdprvR+5swlAvrjJ8qvYx35Vz2IZ/PKpOwjME0mB1DCEkkQH5tjHbmfjPx
         uVE9cvtu5Pc//5+3W1qIe9QORXu2yd7C71a56shyqRbKjW/vmcJOh5dt7HrBObr6uVyo
         pNY/Xb0i4RNAMNTV3M+0EDtzNxTQ5NPpj1g2dETI0evdskgYuu2cftaOp7yNSBx1RCGl
         Q6I4yhPe7GhTFAFJmnxNjZPFScBsCUEfeuZ/xpTywc2sw1aK9g0qTzOR9un2/AZg0wvb
         fjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711986688; x=1712591488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Egao7uSXQjGCmJvCzduzURkl6MWaOn6AeXM5PE50vzE=;
        b=KRYHyMOYBeoioPKjKD7iyVt04zpVs638/Ddb1oRmdmozjW68s1X4K2P7E57Wh02vg9
         nKVXdhWaFGSp18iGnBAHXfVzWoEt/d01bwsh5cZ15NXMHgy4vhpyzyqxHnHCUEBRPEzk
         RuIMCVr5g+/cy8fGlP6FfTt+McE1w+ieozpEIGfgkMTmpdW4anBG006GX1oEivnYJsmF
         rie5lXOFCfULBt4nUoGH3A8vmpAPWkBl1vUrzavCbBFMUzMjdRGKUrOPbETD4krjDQsN
         UaittKc8zpELO6Hj8WyTUdlMer+BEcWWPcUdcK1NXtUb/Si71pbOvkheVyorRyhKtLR7
         N4jQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6oj475mD+Rd7lweIbUJwtoPXtK3o8aV9SvTEqPq1OtGJRr0YnoR22sAUXZmGo5qfuQvHjRXIbU8wBRcKQ+NZgPnjF/aXgUVfoY53d2g==
X-Gm-Message-State: AOJu0YyVT1GYBRfnNetcMgmTpFixvxCRshLmv054vJIvLCsnRXxqiPHz
	yvTqECcjeEQD65nODxAovV9fwZGo1Ou0K4sFwYW0A25tBggI7Kv+eXee9pIXpA==
X-Google-Smtp-Source: AGHT+IFZ1iI9X61JOVfLjJcNjUx4HTJc1QjyHGxJNsBixdS93EWD4TZi1DlIoDdys9j2ZBxKnmF4Hw==
X-Received: by 2002:a17:903:246:b0:1e1:18a:be88 with SMTP id j6-20020a170903024600b001e1018abe88mr8787651plh.10.1711986687672;
        Mon, 01 Apr 2024 08:51:27 -0700 (PDT)
Received: from [127.0.1.1] ([103.28.246.102])
        by smtp.gmail.com with ESMTPSA id kh6-20020a170903064600b001e21957fecdsm8949076plb.246.2024.04.01.08.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 08:51:27 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 01 Apr 2024 21:20:35 +0530
Subject: [PATCH v2 09/10] PCI: epf-test: Handle Link Down event
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240401-pci-epf-rework-v2-9-970dbe90b99d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=0VVJOyo7HYBClUhbt/r9EGxfFQ/l05qtU//Fuoa9X0U=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYkjjun6NwfB+osb3Gw3udvGrly46IJGU+5V9Ya31upt8x
 2var3Pu6mQ0ZmFg5GKQFVNkSV/qrNXocfrGkgj16TCDWJnApnBxCsBEbmWx/2a33f+qbG3GhEC/
 d0npmUbBwsVvNVOerJFnZS/+f/R2IOvnqmP274tTA1U9VF7Ir90hmM8byRTrFMi7hemERjb/mZ0
 N0iJ3fl5ak5JqNl/Judb/wwJpte+ud+N2rFH/ta9OxMrvR8fnkr4JvxZ57lMxWbTS+LMX46mQb/
 fqZXNYr55knZ72LifbcK9GmGTbM/7dPW/+RNfvYlOO2+xwhTs7eOIf5bgFjZWHeRPsbdK/eK7b9
 3VpT3dEOEtAjI++8uRvZ1cfL3zXELeL/YZiZMRZL6u5xSKG9sXne+btjfj792vpAT/Dq1Zfo6oV
 vm7dK8B5sHaHGUvK9ZnnLrD975oowN/NvP/3G8lm3eebAQ==
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

As per the PCIe base spec r5.0, section 5.2, Link Down event can happen
under any of the following circumstances:

1. Fundamental/Hot reset
2. Link disable transmission by upstream component
3. Moving from L2/L3 to L0

When the event happens, the EPC driver capable of detecting it may pass the
notification to the EPF driver through link_down() callback in 'struct
pci_epc_bus_event_ops'.

While the PCIe spec has not defined the actual behavior of the endpoint
when the Link Down event happens, we may assume that at least the ongoing
transactions need to be stopped as the link won't be active. So let's
cancel the command handler work in the callback implementation
pci_epf_test_link_down(). The work will be started again in
pci_epf_test_link_up() once the link comes back again.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 5933788b0e68..2264e72115e5 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -809,6 +809,15 @@ static int pci_epf_test_link_up(struct pci_epf *epf)
 	return 0;
 }
 
+static int pci_epf_test_link_down(struct pci_epf *epf)
+{
+	struct pci_epf_test *epf_test = epf_get_drvdata(epf);
+
+	cancel_delayed_work(&epf_test->cmd_handler);
+
+	return 0;
+}
+
 static const struct pci_epc_event_ops pci_epf_test_epc_event_ops = {
 	.init = pci_epf_test_epc_init,
 	.deinit = pci_epf_test_epc_deinit,
@@ -816,6 +825,7 @@ static const struct pci_epc_event_ops pci_epf_test_epc_event_ops = {
 
 static const struct pci_epc_bus_event_ops pci_epf_test_bus_event_ops = {
 	.link_up = pci_epf_test_link_up,
+	.link_down = pci_epf_test_link_down,
 };
 
 static int pci_epf_test_alloc_space(struct pci_epf *epf)

-- 
2.25.1


