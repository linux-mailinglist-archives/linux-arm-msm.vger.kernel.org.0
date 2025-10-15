Return-Path: <linux-arm-msm+bounces-77348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BC0BDDCBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 11:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A2F41887632
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 09:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A580531BCB1;
	Wed, 15 Oct 2025 09:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQZCVr/j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B809B31A06F
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 09:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760520659; cv=none; b=bYpN60vydbSb+N3xYjmrJ3Z/ZTyP3p1Mh4vuTZwjV06jVPWuIMswx2e0JxVzLcZ2GMBPmecUmZqaNQCkCkjUhhKNVdyVngMCdTm5f50J2rtGmsBgoS1ChYAtY/7XwXK+PdH8CYZldSZ4nt6Rj+GjScjVMEtrr78hJXydrLeo29g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760520659; c=relaxed/simple;
	bh=SuVduaVkXgdGwLoV7y1FfPaaAzaHrO7lkHsSN7jXI8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eq3XvL+Hvob4ykWa0hHPVxZYZcRvdIwQ8+nrC9cpnp9s9efAozEFCZ+gVdKn1MwIRpqIBEowCoy+xDY9X6NoSQvag1KbJenZ3kYPn7C1XcM8Iyltmu60Ac2XaZvzr/DGI6dPAOw/5RKqgXS/VYwgZwjKB5f9u41C0iRk/4GVyWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQZCVr/j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s7EX015154
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 09:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y1kg+p2rK68
	ERP1p7EJ2CvNyyeJCHrKuUOCUWlCgr48=; b=AQZCVr/jamPPGrufNMeHn99mcbF
	ox8UuevguLnyrNSez+q5/73TZgJCTVg+m0RKjDouVtiQvod/MwOT6sYtF0HWEvjp
	EuM7MTqt9tuOG32YK8lweziFrhclLua0N4U/mQ1l5NGOqlSua+bB0B4dRAOJkvgr
	eKCcEWInXd5M71KVxYAc+8pDhWuJBepmhnp2MoSvMU5vgLU8xi5Tw4pNXQv013LC
	2HMmM8Mx3CJsArzoPMRVHGPayfKDquk9ly9p2YcNwZ1VOUyFXZTKkt+tcJ69/13/
	plPM1N5Ozn1fZxItpdM01QyMNuELPLWCLyiR4IAOfsHvU3bi/8PxmxKLtnQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5m026-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 09:30:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7a153ba0009so1649551b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 02:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760520654; x=1761125454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1kg+p2rK68ERP1p7EJ2CvNyyeJCHrKuUOCUWlCgr48=;
        b=RkAb7TxIYGNiMxLt6lYRvJBIFvKx80jnXoezg6+tS7vWNBLRqQOiGRtdJ2rtCg7tTQ
         ukXDt03p8/hflTTO/Bd+S2zetyUPrIIeuOgRwf53EzxoJgvG0D/TYh99PQ34VzpUzXuO
         h6E1L1jBeKHX46EgOSktBGU/ATongfAwoQrKmAxHDz/LX5YTz5MuWFdi8fG1XdZm9D8n
         fufGt/416Q19A44j5dUD1tXnUw1zAGcPTdG1NwNDC/aAcY7eRvH9r5gG8JKExQ25Cd0I
         SjAdTQXPW52iepd+J39vCrYUC4akoIC6ugdvtzwsIERNhD1yCovpOfROnPIPjaoivjEx
         bIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUMleF5jj6biUvtFhukSW7b/eaC3KOeSgb9O+vzUGdWGqr2+rv1/LBkF9/8xmxe4Jn1+dMIIeuMVgtjg+N@vger.kernel.org
X-Gm-Message-State: AOJu0YypA/WLupr2YQOZvflwTAvjCfr0UXExDTbnjUtzIVpi4EQ2I+41
	52AQAT13aW8g2DN5i8q0a37dgPiaFEUb+SkbOhFCSz7pE8XY4alD7E0h18bQbdjVn7KQperohst
	WW4Nb5FFrZ8ZzMa3XdgDSH0PIpk1wPrAp8jclz/RxEByVEBfZyr+cZ+NYaiYZT8LCF54C
X-Gm-Gg: ASbGncs8fbptg7yLdnFjxYSsT/dkNDWE26Bd+i4wRqQlgIcs3jfyi3gVBGMK7h8t4We
	trwzNwgV78yX+vDDW9wbUP25cheswXHgYGxvg0GfmuO5ZUdzt79tGqHEhWeJnHBq37d7mMcqbhN
	aPFTpv3OWmTHIxI9sZtFiFbp89Gr6gSFwKCcrQDwC3ueU5EB4xoIvY93IdhxkwVKxU0vPE61mRE
	P4nYqO20lZ/BylEM5mGlTIe7zNTSgfIpOHNJU9ryKztuGo7wjvSyyQOIntC2ltTfGJRAhXO+gRY
	m/JQLt3IPKzgN7fRxCfd1p3DeZRddhLE461ZVlBDnVbzJLFw0GqZQ3mA4SZNl8a+cCPorlb5f+g
	P2z+7vodkY35xokIafokUjP3/bCCG3A1ng6A=
