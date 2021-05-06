Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA01375962
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 May 2021 19:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236300AbhEFRey (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 13:34:54 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:43156 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236288AbhEFRex (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 13:34:53 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 06 May 2021 10:33:54 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 May 2021 10:33:52 -0700
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 May 2021 23:03:15 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id 4611C21C7D; Thu,  6 May 2021 23:03:14 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v3 0/5] Enable Bluetooth functinality for WCN6750
Date:   Thu,  6 May 2021 23:03:07 +0530
Message-Id: <1620322392-27148-1-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches enables Bluetooth functinalties for new Qualcomm
Bluetooth SoC wcn6750.

Venkata Lakshmi Narayana Gubba (5):
  Bluetooth: hci_qca: Add support for QTI Bluetooth chip wcn6750
  Bluetooth: btqca: Add support for firmware image with mbn type for
    WCN6750
  Bluetooth: btqca: Moved extracting rom version info to common place
  dt-bindings: net: bluetooth: Convert Qualcomm BT binding to DT schema
  dt-bindings: net: bluetooth: Add device tree bindings for QTI chip
    wcn6750

 .../devicetree/bindings/net/qualcomm-bluetooth.txt |  69 --------
 .../bindings/net/qualcomm-bluetooth.yaml           | 182 +++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |  91 ++++++++---
 drivers/bluetooth/btqca.h                          |  14 +-
 drivers/bluetooth/hci_qca.c                        | 114 ++++++++++---
 5 files changed, 354 insertions(+), 116 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
 create mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

