Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C241C842B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 10:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbgEGIC4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 04:02:56 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:9282 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725783AbgEGIC4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 04:02:56 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 07 May 2020 13:32:52 +0530
Received: from minint-dvc2thc.qualcomm.com (HELO sartgarg-linux.qualcomm.com) ([10.206.24.245])
  by ironmsg02-blr.qualcomm.com with ESMTP; 07 May 2020 13:32:38 +0530
Received: by sartgarg-linux.qualcomm.com (Postfix, from userid 2339771)
        id 2D2C3261C; Thu,  7 May 2020 13:32:38 +0530 (IST)
From:   Sarthak Garg <sartgarg@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sarthak Garg <sartgarg@codeaurora.org>
Subject: [PATCH V1 0/7] Target specific DLL configuration for qcom SDHC
Date:   Thu,  7 May 2020 13:32:07 +0530
Message-Id: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sarthak Garg (6):
  dt-bindings: mmc: Add information for DLL register properties
  mmc: sdhci-msm: Update dll_config_3 as per HSR
  mmc: sdhci-msm: Update DDR_CONFIG as per device tree file
  mmc: sdhci-msm: Read and use DLL Config property from device tree file
  mmc: sdhci-msm: Introduce new ops to dump vendor specific registers
  mmc: sdhci-msm: dump vendor specific registers during error

Veerabhadrarao Badiganti (1):
  mmc: host: sdhci-msm: Configure dll-user-control in dll init sequence

 .../devicetree/bindings/mmc/sdhci-msm.txt          |  14 +++
 drivers/mmc/host/sdhci-msm.c                       | 103 ++++++++++++++++++++-
 drivers/mmc/host/sdhci.c                           |   3 +
 drivers/mmc/host/sdhci.h                           |   1 +
 4 files changed, 118 insertions(+), 3 deletions(-)

-- 
2.7.4

