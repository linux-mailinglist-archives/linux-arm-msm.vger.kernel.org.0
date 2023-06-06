Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 386AD72416F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 13:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237218AbjFFL6d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 07:58:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235796AbjFFL6d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 07:58:33 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6C5010CE
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 04:58:29 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1b04706c974so51955175ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 04:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686052709; x=1688644709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCaUDE4A9Imgmixgd3Y+GDeqRFqT+5tR5O8CZs6HCl8=;
        b=OutYyqP2xn67DBS724mHcqAKPlm5BziPEw9lgNNo/rpmoJrqoCOo0m77dboBQ5dYwS
         taARkLSVyKUedrKlkYHLmbaj2CIa59MSfjPwVoS2F1OCt9S24/0MBzbEnktIvBIjfQOk
         tvtR7z0eU3V4+O4A9eOkVpKnhOE+PLvZhTgsBGCSFPRgzau4LhkqjmQtviGpLqWhAVg/
         aSFObId+faFtVHRbKDQN4u4PWUAbikKrGtI1xGfuPbFydxcqDmnBlZwISk6dTx89OBHZ
         D4vL/PaFiuU+QGfz+zakip6Dyn3Yt4UZtxRN9bALIA/2AAHWtG+u6NNVLsAnLBTwu5Dx
         125A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686052709; x=1688644709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCaUDE4A9Imgmixgd3Y+GDeqRFqT+5tR5O8CZs6HCl8=;
        b=FB+JCUqsHxBh3qCWHz+jRpMWDeY10U0cv6Y3P48O7WaP15eZpFhgWIBLhLtKf6xPJe
         Bu2dNZr7ZSZIppWwm0NGmqLBGmLqAza4ViIeSr3q3GsNx/P+uXr8zoRKF0LJ4rn85n0k
         S1vfijz3vLwI25/5qDkUGb4b6ZDfxYGnpx81O1cgDyQSbPcANZK8oIRrBSZAQJ82Jkq8
         Pn4+JRHUpm88wdqK+bmgU8EcVXNznEq8tWfa03bonB/D7bjtppU7Hn8ye6NDvbs9hMZf
         mfCVeEZpOmP+wf9GDt1wF51aTGW6DSee+JXRj9WMpPLN8qtOBpcazpXp1T0QCUhDXJUe
         H84g==
X-Gm-Message-State: AC+VfDzkYxoF/njcMUTEL3wdR4asNDcZHw2lDoqB8taKLbePxl3wkzaF
        uAjv9y4uOLoycuuZZPk2s16C
X-Google-Smtp-Source: ACHHUZ7LiLTUZzIr7HVLq0dVaYBc4JzUaiFd97KbZ9P7zFK9qNmSK6k1+OyEzgML1k4N9ldhuGeh5A==
X-Received: by 2002:a17:902:c411:b0:1ac:5717:fd5 with SMTP id k17-20020a170902c41100b001ac57170fd5mr2830030plk.60.1686052709081;
        Tue, 06 Jun 2023 04:58:29 -0700 (PDT)
Received: from localhost.localdomain ([117.202.186.178])
        by smtp.gmail.com with ESMTPSA id b5-20020a170903228500b001acaf7e22bdsm8419226plh.14.2023.06.06.04.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 04:58:28 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     kishon@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/7] Improvements to Qcom PCIe EP and EPF MHI drivers
Date:   Tue,  6 Jun 2023 17:28:07 +0530
Message-Id: <20230606115814.53319-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
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

Hi,

This series adds eDMA (embedded DMA) support to the Qcom PCIe EP and EPF 
MHI drivers for offloading the transfers between PCIe bus and the EP
memory. eDMA support makes use of the recently merged eDMA DMAEngine driver
and its integration with DWC PCIe EP core [1].

This series also adds Qcom SM8450 SoC support to EPF MHI driver that has
the eDMA support built-in.

- Mani

[1] https://lore.kernel.org/all/20230113171409.30470-1-Sergey.Semin@baikalelectronics.ru/

Manivannan Sadhasivam (7):
  PCI: qcom-ep: Pass alignment restriction to the EPF core
  PCI: epf-mhi: Make use of the alignment restriction from EPF core
  PCI: qcom-ep: Add eDMA support
  PCI: epf-mhi: Add eDMA support
  PCI: epf-mhi: Add support for SM8450
  PCI: epf-mhi: Use iATU for small transfers
  PCI: endpoint: Add kernel-doc for pci_epc_mem_init() API

 drivers/pci/controller/dwc/pcie-qcom-ep.c    |   5 +-
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 280 ++++++++++++++++++-
 drivers/pci/endpoint/pci-epc-mem.c           |  10 +
 3 files changed, 281 insertions(+), 14 deletions(-)


base-commit: 1966e58011bc65eccf6d862096a94e4930ba4fe2
-- 
2.25.1

