Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26FC4767EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Dec 2021 03:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbhLPC2I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 21:28:08 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:13656 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229934AbhLPC2H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 21:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1639621687; x=1671157687;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=+NjdKJ3b4NP8VTeVOFrEEKVv2LtypskicY+INiBnbSQ=;
  b=X7F5uhhNDFcSk1wFaSS8Jl7+jEHLMbMo+f9WZBSVTi2/uvwI/kFhgzIR
   sVP+FTflHLa1i5tFvmYUB7OUgEvKHFth6EgRXlp535PTSDaXKzDIjxjAk
   0XDTa1Ur0yBgVpycjN7pNdbSKDNIBOiCsdwYyvKT/umf5TtgXT410JbWx
   8=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Dec 2021 18:28:07 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 18:28:03 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 15 Dec 2021 18:28:02 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 15 Dec 2021 18:28:01 -0800
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>
CC:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <nganji@codeaurora.org>,
        <aravindh@codeaurora.org>, <khsieh@codeaurora.org>,
        <daniel@ffwll.ch>, <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/msm/dpu: add layer mixer register dump to dpu snapshot
Date:   Wed, 15 Dec 2021 18:27:38 -0800
Message-ID: <1639621658-1500-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the missing layer mixer register dump information to
dpu snapshot to assist debugging.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 281c9601..47fe11a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -920,6 +920,11 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->sspp[i].len,
 				dpu_kms->mmio + cat->sspp[i].base, "sspp_%d", i);
 
+	/* dump LM sub-blocks HW regs info */
+	for (i = 0; i < cat->mixer_count; i++)
+		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
+				dpu_kms->mmio + cat->mixer[i].base, "lm_%d", i);
+
 	msm_disp_snapshot_add_block(disp_state, top->hw.length,
 			dpu_kms->mmio + top->hw.blk_off, "top");
 
-- 
2.7.4

