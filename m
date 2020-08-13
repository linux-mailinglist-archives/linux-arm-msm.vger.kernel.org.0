Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCBC243250
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 03:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgHMBzy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 21:55:54 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:33516 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726574AbgHMBzy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 21:55:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597283754; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=FVbzabU1TSlGFSA9oFBmqr0GMmd/zQHCX4wJhSe4MY0=; b=KDynTBS5u4eRuALa9rwZ98yYr5UmSzrrOtDllD3KHNHQ4reeAiib+/11gp9DcPEu/QxsckX7
 vSrtOtuMOdNVdFTAQQykbjQm3En6dXi0mssN3HPDYGQoBrEFtqGjokdk98ZPWDVPHXuoZV+H
 vAcqB7JZn5SU4xNkP3Df6HANrJM=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5f349d6ad96d28d61e390d54 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 Aug 2020 01:54:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8740DC43391; Thu, 13 Aug 2020 01:54:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 81046C433C9;
        Thu, 13 Aug 2020 01:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 81046C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        cychiang@chromium.org, khsieh@codeaurora.org,
        vsujithk@codeaurora.org, rohitkr@codeaurora.org
Subject: [PATCH 0/4] Add audio support for MSM DisplayPort driver
Date:   Wed, 12 Aug 2020 18:54:35 -0700
Message-Id: <20200813015439.4174-1-abhinavk@codeaurora.org>
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
which adds Display Port support to MSM chipsets.

[1] https://patchwork.kernel.org/patch/11047883/
[2] https://patchwork.kernel.org/patch/11708677/

Abhinav Kumar (4):
  drm/msm/dp: store dp_display in the driver data
  drm/msm/dp: add audio support for Display Port on MSM
  drm/msm/dp: add hook_plugged_cb hdmi-codec op for MSM DP driver
  drm/msm/dp: signal the hotplug disconnect in the event handler

 drivers/gpu/drm/msm/Makefile                |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |   6 +
 drivers/gpu/drm/msm/dp/dp_audio.c           | 606 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_audio.h           |  72 +++
 drivers/gpu/drm/msm/dp/dp_catalog.c         | 192 +++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h         |  29 +
 drivers/gpu/drm/msm/dp/dp_display.c         |  98 +++-
 drivers/gpu/drm/msm/dp/dp_display.h         |   9 +
 8 files changed, 1004 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

