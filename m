Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A019264E54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 21:10:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbgIJTKj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 15:10:39 -0400
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:38526
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726675AbgIJTH3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 15:07:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599764848;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
        bh=5FgjAFBpydifCxVAQzMk72ZA5elnWDUI08cY29Zi11c=;
        b=gy3iGdBDK1ERJf9rP6O8GVED2iaaTsmLpDzIyLkC4GNIMLAcBuef5kNGFhQxnnNl
        rNuqMMhFanWBkC90WiItJzswfklCHSYcZNrn7DUDGCQzFtAkJFBCGDKz7Vm97tKFUEQ
        zXroj5As3GwM5Z3bN8Jp9DHY1JPlDdloiMSg3RJE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599764848;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=5FgjAFBpydifCxVAQzMk72ZA5elnWDUI08cY29Zi11c=;
        b=frSZvJwCWK1IPxksiF0g7gMr1VP5nJMRvfDtwDm6pPZnnl9E3m/fSOI+wzh3n+zn
        kejMEZyAxWxqNJnwMYCSBm2GxAEHDA7G954srJ4olJq+N+BF1xrTOkmSdx02tBWJ594
        xc7oeErn69SZ2s3yZPw05HvmVADK3uXvcAK0sdRk=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0592DC433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        cychiang@chromium.org, khsieh@codeaurora.org,
        vsujithk@codeaurora.org, rohitkr@codeaurora.org
Subject: [PATCH v5 0/5] Add audio support for MSM DisplayPort driver
Date:   Thu, 10 Sep 2020 19:07:28 +0000
Message-ID: <01010174796a5f99-0f99a33a-f816-4336-9ff9-5d39b893d3c6-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.09.10-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds audio support for DP on MSM chipsets. It leverages
the hdmi-codec interface [1] to communicate between the Display Port
driver and the audio subsystem. These changes depend on the series [2]
which adds Display Port support to MSM chipsets.

[1] https://patchwork.kernel.org/project/dri-devel/list/?series=339847
[2] https://patchwork.kernel.org/project/dri-devel/list/?series=346391


changes in v2:
    - fix up a compilation issue on drm-next branch

changes in v3:
    - add support to synchronize DP driver and audio during shutdown

changes in v4:
    - rebase on top of latest patchset of dependency

changes in v5:
    - rebase on top of latest patchset of dependency
	- fix crash when trying to play audio in DP suspend state

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
 drivers/gpu/drm/msm/dp/dp_display.c         | 138 ++++-
 drivers/gpu/drm/msm/dp/dp_display.h         |  12 +
 8 files changed, 1075 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_audio.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

