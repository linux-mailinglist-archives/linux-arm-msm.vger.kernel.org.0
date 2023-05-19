Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9BB47099C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 16:31:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232078AbjESObi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 10:31:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232052AbjESObe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 10:31:34 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADB513D
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 07:31:32 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2538aa25873so367952a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684506692; x=1687098692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Bi50f5L0jGxtEOM93kXczyai8aQgRkFZvqXAKgUqmc=;
        b=yD3mO6K0EvTiN4Naa/DozA6hIjtQTgHVgQt4moGa/KGv4v5B63GeIvO3qDECQj/Gme
         gyBHMnT+sI+6shkU+wskP589SVzXNmHQwE/Fu27oqrNjhmrzj5n84BntMgAhLxXSgb/d
         ZclSZiikp/D5So6irRhaQ4jklC9n6VbRwYLy2lAsEL+8JXPk1ymjyxfGQtpyj8yGk8Xd
         KdYQp71QqLNu0yNbSbHcqGA0auRz9hK8lf7znPt/dgW2kUMMZJne6vrAlDGm2Z+fu+PY
         xnLY1AetghCOMpToI1lmshVOFFeymuy48iTcrdG1ToCqATGaUytHG6dK7buSziwJ2jAA
         FhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684506692; x=1687098692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Bi50f5L0jGxtEOM93kXczyai8aQgRkFZvqXAKgUqmc=;
        b=U6npwW78FRbwUPNz/2nBdTAAOmHy5fFuTZeEB+BA/BB9425KCrmrIC0Cs55XSHdLoO
         8E4Pg94LPQpnholCBNYEHDrmY5PfVY4KxMo2hkj9LHDqDhCDhSxibTPu3bzUGqO+NW3R
         t7qCg+IxgQ1V+jDEJsRlCPLg/+rsNbZibW9zRwyp1ShgKR1MklCy5l5CgGdrCEmI0aBI
         jtx9iLdbOgB6NjziUS+F0JwAaAu9BNVE7/UE4ArCNR/F3b4nQXB8fmHxe4rcIeKPe5b/
         RgnNb1l2A6PeQte1a93/h+pj82eDC3fen7cp8DJ0yFFsxpKcvuuI+HOEQibV2LWlmZV9
         n4YA==
X-Gm-Message-State: AC+VfDxpsvrxMxSWzhEMcGS6Z+6NwgJKgkVl3rMGV/tV4B7mIyTj+SYe
        tJ8d3ADDKUK1I0TbbdnDArR6
X-Google-Smtp-Source: ACHHUZ7knjUfYB/9YkOHpm22pTBXswWJBzCMz+6zwetUg2n7YB4386FdAs1VqhDTZKaMgtoN7O0vWQ==
X-Received: by 2002:a17:90a:bf8b:b0:253:727e:4b41 with SMTP id d11-20020a17090abf8b00b00253727e4b41mr2278226pjs.34.1684506692003;
        Fri, 19 May 2023 07:31:32 -0700 (PDT)
Received: from localhost.localdomain ([117.202.184.13])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a09a100b00250d908a771sm1634845pjo.50.2023.05.19.07.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 07:31:31 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com
Cc:     robh@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, steev@kali.org,
        quic_srichara@quicinc.com, dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@gmail.com>
Subject: [PATCH v2 1/8] PCI: qcom: Use DWC helpers for modifying the read-only DBI registers
Date:   Fri, 19 May 2023 20:01:10 +0530
Message-Id: <20230519143117.23875-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230519143117.23875-1-manivannan.sadhasivam@linaro.org>
References: <20230519143117.23875-1-manivannan.sadhasivam@linaro.org>
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

DWC core already exposes dw_pcie_dbi_ro_wr_{en/dis} helper APIs for
enabling and disabling the write access to read only DBI registers. So
let's use them instead of doing it manually.

Also, the existing code doesn't disable the write access when it's done.
This is also fixed now.

Fixes: 5d76117f070d ("PCI: qcom: Add support for IPQ8074 PCIe controller")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@gmail.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 4ab30892f6ef..01795ee7ce45 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -61,7 +61,6 @@
 /* DBI registers */
 #define AXI_MSTR_RESP_COMP_CTRL0		0x818
 #define AXI_MSTR_RESP_COMP_CTRL1		0x81c
-#define MISC_CONTROL_1_REG			0x8bc
 
 /* MHI registers */
 #define PARF_DEBUG_CNT_PM_LINKST_IN_L2		0xc04
@@ -132,9 +131,6 @@
 /* AXI_MSTR_RESP_COMP_CTRL1 register fields */
 #define CFG_BRIDGE_SB_INIT			BIT(0)
 
-/* MISC_CONTROL_1_REG register fields */
-#define DBI_RO_WR_EN				1
-
 /* PCI_EXP_SLTCAP register fields */
 #define PCIE_CAP_SLOT_POWER_LIMIT_VAL		FIELD_PREP(PCI_EXP_SLTCAP_SPLV, 250)
 #define PCIE_CAP_SLOT_POWER_LIMIT_SCALE		FIELD_PREP(PCI_EXP_SLTCAP_SPLS, 1)
@@ -826,7 +822,9 @@ static int qcom_pcie_post_init_2_3_3(struct qcom_pcie *pcie)
 	writel(0, pcie->parf + PARF_Q2A_FLUSH);
 
 	writel(PCI_COMMAND_MASTER, pci->dbi_base + PCI_COMMAND);
-	writel(DBI_RO_WR_EN, pci->dbi_base + MISC_CONTROL_1_REG);
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
 	writel(PCIE_CAP_SLOT_VAL, pci->dbi_base + offset + PCI_EXP_SLTCAP);
 
 	val = readl(pci->dbi_base + offset + PCI_EXP_LNKCAP);
@@ -836,6 +834,8 @@ static int qcom_pcie_post_init_2_3_3(struct qcom_pcie *pcie)
 	writel(PCI_EXP_DEVCTL2_COMP_TMOUT_DIS, pci->dbi_base + offset +
 		PCI_EXP_DEVCTL2);
 
+	dw_pcie_dbi_ro_wr_dis(pci);
+
 	return 0;
 }
 
-- 
2.25.1

