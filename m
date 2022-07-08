Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1EAC56BB48
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 15:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238357AbiGHNy6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 09:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238359AbiGHNy5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 09:54:57 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7454F2A701
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 06:54:56 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id o7so7338787lfq.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 06:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3F2kWbK89xXlF4GcpyJZ3T9LLi937X/DX8TG7c54mes=;
        b=YfhPmY1lxpfF3umqnpJhY5W/QvXwHHvo6+1tNvJN8m5obPzTPNmim4Ht/FVBHiwM+U
         X59wV7NXk1oq6jeBxerK+LiLIzXK4pKVehrIsPpiFp+vNtrSTYFUplgnR7Hu932Ake2Z
         vp/pxnKW7VUoupsZVPRCZDgo0om90eew6P8kB4JQFogUh8ohvj0DptZM+BC2btE2/8He
         8KMpTARypcWDymOZ2MtBF+tc1TpsyEocHb+BMShL1eDVHGw04rHKcj3sq4J9x6517ocX
         BDqvwSr9av+RipifIBuKxSXU9d3B0RhZ5f5bxmU2LhyElpsySaO7B6Kn9DBwdxvrKMRq
         r9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3F2kWbK89xXlF4GcpyJZ3T9LLi937X/DX8TG7c54mes=;
        b=DimRNkNkJ0JryeXB9FnbaWTL1UhhU/9N4NZiyQiMgHNJ+9phhDClqKoypJ414ksdiL
         3WZI6t5bJVwcNUX+QEpyieIXp59RxBB9oXsW8m990aDLUKb3943ymmbXEDKXi7VdcvMT
         QI4k/uuaUydNJ9c9PP7Cr0gFN86liIRdc90zffySIz/v166FNmEw7SVa5QRD4LzlQr51
         BwJC2IrMc6SiziiJRY3+luf8pMmyqOp6Z/XDPoXcHGWu1nF9oLJmehD458DKZs5T1R69
         3+wt9vpFKZ2Nb/B1yx8hiiMYf6oo5+Z+JBwVILdx1yenm9QxFlZ53tTn9cd4pQ7hshE0
         jEVQ==
X-Gm-Message-State: AJIora8S/gb7q/QV6ydRsxw0fft6sVEQLP7uPPTbO2NcVqL3BT7Bnrsk
        K8Bwy3wnJkF8KsWmsr2eOAGgSQ==
X-Google-Smtp-Source: AGRyM1to0Q2VwX89QXXfoCAlbGDQZbPwbzrhHmX9Yjh4fb6sP+/QxuL/KswcYmJN1ub9aKqNi+cksg==
X-Received: by 2002:a05:6512:220c:b0:483:d9ad:b56c with SMTP id h12-20020a056512220c00b00483d9adb56cmr2542708lfu.150.1657288494842;
        Fri, 08 Jul 2022 06:54:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y9-20020ac24e69000000b0047f647414efsm7428352lfs.190.2022.07.08.06.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 06:54:54 -0700 (PDT)
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
Subject: [PATCH v3 3/3] phy: qcom-qmp-ufs: provide symbol clocks
Date:   Fri,  8 Jul 2022 16:54:50 +0300
Message-Id: <20220708135450.2845810-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220708135450.2845810-1-dmitry.baryshkov@linaro.org>
References: <20220708135450.2845810-1-dmitry.baryshkov@linaro.org>
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
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 59 +++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index a2526068232b..e0a952591eb0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1167,6 +1167,58 @@ static int qcom_qmp_phy_ufs_clk_init(struct device *dev, const struct qmp_phy_cf
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
@@ -1358,6 +1410,13 @@ static int qcom_qmp_phy_ufs_probe(struct platform_device *pdev)
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

