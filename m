Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9699A7200B4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jun 2023 13:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234942AbjFBLtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jun 2023 07:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235156AbjFBLtT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jun 2023 07:49:19 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24DB910DE
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jun 2023 04:48:47 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-974265a1a40so687673466b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jun 2023 04:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685706526; x=1688298526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jN1DFdq3v+G4ZtKLRtAY1iZ3VaX7EJSiV3mNgkD3+0=;
        b=fgJ9d0gC66MmH9yZ6G/kQEzeBbcRAEGBdK81vpdKYumSID5QE+T1+pqhICpCetTOZT
         413Vtx+Whyw1o2E0KyUi4n1HG1jT8YQ9jqeX/gR9tBUHoFsuSS8UfU0dy9QctLyANAyF
         g4AfX8656D76Vq0E4xKNAZWuh7XM4f4b4EBdZjBv0gBMoJgfHrHgiWAEUL+mXjQodif9
         QwTYPpWY0KuYNGOVyV7oVZZriTGQOnGkKKbEke+ETehknAhpqjVrbdzd2nstuVhGVVRI
         +IRRW98+ONYrtLyYa1MwPeE9WXIt9et+dq+ZUiZvg64gErsYBy98KxBEJYq3MJlnevnO
         IqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685706526; x=1688298526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jN1DFdq3v+G4ZtKLRtAY1iZ3VaX7EJSiV3mNgkD3+0=;
        b=jnqhh1d5s1yBlyQTIzEKdodkNLYOLb8u+hgPY8l4VKq6t1M23cwaULpCjrwpl7Lzsg
         /rZFLrXGcD6tZqZ+USNws0PVHFLbuxWksz/Sp5xSgX2Qji583PTrxET+Q5oBSjoz/yA2
         rb4/Rr1YukTtHeA7HwFc4/8KPaL4m3iB0iUDrH2JIgvp0jliOBiNLJCuMmYiZmTaEect
         YpPTQwjFoMHpgsgY9uSioL/PwUDKj1lA/Bc0dGA/wxctwebuU6hZ1QxIDFfamUwFKylw
         dCYIep6oSWLPKDIqPgMNvyQ1tjzyVFylHxnwrGZadUFi4y57JmqcMrs9Gh/mR2YKPp51
         5tjw==
X-Gm-Message-State: AC+VfDy3Y9yhKzcmEYyzvtLljTRJTA42qM0bFILQSxHBXNq9VA1suq/y
        PTf1UPTBmELKwxkViVF5Vj6e
X-Google-Smtp-Source: ACHHUZ4R49ZdyNxhsTOQyfS6IO+unlD/2kxVmaZwdq0TDNSGMuepnDPZJzd0yLW3wXmeYJTdmiInhQ==
X-Received: by 2002:a17:907:9709:b0:965:ae3a:52c8 with SMTP id jg9-20020a170907970900b00965ae3a52c8mr4168161ejc.32.1685706526634;
        Fri, 02 Jun 2023 04:48:46 -0700 (PDT)
Received: from localhost.localdomain ([117.217.186.79])
        by smtp.gmail.com with ESMTPSA id qu25-20020a170907111900b00974530bb44dsm658924ejb.183.2023.06.02.04.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 04:48:46 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     kishon@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dlemoal@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 7/9] PCI: qcom-ep: Add support for BME notification
Date:   Fri,  2 Jun 2023 17:17:54 +0530
Message-Id: <20230602114756.36586-8-manivannan.sadhasivam@linaro.org>
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

Add support to pass BME (Bus Master Enable) notification to Endpoint
function driver so that the BME event can be processed by the function.

Reviewed-by: Kishon Vijay Abraham I <kishon@kernel.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 4ce01ff7527c..1435f516d3f7 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -573,6 +573,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
 	} else if (FIELD_GET(PARF_INT_ALL_BME, status)) {
 		dev_dbg(dev, "Received BME event. Link is enabled!\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_ENABLED;
+		pci_epc_bme_notify(pci->ep.epc);
 	} else if (FIELD_GET(PARF_INT_ALL_PM_TURNOFF, status)) {
 		dev_dbg(dev, "Received PM Turn-off event! Entering L23\n");
 		val = readl_relaxed(pcie_ep->parf + PARF_PM_CTRL);
-- 
2.25.1

