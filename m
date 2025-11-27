Return-Path: <linux-arm-msm+bounces-83536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE0EC8D29E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 08:45:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8709A4E3F46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 07:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7767F2BCF4C;
	Thu, 27 Nov 2025 07:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j0EaOOPA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BN9h8JkV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E91D31E11F
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764229508; cv=none; b=h4bIZL+eeP/INTANJAZqNW+F6taNAbmA4DycPksERqhLiNxaPczlePLTNqZQs9Usrl4adZRK1IpxuZiR8t+vypyjBTBda1cX0ZRaYEmNOzrvz4Vw6azWJAwWXPISAdf/HSWYbSGht0K56Sr7n4p4lK+8Yj9nHKUJcSbOJt5Do6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764229508; c=relaxed/simple;
	bh=62yHg3hh71KIruHNPFq+ED8QXPsjJIOQNzXjZ7R3xfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HchszPmz7Cvnl0fFxKK4jJCmjm+dDbMlo7E9utHuLFP8kVja5Q7aIJw5Pfn6JYaXAyyBJ56p9Q1u/c4V1ijSCgyFd+jJJ6D64m+lVxSvjCz5xIE2qJsqq3gRg1Nh++fN2PVir3RycCm6Avg+YZ4b2jVYI7L1ToN9tkmEwRR7+wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j0EaOOPA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BN9h8JkV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR5gssp2855082
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uZsRgN+SGd8JNf5XYcyrE5CixvzHImK8dE49Zi3ZDO0=; b=j0EaOOPAukJQnVFh
	JP8bq0LikW5Rb+pxhyH3v+sIdKVfiGPjUl6hQOqH6YQrxGOBI0GuNoMw4Cusoibt
	3qsW/PLXny++o/ioptn4PQCliNMhhpxw3fwd063VOh+NQOyxBRAz3X6HM0r76DfC
	CmixyMAtK6JUPcTzQKmoKhjASfsXg+D/aBUQ0RPwBVOt8F4SAIUN6/9KZApV/NnT
	QREuvoV8oMG9GZMW2HH9pjIREJjKCIix6FN26+KWxTzdy1m9Evq6jHixr5l5Vixn
	3Rj2bclg5JxCHxGbkKF2FpL0PiLbZE2f/bCoyj538gUxTUcKyHj6aQe7ZOuxsgnw
	NlIExw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap4vha2sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 07:45:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295952a4dd6so18755295ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 23:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764229503; x=1764834303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZsRgN+SGd8JNf5XYcyrE5CixvzHImK8dE49Zi3ZDO0=;
        b=BN9h8JkV1PzSRRTgD59svsfK0UJri3Zjgpa5xY+fp8bcRaY3LbyNj6YFWneSliGNaY
         JAeOxC5dTx8m2UL1uXpulP4mX1BKyD0IkHQymQmAoNF4yuephjJWZjNcrzTWxvbC+5dw
         wlCddmQJhqBKSy5WtuP8l+/pcIGeWmsimJpBKjXqjpHMPMiIFceBxwOGqKmE08MxG2w7
         yIWV9nLPodIBFIaXHl9Wik5dCcoBXl4QeELBxW7aSOJ5dIMoCd3yqV7jhS2UQX1ol6WK
         osaOt3KjwSFFbv6gN/uH/ec+t9TyNEUTHuOFK9U+QyNna7bW12y1EMun1/NmaHsNyMrd
         SGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764229503; x=1764834303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uZsRgN+SGd8JNf5XYcyrE5CixvzHImK8dE49Zi3ZDO0=;
        b=P07+U4Dc62gIGPX4c6cA1v2NnjH+ju/+z6gHj7vI9kPeC9olEsqEmtZEz6gluva3J1
         cgmMi9L7YbXm/fHb8GyPkWmtPgGoHhMWEiYIQenRsnonHdGxAgU6yKZQ2SQdktiiSPB7
         QHcJSSjpg4knyhv29raauu41WGVlsdXr6YrQK1q9FxwFEzkW5Ow7jP3Ch8Nk7HfHwWMc
         LpJyt1sWQBWsXfwDkZRcihCyfIZdt/DvMTkJs6RWznVH+o/ZyfXUwnfCbrER2bSo+2k1
         B0DYLt2M/ql3Xjf1T4QFj0tkx18Y6tx1IGtgA/HCPJFzsTYeU7gf5zh4Po3+KilSqW+a
         XKGA==
X-Forwarded-Encrypted: i=1; AJvYcCVyyRTimKQKoTUgdLW/iviLW5TVD5o2K3lyRbShi5OGzfp5X1gIMV5xK0Tf5XTgUKJCg3BYC4BUocopSFpU@vger.kernel.org
X-Gm-Message-State: AOJu0YxMeoeoqnjAICw2/ik77JxdJXxcaN1npmbRfCLn3Vp6j5MXRpVY
	o2eNtqNvEZEC+lYnAQLP3rz3f+Zc0KPkyJVbjyXIx8KwQLLvbK6vG+UxFaf1My74QjW7cKiV5zg
	rQEeaJJGgGHztjpmygOgdSt9OV+6nFHtpkp4BDrDhYA4bFiKBepJCa9YAAvT+3RgBtZgt
