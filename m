Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B46065BA6AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Sep 2022 08:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229379AbiIPGRs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Sep 2022 02:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbiIPGRq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Sep 2022 02:17:46 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40674CA25
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 23:17:45 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id r20so12600177ljj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 23:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=X090fBwR71n+Uf8mgcr+/g0ucFo6d8AXFrDt6zSz6Ec=;
        b=TXyDE1vIX/pUmargdORd3xFpvmwOh46CsjZ+1nHtoJMk3KdloYSY0X2O4AoRKy0bAL
         njmW4CdQmwFUako/i/5/2+x03bAQkbW/NX8YF7GREWZ+qrAwDtd++Ac6NHcFwM6U/coL
         YFjLs0FakQAOwKwjK3NiCT+dseTzHUzJmSkCZjhxbWvNDRG6BpEL/2TKuS7Z8Osh5ej6
         TtNghr81JT+Um9v8d56nFLgeXIrH0L5iFPJriyMCV89D86TLpr2LJROJN7Wja36tpoGz
         +A4yM0YHiicsuu+nVq/7DvNxmpuQ7EDlK/FldZEbNtl57/potVOFfXVJMakCpwJifLit
         LQjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=X090fBwR71n+Uf8mgcr+/g0ucFo6d8AXFrDt6zSz6Ec=;
        b=XY5ETT7toUM7MLQ2SrsSHO+MbznYj6tsUoWRta3FDlSf0BOKXH75Z33pgxZBcGyovg
         A2tTckjYMQxk8gpKdop6X0u/DF/J220xWqo8q/NUTpHqGlJFmj5D0aRfiUONgm7tKvdA
         oWZ+pkustBoMJ7yzwvFs4x41OvZ0GDBQbLCGAF1Ng5DEPGi4+v/IgpNSR+eQx/MNsemh
         lndcifSjwm329h3E1grsFU1KjvCJPtSnau/iG+RXpDVDCkzMs3aZt9oQiJxkNafOK7f5
         zVEXQAqHcMJG+mCWvgUk9/dvPKnZ7cnLRS82wCgqIrVP6Zl1ElrRCohAeztmMbG3W82l
         bsHg==
X-Gm-Message-State: ACrzQf2BSltDj1vXg8OYlAzFL7qXldjwxFmzdBqqrQpKibPut3tfwsmG
        4fq2kcGkYevfLqU/53qT64XEOQ==
X-Google-Smtp-Source: AMsMyM7Tt8LC4oE3XmHM67TMsKEHVv7c00y2QbLczgwlX8yhXwUi6EBG90H2zEOh7ijcxoDf4Vk8SQ==
X-Received: by 2002:a2e:8881:0:b0:255:7790:25e6 with SMTP id k1-20020a2e8881000000b00255779025e6mr963720lji.525.1663309064195;
        Thu, 15 Sep 2022 23:17:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b15-20020a2eb90f000000b00261eaa819b7sm3529383ljb.30.2022.09.15.23.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 23:17:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org
Subject: [PATCH v4 3/3] phy: qcom-qmp-ufs: provide symbol clocks
Date:   Fri, 16 Sep 2022 09:17:40 +0300
Message-Id: <20220916061740.87167-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220916061740.87167-1-dmitry.baryshkov@linaro.org>
References: <20220916061740.87167-1-dmitry.baryshkov@linaro.org>
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
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 59 +++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 01a99a06fd4f..f6171645642d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1159,6 +1159,58 @@ static int qcom_qmp_phy_ufs_clk_init(struct device *dev, const struct qmp_phy_cf
 	return devm_clk_bulk_get(dev, num, qmp->clks);
 }
 
+static void phy_clk_release_provider(void *res)
+{
+	of_clk_del_provider(res);
+}
+
+#define UFS_SYMBOL_CLOCKS 3
+
+static int phy_symbols_clk_register(struct qcom_qmp *qmp, struct device_node *np)
+{
+	struct clk_hw_onecell_data *clk_data;
+	struct clk_hw *hw;
+	char name[64];
+	int ret;
+
+	clk_data = devm_kzalloc(qmp->dev, struct_size(clk_data, hws, UFS_SYMBOL_CLOCKS), GFP_KERNEL);
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
+        /*
+         * Roll a devm action because the clock provider is the child node, but
+         * the child node is not actually a device.
+         */
+        return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
+}
+
 static const struct phy_ops qcom_qmp_ufs_ops = {
 	.power_on	= qcom_qmp_phy_ufs_enable,
 	.power_off	= qcom_qmp_phy_ufs_disable,
@@ -1350,6 +1402,13 @@ static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
 			goto err_node_put;
 		}
 
+		ret = phy_symbols_clk_register(qmp, child);
+		if (ret) {
+			dev_err(dev, "failed to create symbol clocks, %d\n",
+				ret);
+			goto err_node_put;
+		}
+
 		id++;
 	}
 
-- 
2.35.1

