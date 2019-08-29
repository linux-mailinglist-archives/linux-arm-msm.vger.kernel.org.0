Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEF9CA13A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 10:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbfH2I2G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 04:28:06 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39341 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725853AbfH2I2F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 04:28:05 -0400
Received: by mail-wr1-f67.google.com with SMTP id t16so2471304wra.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 01:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lilzGlUwQU28vzRL0gWRdi9fa9mAG2A2WZEnKecmDsA=;
        b=WTLIlW9mbcziQr42P5O7bdG+XWMgUf8nUbqBtyNEz4y4Cx91sYn6u7QgtXsY6lqAOY
         oA1/pUYMdxLCx+RP8FIfkAOUXK2sEebowigSO9ytEwfr4CCfoOZV3LKuGhbEzAXQr6ef
         sZUYFXx5Dy4eXvz1oiNlvlJ9L5YLaOSTf0qfDs6kpdBl20H9G9lbolHVmJpZvC7MF1rm
         RNRFPwR2/Kyih/BR+nHfhTgB/g7bSXTe0/9cF35a3/DQlcyOhcUkyuDzlsnD1NZaGdp5
         udiHmQJwALa9N2t6M1+5UBZyFL+RnKj5+FidaH2XixgKQrBCxbnAO5TcyclLEVc6ywxi
         Kcrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lilzGlUwQU28vzRL0gWRdi9fa9mAG2A2WZEnKecmDsA=;
        b=Kx6yjlyq2/OrPaIIldBLy2x3z9FZ3yW9356opWTZtlDf1fxPa4Fr38emi3LAJcWXGw
         OfbyYpuSdp7cbC3PGnL9M4cn9xWa255EpbHSYUgxUDekwTkDyzzRILwrFY5qAhnORx7T
         XdnEC0czfmoetI0E/bWS8VPrp4N0lIXMFMc19b+w/0ljI5+C18PxHhWvckMfwnWmk5VW
         6fJsW2LEUD8ezDsbjIWvq2gYDGtOBwHZ+9lrybizqkk22tqGMtrRBBsEo9mu5XNdJk5Q
         xXJGymVlpmICgjmk6H5LElHOVWz8uqoXRXFEePRak6XBerIqa009z4Nw17jW1FDCYIaR
         O7eA==
X-Gm-Message-State: APjAAAUkxwQd0m/yAmOTgEM0BHeuq+vSCh7NPhGnqJ5diWxwAdjp3Bmu
        gAystHyF90yGBb3nYRTpViEROg==
X-Google-Smtp-Source: APXvYqzqBTU39KSPVvNNxc0uP6IGXbDsBSgTqteicXKYf61XIj4gLhXaZ2NJMElu7216rtpr6LYftg==
X-Received: by 2002:adf:ea03:: with SMTP id q3mr9578467wrm.219.1567067283443;
        Thu, 29 Aug 2019 01:28:03 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id f24sm1884489wmc.25.2019.08.29.01.28.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 29 Aug 2019 01:28:02 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        agross@kernel.org, jassisinghbrar@gmail.com
Cc:     niklas.cassel@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mbox: qcom: add APCS child device for QCS404
Date:   Thu, 29 Aug 2019 10:27:58 +0200
Message-Id: <20190829082759.6256-2-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829082759.6256-1-jorge.ramirez-ortiz@linaro.org>
References: <20190829082759.6256-1-jorge.ramirez-ortiz@linaro.org>
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
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 705e17a5479c..d3676fd3cf94 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -47,7 +47,6 @@ static const struct mbox_chan_ops qcom_apcs_ipc_ops = {
 
 static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	struct qcom_apcs_ipc *apcs;
 	struct regmap *regmap;
 	struct resource *res;
@@ -55,6 +54,11 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 	void __iomem *base;
 	unsigned long i;
 	int ret;
+	const struct of_device_id apcs_clk_match_table[] = {
+		{ .compatible = "qcom,msm8916-apcs-kpss-global", },
+		{ .compatible = "qcom,qcs404-apcs-apps-global", },
+		{}
+	};
 
 	apcs = devm_kzalloc(&pdev->dev, sizeof(*apcs), GFP_KERNEL);
 	if (!apcs)
@@ -89,7 +93,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
+	if (of_match_device(apcs_clk_match_table, &pdev->dev)) {
 		apcs->clk = platform_device_register_data(&pdev->dev,
 							  "qcom-apcs-msm8916-clk",
 							  -1, NULL, 0);
-- 
2.22.0

