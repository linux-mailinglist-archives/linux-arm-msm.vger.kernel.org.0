Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30FDB536728
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 May 2022 20:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234223AbiE0Syc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 May 2022 14:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344367AbiE0Sy3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 May 2022 14:54:29 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C794C78F
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 May 2022 11:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1653677668; x=1685213668;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AntRebEHO2QXwXqacg8Qi8Pr5uztpIkYtQzBGp8BPug=;
  b=TBLM1ObPB4BjqOxmLTp4JdGLKnY4rArJzgkreEorPtHZcTgT8XvK2YFp
   Xfk1mVS/VpMd6tgrzFvYRx+/3QTDB3Z9si1rt4UoCjUNywOH752pobqVv
   W/tR7G28bnQOmVIBJ3sEZFypLNKUYHdaWjyIHPYWeO6R9c9oky6aU1iFv
   Y=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 27 May 2022 11:54:28 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 11:54:28 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 27 May 2022 11:54:27 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_aravindh@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/3] Expand CRC to support interface blocks
Date:   Fri, 27 May 2022 11:54:04 -0700
Message-ID: <20220527185407.162-1-quic_jesszhan@quicinc.com>
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

Jessica Zhang (3):
  drm/msm/dpu: Separate LM-specific CRC code from generic CRC code
  drm/msm/dpu: Add MISR register support for interface
  drm/msm/dpu: Add interface support for CRC debugfs

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 115 +++++++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  61 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  22 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  55 +++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |   8 +-
 6 files changed, 233 insertions(+), 31 deletions(-)

-- 
2.35.1

