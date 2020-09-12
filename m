Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A561E267C55
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Sep 2020 22:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725967AbgILUty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Sep 2020 16:49:54 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:63755 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725965AbgILUtx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Sep 2020 16:49:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599943792; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=SJ037dPPCkh2NySgNvYN5vqZDCCm3gZlw6Je2jfTeI4=; b=YUtUNkBWVG6jJAUWFwDWYwICO5G/crn7wvBpvpJYeSStv19YfniqZq1Fy61gpKmr1vhRjV98
 mn4G35bMopV9qHY4f3j0y6Yi8NC/xDMMGuk8/Gn3JsFu+yF/UUMcFaHjqQNuSTjaurE9ct8a
 cf57oC7NSlClK/ZfJUscZ6MtBH0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f5d3466947f606f7e9764c6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 12 Sep 2020 20:49:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2F57EC433C6; Sat, 12 Sep 2020 20:49:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7143AC433C6;
        Sat, 12 Sep 2020 20:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7143AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        tanmay@codeaurora.org, cychiang@chromium.org,
        khsieh@codeaurora.org, vsujithk@codeaurora.org,
        rohitkr@codeaurora.org
Subject: [PATCH v6 0/5] Add audio support for MSM DisplayPort driver
Date:   Sat, 12 Sep 2020 13:49:27 -0700
Message-Id: <20200912204932.21232-1-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds audio support for DP on MSM chipsets. It leverages
the hdmi-codec interface [1] to communicate between the Display Port
driver and the audio subsystem. These changes depend on the series [2]
and [3] which add Display Port support to MSM chipsets.

[1] https://patchwork.kernel.org/patch/11047883/
[2] https://patchwork.kernel.org/project/dri-devel/list/?series=339847
[3] https://patchwork.freedesktop.org/patch/390217/?series=79210&rev=8


changes in v2:
    - fix up a compilation issue on drm-next branch

changes in v3:
    - add support to synchronize DP driver and audio during shutdown

changes in v4:
    - rebase on top of latest patchset of dependency

changes in v5:
    - rebase on top of latest patchset of dependency
    - fix crash when trying to play audio in DP suspend state

changes in v6:
	- rebase on top of latest patchset of dependency

Abhinav Kumar (5):
  drm/msm/dp: store dp_display in the driver data
  drm/msm/dp: add audio support for Display Port on MSM
  drm/msm/dp: add hook_plugged_cb hdmi-codec op for MSM DP driver
  drm/msm/dp: signal the hotplug disconnect in the event handler
  drm/msm/dp: wait for audio notification before disabling clocks

 drivers/gpu/drm/msm/Makefile                |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |   7 +
 drivers/gpu/drm/msm/dp/dp_audio.c           | 638 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_audio.h           |  72 +++
 drivers/gpu/drm/msm/dp/dp_catalog.c         | 192 ++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h         |  29 +
 drivers/gpu/drm/msm/dp/dp_display.c         | 139 ++++-
 drivers/gpu/drm/msm/dp/dp_display.h         |  12 +
 8 files changed, 1076 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

