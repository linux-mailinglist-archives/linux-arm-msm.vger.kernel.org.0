Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A76A9F113F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 09:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730134AbfKFIj3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 03:39:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:48026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730088AbfKFIj3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 03:39:29 -0500
Received: from localhost.localdomain (unknown [223.226.46.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9FEB12084D;
        Wed,  6 Nov 2019 08:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573029568;
        bh=7MFR2ZIi37ajuns9jLuWI/+9zvp+HfFtIxkIU4zEI60=;
        h=From:To:Cc:Subject:Date:From;
        b=bcAhhbMaoVAmAYFuJ10uG+owvwd2gbXCPmhqlNqTc0Fmn69XwzgZz9g/qXQRkpz7s
         M9Iy9XgDlKDC/dGfdJkcQanFi8e3Dsk2PtXppoaojL9nyN7a4b7mQFSnnIKaiwo3mQ
         stKr8yR7/lnsVKyuZZAIaYXEC5Dfe02Fx2sDwoCo=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4] usb: xhci: Add support for Renesas USB controllers
Date:   Wed,  6 Nov 2019 14:08:39 +0530
Message-Id: <20191106083843.1718437-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series add support for Renesas USB controllers uPD720201 and uPD720202.
These require firmware to be loaded and in case devices have ROM those can
also be programmed if empty. If ROM is programmed, it runs from ROM as well.

This includes two patches from Christian which supported these controllers
w/o ROM and later my patches for ROM support and multiple firmware versions.

Changes in v5:
 Added a debugfs rom erase patch, helps in debugging
 Squashed patch 1 & 2 as requested by Mathias

Changes in v4:
 Rollback the delay values as we got device failures

Changes in v3:
  Dropped patch 2 as discussed with Christian
  Removed aligned 8 bytes check
  Change order for firware search from highest version to lowest
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
  usb: xhci: add firmware loader for uPD720201 and uPD720202 w/o ROM

Vinod Koul (3):
  usb: xhci: Add ROM loader for uPD720201
  usb: xhci: allow multiple firmware versions
  usb: xhci: provide a debugfs hook for erasing rom

 drivers/usb/host/xhci-pci.c | 911 ++++++++++++++++++++++++++++++++++++
 1 file changed, 911 insertions(+)

-- 
2.23.0

