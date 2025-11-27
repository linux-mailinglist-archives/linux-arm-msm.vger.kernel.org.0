Return-Path: <linux-arm-msm+bounces-83537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC0FC8D2AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 08:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C23C14E457A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 07:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A6C3242DE;
	Thu, 27 Nov 2025 07:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BombWf7Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eWEsXrYk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC74322C80
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764229513; cv=none; b=sRFoPWrFlLoj6FY7o2C2PRgRRwGmk01wUsCvgh2oE0smfeAB9/3ZrvPyoFHnwHWwidMJoJWI9JDjsdTvbwsZNtZVZYnZpjD6t7jY98PzjjJqI9B1GP8Z0lIkt5XXht+hFsqI2YZqqihR7RAHZDP+FAfzzBoaTQwf347RQhYm8Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764229513; c=relaxed/simple;
	bh=7qTqRskLgXVIsVTTIKE7U3srXQuo3F38JVJxQebkwkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n59aBvezrzFGUojebii+w/fCbR+L6ypRMDke4yElmN94jggrEjuam2Cgp/kmrXT1zygahfxzQjZauPDvU+v+J0B7Dod0cp6K8GBhU41ehUVpB1Xw53idUfptVHE7XRHxg3eOY48gdr6qFKphtTmvjVLABVfMRa4lhi8O+0ivf+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BombWf7Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eWEsXrYk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR4F4gd1457051
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7vastpdQ73WiWavTd52XPlO+gL+/X1CXQCi3reJbMGw=; b=BombWf7QPReXAMi+
	AJz63wVT6w69FEesFBsNLElwsloBCGHCefI9nYoUvMavhtyZ2F7m1uo5lL5cd8JA
	BGD2oePOF5WW3HA1bnCtEXQXxdQkxXKuw7PhIbfY5zEodb8NQ4YA+SDuWWLYSPl2
	WAyFP3Ra3LX6ZHDEuQYZpTgEdSVPZdvIpLqsNs4a/BFb2pQ0jT9c9yiPBfzTA+c0
	cSw4cvvHiT0KJPVpKKIGIjBzkqpGvZCDr3LuyTeA0VvKQfWnof/T9xH5Rlo9ggit
	DT57XqZn9VJibnwT1/fM1R554UMKpEc0nZaLaBqN4BP5D7FVYYzUMyZ9m2NMW/Fg
	tPdDBQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvkphs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:45:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7c1df71b076so1079147b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 23:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764229507; x=1764834307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vastpdQ73WiWavTd52XPlO+gL+/X1CXQCi3reJbMGw=;
        b=eWEsXrYky/q2zdKwgR1h2ePFXGQvkDvJkx1rbxlx6pMsMiQ5hay40Eau+4sj3TStl5
         SPNVFV3D3nrg8TNtiGCiBUcO8+gzG86EW+UzoriBqUtZDV8VRoHkmbiTiJSNtG52UdD/
         eDFhTxofGWkQp4B1n5AEByO/NFHgQ3OXXm5itw+5ldTHkCDon3JBNOiGrq9bgm2qe3IT
         MapauU7aTCM5gq2eFWO9RwxQMycDeAPIYBNrwcnJk7GbC9TjH7ADA38MzLLXVJ0mavYk
         yZa9XesSqQXxWDWNJoK9RfKYWgncbJw5uajfa84eLj7mOqQK/SIYGdvvMlWEiebBjf/A
         u0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764229507; x=1764834307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7vastpdQ73WiWavTd52XPlO+gL+/X1CXQCi3reJbMGw=;
        b=i2znvCcptS/M+DR5fQTvT82+HxmxXJYuXYJLepLy7Cg5xTmkwEtqw7SXFuWgUS9Vf0
         D6rNKhtHjM8Ea1k/ctFuiIkoidSRKNWmKKxYTtWBwmCRTbJyiG57oSGzfNwyrbsUwznR
         CXeIsQ6UHgVG/6e0HwlK42voyboLbMVzDhac1nNGx2wjoNnMRpgjkl3Vu5lyDgyUT44q
         NdnihZriSUUb4lxaPQleDs/zu95KNySDZzWROrLHyhi98gDbhFvVmeVh1jFrCsP/27/3
         AheE7ma7Jy/CO6NolMYnl42Cwn/L7YQJBPQtwE62KcOK4x5UXAeVb4DezxvWDDQNVHgt
         Cu9g==
