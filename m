Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF2816111E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Oct 2022 14:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbiJ1Mvx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 08:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiJ1Mvw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 08:51:52 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A611D20EC
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 05:51:51 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id k19so7885847lji.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N4yejd7hCm6L/7UQWt47bF5s1fSbQQBMnEMAqr/wOfs=;
        b=OznOGXfk1a62Xd45KumTdn+feJCAZijj701z6+MajfB8IukYN+GNtnR98UUUuozVlP
         nW5cnwHSp9rGiWgKsat3ccYe7Npx9oi5PP6c1FkZFLbUv0PJaNaagkzkqgyYugffBimm
         ejWakYk9DuxZZeikEpODkGrA4Fyi9NOGeVrPVy6MgxrmklIqoQ4EwD7v4AU0ODkJZjNm
         f04Y8pK0+SFv1Ivzw7RmIFSMjliH2eRI9ipoft/7u7yCCxDV2lhmgNgpXdEKerMfXDgu
         RSlMPGPoUMVmMWK2X/ZOPRW32wd4UV2y4szqmrvn3Qhma0WJddBxphxFnfkshW1IBsYs
         VNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4yejd7hCm6L/7UQWt47bF5s1fSbQQBMnEMAqr/wOfs=;
        b=p2sAxNcesZPcnacsN+dRj3rW2FyL+NxpVTpzaVxoF/nD4+KNubQRwtqdd7cFvpM90S
         78voNsK0LrkQBi66K/gkFEXoqvVvIT3HzjecgXgD3a2K3LOe1YyWe69MwcrKgkn7VJ+u
         V6MdcSskAQwUqx1KYFksc6GF/o+hrUXr0UM+8rGTA3Rqf7Mi+2hFUcJvOM9GteMivnlk
         VgMCuLw1tMQVqgnJeyqt/4V7hayZsE377LA3jxS8KZN8xQxnqoi2MB+YjTpr3LncwCTm
         3MQ75YbqNpdMjZeazDc3UgHPPgPNEwfMVItsaAMHps7jEGImg64d/XJktEtlNk1i7h3C
         d0VA==
X-Gm-Message-State: ACrzQf2ZB2x8FxkrG36oWYSg3DSfhMcgp67hKCeyqTB8d+P8gB7wNTCv
        zjMNkAtcQ7JRE8Te4LiDXsr6pA==
X-Google-Smtp-Source: AMsMyM6YXVudMOaD8SRSJQokXs8uViHdoE0R/wMtloNxDoyO4a54kqymSsAydCIB00jeAmNunUWwnA==
X-Received: by 2002:a2e:509:0:b0:277:44d:569c with SMTP id 9-20020a2e0509000000b00277044d569cmr12674648ljf.88.1666961510008;
        Fri, 28 Oct 2022 05:51:50 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z15-20020a056512370f00b004a45ed1ae21sm552569lfr.224.2022.10.28.05.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 05:51:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v5] phy: qcom-qmp-ufs: provide symbol clocks
Date:   Fri, 28 Oct 2022 15:51:48 +0300
Message-Id: <20221028125148.264833-1-dmitry.baryshkov@linaro.org>
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

Changes since v4:
- Rebased, dropping merged clk patches
- Fix whitespace errors
- Add linebreaks to fit into 100 chars limit

---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 61 +++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index e28c45ab74ea..f60e29c68c26 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1067,6 +1067,60 @@ static int qmp_ufs_clk_init(struct device *dev, const struct qmp_phy_cfg *cfg)
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
 static const struct phy_ops qcom_qmp_ufs_ops = {
 	.power_on	= qmp_ufs_enable,
 	.power_off	= qmp_ufs_disable,
@@ -1232,6 +1286,13 @@ static int qmp_ufs_probe(struct platform_device *pdev)
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

