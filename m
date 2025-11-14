Return-Path: <linux-arm-msm+bounces-81753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DC357C5B152
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:15:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EC08F352347
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2146274B3A;
	Fri, 14 Nov 2025 03:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJmt/WvW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="edl1nCi+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150DC258ED9
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763089888; cv=none; b=f8xAMbxSp2hcgRtBOTKjwTYxz19f2po9PukmVrSpnqLhX6+uCiB9Gh1PMuLzCh2ZrkIu6WHlXf5g/NnbIyz8CnlxJXjfqvuF73swZ914CR7x3IJEOiLHFnVWfaQGb86xSh0WNyKOPbNxorzFx5+edVGg400oO9+QZMNECDIJGdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763089888; c=relaxed/simple;
	bh=81zFRIrcTgcziO/6idLpMYBAFEcqcHARdAIyw083MWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CmLp19I36csbthzNOpWGobpTjHtykPAodHTLzzOo7Cit17NYEi/JTVQrBsyUYAEZibU9cVmIaE1SRvVOkzN5mesd4FOF7p8hwMWxOS5hof0Au/jIAFlQtrBD5QBWSag6WhngY+/BToN2Gn1ZnIOlhd3a267ZP9+2CbT/4YTrapY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJmt/WvW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=edl1nCi+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMakwD1703675
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HWuhh9Cgk4n3Afm15RwS7N0x58GbRMnnQgyv9Sj4h7Y=; b=AJmt/WvWcypwRRpL
	qTnYLvTblZmmdfB3bEbzzoVUBJ4662UP6snepmP0TTYK+mPq8AOIUQb/u2yLfuVQ
	TxNZwJDnDYNV6Z17jl+PVfUdZBoswdxEn0VqI8DJsS+nDDaKXJg/lCO1D8YQ/RAd
	Aj8GgheQC1r1NAXomH2MVhfjwxur16wIYihky2R898L7RnMDuh5s4uvUH4+QXDHQ
	dFQi8YopqTm+o9cU9TDszsarfSHsJ55hPt6e3Del7s5HAmUzwnUM8k9dbquLbbm0
	TQbUuKNTVt0MXtFeU3wt8CroKqYhuOejK3U9qyntH94pNiuVJQI+GMY3qBotN2C3
	G/WvPw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e8mq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:11:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b96038aa68so1497316b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763089885; x=1763694685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWuhh9Cgk4n3Afm15RwS7N0x58GbRMnnQgyv9Sj4h7Y=;
        b=edl1nCi+XlVS3nurUk69KyGPOh+lKcXa25pPGyhJSGFEkBwNziZDaeOurws8TxcPhL
         zlGeKbAXAtbqu6h5g6GmJrBGIaG/mWhp/e/i1VhbsL6aA+hB7gEMHqRgiD+hjg99sNSM
         8i9HFvvY20HabxRemRnr7Sm9hupCbIlMCmsZoC/yU+vgIhw+HqazHq/SX3COCsyljaHg
         zdXxvo+2o1g7OV5/brqwsKb/mVXQTd73CMU/2qUSSbx3WDFm1+jhEkmv2KYFxqNCGIpH
         MZt9P4KpWfuR11C8NEicgz8wiAXTrw3bPGpd4CWE2GyOFQO13NduAhTPy6//yBGBa6nz
         3+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763089885; x=1763694685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HWuhh9Cgk4n3Afm15RwS7N0x58GbRMnnQgyv9Sj4h7Y=;
        b=Ohsry+eB7JHKZJtE7OLdZqzFFc4f4zJxk7/LEceUUJTpyJUocRaCPtrkHURVQx58O4
         fSpq5DrgwXvNTvNheXybjD3m8zFGjwmtC6xOT3lGtH034ZYEnzxauV3CFa80iugAFeN6
         WiEA9rbaFeYaNV9O3kwpIRIO8Z0Y2lzMMsspPHQFqQbdZTzgmR0v9ktOrHRwfzh8F9wy
         +JX3ZlDuIt0Q21R8fjXPiaFkywfC0EhqibgytVTIE9D++Ud3Fw7o9V5yNPGZF3YgWYL8
         3bRVpyqQasajQ4xru1xLJgiRHFLHCf6eo+LoolAQgtsISg4TmOLws/itkfL027Zk0CGP
         rfHg==
X-Forwarded-Encrypted: i=1; AJvYcCXkknn2MSEIx9X4BkuhTN1e5aDYcv7A6LKRq5UfY/GnXNm8ieI9rRfPFSrAO2yXM6xtp55sIvzE2lSfizEs@vger.kernel.org
X-Gm-Message-State: AOJu0YznHgp7U1GbwnC8nmFAeHqBk1RUsD7NSBPUGHMgVKqhZPmpMi3n
	JOOI2Ka2BzOBKiyn+hLJviP+uHMGu1ZqNLPVEWkAJ4+8a6LAnzkJIYC15WbCUcQ+GQVose9XYBd
	PWJusllDYAHziYHmvxCg4r7peYM0lK3IcqZwalN6nzI6GxNPvZ33wdCd919i6+QWaRmPC
