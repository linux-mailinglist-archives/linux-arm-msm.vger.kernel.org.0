Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1458A635AB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 11:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236347AbiKWK4F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 05:56:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236232AbiKWKzW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 05:55:22 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E02E25F6
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:44:48 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id t10so20973845ljj.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 02:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hasDy1+t/B8Y/xArguog4wPmJmnVb9H5spMq9+2JDcg=;
        b=FD+6cjsM0AH2+2CDIxDnDJN4K8NqaRyiqqcM/QhJzUsxY5ItxzaThxQ5aaMxBEF20c
         LHAc5z1zBDjMTrBZCwKkjJxE341z4lVPte3ze5HMQETw+lZefvPWohfFpZlcxy4zB+Jb
         ynCs0BYVZZEKVT9NJ9Az9UibYeg/pQe5xq6nj2r4ExwQeFCbj1SY/bttqOwt4wBu9h1s
         I3VDMt9AfATc5/y7exOFBbzRtFvCM3zmh5kiC3rp6CzmEs6Wukoc0+/w3Kj6VlOjXBJa
         CFKTy+/VaAyhgdtXmXfGU0OJabrkRfxe8kEuSxUy1r119KIH+xyc1A9+qW3jtzzewR6X
         nvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hasDy1+t/B8Y/xArguog4wPmJmnVb9H5spMq9+2JDcg=;
        b=zqLjoI/4w7lNeUmpDmZAlFxOBkODPUrFiSpwU8w9Qe9m9qtbzpcUbmSxv+pd31jxSg
         OMyN7ieWqgxBZ5mbXdeELfkOpQP125f3g+Tuc7KlHM2J4eDXYYQBjbxBDvg1VnVbfz8r
         giqyvj+dVLAh/0YueteUdLiMnyJyxywMfhNVeXm9wgYSMTEgXdKm5loRHC6uBcKaS1wI
         L0TcfE6Eo6/hPGpaisOqLiA6ZwdC0IEVKhjl65ofhDU9+I19iqfDoDokvftLkO2j9JyK
         QLm+d/pyMlaMFSJryhewirFHeK7i34L+0syT67GXJJ3DHB1r/RWn7fDgmbeNcWvL3WGb
         o7TA==
X-Gm-Message-State: ANoB5pmGuFMiPzx/LYjptyFmqgjjQl7WZeeQFMbSHxs7gTSl3vHL6TUF
        8l5AIxpMTOmqe7JN7sOW15b+mw==
X-Google-Smtp-Source: AA0mqf5scskv1XCelKbs7W3K6Z/9+gBIeesXfpBhpCcFHbuhgiPG+poOqIjARIJoBZTQeGFnnRF/iA==
X-Received: by 2002:a2e:9998:0:b0:279:7405:85d5 with SMTP id w24-20020a2e9998000000b00279740585d5mr1703820lji.31.1669200286436;
        Wed, 23 Nov 2022 02:44:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (dzpbg0ftyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:5f12::1])
        by smtp.gmail.com with ESMTPSA id be34-20020a056512252200b0049e9122bd1bsm2869082lfb.164.2022.11.23.02.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 02:44:45 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v9 2/4] phy: qcom-qmp-ufs: provide symbol clocks
Date:   Wed, 23 Nov 2022 12:44:41 +0200
Message-Id: <20221123104443.3415267-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221123104443.3415267-1-dmitry.baryshkov@linaro.org>
References: <20221123104443.3415267-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 57 +++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 189103d1bd18..ce50eabccb9d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1023,6 +1023,59 @@ static int qmp_ufs_clk_init(struct qmp_ufs *qmp)
 	return devm_clk_bulk_get(dev, num, qmp->clks);
 }
 
+static void qmp_ufs_clk_release_provider(void *res)
+{
+	of_clk_del_provider(res);
+}
+
+#define UFS_SYMBOL_CLOCKS 3
+
+static int qmp_ufs_register_clocks(struct qmp_ufs *qmp, struct device_node *np)
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
+	 * Roll a devm action because the clock provider can be a child node.
+	 */
+	return devm_add_action_or_reset(qmp->dev, qmp_ufs_clk_release_provider, np);
+}
+
 static int qmp_ufs_parse_dt_legacy(struct qmp_ufs *qmp, struct device_node *np)
 {
 	struct platform_device *pdev = to_platform_device(qmp->dev);
@@ -1135,6 +1188,10 @@ static int qmp_ufs_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	ret = qmp_ufs_register_clocks(qmp, np);
+	if (ret)
+		goto err_node_put;
+
 	qmp->phy = devm_phy_create(dev, np, &qcom_qmp_ufs_phy_ops);
 	if (IS_ERR(qmp->phy)) {
 		ret = PTR_ERR(qmp->phy);
-- 
2.35.1

