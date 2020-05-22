Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 366DD1DE32A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2020 11:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729444AbgEVJdY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 May 2020 05:33:24 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:30354 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728424AbgEVJdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 May 2020 05:33:24 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 May 2020 15:03:21 +0530
Received: from minint-dvc2thc.qualcomm.com (HELO sartgarg-linux.qualcomm.com) ([10.206.24.245])
  by ironmsg01-blr.qualcomm.com with ESMTP; 22 May 2020 15:03:08 +0530
Received: by sartgarg-linux.qualcomm.com (Postfix, from userid 2339771)
        id DD14E179E; Fri, 22 May 2020 15:03:06 +0530 (IST)
From:   Sarthak Garg <sartgarg@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sarthak Garg <sartgarg@codeaurora.org>
Subject: [PATCH V2 0/8] Board specific DLL configuration for qcom SDHC 
Date:   Fri, 22 May 2020 15:02:22 +0530
Message-Id: <1590139950-7288-1-git-send-email-sartgarg@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org>
References: <1588838535-6050-1-git-send-email-sartgarg@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since V1:
        -Splitting documentation change into two patches to
		avoid confusion
	-For the rest of patches retaining Andrians Ack.

Sarthak Garg (7):
  dt-bindings: mmc: Add new compatible string for sm8250 target
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

