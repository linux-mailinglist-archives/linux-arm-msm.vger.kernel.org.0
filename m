Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F26B4CBB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 12:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfFTKZQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 06:25:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:49692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726124AbfFTKZQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 06:25:16 -0400
Received: from localhost.localdomain (unknown [106.201.116.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F1260206BA;
        Thu, 20 Jun 2019 10:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561026315;
        bh=3ihoOPo5uYqiD4QV67dGSIY/2PGmijlFDatNdmjbsY0=;
        h=From:To:Cc:Subject:Date:From;
        b=M1vWG7IbE231acj5Rm7J5lY0MkbNVh/1dKZMmgGUGRouYMpaakzI59I6/JhsvgKol
         d0lfKhFRAR6+Xsh7wXK8bUVWLZdWkGwYnfUhkN6HVc7Y8dD2D5MG4aS29yFwy6AXUc
         /ueNmmekviTpmC9LTAAGPF9LTaJoB5PV6/v6Y7zk=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] usb: xhci: Add support for Renesas USB controllers
Date:   Thu, 20 Jun 2019 15:51:49 +0530
Message-Id: <20190620102154.20805-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series add support for Renesas USB controllers uPD720201 and uPD720202.
These require firmware to be loaded and in case devices have ROM those can
also be programmed if empty. If ROM is porgrammed, it runs from ROM as well.

This includes two patches from Christian which supported these controllers
w/o ROM and later my patches for ROM support and multiple firmware versions.

Christian Lamparter (2):
  usb: xhci: add firmware loader for uPD720201 and uPD720202 w/o ROM
  usb: xhci: handle uPD720201 and uPD720202 w/o ROM

Vinod Koul (3):
  usb: xhci: Use register defined and field names
  usb: xhci: Add ROM loader for uPD720201
  usb: xhci: allow multiple firmware versions

 drivers/usb/host/xhci-pci.c | 962 ++++++++++++++++++++++++++++++++++++
 1 file changed, 962 insertions(+)

-- 
2.20.1

