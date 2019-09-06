Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1C80AB872
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 14:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392165AbfIFMyD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 08:54:03 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:32287 "EHLO
        alexa-out-blr.qualcomm.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732774AbfIFMyC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 08:54:02 -0400
X-Greylist: delayed 368 seconds by postgrey-1.27 at vger.kernel.org; Fri, 06 Sep 2019 08:54:00 EDT
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr.qualcomm.com with ESMTP/TLS/AES256-SHA; 06 Sep 2019 18:17:50 +0530
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Sep 2019 18:17:28 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id C1811473A; Fri,  6 Sep 2019 18:17:27 +0530 (IST)
From:   Pradeep P V K <ppvk@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     asutoshd@codeaurora.org, vbadigan@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Pradeep P V K <ppvk@codeaurora.org>
Subject: [RFC 0/2] Add Support for SDHC bus bandwidth voting
Date:   Fri,  6 Sep 2019 18:17:15 +0530
Message-Id: <1567774037-2344-1-git-send-email-ppvk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Vote for the MSM bus bandwidth required by SDHC driver
based on the clock speed and bus width of the card. Otherwise,
the system clocks may run at minimum clock speed and
thus affecting the performance.

Adapt to the new ICB framework for bus bandwidth voting.

This requires the source/destination port ids.
Also this requires a tuple of values.

The tuple is for two different paths - from SDHC master
to BIMC slave. The other is from CPU master to SDHC slave.
This tuple consists of the average and peak bandwidth.

This change is based on Georgi Djakov [RFC]
(https://lkml.org/lkml/2018/10/11/499)

Pradeep P V K (2):
  mmc: sdhci-msm: Add support for bus bandwidth voting
  dt-bindings: mmc: sdhci-msm: Add Bus BW vote supported strings

 .../devicetree/bindings/mmc/sdhci-msm.txt          |  32 ++
 drivers/mmc/host/sdhci-msm.c                       | 393 ++++++++++++++++++++-
 2 files changed, 422 insertions(+), 3 deletions(-)

-- 
1.9.1

