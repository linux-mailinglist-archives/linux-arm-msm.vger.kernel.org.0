Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9491C034F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 18:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbgD3Q7m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 12:59:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:48328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbgD3Q7l (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 12:59:41 -0400
Received: from localhost.localdomain (unknown [122.182.217.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 614C820661;
        Thu, 30 Apr 2020 16:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588265981;
        bh=bo9TlTHCrPoHGtcb53yl82DzmNPzIoKik8RLOQYpAWE=;
        h=From:To:Cc:Subject:Date:From;
        b=SN0qNBg7bgz7b2x4dNAxM8402X+c3fQcqG66LrnCZ+mtwtDMpAcX+NeZFsJrspfx/
         G0QZ+ELXzIAlUl7Y2SL/BqHvZlpIQeua3cQ/23jelXpcsS9kRzVHSR7YrRxRQucknA
         mBV8mVgOfq3yywvlXorH6k0utF2/fLnyo0+JzC8E=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?UTF-8?q?Andreas=20B=C3=B6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v12 0/5] usb: xhci: Add support for Renesas USB controllers
Date:   Thu, 30 Apr 2020 22:29:15 +0530
Message-Id: <20200430165920.1345409-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series add support for Renesas USB controllers uPD720201 and uPD720202.
These require firmware to be loaded and in case devices have ROM those can
also be programmed if empty. If ROM is programmed, it runs from ROM as well.

This includes patches from Christian which supported these controllers w/o
ROM and later my patches for ROM support and debugfs hook for rom erase and
export of xhci-pci functions.

Changes in v12:
  - Restore back module name for xhci-pci, so now renesas is a separate
    module, export init/exit routines from renesas modules
  - Update changelog on patch2

Changes in v11:
  - update xhci->quirks and use that in remove function
  - remove error return renesas_verify_fw_version()
  - remove renesas_download_rom() and modify renesas_fw_download_image() for
  reuse
Changes in v10:
  remove renesas_xhci_pci_probe and call renesas_xhci_check_request_fw and
  also cleanup exit code along with it.

Changes in v9:
 Make fw load a sync call and have single instance of probe execute,
   elimating probe/remove races
 Add quirk for renesas and use that for loading

Changes in v8:
 Fix compile error reported by Kbuild-bot by making usb_hcd_pci_probe() take
 const struct hc_driver * as argument

Changes in v7:
 Make a single module which removes issues with module loading
 Keep the renesas code in renesas file
 Add hc_driver as argument for usb_hcd_pci_probe and modify hdc drivers to
   pass this and not use driver_data
 Use driver data for fw name
 Remove code to check if we need to load firmware or not
 remove multiple fw version support, we can do that with symlink in
   userspace

Changes in v6:
 Move the renesas code into a separate driver which invokes xhci-pci functions.

Changes in v5:
 Added a debugfs rom erase patch, helps in debugging
 Squashed patch 1 & 2 as requested by Mathias

Changes in v4:
 Rollback the delay values as we got device failures

Changes in v3:
  Dropped patch 2 as discussed with Christian
  Removed aligned 8 bytes check
  Change order for firmware search from highest version to lowest
  Added entry for new firmware for device 0x14 as well
  Add tested by Christian

Changes in v2:
  used macros for timeout count and delay
  removed renesas_fw_alive_check
  cleaned renesas_fw_callback
  removed recurion for renesas_fw_download
  added MODULE_FIRMWARE
  added comment for multiple fw order

Christian Lamparter (1):
  usb: renesas-xhci: Add the renesas xhci driver

Vinod Koul (4):
  usb: hci: add hc_driver as argument for usb_hcd_pci_probe
  usb: xhci: Add support for Renesas controller with memory
  usb: renesas-xhci: Add ROM loader for uPD720201
  usb: xhci: provide a debugfs hook for erasing rom

 drivers/usb/core/hcd-pci.c          |   7 +-
 drivers/usb/host/Makefile           |   2 +-
 drivers/usb/host/ehci-pci.c         |   6 +-
 drivers/usb/host/ohci-pci.c         |   9 +-
 drivers/usb/host/uhci-pci.c         |   8 +-
 drivers/usb/host/xhci-pci-renesas.c | 678 ++++++++++++++++++++++++++++
 drivers/usb/host/xhci-pci.c         |  47 +-
 drivers/usb/host/xhci-pci.h         |  16 +
 drivers/usb/host/xhci.h             |   1 +
 include/linux/usb/hcd.h             |   3 +-
 10 files changed, 754 insertions(+), 23 deletions(-)
 create mode 100644 drivers/usb/host/xhci-pci-renesas.c
 create mode 100644 drivers/usb/host/xhci-pci.h

-- 
2.25.3

