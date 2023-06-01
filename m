Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12A7A71A1C3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 17:04:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232949AbjFAPDx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 11:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234657AbjFAPDl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 11:03:41 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 570C82122
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 08:02:33 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b04706c85fso8950395ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 08:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685631683; x=1688223683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAFeVd+dwK+9T/TQ3aqc3usXxG9M6VjGUKGIkkMeOq4=;
        b=SX+BIkngzKzYRFKhsNp95dh7zWKTA1kb5QAAFgWG2NWebTcfDnznm+pD+ff915iZMO
         tBOaulh0/a8u4OLG+4/YaTkThYpYmHjmEDAe8hkLkzILwsYDgxlpmGARw1iZO6bwYrqo
         DgcoO2jriCI2vU6d+KQU0mA0uJ3m/fJzlix3nz4gpST3dIWfOk98xvJT5ipyoSL4XH1m
         GL3hp6b3f7+To59JkvAJhxc0V5S3BkU4NvfbhxPKon0SfcVB6S1m+qI9+C6/hHCxm0Up
         tdhC6VMzJ8RgHmZA+pdAJKnsBg6DFFQ7zQNCgvVCVN/jV1RlUNJDNlg1UKHJRVNnOkQb
         SG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685631683; x=1688223683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAFeVd+dwK+9T/TQ3aqc3usXxG9M6VjGUKGIkkMeOq4=;
        b=YEvX6Q6P9qdyPrz1f8FnvpfBjQs4WfELTBi1HBop9sSIOpvTC7Q/Kk3rPmhZ1dnhAV
         PERiyXBYh2dOz+Rwb4FM1gd3aV9IiK+Djda97F4KP0aYYxI3upmVrePunEJB0aQ2Qeof
         iRF0i/zCPfEgNRNFPvfQ41xME43aelRwCf2OI0NqMg9d/t27zJcqxDMBY+9rFGlxE9/6
         6sN+1DyyK0oQPgcUc717GGORG6eNAQywc/5oUuGuyRZrTG5ToPVhnfBCwdff+BWqpOwE
         HzHq2Y8Mw3otVsRVJ9fNEIyMHySZjsQn0Bh/EI+NZeR68+b0LRZ1dP3TKNtNqtEQvuoA
         wG4Q==
X-Gm-Message-State: AC+VfDyUAhsHdb5ffDOMn+vaoG+fHoQCShjPgTYWbmgamCA2SwCajUkf
        GpwbnhN/bmfdpNyV3HYwz563
X-Google-Smtp-Source: ACHHUZ6QOo5ARvwszO6PQhxgQry+278ZPmIgukEv7g4yVmOVQsDHcTNEAQtS0AKFVAYwq6GWYgheXA==
X-Received: by 2002:a17:902:c20d:b0:1b0:4c32:5d6d with SMTP id 13-20020a170902c20d00b001b04c325d6dmr8966653pll.31.1685631683470;
        Thu, 01 Jun 2023 08:01:23 -0700 (PDT)
Received: from localhost.localdomain ([117.217.186.123])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902dac700b001b0499bee11sm3595480plx.240.2023.06.01.08.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 08:01:23 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     kishon@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH v5 1/9] PCI: endpoint: Add missing documentation about the MSI/MSI-X range
Date:   Thu,  1 Jun 2023 20:30:55 +0530
Message-Id: <20230601150103.12755-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230601150103.12755-1-manivannan.sadhasivam@linaro.org>
References: <20230601150103.12755-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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

