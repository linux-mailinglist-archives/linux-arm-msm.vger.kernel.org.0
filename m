Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB367D08B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Oct 2023 08:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376446AbjJTGo2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Oct 2023 02:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347059AbjJTGoJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Oct 2023 02:44:09 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D9C172C
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 23:43:53 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c0ecb9a075so3574265ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Oct 2023 23:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697784233; x=1698389033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBfG7y1wS6npxpsDoB4LPtvQaNRqYIKOIQ4wevmC8p0=;
        b=KUfRVSopeS9Tjh+EHJvDjLv1SdPKOkt+uEn2D2FIg5SH2o1cARYB7l6fwhQCuqkNVY
         wy8LKSZVfALz7zseTynqeuI3SsPADQyAx2/+YV9Yjgy3ijRuDfyx+Q6eM2XpLq+/HWO3
         1hTU09KyzaMuGOKZifs/9e7W2r29RCUXm1ghgSmzkS1hPQMPAP27JMR47c6D887iFU9A
         aFMUJx9amGhJCjPmI/7skuUL9myinyCfjrnV5AWa0jWg6DNib93F+ugSYwOffIFCr7dT
         8gCwpiXqYTtYoRXaR4jQois9ocGtW9gNN/PWkm/qzGiFWdIiN30k4dM2+ZO+7zmZUzjc
         Gfag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697784233; x=1698389033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBfG7y1wS6npxpsDoB4LPtvQaNRqYIKOIQ4wevmC8p0=;
        b=BjGKWmfNLHFTOBX7xvSk52geMh8buZld6sdma+QtrFXlOnOaHJBwPg0f+7dBcLkTQ1
         9sjkesPAgFUMLFXcJ5yxArorrZRK3SELmDeYVawe84275u+WHTLPP+eFS+FKKaXDcnTB
         NZoxyl3o+2BP4CgjsdBO6PQ76/gmpPCQVXu0I+/gB8pGi7ICAlG0yTGxkwexZM7fYuRP
         b8Jk/3S2xtUAM80by+bDr7nxeREYLRSW44Ofc7RGvmvJnJS7rP3tQAmOlWwVq1l1EuUJ
         Zv79GAQLo+4A8upIH71mioLd2jN0ZkpygqBONpyyhaqNjhXUg8U2cc/vIo85PS76QkbT
         R6TQ==
X-Gm-Message-State: AOJu0YyD9di9HVJhx19btUvnFT9LPCautpd9p4C6l3wtKvpiFBZAyfkR
        t3rNXOSXJAKeDZseLpK+jFwC
X-Google-Smtp-Source: AGHT+IHBnmxbWanPC5CN2BOkeTciCen2gLcMRjhDdIc93xy8/IDPdeFK5Ms03eR3Kq0WAmKzTno+ZA==
X-Received: by 2002:a17:902:ea95:b0:1c9:d90b:c3e4 with SMTP id x21-20020a170902ea9500b001c9d90bc3e4mr996805plb.10.1697784232954;
        Thu, 19 Oct 2023 23:43:52 -0700 (PDT)
Received: from localhost.localdomain ([117.202.186.40])
        by smtp.gmail.com with ESMTPSA id t3-20020a170902bc4300b001c60ba709b7sm760951plz.125.2023.10.19.23.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 23:43:52 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     jingoohan1@gmail.com, gustavo.pimentel@synopsys.com,
        lpieralisi@kernel.org, robh@kernel.org, kw@linux.com,
        bhelgaas@google.com
Cc:     linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vidyas@nvidia.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 3/3] PCI: tegra194: Refactor EP initialization completion
Date:   Fri, 20 Oct 2023 12:13:20 +0530
Message-Id: <20231020064320.5302-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020064320.5302-1-manivannan.sadhasivam@linaro.org>
References: <20231020064320.5302-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vidya Sagar <vidyas@nvidia.com>

Instead of doing the initialization complete and notifying it to the EPF
drivers separately, let's call the dw_pcie_ep_init_notify() function that
takes care of both.

Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
[mani: modified the commit message]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-tegra194.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index a962f2c7794f..a8835287fc3a 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1897,14 +1897,12 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
 	val = (upper_32_bits(ep->msi_mem_phys) & MSIX_ADDR_MATCH_HIGH_OFF_MASK);
 	dw_pcie_writel_dbi(pci, MSIX_ADDR_MATCH_HIGH_OFF, val);
 
-	ret = dw_pcie_ep_init_complete(ep);
+	ret = dw_pcie_ep_init_notify(ep);
 	if (ret) {
 		dev_err(dev, "Failed to complete initialization: %d\n", ret);
 		goto fail_init_complete;
 	}
 
-	dw_pcie_ep_init_notify(ep);
-
 	/* Program the private control to allow sending LTR upstream */
 	if (pcie->of_data->has_ltr_req_fix) {
 		val = appl_readl(pcie, APPL_LTR_MSG_2);
-- 
2.25.1

