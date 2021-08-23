Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBCB33F4DBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 17:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbhHWPt1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 11:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231670AbhHWPtZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 11:49:25 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690E5C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 08:48:43 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id z3-20020a4a98430000b029025f4693434bso5545237ooi.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 08:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AKgdb23zVQQiYBe9YRTyia8uSzqrlES/FzcZLFz+L8M=;
        b=QDu4K/VcDYjt1r8tIck1Xp3hIvZJjnzR5kjlmCXeKzsbzrSD2Ba7XtFJoaomDfZPUU
         lwOyOnb2YPOeYcwrywq47FhuMf1cbrcIGysu/Wxhrxpf3MHCwyp8/SebA3P/exJnoBIn
         G461r198vc/dYxxnRSgQTmiCowdLMLueaIFlfc8QcX1uhpt3L8Sqh1AUfhRCZDoF4Ugw
         1E2dmbvY65IfcVfm+cfBpqXmNf+gfpMLh8bX/ZcfLMbQoVYd1TFSIJ9H1ATP5NcTDqzp
         0NrYmbMbzWDJUpC6RIr5URMbIM0v+t4ZddCndOzwaFyEw6L3es5mCjjkvqcmRjrCvq9t
         dTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AKgdb23zVQQiYBe9YRTyia8uSzqrlES/FzcZLFz+L8M=;
        b=Xevi1VKvw/MUqMSqF0Dn0MMdX6Yjn1G7/bhZAEVmWFpYEmPWdRpNDwW8ZxQNqVhqsc
         hEhWVi/r/jml7haOX1Ww8e5obzmlr8aaPFXKHQGGkj9VfsmEq0biY/JPrwSRgGaQowml
         QWrOYL7mj4tWYiZquMG99zpH+P9/syQENNOCt7Wm3lPnQD40Ev5xbJTGzYwsobAbU1BU
         5JWDGyh3kYR9iJA/JQmvaRwON/1s4C1R1af2cCM0GGO4bAxs5rNWzAwQK37UohVVOv/Z
         GZMnnPvqD91YNMSCb1cwipzcX9Fw7Asp5cl0tWXMtGZQtm7IzWvU16V13RG42qNPRTwT
         QXwA==
X-Gm-Message-State: AOAM532JPVW/YmrOkYJuMqHz6TBFtwTZis6HHITrazp/npZ/x2d7s8gI
        liIJ8cQWlG692BC0bfdqmiseww==
X-Google-Smtp-Source: ABdhPJxSoo10Ko60CXkzwxw9InfSHOFlXC8MR1nsIwYLhTY5lOrDLMeQRVu0W1kdq5sjFNUdOWjBZA==
X-Received: by 2002:a4a:b402:: with SMTP id y2mr26343711oon.89.1629733722788;
        Mon, 23 Aug 2021 08:48:42 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 4sm3704379oil.38.2021.08.23.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 08:48:42 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] PCI: qcom: Add sc8180x compatible
Date:   Mon, 23 Aug 2021 08:49:58 -0700
Message-Id: <20210823154958.305677-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210823154958.305677-1-bjorn.andersson@linaro.org>
References: <20210823154958.305677-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SC8180x platform comes with 4 PCIe controllers, typically used for
things such as NVME storage or connecting a SDX55 5G modem. Add a
compatible for this, that just reuses the 1.9.0 ops.

Link: https://lore.kernel.org/linux-arm-msm/20210725040038.3966348-4-bjorn.andersson@linaro.org/
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 Documentation/devicetree/bindings/pci/qcom,pcie.txt | 5 +++--
 drivers/pci/controller/dwc/pcie-qcom.c              | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.txt b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
index 3f646875f8c2..a0ae024c2d0c 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie.txt
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie.txt
@@ -12,6 +12,7 @@
 			- "qcom,pcie-ipq4019" for ipq4019
 			- "qcom,pcie-ipq8074" for ipq8074
 			- "qcom,pcie-qcs404" for qcs404
+			- "qcom,pcie-sc8180x" for sc8180x
 			- "qcom,pcie-sdm845" for sdm845
 			- "qcom,pcie-sm8250" for sm8250
 			- "qcom,pcie-ipq6018" for ipq6018
@@ -156,7 +157,7 @@
 			- "pipe"	PIPE clock
 
 - clock-names:
-	Usage: required for sm8250
+	Usage: required for sc8180x and sm8250
 	Value type: <stringlist>
 	Definition: Should contain the following entries
 			- "aux"		Auxiliary clock
@@ -245,7 +246,7 @@
 			- "ahb"			AHB reset
 
 - reset-names:
-	Usage: required for sdm845 and sm8250
+	Usage: required for sc8180x, sdm845 and sm8250
 	Value type: <stringlist>
 	Definition: Should contain the following entries
 			- "pci"			PCIe core reset
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8a7a300163e5..f3d9e522cfab 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1554,6 +1554,7 @@ static const struct of_device_id qcom_pcie_match[] = {
 	{ .compatible = "qcom,pcie-ipq4019", .data = &ops_2_4_0 },
 	{ .compatible = "qcom,pcie-qcs404", .data = &ops_2_4_0 },
 	{ .compatible = "qcom,pcie-sdm845", .data = &ops_2_7_0 },
+	{ .compatible = "qcom,pcie-sc8180x", .data = &ops_1_9_0 },
 	{ .compatible = "qcom,pcie-sm8250", .data = &ops_1_9_0 },
 	{ }
 };
-- 
2.29.2

