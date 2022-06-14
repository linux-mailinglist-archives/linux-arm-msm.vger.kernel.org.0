Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0672654BCA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jun 2022 23:14:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244679AbiFNVNz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jun 2022 17:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233937AbiFNVNv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jun 2022 17:13:51 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E9F4D63A
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jun 2022 14:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655241230; x=1686777230;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=D30YOo59Lolu2XreNR4NFOlhIsldQjJgePvQV7/JBi8=;
  b=JK8E3w5bCvUhSpZmzKxosZVYN/eLe5uzqmXpA9JEis58un0hzVg8Ri9U
   T4PPxSRD/7TQm5AHQEzDRBeKY69YuxhlIohWVPshiv+FBX7r3UkDDshmj
   YKqa3Rp3BhVo9XBWF1ly/sjI4z1dgiQmWtezQ2ByNfEKTTTAZeqx0TLr9
   s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 14 Jun 2022 14:13:50 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2022 14:13:50 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 14 Jun 2022 14:13:49 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_aravindh@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/3] Expand CRC to support interface blocks
Date:   Tue, 14 Jun 2022 14:13:25 -0700
Message-ID: <20220614211328.216-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Refactor existing CRC code for layer mixer and add CRC support for interface blocks

Changes since V1:
- Create helper methods for collect_misr and setup_misr in dpu_hw_util.c
- Move common bitmasks into dpu_hw_util.h
- Update copyrights
- Create a dynamically allocated crcs array in dpu_crtc_state
- Collect CRCs for all drm_encoders connected to the crtc

Jessica Zhang (3):
  drm/msm/dpu: Move LM CRC code into separate method
  drm/msm/dpu: Add MISR register support for interface
  drm/msm/dpu: Add interface support for CRC debugfs

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 131 +++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   7 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  63 ++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  22 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  19 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  42 +------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  46 ++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  16 +++
 9 files changed, 279 insertions(+), 75 deletions(-)

-- 
2.35.1