X-Forwarded-Encrypted: i=1; AJvYcCUr9Gida34amJ2VtnTnsqea+wH/df6BMI1PbLj5jzeOzdulK9HcfARtE5pRgxQFpHSlr5qEWck9k78fxOFt@vger.kernel.org
X-Gm-Message-State: AOJu0YwUXauAtXE1bXkChPUN3jCz5LCmt7iz2BWeWdhi9HzXN4oMfho9
	OoqbDNeho5+llL8ynI8DB3gcsEU8XW2gA7nrK238A7q39fhf+050q/6V2q2vmvYn1vrZda+T2/V
	Ch0DOnj4fi2acaWE2pC+2L6L6r6+czwkAIStafokY49xi/LEMZGFx/BG9jeNcE8BVBcsB
X-Gm-Gg: ASbGncue8S94CV4UlmSRfxmulgi9btLkuQ0mYHkV5VC6VRN3D2x32qR0pB4Z7Igr+AV
	MQ8X6HsFRmzT5i5lQyN9fS9zKNOSq6BOVss4sXa2D/7wn+tQr/+A6Wpo9vAK6X6tGh8rmP/yQZG
	akLqYIoCjLQf/AP+UiP1X8hCAveRNFHP24iZD/HHvaeCpLVOQHKoCJh7DadrJYYVx1P5yW7/QhK
	njPfdxPQPs2TkUmfv3j3BzgiRSWUK1Ni+c0r6SgSw/cICSJKhWVX1HvV3ebB/EGAapuq8qQMswh
	MzqZiyE3qfaBJs1pfQxM6mC0BaaI/xXZ1KoFPfFxLa5d2QNho8E4h838SNECXCcoXTu2PLZ/SeT
	F3xHVbI8MkHVw83xk+ZdTJnK06nZEeByNTkEperWyQ9i+Dbaj1iwY4an1U2YUxIhckOlVK+Hbox
	Oj4n0JIR6dJBnF
X-Received: by 2002:a05:6a00:1812:b0:7ad:e4c5:2d5f with SMTP id d2e1a72fcca58-7c58c2ab975mr24229511b3a.3.1764229506852;
        Wed, 26 Nov 2025 23:45:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLPVxkAQrBMlv+aGNLytwrnAXstjduYN5qiQ3h+FBGugOad4a/hmoWH9++lEIrHIJJUSuY0w==
X-Received: by 2002:a05:6a00:1812:b0:7ad:e4c5:2d5f with SMTP id d2e1a72fcca58-7c58c2ab975mr24229489b3a.3.1764229506343;
        Wed, 26 Nov 2025 23:45:06 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f080beasm908717b3a.47.2025.11.26.23.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:45:05 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 15:44:33 +0800
Subject: [PATCH 2/4] media: qcom: iris: Add Long-Term Reference support for
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-batch2_iris_encoder_enhancements-v1-2-5ea78e2de2ae@oss.qualcomm.com>
References: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
In-Reply-To: <20251127-batch2_iris_encoder_enhancements-v1-0-5ea78e2de2ae@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764229495; l=17008;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=7qTqRskLgXVIsVTTIKE7U3srXQuo3F38JVJxQebkwkI=;
 b=Nnw/Nj9S+FhSBrCtDywUQKs4TvupVgC9IgLvfJOPqBIKUIoyg75D8KZU53t0IjbIYsXrJ1SQ5
 iHI74olVqKQDA/E9makMmc1rDIS6te6n6e988DPUq21jGS+mI26/oAC
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA1NCBTYWx0ZWRfX2jonA466qDq2
 zTYV2ksuU+nYkNKt65dj9HTz5LNjERQWmaS7NPCnB3xl/aGQ1ihFOcgmPmkpuPtMpTwdbuyeGu+
 DTPVS1JdE47q/h0a/6vaXa00SdOkAr0C4VU6/SbuwCdZIv4rMN4WPyRGAmB4TE4H2//DHzm+HIO
 5SFIHO/RsDqZbugV9U1wJnSsaEUMFqgl28SOr9tjvy6CRb+rhOp2/xD4+GqqGKqifjEN3tRGkmW
 7a1nI+XrR+vXltWs5KmTOetbFewcFBYvEL4urkFz4jOBgyQXbM+OP/NxCB3PU9TYHci4DzwEmU5
 6F4MDiyjMKQXC1FHWJ+q4XRO7PeiCL2GZPlaaLVkMgHUmXgPrDGJ/t/yBrO3bw6UMogjgUp5Hus
 FPgnO/9CvLquDyiOYc4EB/U06tr3JQ==
