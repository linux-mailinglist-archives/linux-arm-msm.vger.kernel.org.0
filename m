Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50C84555232
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 19:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377357AbiFVRSx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jun 2022 13:18:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377337AbiFVRSu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jun 2022 13:18:50 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E9325C6A
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jun 2022 10:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1655918326; x=1687454326;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MCltD1GuiNBiuU855fvJPvYWGHrZTUCn4ItFS1w1tCA=;
  b=EzTa0lFB7YIIB9JC4/LaXTmGDpHZWNgtEmXLWJyn3iI2LmYkofJ9/KFD
   RvVoYTKetP4XzwVbdHwq9PEdMLahNIU2smfNxws3nzBiM3ydlA7YB3Jo9
   2Hsbz6g+GGfafMIfIjGQlJ8hJj6OfI54MTsclZfFCKpirJOR0TOmkDX9x
   Y=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Jun 2022 10:18:46 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2022 10:18:46 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 10:18:45 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_aravindh@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>
Subject: [PATCH v4 0/4] Expand CRC to support interface blocks
Date:   Wed, 22 Jun 2022 10:18:31 -0700
Message-ID: <20220622171835.7558-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

Changes since V2:
- Separate dpu_hw_util changes into a separate patch
- Revert back to using a static array and define a macro for MAX_CRC_ENTRIES

Changes since V3:
- Move crcs array into block-specific get_crc helper methods
- Rename "enc" source string to "encoder"

Jessica Zhang (4):
  drm/msm/dpu: Move LM CRC code into separate method
  drm/msm/dpu: Move MISR methods to dpu_hw_util
  drm/msm/dpu: Add MISR register support for interface
  drm/msm/dpu: Add interface support for CRC debugfs

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 111 +++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   5 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  64 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  22 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  19 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  42 +-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c |  49 ++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  16 +++
 9 files changed, 269 insertions(+), 67 deletions(-)

-- 
2.35.1

