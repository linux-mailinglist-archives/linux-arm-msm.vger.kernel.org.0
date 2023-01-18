Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA406710F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 03:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjARCPD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 21:15:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjARCOy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 21:14:54 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C6C2C646
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 18:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1674008094; x=1705544094;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VQCWwzu2fFQESgyXoTTb+vl+pl2zIBlhTZ/myllxVeI=;
  b=Z6LlxjECih/gPBd8OhJMQVy15qkWtRY8VwTs6NP7gMaMBaKRQSX2cmWO
   ofuhXQXJvU7vqQXHBvSRY3TnR3Es2G3EIGG0ncsDufsLfdKdA+ZY+Sp7g
   ZKUBsPLvTZxKN/8K7GUfgQjVN1v684edHIyp2pMtMMB2HuatEFJKRMkqd
   I=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 17 Jan 2023 18:14:53 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 18:14:53 -0800
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Tue, 17 Jan 2023 18:14:53 -0800
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, <quic_kalyant@quicinc.com>
Subject: [PATCH] drm/msm/dpu: Reapply CTM if modeset is needed
Date:   Tue, 17 Jan 2023 18:14:41 -0800
Message-ID: <20230118021441.161-1-quic_jesszhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a !drm_atomic_crtc_needs_modeset() check to
_dpu_crtc_setup_cp_blocks() so that CTM is reapplied after a
suspend/resume.

Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/23
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 13ce321283ff..aa120a230222 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -748,7 +748,7 @@ static void _dpu_crtc_setup_cp_blocks(struct drm_crtc *crtc)
 	int i;
 
 
-	if (!state->color_mgmt_changed)
+	if (!state->color_mgmt_changed && !drm_atomic_crtc_needs_modeset(state))
 		return;
 
 	for (i = 0; i < cstate->num_mixers; i++) {
-- 
2.39.0

