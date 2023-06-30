Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98BDB7431A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 02:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbjF3A0N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 20:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231366AbjF3A0I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 20:26:08 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D222D7F;
        Thu, 29 Jun 2023 17:26:05 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35U0LvfO014333;
        Fri, 30 Jun 2023 00:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=XXLfCZ+/coljOd767Yu1U/82Utkwak08vsIAGzwsl4Y=;
 b=HsXXOqTZKJFti9E4xG2t3aIgPjseNyBwjCIPfKv4p4cSDlj5SFKCDhre5Hsclm1jc7ZE
 OBSwn6AQVCHz2RltxRS3X4cWwKppgyn3PT6JAXoWei5nX4zNtNO7FSWgbs3Yizng0zSX
 f2OdPzqovo5QAQX8Vq8aD7VuMOscb+EZpAMo52uIJnKmw15oWRPj5A0I5Se93CaNtg6Q
 8ws5iwJvioxLK3aWo8DAkP4zz81+hb1C5Gm2aZ+vyktlSZ6znnmQ3KW1zb8ZPyP2yV44
 u4Ew0idnciO6uVVbSfRFYihxIpEI0hPqdV4BJUT6kVaEG9c2MsuGXGPdD+L6zExpUeqK lA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rhamwh9kx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jun 2023 00:25:38 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35U0Pb1A023849
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 30 Jun 2023 00:25:37 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 29 Jun 2023 17:25:36 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Thu, 29 Jun 2023 17:25:02 -0700
Subject: [PATCH RFC v4 3/7] drm/atomic: Move framebuffer checks to helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230404-solid-fill-v4-3-f4ec0caa742d@quicinc.com>
References: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
In-Reply-To: <20230404-solid-fill-v4-0-f4ec0caa742d@quicinc.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC:     <quic_abhinavk@quicinc.com>, <ppaalanen@gmail.com>,
        <contact@emersion.fr>, <laurent.pinchart@ideasonboard.com>,
        <sebastian.wick@redhat.com>, <ville.syrjala@linux.intel.com>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <wayland-devel@lists.freedesktop.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-c6835
X-Developer-Signature: v=1; a=ed25519-sha256; t=1688084735; l=6052;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=BcSo685sQKfwVoCIomIxA0J4WZ8sYPtCL7L0JhaVEDs=;
 b=lo/7lNoR6ebqrWBJPp8RLqiQvE29diZ/DaVRIpjogsM13GK1wo6HSadhpTxN+BkZe8jUJ+k33
 7GOYmV2phNzBh9bajxbq7SWP95RWZPLz6bJL7aITb5ECdKs6DNEeDcG
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: k8NGDY62fr3jskx97NAjfu5yWxOwJka4
X-Proofpoint-GUID: k8NGDY62fr3jskx97NAjfu5yWxOwJka4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_10,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=722 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300001
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently framebuffer checks happen directly in
drm_atomic_plane_check(). Move these checks into their own helper
method.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_atomic.c | 130 ++++++++++++++++++++++++-------------------
 1 file changed, 74 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index b4c6ffc438da..404b984d2d9f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -580,6 +580,76 @@ plane_switching_crtc(const struct drm_plane_state *old_plane_state,
 	return true;
 }
 
+static int drm_atomic_check_fb(const struct drm_plane_state *state)
+{
+	struct drm_plane *plane = state->plane;
+	const struct drm_framebuffer *fb = state->fb;
+	struct drm_mode_rect *clips;
+
+	uint32_t num_clips;
+	unsigned int fb_width, fb_height;
+	int ret;
+
+	/* Check whether this plane supports the fb pixel format. */
+	ret = drm_plane_check_pixel_format(plane, fb->format->format,
+					   fb->modifier);
+
+	if (ret) {
+		drm_dbg_atomic(plane->dev,
+			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
+			       plane->base.id, plane->name,
+			       &fb->format->format, fb->modifier);
+		return ret;
+	}
+
+	fb_width = fb->width << 16;
+	fb_height = fb->height << 16;
+
+	/* Make sure source coordinates are inside the fb. */
+	if (state->src_w > fb_width ||
+	    state->src_x > fb_width - state->src_w ||
+	    state->src_h > fb_height ||
+	    state->src_y > fb_height - state->src_h) {
+		drm_dbg_atomic(plane->dev,
+			       "[PLANE:%d:%s] invalid source coordinates "
+			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
+			       plane->base.id, plane->name,
+			       state->src_w >> 16,
+			       ((state->src_w & 0xffff) * 15625) >> 10,
+			       state->src_h >> 16,
+			       ((state->src_h & 0xffff) * 15625) >> 10,
+			       state->src_x >> 16,
+			       ((state->src_x & 0xffff) * 15625) >> 10,
+			       state->src_y >> 16,
+			       ((state->src_y & 0xffff) * 15625) >> 10,
+			       fb->width, fb->height);
+		return -ENOSPC;
+	}
+
+	clips = __drm_plane_get_damage_clips(state);
+	num_clips = drm_plane_get_damage_clips_count(state);
+
+	/* Make sure damage clips are valid and inside the fb. */
+	while (num_clips > 0) {
+		if (clips->x1 >= clips->x2 ||
+		    clips->y1 >= clips->y2 ||
+		    clips->x1 < 0 ||
+		    clips->y1 < 0 ||
+		    clips->x2 > fb_width ||
+		    clips->y2 > fb_height) {
+			drm_dbg_atomic(plane->dev,
+				       "[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
+				       plane->base.id, plane->name, clips->x1,
+				       clips->y1, clips->x2, clips->y2);
+			return -EINVAL;
+		}
+		clips++;
+		num_clips--;
+	}
+
+	return 0;
+}
+
 /**
  * drm_atomic_plane_check - check plane state
  * @old_plane_state: old plane state to check
@@ -596,9 +666,6 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 	struct drm_plane *plane = new_plane_state->plane;
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	const struct drm_framebuffer *fb = new_plane_state->fb;
-	unsigned int fb_width, fb_height;
-	struct drm_mode_rect *clips;
-	uint32_t num_clips;
 	int ret;
 
 	/* either *both* CRTC and FB must be set, or neither */
