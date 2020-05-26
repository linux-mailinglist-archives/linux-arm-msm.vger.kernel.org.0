Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51E2C1E1996
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 04:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388417AbgEZCip (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 22:38:45 -0400
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:53448 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388393AbgEZCip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 22:38:45 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 49WJ781GDtz9vYxn
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 02:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TAwmXM723RLv for <linux-arm-msm@vger.kernel.org>;
        Mon, 25 May 2020 21:38:44 -0500 (CDT)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 49WJ776gb3z9vYl3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 21:38:43 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 49WJ776gb3z9vYl3
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 49WJ776gb3z9vYl3
Received: by mail-io1-f70.google.com with SMTP id z13so5577693ioh.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 19:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=T2pyZeWX2xec+ABdMSwYqLtzMRs3/3YjO1fw5oaVquU=;
        b=QrkWi+59wzuuP/esokdUKbXtJZTN1ik3pHrfAJIkMVshbZGSE1sx38s6j2J10klopp
         uBSwcdBVUFJ8WUhzv9aCl3BLWo9s3Ipr4ForP9F3PsMURdRbHQcztqiPOnAoydBCoh2n
         Zn9AoBvWL8M5A0Tgg1thLFT5Kfq6TVJhSw9i2NGNCIsggZ5GIu+8ZtR9BbXCdbScob/V
         1UY+QVUtuJbGM7lS929r9xyYBzD5zPjVzbRHRxxvxh8htzlm86KHw9S5PR/NzEVoMQ03
         i9zOoEHadZfe92uyr7JTC/CAh9rg7VKxP3yLXww1rfCmuH6O0Mf+dmHxXKnJLULBQWmM
         6S1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=T2pyZeWX2xec+ABdMSwYqLtzMRs3/3YjO1fw5oaVquU=;
        b=aMSTpNgoisJAW+up6rnQjCRqrDk1El1Tn/yLl97hiC8JH972LI+NJlSqsyuh4MVmmq
         Jc0pB/5DI4+z+OCRCtr3ktuC2kfV1Gw3qI7i3IEjKRtVYFlWgbAA08c4fa+50IxJ88+r
         JKOpgnhjKB5YIpitAo+VY+t5BLAKxIrSDBDRdzOfczwish0aLumymtphIu9HPOeuYY37
         QJIZr/NM2HaphMq3nIfFMYmFiif8HmXyJeHvIMsViUhbZZ+f7Fi6r1iznMeIzpZ5vCGy
         Sdm3Zr7sELjJF5bEPa9TllvgjECWnLhjRq6aXmzgJlMEi61lzP6PGKLoMXCr90xIkvNF
         IoAA==
X-Gm-Message-State: AOAM532wKBRO+HVx9ZbD+/smQnr74IhLjkB+DDcLq4D70S3BrDW6oZdG
        h3wQ15P69w65iNXWEyRS5XBgQrcI9gZwYDIJ09c6jb5p334fejbDAi+erqBcAvw5Ep3Cw2NQJ4s
        roFGFjxlIlhxa7HfoPa+vUlhRSsO5TA==
X-Received: by 2002:a92:d2ca:: with SMTP id w10mr27598003ilg.141.1590460723484;
        Mon, 25 May 2020 19:38:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxUlisi2OBDfGcYZPt6a3J73pAP0NhbInGJihnQnLZHFBPNyxHuTnFkRnboV3hBIBHQBy0Zg==
X-Received: by 2002:a92:d2ca:: with SMTP id w10mr27597982ilg.141.1590460723159;
        Mon, 25 May 2020 19:38:43 -0700 (PDT)
Received: from qiushi.dtc.umn.edu (cs-kh5248-02-umh.cs.umn.edu. [128.101.106.4])
        by smtp.gmail.com with ESMTPSA id f10sm10058337ilj.85.2020.05.25.19.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 19:38:42 -0700 (PDT)
From:   wu000273@umn.edu
To:     svarbanov@mm-sol.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh@kernel.org, helgaas@google.com,
        p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kjlu@umn.edu, wu000273@umn.edu
Subject: [PATCH] PCI: qcom: fix several error-hanlding problem.
Date:   Mon, 25 May 2020 21:38:35 -0500
Message-Id: <20200526023835.5468-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

In function qcom_pcie_probe(), there are several error-handling problem.
1. pm_runtime_put() should be called after pm_runtime_get_sync() failed,
because refcount will be increased even pm_runtime_get_sync() returns 
an error.
2. pm_runtime_disable() are called twice, after the call of phy_init() and
dw_pcie_host_init() failed.
Fix these problem by pm_runtime_put() after the call of call 
pm_runtime_get_sync() failed. Also removing the redundant 
pm_runtime_disable().

Fixes: 6e5da6f7d824 ("PCI: qcom: Fix error handling in runtime PM support")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
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

