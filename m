Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2AF43D8F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 03:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhJ1B5d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 21:57:33 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:46679 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229534AbhJ1B5c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 21:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635386106; x=1666922106;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=a5hh0Naa28U3Lq2JXKdxUdPuy4+irXvUZAhbvn2LkY4=;
  b=KxbtAbPBdKEVt1IEPmC/WtgNu+nhzD5fMzyiwLYm+1mcQPq0NvhHTTW3
   ldMaKG1+GXr/niWW6Cvqd8m8kgLH5bOFMlXMFpeavKY5kTYv1llqsRcUs
   Li7A17m+Qaa8Ax2mG2rZ+vhaWSOt+zQX+q3mcSdADSQhxcdHI0UiXH9rH
   s=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Oct 2021 18:55:06 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2021 18:55:05 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 27 Oct 2021 18:55:05 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 27 Oct 2021 18:55:01 -0700
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <kalyan_t@codeaurora.org>,
        <abhinavk@codeaurora.org>, <dianders@chromium.org>,
        <khsieh@codeaurora.org>, <mkrishn@codeaurora.org>,
        <sbillaka@codeaurora.org>
Subject: [PATCH v3 0/6] Add support for eDP controller on SC7280
Date:   Thu, 28 Oct 2021 07:24:42 +0530
Message-ID: <1635386088-18089-1-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

	This series will add eDP controller support for Qualcomm SC7280
platform. These patches are baseline changes with which we can enable
eDP display on sc7280. The sc7280 eDP controller driver can also support
additional features such as no_hpd detection, PSR, etc. which will be
enabled in subsequent patch series.

	This is based on Bjorn's changes in the below mentioned series
to support both eDP and DP programming through the same driver:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=564841

Sankeerth Billakanti (6):
  dt-bindings: msm/dp: Add DP compatible strings for sc7280
  drm/msm/dp: Add DP controllers for sc7280
  drm/dp: Add macro to check max_downspread capability
  drm/msm/dp: Enable downspread for supported DP sinks
  drm/msm/dp: Enable ASSR for supported DP sinks
  drm/msm/dp: Remove the hpd init delay for eDP

 .../bindings/display/msm/dp-controller.yaml        |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  4 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 23 +++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_display.c                | 20 ++++++++++++++++++-
 include/drm/drm_dp_helper.h                        |  6 ++++++
 5 files changed, 49 insertions(+), 6 deletions(-)

-- 
2.7.4

