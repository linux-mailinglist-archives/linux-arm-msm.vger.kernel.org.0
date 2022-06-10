Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 821F8546CC9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 20:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350385AbiFJSzw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 14:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350377AbiFJSzt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 14:55:49 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4981D1CAD31
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 11:55:47 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a2so38074886lfg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 11:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZpXhcBz85pZHSFxO7IztMlfvhvygUvHRe9NMB75dzZI=;
        b=HYln7yxQTd0W6JEhVzLIUqvcJF7sqkcJkVdYnOX6S7BsIUJEu06cYJN1/UJDzoLjbG
         TrGgBvJD/JoRSYsjjMiCc8wJytQCfqozhQ8s7i029waEhWz0u3FdmbAT8c5FFN+oqLg/
         RexFFrehDpCRBl7AXgaulHQpHXIaHdMJLnXDfAnPFWPocuMMgTwNrlcpQOQyeqatg6ns
         UeX33AefaBDw8MXJaNDArnjyBHn6oK3QKDHdcRSBkCJhVWfQN8nWCzh6bCFa1ngKZFA+
         LefmuAVldKHo6fW2WlV8GhpEnhj9smyoxK8SPqs1qzzcFR6J9zrAyByA/w4EiJMbYdiR
         +zJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZpXhcBz85pZHSFxO7IztMlfvhvygUvHRe9NMB75dzZI=;
        b=SrmsdoKECmaHbGMRCK4kSvzRQu4CZ6tQyKEemmYHJ3P8KbjUNGX5sjKwMAQEnj4rV+
         Uh80AFitj1DVKGKVD6RIr52wvU2LcYDFhkc6RX8JBhTMX+Q044/9nmAJzktunZpUiOG6
         paJGX3bP1cFJgdMsj+p/d0jaZC8fQD0NeaTuh3PbY4GEBxFE6SrFl6KN4nF3LmDppdpO
         pTstZMPDvzdHiSx3kesqK8FbCfK7cAJWiRpXc2EpXXSv747rvKm0AOL+g6uQynrIwtyj
         QyWKbPmggG7QCGztLQ18+DMABcnzVMMeJZ5rbbwzq/UOwWu15s8mfSGQJ+Y+Q2s/8Up4
         VFYQ==
X-Gm-Message-State: AOAM531sRjwBq1lzg2s9zOali6Td4fjlfcE8IXEIdfngfslQ3cdcVYKl
        7Zyno8imCx4HRjfHm/+JmMm5gw==
X-Google-Smtp-Source: ABdhPJypY/h7RKqc16xUO47DD6bBDpjECmUqbpavQ7VWC6S4INM4TkOoF6/JkIC/MFzLOS3t4olz4g==
X-Received: by 2002:ac2:4e86:0:b0:479:242:61da with SMTP id o6-20020ac24e86000000b00479024261damr28473023lfr.40.1654887345668;
        Fri, 10 Jun 2022 11:55:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i14-20020ac2522e000000b0047255d2118esm4816218lfl.189.2022.06.10.11.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 11:55:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 1/2] phy: qcom-qmp: fix msm8996 PCIe PHY support
Date:   Fri, 10 Jun 2022 21:55:41 +0300
Message-Id: <20220610185542.3662484-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610185542.3662484-1-dmitry.baryshkov@linaro.org>
References: <20220610185542.3662484-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace init/exit ops with power_on/power_off which should be used for
the PCIe PHYs to fix PHY initialization.

Fixes: f575ac2d64e7 ("phy: qcom-qmp-pcie-msm8996: drop support for non-PCIe PHY types")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index 48ea1de81d7c..21103c41ba08 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -854,8 +854,8 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
 }
 
 static const struct phy_ops qcom_qmp_phy_pcie_msm8996_ops = {
-	.init		= qcom_qmp_phy_pcie_msm8996_enable,
-	.exit		= qcom_qmp_phy_pcie_msm8996_disable,
+	.power_on	= qcom_qmp_phy_pcie_msm8996_enable,
+	.power_off	= qcom_qmp_phy_pcie_msm8996_disable,
 	.set_mode	= qcom_qmp_phy_pcie_msm8996_set_mode,
 	.owner		= THIS_MODULE,
 };
-- 
2.35.1

