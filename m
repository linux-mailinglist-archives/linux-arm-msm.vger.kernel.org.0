Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 913C2724185
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 13:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbjFFL7T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 07:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237401AbjFFL7G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 07:59:06 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98E61723
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 04:58:52 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-652a6bf4e6aso2758878b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 04:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686052732; x=1688644732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/A31/i+m7BU2Bqbrm76M8ZCTI2bY2FunS+Zgw078wns=;
        b=NhFzPGK/LgXepWwy2zWYeTVSabXVDTmt8ct8uR0krlenAq1FVuPal+C5uyWaBMAvWB
         olBB/nZ90xyde17yuqRavAiVOmguy6+B6tJrxDAS6B2d4HJj9Z7J8B+GSKVW5dLTr06w
         gCUERydedQoK94netVwSSc1q+ZYPBfSa1XrwutHn51E9h24MMvvUO101pyo5XaYTTTsg
         4tX8baj1Mxn6SJii54yc6J2GjgTg5DANSJ1qvQO0/3paMMjogfTu3oLn0+jjlHXgcYft
         9H2mAY/7+/YxQBxKRBQhM8QcUxVEO1CJNM9lAFo9WztFujCmpovCta1TKGvk0/wxzeub
         ysNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686052732; x=1688644732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/A31/i+m7BU2Bqbrm76M8ZCTI2bY2FunS+Zgw078wns=;
        b=QmhjdeZJUd5kLkB5nhq92hUKnRFRhFZUqs16BKJuL+ij7I/oJeQ6G7w6VWhkaFzmEu
         zE3471TFgoLU5pueIYuprx2wcvZmnjggO96UoFzgQqUVBeg80rK/JFFGT5vE/h8Aym2T
         MExX3vKNjB9oFC8fBd3JBcqIBin/MI0yiy1MALVVrvCcL3MG+TeIr+A3JZpleJuWe6vH
         XugR8YAimRfeduEvo/4AT8gYiYejITXvaB7OlScqvqvyt+r82bl0aYQQIPt4cFcWRmcg
         JIACjoENrAMv9OvL83DnKCSq+8mgK9DD/tdsjqsrD5tYM/6VE6tl4etf4yoVm32Ch6KZ
         KG8w==
X-Gm-Message-State: AC+VfDwj0iuk6NQNh+wA8rzT2wFrWKfbOwZlYuJNVY2cZfi00qG95UQU
        LgD4o5EBIHM+ajc9DzLd6WUv
X-Google-Smtp-Source: ACHHUZ427+RHw6YrOxFJmdnCmiR67XrtYFqFzTz2NL98BS5AZnestvUvppQJ6wrLGfIAPOyHBMZqVA==
X-Received: by 2002:a05:6a21:3290:b0:10c:7c72:bdd6 with SMTP id yt16-20020a056a21329000b0010c7c72bdd6mr954741pzb.59.1686052732117;
        Tue, 06 Jun 2023 04:58:52 -0700 (PDT)
Received: from localhost.localdomain ([117.202.186.178])
        by smtp.gmail.com with ESMTPSA id b5-20020a170903228500b001acaf7e22bdsm8419226plh.14.2023.06.06.04.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 04:58:51 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     kishon@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 6/7] PCI: epf-mhi: Use iATU for small transfers
Date:   Tue,  6 Jun 2023 17:28:13 +0530
Message-Id: <20230606115814.53319-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230606115814.53319-1-manivannan.sadhasivam@linaro.org>
References: <20230606115814.53319-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
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
index f4d1d60bde56..94cf68bdd235 100644
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

