Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E9834AA214
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 22:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244022AbiBDVS7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 16:18:59 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:11351 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243847AbiBDVSH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 16:18:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644009488; x=1675545488;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=iSjFnXW/40308DRR3ZLcydXqDDWvo3I9upgYQFfAdes=;
  b=ks5R/6w8zjNX5EoFIFVMkqQQ+c/tJnNkLXj3s+se9k+ojn652OvZ7Jhx
   SLcm7kPmzFFJA8bt9luP3nSyVIRL7TVF8Xfs7mP6Iqgg+92bcv8870TOB
   9z6RfUm0UTLhJxqlR6/mbutSjHfC7DoTrOeG3Lxs1I+uuq4hZvBdKacSY
   8=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 04 Feb 2022 13:18:07 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 13:18:07 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:18:06 -0800
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 4 Feb 2022 13:18:06 -0800
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>
CC:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <swboyd@chromium.org>, <nganji@codeaurora.org>,
        <aravindh@codeaurora.org>, <daniel@ffwll.ch>,
        <dmitry.baryshkov@linaro.org>, <markyacoub@chromium.org>,
        <quic_jesszhan@quicinc.com>
Subject: [PATCH 12/12] drm/msm/dpu: add writeback blocks to the display snapshot
Date:   Fri, 4 Feb 2022 13:17:25 -0800
Message-ID: <1644009445-17320-13-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
References: <1644009445-17320-1-git-send-email-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add writeback block information while capturing the display
snapshot.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 6327ba9..e227b35 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -987,6 +987,11 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 		msm_disp_snapshot_add_block(disp_state, cat->mixer[i].len,
 				dpu_kms->mmio + cat->mixer[i].base, "lm_%d", i);
 
+	/* dump WB sub-blocks HW regs info */
+	for (i = 0; i < cat->wb_count; i++)
+		msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
+				dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
+
 	msm_disp_snapshot_add_block(disp_state, top->hw.length,
 			dpu_kms->mmio + top->hw.blk_off, "top");
 
-- 
2.7.4

