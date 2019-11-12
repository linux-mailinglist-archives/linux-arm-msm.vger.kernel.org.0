Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E183F9C08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 22:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfKLVXF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 16:23:05 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38502 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfKLVXF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 16:23:05 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EC48A608CC; Tue, 12 Nov 2019 21:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593783;
        bh=Lf5D9ppBmtQ1eV7DCgHEY543Ji26UJSEoevyHMcYOaA=;
        h=From:To:Cc:Subject:Date:From;
        b=ERvNdYCUJRHiMpxGQEgUPVBKTC29WU7uLV/pcnSPq9hbelh5YlmECWD8TPO7hvGuk
         JvBYHnw9F/hrDcsTTjPo522nTylodrlJBIML2+3vr++AvBlefKzynpHYvAGYL6g8zp
         sDOW57Tj+9cSY07FS2/ONHGIQVc/4PG0StWrzbgo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5827160591;
        Tue, 12 Nov 2019 21:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593782;
        bh=Lf5D9ppBmtQ1eV7DCgHEY543Ji26UJSEoevyHMcYOaA=;
        h=From:To:Cc:Subject:Date:From;
        b=AsnohukHYLKnAUw+CuxTfahOwWdJ25B2vDDPq6X3hos+H8A88vV00HtgDVpW5R0nx
         EKdBTkqegx7v/srDrNAhCpQKT5TN+Yshr0b4d7G44KOPhhK+3NSkpDcorpU2frwejC
         IPrg6y92yKa70Qs+ZUKhPmbCcZD6E1ZgUmcVb1d0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5827160591
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/18] Restructure, improve target support for qcom_scm driver
Date:   Tue, 12 Nov 2019 13:22:36 -0800
Message-Id: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series improves support for 32-bit Qualcomm targets on qcom_scm driver.

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

Patches 1-5 improve macro names, reorder macros/functions, and prune unused
            macros/functions. No functional changes were introduced.
Patches 6-10 clears up the SCM abstraction in qcom_scm-64.
Patches 11-15 clears up the SCM abstraction in qcom_scm-32.
Patches 10 and 16-18 enable dynamically using the different calling conventions.

This series is based on https://lore.kernel.org/patchwork/cover/1129991/
 
[1]: https://source.codeaurora.org/quic/la/kernel/msm-4.9/tree/drivers/soc/qcom/scm.c?h=kernel.lnx.4.9.r28-rel#n555

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

Elliot Berman (18):
  firmware: qcom_scm: Rename macros and structures
  firmware: qcom_scm: Add funcnum IDs
  firmware: qcom_scm-64: Make SMCCC macros less magical
  firmware: qcom_scm: Apply consistent naming scheme to command IDs
  firmware: qcom_scm: Remove unused qcom_scm_get_version
  firmware: qcom_scm-64: Move svc/cmd/owner into qcom_scm_desc
  firmware: qcom_scm-64: Add SCM results to descriptor
  firmware: qcom_scm-64: Remove qcom_scm_call_do_smccc
  firmware: qcom_scm-64: Move SMC register filling to
    qcom_scm_call_smccc
  firmware: qcom_scm-64: Improve SMC convention detection
  firmware: qcom_scm-32: Use SMC arch wrappers
  firmware: qcom_scm-32: Use qcom_scm_desc in non-atomic calls
  firmware: qcom_scm-32: Move SMCCC register filling to qcom_scm_call
  firmware: qcom_scm-32: Create common legacy atomic call
  firmware: qcom_scm-32: Add device argument to atomic calls
  firmware: qcom_scm: Remove thin wrappers
  firmware: qcom_scm: Dynamically support SMCCC and legacy conventions
  firmware: qcom_scm: Order functions, definitions by service/command

 drivers/firmware/Kconfig           |   8 -
 drivers/firmware/Makefile          |   5 +-
 drivers/firmware/qcom_scm-32.c     | 621 --------------------------------
 drivers/firmware/qcom_scm-64.c     | 567 -----------------------------
 drivers/firmware/qcom_scm-legacy.c | 233 ++++++++++++
 drivers/firmware/qcom_scm-smccc.c  | 141 ++++++++
 drivers/firmware/qcom_scm.c        | 708 +++++++++++++++++++++++++++++--------
 drivers/firmware/qcom_scm.h        | 166 +++++----
 include/linux/qcom_scm.h           |  99 +++---
 9 files changed, 1086 insertions(+), 1462 deletions(-)
 delete mode 100644 drivers/firmware/qcom_scm-32.c
 delete mode 100644 drivers/firmware/qcom_scm-64.c
 create mode 100644 drivers/firmware/qcom_scm-legacy.c
 create mode 100644 drivers/firmware/qcom_scm-smccc.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

