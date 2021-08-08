Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3225F3E3CC8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Aug 2021 22:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232503AbhHHUrt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Aug 2021 16:47:49 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:44352 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbhHHUrs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Aug 2021 16:47:48 -0400
X-Greylist: delayed 336 seconds by postgrey-1.27 at vger.kernel.org; Sun, 08 Aug 2021 16:47:48 EDT
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 61765229B7AD
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: [PATCH 2/9] usb: dwc3: qcom: add IRQ check
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
References: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
CC:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        <linux-arm-msm@vger.kernel.org>
Organization: Open Mobile Platform
Message-ID: <563b7c97-4668-3fd4-310b-0a067e805635@omp.ru>
Date:   Sun, 8 Aug 2021 23:41:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <717ddd7c-22cd-d82c-e43d-80254718c801@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In dwc3_qcom_acpi_register_core(), the driver neglects to check the result
of platform_get_irq()'s call and blithely assigns the negative error codes
to the allocated child device's IRQ resource and then passing this resource
to platform_device_add_resources() and later causing dwc3_otg_get_irq() to
fail anyway.  Stop calling platform_device_add_resources() with the invalid
IRQ #s, so that there's less complexity in the IRQ error checking.

Fixes: 2bc02355f8ba ("usb: dwc3: qcom: Add support for booting with ACPI")
Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

---
 drivers/usb/dwc3/dwc3-qcom.c |    4 ++++
 1 file changed, 4 insertions(+)

Index: usb/drivers/usb/dwc3/dwc3-qcom.c
===================================================================
--- usb.orig/drivers/usb/dwc3/dwc3-qcom.c
+++ usb/drivers/usb/dwc3/dwc3-qcom.c
@@ -614,6 +614,10 @@ static int dwc3_qcom_acpi_register_core(
 		qcom->acpi_pdata->dwc3_core_base_size;
 
 	irq = platform_get_irq(pdev_irq, 0);
+	if (irq < 0) {
+		ret = irq;
+		goto out;
+	}
 	child_res[1].flags = IORESOURCE_IRQ;
 	child_res[1].start = child_res[1].end = irq;
 
