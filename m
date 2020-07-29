Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939D2232390
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 19:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgG2Rkj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 13:40:39 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31009 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727050AbgG2Rki (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 13:40:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596044437; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=I/IQdNkreYiTRKc48552j/BGYeKsZ+oHQdQeMynB8Og=; b=m0kyUfd1IPfUGeZABxWsOTMLTZmzDj/XnrTMl6oYZpw9qvj5Rm8NnPotXYalZHjGO2XCcvse
 hFTuGmYruezskYMDSUS/2Fg/65F7Eh+TJ04xY6+1pfjgIiPEPfa4oI7ld7xVppz6CRc+Jh5J
 W2bJmqwXI78Geg4BrbRpvCGJzKc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f21b48370ff737ddb4cfa33 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 29 Jul 2020 17:40:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B4D39C433A0; Wed, 29 Jul 2020 17:40:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E151C433C9;
        Wed, 29 Jul 2020 17:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4E151C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        corbet@lwn.net
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v5 0/2] Add character device interface to remoteproc
Date:   Wed, 29 Jul 2020 10:39:59 -0700
Message-Id: <1596044401-22083-1-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series adds a character device interface to remoteproc
framework. Currently there is only a sysfs interface which the userspace
clients can use. If a usersapce application crashes after booting
the remote processor through the sysfs interface the remote processor
does not get any indication about the crash. It might still assume
that the  application is running.
For example modem uses remotefs service to data from disk/flash memory.
If the remotefs service crashes, modem still keeps on requesting data
which might lead to crash on modem. Even if the service is restarted the
file handles modem requested previously would become stale.
Adding a character device interface makes the remote processor tightly
coupled with the user space application. A crash of the application
leads to a close on the file descriptors therefore shutting down the
remoteproc.

Changelog:
v4 -> v5:
- Addressed comments from Bjorn and Mathieu.
- Added cdev_set_parent call to set remoteproc device as parent of cdev.
- Fixed error with rproc_major introduced in the last patch.
- Fixed implementation for compat calls. With previous implementation 64bit
  userspace applications failed to perform the ioctl call, returning errno 25,
  or "Inappropriate ioctl for device."
- Removed exit functions from the driver as remoteproc framework is statically
  compiled.

v3 -> v4:
- Addressed comments from Mathieu and Arnaud.
- Added locks while writing/reading from the automatic-shutdown-on-release bool.
- Changed return value when failing to copy to/from userspace.
- Changed logic for calling shutdown on release.
- Moved around code after the increase of max line length from 80 to 100.
- Moved the call adding character device before device_add in rproc_add to add
  both sysfs and character device interface together.

v2 -> v3:
- Move booting of remoteproc from open to a write call.
- Add ioctl interface for future functionality extension.
- Add an ioctl call to default to rproc shutdown on release.

v1 -> v2:
- Fixed comments from Bjorn and Matthew.

Siddharth Gupta (2):
  remoteproc: Add remoteproc character device interface
  remoteproc: core: Register the character device interface

 Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
 drivers/remoteproc/Kconfig                         |   9 ++
 drivers/remoteproc/Makefile                        |   1 +
 drivers/remoteproc/remoteproc_cdev.c               | 124 +++++++++++++++++++++
 drivers/remoteproc/remoteproc_core.c               |   7 ++
 drivers/remoteproc/remoteproc_internal.h           |  28 +++++
 include/linux/remoteproc.h                         |   5 +
 include/uapi/linux/remoteproc_cdev.h               |  37 ++++++
 8 files changed, 212 insertions(+)
 create mode 100644 drivers/remoteproc/remoteproc_cdev.c
 create mode 100644 include/uapi/linux/remoteproc_cdev.h

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

