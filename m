Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5542D674D18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 07:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjATGO2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 01:14:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjATGO1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 01:14:27 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1C17CCCA
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 22:14:25 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id ss4so11338867ejb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 22:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6pnDUje9OVC7H5Ob9ggCfe0dIwdUMRDPRDQFr/gq9k=;
        b=LgSyG69Ht2rwINdsDZf3rZ0ZD/Stm31gDCPTu2cqL150mYdnbAPs9W6LYa4D+LYgaT
         Sf1iz92CY5f1R03mHL0vASOqFzf2WPZLxG5rZYtegaiIWvVWt3MYm+PpAjc9PeONdGYn
         Po1yVThhX/JohbKWYphtXEE7IFDd+7k9zi6PwEMw7fq6pCA8L3YK9T6UEBMms51iJPHK
         2vw+tX5geZ8MiQq9gT0xmMn0ktR6nZozLAwJnTnyZoY5OXoDh+IqgOmw99DxtlZlBgrB
         qyqMESct4Gc9n5qH661JDj8/ahosOA8tSF/AJH8Wq8zILk1NWo+4WDVhK7KxoWrpnTnV
         mu5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O6pnDUje9OVC7H5Ob9ggCfe0dIwdUMRDPRDQFr/gq9k=;
        b=Qbjc9oitrem5pOxlJusgvQCO1DyhVt5Bda/42Meu7XTQHPE2IwmRyBt8w9SLSNoRBq
         ty8ZL+iOw0zJnx6SF89diKnlSGZ5W0nC+dgwR6iD8gDtE5vl8ogKTrttikC/OeQykohP
         jJ8C0BGi9K00dBTHBfJXjWn9GhcWrocFOdiAKDE16LmvIPBQVfLm92F03QI5bKNjyJ5V
         HDjTjs6ExMt/UED5BkJxwt/9nFuOikpH2Ajp1x65W3h3xWYsiAU4laQa0q4G8jMx6lTx
         /H2uBos3RGTb4cBfYpgViL6iCzAK0Ex7YFO48zwM2GdrtDLtQtT0Mrymfaw+meExEpaI
         SuDw==
X-Gm-Message-State: AFqh2krpy12AeRFrZxsq7kAl247uLOPqaj5bYJzabcCbfWkp5DxVafs+
        eZjnWqCOtRq4BKiyxo6x2VNTjg==
X-Google-Smtp-Source: AMrXdXvsNkLD2YT5YN52jQMhlTn+CyJ7KahjWw+TqsvZRYvoBPn+FhZO7QdCbghLXx6TtenZjnKfUw==
X-Received: by 2002:a17:907:b9da:b0:872:21b2:9a1f with SMTP id xa26-20020a170907b9da00b0087221b29a1fmr14533804ejc.58.1674195263795;
        Thu, 19 Jan 2023 22:14:23 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id hp24-20020a1709073e1800b008720c458bd4sm5813358ejc.3.2023.01.19.22.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 22:14:23 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 4/8] clk: qcom: cbf-msm8996: scale CBF clock according to the CPUfreq
Date:   Fri, 20 Jan 2023 08:14:13 +0200
Message-Id: <20230120061417.2623751-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
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

Turn CBF into the interconnect provider. Scale CBF frequency (bandwidth)
according to CPU frequencies.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cbf-8996.c | 143 +++++++++++++++++++++++++++++++-
 1 file changed, 142 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8996.c
index 9cde0e660228..b049b4f7b270 100644
--- a/drivers/clk/qcom/clk-cbf-8996.c
+++ b/drivers/clk/qcom/clk-cbf-8996.c
@@ -5,11 +5,14 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/interconnect-provider.h>
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
+#include <dt-bindings/interconnect/qcom,msm8996-cbf.h>
+
 #include "clk-alpha-pll.h"
 #include "clk-regmap.h"
 
@@ -225,6 +228,133 @@ static const struct regmap_config cbf_msm8996_regmap_config = {
 	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
 };
 
