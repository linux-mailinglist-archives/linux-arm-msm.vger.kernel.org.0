Return-Path: <linux-arm-msm+bounces-2789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 296008000D3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 02:09:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81FDDB20EEB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 01:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2411215C3;
	Fri,  1 Dec 2023 01:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QUr8KDWx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 052E710C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Nov 2023 17:08:59 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B10rAQ0013287;
	Fri, 1 Dec 2023 01:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=tt3SmyTSFSg+lsZiAHM35OKzOaIZywdXEO8pyCPkSJU=;
 b=QUr8KDWxqn1ck3HN1eMpRYnwnxRCDwaVAhn05WJCWHegUGxb434Mli8ZCPvnKMzB/KkI
 qDy5HAYjLefN6oe5Ey31gWL8dcXsOk5ZIvG3GCRWBorWVJ8ZzBhB1VATyrptmKc3FD1+
 nTOuP5Q3GdSffplb039xqOAeXMoxAnes1Qn0GZTZat7gYd6pKmkBCKPPUOBDSxePHHBf
 Bzn5wAwhkvJQtmrobbBuAfDmAnJRBa5f1y/qo6B9fc/e9MQxJkFd2YhQ3JgluGk7yVb2
 xS3LtFm91k70HW5ZS/WGy5OAo2bWKArVykEVhx7OSpxwo1BQi1/6+N6foatd5vBNboUh 9Q== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3upv481hbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 01:08:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B118LaZ014779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 01:08:21 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 30 Nov 2023 17:08:21 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <marijn.suijten@somainline.org>,
        <steev@kali.org>
Subject: [PATCH 2/2] drm/msm/dpu: Add mutex lock in control vblank irq
Date: Thu, 30 Nov 2023 17:07:54 -0800
Message-ID: <20231201010758.1703-3-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231201010758.1703-1-quic_parellan@quicinc.com>
References: <20231201010758.1703-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wZR-n7SqWwIFr_b4PZysWgiiRshPbEoN
X-Proofpoint-ORIG-GUID: wZR-n7SqWwIFr_b4PZysWgiiRshPbEoN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_25,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=740
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312010006

To add a missing mutex lock to control vblank irq. To prevent race
conditions when registering/unregistering the irq callback.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 6 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 ++
 4 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1cf7ff6caff4e..19ff7d1d5ccad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -119,6 +119,8 @@ enum dpu_enc_rc_states {
  *	Virtual encoder defers as much as possible to the physical encoders.
  *	Virtual encoder registers itself with the DRM Framework as the encoder.
  * @base:		drm_encoder base class for registration with DRM
+ * @vblank_ctl_lock:	Vblank ctl mutex lock to protect physical encoder
+ * 						for IRQ purposes
  * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
  * @enabled:		True if the encoder is active, protected by enc_lock
  * @num_phys_encs:	Actual number of physical encoders contained.
@@ -166,6 +168,7 @@ enum dpu_enc_rc_states {
  */
 struct dpu_encoder_virt {
 	struct drm_encoder base;
+	struct mutex vblank_ctl_lock;
 	spinlock_t enc_spinlock;
 
 	bool enabled;
@@ -2255,6 +2258,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 	phys_params.dpu_kms = dpu_kms;
 	phys_params.parent = &dpu_enc->base;
 	phys_params.enc_spinlock = &dpu_enc->enc_spinlock;
+	phys_params.vblank_ctl_lock = &dpu_enc->vblank_ctl_lock;
 
 	WARN_ON(disp_info->num_of_h_tiles < 1);
 
@@ -2386,6 +2390,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	dpu_enc->enabled = false;
 	mutex_init(&dpu_enc->enc_lock);
 	mutex_init(&dpu_enc->rc_lock);
+	mutex_init(&dpu_enc->vblank_ctl_lock);
 
 	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
 	if (ret)
@@ -2495,6 +2500,7 @@ void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
 	phys_enc->dpu_kms = p->dpu_kms;
 	phys_enc->split_role = p->split_role;
 	phys_enc->enc_spinlock = p->enc_spinlock;
+	phys_enc->vblank_ctl_lock = p->vblank_ctl_lock;
 	phys_enc->enable_state = DPU_ENC_DISABLED;
 
 	atomic_set(&phys_enc->vblank_refcount, 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 6f04c3d56e77c..5691bf6b82ee6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -155,6 +155,8 @@ enum dpu_intr_idx {
  * @hw_wb:		Hardware interface to the wb registers
  * @dpu_kms:		Pointer to the dpu_kms top level
  * @cached_mode:	DRM mode cached at mode_set time, acted on in enable
+ * @vblank_ctl_lock:	Vblank ctl mutex lock to protect physical encoder
+ * 						for IRQ purposes
  * @enabled:		Whether the encoder has enabled and running a mode
  * @split_role:		Role to play in a split-panel configuration
  * @intf_mode:		Interface mode
@@ -183,6 +185,7 @@ struct dpu_encoder_phys {
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_kms *dpu_kms;
 	struct drm_display_mode cached_mode;
+	struct mutex *vblank_ctl_lock;
 	enum dpu_enc_split_role split_role;
 	enum dpu_intf_mode intf_mode;
 	spinlock_t *enc_spinlock;
@@ -253,6 +256,8 @@ struct dpu_encoder_phys_cmd {
  * @split_role:		Role to play in a split-panel configuration
  * @hw_intf:		Hardware interface to the intf registers
  * @hw_wb:		Hardware interface to the wb registers
+ * @vblank_ctl_lock:	Vblank ctl mutex lock to protect physical encoder
+ * 						for IRQ purposes
  * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
  */
 struct dpu_enc_phys_init_params {
@@ -261,6 +266,7 @@ struct dpu_enc_phys_init_params {
 	enum dpu_enc_split_role split_role;
 	struct dpu_hw_intf *hw_intf;
 	struct dpu_hw_wb *hw_wb;
+	struct mutex *vblank_ctl_lock;
 	spinlock_t *enc_spinlock;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 25babfe1f001a..dcf1f6a18ad6e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -244,6 +244,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 		return -EINVAL;
 	}
 
+	mutex_lock(phys_enc->vblank_ctl_lock);
 	refcount = atomic_read(&phys_enc->vblank_refcount);
 
 	/* Slave encoders don't report vblank */
@@ -275,6 +276,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 	}
 
 end:
+	mutex_unlock(phys_enc->vblank_ctl_lock);
 	if (ret) {
 		DRM_ERROR("vblank irq err id:%u pp:%d ret:%d, enable %s/%d\n",
 			  DRMID(phys_enc->parent),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 8e905d7267f9f..87bb49763785d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -364,6 +364,7 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 	int ret = 0;
 	int refcount;
 
+	mutex_lock(phys_enc->vblank_ctl_lock);
 	refcount = atomic_read(&phys_enc->vblank_refcount);
 
 	/* Slave encoders don't report vblank */
@@ -394,6 +395,7 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 	}
 
 end:
+	mutex_unlock(phys_enc->vblank_ctl_lock);
 	if (ret) {
 		DRM_ERROR("failed: id:%u intf:%d ret:%d enable:%d refcnt:%d\n",
 			  DRMID(phys_enc->parent),
-- 
2.39.2


