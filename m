Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 326BA501F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 08:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbfFXGOz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 02:14:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:53180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726472AbfFXGOz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 02:14:55 -0400
Received: from localhost.localdomain (unknown [106.201.35.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D24AA20663;
        Mon, 24 Jun 2019 06:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561356894;
        bh=SSajmWbvqgmbGWzL+sIpdibtzxavz5ikcOIKoAusBVk=;
        h=From:To:Cc:Subject:Date:From;
        b=jpRKgVVamUXzYaspAeIXVF00OdClZWvILuPM8VvRjYlCzILMR2ALhQcvc8DPc0UQE
         ufJQ09H6t23sZW6i2JyP+iIK3mXRAY5m12R9AKiVrJXVityfeiXQDSvxkLj3weCbkt
         B83ejNldoEhjUxxOKMX43M8GBqwEEsuKx1VHwY5g=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] usb: xhci: Add support for Renesas USB controllers
Date:   Mon, 24 Jun 2019 11:41:22 +0530
Message-Id: <20190624061126.11938-1-vkoul@kernel.org>
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

