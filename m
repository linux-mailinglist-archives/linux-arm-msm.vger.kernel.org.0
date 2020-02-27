Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 794E5172AC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 23:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729831AbgB0WGM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 17:06:12 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:25259 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729776AbgB0WGK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 17:06:10 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582841170; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=5Yb5NWMFrqzXj1+cgPqRQMaN6UQ8BdghPQnNiD41NVQ=; b=c1ZfL7f0nMTQFveLoovVTHL2HB8U5xNgUvDjdmph1Q/hLmmTHSh3RrJjPVNxrxPhZBRuhvye
 ygcWdg2WQ0EKBr0rivYfUOj7kityax8mWsTdQHAzm87IKXWoerkDQ/kJGIqxAjLbNmEByij6
 ChIb1LOMa0hsZ60G+W7Tzck23/8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e583d3d.7fd95dc67110-smtp-out-n02;
 Thu, 27 Feb 2020 22:05:49 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C600C4479C; Thu, 27 Feb 2020 22:05:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 782E6C43383;
        Thu, 27 Feb 2020 22:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 782E6C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=nguyenb@codeaurora.org
From:   "Bao D. Nguyen" <nguyenb@codeaurora.org>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        linux-scsi@vger.kernel.org
Cc:     linux-mmc@vger.kernel.org, asutoshd@codeaurora.org,
        cang@codeaurora.org, "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: [<PATCH v1> 0/4]  SD card bug fixes
Date:   Thu, 27 Feb 2020 14:05:38 -0800
Message-Id: <cover.1582839544.git.nguyenb@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I tried to make some changes earlier in the patch
[<PATCH v1> 9/9] mmc: sd: Fix trivial SD card issues].
There were a lot of valid comments asking to clarify
and separate the fixes into logical patches. With this
patch series, I am trying to address those comments.

Bao D. Nguyen (1):
  mmc: core: Add check for NULL pointer access

Ritesh Harjani (1):
  mmc: core: Make host->card as NULL when card is removed

Sahitya Tummala (1):
  mmc: core: update host->card after getting RCA for SD card

Subhash Jadavani (1):
  mmc: core: Attribute the IO wait time properly in
    mmc_wait_for_req_done()

 drivers/mmc/core/bus.c  | 8 ++++++++
 drivers/mmc/core/core.c | 5 ++++-
 drivers/mmc/core/sd.c   | 6 ++++--
 3 files changed, 16 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
