Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC4E4290FBA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Oct 2020 07:59:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436769AbgJQF7h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Oct 2020 01:59:37 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:55877 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436828AbgJQF7f (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Oct 2020 01:59:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602914375; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qoVYRfC82HP6ntvSqaZuxC+KWwGG0EWGKLq1cKl7bh8=; b=pAFOlYZIZocWvjFRz6hhsqhEtDJxFnrixA6NUV1Zb3Bc1qgBP4l6WB69WNlDW9oP79CStG0P
 Uyw6cMX/27UZEEEQ0XkZFGBD6zx7Zr4lgj5GNFX2MsIGq/h7q29bBTm+PbmpHevBKPnTz9ev
 98vddH03hj8MbD/JmLKbsgqb6Jc=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f8a6d4cad37af35ec40dd52 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 17 Oct 2020 04:04:28
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 98C71C43387; Sat, 17 Oct 2020 04:04:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BB686C433C9;
        Sat, 17 Oct 2020 04:04:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BB686C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v7 3/4] docs: Add documentation for userspace client interface
Date:   Fri, 16 Oct 2020 21:04:16 -0700
Message-Id: <1602907457-13680-4-git-send-email-hemantk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602907457-13680-1-git-send-email-hemantk@codeaurora.org>
References: <1602907457-13680-1-git-send-email-hemantk@codeaurora.org>
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
 Documentation/mhi/uci.rst   | 83 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)
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
index 0000000..fe901c4
--- /dev/null
+++ b/Documentation/mhi/uci.rst
@@ -0,0 +1,83 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================================
+Userspace Client Interface (UCI)
+=================================
+
+UCI driver enables userspace clients to communicate to external MHI devices
+like modem and WLAN. UCI driver probe creates standard character device file
+nodes for userspace clients to perform open, read, write, poll and release file
+operations.
+
+Operations
+==========
+
+open
+----
+
+Instantiates UCI channel object and starts MHI channels to move it to running
+state. Inbound buffers are queued to downlink channel transfer ring. Every
+subsequent open() increments UCI device reference count as well as UCI channel
+reference count.
+
+read
+----
+
+When data transfer is completed on downlink channel, TRE buffer is copied to
+pending list. Reader is unblocked and data is copied to userspace buffer. TRE
+buffer is queued back to downlink channel transfer ring.
+
+write
+-----
+
+Write buffer is queued to uplink channel transfer ring if ring is not full. Upon
+uplink transfer completion buffer is freed.
+
+poll
+----
+
+Returns EPOLLIN | EPOLLRDNORM mask if pending list has buffers to be read by
+userspace. Returns EPOLLOUT | EPOLLWRNORM mask if MHI uplink channel transfer
+ring is not empty. Returns EPOLLERR when UCI driver is removed. MHI channels
+move to disabled state upon driver remove.
+
+release
+-------
+
+Decrements UCI device reference count and UCI channel reference count upon last
+release(). UCI channel clean up is performed. MHI channel moves to disabled
+state and inbound buffers are freed.
+
+Usage
+=====
+
+Device file node is created with format:-
+
+/dev/mhi_<controller_name>_<mhi_device_name>
+
+controller_name is the name of underlying bus used to transfer data. mhi_device
+name is the name of the MHI channel being used by MHI client in userspace to
+send or receive data using MHI protocol.
+
+There is a separate character device file node created for each channel
+specified in mhi device id table. MHI channels are statically defined by MHI
+specification. The list of supported channels is in the channel list variable
+of mhi_device_id table in UCI driver.
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

