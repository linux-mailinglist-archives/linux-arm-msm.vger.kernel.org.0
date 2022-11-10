Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB27624565
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 16:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbiKJPSC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 10:18:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231378AbiKJPR5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 10:17:57 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 070A5317C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 07:17:52 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id l12so3855350lfp.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 07:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y93JMbDS7TCZqUPnYPX61/7g1utQYXApLn3dq22TrxU=;
        b=wRWhes+i45FVWkaP2RbQOZfAtoSXGa+d4hSoAgTqHq++rLCP4AleTXnOs9rzRTcSEg
         9KTxfcVofTUJRlw4o9izwZlC43VmLxhzwz5J5PNPmk2lOwB54rsS5tF4N5D4mVBeCvwy
         muZlRGR/h9XRq+I8mysPxP0yufdne+8WePMhHUsNSUcMJwqy/WOyPimQB9xafZRc01A+
         r8gVRtifBPhbVGEvFFd6KZuxgbQRZzFciRwAyBWAz6zmwQzboXljkKTXS6ouLUNztdzk
         axbFUuuyuIjkvfYyBszJ6dI7zB4gSZ7NE6yJQSCc9z95ztuB7rZ2X5BGIfeIosSUNs5Z
         zqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y93JMbDS7TCZqUPnYPX61/7g1utQYXApLn3dq22TrxU=;
        b=IIj6uC9+6jG6qnZBj+uMcgmNxt/u5WC+kQ4k0hMhrtRDrvfzn8SRcTrv9JLGkoZeWe
         D+oZkk8PShIjb5utUT20jHc3Jik1Y+7urC/urbS855ISoLblajNDZBaNXFBYKmlDxz/a
         CCWW5huSicboA9JfghsTVH9GarYT/rOFp4jfkuMhrDAP/Ly2emDIlPU88GDXOYIQkp2e
         e8i5ripXmSk8o/skNb8synBMj3JWv3j/UgMevk6ZarR+4tpu2NhspHK/6DZ0nUUyUWgY
         /vbZopQjYN6HG1c9jPk2xMFsgIi6bCiKzZe1VaWs6myMJnMcKHmLod2wbNt64S2Fe3Z7
         /06w==
X-Gm-Message-State: ACrzQf02I3dUqy0UwMIUZtPaUFwbpYJFhpmz69J6O4Q8H99156fGSNnD
        K0ClE1qj/IvZCDNeAGcL2Ps+Nw==
X-Google-Smtp-Source: AMsMyM51NCYdPzeJ0DVLsUbB7vzCw6INOY5T/UVzT15xYcYCb+lXPZgmdsCXgopNWuX/aWQ6uOQShw==
X-Received: by 2002:a05:6512:4021:b0:4a2:4f21:5070 with SMTP id br33-20020a056512402100b004a24f215070mr1651074lfb.270.1668093470375;
        Thu, 10 Nov 2022 07:17:50 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p22-20020a2eb7d6000000b002774e7267a7sm2719591ljo.25.2022.11.10.07.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 07:17:50 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v7 2/4] phy: qcom-qmp-ufs: provide symbol clocks
Date:   Thu, 10 Nov 2022 18:17:46 +0300
Message-Id: <20221110151748.795767-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221110151748.795767-1-dmitry.baryshkov@linaro.org>
References: <20221110151748.795767-1-dmitry.baryshkov@linaro.org>
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

Register three UFS symbol clocks (ufs_rx_symbol_0_clk_src,
ufs_rx_symbol_1_clk_src ufs_tx_symbol_0_clk_src). Register OF clock
provider to let other devices link these clocks through the DT.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 64 +++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 189103d1bd18..78d7daf34667 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1023,6 +1023,66 @@ static int qmp_ufs_clk_init(struct qmp_ufs *qmp)
 	return devm_clk_bulk_get(dev, num, qmp->clks);
 }
 
+static void phy_clk_release_provider(void *res)
+{
+	of_clk_del_provider(res);
+}
+
+#define UFS_SYMBOL_CLOCKS 3
+
+static int phy_symbols_clk_register(struct qmp_ufs *qmp, struct device_node *np)
+{
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw *hw;
+	char name[64];
+	int ret;
+
+	clk_data = devm_kzalloc(qmp->dev,
+				struct_size(clk_data, hws, UFS_SYMBOL_CLOCKS),
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = UFS_SYMBOL_CLOCKS;
+
+	snprintf(name, sizeof(name), "%s::rx_symbol_0", dev_name(qmp->dev));
+	hw = devm_clk_hw_register_fixed_rate(qmp->dev, name, NULL, 0, 0);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	clk_data->hws[0] = hw;
+
+	snprintf(name, sizeof(name), "%s::rx_symbol_1", dev_name(qmp->dev));
+	hw = devm_clk_hw_register_fixed_rate(qmp->dev, name, NULL, 0, 0);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	clk_data->hws[1] = hw;
+
+	snprintf(name, sizeof(name), "%s::tx_symbol_0", dev_name(qmp->dev));
+	hw = devm_clk_hw_register_fixed_rate(qmp->dev, name, NULL, 0, 0);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	clk_data->hws[2] = hw;
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		return ret;
+
+	/*
+	 * Roll a devm action because the clock provider is the child node, but
+	 * the child node is not actually a device.
+	 */
+	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
+}
+
+static const struct phy_ops qcom_qmp_ufs_ops = {
+	.power_on	= qmp_ufs_enable,
+	.power_off	= qmp_ufs_disable,
+	.owner		= THIS_MODULE,
+};
+
 static int qmp_ufs_parse_dt_legacy(struct qmp_ufs *qmp, struct device_node *np)
 {
 	struct platform_device *pdev = to_platform_device(qmp->dev);
@@ -1135,6 +1195,10 @@ static int qmp_ufs_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	ret = phy_symbols_clk_register(qmp, np);
+	if (ret)
+		goto err_node_put;
+
 	qmp->phy = devm_phy_create(dev, np, &qcom_qmp_ufs_phy_ops);
 	if (IS_ERR(qmp->phy)) {
 		ret = PTR_ERR(qmp->phy);
-- 
2.35.1

