Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E322F515963
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 02:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238513AbiD3Am7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 20:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235155AbiD3Am6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 20:42:58 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E60A88A4
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 17:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651279178; x=1682815178;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OHiepLo8OO1OvG2ptdYNrJkuU7kL1sx7RG1XDyz4kYw=;
  b=Gx4GA78uZ78rI6cZSx1Ntu71z5tP1vZ3EQI3mK5Y3svQ537EcI4RD91k
   myogxxcWhj9it1PLww3VBzIjASebO97sfgYzQIVOUEnKj7f1vDzb3L22/
   RpCKMpHKaRYBlu6GX7JLRap6E87rOhXE5enssD8IZ6fiP48efrwWtwpm1
   0=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 29 Apr 2022 17:39:38 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2022 17:39:38 -0700
Received: from JESSZHAN.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 29 Apr 2022 17:39:38 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
To:     <freedreno@lists.freedesktop.org>
CC:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <quic_aravindh@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm/dpu: Clean up CRC debug logs
Date:   Fri, 29 Apr 2022 17:39:17 -0700
Message-ID: <20220430003917.132-1-quic_jesszhan@quicinc.com>
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

Currently, dpu_hw_lm_collect_misr returns EINVAL if CRC is disabled.
This causes a lot of spam in the DRM debug logs as it's called for every
vblank.

Instead of returning EINVAL when CRC is disabled in
dpu_hw_lm_collect_misr, let's return ENODATA and add an extra ENODATA check
before the debug log in dpu_crtc_get_crc.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # RB5  (qrb5165)
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7763558ef566..16ba9f9b9a78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -204,7 +204,8 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
 		rc = m->hw_lm->ops.collect_misr(m->hw_lm, &crcs[i]);
 
 		if (rc) {
-			DRM_DEBUG_DRIVER("MISR read failed\n");
+			if (rc != -ENODATA)
+				DRM_DEBUG_DRIVER("MISR read failed\n");
 			return rc;
 		}
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 86363c0ec834..462f5082099e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -138,7 +138,7 @@ static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
 	ctrl = DPU_REG_READ(c, LM_MISR_CTRL);
 
 	if (!(ctrl & LM_MISR_CTRL_ENABLE))
-		return -EINVAL;
+		return -ENODATA;
 
 	if (!(ctrl & LM_MISR_CTRL_STATUS))
 		return -EINVAL;
-- 
2.35.1

