Return-Path: <linux-arm-msm+bounces-88198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C20D079FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 08:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A9DC0301FDAC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 07:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED062F8BCA;
	Fri,  9 Jan 2026 07:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YhCaykfL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWr6lBQU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF9E2F659F
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 07:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767944582; cv=none; b=PWHB/I41KMOPa6hLYQr7NaOfF8NMB/+H6H0GU0Itd5+ctzaFolsW0qR1TXPvHHMhDHj8BioZ0pEJiozwRloba3VehET0a4ToUAEYV8B0OK0HiUeTgzdxrsMfFfZ5IsfeCSYtq/jGqKyje03uA/8e2oifn/eMeBiMRmyc05rexd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767944582; c=relaxed/simple;
	bh=eNf92h2XycwAqn6GgXBwodbBeaSwsDpdlIqrITfFu+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L/QC0krEJ8x6UnPyL11YdTGla946P00x4jMpx6Fy5N8xvVz5cFFWcBRRh/wkpWbii/TARFtIecxS7Vrul5kc9evcW9cmkbwGmWNSseBkZ3tcSDfSefvWLABQx+MMgNpjEJgiTloC0ylQWgEIrzUyrLuTU6fgIub1JvKht6w09QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YhCaykfL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWr6lBQU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6095DFeD2765544
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 07:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	07STIKTT7SiIjROtHnGY3zH2taK5h9biXLrShaG+TgU=; b=YhCaykfLQ5e7RHeY
	jKvEyt1kvlZTGOJucd32yAIPG0OviFXRYX2FHHbzLyibPloa+6rIOWqB+1pAh+5w
	6pDcpll8Nz1ga2PQU6GCwXO5OFTHrFqom50OBphJZFiroe/QTfRtbI5Y2C9tYyYC
	Lg6ZqSbDXtzht2ygQFRL4SIfm2Z6PPjMk9MT45cUTYTePfcN5ZnFg4po7GYzCUIi
	vvztB1YaWMMxIc+Fx1GLmICrp82lvc4iHHAyFSnB7Xrtneyz1b34bsZzfJb7vsQ4
	iiA34RvgsSOBwq2B/RQrmDICtMonk6wOTKRBW4k8EbG+EAokfNjX6gHX/LKKOBKq
	U39E/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfejtf8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:42:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f25a008dbso31176915ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 23:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767944578; x=1768549378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=07STIKTT7SiIjROtHnGY3zH2taK5h9biXLrShaG+TgU=;
        b=QWr6lBQUkjy0Ll6joiA9FETMswMo3bYeQ2zpCNbZ5w99O0zMDL8dMKKYLPW3mljGTN
         vBbeLDwHrVe812A/1qChpmQ/LdYv5tu700b8hIFx/QCZ/ISxQ6kvjOd25656pwHxf3OF
         K9pvr5ha/v08DmLqSxtRvAWkhfo7vjErFDpYeWYDrRxNyUnD5ZhqgKG/zqlEClF44ixL
         qTiRq3c1031tIhYQ7So4u/tGMFQd02DSOt9qN58D1HeD+CAgMDdd6w+m3KW7bE0Vgkl8
         +rOS7mi1OBszYD+bM13syHYyPVfFvMTEkFszjfoOsRqCTVXp18BRa+1FLNBrQDlayW1r
         O7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767944578; x=1768549378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=07STIKTT7SiIjROtHnGY3zH2taK5h9biXLrShaG+TgU=;
        b=tMLDOd6bIrWdedpJu6cr9StLdFcZbhDVeCBIkMdG5P53XO6KxZavS54OKt7567lrmx
         FB8/VDFoPCqOARl2SMj1dSqYecZwnuX7REQhkl9NC1nCz7WdzLkC2NYKHsHlFfOPeBs7
         8f2aJcQ6zPG9/x5jFSf0+ImU68nq76n54rc56ku3AEefNvVylekLklyzCpsBoA4wM06e
         A938vyjSJJHjrKdx0MhMTvffqEe0jazdC6mPszvJHQIvPrvqPoNHC/WQx2c5kJVLBSGH
         sFZJVZi3bZLR9YtEFEhwdPy2EbUE2O875zmohI1HfT2o9bgq0MEz4sg+7Fcxx72iaRoo
         JD5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxHRN/7ih+3EqPhXWe6NNoBokRrGqTQ5esw8sLQ2adoV8EHc0GHlWnnKz1Mg+2euL0m/3Dp4D5T+Jpnj5s@vger.kernel.org
X-Gm-Message-State: AOJu0YyzoYVVEzqk5MIgarEc3ylEPwR8caRjGwETnc/dxUAmY9vt/e9d
	dyRIyB7gORWQNh8a30DQua7qbfaTH0wtuFj637GP+zO8iiDxpCNvlG8MPVwfqmp7E8GCfx22DfD
	x+CPKopzHBRU80JZyBhXYxd8pjme/kdkIHhzJSMu6m1Dnjn1MssB0cT9xdufujL8l4X12
