Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD7259D458
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2019 18:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732479AbfHZQqh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Aug 2019 12:46:37 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40378 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733122AbfHZQqb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Aug 2019 12:46:31 -0400
Received: by mail-wm1-f66.google.com with SMTP id c5so165570wmb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2019 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nxlnCpV0F3leEABjK0OQeWrArZ1TknDUFhS5oY3oysQ=;
        b=ypAJGo6UVHfJ06Xwq5kT1osFoV8ZYZmE4VagpaqE0RpfwOMuDd8qlhhh1LqhU7iJB+
         VlxEoNhknxCqoIEzKwN9znYkjJPGfFPtRX4D1uG8tXYNuww+6lklkMrZ3sHqQ7zN3Pt4
         58T/les7f+TvdL1RVndGesaZAcrqQ4IFO/B9/91iD1aw8ElnTEubFLyCFrfitKrPYHQM
         WyU6GtPqwEv33cwSZSkd1fm4hlJ8sxMEQznhoKpbX4kyggcwwdRyTjihQGKP4In0gBP1
         CGUa7O/ayA7ZCmZ/nnENtjuJtUpfPWLcbxBpJz271uR8xDitGOHpkYfCJFIcF+n1eyw9
         aS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nxlnCpV0F3leEABjK0OQeWrArZ1TknDUFhS5oY3oysQ=;
        b=WOz8a6Qi+ONGysB6F16Uyxr8e5en0PZARHOlE2gCGkot94kxopEIP9IGRGU5k+oydY
         grADHHSZeFRJreoSGKzq1i8fVRhbS72znYs3odz/KM6qWHPiwHWrFm8XUJdT3+GS/4Ms
         SNUpmaLlYICGNOsB7yaSACyBzIHtJs9KyMC8VuHIh6Uxo2WUgttLIphzoTtnKd+sgcPx
         Nc6oE4YfSYLR4P3wOiTsJpbk7H+vBuIeg4+DDcqnwk9owe+juh8e0rFzobJlzNa0yrcZ
         K2CGMEShdtUkV2p9uogbWm8M5xAkBm3MYCNIyL3BLWPIGuTe3muak4CiTiovy36JZCPc
         Xgbw==
X-Gm-Message-State: APjAAAUY1KO2I6aY1fnUiVVdk5QA1DgSQohhMAR9bG1BvDTZrUocrW8P
        QkLj+aVdLSi/w7eWnM9El2t7HA==
X-Google-Smtp-Source: APXvYqwsCFbzy/6OLDpg1Y6Ky7KLKk5z9uocm3W6TH0f88v2t/Fsd+J7PVmjIwZdzIm55KmWJXUu5g==
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr20825779wmi.61.1566837989018;
        Mon, 26 Aug 2019 09:46:29 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id 5sm18768wmg.42.2019.08.26.09.46.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 26 Aug 2019 09:46:28 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, jassisinghbrar@gmail.com,
        agross@kernel.org
Cc:     niklas.cassel@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mbox: qcom: add APCS child device for QCS404
Date:   Mon, 26 Aug 2019 18:46:24 +0200
Message-Id: <20190826164625.6744-1-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is clock controller functionality in the APCS hardware block of
qcs404 devices similar to msm8916.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 705e17a5479c..76e1ad433b3f 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -89,7 +89,11 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
+	platform_set_drvdata(pdev, apcs);
+
+	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global") ||
+	    of_device_is_compatible(np, "qcom,qcs404-apcs-apps-global")) {
+
 		apcs->clk = platform_device_register_data(&pdev->dev,
 							  "qcom-apcs-msm8916-clk",
 							  -1, NULL, 0);
@@ -97,8 +101,6 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "failed to register APCS clk\n");
 	}
 
-	platform_set_drvdata(pdev, apcs);
-
 	return 0;
 }
 
-- 
2.22.0

