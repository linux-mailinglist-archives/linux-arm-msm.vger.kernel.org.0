Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E24555EAED4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 19:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbiIZR5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 13:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbiIZR5G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 13:57:06 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548F54A814
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 10:34:42 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id j24so8282921lja.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 10:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qNP6ThRLpHNI/EUjMpjjuQG55s6ZxCbGqJcYBGEJHG4=;
        b=D241F1ruvGGAEpCL0UxqPIIzUojP8zxvdNFGSfGxOKiwcjhFKisVC/TsvqXfMYrkXw
         xQ5+/ItFJ5s0KyyLw9lvJL4VjEAzuZ2/RIAk9bk/djI9tx6xozuwHUUZKAGeLWGzj+YF
         y2u7fJlZJmIXijPbCwfS5VhUJbtM+wauaZQik3cWcgL0eJVePyF6SUFooTv3tZGO8k+8
         bAKWilh3BoAi5tOMq5hEiYO01WFl+NmGNt3BQbAO33NBnAavtQUMQmRZ6izfaJKvyKrD
         du8dn/XHpOo4jUgmSvcne7VL/7Jt2TMP6KnMTeYBS9ZAuYzun7Pb6DGF7q9wZgE3UW1G
         W0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qNP6ThRLpHNI/EUjMpjjuQG55s6ZxCbGqJcYBGEJHG4=;
        b=zgzo51wj/KxYtOj2ZLhpLgNEQcvZHZlhcyZf/WtbLcrDnFPzhN30z6o0LKIHbX0cuQ
         ZgLO0a6ksIeinBIkugy6U+S9g7nscPWj24+CHt32fvI/VgN2rBwhwlA93WWOPswc3o7M
         UWavUmWO25RwhZqQrd+NIX9EARoQXBscQgsbU7PZ5RErI20sC4bwCCVw9ODt7RN6URsg
         ZgGRO6EFpK0UMneGm7qqarGIFnFL5q0/SC1eT9aZnpQvuyaC4ZesLgpZeMyrcPskvlfC
         wqb2+5GIS8nLUvnyzop4J2Dxl6uVtoIqxm8uMlJwAHAKCBiTL3pHJwNROxfR9J4JZLy0
         TCqw==
X-Gm-Message-State: ACrzQf3Yp05w9ho9K3H14ax49rWiKJW3DQSaPofAJGRqsRcDizrR+Kco
        sFNnLqsfRhAj6Uwf68rD3r2umA==
X-Google-Smtp-Source: AMsMyM7LrmvhClw5NVJoD/nWT17WiMh50/6toM504DFeDEb2bcd+5q1FYQTr/d+5XGmaMXdSm7TEyA==
X-Received: by 2002:a05:651c:4ca:b0:26c:50be:5df6 with SMTP id e10-20020a05651c04ca00b0026c50be5df6mr7896118lji.177.1664213681585;
        Mon, 26 Sep 2022 10:34:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v8-20020a2ea448000000b0026ad1da0dc3sm2402640ljn.122.2022.09.26.10.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 10:34:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v5 5/5] PCI: qcom-ep: Setup PHY to work in EP mode
Date:   Mon, 26 Sep 2022 20:34:35 +0300
Message-Id: <20220926173435.881688-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220926173435.881688-1-dmitry.baryshkov@linaro.org>
References: <20220926173435.881688-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Call phy_set_mode_ext() to notify the PHY driver that the PHY is being
used in the EP mode.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index ec99116ad05c..8dcfeed24424 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/mfd/syscon.h>
+#include <linux/phy/pcie.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -240,6 +241,10 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 	if (ret)
 		goto err_disable_clk;
 
+	ret = phy_set_mode_ext(pcie_ep->phy, PHY_MODE_PCIE, PHY_MODE_PCIE_EP);
+	if (ret)
+		goto err_phy_exit;
+
 	ret = phy_power_on(pcie_ep->phy);
 	if (ret)
 		goto err_phy_exit;
-- 
2.35.1

