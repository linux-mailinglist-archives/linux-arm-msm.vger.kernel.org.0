Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C55308496
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Jan 2021 05:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231892AbhA2EsZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 23:48:25 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:20563 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231838AbhA2Erz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 23:47:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611895650; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=/QNk4pXUN5s/oxY551f2bHvg9tF8YfK3cHP4s0iORG0=; b=viBOKXYer1G4sqfiQi56pd905lsTcWFYRIObti3gMmB/EG4KrXSJDl6C+J8dkcsNE8hxblvO
 io64vjeyPYMHBk7Z9IA20gLhvx177/hCxfd8CFKdonc05GqzecirRWQ9Xc9eWtCpxxe+ONzj
 eInpbG/ir/5nKwQL/l0/Ciq/7pc=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6013934091b605c2ed01be1f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 Jan 2021 04:46:56
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 98531C433ED; Fri, 29 Jan 2021 04:46:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BDF6CC433C6;
        Fri, 29 Jan 2021 04:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BDF6CC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, robh+dt@kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v7 4/5] usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default
Date:   Thu, 28 Jan 2021 20:46:43 -0800
Message-Id: <1611895604-4496-5-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611895604-4496-1-git-send-email-wcheng@codeaurora.org>
References: <1611895604-4496-1-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to take advantage of the TX fifo resizing logic, manually add
these properties to the DWC3 child node by default.  This will allow
the DWC3 gadget to resize the TX fifos for the IN endpoints, which
help with performance.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index d803ee9..4ea6be3 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -564,6 +564,7 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 
 static const struct property_entry dwc3_qcom_acpi_properties[] = {
 	PROPERTY_ENTRY_STRING("dr_mode", "host"),
+	PROPERTY_ENTRY_BOOL("tx-fifo-resize"),
 	{}
 };
 
@@ -634,6 +635,7 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 	struct dwc3_qcom	*qcom = platform_get_drvdata(pdev);
 	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
 	struct device		*dev = &pdev->dev;
+	struct property		*prop;
 	int			ret;
 
 	dwc3_np = of_get_child_by_name(np, "dwc3");
@@ -642,6 +644,14 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
+	if (prop) {
+		prop->name = "tx-fifo-resize";
+		ret = of_add_property(dwc3_np, prop);
+		if (ret < 0)
+			dev_info(dev, "unable to add tx-fifo-resize prop\n");
+	}
+
 	ret = of_platform_populate(np, NULL, NULL, dev);
 	if (ret) {
 		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

