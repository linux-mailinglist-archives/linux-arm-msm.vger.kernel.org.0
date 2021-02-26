Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2772325FED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 10:24:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhBZJXb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 04:23:31 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:60023 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbhBZJWA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 04:22:00 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 26 Feb 2021 01:21:18 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 26 Feb 2021 01:21:16 -0800
X-QCInternal: smtphost
Received: from gokulsri-linux.qualcomm.com ([10.201.2.207])
  by ironmsg02-blr.qualcomm.com with ESMTP; 26 Feb 2021 14:50:55 +0530
Received: by gokulsri-linux.qualcomm.com (Postfix, from userid 432570)
        id E6D1320E23; Fri, 26 Feb 2021 14:50:56 +0530 (IST)
From:   Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, inux-kernel@vger.kernel.org
Cc:     manivannan.sadhasivam@linaro.org, jhugo@codeaurora.org,
        hemantk@codeaurora.org, sricharan@codeaurora.org,
        gokulsri@codeaurora.org
Subject: [PATCH RFC v2] mhi: Enable unique QRTR node ID support
Date:   Fri, 26 Feb 2021 14:49:58 +0530
Message-Id: <1614331199-11420-1-git-send-email-gokulsri@codeaurora.org>
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
       15       1        0    8     1 Test service
       69       1        8    8     2 ATH10k WLAN firmware service
       15       1        0   24     1 Test service
       69       1       24   24     2 ATH10k WLAN firmware service

Here 8 and 24 on column 3 (QMI Instance ID)
and 4 (QRTR Node ID) are the node IDs that
is unique per mhi device.

Changes since v1:
 - Addressed review comments by Jeffrey Hugo.

Gokul Sriram Palanisamy (1):
  bus: mhi: core: Add unique qrtr node id support

 drivers/bus/mhi/core/boot.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

-- 
2.7.4