X-Proofpoint-GUID: dPuVh0DQAbiPoWOGH0JvvX95edzVsVvI
X-Proofpoint-ORIG-GUID: dPuVh0DQAbiPoWOGH0JvvX95edzVsVvI
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=69280184 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=IB8C7Nk03o53vvQ8lhQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270054

Add Long-Term Reference(LTR) frame support for both gen1 and gen2
encoders by enabling the following V4L2 controls:
V4L2_CID_MPEG_VIDEO_LTR_COUNT
V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES
V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX

Key changes:
Added LTR capability IDs and V4L2 controls.
Implemented handlers for LTR count, use, and mark (gen1/gen2).
Defined new HFI properties and structures for LTR.
Updated platform capability tables and buffer size calculations.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 126 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   5 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  25 ++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |  24 ++++
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   3 +
 .../platform/qcom/iris/iris_platform_common.h      |   6 +
 .../media/platform/qcom/iris/iris_platform_gen1.c  |  30 +++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  30 +++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  33 ++++--
 9 files changed, 270 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index cdf38c285b9133f20bdb9bc3dd0f5e916d3ed7f8..33e104142a5bb51c952550fa45e81b3bdc723ac2 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -108,6 +108,12 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return IR_TYPE;
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
 		return IR_PERIOD;
+	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
+		return LTR_COUNT;
+	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
+		return USE_LTR;
+	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
+		return MARK_LTR;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -205,6 +211,12 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE;
 	case IR_PERIOD:
 		return V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD;
+	case LTR_COUNT:
+		return V4L2_CID_MPEG_VIDEO_LTR_COUNT;
+	case USE_LTR:
+		return V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES;
+	case MARK_LTR:
+		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
 	default:
 		return 0;
 	}
@@ -1022,6 +1034,120 @@ int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
 					     &ir_period, sizeof(u32));
 }
 
