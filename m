Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8814A5B8282
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 09:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbiINH4j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 03:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbiINH4C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 03:56:02 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0A07333B
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:55:15 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id fv3so13768343pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hFaMhiJ2smTY3tKW4XMPUKWJJb1/OofcwoKHsMVmwSo=;
        b=SI9/Uz3M6YTJuRrSklbDpYpOxcVa9EPeijj7hjfrjhgN7PSc0SyAhg2b2p9nJCKCKZ
         DYKQTfC+3xzr5UiTb+m0HrZGWNNosaCAXUZflJpipOHhyJbdBP5uI1Y0YAMho4yudN2z
         okoywYcyQr5939F1C5W8fSNXGDdYGnUjiEa0fk2MTbtseIBDKBWRjWrz6PzcXLtKkgsB
         AEgrR6y0T/6CM3yapiECs5coK3HQcCxUvwSkXuAqJTKABXm5ZKDFw9gX9ZVg7FVeb0CU
         12lioqIJlSzkmWcHFeKOyTTP8u9jrTZXP3BwQVnrYB+uE2ppyUS8t4C9HuROZxNcJobI
         w26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hFaMhiJ2smTY3tKW4XMPUKWJJb1/OofcwoKHsMVmwSo=;
        b=A1VfKYmcwmNmR8ohgXHD6ujHWxPPeYX4ldp67KcT82c8SIWPZT0jqDs683GZG7nNlp
         jZoMHEqrPEEVM1pN8BX2wk7tzcWrVGz4NVFrqtrkOnV5sqTi3qJMwx30We95tOOlE9VW
         lD4Ywss/PXdhKYjcgIm1i6K3eSXfeoUr2UXOBIoF/PYgH8Sygdf4kHFxEQpTQQABIE/+
         2CmXAUTzpqyZCpAp8VtgXAjCZsJdNVW9CZybe+ZdRNk8ujQcJN+4RbUjKlVA/kmBGeyd
         aPRbmT2THRY5TGK4VJ5e6Whg+n/lzoiI7xopiAdJx6ivZS150Csey8N4/6Ulul0E12Y/
         0dmg==
X-Gm-Message-State: ACrzQf2CYPP3YgrLO15inyQJICoAa08fvC0kVJxWG2nM8XfwBQBJL1EH
        6kgzL+x0KTBe52xGNBD6VQBo
X-Google-Smtp-Source: AMsMyM6c2IDayNxwlIUQZQjw88mwOxFAIh5cGe60tsv+xKZ08buMF1QIjqLM4JKeB9FRPixp7FXtmw==
X-Received: by 2002:a17:90b:1b50:b0:202:f495:6b43 with SMTP id nv16-20020a17090b1b5000b00202f4956b43mr3447648pjb.85.1663142114331;
        Wed, 14 Sep 2022 00:55:14 -0700 (PDT)
Received: from localhost.localdomain ([117.202.184.122])
        by smtp.gmail.com with ESMTPSA id p8-20020a1709027ec800b00174ea015ee2sm10119054plb.38.2022.09.14.00.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 00:55:13 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 12/12] PCI: qcom-ep: Add support for SM8450 SoC
Date:   Wed, 14 Sep 2022 13:23:50 +0530
Message-Id: <20220914075350.7992-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914075350.7992-1-manivannan.sadhasivam@linaro.org>
References: <20220914075350.7992-1-manivannan.sadhasivam@linaro.org>
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

Add support for SM8450 SoC to the Qualcomm PCIe Endpoint Controller
driver. The driver uses the same config as of the existing SDX55 chipset.
So additional settings are not required.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 92140a09aac5..16bb8f166c3b 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -789,6 +789,7 @@ static int qcom_pcie_ep_remove(struct platform_device *pdev)
 
 static const struct of_device_id qcom_pcie_ep_match[] = {
 	{ .compatible = "qcom,sdx55-pcie-ep", },
+	{ .compatible = "qcom,sm8450-pcie-ep", },
 	{ }
 };
 
-- 
2.25.1

