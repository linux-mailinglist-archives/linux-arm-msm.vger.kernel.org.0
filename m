Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 173911626A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 14:01:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgBRNBU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 08:01:20 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:1082 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726399AbgBRNBT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 08:01:19 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 Feb 2020 18:31:16 +0530
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg02-blr.qualcomm.com with ESMTP; 18 Feb 2020 18:30:41 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id A544A4C42; Tue, 18 Feb 2020 18:30:40 +0530 (IST)
From:   Pradeep P V K <ppvk@codeaurora.org>
To:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, rampraka@codeaurora.org,
        vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, mka@chromium.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org,
        Pradeep P V K <ppvk@codeaurora.org>
Subject: [RFC v4 0/2] Add SDHC interconnect bandwidth scaling
Date:   Tue, 18 Feb 2020 18:30:31 +0530
Message-Id: <1582030833-12964-1-git-send-email-ppvk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add interconnect bandwidths for SDHC driver using OPP framework that
is required by SDHC driver based on the clock frequency and bus width
of the card. Otherwise, the system clocks may run at minimum clock
speed and thus affecting the performance.

This change is based on
[RFC] mmc: host: sdhci-msm: Use the interconnect API
(https://lkml.org/lkml/2018/10/11/499) and

[PATCH v6] Introduce Bandwidth OPPs for interconnects
(https://lkml.org/lkml/2019/12/6/740)

Pradeep P V K (2):
  mmc: sdhci-msm: Add interconnect bus bandwidth scaling support
  dt-bindings: mmc: sdhci-msm: Add interconnect BW scaling strings

 .../devicetree/bindings/mmc/sdhci-msm.txt          |  18 ++
 drivers/mmc/host/sdhci-msm.c                       | 204 ++++++++++++++++++++-
 2 files changed, 218 insertions(+), 4 deletions(-)

--
changes from RFC v3 -> v4:
- Addressed review comments from Bjorn and Matthias
1.9.1

