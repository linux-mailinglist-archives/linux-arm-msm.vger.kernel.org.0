Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BBF13B748C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 16:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234507AbhF2Opc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Jun 2021 10:45:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234498AbhF2Opb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Jun 2021 10:45:31 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F2FC061767
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 07:43:03 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id m9-20020a05600c3b09b02901f246b43bbeso605305wms.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jun 2021 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vyZHNV0bYck2LLGhVRM7Nx0MUkp0pARsR3Zkn6AAnGw=;
        b=slZUUdBLu8YLFENbWwDy5dBZsX0RRHuJMAYcfcNGVyWfoVR7awQW9J9dyyU/kmHGlB
         QVkie/tIeH3gy8AynGEKZVFS0mOpv3Ms4kScCljaXG8xA3vdWmB0f9u68VgZ3tmQjOSL
         4OAuuoBYT+BycnoIgaulQuE91sKmnRA4tjgLcSvCUytylkB9gs9sZzwnA4wbTDzuXWMT
         PsBATKPrjCKmTqdW1Nufshbj4fOEOCjz6Xnm2kwTi60c70UoeMxEv36haW/jVxHNWLUD
         2SXAYLCo8IsHmUU41xYSnSPAf0yDHi6yfEeasERA43PLlJ8hYUkm965r4VMrp3mmqb/H
         kd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vyZHNV0bYck2LLGhVRM7Nx0MUkp0pARsR3Zkn6AAnGw=;
        b=NsV8BDG5EaTob1BBa1iwBmdWh/wRNcoInqGtWDIzqe4uaF62pGBkpkSED0zIx/h4eB
         k4Vfzwel/B3uWN2BAgjUQC9YjGo2Fzh3IUKtnGAZRoDZxjq0d2AcdS490lJaPv5dgC8P
         bNJX5c4GdtLw8hqvBmUUnZqKy/of6gvtXve6nsXP28Em8KKlyjhju6mTcqTFoVXCIHR/
         k4qobgHC7GAYYQmrhu3NCZnRL0BKkys7goiAd5h2Gc323eYuYJb0LOJyB9+8Ws9xvvph
         BBg+gdy4NWumxmrH7ARy7wvO2/sFRi7Oj9r/xg4FYrxixxnhN0c5Jjlx7UmQTrHIPBtB
         yavA==
X-Gm-Message-State: AOAM531diagt9KAcj6HF6bBDdsObpV/ro88s/czsTOFSgveGXhhX7+du
        Vc3i20ct7Jc2PNhuTcBpEkncSQ==
X-Google-Smtp-Source: ABdhPJw80IDI4ecQtnePdpduV9DvtPUSyWCg1yCH7mUnsO8L0lr6tm0A2qpg9RWgCawwkGlD3LblUg==
X-Received: by 2002:a05:600c:3782:: with SMTP id o2mr3763296wmr.152.1624977781898;
        Tue, 29 Jun 2021 07:43:01 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u15sm2832266wmq.1.2021.06.29.07.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 07:43:01 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org, bryan.odonoghue@linaro.org
Subject: [PATCH 1/2] usb: dwc3: dwc3-qcom: Find USB connector and register role switch
Date:   Tue, 29 Jun 2021 15:44:48 +0100
Message-Id: <20210629144449.2550737-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
References: <20210629144449.2550737-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Wesley Cheng <wcheng@codeaurora.org>

If registering a USB typeC connector, the connector node may not be a child
of the DWC3 QCOM device.  Utilize devcon graph search to lookup if any
remote endpoints contain the connector.  If a connector is present, the
DWC3 QCOM will register a USB role switch to receive role change events, as
well as attain a reference to the DWC3 core role switch to pass the event
down.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 118 ++++++++++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 49e6ca94486d..4491704503ab 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -20,6 +20,8 @@
 #include <linux/usb/of.h>
 #include <linux/reset.h>
 #include <linux/iopoll.h>
+#include <linux/fwnode.h>
+#include <linux/usb/role.h>
 
 #include "core.h"
 
@@ -82,6 +84,9 @@ struct dwc3_qcom {
 	struct notifier_block	vbus_nb;
 	struct notifier_block	host_nb;
 
+	struct usb_role_switch *role_sw;
+	struct usb_role_switch *dwc3_drd_sw;
+
 	const struct dwc3_acpi_pdata *acpi_pdata;
 
 	enum usb_dr_mode	mode;
@@ -296,6 +301,73 @@ static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
 	icc_put(qcom->icc_path_apps);
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
@@ -698,6 +770,40 @@ dwc3_qcom_create_urs_usb_platdev(struct device *dev)
 	return acpi_create_platform_device(adev, NULL);
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
+static void *dwc3_qcom_find_usb_connector_match(struct fwnode_handle *fwnode,
+						const char *id, void *data)
+{
+	/* Check if the "connector" node is the parent of the remote endpoint */
+	if (dwc3_qcom_connector_check(fwnode))
+		return fwnode;
+
+	/* else, check if it is a child node */
+	fwnode = fwnode_get_named_child_node(fwnode, "connector");
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
@@ -813,8 +919,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
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
 		goto interconnect_exit;
 
@@ -850,6 +961,9 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int i;
 
+	usb_role_switch_unregister(qcom->role_sw);
+	usb_role_switch_put(qcom->dwc3_drd_sw);
+
 	device_remove_software_node(&qcom->dwc3->dev);
 	of_platform_depopulate(dev);
 
-- 
2.30.1

