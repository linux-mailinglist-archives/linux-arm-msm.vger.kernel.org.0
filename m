Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAE7CEF29A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 02:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730199AbfKEB1t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 20:27:49 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:37392 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729526AbfKEB1t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 20:27:49 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EAD6760D9B; Tue,  5 Nov 2019 01:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917268;
        bh=sSNOhcwmvuFISLbTZnmz9ND3WMelG52dYREpGmMV3Sc=;
        h=From:To:Cc:Subject:Date:From;
        b=KJwRYVAE1mbbNwJXI+S8ro5a9u+cu/TjaIoqguxLEaNOO7dfDFMJJFo9zv8KSm+mm
         07B+izX72lpxzZq2C/fFbg/sfDkN2gOvQ/aH65SerqmQpAw3eK2+fRE7J4Vn5wwDrP
         bRhntYVVKVM2bdAcgxuL41VBOJdBWdY9pHXpkBSU=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4511F60A4E;
        Tue,  5 Nov 2019 01:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917266;
        bh=sSNOhcwmvuFISLbTZnmz9ND3WMelG52dYREpGmMV3Sc=;
        h=From:To:Cc:Subject:Date:From;
        b=A+Izpe4beXCN1sW5znWPk/5+Ugx5G14HVCddcYU8q6vk5aI31QlYKClS3cipeAJ4S
         9rmrtQ8B3A9Utkz8mCjO57CKYmLqN2YJ/Dj1jf1oUBIR2z9Ev/mc8phGwVMv1iuIFS
         aKPorWqGTkFvmYiNdYo6KzWTdujpj7n4m+loxj4c=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4511F60A4E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH 00/17] Restructure, improve target support for qcom_scm driver
Date:   Mon,  4 Nov 2019 17:27:19 -0800
Message-Id: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
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

Patches 1-4 improve macro names, reorder macros/functions, and prune unused
            macros/functions. No functional changes were introduced.
Patches 5-9 clears up the SCM abstraction in qcom_scm-64.
Patches 10-14 clears up the SCM abstraction in qcom_scm-32.
Patches 9 and 15-16 enable dynamically using the different calling conventions.

This series is based on https://lore.kernel.org/patchwork/cover/1129991/
 
[1]: https://source.codeaurora.org/quic/la/kernel/msm-4.9/tree/drivers/soc/qcom/scm.c?h=kernel.lnx.4.9.r28-rel#n555

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
  firmware: qcom_scm: Order functions, definitions by service/command
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
  firmware: qcom_scm: Merge legacy and SMCCC conventions
  firmware: qcom_scm: Enable legacy calling convention in qcom_scm-64.c
  firmware: qcom_scm: Rename -64 -> -smc, remove -32

 drivers/firmware/Kconfig        |  18 +-
 drivers/firmware/Makefile       |   4 +-
 drivers/firmware/qcom_scm-32.c  | 621 --------------------------
 drivers/firmware/qcom_scm-64.c  | 567 ------------------------
 drivers/firmware/qcom_scm-smc.c | 949 ++++++++++++++++++++++++++++++++++++++++
 drivers/firmware/qcom_scm.c     | 235 +++++-----
 drivers/firmware/qcom_scm.h     | 115 +++--
 include/linux/qcom_scm.h        |  72 +--
 8 files changed, 1169 insertions(+), 1412 deletions(-)
 delete mode 100644 drivers/firmware/qcom_scm-32.c
 delete mode 100644 drivers/firmware/qcom_scm-64.c
 create mode 100644 drivers/firmware/qcom_scm-smc.c

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

