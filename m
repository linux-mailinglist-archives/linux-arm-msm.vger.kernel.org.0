Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02761EB9E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 12:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgFBKua (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 06:50:30 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:57579 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726785AbgFBKu3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 06:50:29 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 02 Jun 2020 16:20:20 +0530
Received: from vbadigan-linux.qualcomm.com ([10.206.24.109])
  by ironmsg01-blr.qualcomm.com with ESMTP; 02 Jun 2020 16:20:06 +0530
Received: by vbadigan-linux.qualcomm.com (Postfix, from userid 76677)
        id 453F14BF9; Tue,  2 Jun 2020 16:20:05 +0530 (IST)
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: [PATCH V3 0/3] Internal voltage control for qcom SDHC 
Date:   Tue,  2 Jun 2020 16:17:53 +0530
Message-Id: <1591094883-11674-1-git-send-email-vbadigan@codeaurora.org>
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
  dt-bindings: mmc: Supply max load for mmc supplies
  mmc: sdhci-msm: Use internal voltage control

Vijay Viswanath (1):
  mmc: sdhci: Allow platform controlled voltage switching

 .../devicetree/bindings/mmc/mmc-controller.yaml    |   6 +
 drivers/mmc/host/sdhci-msm.c                       | 235 ++++++++++++++++++++-
 drivers/mmc/host/sdhci.c                           |  32 +--
 drivers/mmc/host/sdhci.h                           |   1 +
 4 files changed, 252 insertions(+), 22 deletions(-)

-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

