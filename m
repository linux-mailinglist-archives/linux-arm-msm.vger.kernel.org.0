Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D570F71A13D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 16:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234604AbjFAO62 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 10:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234697AbjFAO6R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 10:58:17 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8189B10C2
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 07:57:59 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1b02d0942caso4140465ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 07:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685631479; x=1688223479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sY5A5rnt2NOAJyTtKsWtQc3JsasD9KssrsfBlXW2O/Q=;
        b=IYdJVlCJSotPGPtwC4vW7HGAcnaVr8EUU9A9Vpe3FcjgsEEcYLSYXOVevPY4etW0Xx
         v9i1p9qr9HDz5xCW+L3itd4/e6EfUH4d5/LfAW0Y1uVOGTPqcqTzdQxkgnybCXu9mjmi
         WxJH+t8oMEJi757fq79Ja3/1VeVGCkH/UgNtTSdVocbOVp6/QACzEsWV6K6SNXBvBafM
         Q23sn+ZkR6OLWqNF3U11ltfADhK24OFMq+5bJE8pP7FMzw4Hh91SL2+C/r7Isne6IwhZ
         LODBjOC4qxYF0hDzDMOAxItuyy+2BV7LuH8DxUQIEwh3wFpblbsKYcVLKGES2cMJqzNL
         rjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685631479; x=1688223479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sY5A5rnt2NOAJyTtKsWtQc3JsasD9KssrsfBlXW2O/Q=;
        b=D9axXvJ1iiJqhi9x82IOwDZPJoQI0lRJjHUW1j3SvkQjbGtaDJQeuMWAMSDlkBjBXZ
         K6TWvX05bPvAn5L12TbZjAQneo41srhxQO4bO6/Ng9pwMfmCzBfr8NNbNTq22pCQAt/d
         i20CBN+V37W5QENkh5CxAp15bS0JVMhgBNMA8O9NNKLR0+YKwVAuuPFYF0lt9D6aLYvM
         +d09ah0aZK/yfqUhvp/UwjU5LbM0i374sg0UQ9T34pgVj+Uvn1oWUDdbMtO1SqE26JKa
         X6l+wuzvGY6FAUpZQm+v/t08qkfA68s/0ft7WKWEqvX9KVj3olGwWh2Ve/6FrcsocgTB
         iD4w==
X-Gm-Message-State: AC+VfDzU876bDDLnfp+7fhDse57pytUv6DPkCb/mq4+x2HzK3uJpWfd6
        ofn65S2Y19P/YypbAhylg//M
X-Google-Smtp-Source: ACHHUZ4AZwJEH5Uke4HzwXK238eiOsWpJ4bFvKceGGcasL4YsACMeBIUw23yGAYRH3xhjNg7kz5mgA==
X-Received: by 2002:a17:903:234b:b0:1ae:3e5b:31b1 with SMTP id c11-20020a170903234b00b001ae3e5b31b1mr7817350plh.9.1685631478915;
        Thu, 01 Jun 2023 07:57:58 -0700 (PDT)
Received: from localhost.localdomain ([117.217.186.123])
        by smtp.gmail.com with ESMTPSA id o17-20020a170902d4d100b001b0603829a0sm3577826plg.199.2023.06.01.07.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 07:57:58 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com
Cc:     kishon@kernel.org, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 7/9] PCI: qcom-ep: Add support for Link down notification
Date:   Thu,  1 Jun 2023 20:27:16 +0530
Message-Id: <20230601145718.12204-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230601145718.12204-1-manivannan.sadhasivam@linaro.org>
References: <20230601145718.12204-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to pass Link down notification to Endpoint function driver
so that the LINK_DOWN event can be processed by the function.

Reviewed-by: Kishon Vijay Abraham I <kishon@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 19b32839ea26..4ce01ff7527c 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -569,6 +569,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
 	if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
 		dev_dbg(dev, "Received Linkdown event\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_DOWN;
+		pci_epc_linkdown(pci->ep.epc);
 	} else if (FIELD_GET(PARF_INT_ALL_BME, status)) {
 		dev_dbg(dev, "Received BME event. Link is enabled!\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_ENABLED;
-- 
2.25.1

