Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 279464428D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 08:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhKBHvr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 03:51:47 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:35693 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229505AbhKBHvr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 03:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1635839353; x=1667375353;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=ACJNqGHt3cpapSBqik2oM0AjcgSHSZ3LqelPF8zK9+g=;
  b=BUyulvYi1TYraZqxr1hHxfI1PunrVKBc0r4IO+p7J77kX6UguiLlUb/a
   4ZxqLSaCr4+h+UuAIqVLKEHDFZOvTSnACI6j/qyJGlhzbQ4HiYpzAe4/o
   OrUbEvESMk5+M1Ge+A8QCsVpbcosFXAo8rr0qDQRJpVCfekQQjQwNuQY9
   g=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Nov 2021 00:49:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2021 00:49:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 2 Nov 2021 00:49:12 -0700
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 2 Nov 2021 00:49:08 -0700
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_kalyant@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <dianders@chromium.org>,
        <quic_khsieh@quicinc.com>, <quic_mkrishn@quicinc.com>
Subject: [PATCH v4 0/5] Add support for eDP controller on SC7280
Date:   Tue, 2 Nov 2021 13:18:40 +0530
Message-ID: <1635839325-401-1-git-send-email-quic_sbillaka@quicinc.com>
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

Sankeerth Billakanti (5):
  dt-bindings: msm/dp: Add DP compatible strings for sc7280
  drm/msm/dp: Add DP controllers for sc7280
  drm/dp: Add macro to check max_downspread capability
  drm/msm/dp: Enable downspread for supported DP sinks
  drm/msm/dp: Enable ASSR for supported DP sinks

 .../bindings/display/msm/dp-controller.yaml        |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  4 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 23 +++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_display.c                |  9 +++++++++
 include/drm/drm_dp_helper.h                        |  7 +++++++
 5 files changed, 40 insertions(+), 5 deletions(-)

-- 
2.7.4