X-Gm-Gg: AY/fxX5mf0ZGwEWDF3E8P4hg8gfYowzIWjYYtVbMvMm2VYZ7EeygycBEIETMZ3QjX34
	ERi/OQjHA47ZkCuU8hGuQkifpSLOKPNrTFMAEkeWmit5TvN2LzgvarEMCq+Z39j2AHUlIi3+/Of
	vvJaCqSFN55VgyJpmH9xck5zkuYoUSkXsfVugKXXoPESly1R2scx7Z+J22kNe6KPbzUvPSmTMh7
	BEMQuyRchTK5+RmmOj9N9sDNrcmBEM8NcYUWgY2jpM7uD5aRjkrK8NIadKzQz1VO0TCA7DGWBP2
	4uLg2GwtDTUo2uezbwStyAu/Mp21RUDvZz6lqZQNmJzvmuzCMbNRq5UZ/7Jv5d84rJuG8GqgrNu
	BEukSO6eU/m+0qwsIaSKAe6fhEELttB90/9Y2yGy+Kh1s55iwuqXlPAEy3ojkFMoMdF88RH75ei
	UKI+UWgOD+
X-Received: by 2002:a17:903:247:b0:2a3:bf5f:926d with SMTP id d9443c01a7336-2a3ee443a50mr71564975ad.24.1767944577655;
        Thu, 08 Jan 2026 23:42:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIWXnWTB1ETZgA5WBffjzF8zRgAs7p0APDQOqsopdFA2oc+ZeKmWwx6D6FVmIFXiZTxOnRqg==
X-Received: by 2002:a17:903:247:b0:2a3:bf5f:926d with SMTP id d9443c01a7336-2a3ee443a50mr71564775ad.24.1767944577150;
        Thu, 08 Jan 2026 23:42:57 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd46a9sm98638195ad.93.2026.01.08.23.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 23:42:56 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 15:42:32 +0800
Subject: [PATCH v3 3/6] media: qcom: iris: Add B frames support for encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-batch2_iris_encoder_enhancements-v3-3-196855ef32ba@oss.qualcomm.com>
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
In-Reply-To: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767944563; l=8694;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=eNf92h2XycwAqn6GgXBwodbBeaSwsDpdlIqrITfFu+M=;
 b=KsMTs5dCukBXPCu4bXDGIgsLHJHC3ejWvQwo2KtMSqJbvl57ySwTSFE2IlNQpgGTlTaY64iIP
 2OKkF4GDuGeBsEXz9QRl6FTNvZmoeh348ZS1lyLxJYxKBwfSiTSfv/h
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: t9Fz7FH4WuG05D6cCmGMphi5qpzdqsaW
X-Proofpoint-GUID: t9Fz7FH4WuG05D6cCmGMphi5qpzdqsaW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1MyBTYWx0ZWRfX19Ncvx4JrtuP
 m5AWVDQbyZ6hmpvKB2MbXGG/1XeCTip5m5bNfYQOlSr3tV2HqE+0lZPm2Y2NGI/abGS+kUGrQaE
 77HYVDkjfzl6s29zSXvIgDWn1QNw0SP4N+fkE+/50KctBMkOmdN4JJoxe/6716tfOc6AfqX4cyQ
 4tAVlsv37x7Pji89lnfXk/WoBElGgLMDhFuaQHDvQumkAJ3jquRIA0HRN+QC9e4lr3Dklnv7aaQ
 PsmRwtLi2myw+8gSqnTRpv+MqZarI7vkH4KY1cTTWW1jZc8jRDQJ9io1sHSLjnyWgoghJ4BeKO2
 Ewr4DFkqslkhImiJHzdeeMviFcZ8j26MCcyFk8omLZbZgflLXR9c2MLoycUOVOwieBLQjBd2gvT
 NROuFIww/syhRLyAgaI+P0uex6Uq8/9ZqQnyejIOII6N9T0kaPcDwu25zp3/0aylbi11byNy/23
 mjMzaDw6YFlXoa1P7gg==
X-Authority-Analysis: v=2.4 cv=ZfAQ98VA c=1 sm=1 tr=0 ts=6960b182 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pbVt0xer8RvNRR6Ob3QA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090053

Add support for B-frame configuration on both gen1 and gen2 encoders by
enabling V4L2_CID_MPEG_VIDEO_B_FRAMES control.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 30 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 ++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 10 ++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 18 +++++++++++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 10 ++++++++
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  6 ++++-
 8 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 428203af725ab5697ee42b5adf9557c65fafd7f4..02106a4c47db7a8b2e6461acb9d24a22291ff3cb 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -114,6 +114,8 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return USE_LTR;
 	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
 		return MARK_LTR;
