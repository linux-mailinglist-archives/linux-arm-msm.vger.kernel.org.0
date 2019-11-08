Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC90F4D74
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 14:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbfKHNpj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 08:45:39 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:58971 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726101AbfKHNpi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 08:45:38 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 Nov 2019 19:09:24 +0530
IronPort-SDR: /dWwmR7yT4WPqU0ZJdl9Bkgn1+ARTLzU8YFofnkUToUpDd8pvnMoBF9kWJQNo+3/WeTDy4Amg0
 DAAHDoqTLUtLFymohXXVondDWDmRlKTev7LE7Oqp82lhz6/21IPkj6ImeSlxTwLHMTzcdYGwA5
 l3lRJ4Yamw/XJKxlFOqTTtgj2PzSOD/jv95lDs6d2la7nSETWcYFS4usjU1w82UYOofFo1Fbwe
 oQYM+SUyZSG0Y5AebSpTm1h3FMCcEARLakoVZF/7aLkPnL/PzmZAvHpSUr+Ms8pPzrrt3UJcsY
 MYHbN0e14eQcLPvHjl4Yq+RZ
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg01-blr.qualcomm.com with ESMTP; 08 Nov 2019 19:08:54 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id 83C5F4949; Fri,  8 Nov 2019 19:08:53 +0530 (IST)
From:   Pradeep P V K <ppvk@codeaurora.org>
To:     adrian.hunter@intel.com, georgi.djakov@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, vbadigan@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        rampraka@codeaurora.org, sboyd@kernel.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org,
        Pradeep P V K <ppvk@codeaurora.org>
Subject: [RFC-v2 0/2] Add Support for SDHC bus bandwidth voting
Date:   Fri,  8 Nov 2019 19:08:37 +0530
Message-Id: <1573220319-4287-1-git-send-email-ppvk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Vote for the MSM bus bandwidth required by SDHC driver
based on the clock speed and bus width of the card.
Otherwise, the system clocks may run at minimum clock
speed and thus affecting the performance.

Adapt to the new ICB framework for bus bandwidth voting.

This requires the source/destination port ids.
Also this requires a tuple of values.

The tuple is for two different paths - from SDHC master
to BIMC slave. The other is from CPU master to SDHC slave.
This tuple consists of the average and peak bandwidth.

This change is based on Georgi Djakov [RFC]
(https://lkml.org/lkml/2018/10/11/499)

---
changed since v1:
* Addressed all the Review comments.
* Minor code rebasing.

Pradeep P V K (2):
  dt-bindings: mmc: sdhci-msm: Add Bus BW vote supported strings
  mmc: sdhci-msm: Add support for bus bandwidth voting

 .../devicetree/bindings/mmc/sdhci-msm.txt          |  32 ++
 drivers/mmc/host/sdhci-msm.c                       | 366 ++++++++++++++++++++-
 2 files changed, 395 insertions(+), 3 deletions(-)

-- 
1.9.1

