Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF59611805
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 18:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230190AbiJ1QtK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 12:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbiJ1Qs4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 12:48:56 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BBDE21464A
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 09:48:50 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id be13so9242370lfb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 09:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oeXrdvfaiHrd+7mrB9OTuU81RmA3YoESHAYdc7E9Fn8=;
        b=ozLUUlz39jA16RrRjwVzfnmAMU8W+x1Xcukyy+g2JCZAG35zE8CT8W27SzOnVHnWQw
         mXyrP+/55NUZGfdjVbUTD7Ox1IPPBlyd5Zss9+OCBaLjgH9tHmP+vbPibe2C7Xjoo94A
         ksu1tcF5ecC8BuvpzR2rLRnlLsp4aMg6pN8KodmYJW6suKMuerYQbft3Y37QiSfgCDu3
         SaOoNCD9/pPYgasVC8uY2swqmtyla7yW/pzebshdB6eBT9QxpilLelz/potJtbQY2oJq
         o3rwliJwnv7zKbhzjtgyrspsKYAl/e+8ryXszP4g83BdORS/lIC2MNbQgf6jdYH8G43o
         OIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeXrdvfaiHrd+7mrB9OTuU81RmA3YoESHAYdc7E9Fn8=;
        b=Piyr/DV7FnV4YBsoraT7TZwZGpVOlEjGGBQRaVkYcVybpNlu8j6GEV0YDhVD08HZXm
         r8F+0+MN5L0DedkIi3F9gJvjxIamtwZBZn92rQduP/TxeF4ssw1FWfq7FwqGn6LK5Lom
         eSNmpnug777g7GnG5x+n3NJvs91DA3PFYPuVTcE9DlT0cUmrPSu7ZWWoJKkU0y1rujnO
         PQIVnrNPjjG3ClH4kcyLdp4SVwWXttSylgIOtNax2LFGGPpYQ31msdJ2WG1ZbM8wiKI6
         9sXmXxZ2WqtFQFWOplUmptUH5Z1xYFJhPvuRgcJ9qQ+gc6KBIGwXNk2eRuEyZVcdrav3
         5+dg==
X-Gm-Message-State: ACrzQf1FuzB0dsuVcG4d3ZdK6eyFBKwT3rAhgVa/jHXeh1BjRUd89pRy
        EUNBX3O3kctjEPVIyrtEWk2RTg==
X-Google-Smtp-Source: AMsMyM5O6XhIX030f487hO1gMSeZQGzYHHWl+CkzlqImG3P2noi1GQXwoWk1YtQsdAZzF6Fcj9Qz4g==
X-Received: by 2002:a05:6512:503:b0:4af:1cbe:1ac6 with SMTP id o3-20020a056512050300b004af1cbe1ac6mr73689lfb.651.1666975728645;
        Fri, 28 Oct 2022 09:48:48 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 24-20020ac25f58000000b004a03eb21c4fsm626892lfz.288.2022.10.28.09.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:48:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v6] phy: qcom-qmp-ufs: provide symbol clocks
Date:   Fri, 28 Oct 2022 19:48:47 +0300
Message-Id: <20221028164847.485874-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Changes since v5:
- Rebased on top of phy/next

Changes since v4:
- Rebased, dropping merged clk patches
- Fixed whitespace errors
- Added linebreaks to fit into 100 chars limit

---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 67 +++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 189103d1bd18..c1c9c6e7949d 100644
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
@@ -1135,6 +1195,13 @@ static int qmp_ufs_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
+	ret = phy_symbols_clk_register(qmp, np);
+	if (ret) {
+		dev_err(dev, "failed to create symbol clocks, %d\n",
+			ret);
+		goto err_node_put;
+	}
+
 	qmp->phy = devm_phy_create(dev, np, &qcom_qmp_ufs_phy_ops);
 	if (IS_ERR(qmp->phy)) {
 		ret = PTR_ERR(qmp->phy);
-- 
2.35.1

