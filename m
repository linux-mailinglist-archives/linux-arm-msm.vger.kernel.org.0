Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0075B448F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 08:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbiIJGcW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 02:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230495AbiIJGcB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 02:32:01 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB983A2212
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 23:31:53 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id n12so6576184wru.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 23:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zNrBu1Ho157JvXJ7EWepzZnt5L0+FsXJv3lwmZhG3S4=;
        b=x5AhAk6exijllo3hNAdUCc/4Toj6Fn5p00CYLk3KAbz6bGFHb2RbQxUuuVQIy/s6bt
         t6DQeEBmuigNnf68+8pqMKJrKD8//MARKAom2/5NUSVbT7Ibp9xdWvts8LOuISarlO5E
         f9gOzHsuHIcuxU+fqM9e2wdIMeaVwis4s0awIpMkmHB+5KgWJD+CCqFJPHztLROES8oq
         sVrSNl3t/hM5Dpgn0+SfMr+qB7YnULMkLqyiZfYqQvBrArzYIfbnovKcrSYrHd6pufNG
         RSIBnPieZ/kA8OHDVh1TBACiXSRXXSICtNR9SsBwTaWlA1VBaFeffS+LxBHED7oE+lqb
         6Mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zNrBu1Ho157JvXJ7EWepzZnt5L0+FsXJv3lwmZhG3S4=;
        b=I9Jkw7hObi3w7jDm37eowVylPYIA/ktpDe06B9ml4h2HSUO/UqzUV2gPdOLofv/DtL
         VHf1Xi6/rezC63qO1WNC8/5i3luQdAY41sL1WMlXr6mkuAeoaRXEt3PjX0v3EWdvdG7M
         et0q3nxrBgRuSLyGEzNJib4ZUZ1ahkdo6ru9G/UWcXbbiC4wbY86Fe895fyh+23lQ5cq
         4T976O+VB71tjbVuXYWvVR4AqcqquLZ/StAJ6la68aOojGezPGIvUlZYSmkS8LUsw/3Y
         D5rvv4x7iw3pHh09Cd0o6oqO48sNmtj05iM1FkxI8AweWWnrD6HcPWd4Q3QPhA+xHaO9
         ktmg==
X-Gm-Message-State: ACgBeo0o0fTk4MsbGspcK+qmrwfpfDd3O9U7Qn6EjKDnHUdM92YkXk33
        G01Il74pHkR1K11QycvRGD9Q
X-Google-Smtp-Source: AA6agR6RGh+CQ6g4xAlQmbBII7NV9PH+o29Gc5/y26U4UoIaVaxA3Ua/VTMtS7JC4FEoIW7q8wV7Cw==
X-Received: by 2002:a5d:64eb:0:b0:22a:47ad:f0d8 with SMTP id g11-20020a5d64eb000000b0022a47adf0d8mr1110128wri.140.1662791508722;
        Fri, 09 Sep 2022 23:31:48 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.47])
        by smtp.gmail.com with ESMTPSA id n16-20020a05600c4f9000b003a5c7a942edsm2828122wmq.28.2022.09.09.23.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 23:31:48 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 06/12] PCI: qcom-ep: Gate Master AXI clock to MHI bus during L1SS
Date:   Sat, 10 Sep 2022 12:00:39 +0530
Message-Id: <20220910063045.16648-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220910063045.16648-1-manivannan.sadhasivam@linaro.org>
References: <20220910063045.16648-1-manivannan.sadhasivam@linaro.org>
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

During L1SS, gate the Master clock supplied to the MHI bus to save power.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 2dc6d4e44aff..526e98ea23f6 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -27,6 +27,7 @@
 #define PARF_SYS_CTRL				0x00
 #define PARF_DB_CTRL				0x10
 #define PARF_PM_CTRL				0x20
+#define PARF_MHI_CLOCK_RESET_CTRL		0x174
 #define PARF_MHI_BASE_ADDR_LOWER		0x178
 #define PARF_MHI_BASE_ADDR_UPPER		0x17c
 #define PARF_DEBUG_INT_EN			0x190
@@ -89,6 +90,9 @@
 #define PARF_PM_CTRL_READY_ENTR_L23		BIT(2)
 #define PARF_PM_CTRL_REQ_NOT_ENTR_L1		BIT(5)
 
+/* PARF_MHI_CLOCK_RESET_CTRL fields */
+#define PARF_MSTR_AXI_CLK_EN			BIT(1)
+
 /* PARF_AXI_MSTR_RD_HALT_NO_WRITES register fields */
 #define PARF_AXI_MSTR_RD_HALT_NO_WRITE_EN	BIT(0)
 
@@ -394,6 +398,11 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 		       pcie_ep->parf + PARF_MHI_BASE_ADDR_LOWER);
 	writel_relaxed(0, pcie_ep->parf + PARF_MHI_BASE_ADDR_UPPER);
 
+	/* Gate Master AXI clock to MHI bus during L1SS */
+	val = readl_relaxed(pcie_ep->parf + PARF_MHI_CLOCK_RESET_CTRL);
+	val &= ~PARF_MSTR_AXI_CLK_EN;
+	val = readl_relaxed(pcie_ep->parf + PARF_MHI_CLOCK_RESET_CTRL);
+
 	dw_pcie_ep_init_notify(&pcie_ep->pci.ep);
 
 	/* Enable LTSSM */
-- 
2.25.1

