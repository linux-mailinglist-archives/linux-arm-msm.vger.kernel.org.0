Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215CB25B183
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 18:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgIBQYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 12:24:37 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15046 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbgIBQYg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 12:24:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599063875; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=9ZiHvRjb2d9MQ1k+GNhy2aEJ5FomGrZtX8cr1c2a++U=; b=Fg71lRHLeAlrppwWqOpqRbwCAxxymtd9HqURlf0pIF6xeay+emtk21sadNxHhQRKRfNxj404
 v+f0ZXen8YB0Nk7qwMsCwqJ3BblSPiYdA6lshxwt6cI6Q9E1wG5K5YEI6Ia8UV5UUgwoNm5Y
 zQJUHctwt0Hu+d9pkj4LFDOWcrM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f4fc735be06707b34fed67d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Sep 2020 16:24:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 92929C433CB; Wed,  2 Sep 2020 16:24:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from deesin-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: deesin)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 10AD7C433C6;
        Wed,  2 Sep 2020 16:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 10AD7C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=deesin@codeaurora.org
From:   Deepak Kumar Singh <deesin@codeaurora.org>
To:     bjorn.andersson@linaro.org, clew@codeaurora.org,
        mathieu.poirier@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deesin@codeaurora.org>
Subject: [PATCH V7 0/4] Signaling api support in glink/rpmsg clients
Date:   Wed,  2 Sep 2020 21:54:03 +0530
Message-Id: <1599063847-2347-1-git-send-email-deesin@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change from version 6
In last series(v6) i had put wrong version(v5) for cover note.
Which led to confusion for patch set series.

In this series i have updated the label for cover letter(v7).
There is no change in patches. Only cover note label is updated.

Change from version 5
[V6,4/4] rpmsg: char: Add signal callback and POLLPRI support
Updated for sparse warning. Replaced POLLPRI => EPOLLPRI to fix
warning.

Change from version 4
I am taking over these patches from aneela@codeaurora.org
Fixed all the trivial review comments.

Signal conversion to and from native signal as done in patch V4,2/4
is intentional.

Arun Kumar Neelakantam (3):
  rpmsg: glink: Add support to handle signals command
  rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
  rpmsg: char: Add signal callback and POLLPRI support

Deepak Kumar Singh (1):
  rpmsg: core: Add signal API support

 drivers/rpmsg/qcom_glink_native.c | 125 ++++++++++++++++++++++++++++++++++++++
 drivers/rpmsg/rpmsg_char.c        |  76 ++++++++++++++++++++++-
 drivers/rpmsg/rpmsg_core.c        |  40 ++++++++++++
 drivers/rpmsg/rpmsg_internal.h    |   5 ++
 include/linux/rpmsg.h             |  27 ++++++++
 5 files changed, 270 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

