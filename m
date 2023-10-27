Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7607F7DA36E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Oct 2023 00:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235062AbjJ0WeC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Oct 2023 18:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346656AbjJ0Wd7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Oct 2023 18:33:59 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1CA8AF;
        Fri, 27 Oct 2023 15:33:56 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39RL4mZL014013;
        Fri, 27 Oct 2023 22:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=mVrUtQuXAd5Q8+0WjRK7F4ZKYAmmJoDZ0a4u86thmX0=;
 b=fuiNNtqHSjGgJsdY9jdkmjhZkMoiYKxM+b+bWrGyXqHwSihb7x1TXhJfuOj7LsAmivAX
 GCh3GZNd58PtCMwTl2UtoXfemcdzYqu+RZ4wYgLC5ctXkqjXiSmutG+geTHRZ49eoFcV
 ifKIpEYJ0IAqzppJOAsKi7Xlv2GxhKzlGSmnRuMAAVsLDXcdOrbbP7Qw3UVnqBHmai3P
 gFuNMWnSHrurGia1IAZ8pkVorU6CD9dKNt/R25g5UeqKuFZJZS6qKBoa3nakTuWJSvjX
 Hg+LASugyRYMeiUm92o6r6hDyKG2tzXu8JUdeS+VUMFRKtYpspQjird97azC6GmOgCdU pw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tywvtb8tk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Oct 2023 22:33:28 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39RMXR0Z022597
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 27 Oct 2023 22:33:27 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 27 Oct 2023 15:33:26 -0700
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
Date:   Fri, 27 Oct 2023 15:32:53 -0700
Subject: [PATCH RFC v7 03/10] drm: Add solid fill pixel source
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231027-solid-fill-v7-3-780188bfa7b2@quicinc.com>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
In-Reply-To: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
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
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sebastian Wick <sebastian@sebastianwick.net>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13-dev-26615
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698446005; l=2516;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=ushag3M8DOslcaFX+YE/1Jk9dkN0/bW18sJo+IsbXuA=;
 b=YapEWvqTmv0SoxKV9lHdl21T6yLsh3y78gOuURKWPvxA1LVFv3axzFai8vNb0DO5th4+eHSsG
 LCo+RSU+nWvBiGeF74td72Xx9SnkOQj0nAQ9IjI77aIcdwxYveBxWFB
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NP6ahAw9T7f3G4D4YHCPHngzd9H0tuG5
X-Proofpoint-ORIG-GUID: NP6ahAw9T7f3G4D4YHCPHngzd9H0tuG5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_21,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=853 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310270193
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add "SOLID_FILL" as a valid pixel source. If the pixel_source property is
set to "SOLID_FILL", it will display data from the drm_plane "solid_fill"
blob property.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Acked-by: Harry Wentland <harry.wentland@amd.com>
Acked-by: Sebastian Wick <sebastian@sebastianwick.net>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/drm_blend.c | 10 +++++++++-
 include/drm/drm_plane.h     |  1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 665c5d9b056f..37b31b7e5ce5 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -204,6 +204,9 @@
  *	"FB":
  *		Framebuffer source set by the "FB_ID" property.
  *
+ *	"SOLID_FILL":
+ *		Solid fill color source set by the "solid_fill" property.
+ *
  * solid_fill:
  *	solid_fill is set up with drm_plane_create_solid_fill_property(). It
  *	contains pixel data that drivers can use to fill a plane.
@@ -642,6 +645,7 @@ EXPORT_SYMBOL(drm_plane_create_blend_mode_property);
 static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
 	{ DRM_PLANE_PIXEL_SOURCE_NONE, "NONE" },
 	{ DRM_PLANE_PIXEL_SOURCE_FB, "FB" },
+	{ DRM_PLANE_PIXEL_SOURCE_SOLID_FILL, "SOLID_FILL" },
 };
 
 /**
@@ -666,6 +670,9 @@ static const struct drm_prop_enum_list drm_pixel_source_enum_list[] = {
  * "FB":
  *	Framebuffer pixel source
  *
+ * "SOLID_FILL":
+ * 	Solid fill color pixel source
+ *
  * Returns:
  * Zero on success, negative errno on failure.
  */
@@ -675,7 +682,8 @@ int drm_plane_create_pixel_source_property(struct drm_plane *plane,
 	struct drm_device *dev = plane->dev;
 	struct drm_property *prop;
 	static const unsigned int valid_source_mask = BIT(DRM_PLANE_PIXEL_SOURCE_FB) |
-						      BIT(DRM_PLANE_PIXEL_SOURCE_NONE);
+						      BIT(DRM_PLANE_PIXEL_SOURCE_NONE) |
+						      BIT(DRM_PLANE_PIXEL_SOURCE_SOLID_FILL);
 	int i;
 
 	/* FB is supported by default */
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index e2ae7c26cc57..baaf737392bc 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -43,6 +43,7 @@ enum drm_scaling_filter {
 enum drm_plane_pixel_source {
 	DRM_PLANE_PIXEL_SOURCE_NONE,
 	DRM_PLANE_PIXEL_SOURCE_FB,
+	DRM_PLANE_PIXEL_SOURCE_SOLID_FILL,
 	DRM_PLANE_PIXEL_SOURCE_MAX
 };
 

-- 
2.42.0

