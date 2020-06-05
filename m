Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00DEC1EF432
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 11:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgFEJbK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 05:31:10 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:26194 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726248AbgFEJbJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 05:31:09 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 05 Jun 2020 15:01:01 +0530
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg01-blr.qualcomm.com with ESMTP; 05 Jun 2020 15:00:32 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id 0AF3748CC; Fri,  5 Jun 2020 15:00:30 +0530 (IST)
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
Subject: =?y?q?=5BPATCH=C2=A0V3=200/2=5D=20Add=20SDHC=20interconnect=20bandwidth=20scaling=20?=
Date:   Fri,  5 Jun 2020 15:00:25 +0530
Message-Id: <1591349427-27004-1-git-send-email-ppvk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591269283-24084-1-git-send-email-ppvk@codeaurora.org>
References: <1591269283-24084-1-git-send-email-ppvk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
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

Changes since V2:
- Removed debug error prints on icc path ready check.

changes since V1:
- Added dev_pm_opp_find_icc_paths() to check for icc paths.

Pradeep P V K (2):
  mmc: sdhci-msm: Add interconnect bandwidth scaling support
  dt-bindings: mmc: sdhci-msm: Add interconnect BW scaling strings

 Documentation/devicetree/bindings/mmc/sdhci-msm.txt | 18 ++++++++++++++++++
 drivers/mmc/host/sdhci-msm.c                        |  8 ++++++++
 2 files changed, 26 insertions(+)

-- 
1.9.1

