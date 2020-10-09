Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80CF7288540
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 10:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732803AbgJII3R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 04:29:17 -0400
Received: from z5.mailgun.us ([104.130.96.5]:55209 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732819AbgJII3Q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 04:29:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602232156; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Tlq4T/iAuD/awcC5v4dNjmM0vVkqaQtyhvxY9GC4/4Q=; b=XOvH+5YhhkFBQ+4MOXIa++vt1NARflxR3htVKI6VE/vrsJ7AoHE0XlI0f6dXmkNITctlM5T4
 CXaXl88/91x78+LcF5OpZxyJnCiT5u5WgHfqk2NE5qX8B9WG9i56ea7CHXdmqUBOW64TJ95r
 JmJfzprp6tQpzgDLSunnIAJHodU=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f801f433711fec7b1bd7b6d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Oct 2020 08:28:51
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 833A8C433CB; Fri,  9 Oct 2020 08:28:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 40FB7C433AF;
        Fri,  9 Oct 2020 08:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 40FB7C433AF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     vkoul@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        kishon@ti.com, balbi@kernel.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v2 3/4] usb: dwc3: dwc3-qcom: Find USB connector and register role switch
Date:   Fri,  9 Oct 2020 01:28:42 -0700
Message-Id: <20201009082843.28503-4-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201009082843.28503-1-wcheng@codeaurora.org>
References: <20201009082843.28503-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 drivers/usb/dwc3/dwc3-qcom.c | 120 ++++++++++++++++++++++++++++++++++-
 1 file changed, 118 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index e1e78e9824b1..340760ef0e01 100644
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
@@ -540,6 +612,42 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 	return 0;
 }
 
+static int dwc3_qcom_connector_check(struct fwnode_handle *fwnode)
+{
+	if (fwnode && (!fwnode_property_match_string(fwnode, "compatible",
+						     "gpio-usb-b-connector") ||
+	    !fwnode_property_match_string(fwnode, "compatible",
+					  "usb-c-connector")))
+		return 1;
+
+	return 0;
+}
+
+static void *dwc3_qcom_find_usb_connector_match(struct device_connection *con,
+						int ep, void *data)
+{
+	struct fwnode_handle *fwnode;
+
+	/* Check if the "connector" node is the parent of the remote endpoint */
+	if (dwc3_qcom_connector_check(con->fwnode))
+		return fwnode;
+
+	/* else, check if it is a child node */
+	fwnode = fwnode_get_named_child_node(con->fwnode, "connector");
+	if (dwc3_qcom_connector_check(fwnode))
+		return fwnode;
+
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
@@ -644,8 +752,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
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
 
@@ -679,6 +792,9 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
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

