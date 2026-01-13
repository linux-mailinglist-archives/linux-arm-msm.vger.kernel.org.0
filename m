Return-Path: <linux-arm-msm+bounces-88878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98310D1B390
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 21:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 242483067F50
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 20:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FB22FDC35;
	Tue, 13 Jan 2026 20:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pWwD8fI2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I1+oDvML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107442F0C7D
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 20:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768336423; cv=none; b=u0eCfb8csgEdgs4Q6veUKpadu6d2Sg8feRbGxsqzjr/K+oDgXyXD+DXkv3d95iQ6hYxGkTjPD8AzReylZ0Fq0HL/nrl/CL9oCI7IGmjvUxkV6chLDFs0wlpCWIJFAlX90IInZSsb2PDNTf66tdhkxD+xJJ8RJigAGqdvU3IGM1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768336423; c=relaxed/simple;
	bh=mI3w+fNYnExFQMgzeQKywHjpUbJ8gQ2nSgDbYOTLhNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fivs0NTic/MgbeN/b4iAZPckSZ/rpON8AJ4PE5HFoAT7kNqSNAzmrztk0DQ4ltq9zFobxII1lecFSSO73NzQMTpHPrsBujntWlazTWJOofrA7KBWPoRnt7EtcxCZ42FpuHaFjYGgdZntrVsr6sfhRJ7W3r6D3INyG/tCPbtJreo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pWwD8fI2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I1+oDvML; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DIE1qQ389557
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 20:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pGDn7XjluYGlc7+xUytTtb7c+6xJORtfZoGQQYOexXU=; b=pWwD8fI2C7Xses0w
	U1VbGxDMe+DwgOSMEpXtzr5sD/vngPdQZzbJnS51s7CGQfmctrILpyuNXs4xyBV6
	brO9nHTnoUb+UFZVd8qgkAAqc7FOum4rBMjz4y4wb6uRk9KmdbLOphwFdT+CX5oJ
	huMHzotgO9NJBa1Wf6ijKwUwea2DijPZTqfWLtnUy3eqZAXYil3/7meGSQgWdGse
	/+BILPOucoqQKOLVw70aI3RVoESeC2LH3+Z4PxhajRdkznaPBV0i5JDLIa9cx0t0
	jiaOy6y3TyYPCnW47qben57GMgXPMzKTWLEntbGx61D5xaayBfGZH7XnbZjrvfg0
	t5CXkA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58re06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 20:33:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ac34230141so141593eec.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 12:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768336420; x=1768941220; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pGDn7XjluYGlc7+xUytTtb7c+6xJORtfZoGQQYOexXU=;
        b=I1+oDvMLSRXDMiXqSkXfHxKfSO4GXkrY12tGXUs4Pvb91v4njfyRbMtb7kntDuYqtg
         NIuk2fjX0onsbmZp7MCpAqG1wh5Uvp6vwCAKkKN4/Wpe/E3sUVvG4iMGdANwyhfufGgr
         szW7HYHxNqz/MwHTyDov0gLIB7KlSZ98klxH8cq47VmNlOnHrEsm5GyEvGCu51z3XY2L
         gph8BhTluCPEASCS5IHzwZXaygQ9nLLFmP//+FfHQkNVFMOq8BYNfhwR/q9OytwdcG6T
         cV1px+ui6Yue5fPvbWvcp4QM/sT6e2IwGvddGkBfyls9qwXv3j5QjF1eveg1LxOz2Xy5
         kPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768336420; x=1768941220;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pGDn7XjluYGlc7+xUytTtb7c+6xJORtfZoGQQYOexXU=;
        b=K7MXsx1BV1YLAJpIY0g8v5cBQWb3CvAbXup0sebXbQZmGByMHh2cEqr3BPbRBCEWFs
         3tuPSLe+FmXRTaPPynToWYltpbK8y3ebFvK9ObGogRrwmb3U1nShAcJ1xNwQUka8moDo
         MO+U1V83tSI3Z4b7z18OWn4u0vxNQ5egtSo+MIdex4zQg9I4Gv6FqOZeJwPEEsYbm0VN
         6oEIEvGQxjAHz0I/kioTt0gBz0/bg/GmXfj5YfY0qNRLyYxbnTSBt0cz2xfBQkJlGFc8
         R7JfF1Bc/ex//59oBaBIms6oRSjrgg1aJu0Rnfe3B5Hxa9zQssx1ORTfHBry3rfoQkNh
         RxuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVocb6U5QcS08v/TabDVIMcWgCNRz4AMNwPcQi3Hf17PdJvuhUvN9V/rITTyTNij98B7DJCBMVzytQ6ehG@vger.kernel.org
X-Gm-Message-State: AOJu0YysCHgQTqqlJNewCIeTL2qnkdn+/Vp4PRggvvmHYp1comOXnTPb
	THTf8pmJaD9WJ4XzeFl2V+tJlkp0lWeb8S+FjKQ1f3B0fXIJs2KR1J0VsoamedHIjS/b5ygJala
	W00P4nxK5lJSbxNDZu0AGKQmPsY7b4j3mHhhuDnq1DFhAkHKNbXEQuS3m9DHdoUMyli0etaobYo
	rW
