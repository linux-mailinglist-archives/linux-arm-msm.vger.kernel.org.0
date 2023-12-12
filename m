Return-Path: <linux-arm-msm+bounces-4306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8368980E015
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 01:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3915F282650
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 00:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74D2621;
	Tue, 12 Dec 2023 00:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XiwyyxmB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7698187;
	Mon, 11 Dec 2023 16:23:19 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBNYdX4003068;
	Tue, 12 Dec 2023 00:23:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=cJ6T6Gxx+rU6Pum1bXzZbxXng9jiotRpFDF+B0En2Ts=; b=Xi
	wyyxmB1rV5zyALcDjenQKfPoeiMKFASMv5cGzdY1mlydQOypyls8WP+REFHA6F5/
	UZaLN2ijlsSwZlljrrTn7R5YAlJw/ewd6iI9R6KyZhqgDVIiSyWX+TU02U7rKhRy
	yK/E/4cpCszM7lUL2FltEd7XgWF6oNTAcWrspBfuWWU1q5a6g43GZdVV9ZEn42Pe
	r8kffGGckC4HdOe/S1/tw/QMc30egCYDQAuehRphSHHnt1slTxmEVGL0O5VN9zy3
	nhyw2vqs6k0vZm+GMxdNIft26HmxzDDKrI9m4MD4ENCQLeP2FsZ2jCIY4rltKiiI
	n2tNkzVtWCvqkDgp3/Lw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvnnsvqj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 00:23:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BC0NDxH007395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 00:23:13 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Dec 2023 16:23:12 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <seanpaul@chromium.org>,
        <quic_jesszhan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 09/15] drm/msm/dpu: add support to allocate CDM from RM
Date: Mon, 11 Dec 2023 16:22:39 -0800
Message-ID: <20231212002245.23715-10-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
References: <20231212002245.23715-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DBVRLUv5FvQ85Nh73rcXBug2oLNuD_wq
X-Proofpoint-GUID: DBVRLUv5FvQ85Nh73rcXBug2oLNuD_wq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312120001

Even though there is usually only one CDM block, it can be
used by either HDMI, DisplayPort OR Writeback interfaces.

Hence its allocation needs to be tracked properly by the
resource manager to ensure appropriate availability of the
block.

changes in v2:
	- move needs_cdm to topology struct

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 38 +++++++++++++++++++--
 drivers/gpu/drm/msm/msm_drv.h               |  2 ++
 4 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 9db4cf61bd29..5df545904057 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -98,6 +98,7 @@ enum dpu_hw_blk_type {
 	DPU_HW_BLK_DSPP,
 	DPU_HW_BLK_MERGE_3D,
 	DPU_HW_BLK_DSC,
+	DPU_HW_BLK_CDM,
 	DPU_HW_BLK_MAX,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index df6271017b80..a0cd36e45a01 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -135,6 +135,7 @@ struct dpu_global_state {
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
 	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
 	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
+	uint32_t cdm_to_enc_id;
 };
 
 struct dpu_global_state
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 7ed476b96304..b58a9c2ae326 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -435,6 +435,26 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
 	return 0;
 }
 
+static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
+			       struct dpu_global_state *global_state,
+			       struct drm_encoder *enc)
+{
+	/* try allocating only one CDM block */
+	if (!rm->cdm_blk) {
+		DPU_ERROR("CDM block does not exist\n");
+		return -EIO;
+	}
+
+	if (global_state->cdm_to_enc_id) {
+		DPU_ERROR("CDM_0 is already allocated\n");
+		return -EIO;
+	}
+
+	global_state->cdm_to_enc_id = enc->base.id;
+
+	return 0;
+}
+
 static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
@@ -460,6 +480,14 @@ static int _dpu_rm_make_reservation(
 	if (ret)
 		return ret;
 
+	if (reqs->topology.needs_cdm) {
+		ret = _dpu_rm_reserve_cdm(rm, global_state, enc);
+		if (ret) {
+			DPU_ERROR("unable to find CDM blk\n");
+			return ret;
+		}
+	}
+
 	return ret;
 }
 
@@ -470,9 +498,9 @@ static int _dpu_rm_populate_requirements(
 {
 	reqs->topology = req_topology;
 
-	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
+	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d cdm: %d\n",
 		      reqs->topology.num_lm, reqs->topology.num_dsc,
-		      reqs->topology.num_intf);
+		      reqs->topology.num_intf, reqs->topology.needs_cdm);
 
 	return 0;
 }
@@ -501,6 +529,7 @@ void dpu_rm_release(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
 	_dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
 		ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
+	_dpu_rm_clear_mapping(&global_state->cdm_to_enc_id, 1, enc->base.id);
 }
 
 int dpu_rm_reserve(
@@ -574,6 +603,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		hw_to_enc_id = global_state->dsc_to_enc_id;
 		max_blks = ARRAY_SIZE(rm->dsc_blks);
 		break;
+	case DPU_HW_BLK_CDM:
+		hw_blks = &rm->cdm_blk;
+		hw_to_enc_id = &global_state->cdm_to_enc_id;
+		max_blks = 1;
+		break;
 	default:
 		DPU_ERROR("blk type %d not managed by rm\n", type);
 		return 0;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index c0446fa66b98..16a7cbc0b7dd 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -90,12 +90,14 @@ enum msm_event_wait {
  * @num_intf:     number of interfaces the panel is mounted on
  * @num_dspp:     number of dspp blocks used
  * @num_dsc:      number of Display Stream Compression (DSC) blocks used
+ * @needs_cdm:    indicates whether cdm block is needed for this display topology
  */
 struct msm_display_topology {
 	u32 num_lm;
 	u32 num_intf;
 	u32 num_dspp;
 	u32 num_dsc;
+	bool needs_cdm;
 };
 
 /* Commit/Event thread specific structure */
-- 
2.40.1