@@ -625,17 +692,6 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 		return -EINVAL;
 	}
 
-	/* Check whether this plane supports the fb pixel format. */
-	ret = drm_plane_check_pixel_format(plane, fb->format->format,
-					   fb->modifier);
-	if (ret) {
-		drm_dbg_atomic(plane->dev,
-			       "[PLANE:%d:%s] invalid pixel format %p4cc, modifier 0x%llx\n",
-			       plane->base.id, plane->name,
-			       &fb->format->format, fb->modifier);
-		return ret;
-	}
-
 	/* Give drivers some help against integer overflows */
 	if (new_plane_state->crtc_w > INT_MAX ||
 	    new_plane_state->crtc_x > INT_MAX - (int32_t) new_plane_state->crtc_w ||
@@ -649,49 +705,11 @@ static int drm_atomic_plane_check(const struct drm_plane_state *old_plane_state,
 		return -ERANGE;
 	}
 
-	fb_width = fb->width << 16;
-	fb_height = fb->height << 16;
 
-	/* Make sure source coordinates are inside the fb. */
-	if (new_plane_state->src_w > fb_width ||
-	    new_plane_state->src_x > fb_width - new_plane_state->src_w ||
-	    new_plane_state->src_h > fb_height ||
-	    new_plane_state->src_y > fb_height - new_plane_state->src_h) {
-		drm_dbg_atomic(plane->dev,
-			       "[PLANE:%d:%s] invalid source coordinates "
-			       "%u.%06ux%u.%06u+%u.%06u+%u.%06u (fb %ux%u)\n",
-			       plane->base.id, plane->name,
-			       new_plane_state->src_w >> 16,
-			       ((new_plane_state->src_w & 0xffff) * 15625) >> 10,
-			       new_plane_state->src_h >> 16,
-			       ((new_plane_state->src_h & 0xffff) * 15625) >> 10,
-			       new_plane_state->src_x >> 16,
-			       ((new_plane_state->src_x & 0xffff) * 15625) >> 10,
-			       new_plane_state->src_y >> 16,
-			       ((new_plane_state->src_y & 0xffff) * 15625) >> 10,
-			       fb->width, fb->height);
-		return -ENOSPC;
-	}
-
-	clips = __drm_plane_get_damage_clips(new_plane_state);
-	num_clips = drm_plane_get_damage_clips_count(new_plane_state);
-
-	/* Make sure damage clips are valid and inside the fb. */
-	while (num_clips > 0) {
-		if (clips->x1 >= clips->x2 ||
-		    clips->y1 >= clips->y2 ||
-		    clips->x1 < 0 ||
-		    clips->y1 < 0 ||
-		    clips->x2 > fb_width ||
-		    clips->y2 > fb_height) {
-			drm_dbg_atomic(plane->dev,
-				       "[PLANE:%d:%s] invalid damage clip %d %d %d %d\n",
-				       plane->base.id, plane->name, clips->x1,
-				       clips->y1, clips->x2, clips->y2);
-			return -EINVAL;
-		}
-		clips++;
-		num_clips--;
+	if (fb) {
+		ret = drm_atomic_check_fb(new_plane_state);
+		if (ret)
+			return ret;
 	}
 
 	if (plane_switching_crtc(old_plane_state, new_plane_state)) {

-- 
2.41.0