X-Gm-Gg: AY/fxX5B9hOW0T1ufL4adaVAMsg9M23p8zt0cySVvEFXMNfN7OVfSy290/RmYJ+kOBL
	KJPh4OMKHVcvHh1O+9LCanO+w+kRUrpZabSuoZZJmlRzZPyeFTp+6X7LaHm5paSh7aPuJKljff1
	JRHUamzf+blR5lKpa0u7SyYtUUSrI1g3g8ueZEizt/56ZPvAPth8UDZoWw6MsDeZMW6SE7+hEgr
	cXij5Z3QHJEpvHVdF4Y/WV7Tr9FTKbwk/19NjKCqwK6VfmZ3+rKWsY5amOfR0Ykr56OV0zhp3Q7
	uRcxyg7iK43d8eHB17I7GFSCh6JoTRqNG3FU6PN9qTOk15xFWCVRefmXGCq5AsjO3DsBUN7GEHR
	31hhXf9gGOreSEnGnCGZqkIo6kChoZ5ng8zmufQziT1pni54fn11bbhfuWjUPBoT9I7DdEQ==
X-Received: by 2002:a05:7300:3b1a:b0:2b0:4f9a:724b with SMTP id 5a478bee46e88-2b4871e9771mr143241eec.6.1768336419445;
        Tue, 13 Jan 2026 12:33:39 -0800 (PST)
X-Received: by 2002:a05:7300:3b1a:b0:2b0:4f9a:724b with SMTP id 5a478bee46e88-2b4871e9771mr143218eec.6.1768336418830;
        Tue, 13 Jan 2026 12:33:38 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170673bc0sm19157897eec.5.2026.01.13.12.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 12:33:38 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:33:34 -0800
Subject: [RFC PATCH 3/3] media: iris: Add ROI support framework for video
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris_enc_roi-v1-3-6c86eba38587@oss.qualcomm.com>
References: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
In-Reply-To: <20260113-iris_enc_roi-v1-0-6c86eba38587@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768336416; l=6206;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=mI3w+fNYnExFQMgzeQKywHjpUbJ8gQ2nSgDbYOTLhNw=;
 b=DHw1LIcBDk9zxxR949jpdE1ETt0fE+cV00q30+Cfosh6oWTtAU25x2IthDRhu5+UQ/J6t/959
 82UNoZZQZmjAnWkxGSgWy5GSojKKsgF1NDGVkzSn04bIl60PaWGh44u
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE2OCBTYWx0ZWRfX5K1L4pd41pqE
 fbuKDEHaQq05H72aEIsn4bCa/dQ4tOjexZ6vx9Tkgx7+ntAa4JBXinzXjPJZjALjKsqjHznuK97
 wV5jbK5YjGGVb00Mbyl3026RMUl8p8TevDsC9HvWJ7VpRNxdYh6keZ4cXUa6UDBGZdvEPEHlR1x
 MLyFvRaM/zTDqhCPIuoa6s0v28sGgB4IjTF9D4cCiUhXfB80AZnY5Lw2lKAGUam0zzO7Q6EcgmG
 YfboCUq7usgjc+6qEHXTGdTGyuOgnm4sKjp+L3euU3pexpqtROHZS+Pz8RYwZX48nNlYjYnlAwR
 6cm+rnpi3Q0QerGyO+9h8XvSspN1EjFwrQwFqkraoZ6r39O/f0h/3xVNM/YfJOisbXwvAU0CzpC
 7lwsp5Y8DNTee7Hgjvp6HSAVegP+NbR/t3yXCzJVu6rCFxIwuqOnFh0Nbu24OkT8aVKvPbWFUmV
 QbVRDqn/MqK+M1EgDsg==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=6966ac24 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4usVFD2bs8YhfvkcmPAA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: jpHNN5PnbnyRiqngdpMyjzMauJPUg_d1
X-Proofpoint-GUID: jpHNN5PnbnyRiqngdpMyjzMauJPUg_d1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130168

Add ROI support in the iris driver, including control structures
and default parameters. Extend support to set ROI parameters
using compound control V4L2_CTRL_TYPE_ENC_ROI_PARAMS.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 54 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  4 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  8 ++++
 4 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index c0b3a09ad3e3dfb0a47e3603a8089cf61390fda8..2d00df554a64829af550ed43267bf73b6a9c892e 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -98,6 +98,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return B_FRAME_QP_H264;
 	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
 		return B_FRAME_QP_HEVC;
+	case V4L2_CID_MPEG_VIDEO_ENC_ROI:
+		return ROI_PARAMS;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -185,6 +187,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP;
 	case B_FRAME_QP_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