+int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 ltr_count = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_ltr_mode ltr_mode;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	ltr_mode.count = ltr_count;
+	ltr_mode.mode = HFI_LTR_MODE_MANUAL;
+	ltr_mode.trust_mode = 1;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &ltr_mode, sizeof(ltr_mode));
+}
+
+int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_ltr_use ltr_use;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
+		return -EINVAL;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	ltr_use.ref_ltr = inst->fw_caps[cap_id].value;
+	ltr_use.use_constrnt = true;
+	ltr_use.frames = 0;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &ltr_use, sizeof(ltr_use));
+}
+
+int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct vb2_queue *sq = v4l2_m2m_get_src_vq(inst->m2m_ctx);
+	struct vb2_queue *dq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_ltr_mark ltr_mark;
+
+	if (!vb2_is_streaming(sq) && !vb2_is_streaming(dq))
+		return -EINVAL;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	ltr_mark.mark_frame = inst->fw_caps[cap_id].value;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &ltr_mark, sizeof(ltr_mark));
+}
+
+int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 ltr_count = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+
+	if (!ltr_count)
+		return -EINVAL;
+
+	if (inst->hfi_rc_type == HFI_RATE_CONTROL_VBR_VFR ||
+	    inst->hfi_rc_type == HFI_RATE_CONTROL_VBR_CFR ||
+	    inst->hfi_rc_type == HFI_RATE_CONTROL_CQ)
+		return -EINVAL;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &ltr_count, sizeof(u32));
+}
+
+int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 ltr_count = inst->fw_caps[LTR_COUNT].value;
+	u32 hfi_val = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+
+	if (!ltr_count || hfi_val == INVALID_DEFAULT_MARK_OR_USE_LTR)
+		return -EINVAL;
+
+	if (inst->hfi_rc_type == HFI_RATE_CONTROL_VBR_VFR ||
+	    inst->hfi_rc_type == HFI_RATE_CONTROL_VBR_CFR ||
+	    inst->hfi_rc_type == HFI_RATE_CONTROL_CQ)
+		return -EINVAL;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_U32,
+					     &hfi_val, sizeof(u32));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index a0d5338bdc910bd30407132e8b700c333ad74e4c..996c83fdc6f492dc252771129fc1d62e8b7a7e07 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -36,6 +36,11 @@ int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ltr_count_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 4d9632ba86bc8f629cee6d726eb44efcdeba2475..139e7a9321d30d3e348671f99b0fa81afed4827e 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -693,6 +693,31 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_VENC_LTRMODE: {
+		struct hfi_ltr_mode *in = pdata, *ltr_mode = prop_data;
+
+		ltr_mode->mode = in->mode;
+		ltr_mode->count = in->count;
+		ltr_mode->trust_mode = in->trust_mode;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mode);
+		break;
+	}
+	case HFI_PROPERTY_CONFIG_VENC_USELTRFRAME: {
+		struct hfi_ltr_use *in = pdata, *ltr_use = prop_data;
+
+		ltr_use->frames = in->frames;
+		ltr_use->ref_ltr = in->ref_ltr;
+		ltr_use->use_constrnt = in->use_constrnt;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_use);
+		break;
+	}
+	case HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME: {
+		struct hfi_ltr_mark *in = pdata, *ltr_mark = prop_data;
+
+		ltr_mark->mark_frame = in->mark_frame;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 04c79ee0463d7f32a2042044fe4564718cc01561..34249fc0d047918c2463517b8303e30df3666b97 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -147,8 +147,16 @@
 #define HFI_INTRA_REFRESH_RANDOM		0x5
 
 #define HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH			0x200500d
+
+#define HFI_LTR_MODE_DISABLE			0x0
+#define HFI_LTR_MODE_MANUAL			0x1
+#define HFI_LTR_MODE_PERIODIC			0x2
+
+#define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
+#define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
+#define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
 
 struct hfi_pkt_hdr {
@@ -460,6 +468,22 @@ struct hfi_intra_refresh {
 	u32 mbs;
 };
 
+struct hfi_ltr_mode {
+	u32 mode;
+	u32 count;
+	u32 trust_mode;
+};
+
+struct hfi_ltr_use {
+	u32 ref_ltr;
+	u32 use_constrnt;
+	u32 frames;
+};
+
+struct hfi_ltr_mark {
+	u32 mark_frame;
+};
+
 struct hfi_event_data {
 	u32 error;
 	u32 height;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index f6a214a6815420f299be70f80732943d02168f0c..2b8c87c25a066ead30bb1b134bdc3fe1e84e8f05 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -71,6 +71,9 @@ enum hfi_rate_control {
 #define HFI_PROP_MIN_QP_PACKED			0x0300012f
 #define HFI_PROP_MAX_QP_PACKED			0x03000130
 #define HFI_PROP_IR_RANDOM_PERIOD		0x03000131
+#define HFI_PROP_LTR_COUNT			0x03000134
+#define HFI_PROP_LTR_MARK			0x03000135
+#define HFI_PROP_LTR_USE			0x03000136
 #define HFI_PROP_TOTAL_BITRATE			0x0300013b
 #define HFI_PROP_MAX_GOP_FRAMES			0x03000146
 #define HFI_PROP_MAX_B_FRAMES			0x03000147
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index dd0a4210a2647ff4dadf8d67b71c6f4a22deb548..c48dfb6d47734fadd4f2e4123c93560f55355b86 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -29,6 +29,9 @@ struct iris_inst;
 #define MAX_QP_HEVC				63
 #define DEFAULT_QP				20
 #define BITRATE_DEFAULT			20000000
+#define INVALID_DEFAULT_MARK_OR_USE_LTR		-1
+#define MAX_LTR_FRAME_COUNT_GEN1		4
+#define MAX_LTR_FRAME_COUNT_GEN2		2
 
 enum stage_type {
 	STAGE_1 = 1,
@@ -148,6 +151,9 @@ enum platform_inst_fw_cap_type {
 	VFLIP,
 	IR_TYPE,
 	IR_PERIOD,
+	LTR_COUNT,
+	USE_LTR,
+	MARK_LTR,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index e7645bd60eb46785e0110a34f3257f7c37bbfca5..13cee5f72a443b85136d30b41b589aeb0db8eb9a 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -249,6 +249,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_ir_period_gen1,
 	},
+	{
+		.cap_id = LTR_COUNT,
+		.min = 0,
+		.max = MAX_LTR_FRAME_COUNT_GEN1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_LTRMODE,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ltr_count_gen1,
+	},
+	{
+		.cap_id = USE_LTR,
+		.min = 0,
+		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN1) - 1),
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_USELTRFRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_ltr,
+	},
+	{
+		.cap_id = MARK_LTR,
+		.min = 0,
+		.max = (MAX_LTR_FRAME_COUNT_GEN1 - 1),
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_mark_ltr,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8250 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index b3425dcea22ceadbd56021e5859a24134100d5df..6ae34312f50d4a3709ca20b3aadcfee12338a2f7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -637,6 +637,36 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 			CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_ir_period_gen2,
 	},
+	{
+		.cap_id = LTR_COUNT,
+		.min = 0,
+		.max = MAX_LTR_FRAME_COUNT_GEN2,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_COUNT,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ltr_count_gen2,
+	},
+	{
+		.cap_id = USE_LTR,
+		.min = 0,
+		.max = ((1 << MAX_LTR_FRAME_COUNT_GEN2) - 1),
+		.step_or_mask = 0,
+		.value = 0,
+		.hfi_id = HFI_PROP_LTR_USE,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
+	{
+		.cap_id = MARK_LTR,
+		.min = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.max = (MAX_LTR_FRAME_COUNT_GEN2 - 1),
+		.step_or_mask = 1,
+		.value = INVALID_DEFAULT_MARK_OR_USE_LTR,
+		.hfi_id = HFI_PROP_LTR_MARK,
+		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
+		.set = iris_set_use_and_mark_ltr,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index 1e54ace966c74956208d88f06837b97b1fd48e17..8139fefe40fe179ff7862bbca879ce94c71c1f89 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -668,6 +668,19 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 				  num_vpp_pipes, inst->hfi_rc_type);
 }
 
+static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
+{
+	u32 num_ref = 1;
+	u32 ltr_count;
+
+	ltr_count = inst->fw_caps[LTR_COUNT].value;
+
+	if (ltr_count)
+		num_ref = num_ref + ltr_count;
+
+	return num_ref + 1;
+}
+
 static inline
 u32 hfi_buffer_comv_enc(u32 frame_width, u32 frame_height, u32 lcu_size,
 			u32 num_recon, u32 standard)
@@ -693,17 +706,14 @@ static u32 iris_vpu_enc_comv_size(struct iris_inst *inst)
 {
 	u32 height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 width = iris_vpu_enc_get_bitstream_width(inst);
-	u32 num_recon = 1;
-	u32 lcu_size = 16;
+	u32 num_recon = hfi_buffer_get_recon_count(inst);
+	u32 standard, lcu_size;
 
-	if (inst->codec == V4L2_PIX_FMT_HEVC) {
-		lcu_size = 32;
-		return hfi_buffer_comv_enc(width, height, lcu_size,
-					   num_recon + 1, HFI_CODEC_ENCODE_HEVC);
-	}
+	standard = (inst->codec == V4L2_PIX_FMT_HEVC) ?
+		   HFI_CODEC_ENCODE_HEVC : HFI_CODEC_ENCODE_AVC;
+	lcu_size = (inst->codec == V4L2_PIX_FMT_HEVC) ? 32 : 16;
 
-	return hfi_buffer_comv_enc(width, height, lcu_size,
-				   num_recon + 1, HFI_CODEC_ENCODE_AVC);
+	return hfi_buffer_comv_enc(width, height, lcu_size, num_recon, standard);
 }
 
 static inline
@@ -1402,10 +1412,9 @@ static u32 iris_vpu_enc_scratch2_size(struct iris_inst *inst)
 {
 	u32 frame_height = iris_vpu_enc_get_bitstream_height(inst);
 	u32 frame_width = iris_vpu_enc_get_bitstream_width(inst);
-	u32 num_ref = 1;
+	u32 num_ref = hfi_buffer_get_recon_count(inst);
 
-	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref,
-				       false);
+	return hfi_buffer_scratch2_enc(frame_width, frame_height, num_ref, false);
 }
 
 static u32 iris_vpu_enc_vpss_size(struct iris_inst *inst)

-- 
2.43.0


