Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61BF82E7844
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 12:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgL3Lzl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 06:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbgL3Lzl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 06:55:41 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAFEC0617A0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 03:54:22 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id h22so37178259lfu.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 03:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0yfX279OZuzXxQVuic47RMVyz6BvZPSwD6cWzb7e40Q=;
        b=Elm2G+Qc7tvWtPKiXfS0up+j5Qf+Y6sAmNGjsmbQbDCMV4PSshvEGABrpt/VYIB6c8
         2zZGKwVwEXt29o7KNSV6m86mPigw43+CgcBJQ+mRQAghcRo2VtRmO46OCYUYoTYCWm8z
         dthGtkrcCmkDobmFo8zZX7Lw7ewULYYA3OAA18OY1Xd16ZZoBADkaBaInPsc+n9042FZ
         /PskxrawIg8I9AZpKDntky9MkCWH6gSUsjyWJsusOw+pJZDgE+LAw3eAzXBG1nUq/FJl
         Jc6kSq+Ga3qjiLuk+GSKozpvIZp2aj6Tr0CK29vsmarpQ58fip9p2/u7mRJ+4oOJj0Mm
         D5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0yfX279OZuzXxQVuic47RMVyz6BvZPSwD6cWzb7e40Q=;
        b=LcloEMl336fyCvep2lnU9pLJfs4VJF5EqGjab2z+oxkKGBs7c4e4tK12i61ed/LPff
         dG23kyU6uNs9TI2sHvElrSf5k2KCydg6VmsTbGPlz0+EW6t8RhNsDm+ocfqCeZzjgRC9
         eYMzQlw8vE8MUOphbmFfX3w1KN1Ro00zI/Rz72sOq/E5Zgsvw7oZoO1XYdcMdiW5k9oE
         Dsbj674CjJR++Uy5YSuK1bAji09/ATEK/1CwQEKVLnQGtMx9NndTcutTQeCx4ZITT5AC
         nmnV4ytp/dcWADoSUpeiLlI3nPeckpqRvX4vRpd65rpDfBgPzeBGQaid0AnZdVEJGT93
         PaCA==
X-Gm-Message-State: AOAM533lIi3rPFfwnhdmg3YbCplANZ4QumDQYWdHzYVm2khnpEhqsEpI
        PGGZppZEoUmTfqqADKjU6RMwPw==
X-Google-Smtp-Source: ABdhPJyanAgqPG5+ohgUBfm+HvqGe/2uXjUXdvhLry6GamZB+JKQnuW944rARjo3vDMhOMdpAfBABA==
X-Received: by 2002:a2e:9b47:: with SMTP id o7mr25430139ljj.99.1609329261019;
        Wed, 30 Dec 2020 03:54:21 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.115])
        by smtp.gmail.com with ESMTPSA id a8sm5931484lfo.206.2020.12.30.03.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 03:54:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-pci@vger.kernel.org
Subject: [PATCH v2 2/2] PCI: qcom: add support for ddrss_sf_tbu clock
Date:   Wed, 30 Dec 2020 14:54:08 +0300
Message-Id: <20201230115408.492565-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201230115408.492565-1-dmitry.baryshkov@linaro.org>
References: <20201230115408.492565-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8250 additional clock is required for PCIe devices to access NOC.
Update PCIe controller driver to control this clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: e1dd639e374a ("PCI: qcom: Add SM8250 SoC support")
---
 drivers/pci/controller/dwc/pcie-qcom.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index affa2713bf80..658d007a764c 100644
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
@@ -1153,10 +1154,15 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
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

