Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70D273E2395
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 08:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243008AbhHFGzZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 02:55:25 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:45912 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbhHFGzZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 02:55:25 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 05 Aug 2021 23:55:09 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Aug 2021 23:55:07 -0700
X-QCInternal: smtphost
Received: from sartgarg-linux.qualcomm.com ([10.206.24.245])
  by ironmsg02-blr.qualcomm.com with ESMTP; 06 Aug 2021 12:25:05 +0530
Received: by sartgarg-linux.qualcomm.com (Postfix, from userid 2339771)
        id B5254362C; Fri,  6 Aug 2021 12:25:03 +0530 (IST)
From:   Sarthak Garg <sartgarg@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sarthak Garg <sartgarg@codeaurora.org>
Subject: [PATCH V3 0/2] Introduce max_timeout_count in sdhci_host for vendor needs
Date:   Fri,  6 Aug 2021 12:24:58 +0530
Message-Id: <1628232901-30897-1-git-send-email-sartgarg@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627534001-17256-2-git-send-email-sartgarg@codeaurora.org>
References: <1627534001-17256-2-git-send-email-sartgarg@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce max_timeout_count in sdhci_host_struct to let vendor's modify
the max timeout value as per their needs.

Sahitya Tummala (1):
  mmc: sdhci-msm: Use maximum possible data timeout value

Sarthak Garg (1):
  mmc: sdhci: Introduce max_timeout_count variable in sdhci_host

 drivers/mmc/host/sdhci-msm.c |  3 +++
 drivers/mmc/host/sdhci.c     | 16 +++++++++-------
 drivers/mmc/host/sdhci.h     |  1 +
 3 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.7.4

