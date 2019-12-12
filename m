Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 042CD11D5BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 19:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730367AbfLLShA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 13:37:00 -0500
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:48568
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730224AbfLLShA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 13:37:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576175819;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=ph5RNajd3VLgGuSzX08nDacTZuQVXj+u1RMeY62Objo=;
        b=Jmb7An3fv2YuSWLFxXoOVehoEIiN5hmkGi6tsHhMydxOJ8+gb6RjxMUx+DKvhadA
        kvmXa3pup60xx+pLTLBPt/oI2ZcZbZrg8KcMHXlg6HmDLiMuX63ENFBmpK6hgoMRpb7
        z/N84S5x9Qv7OboRHNRrjT7kFk2QqXeCgxzBg93w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576175819;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=ph5RNajd3VLgGuSzX08nDacTZuQVXj+u1RMeY62Objo=;
        b=BgLpw1lwsRXEiyl1pJaL+C0oVFCQA3GGRBvAQ6B68oaN1BdJSttpqdkJEDHQamak
        AHkZ7ZOXl9sCu/XnSQ4fS0Mz3dkZ3YqQOKAJA9G57ocAYTR779uWlkEiGQamDWa28J+
        32u17/un3m2YZExw+zbzyFYV+sODfWJumUlzXMRU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7F7E1C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.anderssen@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/17] Restructure, improve target support for qcom_scm driver 
Date:   Thu, 12 Dec 2019 18:36:59 +0000
Message-ID: <0101016efb665987-0844125b-e0f0-4287-a39c-1c905001ee17-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
X-SES-Outgoing: 2019.12.12-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
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
 drivers/firmware/qcom_scm.c        | 852 +++++++++++++++++++++++++++++--------
 drivers/firmware/qcom_scm.h        | 178 ++++----
 include/linux/qcom_scm.h           | 113 ++---
 9 files changed, 1224 insertions(+), 1575 deletions(-)
 delete mode 100644 drivers/firmware/qcom_scm-32.c
 delete mode 100644 drivers/firmware/qcom_scm-64.c
 create mode 100644 drivers/firmware/qcom_scm-legacy.c
 create mode 100644 drivers/firmware/qcom_scm-smc.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

