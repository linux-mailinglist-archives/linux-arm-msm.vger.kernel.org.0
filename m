Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C34290C10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 21:04:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409823AbgJPTEo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 15:04:44 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:52583 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409069AbgJPTEo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 15:04:44 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 16 Oct 2020 12:04:44 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 16 Oct 2020 12:04:42 -0700
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg01-blr.qualcomm.com with ESMTP; 17 Oct 2020 00:34:29 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id 342C921C43; Sat, 17 Oct 2020 00:34:29 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        sricharan@codeaurora.org, gokulsri@codeaurora.org
Subject: [PATCH RFC] mhi: Enable unique QRTR node ID support
Date:   Sat, 17 Oct 2020 00:34:28 +0530
Message-Id: <1602875069-12514-1-git-send-email-gokulsri@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On multi-mhi platforms, host WiFi driver and
QMI test driver needs to differntiate between
QMI packets received from multiple mhi devices.

With QCN9000 PCI cards, once SBL gets loaded, we
utilize ERRDBG2 register to write a unique value
per mhi device from device-tree that the device
utilizes to set a unique QRTR node ID and
instance ID for the QMI service. This helps QRTR
stack in differenting the packets in a multi-mhi
environment and can route them accordingly.

sample:
root@OpenWrt:/# qrtr-lookup
  Service Version Instance Node  Port
       69       1       40   40     2 ATH10k WLAN firmware service
       15       1        0   40     1 Test service
       69       1       39   39     2 ATH10k WLAN firmware service
       15       1        0   39     1 Test service

Here on column 4, 39 and 40 are the node IDs that
is unique per mhi device.

Gokul Sriram Palanisamy (1):
  bus: mhi: core: Enable unique QRTR node ID support

 .../devicetree/bindings/mhi/qcom,mhi.yaml          | 36 ++++++++++++++++++++++
 drivers/bus/mhi/core/boot.c                        | 14 +++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mhi/qcom,mhi.yaml

-- 
2.7.4

