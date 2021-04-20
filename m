Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB64365D50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 18:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbhDTQ2I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Apr 2021 12:28:08 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:59762 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbhDTQ2H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Apr 2021 12:28:07 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 20 Apr 2021 09:27:35 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Apr 2021 09:27:33 -0700
X-QCInternal: smtphost
Received: from gubbaven-linux.qualcomm.com ([10.206.64.32])
  by ironmsg02-blr.qualcomm.com with ESMTP; 20 Apr 2021 21:56:55 +0530
Received: by gubbaven-linux.qualcomm.com (Postfix, from userid 2365015)
        id CD039220C8; Tue, 20 Apr 2021 21:56:54 +0530 (IST)
From:   Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        rjliao@codeaurora.org, hbandi@codeaurora.org,
        abhishekpandit@chromium.org,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Subject: [PATCH v2 0/3] Enable Bluetooth functinality for WCN6750
Date:   Tue, 20 Apr 2021 21:56:47 +0530
Message-Id: <1618936010-16579-1-git-send-email-gubbaven@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches enables Bluetooth functinalties for new Qualcomm
Bluetooth SoC wcn6750.

Changes in v2:

* Converted Qualcomm bluetooth bindings to DT schema.
* Added device tree bindings for QTI chip wcn6750 in converted DT schema.

Venkata Lakshmi Narayana Gubba (3):
  Bluetooth: hci_qca: Add support for QTI Bluetooth chip wcn6750
  dt-bindings: net: bluetooth: Convert to DT schema
  dt-bindings: net: bluetooth: Add device tree bindings for QTI chip
    wcn6750

 .../devicetree/bindings/net/qualcomm-bluetooth.txt |  69 ----------
 .../bindings/net/qualcomm-bluetooth.yaml           | 139 +++++++++++++++++++++
 drivers/bluetooth/btqca.c                          |  88 +++++++++----
 drivers/bluetooth/btqca.h                          |  15 ++-
 drivers/bluetooth/hci_qca.c                        | 106 ++++++++++++----
 5 files changed, 300 insertions(+), 117 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
 create mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

