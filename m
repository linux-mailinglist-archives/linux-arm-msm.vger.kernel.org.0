Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D601E35F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 04:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbgE0Czq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 22:55:46 -0400
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:41690 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgE0Czq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 22:55:46 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 49WwSK2f8jz9vJs1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2020 02:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ACZmYrvWI722 for <linux-arm-msm@vger.kernel.org>;
        Tue, 26 May 2020 21:55:45 -0500 (CDT)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 49WwSK0wL1z9vJrd
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 21:55:45 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 49WwSK0wL1z9vJrd
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 49WwSK0wL1z9vJrd
Received: by mail-il1-f198.google.com with SMTP id v87so19224511ill.23
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 19:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=dd9TczXeKWbVN5d9i1e4JepiH139Y9rdVzxnRRWNp88=;
        b=I1PT9sPm4WcUrEiIQ1S3ZUiObaUysFl97PlWe/VAhRNCrhzJQYyNP6Hn0V7cnJgFFt
         lsV96KMIvxM54AHjO3cYchqFRc+FKWUXtW/OM1RC1akTgSX7tD/7TkU3W81P7/msPPl/
         nlIxYzM+L8dZIibGy9mPKMpz2UxflLKrBL88CD4TvyNFY/83OKQGL9PJvsc03Ms6QcFz
         +w4T7/sIuDVeyKCUjaquACx5V6x+btMUYqqgecYnuA4tTutQaa+oixCHaLBzpcCrM+DN
         nw42UaBY6C8vSUU1etu/J4ha6ajphVS13rLf0kyDr8t+GWLCdageKidRCvz/MxxgX2Su
         /DrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dd9TczXeKWbVN5d9i1e4JepiH139Y9rdVzxnRRWNp88=;
        b=eXugIRjTmCeyaf5vpTpGxDv46j0YGcYEdeXrschlgmTb9C+3Zq39F+DsTF9r+9Ekcc
         9dQagUKa+VqfrCqkikxxyDDCzphh7LdbkQWwVYw+wy6fB+0ALDSIbIL6ohnWJ9+FMlsJ
         URkW3ipTuGbQudzWmGfQfib/EdtlUSPXBD7aJ+UwdZX6uq+yjVHiGos3QVb/WT8uQLxX
         lFQ7CasaH8Zc8QLCFX5VwaehsSbYoCuK7WenapvThoBx1WcsAnrMuucoYCfJDNGcY9xo
         YnputUVu1YGZAbCZ3jHVhF2UjMLv+LlIElTOi3ln3BrSRo68q4Cia9QstohZNcKBzUOD
         MRoA==
X-Gm-Message-State: AOAM533UY6OtkmFxgX5u5h9131hagBs321LQR8lriOkcHBUfywpzJqDq
        bR2QTyutyQlIeaZpElbGdhL8keSF1/sdaUWGX1ioAiQwxbkj3Z6+5Hi9n7Hw7nvNCwjhRFgej6S
        M/KBuxArP40NMBuk2HtQF/b+Qi+dO4A==
X-Received: by 2002:a92:58d6:: with SMTP id z83mr3895932ilf.129.1590548144631;
        Tue, 26 May 2020 19:55:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHYUY+uSNCCON7fyGW5rBDCaOJIjvP0uCMCJ/fAmp1UOgXVlUABz74vZTjaLO5+Tbkt+YNig==
X-Received: by 2002:a92:58d6:: with SMTP id z83mr3895912ilf.129.1590548144188;
        Tue, 26 May 2020 19:55:44 -0700 (PDT)
Received: from qiushi.dtc.umn.edu (cs-kh5248-02-umh.cs.umn.edu. [128.101.106.4])
        by smtp.gmail.com with ESMTPSA id j17sm882047ilq.79.2020.05.26.19.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 19:55:43 -0700 (PDT)
From:   wu000273@umn.edu
To:     svarbanov@mm-sol.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh@kernel.org, helgaas@google.com,
        p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Markus.Elfring@web.de, kjlu@umn.edu, wu000273@umn.edu
Subject: [PATCH V2] PCI: qcom: Improve exception handling in qcom_pcie_probe().
Date:   Tue, 26 May 2020 21:55:31 -0500
Message-Id: <20200527025531.32357-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

This function contained improvable implementation details according to
exception handling.
1. pm_runtime_put() should be called after pm_runtime_get_sync() failed,
because the reference count will be increased despite of the failure.
Thus add the missed function call.
2. pm_runtime_disable() are called twice, after the call of phy_init() and
dw_pcie_host_init() failed. Thus remove redundant function calls.


Fixes: 6e5da6f7d824 ("PCI: qcom: Fix error handling in runtime PM support")
Co-developed-by: Markus Elfring <Markus.Elfring@web.de>
Signed-off-by: Markus Elfring <Markus.Elfring@web.de>
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 V2: words adjustments and fix some typos 
 drivers/pci/controller/dwc/pcie-qcom.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 138e1a2d21cc..10393ab607bf 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1340,8 +1340,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0) {
-		pm_runtime_disable(dev);
-		return ret;
+		goto err_pm_runtime_put;
 	}
 
 	pci->dev = dev;
@@ -1401,7 +1400,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	ret = phy_init(pcie->phy);
 	if (ret) {
-		pm_runtime_disable(&pdev->dev);
 		goto err_pm_runtime_put;
 	}
 
@@ -1410,7 +1408,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	ret = dw_pcie_host_init(pp);
 	if (ret) {
 		dev_err(dev, "cannot initialize host\n");
-		pm_runtime_disable(&pdev->dev);
 		goto err_pm_runtime_put;
 	}
 
-- 
2.17.1

