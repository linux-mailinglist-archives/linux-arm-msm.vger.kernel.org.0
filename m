Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39D32694412
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 12:12:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjBMLMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 06:12:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbjBMLMx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 06:12:53 -0500
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BA47193D5;
        Mon, 13 Feb 2023 03:12:22 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31DAJCj8022820;
        Mon, 13 Feb 2023 11:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=bGXOI4SdGQN5cVzXB4ivGpckq0FRCIM7i3AruIy65tQ=;
 b=STxB21T0NVAu8EZ4oU0Bhu2pK/+qXVOjRU785OrAdPByPGGn2iuhvs+W7WJIEJ5uNZSL
 7BkGbjtL3dohzuujhf7D1+pkPXql6jrx6yqH4fwA9Ev+M10u1SVX5SxRnTQpPiHPpsFw
 NgQ3/cX/uZvCIg1JG4MrJDS/QSsuTdDQvFwX413lSXYxGfJbeQwlLxEDeLc2izaZUWkf
 jsHvJ0l7QRME8lMDR23MIQQtwUypQg5YUWTOoGWi7uZ5O4XbYCXJgNiiPjG93Nvy88ot
 fOj7kXZaWfsDz09PpfavVjvXujtUCVO+Is+h2skExq9zIAk2vFzBhSMBPmajjLZTWhw9 bw== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3np46vkqhn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 13 Feb 2023 11:11:54 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 31DBBnd6018456;
        Mon, 13 Feb 2023 11:11:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3np43k9ktc-1;
        Mon, 13 Feb 2023 11:11:49 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31DBBnRS018426;
        Mon, 13 Feb 2023 11:11:49 GMT
Received: from kalyant-linux.qualcomm.com (kalyant-linux.qualcomm.com [10.204.66.210])
        by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 31DBBnwB018418;
        Mon, 13 Feb 2023 11:11:49 +0000
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
        id 90A6C4C0A; Mon, 13 Feb 2023 03:11:48 -0800 (PST)
From:   Kalyan Thota <quic_kalyant@quicinc.com>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Kalyan Thota <quic_kalyant@quicinc.com>,
        linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com, marijn.suijten@somainline.org
Subject: [PATCH v4 4/4] drm/msm/dpu: manage DPU resources if CTM is requested
Date:   Mon, 13 Feb 2023 03:11:44 -0800
Message-Id: <1676286704-818-5-git-send-email-quic_kalyant@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
References: <1676286704-818-1-git-send-email-quic_kalyant@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: C2BDSiDV4BDEwB5wI3bIk8aZC4w-tsev
X-Proofpoint-GUID: C2BDSiDV4BDEwB5wI3bIk8aZC4w-tsev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-13_06,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=899
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302130101
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow modeset to be triggered during CTM enable/disable.
In the modeset callbacks, DPU resources required for the
CTM feature are managed appropriately.

Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c    |  2 +-
 drivers/gpu/drm/msm/msm_drv.h    |  1 +
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 1686fbb..e3e607c 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -179,6 +179,24 @@ static unsigned get_crtc_mask(struct drm_atomic_state *state)
 	return mask;
 }
 
+int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
+	struct drm_crtc *crtc;
+	int i;
+
+	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
+				      new_crtc_state, i) {
+		if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
+		    (!old_crtc_state->ctm && new_crtc_state->ctm)) {
+			new_crtc_state->mode_changed = true;
+			state->allow_modeset = true;
+		}
+	}
+
+	return drm_atomic_helper_check(dev, state);
+}
+
 void msm_atomic_commit_tail(struct drm_atomic_state *state)
 {
 	struct drm_device *dev = state->dev;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 0759e2d..3221284 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -52,7 +52,7 @@
 static const struct drm_mode_config_funcs mode_config_funcs = {
 	.fb_create = msm_framebuffer_create,
 	.output_poll_changed = drm_fb_helper_output_poll_changed,
-	.atomic_check = drm_atomic_helper_check,
+	.atomic_check = msm_atomic_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index ea80846..7d0243a 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -209,6 +209,7 @@ int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
 		struct msm_kms *kms, int crtc_idx);
 void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer);
 void msm_atomic_commit_tail(struct drm_atomic_state *state);
+int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state);
 struct drm_atomic_state *msm_atomic_state_alloc(struct drm_device *dev);
 void msm_atomic_state_clear(struct drm_atomic_state *state);
 void msm_atomic_state_free(struct drm_atomic_state *state);
-- 
2.7.4

