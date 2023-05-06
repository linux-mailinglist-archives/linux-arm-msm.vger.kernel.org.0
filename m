Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 714DF6F9022
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 May 2023 09:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbjEFHdA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 May 2023 03:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231557AbjEFHcl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 May 2023 03:32:41 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309AE9EFD
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 May 2023 00:32:21 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-643fc28c337so55209b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 May 2023 00:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683358338; x=1685950338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+zAQtr5L4Bacr5B+5i29IgpdXCjszEPez4niVXikONQ=;
        b=wFH50Le/fmj4VFIj5E1ssn8UqO1UF/RgItUl8Ehkil1aR1oKGwi6jXvtdYOToJXE3r
         hPA9OvKYf9OGiXOZhCNaEbN9iohK87X74Oja/lyvHOZ/ctJKzU8ZzuHcp+zTZ3MIqgwc
         wZUyvPKfY5JXwjc1pOtVBd1+0wy6d7UlGBRdQpeT8WeuuCNXfY0ZWTlzP2RvgHEWeU2X
         JlPs68wMooNWK3vCjZRCI9umNG7+sgcTxraJde1qMguztx5qYRqKma+4V0E9qiXgIo/d
         QTU6WSw1lXq5FbF7Hi6q61rjFvGSz89PQ8lPpvRyu+UMgWMc5m97z/UueFj02OhvdCe8
         FhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683358338; x=1685950338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zAQtr5L4Bacr5B+5i29IgpdXCjszEPez4niVXikONQ=;
        b=Z+8HCMLa5N3VaIoRwsoZSCz1aE25Q2Wdcp5zVkay753YwhKPtGsRQKdDC9JgZGGjV3
         WB7v3fiTfb1/LGpRWmIme/49cFqMu/H9j/LAPvjKgW8BEgRNFmQgKFCJvr6+eYLAOvTG
         rBK3uGRcjm7QI7fmvnqIGWhqMbM16SE+KNMZWrXi3l7QFvx5iHd+ao0qKOar1mEOvZd7
         ZWsXsw8zAClOdl5WxVqqWtWjlYnFjT4liZ5ce4Iq6JgQ1vROk316Fj0u79RsE/vJ4lCq
         qLT7+bq0nLrASRVjiBeQmdbjGgYceE8MgfhEPFquDJ55+omubFJ5Q1UxJc+eyMXytbUn
         /lSw==
X-Gm-Message-State: AC+VfDw3G2whJ8kVNhUpC4ndxlUno2pQRCyZIUJvX1/zbs/xkIK6cDO5
        ME+BlAWdx57EAV4v3CYRSXMs
X-Google-Smtp-Source: ACHHUZ5qcx9XvDHw8oJ/vjG0RfbrlAlD7KlYkZZ2mdQ3Z9TvV0vgD+Xn6mfSyl6YYSRdBqLK4dRXvQ==
X-Received: by 2002:a05:6a00:1ad0:b0:63b:5f78:d6db with SMTP id f16-20020a056a001ad000b0063b5f78d6dbmr5591751pfv.21.1683358337796;
        Sat, 06 May 2023 00:32:17 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.87])
        by smtp.gmail.com with ESMTPSA id z16-20020aa785d0000000b0062a56e51fd7sm2627373pfn.188.2023.05.06.00.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 00:32:17 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com
Cc:     robh@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, steev@kali.org,
        quic_srichara@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 8/8] PCI: qcom: Do not advertise hotplug capability for IP v2.1.0
Date:   Sat,  6 May 2023 13:01:39 +0530
Message-Id: <20230506073139.8789-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230506073139.8789-1-manivannan.sadhasivam@linaro.org>
References: <20230506073139.8789-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SoCs making use of Qcom PCIe controller IP v2.1.0 do not support hotplug
functionality. But the hotplug capability bit is set by default in the
hardware. This causes the kernel PCI core to register hotplug service for
the controller and send hotplug commands to it. But those commands will
timeout generating messages as below during boot and suspend/resume.

[    5.782159] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x03c0 (issued 2020 msec ago)
[    5.810161] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x03c0 (issued 2048 msec ago)
[    7.838162] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x07c0 (issued 2020 msec ago)
[    7.870159] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x07c0 (issued 2052 msec ago)

This not only spams the console output but also induces a delay of a
couple of seconds. To fix this issue, let's clear the HPC bit in
PCI_EXP_SLTCAP register as a part of the post init sequence to not
advertise the hotplug capability for the controller.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 6fbaf7b419e6..68af95c836d2 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -373,6 +373,7 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_1_0 *res = &pcie->res.v2_1_0;
 	struct dw_pcie *pci = pcie->pci;
+	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	struct device *dev = pci->dev;
 	struct device_node *node = dev->of_node;
 	u32 val;
@@ -424,6 +425,14 @@ static int qcom_pcie_post_init_2_1_0(struct qcom_pcie *pcie)
 	writel(CFG_BRIDGE_SB_INIT,
 	       pci->dbi_base + AXI_MSTR_RESP_COMP_CTRL1);
 
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	val = readl(pci->dbi_base + offset + PCI_EXP_SLTCAP);
+	val &= ~PCI_EXP_SLTCAP_HPC;
+	writel(val, pci->dbi_base + offset + PCI_EXP_SLTCAP);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+
 	return 0;
 }
 
-- 
2.25.1