X-Gm-Gg: ASbGncsrnghP8ijb5BHHvuvtv7MPlDkgA3enSTVp17PkCIlMhTb/QmZEIPtqduV8N8i
	CcDEqn8J2xPHQFGBMypmuVBJaCFOTGs7JxTHml/rbNQLAwsSO1tAb83lIZJkf6Sjh9czT0rIFFg
	DEVYs7tjcwVgO8ycXqMdZGhO5Wf+odjYjlqCyHexaocKTjD/1BsGF0qzTNR68jtXwWEtP9gxF6g
	Yh1ovdsHaYdlW2pAI+hkJm0oVMZPQbtKlh1W6a/TefefT1itrHy9QJf2NMpdGd5Fit76zcMce3K
	/ygxkifzHke6AIrUV2BcaAG0De975Ku+oBnQUK5TILye485wuZyDSyvbKR4+Z9thdwLk7GX4iAU
	V+CHaQbRlEpivxjVUbq01CYijBxQxNk+3nC7ozOQNwmYZYpCcNEmhvYPuBCYs+vrAUb+hB7a3Vm
	GoOoqP8JESvLGe
X-Received: by 2002:a17:902:ea0e:b0:295:5898:ff5c with SMTP id d9443c01a7336-29b6bfa9738mr297638565ad.16.1764229503217;
        Wed, 26 Nov 2025 23:45:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCoVBi2mrcfUzsvkd+Nn2J5Fw4JfSxVm2TujfA+/83DwBgoMwJ7yONyoGJEg6mzMo12MUbnA==
X-Received: by 2002:a17:902:ea0e:b0:295:5898:ff5c with SMTP id d9443c01a7336-29b6bfa9738mr297638125ad.16.1764229502639;
        Wed, 26 Nov 2025 23:45:02 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f080beasm908717b3a.47.2025.11.26.23.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 23:45:02 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 15:44:32 +0800
Subject: [PATCH 1/4] media: qcom: iris: Add intra refresh support for gen1
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-batch2_iris_encoder_enhancements-v1-1-5ea78e2de2ae@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764229495; l=7788;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=62yHg3hh71KIruHNPFq+ED8QXPsjJIOQNzXjZ7R3xfE=;
 b=jz4WG+bnbsvyTpX3z6pUF08KB4yc3OzNaCt9uuz46Ooh0+XBFJ3TbD0yzY5cU7JPw/PLHwNUy
 wGnZe4PrxuLAY6H7GCP9CeB5mlJgNzPzCZX/3QRmOQxfMG7eklVb/Zq
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA1NCBTYWx0ZWRfX/OdQxw3ndqlR
 A/IuV/1RuGfHSlBtSve1fjpG4U9Wa96OM97RLWBO/p2N6x2GR4xRsd7mPW1ZyMsTkUcLKJ1e7a7
 PDqG3Qul3Fd4m6pKjVzDRm1Xslw3jb42UD4ky8zagIwl7yhubkeyD94VsB6Vxvt5lkdebc8xnD+
 t7AJTcXOn93FTipH+zLZIqz8HgF75xStk7crmSe/rRYKQBT/AfnihkVSC+mKzE/+Ik/O2f/xSJb
 1XW+UGlatBKnfxx+ilr0Rn12uEQ1QEe8SfDQ6XFP0R+kSup7PG3zMvsrUtqIDYapqhr/vhG/Ztp
 JqOE9jI0oan5CzwlfXN1Fl8EKjjaF/nhSK1UIeY96dbuz83mp2w3CEion56d8BxYbjAYfZQzciW
 r+VT3GJjbKLUyyuw6YRplOFAwcuPsw==
X-Proofpoint-ORIG-GUID: lfnF3VoopTfNVX7CWgpGr8f3FMNpA4tx
X-Proofpoint-GUID: lfnF3VoopTfNVX7CWgpGr8f3FMNpA4tx
X-Authority-Analysis: v=2.4 cv=Lt6fC3dc c=1 sm=1 tr=0 ts=69280180 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_5abXKfY4upRfygJ6T0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270054

Add support for intra refresh configuration on gen1 encoder by enabling
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.

Key changes:
Added intra refresh capability for gen1 encoder.
Implemented handler for intra refresh period and type.
Defined HFI property and structure for gen1.
Renamed iris_set_ir_period_gen2() for gen2 to keep implementation separate.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 36 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 +++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 13 ++++++++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 19 ++++++++++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  2 +-
 6 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 1910aa31a9b9218e9423f2916aa40b85185f0dfb..cdf38c285b9133f20bdb9bc3dd0f5e916d3ed7f8 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -962,7 +962,41 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 					     &hfi_val, sizeof(u32));
 }
 
