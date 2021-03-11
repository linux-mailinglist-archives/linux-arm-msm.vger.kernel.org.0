Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF2B337A36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 18:00:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhCKQ73 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 11:59:29 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26561 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbhCKQ7F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 11:59:05 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 11 Mar 2021 08:59:05 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Mar 2021 08:59:03 -0800
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 11 Mar 2021 22:28:27 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id 4C01921FA0; Thu, 11 Mar 2021 22:28:26 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     devicetree@vger.kernel.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v1 0/2] Enable Bluetooth functinality for WCN6750
Date:   Thu, 11 Mar 2021 22:28:22 +0530
Message-Id: <1615481904-9400-1-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches enables Bluetooth functinalties for new Qualcomm
Bluetooth SoC wcn6750. 

This SoC requires both regulators and GPIO to turn on/off.
This SoC supports mbn format image for firmware download.

Venkata Lakshmi Narayana Gubba (2):
  Bluetooth: hci_qca: Add support for QTI Bluetooth chip wcn6750
  dt-bindings: net: bluetooth: Add device tree bindings for QTI chip
    wcn6750

 .../devicetree/bindings/net/qualcomm-bluetooth.txt |  43 +++++++++
 drivers/bluetooth/btqca.c                          |  85 ++++++++++++-----
 drivers/bluetooth/btqca.h                          |  15 ++-
 drivers/bluetooth/hci_qca.c                        | 106 ++++++++++++++++-----
 4 files changed, 202 insertions(+), 47 deletions(-)

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

