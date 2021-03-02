Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB26E32B2DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Mar 2021 04:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242299AbhCCBPx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Mar 2021 20:15:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446819AbhCBN3B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Mar 2021 08:29:01 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09904C061A28
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Mar 2021 05:28:21 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id c16so2562094ply.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Mar 2021 05:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PqPgRtzVantKyRNR1zZk8EcuOOdksOMCXe9nMbpmH0o=;
        b=KhrvHfmW54YOdVY/n36ESd9/pdRvnND7vy94ZX7v6gkP5vQBdXGN/2dndp3CXxob3O
         0xMeF80owgoInE0hQvw9eGl03YK8+P0PKUT2rXNJ3ONhuXnfOSMmTf3VtvCO/ptCPAqb
         DXKMCse35CkVmQeA78HmSuIAQyPaFWs2nNBIa9NbaKLdp4jgWp5zpPvrVYoBl7C5Vk6w
         j2pEp/wBwj6eTOtiFQEqb6jkJ/lxD2E5PA884lKxkGRlbTegtYSV4Ui6eCJOCyMFbsEp
         2VYrcxUAv3oRz+zpM1sbFxRvZnaXWtaDXrr5JyKx5Jh+CDdC61bYY6SslLIX8dgWxt8H
         2BhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PqPgRtzVantKyRNR1zZk8EcuOOdksOMCXe9nMbpmH0o=;
        b=s3OwOU25TPqi3zyg0QXzkN+iAM+ovBOj/V+uLSfOYUSuO5eqKKkc29JBNIAzmfhcBH
         /eNMVpA0qWleIRUf5ze5cTLcEj3y8grRUW7u6pVsN2M+vlOLrZzgt/UQfZxSxJVl8jiU
         SbEsj6gtMMYIj30hWG+wdk43gbjJoK4olpF08sgx1TinvFKzmhOaXfNlC5UfsZLJ5jX7
         q580pm/I/OGb1MtbpPqYSxCdZKzTAl3iTKrMLPcFeNKo1mjuy3/1yRjM5WOte7fuLii2
         l8j7GGwcZWWpN3ErRWWq9yZvtN8y4dDDKovrnOA5lM8ey+zJyDJXCje5Gd/+CldAoO9x
         mt0Q==
X-Gm-Message-State: AOAM533GpLppTXYsk6yF65PDQ/THYpSk6Kwn11/kySL6kxkO6JB6F0pR
        nDNxhr4zodpohrCH0kTGs2Xc
X-Google-Smtp-Source: ABdhPJzNqdjp6LlEtRCSQEo3DvznilMTpm/AJqjpAuo55QQR78RWQNlHDHM1hfTHqDgBvPVLQF71kg==
X-Received: by 2002:a17:90a:e2ca:: with SMTP id fr10mr4533637pjb.18.1614691700590;
        Tue, 02 Mar 2021 05:28:20 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.74])
        by smtp.gmail.com with ESMTPSA id w1sm13027454pgs.15.2021.03.02.05.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 05:28:20 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc:     linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
        Daniele.Palmas@telit.com, bjorn.andersson@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/2] mtd: rawnand: qcom: Return actual error code instead of -ENODEV
Date:   Tue,  2 Mar 2021 18:57:57 +0530
Message-Id: <20210302132757.225395-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
References: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In qcom_probe_nand_devices() function, the error code returned by
qcom_nand_host_init_and_register() is converted to -ENODEV in the case
of failure. This poses issue if -EPROBE_DEFER is returned when the
dependency is not available for a component like parser.

So let's restructure the error handling logic a bit and return the
actual error code in case of qcom_nand_host_init_and_register() failure.

Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index c2dc99c1b2f1..54230f2c1a3f 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2952,7 +2952,7 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 	struct device *dev = nandc->dev;
 	struct device_node *dn = dev->of_node, *child;
 	struct qcom_nand_host *host;
-	int ret;
+	int ret = -ENODEV;
 
 	for_each_available_child_of_node(dn, child) {
 		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
@@ -2970,10 +2970,7 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 		list_add_tail(&host->node, &nandc->host_list);
 	}
 
-	if (list_empty(&nandc->host_list))
-		return -ENODEV;
-
-	return 0;
+	return ret;
 }
 
 /* parse custom DT properties here */
-- 
2.25.1