+	case ROI_PARAMS:
+		return V4L2_CID_MPEG_VIDEO_ENC_ROI;
 	default:
 		return 0;
 	}
@@ -208,9 +212,14 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		return -EINVAL;
 
 	cap[cap_id].flags |= CAP_FLAG_CLIENT_SET;
-
 	inst->fw_caps[cap_id].value = ctrl->val;
 
+	if (inst->fw_caps[cap_id].flags & CAP_FLAG_COMPOUND) {
+		if (cap_id == ROI_PARAMS)
+			inst->fw_caps[cap_id].p_def =
+				(const void *)ctrl->p_new.p_enc_roi_params;
+	}
+
 	if (vb2_is_streaming(q)) {
 		if (cap[cap_id].set)
 			cap[cap_id].set(inst, cap_id);
@@ -223,6 +232,21 @@ static const struct v4l2_ctrl_ops iris_ctrl_ops = {
 	.s_ctrl = iris_op_s_ctrl,
 };
 
+static const struct v4l2_ctrl_enc_roi_params enc_roi_params = {
+	.num_roi_regions = 10,
+	.roi_params = {
+	[0 ... 9] = {
+		.roi_rect = {
+			.left = 0,
+			.top = 0,
+			.width = 0,
+			.height = 0,
+			},
+		.delta_qp = 0,
+		},
+	},
+};
+
 int iris_ctrls_init(struct iris_inst *inst)
 {
 	struct platform_inst_fw_cap *cap = &inst->fw_caps[0];
@@ -263,6 +287,22 @@ int iris_ctrls_init(struct iris_inst *inst)
 						      cap[idx].max,
 						      ~(cap[idx].step_or_mask),
 						      cap[idx].value);
+		} else if (cap[idx].flags & CAP_FLAG_COMPOUND) {
+			if (cap[idx].cap_id == ROI_PARAMS)
+				cap[idx].p_def = &enc_roi_params;
+
+			ctrl = v4l2_ctrl_new_std_compound(&inst->ctrl_handler,
+							  &iris_ctrl_ops,
+							  v4l2_id,
+							  v4l2_ctrl_ptr_create
+							  ((void *)
+							    cap[idx].p_def),
+							  v4l2_ctrl_ptr_create
+							  ((void *)
+							    NULL),
+							  v4l2_ctrl_ptr_create
+							  ((void *)
+							    NULL));
 		} else {
 			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
 						 &iris_ctrl_ops,
@@ -915,3 +955,15 @@ int iris_set_properties(struct iris_inst *inst, u32 plane)
 
 	return 0;
 }
+
+int iris_set_roi_params(struct iris_inst *inst, u32 plane)
+{
+	const struct v4l2_ctrl_enc_roi_params *enc_roi_params;
+	enc_roi_params = inst->fw_caps[ROI_PARAMS].p_def;
+
+	/* Todo: Send HFI prop to firmware
+	 * once support is available
+	 */
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 30af333cc4941e737eb1ae83a6944b4192896e23..92ceb9e412635f04787fe92a9e5c6ba03bb7332d 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -33,5 +33,6 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
 int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
+int iris_set_roi_params(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 8d8cdb56a3c7722c06287d4d10feed14ba2b254c..6fcbdcb11db7785085de8f95b07f93f8a045c9ce 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -6,6 +6,7 @@
 #ifndef __IRIS_PLATFORM_COMMON_H__
 #define __IRIS_PLATFORM_COMMON_H__
 
+#include <media/v4l2-ctrls.h>
 #include <linux/bits.h>
 #include "iris_buffer.h"
 
@@ -143,6 +144,7 @@ enum platform_inst_fw_cap_type {
 	P_FRAME_QP_HEVC,
 	B_FRAME_QP_H264,
 	B_FRAME_QP_HEVC,
+	ROI_PARAMS,
 	INST_FW_CAP_MAX,
 };
 
@@ -154,6 +156,7 @@ enum platform_inst_fw_cap_flags {
 	CAP_FLAG_CLIENT_SET		= BIT(4),
 	CAP_FLAG_BITMASK		= BIT(5),
 	CAP_FLAG_VOLATILE		= BIT(6),
+	CAP_FLAG_COMPOUND		= BIT(7),
 };
 
 struct platform_inst_fw_cap {
@@ -163,6 +166,7 @@ struct platform_inst_fw_cap {
 	s64 step_or_mask;
 	s64 value;
 	u32 hfi_id;
+	const void *p_def;
 	enum platform_inst_fw_cap_flags flags;
 	int (*set)(struct iris_inst *inst,
 		   enum platform_inst_fw_cap_type cap_id);
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index c1989240c248601c34b84f508f1b72d72f81260a..eccfe5642d6803fd435787cadc83f878572dbdd5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -586,6 +586,14 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_u32,
 	},
+	{
+		.cap_id = ROI_PARAMS,
+		.step_or_mask = 1,
+		.p_def = NULL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_COMPOUND |
+			 CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_roi_params,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {

-- 
2.34.1


