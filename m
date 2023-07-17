Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40A5E755C34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 08:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbjGQGz4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 02:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbjGQGzk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 02:55:40 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE2E173F
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jul 2023 23:55:26 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3a36b309524so3303341b6e.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jul 2023 23:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689576926; x=1692168926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cs9rLL7bx7fqFkHGVFAk/Y/uGVQ21uUextviykreOKw=;
        b=HwNjr2P9tOww+JHwfHyigFNfFxxwdVXSJKEampMs5trspIMhdz8BHhK5rl3S/W6TFL
         c1HH2I67MhDD8U1znqvQDFKe2UaEIpJdo01HAvg184SHDZxpnbeZvekVjiNMX8Cpr00q
         BA9nQuKgHPzvXmahjHV+u9rXszw5fox8gYgg/YyP8UPEB9iMrwOoibSSXX5jG4D9M/42
         AEf7Ck//eBif8RMtSHpNBj0wor7FGxRg6PNADWI0t6EZYFfc35R5xxy/wJLxGKyVU9nZ
         X6zAMxg36DiACfMvEEbnnR/UPLta25+QCtRfmYrdDsdNvf+1Lreng750on8awwF08sMn
         tRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689576926; x=1692168926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cs9rLL7bx7fqFkHGVFAk/Y/uGVQ21uUextviykreOKw=;
        b=E0/OdcffH63zFYkUf2b9+XIAF0z4eQo7q2WSJ19XpuCkf5/BjG2bgs24dPguf1AmJR
         JFsfYQjPI78nmqfi6P5zQe4N+Q/dC9FP43YI12OMspQKUNg/LbuCIpRoSLAW8OFJeSzm
         C5q5YHT0gBS3dTvpdeNYkF8rwf2LKMQWl8oI5KzGxo9GerUyMB5Vo5asSGulAlOxfqJd
         1mhjhfqkv/lAtO7wpOysPtJ5RA25ajjnSYM1zVKzQAfikuSM5JckMnne5bNwIfalPofZ
         J65RH3gXGyBjRJ+OyLlgOoNYKtJ505S0Fx0n+ccZ98awTcZIgjcXDcjYno7G16tsmm9i
         MnqA==
X-Gm-Message-State: ABy/qLajW1cDwUWx7oJEnJATUtobDyyz+tY3Wdtt94s7mwlO38WTO+fC
        e5XgftLP9Z+hOWIKPz05hzCA
X-Google-Smtp-Source: APBJJlFDCOjkLP1HJciyU//FnyxR8lci6MhqHzKtEzgUttdf7ESqGhAlcgoQdSwFhemm0nnGplU+cA==
X-Received: by 2002:a05:6358:52c1:b0:134:d282:92e9 with SMTP id z1-20020a05635852c100b00134d28292e9mr10471981rwz.29.1689576925697;
        Sun, 16 Jul 2023 23:55:25 -0700 (PDT)
Received: from localhost.localdomain ([117.193.215.209])
        by smtp.gmail.com with ESMTPSA id x7-20020a62fb07000000b006675c242548sm11196422pfm.182.2023.07.16.23.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 23:55:25 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     kishon@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 6/7] PCI: epf-mhi: Use iATU for small transfers
Date:   Mon, 17 Jul 2023 12:24:58 +0530
Message-Id: <20230717065459.14138-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230717065459.14138-1-manivannan.sadhasivam@linaro.org>
References: <20230717065459.14138-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For transfers below 4K, let's use iATU since using eDMA for such small
transfers is not efficient. This is mainly due to the fact that setting
up a eDMA transfer and waiting for its completion adds some latency. This
latency is negligible for large transfers but not for the smaller ones.

With this hack, there is an increase in ~50Mbps throughput on both MHI UL
(Uplink) and DL (Downlink) channels.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index dc6692e2c623..a8feb03061aa 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -288,6 +288,9 @@ static int pci_epf_mhi_edma_read(struct mhi_ep_cntrl *mhi_cntrl, u64 from,
 	dma_addr_t dst_addr;
 	int ret;
 
+	if (size < SZ_4K)
+		return pci_epf_mhi_iatu_read(mhi_cntrl, from, to, size);
+
 	mutex_lock(&epf_mhi->lock);
 
 	config.direction = DMA_DEV_TO_MEM;
@@ -354,6 +357,9 @@ static int pci_epf_mhi_edma_write(struct mhi_ep_cntrl *mhi_cntrl, void *from,
 	dma_addr_t src_addr;
 	int ret;
 
+	if (size < SZ_4K)
+		return pci_epf_mhi_iatu_write(mhi_cntrl, from, to, size);
+
 	mutex_lock(&epf_mhi->lock);
 
 	config.direction = DMA_MEM_TO_DEV;
-- 
2.25.1

