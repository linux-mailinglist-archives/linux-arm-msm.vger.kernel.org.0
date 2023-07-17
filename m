Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23970755C30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 08:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbjGQGzq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 02:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbjGQGze (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 02:55:34 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15BF10CC
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jul 2023 23:55:23 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-666ecb21f86so4255279b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jul 2023 23:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689576922; x=1692168922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/T79Vv6wGjrVta/fmtMY7cgnbUYDWoxJshDnFQvPqc=;
        b=Z2kjvW81cGF4WC3fZ8mJfRP6pHhzBxZZsveK2Hm9KB0SbDlt3BTTn5jKlIrpLDHwU7
         CKcSg6FQZt8si2sebsYOUfRrT9zbWHr9itL9AR9XV1P5qt4tC2x5FVvCH8XHWsNrbunY
         Iu/ivd42A1hBph2V2tURzamxOgIifZv8OoSfua3Jjps1iLa/48VgxRx6pb2xLLf9D2A1
         4I0HY4+tybPvOf7a2FTqMPgPkPAetiHo5z0XrNa1ILxWfLZSVbLX7JapAQ+xsW8x5lJ/
         qDTwe7QMnHaw1VfU4/5Pj3rrPN6eqjuDRyKPeJBOszCr+44w4zNHyKetqZbifJBo1G7t
         INGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689576922; x=1692168922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/T79Vv6wGjrVta/fmtMY7cgnbUYDWoxJshDnFQvPqc=;
        b=bFMr1z08Qh04e2fnqBFfs7Fr1hmjwN7kd3ammoDkqSl8eBz+F8eXdZmYOf1lN+CZsE
         cuw+e8yxBL7bSkkoVr+BL2ErfYlqtVgKdSuFbaqdOuZezeZC/c5a6q4vbolDcl9W+GmM
         tC60+r0tI+dBmqGsoTC1vJcsPsHOnElPIgZDvRAe5Bn3bjYkNh6ZaZUUfipaRugHoj55
         hyFjSFjgjcUw0nCcfjACSLptm10pot/6WNCQ9XQSX0kMkKPjZutuUd77x44m1vdBCcZA
         7DPU15NjmcbyW/+nk8gzNKNG2gi0f0SUaGlmoRmSMd+TtyNuOTl6iR1L0zUonSgq2ndy
         h8kQ==
X-Gm-Message-State: ABy/qLbymKdW529f7z9KHwohOux0E+Hpg0q2F4ZOh2U+AR5IEQAKnZ7m
        xt7ns4VAtSXrOtYViFdRLZTa
X-Google-Smtp-Source: APBJJlGWeDR7fa8qu4RGbFb0Tqi7boukHnnBpPo/bu1v57jX4jKjFKsBIjH5iAA3OLSDbx96+ZfQFw==
X-Received: by 2002:a05:6a00:851:b0:668:9fb6:b311 with SMTP id q17-20020a056a00085100b006689fb6b311mr17759321pfk.32.1689576922468;
        Sun, 16 Jul 2023 23:55:22 -0700 (PDT)
Received: from localhost.localdomain ([117.193.215.209])
        by smtp.gmail.com with ESMTPSA id x7-20020a62fb07000000b006675c242548sm11196422pfm.182.2023.07.16.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 23:55:22 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     kishon@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 5/7] PCI: epf-mhi: Add support for SM8450
Date:   Mon, 17 Jul 2023 12:24:57 +0530
Message-Id: <20230717065459.14138-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230717065459.14138-1-manivannan.sadhasivam@linaro.org>
References: <20230717065459.14138-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Qualcomm Snapdragon SM8450 SoC to the EPF driver. SM8450
has the dedicated PID (0x0306) and supports eDMA. Currently, it has no
fixed PCI class, so it is being advertised as "PCI_CLASS_OTHERS".

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/endpoint/functions/pci-epf-mhi.c | 22 +++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
index abebe44d0061..dc6692e2c623 100644
--- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
+++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
@@ -97,6 +97,23 @@ static const struct pci_epf_mhi_ep_info sdx55_info = {
 	.mru = 0x8000,
 };
 
+static struct pci_epf_header sm8450_header = {
+	.vendorid = PCI_VENDOR_ID_QCOM,
+	.deviceid = 0x0306,
+	.baseclass_code = PCI_CLASS_OTHERS,
+	.interrupt_pin = PCI_INTERRUPT_INTA,
+};
+
+static const struct pci_epf_mhi_ep_info sm8450_info = {
+	.config = &mhi_v1_config,
+	.epf_header = &sm8450_header,
+	.bar_num = BAR_0,
+	.epf_flags = PCI_BASE_ADDRESS_MEM_TYPE_32,
+	.msi_count = 32,
+	.mru = 0x8000,
+	.flags = MHI_EPF_USE_DMA,
+};
+
 struct pci_epf_mhi {
 	const struct pci_epf_mhi_ep_info *info;
 	struct mhi_ep_cntrl mhi_cntrl;
@@ -654,9 +671,8 @@ static int pci_epf_mhi_probe(struct pci_epf *epf,
 }
 
 static const struct pci_epf_device_id pci_epf_mhi_ids[] = {
-	{
-		.name = "sdx55", .driver_data = (kernel_ulong_t)&sdx55_info,
-	},
+	{ .name = "sdx55", .driver_data = (kernel_ulong_t)&sdx55_info },
+	{ .name = "sm8450", .driver_data = (kernel_ulong_t)&sm8450_info },
 	{},
 };
 
-- 
2.25.1

