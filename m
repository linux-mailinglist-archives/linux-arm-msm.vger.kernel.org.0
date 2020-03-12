Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D856B1828A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 07:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387786AbgCLGDP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 02:03:15 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:20487 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387767AbgCLGDP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 02:03:15 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Mar 2020 11:32:29 +0530
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg02-blr.qualcomm.com with ESMTP; 12 Mar 2020 11:31:58 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id 258634D31; Thu, 12 Mar 2020 11:31:57 +0530 (IST)
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
Subject: [RFC v5 0/2] Add SDHC interconnect bandwidth scaling
Date:   Thu, 12 Mar 2020 11:31:49 +0530
Message-Id: <1583992911-12001-1-git-send-email-ppvk@codeaurora.org>
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
 drivers/mmc/host/sdhci-msm.c                       | 231 ++++++++++++++++++++-
 2 files changed, 245 insertions(+), 4 deletions(-)

-- 
RFC v4 -> v5:
- Added Rob's Acked-by and Bjorn Reviewed-by for the DT patch.
- Rewrote the icc interconnect get handlers and its error handling
  and allocated vote data after handling all icc get handler errors.
- Removed explicit error check on ICC handlers.
- Addressed minor code style comments.
1.9.1