+#ifdef CONFIG_INTERCONNECT
+struct qcom_msm8996_cbf_icc_provider {
+	struct icc_provider provider;
+	struct clk *clk;
+};
+
+#define to_qcom_cbf_provider(_provider) \
+	container_of(_provider, struct qcom_msm8996_cbf_icc_provider, provider)
+
+enum {
+	CBF_MASTER_NODE = 2000,
+	CBF_SLAVE_NODE
+};
+
+#define CBF_NUM_NODES 2
+
+static int qcom_msm8996_cbf_set(struct icc_node *src, struct icc_node *dst)
+{
+	struct qcom_msm8996_cbf_icc_provider *qp;
+
+	qp = to_qcom_cbf_provider(src->provider);
+
+	return clk_set_rate(qp->clk, icc_units_to_bps(dst->peak_bw));
+}
+
+static int qcom_msm8996_cbf_icc_get_bw(struct icc_node *node, u32 *avg, u32 *peak)
+{
+	struct qcom_msm8996_cbf_icc_provider *qp;
+
+	qp = to_qcom_cbf_provider(node->provider);
+	*peak = clk_get_rate(qp->clk) / 1000ULL;
+
+	return 0;
+}
+
+static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev, struct clk_hw *cbf_hw)
+{
+	struct device *dev = &pdev->dev;
+	struct qcom_msm8996_cbf_icc_provider *qp;
+	struct icc_provider *provider;
+	struct icc_onecell_data *data;
+	struct icc_node *node;
+	struct clk *clk;
+	int ret;
+
+	clk = devm_clk_hw_get_clk(dev, cbf_hw, "cbf");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	data = devm_kzalloc(dev, struct_size(data, nodes, CBF_NUM_NODES), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->num_nodes = CBF_NUM_NODES;
+
+	qp = devm_kzalloc(dev, sizeof(*qp), GFP_KERNEL);
+	if (!qp)
+		return -ENOMEM;
+
+	qp->clk = clk;
+
+	provider = &qp->provider;
+	provider->dev = dev;
+	provider->get_bw = qcom_msm8996_cbf_icc_get_bw;
+	provider->set = qcom_msm8996_cbf_set;
+	provider->aggregate = icc_std_aggregate;
+	provider->xlate = of_icc_xlate_onecell;
+	INIT_LIST_HEAD(&provider->nodes);
+	provider->data = data;
+
+	ret = icc_provider_add(provider);
+	if (ret) {
+		dev_err(dev, "error adding interconnect provider\n");
+		return ret;
+	}
+
+	node = icc_node_create(CBF_MASTER_NODE);
+	if (IS_ERR(node)) {
+		ret = PTR_ERR(node);
+		goto err;
+	}
+
+	node->name = "cbf_master";
+	icc_node_add(node, provider);
+	icc_link_create(node, CBF_SLAVE_NODE);
+	data->nodes[MASTER_CBF_M4M] = node;
+
+	node = icc_node_create(CBF_SLAVE_NODE);
+	if (IS_ERR(node)) {
+		ret = PTR_ERR(node);
+		goto err;
+	}
+
+	node->name = "cbf_slave";
+	icc_node_add(node, provider);
+	data->nodes[SLAVE_CBF_M4M] = node;
+
+	platform_set_drvdata(pdev, provider);
+
+	return 0;
+
+err:
+	icc_nodes_remove(provider);
+	icc_provider_del(provider);
+
+	return ret;
+}
+
+static int qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
+{
+	struct icc_provider *provider = platform_get_drvdata(pdev);
+
+	icc_nodes_remove(provider);
+	icc_provider_del(provider);
+
+	return 0;
+}
+#else
+static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev)
+{
+	dev_warn(&pdev->dev, "interconnects support is disabled, CBF clock is fixed\n");
+
+	return 0;
+}
+#define qcom_msm8996_cbf_icc_remove(pdev) (0)
+#endif
+
 static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
 {
 	void __iomem *base;
@@ -283,7 +413,16 @@ static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &cbf_mux.clkr.hw);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &cbf_mux.clkr.hw);
+	if (ret)
+		return ret;
+
+	return qcom_msm8996_cbf_icc_register(pdev, &cbf_mux.clkr.hw);
+}
+
+static int qcom_msm8996_cbf_remove(struct platform_device *pdev)
+{
+	return qcom_msm8996_cbf_icc_remove(pdev);
 }
 
 static const struct of_device_id qcom_msm8996_cbf_match_table[] = {
@@ -294,9 +433,11 @@ MODULE_DEVICE_TABLE(of, qcom_msm8996_cbf_match_table);
 
 static struct platform_driver qcom_msm8996_cbf_driver = {
 	.probe = qcom_msm8996_cbf_probe,
+	.remove = qcom_msm8996_cbf_remove,
 	.driver = {
 		.name = "qcom-msm8996-cbf",
 		.of_match_table = qcom_msm8996_cbf_match_table,
+		.sync_state = icc_sync_state,
 	},
 };
 
-- 
2.39.0