X-Received: by 2002:a05:6a00:4fd4:b0:78a:f784:e8cf with SMTP id d2e1a72fcca58-79387829619mr30058007b3a.27.1760520654304;
        Wed, 15 Oct 2025 02:30:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ0soQb9bDnXm++IjhuW3gJpSyFFoMQSKckUa9K+r8CuCGeYh6rZgqF92eLptBNZ/sV3Ez2A==
X-Received: by 2002:a05:6a00:4fd4:b0:78a:f784:e8cf with SMTP id d2e1a72fcca58-79387829619mr30057984b3a.27.1760520653790;
        Wed, 15 Oct 2025 02:30:53 -0700 (PDT)
Received: from WANGAOW-LAB01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09aa20sm17946745b3a.39.2025.10.15.02.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 02:30:53 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
To: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        abhinav.kumar@linux.dev, bod@kernel.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com, Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v1 4/4] media: qcom: iris: Add intra refresh support for encoder
Date: Wed, 15 Oct 2025 17:27:08 +0800
Message-ID: <20251015092708.3703-5-wangao.wang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
References: <20251015092708.3703-1-wangao.wang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZKh099ATooD5gUm46lp-aJfRNSsXdTGX
X-Proofpoint-ORIG-GUID: ZKh099ATooD5gUm46lp-aJfRNSsXdTGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXwpApgKJ34e6i
 l6YkHn/kZuwoNZkbAyxMpR8h9dzCh6MV60PqNmmeVEy5Q1OMfNI5a7ddwpWkC1bCJxyWOVKJrs1
 ZkAFu7wcg/6AYZerBxSxgC82rJ5H00bgiPDkFfiz+oyXFPSKvf9SQ6My54K0Zu/LnbnP5xj48LC
 ZYCFptayCcbE5eiOLmtRywkrccf5Qx7sCI2s2X5DTao7ABNEkMSjryjjxKMOgApnzJiE0l0D877
 /eMS0TOzvvkls+jTfMXsn6cjnVmtnnkaseX3YzCVkYCtwa+T+qcY6Iae9G49Vk3TaT/jfJLhEkP
 S4aQoKkLkAu8WCg+sujG2wpwUc9Sc8XtHXYLXXsqpA/C6FW6LHlODsvyGe7nEbd3ufhdqfH3PVV
 9YsZ2aYW7+5Dfq35r3mmK7Jn9/B50A==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ef69d0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=l_OZQY5ESRzjHvheC7cA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

Add support for V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c | 33 +++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h |  1 +
 .../qcom/iris/iris_hfi_gen2_defines.h         |  2 ++
 .../platform/qcom/iris/iris_platform_common.h |  2 ++
 .../platform/qcom/iris/iris_platform_gen2.c   | 19 +++++++++++
 5 files changed, 57 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 8f74c12f2f41..148915692473 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -104,6 +104,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return HFLIP;
 	case V4L2_CID_VFLIP:
 		return VFLIP;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
+		return IR_TYPE;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
+		return IR_PERIOD;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -197,6 +201,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_HFLIP;
 	case VFLIP:
 		return V4L2_CID_VFLIP;
+	case IR_TYPE:
+		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
+	case IR_PERIOD:
+		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
 	default:
 		return 0;
 	}
@@ -944,6 +952,31 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 					     &hfi_val, sizeof(u32));
 }
 
+int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ir_period = inst->fw_caps[cap_id].value;
+	u32 ir_type = 0;
+
+	if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) {
+		if (vb2_is_streaming(q))
+			return 0;
+		ir_type = HFI_PROP_IR_RANDOM_PERIOD;
+	} else if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC) {
+		ir_type = HFI_PROP_IR_CYCLIC_PERIOD;
+	} else
+		return -EINVAL;
+
+	return hfi_ops->session_set_property(inst, ir_type,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &ir_period, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 355a592049f3..9518803577bc 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -34,6 +34,7 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index 0f92468dca91..9e8fdddf2aef 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -70,6 +70,7 @@ enum hfi_rate_control {
 #define HFI_PROP_QP_PACKED			0x0300012e
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
+#define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
 #define HFI_PROP_TOTAL_BITRATE			0x0300013b
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
@@ -108,6 +109,7 @@ enum hfi_flip {
 #define HFI_PROP_BUFFER_MARK			0x0300016c
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
 #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
+#define HFI_PROP_IR_CYCLIC_PERIOD		0x0300017E
 #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
 #define HFI_PROP_END				0x03FFFFFF
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 284d6bde6d6b..30b98e769ad3 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -143,6 +143,8 @@ enum platform_inst_fw_cap_type {
 	ROTATION,
 	HFLIP,
 	VFLIP,
+	IR_TYPE,
+	IR_PERIOD,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5d76f638020f..35915c87c5b1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -620,6 +620,25 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_flip,
 	},
+	{
+		.cap_id = IR_TYPE,
+		.min = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.max = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC,
+		.step_or_mask = BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) |
+			BIT(V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC),
+		.value = V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+	},
+	{
+		.cap_id = IR_PERIOD,
+		.min = 0,
+		.max = INT_MAX,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT |
+			CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_ir_period,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
-- 
2.43.0


