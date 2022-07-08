Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C036656BA66
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 15:14:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237980AbiGHNNl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 09:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238028AbiGHNNk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 09:13:40 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB69192B8
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 06:13:39 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id m18so17828342lfg.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 06:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y8TSA2xKiR+ulbyqdsf+IyUQd58t84mxTi/hjRtwdLo=;
        b=QRrMtgZXoJzyqyLeF66dY/ZAudNIiXmwhJoWSLh1Aco6eJVyrtI1npkyShxIVyEMep
         LbndmaW2tbJUgMtXAGTyNQxR+MSH7RBtnn3frSqOveJ5iuCDatFLN8ZcNNZLkJRWrxQ6
         WPo4/qtqYAEcVfZDOU7YV4lF7br0ozkvyX+PAYNqt7+FV9i7EcFl/9fXKAf411G4hqV4
         +SgDtR+DQTIFozrTO6UiHg6/dFYzfbQK8jQXNxiH2YPEXfdqjSaO6fCTD4bWO7Vblm4N
         bskrnVSxW+//wgk3uMfSoEfwrU2EUENubtNCdc/vJvG9XVW4VGd9hxg7zFvGmnowerN7
         PiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y8TSA2xKiR+ulbyqdsf+IyUQd58t84mxTi/hjRtwdLo=;
        b=G7PJt1d852oA9KyUxFcIIe8ArbfR1K8SG3FxxYwUxe3b2jIZ0J9MH5h1GPZGa9FJDN
         AnmjC7Excf4YxuaZ56Cu6cmTh+43s+VXyla7um53KMglScacwoU6MNhtd3ZUXX/gWKwT
         YHsp5RDfD9pLiywnqCjucCxHDO6l9FSIDcBVhGZbvTWgAkvHZLEe+rH17E66BxBeXZeY
         V1gln7n0x+esj1ANltdBLpC6muPdMymi/9bypjlEwFslA4bflmPsUKcJXDTI2rvIWbOM
         id5KKV7EtmC4KpKIHdeONYAMe3XjNvmHnKirFLTGLrYPeN6Y3EaxvQ8nFeA0tccTOPQF
         5ANA==
X-Gm-Message-State: AJIora+WlrOSo4iDODsb7i1A97p4LNppzqegb8Ug6j5hY5W2jpAUNX1U
        tPwJwRLIHiJz1uBGgyMX+jaUNQ==
X-Google-Smtp-Source: AGRyM1tEvHOU0pcHFvUMweAbz0mzrQdkbOshaz9Gkqxty23oTKKIa2MeGFPDkrlWi/YlKEHT/hV2Lg==
X-Received: by 2002:a05:6512:3c96:b0:488:c36d:b336 with SMTP id h22-20020a0565123c9600b00488c36db336mr2347724lfv.410.1657286017563;
        Fri, 08 Jul 2022 06:13:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bu35-20020a05651216a300b0047255d211b9sm7410844lfb.232.2022.07.08.06.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 06:13:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-phy@lists.infradead.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 3/3] phy: qcom-qmp-ufs: provide symbol clocks
Date:   Fri,  8 Jul 2022 16:13:33 +0300
Message-Id: <20220708131333.2836900-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220708131333.2836900-1-dmitry.baryshkov@linaro.org>
References: <20220708131333.2836900-1-dmitry.baryshkov@linaro.org>
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

Register three UFS symbol clocks (ufs_rx_symbol_0_clk_src,
ufs_rx_symbol_1_clk_src ufs_tx_symbol_0_clk_src). Register OF clock
provider to let other devices link these clocks through the DT.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index a2526068232b..f206eb4042bf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1167,6 +1167,55 @@ static int qcom_qmp_phy_ufs_clk_init(struct device *dev, const struct qmp_phy_cf
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
@@ -1358,6 +1407,13 @@ static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
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

