Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1294209EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 13:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbhJDLTY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 07:19:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58085 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232978AbhJDLTN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 07:19:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633346244; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=NZDs4uc6sYd+cdl1AV/f0rDcGHRZlaq5tNvwgSlXtVA=; b=AC9hAZB5H28tOnNpYFVOkWt5ug9i1ZEvv7HwE/+SIErJZb+CprEAuLs5Pf6OIWRZiFxS7cfD
 +WBZ6vex/N83/5ZlnPQv5H1FHFnQsBqjNHv67HGFvUQo09CiQF9+JTtXNhSQE6TAKe9S7nQe
 x2tO+TnzsQVD72ZD2gxDVHPXc/o=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 615ae2adfc6e34f8cdbf8970 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 04 Oct 2021 11:17:01
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 39911C4361C; Mon,  4 Oct 2021 11:17:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A1327C43616;
        Mon,  4 Oct 2021 11:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A1327C43616
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <pure.logic@nexus-software.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg KH <greg@kroah.com>
Cc:     linux-kernel@vger.kernel.org, ckadabi@codeaurora.org,
        tsoni@codeaurora.org, bryanh@codeaurora.org,
        psodagud@codeaurora.org, satyap@codeaurora.org,
        pheragu@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V0 3/7] usb: dwc3: drd: Register the eud connector child node for dwc3
Date:   Mon,  4 Oct 2021 16:46:21 +0530
Message-Id: <2006cf6c5662f70ca3348b683551bae4a8e4a0e2.1633343547.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1633343547.git.schowdhu@codeaurora.org>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
In-Reply-To: <cover.1633343547.git.schowdhu@codeaurora.org>
References: <cover.1633343547.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register the child node for dwc3 which is the "eud_usb_connector".
The eud driver will be able to switch the usb role from device to
host and vice versa using the role switch property of dwc3 node.

Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
---
 drivers/usb/dwc3/drd.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index d7f7683..f55e473 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -11,6 +11,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/of_platform.h>
 
 #include "debug.h"
 #include "core.h"
@@ -164,6 +165,27 @@ static int dwc3_otg_get_irq(struct dwc3 *dwc)
 	return irq;
 }
 
+static int dwc3_register_eud(struct dwc3 *dwc)
+{
+	struct device           *dev = dwc->dev;
+	struct device_node      *np = dev->of_node, *con_np;
+	int                     ret;
+
+	con_np = of_get_child_by_name(np, "eud_usb_connector");
+	if (!np) {
+		dev_dbg(dev, "no usb_connector child node specified\n");
+		return 0;
+	}
+
+	ret = of_platform_populate(np, NULL, NULL, dev);
+	if (ret) {
+		dev_err(dev, "failed to register usb_connector - %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 void dwc3_otg_init(struct dwc3 *dwc)
 {
 	u32 reg;
@@ -580,6 +602,9 @@ int dwc3_drd_init(struct dwc3 *dwc)
 		ret = dwc3_setup_role_switch(dwc);
 		if (ret < 0)
 			return ret;
+		ret = dwc3_register_eud(dwc);
+		if (ret < 0)
+			return ret;
 	} else if (dwc->edev) {
 		dwc->edev_nb.notifier_call = dwc3_drd_notifier;
 		ret = extcon_register_notifier(dwc->edev, EXTCON_USB_HOST,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

