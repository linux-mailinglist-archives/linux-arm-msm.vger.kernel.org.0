Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61BE126CA69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 21:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgIPT7F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 15:59:05 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:48314 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727241AbgIPT4R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 15:56:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600286177; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=5AfOnS+3Y+Pteg+tc8ZLv/GKO8Jt2d+yM7XEqrxfjHE=; b=AB94+aRxNNcP0Dfeym0GUQwfspEjhYBZJ46liZzWhNQS6pxfWEOcklRO7jItZ99Xu3GyT12F
 RM5aGP7vOYBzArpEY1LT2D1rlL/Le8zVaOzi+5w01fNSBd5PD8lsGjP6KUaW5kAkZr/EIuaj
 FDIMOTxoJOd9X/8M9pnnM8pPgks=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f626de1fda7475cca571379 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Sep 2020 19:56:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 84777C43385; Wed, 16 Sep 2020 19:56:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B603CC433FF;
        Wed, 16 Sep 2020 19:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B603CC433FF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v6 3/4] docs: Add documentation for userspace client interface
Date:   Wed, 16 Sep 2020 12:56:06 -0700
Message-Id: <1600286167-4432-4-git-send-email-hemantk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600286167-4432-1-git-send-email-hemantk@codeaurora.org>
References: <1600286167-4432-1-git-send-email-hemantk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

MHI userspace client driver is creating device file node
for user application to perform file operations. File
operations are handled by MHI core driver. Currently
Loopback MHI channel is supported by this driver.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
---
 Documentation/mhi/index.rst |  1 +
 Documentation/mhi/uci.rst   | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 Documentation/mhi/uci.rst

diff --git a/Documentation/mhi/index.rst b/Documentation/mhi/index.rst
index 1d8dec3..c75a371 100644
--- a/Documentation/mhi/index.rst
+++ b/Documentation/mhi/index.rst
@@ -9,6 +9,7 @@ MHI
 
    mhi
    topology
+   uci
 
 .. only::  subproject and html
 
diff --git a/Documentation/mhi/uci.rst b/Documentation/mhi/uci.rst
new file mode 100644
index 0000000..5d92939
--- /dev/null
+++ b/Documentation/mhi/uci.rst
@@ -0,0 +1,39 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================================
+Userspace Client Interface (UCI)
+=================================
+
+UCI driver enables userspace clients to communicate to external MHI devices
+like modem and WLAN. It creates standard character device file nodes for user
+space clients to perform open, read, write, poll and close file operations.
+
+Device file node is created with format:-
+
+/dev/mhi_<controller_name>_<mhi_device_name>
+
+controller_name is the name of underlying bus used to transfer data.
+mhi_device_name is the name of the MHI channel being used by MHI client in
+userspace to send or receive data using MHI protocol.
+
+There is a separate character device file node created for each channel specified
+in mhi device id table. MHI channels are statically defined by MHI specification.
+Driver currently supports LOOPBACK channel 0 (Host to device) and 1 (Device to Host).
+
+LOOPBACK Channel
+----------------
+
+Userspace MHI client using LOOPBACK channel opens device file node. As part of
+open operation TREs to transfer ring of LOOPBACK channel 1 gets queued and channel
+doorbell is rung. When userspace MHI client performs write operation on device node,
+data buffer gets queued as a TRE to transfer ring of LOOPBACK channel 0. MHI Core
+driver rings the channel doorbell for MHI device to move data over underlying bus.
+When userspace MHI client driver performs read operation, same data gets looped back
+to MHI host using LOOPBACK channel 1. LOOPBACK channel is used to verify data path
+and data integrity between MHI Host and MHI device.
+
+Other Use Cases
+---------------
+
+Getting MHI device specific diagnostics information to userspace MHI diag client
+using DIAG channel 4 (Host to device) and 5 (Device to Host).
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

