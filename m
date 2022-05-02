Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5166A516AB6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 08:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383466AbiEBGKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 02:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383469AbiEBGK2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 02:10:28 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF9A5046D
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 23:06:47 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id v10so10957294pgl.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 23:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TFFLVggrg1ac+VShl7a/O0crU97cZXxJdc7Qv9e6jpo=;
        b=MRG6uDZiye2a9VzfSOg9GkFQs5ay31pWHHk2FPZGRApfAdH62jlvIoWohPApjbKOHo
         /O+QVPZE6sLqVffHfG++1ce3NAmeEPvzmU1uGkire2ZaqAQ3LWQoKIw72nQuFTEqzx69
         ngOHLqxqDiNyZtIxUseAHw7OkafI+h7eAX8Z9eIlJ2sJtHK1BBmUfCKh8uEp/me5Qt3J
         7nOkWE5zs6At7golyrghSvRk0or71dM3Ti4DAobUWQyIaSW/E4CVdl4vfwEd6ekDTtf4
         dxqrBIFlQnGhoW3qddIXKiz1GeFexibRJzIPI0A3lREsvkO+eV0cVdqbKMOH7ITG7wNB
         2aJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TFFLVggrg1ac+VShl7a/O0crU97cZXxJdc7Qv9e6jpo=;
        b=po7Wn8LTHvK9EC+LHqR+QtEENt1ZEmEhUUlwArtMvuDGbimUQkvaqfXlE72IU0e1pq
         7iVP/MFr5ntM2GkTJPdVFgXy8DCKFiUgph8GIZilIRp94hm/iJiJ4Mk+Yyd4KMdoKH26
         b706YO00KULL0Du9mHR2IKa6e+yP9bOGLG5l8f8LLLNr9A2m6OQOJoW8clWGSRdrloB7
         haqHi9W4wGsTQBHQOsMPuKh5DjpGeRohjHAn+ld3betKb3ada199ahEEw+/i3nai0hd3
         y2++dW8Wil1tGz62xKx+iN/eddmaQ2SshL/BGTkaOPWTk2oUSU6+MQWLpsQjvJiscF+O
         rkCQ==
X-Gm-Message-State: AOAM530JjLbJSgAT677GQEF5jV3zLHQ5GYMV6SfdywRWAYi8CmtOBuMH
        4xN6zcrEQpnCWJucRYVWq5HN
X-Google-Smtp-Source: ABdhPJw9w/hA1X1uXcsqpbETEhCfGo2yjeVJzZGsedrGj0r7LUsHume70kvxejv+Sc5Z/teqJIEhUA==
X-Received: by 2002:a63:d04a:0:b0:3c1:65f2:5d09 with SMTP id s10-20020a63d04a000000b003c165f25d09mr8574707pgi.201.1651471606339;
        Sun, 01 May 2022 23:06:46 -0700 (PDT)
Received: from localhost.localdomain ([27.111.75.99])
        by smtp.gmail.com with ESMTPSA id h3-20020a62b403000000b0050dc7628181sm3933826pfn.91.2022.05.01.23.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 23:06:46 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     kishon@ti.com, lorenzo.pieralisi@arm.com, kw@linux.com,
        bhelgaas@google.com, robh@kernel.org
Cc:     linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 7/8] PCI: qcom-ep: Add support for BME notification
Date:   Mon,  2 May 2022 11:36:10 +0530
Message-Id: <20220502060611.58987-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502060611.58987-1-manivannan.sadhasivam@linaro.org>
References: <20220502060611.58987-1-manivannan.sadhasivam@linaro.org>
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

Add support to pass BME (Bus Master Enable) notification to Endpoint
function driver so that the BME event can be processed by the function.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 9fb6e960f73d..67ec52ad87bd 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -501,6 +501,7 @@ static irqreturn_t qcom_pcie_ep_global_irq_thread(int irq, void *data)
 	} else if (FIELD_GET(PARF_INT_ALL_BME, status)) {
 		dev_dbg(dev, "Received BME event. Link is enabled!\n");
 		pcie_ep->link_status = QCOM_PCIE_EP_LINK_ENABLED;
+		pci_epc_bme_notify(pci->ep.epc);
 	} else if (FIELD_GET(PARF_INT_ALL_PM_TURNOFF, status)) {
 		dev_dbg(dev, "Received PM Turn-off event! Entering L23\n");
 		val = readl_relaxed(pcie_ep->parf + PARF_PM_CTRL);
-- 
2.25.1

