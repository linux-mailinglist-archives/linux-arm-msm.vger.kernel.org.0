Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD6BA7FAC8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Aug 2019 15:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729866AbfHBNVs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Aug 2019 09:21:48 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42092 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2393419AbfHBNUk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Aug 2019 09:20:40 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 97FAC797D353143E0C00;
        Fri,  2 Aug 2019 21:20:36 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Fri, 2 Aug 2019
 21:20:28 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <agross@kernel.org>, <gregkh@linuxfoundation.org>,
        <jslaby@suse.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] tty: serial: qcom_geni_serial: use devm_platform_ioremap_resource() to simplify code
Date:   Fri, 2 Aug 2019 21:08:17 +0800
Message-ID: <20190802130817.16220-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index f879710..af695b6 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -198,10 +198,8 @@ static int qcom_geni_serial_request_port(struct uart_port *uport)
 {
 	struct platform_device *pdev = to_platform_device(uport->dev);
 	struct qcom_geni_serial_port *port = to_dev_port(uport, uport);
-	struct resource *res;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	uport->membase = devm_ioremap_resource(&pdev->dev, res);
+	uport->membase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(uport->membase))
 		return PTR_ERR(uport->membase);
 	port->se.base = uport->membase;
-- 
2.7.4