X-Gm-Gg: ASbGncseufTZ7opm9bhDuJLzYc0AUydlJGljbfPDVBBP00epLPc7OulWgBeORCNqp+I
	ZPUI5WPrFwb3Pv4Yf8CSFh8pmhWysuPt0JTu2f8VQEmQBd1Cfxul3WPbBgGArsyCHRwmpsVmSBw
	sJgyBnaxzJ5m16C+cQe2ZBGWMhLo7Zg1iBWRPpgDLo4kRXBpibqhIp+A6e+bJC9w7TgEXccqai/
	Pf8UtrCRQ4d0hMV2vOdo3E0gm8xsrHDL0wzpHUzhBZvY8fjAca3OYdMxYqItiL7ynyL0XBmhkX0
	HVBl49ze0fIMbre/ND0pY4T9Bqe4YUVRb+EJXSFfEJ/BnAwP8tjW3WrDfU7/p42uTlRsvm2AIQL
	TgMnL54VUbxHAnrxCFvcNKRGV2bam65D//eMoWX8GPJrnvB+mD9al4x42ek9Q0eLMLvsRiPJUdt
	63c8rkLHL8
X-Received: by 2002:a05:6a00:3c57:b0:7ad:8299:6155 with SMTP id d2e1a72fcca58-7b8df90dd6dmr4825884b3a.2.1763089885042;
        Thu, 13 Nov 2025 19:11:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0UNE/n+UdynkbPgnOR/dHiyYmrpT4B4ld26niZQP65bL4po5jOU0kLVGG+6DowCOU/4o1Ew==
X-Received: by 2002:a05:6a00:3c57:b0:7ad:8299:6155 with SMTP id d2e1a72fcca58-7b8df90dd6dmr4825846b3a.2.1763089884455;
        Thu, 13 Nov 2025 19:11:24 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92714e298sm3598555b3a.34.2025.11.13.19.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:11:23 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 11:09:03 +0800
Subject: [PATCH v6 6/6] media: qcom: iris: Add intra refresh support for
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-iris_encoder_enhancements-v6-6-d6d35a92635d@oss.qualcomm.com>
References: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
In-Reply-To: <20251114-iris_encoder_enhancements-v6-0-d6d35a92635d@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763089858; l=6448;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=81zFRIrcTgcziO/6idLpMYBAFEcqcHARdAIyw083MWA=;
 b=xDGwGXKKjIacVIDYMcZAeOb7KdcNhB4NJXdyBtENLtu7szsD/Ojq+X77i+FrFIHm4O2or9DLj
 N23Uhi6E/c/AVtTRAlBYxlpU3MYYh3LjCIUUZkEXaUzKD/iiX+31D1c
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=ccPfb3DM c=1 sm=1 tr=0 ts=69169dde cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=-vM60OG-bLC5KXgFrusA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mBYyKbkbQZL4kWsgbpXrafmLoRFSvARU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyMyBTYWx0ZWRfX3dUft5mptO3l
 GDWsGwmGvAhJ9zjG1DLLuq6wY9KiuVitRptGyKleVl8QerUJYDTRQ32+q5+BRh7bIoTjHiwoU0n
 UoZW0iX6aYsUvonsch0+zOukngARYvPFQcLz1mdwV7wlD0H24jacX0qRdiYflS1t4UgyM6kPWtt
 odZg1doEdY10L5IhSjqG6eF52Vh7P52sLKLm5J01KIQKr0vrXgcgeVypmip0jWmpVHF7Q7hrruy
 1JGlFaUr5pknThTuWyrKd+BTl8iQ/3HAb5lph666LKhiAU3ffucMuKKRe4Y0An1tu3NWyHvS4KT
 RsA8kmZ06LpR7/O7TJLRIaBTNj1X112fSlgpFO5F3z6cLTYQViZzbmdClcNod4nKuHwJpBq8iHX
 vG3pGlyNI/u9RKEjF5g7mJHYawzpWQ==
X-Proofpoint-ORIG-GUID: mBYyKbkbQZL4kWsgbpXrafmLoRFSvARU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140023

Add support for V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 34 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 ++
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 19 ++++++++++++
 5 files changed, 58 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 72abf1ccefc9102d54fb25ffdc180d6e51cc5ffe..1910aa31a9b9218e9423f2916aa40b85185f0dfb 100644
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
@@ -954,6 +962,32 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
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
+	} else {
+		return -EINVAL;
+	}
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
index 355a592049f3fcc715a1b9df44b4d1398b052653..9518803577bc39f5c1339a49878dd0c3e8f510ad 100644
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
index c9e93d97fb01ec8d9c4b38ea932aae21c1df0943..f6a214a6815420f299be70f80732943d02168f0c 100644
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
 #define HFI_PROP_OPB_ENABLE			0x03000184
 #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
 #define HFI_PROP_END				0x03FFFFFF
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 2774b20d0740c445316244edc8399c7ad6a0d798..dd0a4210a2647ff4dadf8d67b71c6f4a22deb548 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -146,6 +146,8 @@ enum platform_inst_fw_cap_type {
 	ROTATION,
 	HFLIP,
 	VFLIP,
+	IR_TYPE,
+	IR_PERIOD,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 27ee146b8d4b442ca9b02f09d0eb9ced218d6261..a2025d32b3235aaff25793ba77db143000e54bae 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -618,6 +618,25 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
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


