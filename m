Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36B766BA817
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 07:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbjCOGoC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 02:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbjCOGoA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 02:44:00 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D5DB2210E
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 23:43:36 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so889708pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 23:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678862615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSFkykYkB7c0gJwp2FwEg/ye5mEGILHD2HLR3ehwkBA=;
        b=acXbWt/41htkWAeWdBN0LDPBGrcjGbp9fVtKuwrmw0HzLfhpkkT3rp0FlmbzIdarjH
         O9x8PvaxD/2XIHqGb+dtTbNHby+6I35Kcz26FAGLiIvpAeqj3Kxk4SIajT05kIrY5eTA
         LGFsHtHRQ5tpu5ZuxgDoFSy2I0o76Iwo9whUmMTqykOCWjNchtHaLcxCxJCyrYeZdPeh
         YbwHBP48Brf7AFIWxwQNwrUuPWh+iShZeEEbVCq7Hs1q/cIX+vdE9dPCt7MEVPutFqg+
         5LYpkrt4prgKY3MJqpDSgIWlcT+4MeVh7gwpaOhpsXDQXeuKo75Uradn9AjbEu43NVc+
         ML0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678862615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TSFkykYkB7c0gJwp2FwEg/ye5mEGILHD2HLR3ehwkBA=;
        b=SZJ+5g4x2tWOTnTEyWC81Bbq+5J/z+3+k48gcnfCPKBVN6UDDb9JPISEcRILXm5+eO
         w4YryjiklsU7t5QpjUx9BemxV0L5GEH5U1J/fYZ6n0yOtDXcA5Vr7bPTTCJjVB6/ISwx
         kslkf1K8OrbLnaa4EGTLvxWa0KsIjsr+HSEiXtx8JLMjxl2O6jpO6t9XKYbGjQWUh8xi
         +3rOGnYUb5bgzt7oAI+jfco4/fbNoIaqZIeH5PlkDfAEmNzB5dqfRayvnvcCt3Kx3BaV
         HP87SNz7XKrSDOQrbFRUb/fhCssCgez0J4dsLnDMOIeJtRTSYsdO29TK1qKjtArIkaO5
         Emmg==
X-Gm-Message-State: AO0yUKWy9ROf6BWt0H1m2jAKaPPROu1TVOnGzDTS1B9EG+0oeKsE50lz
        gmXErzK86SYWdFxb55/VsXHSVon37gTZVBSsmQ==
X-Google-Smtp-Source: AK7set+GAgrqpQ/YC4pvH7XY1WKYUN/vK34nYdb4rFEsZh6n3ypqq+/viHQkvJz6LxMCyHJEFpYyFw==
X-Received: by 2002:a17:90b:180f:b0:23d:4a9e:868b with SMTP id lw15-20020a17090b180f00b0023d4a9e868bmr2747234pjb.31.1678862615201;
        Tue, 14 Mar 2023 23:43:35 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.35])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090a6a8400b002367325203fsm550747pjj.50.2023.03.14.23.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 23:43:34 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, kw@linux.com,
        krzysztof.kozlowski+dt@linaro.org, robh@kernel.org
Cc:     konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_srichara@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 07/18] PCI: qcom: Use bulk clock APIs for handling clocks for IP rev 1.0.0
Date:   Wed, 15 Mar 2023 12:12:44 +0530
Message-Id: <20230315064255.15591-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230315064255.15591-1-manivannan.sadhasivam@linaro.org>
References: <20230315064255.15591-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All the clocks are enabled and disabled at the same time. So the bulk clock
APIs can be used to handle them together. This simplifies the code a lot.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 72 +++++++-------------------
 1 file changed, 19 insertions(+), 53 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 2d9116464842..0bb27d3c95a0 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -145,11 +145,9 @@
 
 #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
 
+#define QCOM_PCIE_1_0_0_MAX_CLOCKS		4
 struct qcom_pcie_resources_1_0_0 {
-	struct clk *iface;
-	struct clk *aux;
-	struct clk *master_bus;
-	struct clk *slave_bus;
+	struct clk_bulk_data clks[QCOM_PCIE_1_0_0_MAX_CLOCKS];
 	struct reset_control *core;
 	struct regulator *vdda;
 };
