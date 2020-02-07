Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45F5F1559EE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 15:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgBGOpv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 09:45:51 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:2101 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727065AbgBGOpv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 09:45:51 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 07 Feb 2020 20:15:45 +0530
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg01-blr.qualcomm.com with ESMTP; 07 Feb 2020 20:15:11 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id DE9F947EB; Fri,  7 Feb 2020 20:15:10 +0530 (IST)
From:   Pradeep P V K <ppvk@codeaurora.org>
To:     adrian.hunter@intel.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        rampraka@codeaurora.org, vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org,
        mka@chromium.org, Pradeep P V K <ppvk@codeaurora.org>
Subject: [RFC v3 0/2] Add SDHC interconnect bandwidth scaling
Date:   Fri,  7 Feb 2020 20:14:53 +0530
Message-Id: <1581086695-16645-1-git-send-email-ppvk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add interconnect bandwidths for SDHC driver using OPP framework that
is required by SDHC driver based on the clock frequency and bus width
of the card. Otherwise, the system clocks may run at minimum clock
speed and thus affecting the performance.


This change is based on Georgi Djakov [RFC]
(https://lkml.org/lkml/2018/10/11/499) and

Saravana Kannan [PATCH v6]
(https://lkml.org/lkml/2019/12/6/740)

change from RFC v2 -> v3 changes:
- Modified interconnect bandwidth support using OPP framework.
- Addressed review comments on v2.

Pradeep P V K (2):
  mmc: sdhci-msm: Add interconnect bus bandwidth scaling support
  dt-bindings: mmc: sdhci-msm: Add interconnect BW scaling strings

 .../devicetree/bindings/mmc/sdhci-msm.txt          |  18 ++
 drivers/mmc/host/sdhci-msm.c                       | 251 ++++++++++++++++++++-
 2 files changed, 265 insertions(+), 4 deletions(-)

-- 
1.9.1

