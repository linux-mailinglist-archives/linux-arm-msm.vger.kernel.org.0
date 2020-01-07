Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A974F1331DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 22:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729049AbgAGVEn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 16:04:43 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:13912 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729065AbgAGVEn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 16:04:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578431081; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=4QLNUic917B2jV7eDN8GdPFMyBIat+18IgpdNwwC2qQ=; b=CqpHCli75QUv0aHNHSNElgOz6omZE90sqDy7z+StHt2LkFHonqxi71e5XzFvQgqwNv1Y3rsK
 tPKYfBG7BnTCXiI4czdI8yiO3kwS+PJojRvK9kaglKrACgXQcHDGR1gdELTDOR2c3C7K0wyp
 4fI2HTM/4YVxWcsWfuR60MP6j38=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e14f264.7f95ad3dc4c8-smtp-out-n03;
 Tue, 07 Jan 2020 21:04:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 98FE9C447A9; Tue,  7 Jan 2020 21:04:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 49146C4479C;
        Tue,  7 Jan 2020 21:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 49146C4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        swboyd@chromium.org, Stephan Gerhold <stephan@gerhold.net>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/17] Restructure, improve target support for qcom_scm driver 
Date:   Tue,  7 Jan 2020 13:04:09 -0800
Message-Id: <1578431066-19600-1-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series improves support for 32-bit Qualcomm targets on qcom_scm driver and cleans
up the driver for 64-bit implementations.

Currently, the qcom_scm driver supports only 64-bit Qualcomm targets and very
old 32-bit Qualcomm targets. Newer 32-bit targets use ARM's SMC Calling
Convention to communicate with secure world. Older 32-bit targets use a
"buffer-based" legacy approach for communicating with secure world (as
implemented in qcom_scm-32.c). All arm64 Qualcomm targets use ARM SMCCC.
Currently, SMCCC-based communication is enabled only on ARM64 config and
buffer-based communication only on ARM config. This patch-series combines SMCCC
and legacy conventions and selects the correct convention by querying the secure
world [1].

We decided to take the opportunity as well to clean up the driver rather than
try to patch together qcom_scm-32 and qcom_scm-64.

Patches 1-3 and 15 improve macro names, reorder macros/functions, and prune unused
            macros/functions. No functional changes were introduced.
Patches 4-8 clears up the SCM abstraction in qcom_scm-64.
Patches 9-14 clears up the SCM abstraction in qcom_scm-32.
Patches 16-17 enable dynamically using the different calling conventions.

[1]: https://source.codeaurora.org/quic/la/kernel/msm-4.9/tree/drivers/soc/qcom/scm.c?h=kernel.lnx.4.9.r28-rel#n555

Changes since v4:
 - Restored missing arginfo/args to pas_auth_and_reset

Changes since v3:
 - Updated recepients

Changes since v2:
 - Addressed Stephen's comments throughout v2.
 - Rebased onto latest for-next branch
 - Removed v2 08/18 (firmware: qcom_scm-64: Remove qcom_scm_call_do_smccc)
 - Cleaned up the convention query from v2 to align with [1].

Changes since v1:
 - Renamed functions/variables per Vinod's suggestions
 - Split v1 01/17 into v2 [01,02,03]/18 per Vinod's suggestion
 - Fix suggestions by Bjorn in v1 09/18 (now v2 10/18)
 - Refactor last 3 commits per Bjorn suggestions in v1 17/18 and v1 10/18

Changes since RFC:
 - Fixed missing return values in qcom_scm_call_smccc
 - Fixed order of arguments in qcom_scm_set_warm_boot_addr
 - Adjusted logic of SMC convention to properly support older QCOM secure worlds
 - Boot tested on IFC6410 based on linaro kernel tag:
   debian-qcom-dragonboard410c-18.01 (which does basic verification of legacy
   SCM calls: at least warm_boot_addr, cold_boot_addr, and power_down)

Elliot Berman (17):
  firmware: qcom_scm: Rename macros and structures
  firmware: qcom_scm: Apply consistent naming scheme to command IDs
  firmware: qcom_scm: Remove unused qcom_scm_get_version
  firmware: qcom_scm-64: Make SMC macros less magical
  firmware: qcom_scm-64: Move svc/cmd/owner into qcom_scm_desc
  firmware: qcom_scm-64: Add SCM results struct
  firmware: qcom_scm-64: Move SMC register filling to
    qcom_scm_call_smccc
  firmware: qcom_scm-64: Improve SMC convention detection
  firmware: qcom_scm-32: Use SMC arch wrappers
  firmware: qcom_scm-32: Add funcnum IDs
  firmware: qcom_scm-32: Use qcom_scm_desc in non-atomic calls
  firmware: qcom_scm-32: Move SMCCC register filling to qcom_scm_call
  firmware: qcom_scm-32: Create common legacy atomic call
  firmware: qcom_scm-32: Add device argument to atomic calls
  firmware: qcom_scm: Order functions, definitions by service/command
  firmware: qcom_scm: Remove thin wrappers
  firmware: qcom_scm: Dynamically support SMCCC and legacy conventions

 drivers/firmware/Kconfig           |   8 -
 drivers/firmware/Makefile          |   5 +-
 drivers/firmware/qcom_scm-32.c     | 671 -----------------------------
 drivers/firmware/qcom_scm-64.c     | 579 -------------------------
 drivers/firmware/qcom_scm-legacy.c | 242 +++++++++++
 drivers/firmware/qcom_scm-smc.c    | 151 +++++++
 drivers/firmware/qcom_scm.c        | 854 +++++++++++++++++++++++++++++--------
 drivers/firmware/qcom_scm.h        | 178 ++++----
 include/linux/qcom_scm.h           | 125 +++---
 9 files changed, 1232 insertions(+), 1581 deletions(-)
 delete mode 100644 drivers/firmware/qcom_scm-32.c
 delete mode 100644 drivers/firmware/qcom_scm-64.c
 create mode 100644 drivers/firmware/qcom_scm-legacy.c
 create mode 100644 drivers/firmware/qcom_scm-smc.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
