Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD3E05B8272
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 09:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbiINHzv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 03:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbiINHzW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 03:55:22 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C9218B2F
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:54:56 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id a80so5539567pfa.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Sep 2022 00:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qIqmnnPPd/w9PevtCzz3I9Xl0se/j1JE8K0DzKiojlg=;
        b=xLwR1mJuVy34/JvHtpZKgmKBiqRV+MIFyUCk0n6BmwK5jdgtI2R7dz0OHzvYMo9DGO
         NW+Wg7NqwoiQmhHpAP/GA5xju3wTlWZDXOC+knC7yN7jw5qfECsSXRLbIjkO4joaoWtb
         8sXIM/d7vKUjJfpv3ccDXHO3bUO0z+lEMOYJksUvp0MjW4hC7kw711ynHQf8IqguMPrd
         vv87xH8Tmxl3zK0w3SVgFZJmxnotad2NDOtnfLIkfZSuAUURbS9hkHyVoqTzfML+Stix
         T6tO35N2jQlNUUHwi5unIYHzzqhmOWCWb7hmIJHSG+eqL2VPd4U1z2AdC//3CNlSL0/t
         NgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qIqmnnPPd/w9PevtCzz3I9Xl0se/j1JE8K0DzKiojlg=;
        b=tBAgC5nnE1VERsqC4p85UkGeuYags652v3/mAVC830Sow8ZQ2W3Yl8OyV29rqKq5+m
         DmQBCw0gREZWKltI+yb3eYyfGQ4gxP5qmfwdDLqWYMU20bGc3X/94Kc/5Glo0rYHPehK
         IFc8hs27cVBoDGVE9ICjrJmayUBXIG2xm5ujXcg6iJx5Fd9YJdLKSW3FDKswn0qYv9v2
         c9Llubeg2OiNbvZKxhFGIXVJWXt2G50ZPnkKEbmUuWeU6eH32zLHKWpOZ2A88hg/8uxp
         VG/6lqd4t3mtqgNQITq+93u/GFL5eUDbqpgeXEwVBkEbs1NRhX4WApFmth7oqaMMIsBm
         ocsA==
X-Gm-Message-State: ACgBeo3e6P6zf+dua54XU1A2g/xCOwKWI935VrHGmO6Wl4zJS5LvQzFM
        cU3KLkuVw4xgoecISil0CZ3h
X-Google-Smtp-Source: AA6agR6CniLWKO3rP5PihB6hHOHcm/blzCTKeYPSDusx8T0u0JuJSFk8eJwnOtZcYkLjeMQ18NtkOw==
X-Received: by 2002:a05:6a00:174f:b0:53a:a96b:10b0 with SMTP id j15-20020a056a00174f00b0053aa96b10b0mr36456123pfc.68.1663142095704;
        Wed, 14 Sep 2022 00:54:55 -0700 (PDT)
Received: from localhost.localdomain ([117.202.184.122])
        by smtp.gmail.com with ESMTPSA id p8-20020a1709027ec800b00174ea015ee2sm10119054plb.38.2022.09.14.00.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 00:54:55 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, robh@kernel.org, andersson@kernel.org
Cc:     kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 09/12] PCI: qcom-ep: Make PERST separation optional
Date:   Wed, 14 Sep 2022 13:23:47 +0530
Message-Id: <20220914075350.7992-10-manivannan.sadhasivam@linaro.org>
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

PERST separation is an optional debug feature used to collect the crash
dump from the PCIe endpoint devices by the PCIe host when the endpoint
crashes. This feature keeps the PCIe link up by separating the PCIe IP
block from the SoC reset logic.

Hence, make the property optional in the driver.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 40f75a6c55df..92140a09aac5 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -220,8 +220,10 @@ static int qcom_pcie_ep_core_reset(struct qcom_pcie_ep *pcie_ep)
  */
 static void qcom_pcie_ep_configure_tcsr(struct qcom_pcie_ep *pcie_ep)
 {
-	regmap_write(pcie_ep->perst_map, pcie_ep->perst_en, 0);
-	regmap_write(pcie_ep->perst_map, pcie_ep->perst_sep_en, 0);
+	if (pcie_ep->perst_map) {
+		regmap_write(pcie_ep->perst_map, pcie_ep->perst_en, 0);
+		regmap_write(pcie_ep->perst_map, pcie_ep->perst_sep_en, 0);
+	}
 }
 
 static int qcom_pcie_dw_link_up(struct dw_pcie *pci)
@@ -478,8 +480,8 @@ static int qcom_pcie_ep_get_io_resources(struct platform_device *pdev,
 
 	syscon = of_parse_phandle(dev->of_node, "qcom,perst-regs", 0);
 	if (!syscon) {
-		dev_err(dev, "Failed to parse qcom,perst-regs\n");
-		return -EINVAL;
+		dev_dbg(dev, "PERST separation not available\n");
+		return 0;
 	}
 
 	pcie_ep->perst_map = syscon_node_to_regmap(syscon);
-- 
2.25.1

