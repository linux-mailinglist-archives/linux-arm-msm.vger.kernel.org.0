Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF97B7200A1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jun 2023 13:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234252AbjFBLs1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jun 2023 07:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234849AbjFBLsU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jun 2023 07:48:20 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82501BB
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jun 2023 04:48:17 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-96fab30d1e1so427210666b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jun 2023 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685706496; x=1688298496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0zU7Dw1WndhbqaoD+kPCUAlyhQSbREoS3q5/cnYVdE=;
        b=xU2SB4snMyVjG1gINs7Xdv/dfK4UPJmAHTyyr5SeJBDQgBKiEs+CsENPuT0OzSEXdB
         rvE3NE/8URXDdPboCVvc1PlELSiVNTxO+M7BHpe8+FjSHUZPE76cGnST4v+evNMiqTrg
         n9qzv9WySwDIBJbexI8HTuWbssvRRGnaz4iX4o9hr7Ermijj35iiuORMzHShKOJdqpl1
         co2HCPuyVMvo1hjSW4LA9421Ha1SL5xxej6xAh18ykY9RB+bFCJR+dXd0BudJNhMFMZq
         GxLywVorFzstauhTfthR0INXveF+1K8P3g0ms7mMuf7dz0q8whfT1Wq83NjE0xJiCIzW
         ugig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685706496; x=1688298496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0zU7Dw1WndhbqaoD+kPCUAlyhQSbREoS3q5/cnYVdE=;
        b=S37hombTu9mR5Kp5BiWCtGraBBilXBH30jborZFOvEAKbcsBwv0evV1WCBd05hH5xF
         nebWo/Hqr4BIB1JWbArADpN3jaT6VON6PCDAzNBg9qjzL7FKXpKB38imb/fWKPGlrT35
         M1TBClbLG3BxQTSJeQj/FZmTENfJOfy+KUUuRsO47YC7X9p9qU2orlTZnnaJMiBNlz/e
         yrVyXydfGD2hqdPtEcEUz8OU+KhbOLA6HLYfuhj5tYciBHkfYv/spyWe9mhWq3SJebrq
         UOy//kzETBd9U9375t8aELbfVnq9eW51VIdhTZ+9E27WLjNf1Adp+4g/pavXfm0Qb7J/
         ZnPg==
X-Gm-Message-State: AC+VfDzNPAt1RTBzgxj7WS1Z2FmhMUKvqiLMmFU7wPBesKONbpns8d+W
        Op3YqghRjCHZO5mikuxCHJf1
X-Google-Smtp-Source: ACHHUZ7LI2+IlH59pt8ko3MiFznl/5VBuS17O3Y0YcYRY+ASQi14xiH7FxVxi4thT8WjnUJ3xeofWg==
X-Received: by 2002:a17:907:1c88:b0:976:f2e:ad6a with SMTP id nb8-20020a1709071c8800b009760f2ead6amr50921ejc.28.1685706496436;
        Fri, 02 Jun 2023 04:48:16 -0700 (PDT)
Received: from localhost.localdomain ([117.217.186.79])
        by smtp.gmail.com with ESMTPSA id qu25-20020a170907111900b00974530bb44dsm658924ejb.183.2023.06.02.04.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 04:48:16 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     kishon@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dlemoal@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 1/9] PCI: endpoint: Add missing documentation about the MSI/MSI-X range
Date:   Fri,  2 Jun 2023 17:17:48 +0530
Message-Id: <20230602114756.36586-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602114756.36586-1-manivannan.sadhasivam@linaro.org>
References: <20230602114756.36586-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Both pci_epc_raise_irq() and pci_epc_map_msi_irq() APIs expects the
MSI/MSI-X vectors to start from 1 but it is not documented. Add the
range info to the kdoc of the APIs to make it clear.

Fixes: 5e8cb4033807 ("PCI: endpoint: Add EP core layer to enable EP controller and EP functions")
Fixes: 87d5972e476f ("PCI: endpoint: Add pci_epc_ops to map MSI IRQ")
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/pci-epc-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index 46c9a5c3ca14..0cf602c83d4a 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -213,7 +213,7 @@ EXPORT_SYMBOL_GPL(pci_epc_start);
  * @func_no: the physical endpoint function number in the EPC device
  * @vfunc_no: the virtual endpoint function number in the physical function
  * @type: specify the type of interrupt; legacy, MSI or MSI-X
- * @interrupt_num: the MSI or MSI-X interrupt number
+ * @interrupt_num: the MSI or MSI-X interrupt number with range (1-N)
  *
  * Invoke to raise an legacy, MSI or MSI-X interrupt
  */
@@ -246,7 +246,7 @@ EXPORT_SYMBOL_GPL(pci_epc_raise_irq);
  * @func_no: the physical endpoint function number in the EPC device
  * @vfunc_no: the virtual endpoint function number in the physical function
  * @phys_addr: the physical address of the outbound region
- * @interrupt_num: the MSI interrupt number
+ * @interrupt_num: the MSI interrupt number with range (1-N)
  * @entry_size: Size of Outbound address region for each interrupt
  * @msi_data: the data that should be written in order to raise MSI interrupt
  *            with interrupt number as 'interrupt num'
-- 
2.25.1

