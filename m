Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E77A563DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2019 09:58:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfFZH6b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jun 2019 03:58:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:48580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726042AbfFZH6b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jun 2019 03:58:31 -0400
Received: from localhost.localdomain (unknown [106.201.40.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04D8F20B7C;
        Wed, 26 Jun 2019 07:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561535910;
        bh=Zk+32MYTguThwioop8XUIST/Kb6QRvNI4OyCRXpWybg=;
        h=From:To:Cc:Subject:Date:From;
        b=tkDQrekH/magwS/N1sfFTI3ovJ/JolYwzPy5d3dv1v26Mgc3y1xVbpi8Re4LjN+6x
         O0hGZC7IocZm35MyIbH1qaf7AGG/W4S8v6I1AUHyaSWnLZqGt5TsUS4ZysObKEqYG6
         HcFNmhu8LyPh5dYRUwpUDG1uTi4qwMyO50Bohr1M=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] usb: xhci: Add support for Renesas USB controllers
Date:   Wed, 26 Jun 2019 13:25:05 +0530
Message-Id: <20190626075509.20445-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
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
  usb: xhci: Use register defined and field names
  usb: xhci: Add ROM loader for uPD720201
  usb: xhci: allow multiple firmware versions

 drivers/usb/host/xhci-pci.c | 875 ++++++++++++++++++++++++++++++++++++
 1 file changed, 875 insertions(+)

-- 
2.20.1

