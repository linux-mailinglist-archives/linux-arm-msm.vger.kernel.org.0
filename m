Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAB4E1D8EFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 07:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgESFGh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 01:06:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:58422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726366AbgESFGg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 01:06:36 -0400
Received: from localhost.localdomain (unknown [122.182.207.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F81020758;
        Tue, 19 May 2020 05:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589864796;
        bh=XsPeKd9drW5XbmMQEhFn4Sn06g1yztiEDGzG7U3P1RU=;
        h=From:To:Cc:Subject:Date:From;
        b=RjmQmuMEJQgQK2LMqDNokkVc7g4NGaOZF+YeF5wWUa/sCdY+gkIErINUUEqKOEes6
         IaPG/K3+bNEP57UDsp+NuajpbGSTZdPz8P9t/iug7rP/aSPtHBf/QBU41cRn2cvouZ
         /DDvd7q+t0vj6NVhXuulj5DUKDVD1x6pU5PXdWmo=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] usb: xhci: fix USB_XHCI_PCI depends
Date:   Tue, 19 May 2020 10:36:22 +0530
Message-Id: <20200519050622.994908-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The xhci-pci-renesas module exports symbols for xhci-pci to load the
RAM/ROM on renesas xhci controllers. We had dependency which works
when both the modules are builtin or modules.

But if xhci-pci is inbuilt and xhci-pci-renesas in module, we get below
linker error:
drivers/usb/host/xhci-pci.o: In function `xhci_pci_remove':
drivers/usb/host/xhci-pci.c:411: undefined reference to `renesas_xhci_pci_exit'
drivers/usb/host/xhci-pci.o: In function `xhci_pci_probe':
drivers/usb/host/xhci-pci.c:345: undefined reference to `renesas_xhci_check_request_fw'

Fix this by adding USB_XHCI_PCI having depends on USB_XHCI_PCI_RENESAS
|| !USB_XHCI_PCI_RENESAS so that both can be either inbuilt or modules.

Reported-by: Anders Roxell <anders.roxell@linaro.org>
Fixes: a66d21d7dba8 ("usb: xhci: Add support for Renesas controller with memory")
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/usb/host/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index b5c542d6a1c5..92783d175b3f 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -40,11 +40,11 @@ config USB_XHCI_DBGCAP
 config USB_XHCI_PCI
 	tristate
 	depends on USB_PCI
+	depends on USB_XHCI_PCI_RENESAS || !USB_XHCI_PCI_RENESAS
 	default y
 
 config USB_XHCI_PCI_RENESAS
 	tristate "Support for additional Renesas xHCI controller with firwmare"
-	depends on USB_XHCI_PCI
 	---help---
 	  Say 'Y' to enable the support for the Renesas xHCI controller with
 	  firwmare. Make sure you have the firwmare for the device and
-- 
2.25.4