-int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct v4l2_pix_format_mplane *fmt = &inst->fmt_dst->fmt.pix_mp;
+	u32 ir_period = inst->fw_caps[cap_id].value;
+	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
+	struct hfi_intra_refresh hfi_val;
+
+	if (!ir_period)
+		return -EINVAL;
+
+	if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM) {
+		hfi_val.mode = HFI_INTRA_REFRESH_RANDOM;
+	} else if (inst->fw_caps[IR_TYPE].value ==
+			V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC) {
+		hfi_val.mode = HFI_INTRA_REFRESH_CYCLIC;
+	} else {
+		return -EINVAL;
+	}
+
+	hfi_val.mbs = fmt->width * fmt->height;
+	hfi_val.mbs /= 16 * 16;
+	if (hfi_val.mbs % ir_period)
+		hfi_val.mbs++;
+	hfi_val.mbs /= ir_period;
+
+	return hfi_ops->session_set_property(inst, hfi_id,
+					     HFI_HOST_FLAGS_NONE,
+					     iris_get_port_info(inst, cap_id),
+					     HFI_PAYLOAD_STRUCTURE,
+					     &hfi_val, sizeof(hfi_val));
+}
+
+int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 {
 	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
 	struct vb2_queue *q = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.h b/drivers/media/platform/qcom/iris/iris_ctrls.h
index 9518803577bc39f5c1339a49878dd0c3e8f510ad..a0d5338bdc910bd30407132e8b700c333ad74e4c 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.h
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.h
@@ -34,7 +34,8 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
 int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_rotation(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
-int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
+int iris_set_ir_period_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id);
 int iris_set_properties(struct iris_inst *inst, u32 plane);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index 52da7ef7bab08fb1cb2ac804ccc6e3c7f9677890..4d9632ba86bc8f629cee6d726eb44efcdeba2475 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -685,6 +685,14 @@ iris_hfi_gen1_packet_session_set_property(struct hfi_session_set_property_pkt *p
 		packet->shdr.hdr.size += sizeof(u32) + sizeof(*plane_actual_info);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH: {
+		struct hfi_intra_refresh *in = pdata, *intra_refresh = prop_data;
+
+		intra_refresh->mode = in->mode;
+		intra_refresh->mbs = in->mbs;
+		packet->shdr.hdr.size += sizeof(u32) + sizeof(*intra_refresh);
+		break;
+	}
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 42226ccee3d9b9eb5f793c3be127acd8afad2138..04c79ee0463d7f32a2042044fe4564718cc01561 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -139,6 +139,14 @@
 #define HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL		0x2005003
 #define HFI_PROPERTY_PARAM_VENC_RATE_CONTROL			0x2005004
 #define HFI_PROPERTY_PARAM_VENC_SESSION_QP_RANGE_V2		0x2005009
+
+#define HFI_INTRA_REFRESH_NONE			0x1
+#define HFI_INTRA_REFRESH_CYCLIC		0x2
+#define HFI_INTRA_REFRESH_ADAPTIVE		0x3
+#define HFI_INTRA_REFRESH_CYCLIC_ADAPTIVE	0x4
+#define HFI_INTRA_REFRESH_RANDOM		0x5
+
+#define HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH			0x200500d
 #define HFI_PROPERTY_PARAM_VENC_MAX_NUM_B_FRAMES		0x2005020
 #define HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE			0x2006001
 #define HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER	0x2006008
@@ -447,6 +455,11 @@ struct hfi_framerate {
 	u32 framerate;
 };
 
+struct hfi_intra_refresh {
+	u32 mode;
+	u32 mbs;
+};
+
 struct hfi_event_data {
 	u32 error;
 	u32 height;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
index 34cbeb8f52e248b6aec3e0ee911e14d50df07cce..e7645bd60eb46785e0110a34f3257f7c37bbfca5 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
@@ -230,6 +230,25 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT,
 		.set = iris_set_qp_range,
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
+		.hfi_id = HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH,
+		.flags = CAP_FLAG_OUTPUT_PORT,
+		.set = iris_set_ir_period_gen1,
+	},
 };
 
 static struct platform_inst_caps platform_inst_cap_sm8250 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index a2025d32b3235aaff25793ba77db143000e54bae..b3425dcea22ceadbd56021e5859a24134100d5df 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -635,7 +635,7 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.value = 0,
 		.flags = CAP_FLAG_OUTPUT_PORT |
 			CAP_FLAG_DYNAMIC_ALLOWED,
-		.set = iris_set_ir_period,
+		.set = iris_set_ir_period_gen2,
 	},
 };
 

-- 
2.43.0


