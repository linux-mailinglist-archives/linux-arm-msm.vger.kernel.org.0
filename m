Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB1D479B35
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Dec 2021 15:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbhLROKg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Dec 2021 09:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233337AbhLROKg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Dec 2021 09:10:36 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C57C06173F
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Dec 2021 06:10:35 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id bn20so7885199ljb.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Dec 2021 06:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W9jdk7r3IOG4RIA9s1m47ShpIrTm4qBfDERhWxxlQOw=;
        b=NbDUiOJD95EDE6kdhY/TRXoJyaa120ukkikvm/2bD1iIZ/c9QOTFu8OUEXEf3hyLBW
         e2I2ABGPC12P/Fp3kpUWr3I07ClTUJ9QCkIpyTSo+D0qfOdhj0rZmeLto/8X+CZKEUbP
         1Ar0/PgJNWro/uE/QYInvF2COC7ZeZ0tqKunTYDry6NEsvlOkD6ATlmcXOaLaSAuzT4+
         qo7erjl166IA5/5kwpyv0wV29Gw9QtwPgNzl4UwPmknmO2DkgRK3mWKIv+7wOyiLXhnB
         VGtZpE33UV0WbqaIF5UwSWvU3o8SooBDeNkKdxJ7SA0MRkNV8ZQYNsYXst1t6EIo3V/8
         mECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W9jdk7r3IOG4RIA9s1m47ShpIrTm4qBfDERhWxxlQOw=;
        b=64gHqhRRfpwgmWOIurv026JqXrWycs1hhtkNnB04/yczZL8pudjDs1t7Gz3TCG1Whp
         yh/j3Yn/wP/natL58XRguvsl/rgAlEmJB9OKRg1RQoW17vTL2dgmfKI2n8MlgmbJ8Aec
         SELR13AaY9GJmheT+KSrBtDIzldKivMeJtRUWaOQu/Bfm4936njBOyFgbK58CarrZLEg
         ChI3lspgp8zZyWrw11W0EDKjALMHoYKHBKQ3Ra0+CHgc/iWF6JjPm/fvKWLNbKroWTD2
         N881szVoUXxQI6BHXPwyfdZXP0mQ90rELY7nkKqGJz8miR3KA/xvK11M7Wpp/A+zR5Dx
         Kdbw==
X-Gm-Message-State: AOAM530JOOxtcdB8AjTEfpb2v1hRF+BOrGNBWeh15k1c1WkzLQT9tuHD
        HovMjI3qQYOtja1EGLTESTLb7g==
X-Google-Smtp-Source: ABdhPJydOkVbKGQ/hWi+9HUsHe1JrKrmVeYg/YxzxxgLW8yv3pS2beqnplZEFG4BHC5xEAl/MeRDoQ==
X-Received: by 2002:a2e:80a:: with SMTP id 10mr6891037lji.337.1639836634059;
        Sat, 18 Dec 2021 06:10:34 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id c2sm145789lfh.189.2021.12.18.06.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 06:10:33 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v5 3/5] PCI: qcom: Add ddrss_sf_tbu flag
Date:   Sat, 18 Dec 2021 17:10:22 +0300
Message-Id: <20211218141024.500952-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211218141024.500952-1-dmitry.baryshkov@linaro.org>
References: <20211218141024.500952-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm PCIe driver uses compatible string to check if the ddrss_sf_tbu
clock should be used. Since sc7280 support has added flags, switch to
the new mechanism to check if this clock should be used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 1204011c96ee..d8d400423a0a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -191,6 +191,7 @@ struct qcom_pcie_ops {
 struct qcom_pcie_cfg {
 	const struct qcom_pcie_ops *ops;
 	unsigned int pipe_clk_need_muxing:1;
+	unsigned int has_ddrss_sf_tbu_clk:1;
 };
 
 struct qcom_pcie {
@@ -1133,7 +1134,7 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
 	res->clks[3].id = "bus_slave";
 	res->clks[4].id = "slave_q2a";
 	res->clks[5].id = "tbu";
-	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sm8250")) {
+	if (pcie->cfg->has_ddrss_sf_tbu_clk) {
 		res->clks[6].id = "ddrss_sf_tbu";
 		res->num_clks = 7;
 	} else {
@@ -1449,6 +1450,7 @@ static const struct qcom_pcie_cfg sdm845_cfg = {
 
 static const struct qcom_pcie_cfg sm8250_cfg = {
 	.ops = &ops_1_9_0,
+	.has_ddrss_sf_tbu_clk = true,
 };
 
 static const struct qcom_pcie_cfg sc7280_cfg = {
-- 
2.34.1

