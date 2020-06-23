Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A322053A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 15:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732720AbgFWNlT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 09:41:19 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:32992 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732639AbgFWNlS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 09:41:18 -0400
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Tue, 23 Jun 2020 09:41:16 EDT
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 23 Jun 2020 06:35:13 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Jun 2020 06:35:11 -0700
Received: from vbadigan-linux.qualcomm.com ([10.206.24.109])
  by ironmsg01-blr.qualcomm.com with ESMTP; 23 Jun 2020 19:04:55 +0530
Received: by vbadigan-linux.qualcomm.com (Postfix, from userid 76677)
        id 5E82A4140; Tue, 23 Jun 2020 19:04:54 +0530 (IST)
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: [PATCH V5 0/3] Internal voltage control for qcom SDHC
Date:   Tue, 23 Jun 2020 19:04:45 +0530
Message-Id: <1592919288-1020-1-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On qcom SD host controllers voltage switching be done after the HW
is ready for it. The HW informs its readiness through power irq.
The voltage switching should happen only then.

So added support to register voltage regulators from the msm driver
and use them.

This patchset was posted long back but not actively pursued
https://lore.kernel.org/linux-arm-msm/1539004739-32060-1-git-send-email-vbadigan@codeaurora.org/
So posting it as fresh patchset.  

Changes since V4:	
	- Added clear comments on condtion which allows either to
	  tunf off/on Vqmmc or to set load. 
	- Added mmc_card_removable() to the condtion whcih checks
	  if the card is eMMC or other card.
	- Rerturning error for unsupported voltagtes in 
	  sdhci_msm_start_signal_voltage_switch()
	- Moved setting ios.power_mode to mmc_alloc_host().

Changes since V3:	
	- Dropped reading of regulator load values from device tree.
	- Dropped documentaiton chagne.
	- Since only Vqmmc supply of eMMC would be kept On during suspend,
	  setting load only for this regulator so that it can go to LPM.
	  And since this Load reamins same, load value is hard-coded in the driver.

Changes since V2:
	- Removed redundant log from sdhci_msm_set_vmmc.
	- Added the condition for skiping disabling of vqmmc for eMMC.
	- Updated logic such that, setting load for vqmmc only if
	  it is kept ON. 
	- Retained ack by Adrian for second patch.
	- Updated dt properties names as per Robs comments.

Changes since V1:
	- Removed setting load for Vmmc regulator while turning it on/off.
	  Instead setting the active load once during probe.
	- Simplified handlng of supplies for BUS_ON/OFF cases in shci_msm_handle_pwr_irq().
	- Moved common code out of switch case in sdhci_msm_start_signal_voltage_switch().
	- Updated variable name to sdhci_core_to_disable_vqmmc.
	- Updated pr_err logs to dev_err logs.
Veerabhadrarao Badiganti (2):
  mmc: core: Set default power mode in mmc_alloc_host
  mmc: sdhci-msm: Use internal voltage control

Vijay Viswanath (1):
  mmc: sdhci: Allow platform controlled voltage switching

 drivers/mmc/core/host.c      |   1 +
 drivers/mmc/host/sdhci-msm.c | 206 +++++++++++++++++++++++++++++++++++++++++--
 drivers/mmc/host/sdhci.c     |  32 ++++---
 drivers/mmc/host/sdhci.h     |   1 +
 4 files changed, 218 insertions(+), 22 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

