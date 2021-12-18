Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572BE479B20
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Dec 2021 15:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbhLROCd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Dec 2021 09:02:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233289AbhLROCd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Dec 2021 09:02:33 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9644CC061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Dec 2021 06:02:32 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id p8so7875545ljo.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Dec 2021 06:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lLa+tzwx7XxWdZm29gsG4pz/a1KbS3NQdHtzFc2AAO8=;
        b=rfLR9UhoD1kXauMze2WNNbu2j1vP5gugfjxcky6mdIP0EhZ3QPAonQQ2Rys9Wgrg85
         l9pc+U+3kVP1SECQjhKHLUFE51jt1kdvuOh8KdMdXA/JThHGto7NRKNBiGwuUf6emzFm
         RH1L6Bu14O0J24zWHyEYLOTaQcqNuBDD3er5Boe9sVDEiuhauD/poy9hFcHRT9o2I8AX
         P0DiC1DXzvlBkqO3ShC+nBWQqIhZsu+4UtfPXXY9qDny+5EeKQ3/lNX/6ckhxos1ep9o
         2cOPcykVt2Z/js1MmVB+pFiS3cOmojS5rCsOl5ishpJ4AUEAffnC6mznNxoh2972y4Ox
         C0Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lLa+tzwx7XxWdZm29gsG4pz/a1KbS3NQdHtzFc2AAO8=;
        b=HYwVB5a4/71bfGeDuXSZqtrJqFCtuzWutsW+OAY+iqeC88Zu1snQ89GBIJvMZARJU1
         Ggcif7M5DzJ3FLka7rtWYpiaYOpr3GoPqQGeCp3cpGeFc7QJtumyFTcHaEqaFSDhhEMf
         MvQq4IwHu36cews9jl8uGgZWk10ddcR1cfLGDrw9Gew6ri18oBNXcRo+brmL3A7gycKW
         wkwEDCSAM/WTZ9RHU0Ba4LQb0UkpbF49TmgISv/E3vVZPdOW4Q9+IUJq7cK/UDFps0Se
         EtBrKrQieGxxiFMBML+4hps4m1nEuzk3eRlSZ5eyiCfgP+HLgKuMMOiXzACTquqNG3Tr
         6TAw==
X-Gm-Message-State: AOAM5314VEgvqwoA723x1VWRj6j9iSoELspk08IeVW0bFBOcH5ffesXW
        JhuFWLAQwuTfCEsxnWE+JuTmpg==
X-Google-Smtp-Source: ABdhPJwym51zI53iwb5vIFxBsrnJAt0jWjaxaX6WkGLt41QOKPSZhc10vTJQiGwMV4+t6eF+dkDlIg==
X-Received: by 2002:a05:651c:1987:: with SMTP id bx7mr6534651ljb.35.1639836150862;
        Sat, 18 Dec 2021 06:02:30 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id s15sm2023979ljj.14.2021.12.18.06.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 06:02:30 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        Prasad Malisetty <pmaliset@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 1/3] PCI: qcom: Balance pm_runtime_foo() calls
Date:   Sat, 18 Dec 2021 17:02:21 +0300
Message-Id: <20211218140223.500390-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211218140223.500390-1-dmitry.baryshkov@linaro.org>
References: <20211218140223.500390-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the error path in qcom_pcie_probe(): remove extra calls to
pm_runtime_disable() (which will be called at the end of error path
anyway). Replace a call to pm_runtime_get_sync() with
pm_runtime_resume_and_get() to end up with cleaner code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 1c3d1116bb60..3a0f126db5a3 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1543,9 +1543,9 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	pm_runtime_enable(dev);
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
-		goto err_pm_runtime_put;
+		goto err_pm_runtime_disable;
 
 	pci->dev = dev;
 	pci->ops = &dw_pcie_ops;
@@ -1594,7 +1594,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	ret = phy_init(pcie->phy);
 	if (ret) {
-		pm_runtime_disable(&pdev->dev);
 		goto err_pm_runtime_put;
 	}
 
@@ -1603,7 +1602,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	ret = dw_pcie_host_init(pp);
 	if (ret) {
 		dev_err(dev, "cannot initialize host\n");
-		pm_runtime_disable(&pdev->dev);
 		goto err_pm_runtime_put;
 	}
 
@@ -1611,6 +1609,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 err_pm_runtime_put:
 	pm_runtime_put(dev);
+err_pm_runtime_disable:
 	pm_runtime_disable(dev);
 
 	return ret;
-- 
2.34.1

