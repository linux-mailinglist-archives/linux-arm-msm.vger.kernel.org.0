Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457A325CDE1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 00:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728582AbgICWnh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 18:43:37 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32425 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728294AbgICWnh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 18:43:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599173016; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=OUHfKb7+kSzeyyUYAIuHS6fXHze1IkqBGJwGQ2VEOsU=; b=Xhiv8m8aYKVRMLMrv4LMtGkCKGbdGIppACR0g80t0RnoisYf4ClFCL228NYfH39DPzvlK+JB
 reLVEnPxm5/tdEbIBbXITIYOxK6kNnF+P/dEXP7/lZJKhl+sAVAf45aNSVmPEez95lNYtBO4
 BlRmbed7ELmDvL3Pq4EBDLeiyMk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f517198238e1efa37eefacd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 22:43:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D38C7C433A0; Thu,  3 Sep 2020 22:43:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 026F2C433C8;
        Thu,  3 Sep 2020 22:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 026F2C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        khsieh@codeaurora.org
Subject: [PATCH 0/4] Add support for video pattern DP CTS to MSM DP
Date:   Thu,  3 Sep 2020 15:43:24 -0700
Message-Id: <20200903224328.26452-1-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for video pattern Display Port Compliance tests to
MSM DP driver. The userspace component of this shall be part of another
series in the igt mailing list.
This depends on series [1] , [2] and [3] which add basic Display Port
support to MSM chipsets.

[1] https://patchwork.kernel.org/project/dri-devel/list/?series=339847
[2] https://patchwork.kernel.org/project/dri-devel/list/?series=339997
[3] https://patchwork.kernel.org/project/dri-devel/list/?series=341175

Abhinav Kumar (4):
  drm/msm/dp: add debugfs support to DP driver
  drm/msm/dp: move debugfs node to /sys/kernel/debug/dri/*/
  drm/msm/dp: add debugfs nodes for video pattern tests
  drm/msm/dp: remove mode hard-coding in case of DP CTS

 drivers/gpu/drm/msm/Makefile            |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |   7 +
 drivers/gpu/drm/msm/dp/dp_debug.c       | 485 ++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_debug.h       |  74 ++++
 drivers/gpu/drm/msm/dp/dp_display.c     |  28 +-
 drivers/gpu/drm/msm/dp/dp_link.c        |   2 +-
 drivers/gpu/drm/msm/dp/dp_link.h        |  23 ++
 drivers/gpu/drm/msm/dp/dp_panel.c       |  46 +--
 drivers/gpu/drm/msm/msm_drv.h           |   2 +
 9 files changed, 617 insertions(+), 53 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_debug.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_debug.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

