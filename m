Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3793B7F8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 11:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233771AbhF3JDn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 05:03:43 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:20679 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233786AbhF3JDi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 05:03:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1625043669; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=DzPXWOao9emXhv/z0DKTPWcbWvSUgvcXSWMkDPHie7E=; b=a58IrcyZz8B3aC6KygOrTTjts/Cc8EyRBfPbZtrg/PRPCvDlSzidgfPxHM1Hfl8zAGnuPa4T
 SCBgiu8uFmOEZl3pP5gywcQDX4RXUxy8d+iW7JbJxCkdf25aklZ+UzixgHr4wG0ddfSRG7Ul
 8rJBp1YPHTb5clH8JV1gIK6/Wdo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60dc32c35e3e57240bac1560 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 30 Jun 2021 09:00:51
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AA0F1C433F1; Wed, 30 Jun 2021 09:00:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 30047C433F1;
        Wed, 30 Jun 2021 09:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 30047C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v11 4/5] usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default
Date:   Wed, 30 Jun 2021 02:00:41 -0700
Message-Id: <1625043642-29822-5-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625043642-29822-1-git-send-email-wcheng@codeaurora.org>
References: <1625043642-29822-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to take advantage of the TX fifo resizing logic, manually add
these properties to the DWC3 child node by default.  This will allow
the DWC3 gadget to resize the TX fifos for the IN endpoints, which
help with performance.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 49e6ca9..cec4f4a 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -640,6 +640,25 @@ static int dwc3_qcom_acpi_register_core(struct platform_device *pdev)
 	return ret;
 }
 
+#ifdef CONFIG_OF
+static void dwc3_qcom_add_dt_props(struct device *dev, struct device_node *np)
+{
+	struct property		*prop;
+	int ret;
+
+	prop = devm_kzalloc(dev, sizeof(*prop), GFP_KERNEL);
+	if (prop) {
+		prop->name = "tx-fifo-resize";
+		ret = of_add_property(np, prop);
+		if (ret < 0)
+			dev_info(dev, "unable to add tx-fifo-resize prop\n");
+	}
+}
+#else
+static void dwc3_qcom_add_dt_props(struct device *dev, struct device_node *np)
+{ }
+#endif
+
 static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 {
 	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
@@ -653,6 +672,8 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	dwc3_qcom_add_dt_props(dev, dwc3_np);
+
 	ret = of_platform_populate(np, NULL, NULL, dev);
 	if (ret) {
 		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

