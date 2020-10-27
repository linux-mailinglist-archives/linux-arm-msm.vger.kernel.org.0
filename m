Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA4A29AD63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Oct 2020 14:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441421AbgJ0NeZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Oct 2020 09:34:25 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37600 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2441297AbgJ0NeY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Oct 2020 09:34:24 -0400
Received: by mail-lf1-f68.google.com with SMTP id j30so2360135lfp.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2020 06:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JAxz3t4fxRdi4fBrSczBijxW7IcL4iyhHcw3bRrRmLw=;
        b=J3OTYPQGLdwij21je0sEVctrBbG7wqE5SAWr+YIemQQz8wMKxqxq68sCkVMgoF+X5E
         k1KXl5Y5xHx6B2VMdj+ZAKXgm+c05jn+T7f+bxvX0XbVcfDNaCLCwGtGRc1mhY8sdL7B
         deoTGftQyXvY4/IThktVL+8k0D+QlPX4oLg/6bQ1k31A6x1abIoCQ3bN2fNuMkTOPUWX
         gJ8L8CwkC+N2awxcuN2V4jFhyEN8ny8r7yGaFBL9gmAJzoNs2ZGPfkRYxpyUWl8Lr9oD
         jKnjSAmzAvE9AsQHIG+GDk7rrxvp4VSm3bGfBDR0ABHrslJ2wpWPhfe8Ff3OxMFKI6dP
         Aquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JAxz3t4fxRdi4fBrSczBijxW7IcL4iyhHcw3bRrRmLw=;
        b=QC9ThQ5cVyUEItoWtB3VyveDgHIShc7X1d7g1aOEITtH6yEH4LTEnoKYy+izxssoVm
         hL5Kpb5k8+daFpDv2kWV1uAyNaHrwAsFN/kesW0JESh8YQhahxtgakMQIoResT9x4M5q
         AM51hl4j0RQo9NAyo2BmjP6J1FBH8PV899JnC4wwnT/3wb5WBe9NEkH0GcX3quCeiHHw
         TJyVqnXYrd7T/pZ7vx1kZ2DNW2U6yZyqCZe8RsvgZuhVeYRFqiYhXf0mDMFga+6kEZE2
         bFVxUA+Rv8gTbvxj7z987JOfH+APIkGTloO26TbFSsK3f1UYM8m1pfuMsfN5QnalORgm
         sRfA==
X-Gm-Message-State: AOAM530mA7bmZg1hzk66sQvjbzSXVrl7sXiVfXRLU2eshs8iwUoqksyT
        QrxOOKcJ5icUYEtFVvAyXuOqzw==
X-Google-Smtp-Source: ABdhPJy4o/zTSw/4MM1ARupNXKXTQiw9HE0oBDrsRrk+ShztW9TYEfxMcGFdNpsv2IN93ut29I41cA==
X-Received: by 2002:ac2:4551:: with SMTP id j17mr841782lfm.411.1603805661693;
        Tue, 27 Oct 2020 06:34:21 -0700 (PDT)
Received: from eriador.lan ([188.162.64.248])
        by smtp.gmail.com with ESMTPSA id 26sm182448ljg.30.2020.10.27.06.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 06:34:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v2] interconnect: qcom: use icc_sync state for sm8[12]50
Date:   Tue, 27 Oct 2020 16:34:18 +0300
Message-Id: <20201027133418.976687-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In addition to the rest of Qcom interconnect drivers use icc_sync_state
for SM8150/SM8250 interconnect drivers to notify the interconnect
framework when all consumers are probed and there is no need to keep the
bandwidth set to maximum anymore.

Also move the BCM initialization before creating the nodes to set the
max bandwidth in hardware for the initialization/probing stage.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 7d3b0b0d8184 ("interconnect: qcom: Use icc_sync_state")
---
 drivers/interconnect/qcom/sm8150.c | 7 ++++---
 drivers/interconnect/qcom/sm8250.c | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/interconnect/qcom/sm8150.c b/drivers/interconnect/qcom/sm8150.c
index 9218efed04a0..c76b2c7f9b10 100644
--- a/drivers/interconnect/qcom/sm8150.c
+++ b/drivers/interconnect/qcom/sm8150.c
@@ -551,6 +551,9 @@ static int qnoc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	for (i = 0; i < qp->num_bcms; i++)
+		qcom_icc_bcm_init(qp->bcms[i], &pdev->dev);
+
 	for (i = 0; i < num_nodes; i++) {
 		size_t j;
 
@@ -574,9 +577,6 @@ static int qnoc_probe(struct platform_device *pdev)
 	}
 	data->num_nodes = num_nodes;
 
-	for (i = 0; i < qp->num_bcms; i++)
-		qcom_icc_bcm_init(qp->bcms[i], &pdev->dev);
-
 	platform_set_drvdata(pdev, qp);
 
 	return 0;
@@ -627,6 +627,7 @@ static struct platform_driver qnoc_driver = {
 	.driver = {
 		.name = "qnoc-sm8150",
 		.of_match_table = qnoc_of_match,
+		.sync_state = icc_sync_state,
 	},
 };
 module_platform_driver(qnoc_driver);
diff --git a/drivers/interconnect/qcom/sm8250.c b/drivers/interconnect/qcom/sm8250.c
index 9b58946f7898..cc558fec74e3 100644
--- a/drivers/interconnect/qcom/sm8250.c
+++ b/drivers/interconnect/qcom/sm8250.c
@@ -567,6 +567,9 @@ static int qnoc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	for (i = 0; i < qp->num_bcms; i++)
+		qcom_icc_bcm_init(qp->bcms[i], &pdev->dev);
+
 	for (i = 0; i < num_nodes; i++) {
 		size_t j;
 
@@ -590,9 +593,6 @@ static int qnoc_probe(struct platform_device *pdev)
 	}
 	data->num_nodes = num_nodes;
 
-	for (i = 0; i < qp->num_bcms; i++)
-		qcom_icc_bcm_init(qp->bcms[i], &pdev->dev);
-
 	platform_set_drvdata(pdev, qp);
 
 	return 0;
@@ -643,6 +643,7 @@ static struct platform_driver qnoc_driver = {
 	.driver = {
 		.name = "qnoc-sm8250",
 		.of_match_table = qnoc_of_match,
+		.sync_state = icc_sync_state,
 	},
 };
 module_platform_driver(qnoc_driver);
-- 
2.28.0

