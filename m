Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F005452B59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 08:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhKPHMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 02:12:23 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:36751 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229979AbhKPHL2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 02:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637046511; x=1668582511;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=lXNfiTYEzKhCuBvK8VyZDcB21itmm3LibWSAK0g5EjY=;
  b=OtuO2rAhTi8Ce+cYI2ODWvdfHboSCe5UjZ9A8hpvTAI87NOAEYbX60T/
   XFK/UykElkw46b5rVOq8/V/XX7/eTIt5IQckLKKaHPUIVj5AW3a+bg/w4
   w9PQZ0Esy3FBmcDC6sZt9C3CRlzQCebtAklSsZAAOGQUcDfTtMOywZoeU
   U=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 15 Nov 2021 23:08:26 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2021 23:08:25 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 15 Nov 2021 23:07:54 -0800
Received: from sbillaka-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 15 Nov 2021 23:07:49 -0800
From:   Sankeerth Billakanti <quic_sbillaka@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_kalyant@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <dianders@chromium.org>,
        <quic_khsieh@quicinc.com>, <quic_mkrishn@quicinc.com>
Subject: [PATCH v1 0/3] Add support for eDP PHY on SC7280 platform
Date:   Tue, 16 Nov 2021 12:37:35 +0530
Message-ID: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This series adds support for the eDP PHY on Qualcomm SC7280 platform.
The changes are dependent on v4 of the new eDP PHY driver introduced by Bjorn:
https://patchwork.kernel.org/project/linux-arm-msm/list/?series=575135

Sankeerth Billakanti (3):
  dt-bindings: phy: Add eDP PHY compatible for sc7280
  phy: qcom: Add support for eDP PHY on sc7280
  phy: qcom: Program SSC only if supported by sink

 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 4 +++-
 drivers/phy/qualcomm/phy-qcom-edp.c                     | 9 ++++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

-- 
2.7.4

