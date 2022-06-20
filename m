Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64090552150
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 17:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238812AbiFTPkE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 11:40:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236251AbiFTPkD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 11:40:03 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568761901D
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 08:40:02 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id s21so7326304lfs.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j8OxkVIDnDND/pv8hLioHXK4chnXUFokYge0wxIqKsg=;
        b=BlxtnFGAOjxdMrbWTGZkSjzaS/Pfez/NUkbmnFQi0GzI/8kqIPgORNxKKkxbmeImrj
         //6+tAbOb7D95UuOuC2x9IqESqPgEHBj5LmO/ANXwhdM/2tDN7qgwU7/1OYp/Aqcy/dR
         EhOehADSOHheFnHmfwf/1c/Zu1aIS0jla98Ab1cOjkLBJich3SVDD8IsBuKwQDhBHmof
         3GfxUXkeVgz97SMl3m3omk1w0okIKQZ5JdMDDXSs195hX5zCYstrsouHP/+4hyKhehi0
         f5yQHPphEo+w0H4C8XrR0ApvWHyrae5IDyiqx65wErFvMj1ZlCTdJ8vNt/4wE883ClCx
         FAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j8OxkVIDnDND/pv8hLioHXK4chnXUFokYge0wxIqKsg=;
        b=XIwk9zHlA5woisKZ5e/gddjCW4IW2bzn3JSiHFd1BCzIlg2s5ZsrmGfNnEMNm9RYRK
         vsEGSM2e8Igpe7D3C4p4QaysaOJKjyZeQAWH2p1WPZzPiP4EPqfxY7J3bIBASIkw6jvH
         56F0qxPF6yDAR8WLr7p4hABBrbTZuDVf/3lwxwG8pd7aoOczebO4PGKm/huudWalJh+5
         w98Qph9SmeBeeVISYstaKHvNPFsbankjh/h9kjGCMPQHyUP/Om5QLqPCS1QjRqx1o3Vs
         eghnxi7djofexSpsQ0eYeceG0uz3E8UqN1fYLN0YNPoevuo9IcKE3p+a94izxjP8sQ1D
         eosw==
X-Gm-Message-State: AJIora89tA6IGcu3CtpTLeej3m/xWYameZMDE8exPeHWIya59SYPXp8o
        aKoLzAfJIxzDi33BQiBARtnXIw==
X-Google-Smtp-Source: AGRyM1scOf3NP8Q3N3AGDEllJszfo7xRssZ+gnDXjpA+AbzHUXpKb7XPjJ9wXhezMmOlDCGoA5W39Q==
X-Received: by 2002:a05:6512:1292:b0:479:6313:789e with SMTP id u18-20020a056512129200b004796313789emr14547845lfs.538.1655739600633;
        Mon, 20 Jun 2022 08:40:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b7-20020a056512070700b0047255d211fasm1801029lfs.297.2022.06.20.08.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 08:39:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 2/2] phy: qcom-qmp-ufs: provide symbol clocks
Date:   Mon, 20 Jun 2022 18:39:56 +0300
Message-Id: <20220620153956.1723269-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620153956.1723269-1-dmitry.baryshkov@linaro.org>
References: <20220620153956.1723269-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 55 +++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index a2526068232b..0f31d3255897 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1167,6 +1167,54 @@ static int qcom_qmp_phy_ufs_clk_init(struct device *dev, const struct qmp_phy_cf
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
+	int ret;
+
+	clk_data = devm_kzalloc(qmp->dev, struct_size(clk_data, hws, UFS_SYMBOL_CLOCKS), GFP_KERNEL);
+	clk_data->num = UFS_SYMBOL_CLOCKS;
+
+	hw = devm_clk_hw_register_fixed_rate(qmp->dev, "ufs_rx_symbol_0_clk_src",
+							   NULL, 0, 0);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	clk_data->hws[0] = hw;
+
+	hw = devm_clk_hw_register_fixed_rate(qmp->dev, "ufs_rx_symbol_1_clk_src",
+							   NULL, 0, 0);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	clk_data->hws[1] = hw;
+
+	hw = devm_clk_hw_register_fixed_rate(qmp->dev, "ufs_tx_symbol_0_clk_src",
+							   NULL, 0, 0);
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
@@ -1358,6 +1406,13 @@ static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
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

