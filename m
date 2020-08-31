Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB90C2580FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Aug 2020 20:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729712AbgHaSXU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Aug 2020 14:23:20 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:19585 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728573AbgHaSXP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Aug 2020 14:23:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598898195; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=qOLfG/K2aSxnZgBBMiIsxdb+arzei4ocI77Yc/EOfck=; b=j7S7G0oASFce+QjKClsiUb4wFqgRoV/39GA7nsDhTbSzStL37YWEcWe6sSQyq2P/DpPMGzNs
 3ww1vptq5pQr+DABDEeHkB8+H7OjrFsW4GkJ5uMl05oZkahp0M/Ld9NnlHGitVxUGs6olTKA
 p1d1CI1ZYo12eKYvc2EQsUN2fTQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f4d400dba408b30ce666edb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 Aug 2020 18:23:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 47E1AC4339C; Mon, 31 Aug 2020 18:23:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3F3E8C433C6;
        Mon, 31 Aug 2020 18:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3F3E8C433C6
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
Subject: [PATCH v4 0/5] add audio support for Display Port on MSM
Date:   Mon, 31 Aug 2020 11:22:53 -0700
Message-Id: <20200831182258.16632-1-abhinavk@codeaurora.org>
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

changes in v2:
    - fix up a compilation issue on drm-next branch

changes in v3:
    - add support to synchronize DP driver and audio during shutdown

changes in v4:
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
 drivers/gpu/drm/msm/dp/dp_display.c         | 127 +++-
 drivers/gpu/drm/msm/dp/dp_display.h         |  11 +
 8 files changed, 1067 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

