Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 246F126C56C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 18:57:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgIPQ40 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 12:56:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbgIPQy4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 12:54:56 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B24AC014B52
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 06:20:44 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x123so3957565pfc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2020 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SlRt7rB4mW/iayDYnKOqfS2OFUlf7qeJNI2l7CVFG2Q=;
        b=G1FhARCk63c6iPMnPAWQAM+DtyHV4xw6CAA4tru7QJDWs6+BFxO4IRR9c2+1P/xiQU
         6GOF588WmUXXT8NSEPNyOYIdCHgWVEJ8lv3BXgTqeyLPrqq3VbkwNIxMb2eVtnRSZgBT
         AJTPZTBxmJicJM+DeCpKwG9RqQu+ak89sN8Pa2w0K8WC9BpEWN6I0C3vdjxIMgnnl2rY
         wjs9ZGnJVgVhdRhaPRbgIsvmuE+LI8Mjb2m3qoEDsiVNfE2PxQb42/JapQ1isqcXTcAQ
         xW1Xbr7bhY1HHbbCU3obFz13vi7AvCJU+eJjAd3QT5sZc27ofHuijp+y4xfp2zVkuAO8
         8QKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SlRt7rB4mW/iayDYnKOqfS2OFUlf7qeJNI2l7CVFG2Q=;
        b=iGkV6EwWjwXfiBKdC1w38OyRN56NlzhhbsZjopoMjS0oFz02qwmZFVmZIH/+FSn7Tr
         aDtcnhRiLfp3nUHPYgmDNbkUgfbUTORILrglCInkKVA3q//3/Itl1i2JZhQsOnhEmSw9
         mnP2ZdQfWxxkYtSasRAften35N/t512/RevNLP+8gNFCmXwiW8w7TlISO5IzUeRAKt5Z
         Cg+/1tnuhqv54rADjgQ8k8usCdWRan3seBhbafa+wEM90sU4hMl9X49su811XC4/M6Qy
         mKddSLvo+fEYxhubow7FiqQZPgpTbo39Oa7zyAOstbbPOaJdhSzHo7ymbA9UKLSPd/tn
         8etw==
X-Gm-Message-State: AOAM532TKrvaATD2jm3h7JqOu3w8oiL7qnred6bOaVOinNXs9QNBNQbz
        ZbD+d4f2c4B4uTowCyt7l8Wo
X-Google-Smtp-Source: ABdhPJwsG95VpZSqBcV3Pwm6AuVbbi4NnUSh1kO/w9kUI5DaP3pH2VWt8YQjRdKtkRmlf0M9uAGO7g==
X-Received: by 2002:a63:d242:: with SMTP id t2mr18945938pgi.47.1600262443656;
        Wed, 16 Sep 2020 06:20:43 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id e123sm17615726pfh.167.2020.09.16.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 06:20:43 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        vkoul@kernel.org, robh@kernel.org
Cc:     svarbanov@mm-sol.com, bhelgaas@google.com,
        lorenzo.pieralisi@arm.com, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        mgautam@codeaurora.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH 5/5] pci: controller: dwc: qcom: Harcode PCIe config SID
Date:   Wed, 16 Sep 2020 18:50:00 +0530
Message-Id: <20200916132000.1850-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916132000.1850-1-manivannan.sadhasivam@linaro.org>
References: <20200916132000.1850-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hardcode the PCIe config SID table value. This is needed to avoid random
MHI failure observed during reboot on SM8250.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
[mani: stripped out unnecessary settings and ported for upstream]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index ca8ad354e09d..50748016ce96 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -57,6 +57,7 @@
 #define PCIE20_PARF_SID_OFFSET			0x234
 #define PCIE20_PARF_BDF_TRANSLATE_CFG		0x24C
 #define PCIE20_PARF_DEVICE_TYPE			0x1000
+#define PCIE20_PARF_BDF_TO_SID_TABLE_N		0x2000
 
 #define PCIE20_ELBI_SYS_CTRL			0x04
 #define PCIE20_ELBI_SYS_CTRL_LT_ENABLE		BIT(0)
@@ -1290,6 +1291,9 @@ static int qcom_pcie_host_init(struct pcie_port *pp)
 	if (ret)
 		goto err;
 
+	writel(0x0, pcie->parf + PCIE20_PARF_BDF_TO_SID_TABLE_N);
+	writel(0x01000100, pcie->parf + PCIE20_PARF_BDF_TO_SID_TABLE_N + 0x054);
+
 	return 0;
 err:
 	qcom_ep_reset_assert(pcie);
-- 
2.17.1

