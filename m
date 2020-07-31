Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0973E233E8B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 06:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730919AbgGaE5k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 00:57:40 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50269 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730158AbgGaE5j (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 00:57:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596171458; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=GAjtKd4k/JuD5DE6qHj3UJXwuF//h2iJZpWppiv8aWo=; b=sDBFfKS8Twd/K1SglrKVCg1TFYMxZ+eqX9Wy3ZgKoDol85F7U80KuoiAqGnzD4vjF3MWfSAI
 xpXWto8TFU6MrG/rbJbv0bH0iB/ol9apPdMW9MWyDs6ZHdYZJN6EdwcQw103ao9zqzJgn1rP
 B+WsQU8MxPO7VLpWZvjnDAzTF+Y=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5f23a4b0f89b692ba2945cbc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 31 Jul 2020 04:57:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0B2D3C433C9; Fri, 31 Jul 2020 04:57:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D6C82C433C6;
        Fri, 31 Jul 2020 04:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D6C82C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     bjorn.andersson@linaro.org, kishon@ti.com, vkoul@kernel.org,
        agross@kernel.org, balbi@kernel.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH 3/3] usb: dwc3: dwc3-qcom: Find USB connector and register role switch
Date:   Thu, 30 Jul 2020 21:57:12 -0700
Message-Id: <20200731045712.28495-4-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200731045712.28495-1-wcheng@codeaurora.org>
References: <20200731045712.28495-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If registering a USB typeC connector, the connector node may not be a child
of the DWC3 QCOM device.  Utilize devcon graph search to lookup if any
remote endpoints contain the connector.  If a connector is present, the
DWC3 QCOM will register a USB role switch to receive role change events, as
well as attain a reference to the DWC3 core role switch to pass the event
down.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 103 ++++++++++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index e1e78e9824b1..fe1e8a4ab7d6 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -19,6 +19,8 @@
 #include <linux/usb/of.h>
 #include <linux/reset.h>
 #include <linux/iopoll.h>
+#include <linux/fwnode.h>
+#include <linux/usb/role.h>
 
 #include "core.h"
 
@@ -71,6 +73,9 @@ struct dwc3_qcom {
 	struct notifier_block	vbus_nb;
 	struct notifier_block	host_nb;
 
+	struct usb_role_switch *role_sw;
+	struct usb_role_switch *dwc3_drd_sw;
+
 	const struct dwc3_acpi_pdata *acpi_pdata;
 
 	enum usb_dr_mode	mode;
@@ -190,6 +195,73 @@ static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
 	return 0;
 }
 
+static int dwc3_qcom_usb_role_switch_set(struct usb_role_switch *sw,
+					 enum usb_role role)
+{
+	struct dwc3_qcom *qcom = usb_role_switch_get_drvdata(sw);
+	struct fwnode_handle *child;
+	bool enable = false;
+
+	if (!qcom->dwc3_drd_sw) {
+		child = device_get_next_child_node(qcom->dev, NULL);
+		if (child) {
+			qcom->dwc3_drd_sw = usb_role_switch_find_by_fwnode(child);
+			fwnode_handle_put(child);
+			if (IS_ERR(qcom->dwc3_drd_sw)) {
+				qcom->dwc3_drd_sw = NULL;
+				return 0;
+			}
+		}
+	}
+
+	usb_role_switch_set_role(qcom->dwc3_drd_sw, role);
+
+	if (role == USB_ROLE_DEVICE)
+		enable = true;
+	else
+		enable = false;
+
+	qcom->mode = (role == USB_ROLE_HOST) ? USB_DR_MODE_HOST :
+					       USB_DR_MODE_PERIPHERAL;
+	dwc3_qcom_vbus_overrride_enable(qcom, enable);
+	return 0;
+}
+
+static enum usb_role dwc3_qcom_usb_role_switch_get(struct usb_role_switch *sw)
+{
+	struct dwc3_qcom *qcom = usb_role_switch_get_drvdata(sw);
+	enum usb_role role;
+
+	switch (qcom->mode) {
+	case USB_DR_MODE_HOST:
+		role = USB_ROLE_HOST;
+		break;
+	case USB_DR_MODE_PERIPHERAL:
+		role = USB_ROLE_DEVICE;
+		break;
+	default:
+		role = USB_ROLE_DEVICE;
+		break;
+	}
+
+	return role;
+}
+
+static int dwc3_qcom_setup_role_switch(struct dwc3_qcom *qcom)
+{
+	struct usb_role_switch_desc dwc3_role_switch = {NULL};
+
+	dwc3_role_switch.fwnode = dev_fwnode(qcom->dev);
+	dwc3_role_switch.set = dwc3_qcom_usb_role_switch_set;
+	dwc3_role_switch.get = dwc3_qcom_usb_role_switch_get;
+	dwc3_role_switch.driver_data = qcom;
+	qcom->role_sw = usb_role_switch_register(qcom->dev, &dwc3_role_switch);
+	if (IS_ERR(qcom->role_sw))
+		return PTR_ERR(qcom->role_sw);
+
+	return 0;
+}
+
 static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
 {
 	if (qcom->hs_phy_irq) {
@@ -540,6 +612,25 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 	return 0;
 }
 
+static void *dwc3_qcom_find_usb_connector_match(struct device_connection *con,
+						int ep, void *data)
+{
+	if (!fwnode_property_match_string(con->fwnode, "compatible",
+					  "gpio-usb-b-connector") ||
+	    !fwnode_property_match_string(con->fwnode, "compatible",
+					  "usb-c-connector"))
+		return con->fwnode;
+	return 0;
+}
+
+static bool dwc3_qcom_find_usb_connector(struct platform_device *pdev)
+{
+	struct fwnode_handle *fwnode = pdev->dev.fwnode;
+
+	return fwnode_connection_find_match(fwnode, "connector", NULL,
+					    dwc3_qcom_find_usb_connector_match);
+}
+
 static int dwc3_qcom_probe(struct platform_device *pdev)
 {
 	struct device_node	*np = pdev->dev.of_node;
@@ -644,8 +735,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (qcom->mode == USB_DR_MODE_PERIPHERAL)
 		dwc3_qcom_vbus_overrride_enable(qcom, true);
 
-	/* register extcon to override sw_vbus on Vbus change later */
-	ret = dwc3_qcom_register_extcon(qcom);
+	if (dwc3_qcom_find_usb_connector(pdev)) {
+		ret = dwc3_qcom_setup_role_switch(qcom);
+	} else {
+		/* register extcon to override sw_vbus on Vbus change later */
+		ret = dwc3_qcom_register_extcon(qcom);
+	}
+
 	if (ret)
 		goto depopulate;
 
@@ -679,6 +775,9 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int i;
 
+	usb_role_switch_unregister(qcom->role_sw);
+	usb_role_switch_put(qcom->dwc3_drd_sw);
+
 	of_platform_depopulate(dev);
 
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

