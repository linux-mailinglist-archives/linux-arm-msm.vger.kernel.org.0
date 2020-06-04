Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2401EE331
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 13:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgFDLRJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 07:17:09 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:62205 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727768AbgFDLRI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 07:17:08 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Jun 2020 16:45:16 +0530
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Jun 2020 16:44:46 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id B0FB6191B; Thu,  4 Jun 2020 16:44:45 +0530 (IST)
From:   Pradeep P V K <ppvk@codeaurora.org>
To:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, mka@chromium.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc-owner@vger.kernel.org, rnayak@codeaurora.org,
        sibis@codeaurora.org, matthias@chromium.org,
        Pradeep P V K <ppvk@codeaurora.org>
Subject: [PATCH V2 0/2] Add SDHC interconnect bandwidth scaling 
Date:   Thu,  4 Jun 2020 16:44:41 +0530
Message-Id: <1591269283-24084-1-git-send-email-ppvk@codeaurora.org>
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
[1] [Patch v8] Introduce OPP bandwidth bindings
(https://lkml.org/lkml/2020/5/12/493)

[2] [Patch v3 09/17] mmc: sdhci-msm: Fix error handling
for dev_pm_opp_of_add_table()
(https://lkml.org/lkml/2020/5/5/491)

[3] [RFC v6 2/2] dt-bindings: mmc: sdhci-msm: Add interconnect BW
scaling strings
(https://lkml.org/lkml/2020/3/23/409)

as there were no extra changes made on [3], retaining the Acked-by and
Reviewed-by sign-off from [3].

Pradeep P V K (2):
  mmc: sdhci-msm: Add interconnect bandwidth scaling support
  dt-bindings: mmc: sdhci-msm: Add interconnect BW scaling strings

 Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 18 ++++++++++++++++++
 drivers/mmc/host/sdhci-msm.c                        | 13 +++++++++++++
 2 files changed, 31 insertions(+)

-- 
changes since V1:
- Added dev_pm_opp_find_icc_paths() to check for icc paths.