+	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
+		return B_FRAME;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -217,6 +219,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES;
 	case MARK_LTR:
 		return V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX;
+	case B_FRAME:
+		return V4L2_CID_MPEG_VIDEO_B_FRAMES;
 	default:
 		return 0;
 	}
@@ -1153,6 +1157,32 @@ int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_
 					     &hfi_val, sizeof(u32));
 }
 
+int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	u32 gop_size = inst->fw_caps[GOP_SIZE].value;
+	u32 b_frame = inst->fw_caps[B_FRAME].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_intra_period intra_period;
+
+	if (!gop_size || b_frame >= gop_size)
+		return -EINVAL;
+
+	/*
+	 * intra_period represents the length of a GOP, which includes both P-frames
+	 * and B-frames. The counts of P-frames and B-frames within a GOP must be
+	 * communicated to the firmware.
+	 */
+	intra_period.pframes = (gop_size - 1) / (b_frame + 1);
+	intra_period.bframes = b_frame;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &intra_period, sizeof(intra_period));
+}
+
 int iris_set_properties(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 996c83fdc6f492dc252771129fc1d62e8b7a7e07..609258c81517b71523b682ca994786cdd020b07f 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -41,6 +41,7 @@ int iris_set_ltr_count_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_ty
 int iris_set_use_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_use_and_mark_ltr(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_intra_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 139e7a9321d30d3e348671f99b0fa81afed4827e..fe51eccb903be146e83a4fb2faf4b4092875dea4 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -718,6 +718,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*ltr_mark);
 		break;
 	}
+	case HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD: {
+		struct hfi_intra_period *in = pdata, *intra_period = prop_data;
+
+		intra_period->pframes = in->pframes;
+		intra_period->bframes = in->bframes;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_period);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 34249fc0d047918c2463517b8303e30df3666b97..4343661e86065f5623b2c02c7ee808a3c47a8c41 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -155,6 +155,7 @@
 #define HFI_PROPERTY_PARAM_VENC_LTRMODE				0x200501c
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
+#define HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD			0x2006003
 #define HFI_PROPERTY_CONFIG_VENC_MARKLTRFRAME			0x2006009
 #define HFI_PROPERTY_CONFIG_VENC_USELTRFRAME			0x200600a
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
@@ -484,6 +485,15 @@ struct hfi_ltr_mark {
 	u32 mark_frame;
 };
 
+struct hfi_max_num_b_frames {
+	u32 max_num_b_frames;
+};
+
+struct hfi_intra_period {
+	u32 pframes;
+	u32 bframes;
+};
+
 struct hfi_event_data {
 	u32 error;
 	u32 height;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index c48dfb6d47734fadd4f2e4123c93560f55355b86..34deb32eb5be0899fee779ff99b3f4b8bd91529f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -154,6 +154,8 @@ enum platform_inst_fw_cap_type {
 	LTR_COUNT,
 	USE_LTR,
 	MARK_LTR,
+	B_FRAME,
+	INTRA_PERIOD,
 	INST_FW_CAP_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 6650414fd8b7f127062e95f29203a55b33a43fa2..14bb72c223dd86a0bd22d863df73159169871031 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -279,6 +279,24 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_mark_ltr,
 	},
+	{
+		.cap_id = B_FRAME,
+		.min = 0,
+		.max = 3,
+		.step_or_mask = 1,
+		.value = 0,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+	},
+	{
+		.cap_id = INTRA_PERIOD,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROPERTY_CONFIG_VENC_INTRA_PERIOD,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_intra_period,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8250 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 6ae34312f50d4a3709ca20b3aadcfee12338a2f7..7c9a71755685d195a7adc8064523e1c33a572089 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -667,6 +667,16 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.flags = CAP_FLAG_INPUT_PORT | CAP_FLAG_DYNAMIC_ALLOWED,
 		.set = iris_set_use_and_mark_ltr,
 	},
+	{
+		.cap_id = B_FRAME,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_MAX_B_FRAMES,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_u32,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8550 = {
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
index b7413edfbc5646fbdee6139d1e6897d730e2c8d1..b5fb616916e5c7bf46998fc14510af9c9341cf10 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
@@ -670,11 +670,15 @@ static u32 iris_vpu_enc_bin_size(struct iris_inst *inst)
 
 static inline u32 hfi_buffer_get_recon_count(struct iris_inst *inst)
 {
+	u32 bframe_count, ltr_count;
 	u32 num_ref = 1;
-	u32 ltr_count;
 
+	bframe_count = inst->fw_caps[B_FRAME].value;
 	ltr_count = inst->fw_caps[LTR_COUNT].value;
 
+	if (bframe_count)
+		num_ref = 2;
+
 	if (ltr_count)
 		num_ref = num_ref + ltr_count;
 

-- 
2.43.0