@@ -439,26 +437,20 @@ static int qcom_pcie_get_resources_1_0_0(struct qcom_pcie *pcie)
 	struct qcom_pcie_resources_1_0_0 *res = &pcie->res.v1_0_0;
 	struct dw_pcie *pci = pcie->pci;
 	struct device *dev = pci->dev;
+	int ret;
 
 	res->vdda = devm_regulator_get(dev, "vdda");
 	if (IS_ERR(res->vdda))
 		return PTR_ERR(res->vdda);
 
-	res->iface = devm_clk_get(dev, "iface");
-	if (IS_ERR(res->iface))
-		return PTR_ERR(res->iface);
-
-	res->aux = devm_clk_get(dev, "aux");
-	if (IS_ERR(res->aux))
-		return PTR_ERR(res->aux);
-
-	res->master_bus = devm_clk_get(dev, "master_bus");
-	if (IS_ERR(res->master_bus))
-		return PTR_ERR(res->master_bus);
+	res->clks[0].id = "iface";
+	res->clks[1].id = "aux";
+	res->clks[2].id = "master_bus";
+	res->clks[3].id = "slave_bus";
 
-	res->slave_bus = devm_clk_get(dev, "slave_bus");
-	if (IS_ERR(res->slave_bus))
-		return PTR_ERR(res->slave_bus);
+	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(res->clks), res->clks);
+	if (ret < 0)
+		return ret;
 
 	res->core = devm_reset_control_get_exclusive(dev, "core");
 	return PTR_ERR_OR_ZERO(res->core);
@@ -469,10 +461,7 @@ static void qcom_pcie_deinit_1_0_0(struct qcom_pcie *pcie)
 	struct qcom_pcie_resources_1_0_0 *res = &pcie->res.v1_0_0;
 
 	reset_control_assert(res->core);
-	clk_disable_unprepare(res->slave_bus);
-	clk_disable_unprepare(res->master_bus);
-	clk_disable_unprepare(res->iface);
-	clk_disable_unprepare(res->aux);
+	clk_bulk_disable_unprepare(ARRAY_SIZE(res->clks), res->clks);
 	regulator_disable(res->vdda);
 }
 
@@ -489,46 +478,23 @@ static int qcom_pcie_init_1_0_0(struct qcom_pcie *pcie)
 		return ret;
 	}
 
-	ret = clk_prepare_enable(res->aux);
-	if (ret) {
-		dev_err(dev, "cannot prepare/enable aux clock\n");
-		goto err_res;
-	}
-
-	ret = clk_prepare_enable(res->iface);
-	if (ret) {
-		dev_err(dev, "cannot prepare/enable iface clock\n");
-		goto err_aux;
-	}
-
-	ret = clk_prepare_enable(res->master_bus);
-	if (ret) {
-		dev_err(dev, "cannot prepare/enable master_bus clock\n");
-		goto err_iface;
-	}
-
-	ret = clk_prepare_enable(res->slave_bus);
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(res->clks), res->clks);
 	if (ret) {
-		dev_err(dev, "cannot prepare/enable slave_bus clock\n");
-		goto err_master;
+		dev_err(dev, "cannot prepare/enable clocks\n");
+		goto err_assert_reset;
 	}
 
 	ret = regulator_enable(res->vdda);
 	if (ret) {
 		dev_err(dev, "cannot enable vdda regulator\n");
-		goto err_slave;
+		goto err_disable_clks;
 	}
 
 	return 0;
-err_slave:
-	clk_disable_unprepare(res->slave_bus);
-err_master:
-	clk_disable_unprepare(res->master_bus);
-err_iface:
-	clk_disable_unprepare(res->iface);
-err_aux:
-	clk_disable_unprepare(res->aux);
-err_res:
+
+err_disable_clks:
+	clk_bulk_disable_unprepare(ARRAY_SIZE(res->clks), res->clks);
+err_assert_reset:
 	reset_control_assert(res->core);
 
 	return ret;
-- 
2.25.1

