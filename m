Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8FC42D1F47
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 01:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728835AbgLHArl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 19:47:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728822AbgLHArl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 19:47:41 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D811C0611C5
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Dec 2020 16:46:23 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id t22so17186465ljk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Dec 2020 16:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NWy8EXHdxkf0XTbmE1PCRNTwXozVSEc9y+L8i0BKYwI=;
        b=kRfk733PMibuoevBe+zrIfiyJ8guY2Fi01JrvwEF7slv4QqB5WC9oq29RLXEg0x/c8
         b0kr6Z0lB84v/9LhaY0JXC4y4JajuD2XJGpcGKUCCjk/K+Vws3zZ5cv8Aqf6/8Qh5oD5
         VAc6vccjEH1mmUsFG2iKi1WtG9dq3WxDcvGdLxiOQQ4pR1Cnm3J9B8H070mzPMtSkzSX
         VeJAVdyNhVHKNCAmNiN6i54jhcaTzcJIitcCUSexwaIZeE0o3SFm7WXvyx6dipC6x84J
         /U18SS2qHpnZEOH9CxXL1ZCBVf9VCJg74SyLDE3escp2+3JKr+iB98Q9Q9iW0nS69o2B
         LhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NWy8EXHdxkf0XTbmE1PCRNTwXozVSEc9y+L8i0BKYwI=;
        b=KZkjVHyloheRWynSn72SLXixeT5ORfhFga9MVuTAUZ9+A6oocoILwwEj91dtD/D0PV
         c2tLb5VT0qGtJKcWZZuM+zBRCBKqc7g1qidYv0IMN/Q560W4UbO53PLVVLquNLXHOvIm
         /O+TFiHKwhvIi0bEg8JwJG3Mb2WJSb9ePHXw4CNUyOyK4KVqaAgsLh9eU+Lr6YemDmlP
         A0tqSK/2WXz15CpO56acaM82zWtcr/DEGEWTPiUkYoNSH/uhtNli47xrnQ286uNe65Bp
         Gh1YbwBF8htgDPO5tvwcKSl+DFFn823Dic9YGvkVMIW68Nvp6yFaEKHs3EhbQqVxcuTS
         slAw==
X-Gm-Message-State: AOAM530kaxqVcdLMCa/TxUzVFBY+Gcxxe5INfO4KHlHPNWc7/Jz4bSZy
        gSMnSB3Y7cwSHq1vdHBfsQn/dA==
X-Google-Smtp-Source: ABdhPJxL9WoAbggz33zRUk9/WOmUW+eM3LO9RBNrExz635O8Tg6HFh9Vdd+kLYv/LgHL5cD92Z1tPw==
X-Received: by 2002:a2e:5015:: with SMTP id e21mr2020881ljb.433.1607388382105;
        Mon, 07 Dec 2020 16:46:22 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.229.141])
        by smtp.gmail.com with ESMTPSA id d3sm3028229lfj.206.2020.12.07.16.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 16:46:21 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH 2/3] PCI: qcom: add support for ddrss_sf_tbu clock
Date:   Tue,  8 Dec 2020 03:46:12 +0300
Message-Id: <20201208004613.1472278-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208004613.1472278-1-dmitry.baryshkov@linaro.org>
References: <20201208004613.1472278-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8250 additional clock is required for PCIe devices to access NOC.
Update PCIe controller driver to control this clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index e45a43148f56..67712ea48d5f 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -159,8 +159,9 @@ struct qcom_pcie_resources_2_3_3 {
 	struct reset_control *rst[7];
 };
 
+#define QCOM_PCIE_2_7_0_MAX_CLOCKS	6
 struct qcom_pcie_resources_2_7_0 {
-	struct clk_bulk_data clks[6];
+	struct clk_bulk_data clks[QCOM_PCIE_2_7_0_MAX_CLOCKS + 1]; /* + 1 for sf_tbu */
 	struct regulator_bulk_data supplies[2];
 	struct reset_control *pci_reset;
 	struct clk *pipe_clk;
@@ -1167,10 +1168,15 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
 	res->clks[4].id = "slave_q2a";
 	res->clks[5].id = "tbu";
 
-	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(res->clks), res->clks);
+	ret = devm_clk_bulk_get(dev, QCOM_PCIE_2_7_0_MAX_CLOCKS, res->clks);
 	if (ret < 0)
 		return ret;
 
+	/* Optional clock for SM8250 */
+	res->clks[6].clk = devm_clk_get_optional(dev, "ddrss_sf_tbu");
+	if (IS_ERR(res->clks[6].clk))
+		return PTR_ERR(res->clks[6].clk);
+
 	res->pipe_clk = devm_clk_get(dev, "pipe");
 	return PTR_ERR_OR_ZERO(res->pipe_clk);
 }
-- 
2.29.2

