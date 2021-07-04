Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93E283BAAD2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jul 2021 03:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhGDBeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jul 2021 21:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhGDBeF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jul 2021 21:34:05 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A075C061765
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jul 2021 18:31:29 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id j34so8976346wms.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jul 2021 18:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FJTWw8Pi2vNY+U/Yk6KX19a+CG+yNBMYeBmGQoKmOCU=;
        b=rqXZU9YRXFxZkySDque6oPwZjmqJhZOeR8WiZxDmp2XG/CFk5RYWQkdi1neHe5Dq7r
         6aGKn2kUVYRSg48L5OeiAPhspN5USvha5PROuXO3BdMZRUu++SgZswhnHawmWY8/9P92
         IS3uLN2iOlSFzz4KP+aoSr7UWnhcAMjOi2eeRdAUNx02ngJ8lH1wBgvr4kObEX+ZyROz
         gxP1/HgFPI1AfkOeyjjBesPNEKI8xq/XCNCYauIzD0a99WWUhWpl2RdOXVFbwCdSCDKZ
         YkO1n6ojzAxydTLJq5IHvfKlO1pUdS5j67mtS2/4G10GMpUXki7qPvApqVFdo0bbF5i3
         dsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FJTWw8Pi2vNY+U/Yk6KX19a+CG+yNBMYeBmGQoKmOCU=;
        b=N2riPvKwUKUtTV5NS1FEIoD/9l/9rj7q7YAvVMtupuNzgFen8M+0wnGswV9pEZWoVx
         MGeZS+1N8HLF/EavXv2VpRv2IqZiumlzdAElSNMyoOWEQPUkt8qxw1xmO1NeSvttrkll
         zjWILoLY/kMXAjqpuKxJaBRUm0OBtBctSY75lZUFjo6a7gDrbR7X2FJq1HQJn7ovEyG0
         wFCS7nJ3y3FXvuXhSdXcjvlt2jU6CjrFVJtTslp9LuMg+aA0JyLU2CDxjxCxcHzgYRM6
         zqURfvBcDTXeo8TcpF8bZgRPejkwjcLaMlFLBw3xhgen1dPBZ8WhCtiJ7b5WntlGzGIM
         /6bw==
X-Gm-Message-State: AOAM531X568YVwEQfqtrwGmKC1VE4ovLGhf3XT5Epijy+iLjer0zUlkg
        gQuee7mLljeM03lb1cWoXT11qg==
X-Google-Smtp-Source: ABdhPJzvSuHuXfAorKKlLszH9A1Gd7FDtg6qNmKiSNBBwNr1dT02kfAof2KZPL4TlMJikGe6r5MCfw==
X-Received: by 2002:a1c:35c2:: with SMTP id c185mr7013862wma.126.1625362287881;
        Sat, 03 Jul 2021 18:31:27 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l16sm18026717wmj.47.2021.07.03.18.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 18:31:27 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        wcheng@codeaurora.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 3/3] usb: dwc3: dwc3-qcom: Make dwc3-qcom a role-switch signal recipient
Date:   Sun,  4 Jul 2021 02:33:14 +0100
Message-Id: <20210704013314.200951-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When switching role from host to peripheral or peripheral to host we need
to set SoC UTMI signal logic in software since this is not done
automatically by the PHY or DWC3 core.

We have existing extcon code in dwc3-qcom which already implements the
right logic for extcon based systems, however, as we move to USB
role-switching we need to similarly facilitate the same UTMI switch
notification.

Setting the dwc3-qcom wrapper up as a USB role switch signal recipient
allows us to replicate the extcon logic with the role-switch API by
receiving the set_role() from dwc3-core and calling the existing VBUS
extcon code.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/dwc3/dwc3-qcom.c | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 2e61302e3e91..1aec387a8537 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -20,6 +20,7 @@
 #include <linux/usb/of.h>
 #include <linux/reset.h>
 #include <linux/iopoll.h>
+#include <linux/usb/role.h>
 
 #include "core.h"
 
@@ -81,6 +82,7 @@ struct dwc3_qcom {
 	struct extcon_dev	*host_edev;
 	struct notifier_block	vbus_nb;
 	struct notifier_block	host_nb;
+	struct usb_role_switch	*role_sw;
 
 	const struct dwc3_acpi_pdata *acpi_pdata;
 
@@ -154,6 +156,66 @@ static int dwc3_qcom_host_notifier(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
+#if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
+static int dwc3_qcom_usb_role_switch_set(struct usb_role_switch *sw,
+					 enum usb_role role)
+{
+	struct dwc3_qcom *qcom = usb_role_switch_get_drvdata(sw);
+	bool enable;
+
+	switch (role) {
+	case USB_ROLE_DEVICE:
+		qcom->mode = USB_DR_MODE_PERIPHERAL;
+		enable = true;
+		break;
+	case USB_ROLE_HOST:
+	default:
+		qcom->mode = USB_DR_MODE_HOST;
+		enable = false;
+		break;
+	}
+
+	dwc3_qcom_vbus_override_enable(qcom, enable);
+	return 0;
+}
+
+static enum usb_role dwc3_qcom_usb_role_switch_get(struct usb_role_switch *sw)
+{
+	struct dwc3_qcom *qcom = usb_role_switch_get_drvdata(sw);
+	enum usb_role role;
+
+	switch (qcom->mode) {
+	case USB_DR_MODE_PERIPHERAL:
+		role = USB_ROLE_DEVICE;
+		break;
+	case  USB_DR_MODE_HOST:
+	default:
+		role = USB_ROLE_HOST;
+		break;
+	}
+
+	return role;
+}
+
+static int dwc3_qcom_setup_role_switch(struct dwc3_qcom *qcom)
+{
+	struct usb_role_switch_desc dwc3_qcom_role_switch = {NULL};
+
+	dwc3_qcom_role_switch.fwnode = dev_fwnode(qcom->dev);
+	dwc3_qcom_role_switch.set = dwc3_qcom_usb_role_switch_set;
+	dwc3_qcom_role_switch.get = dwc3_qcom_usb_role_switch_get;
+	dwc3_qcom_role_switch.driver_data = qcom;
+	qcom->role_sw = usb_role_switch_register(qcom->dev,
+						 &dwc3_qcom_role_switch);
+	if (IS_ERR(qcom->role_sw))
+		return PTR_ERR(qcom->role_sw);
+
+	return 0;
+}
+#else
+#define dwc3_qcom_setup_role_switch(x) 0
+#endif
+
 static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
 {
 	struct device		*dev = qcom->dev;
@@ -818,6 +880,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ret)
 		goto interconnect_exit;
 
+	ret = dwc3_qcom_setup_role_switch(qcom);
+	if (ret)
+		goto interconnect_exit;
+
 	device_init_wakeup(&pdev->dev, 1);
 	qcom->is_suspended = false;
 	pm_runtime_set_active(dev);
@@ -850,6 +916,9 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int i;
 
+	if (qcom->role_sw)
+		usb_role_switch_unregister(qcom->role_sw);
+
 	device_remove_software_node(&qcom->dwc3->dev);
 	of_platform_depopulate(dev);
 
-- 
2.30.1

