Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7A1A30DFC6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 17:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234104AbhBCQcq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 11:32:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231571AbhBCQcl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 11:32:41 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22421C0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 08:32:01 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id a1so25130613wrq.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 08:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=z+ah7f4PX2nWt/dDHxDHn5aRrz0WxFiLMJ53YbKFp/Q=;
        b=D+sk1lup0aU1YB8IBIS3MTKGIOXBBkL9l/6G+6kpiMPsZkkx2bgVahVIaOv765ho28
         air1S57AB5HUekztwGh5WuxTL68rZTbYQoAU7Taf+K13KNe2TG2GOpQbPwzJTmkd8/Xq
         hKBvX7Ywtmq/0AWYtudsYCF71gDr81ZxwHN+5n+EN9zjsGv1NAQUorY21Sqyi40qIKrH
         Hr8nbLAO5G1KqUVnVScYY95Cc6vhxQMp5JDy5lZcevWZIwaVQFae2/0Tq/PQsyhLiHgR
         yHAqV4SwwzmWLNUih8lElWi7diUh47G0TOy2IwS9HcZascrcnzKlS1Msm00VzNJC20l9
         WZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=z+ah7f4PX2nWt/dDHxDHn5aRrz0WxFiLMJ53YbKFp/Q=;
        b=boWyxh4taSh6eMq3kHpfp7AAJYL6Zz9TFclDYTwBZktYIrWXAHesShKYJHfEjZ4ewA
         p5IXKRf+OenW+VxdZbFkzRHrxS24fGRakRdqoQdMQGbmUX5fchGnpj+ER7BF5R9Cd8ii
         AsfjeeAAAtKlUa1JQkXNYu6IAC8YYaOjpeLK5brptE4e84yVuSN1g3xKmDxdZO7A+CTL
         fCAt73LsS760yqO4hsRZWPbWNzSq52EZ9OpO4ZcOy4WUOvBBz0nGSRkEquGjOvFBcTtV
         FLlh6bCEKs0xzzz6Enjuz545UREFBDBJNT93AD8JlwnM1nWjnEl/neLu9XyhbE3fjJiD
         xcgg==
X-Gm-Message-State: AOAM533GeImyHd4reqXYcbDCaA3oYVcsnm49+MGoVyY3xf+ef3a95glu
        BAx9SXhHD9EsTULzn0a1rYjDiw==
X-Google-Smtp-Source: ABdhPJzJG7YFWew+BqBtxcHNZQJSXYrtLJAN7NY+wbFnMTPKV3EW1NvYLSauqEVeFWAy7gocO0FDGw==
X-Received: by 2002:a5d:47ae:: with SMTP id 14mr4417737wrb.378.1612369919805;
        Wed, 03 Feb 2021 08:31:59 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id v6sm4554719wrx.32.2021.02.03.08.31.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 08:31:59 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] mhi: pci_generic: Print warning in case of firmware crash
Date:   Wed,  3 Feb 2021 17:39:42 +0100
Message-Id: <1612370382-21643-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Print warning when MHI detects sys error.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: remove useless fallthough & unused mhi_pdev variable

 drivers/bus/mhi/pci_generic.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 444693e..2476041 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -217,7 +217,17 @@ static void mhi_pci_write_reg(struct mhi_controller *mhi_cntrl,
 static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
 			      enum mhi_callback cb)
 {
+	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
+
 	/* Nothing to do for now */
+	switch (cb) {
+	case MHI_CB_FATAL_ERROR:
+	case MHI_CB_SYS_ERROR:
+		dev_warn(&pdev->dev, "firmware crashed (%u)\n", cb);
+		break;
+	default:
+		break;
+	}
 }
 
 static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
-- 
2.7.4

