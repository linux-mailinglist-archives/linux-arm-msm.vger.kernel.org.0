Return-Path: <linux-arm-msm+bounces-88196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D80A7D079FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 08:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB889301835A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 07:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1FB2EFD99;
	Fri,  9 Jan 2026 07:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1RM/76e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vzhl5BB6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B562F362B
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 07:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767944574; cv=none; b=MEdIjpsa06J/dEwG6A34yBoyMc9D8l73hhq7O21Fnu2yQs5+Ik9iozprEuUlQrAiM9XQWhx/iqmhd+/qIZwSllvHqJkganE/VKrXVbLSH9v7wyx00Z7yepfM+1tbDGX4pPr3MvGbdjYYjze1/P7SzZdgxThQFy7NGP9NRJ2QN/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767944574; c=relaxed/simple;
	bh=nIfWHbo8tV1M0b0OU9vJP6hz1dzB/dy539hJzfJpt74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q1qWejgRFHVaJIHzVTZF2KfvIvsfU2ddcxK/hrcsgDE4es2S8ZGOYOa4NeR47ShMHPZUULsSNcW5GYRBLO7YEqv/24vgUnzKjOZMtv+/ADnRPG0RAHSP9Y5vOThnW3SJU2VKH0UPQdan3Ht6JR1ZWpT3+kLv1eVdaq28+bm3gK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1RM/76e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vzhl5BB6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608NpjJ33727434
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 07:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VO+Nn0puAol/BScDxth/7TSs4ka5avtvTMGh9iTJxz4=; b=I1RM/76eEyS47/jB
	Kv9xRXO6PpQahtQbB9oc8keRXo5JnemPA4pL/tgtC3NmykV0OAt191OnIN9mmuHk
	sC48yobvXD9jltCFNnFny31v5WImqxS8KAdiJKu9HC85iuIQQtNfwFEtgpI5csYc
	hscI41Rq99clu5beBPge+uYfqyWC5UOX8WHNiSQL0A6tL4FwmUgR896JiC6Zh9PZ
	PdTngmK6RgPOhbsq6Op71wvlryN9zr+SkcUj6oFwb651DqJOnhr/jBt8XGGGv9qR
	hSK4aIhmGXU8vXHOA8PssCCgGJ46KC2aIs9UFSP/8GlnfnrFJTNUKYmMWvG54DLx
	F485/Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjpmkh4mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:42:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so3137244a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 23:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767944571; x=1768549371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VO+Nn0puAol/BScDxth/7TSs4ka5avtvTMGh9iTJxz4=;
        b=Vzhl5BB6oMxDjdOXXyqOrh+QckBoMp6wRjgInPbJaBJwYjcUf3qRdgWWj4Txebjrs/
         GGs//wU9la7ECymUUZCz4GN6yqfvJt7JEnsO0s58KGGFQbxASuqr9DiQ9Ssa0ur2UEgc
         DgSK5imguXtJX9Ug7R9cG/f8Q5JwM7DK0OM7MfYMU9xhK2vIc9+iyORXMw6iM0bl+hL/
         vz6q/+SQll3mNbLcfS9oWEmnT5zzmZ6JrCgbhGpDBWyGKi5guycsXaW0JftssEJ5Xv5B
         57k3DTpeve3vL5N5Pi0MGyfo1U9ezaTo6+eTKubbK6PRrQfjT1X1+5atPGRCwm1M9XZh
         Qypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767944571; x=1768549371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VO+Nn0puAol/BScDxth/7TSs4ka5avtvTMGh9iTJxz4=;
        b=pEGTGVQjF2wvhT9wbIm1hgDm02jR0+HtYwfCa+9y5sEmsLFS96SFJzIi54x0jG7ktE
         OlOnMM6Q7Vil8sQZyyn3D5RU88DV+1UKxirtsKaM8eB2BqHhM1GunRL4hMz+lZuU0ppa
         WQKpmEQBjpf2SESstwruZNXOnRJCJh3D6C9fIyrwe1byqJa3G6cBqkYft2552zvW2f4l
         seKrbHmXX+u9bLGuJF5ignbTm9cMSQ2hgxD0v+fECZ5EZgQBBNks5B+aKBffVET8dbLp
         w44D09yFe21T2P/dhhbaJTj5uD3Ab1T+/4cgwNlyYzSP2jRKSv6aos9PNemf9L7Xu1ms
         PJRA==
X-Forwarded-Encrypted: i=1; AJvYcCU7vmH0m3aYmTu+lsH4kWsKVKk/xoLfHMPB7RCAsLCwM46X3naNWumdMC7q+pP9GT8yGp9DcUAyT+K0flnr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5dfBPxV+Jd+2EGKYbRWqVUqhfT+LwlWck/omnBKt6SLEMQPr8
	a1DIR2hUIRLI5tF5erGLUHZm/8a1YKnCtOpb/8YgT9pls2fEbjTKfc4tZ4LQ8xJ9jr5PpAPx2GJ
	jcplml4WQR6FF5blMluiKWoNG7rGRY/BF6b9FJiYy/zSZ1jgiBj+LiMJKASC3h18DXD3C
X-Gm-Gg: AY/fxX4/ARlm9wHOOaVB2hHb9GPDLA2i7ozzdg6piG43Ut3Kph47vl5UcKgtgad0S2C
	kPIcXjjDEWPYE+0eNLsZd17m8DLJxLtfBSwrHVLtogpSBZsquvgZsFo5zqcCmHvANah3fvzJpS9
	STz5HwnhJLiPOADb+d2P7OZCHzMvQ9YS6oMM06T0XgnLwhYGSgaVKaRcXu3AnridoymIK0BobAI
	KPdyPWYiVRCwQUm6bQUprdSe61vRKmZvxctSI6FDNCS4D9ExZhPsIKL33Cv0lKuYoTfHVlBRyk1
	5AwYypIGRiF7cxdWbxvffY1KmYmGXMf6E6ncaXVZJzKEJHZYtGBaSzKADCj2695d/lhyNQg7Z+f
	M8E6x37CDUHEyPR5VQoIa/zfa4bTcSaNd+/2kYMMRsFns/3lKnZn9q1145HkBN/P53Te90tK6QS
	XdmuPAijqx
X-Received: by 2002:a05:6a21:6d8c:b0:352:7cc0:93b7 with SMTP id adf61e73a8af0-3898f952f05mr9481300637.40.1767944570936;
        Thu, 08 Jan 2026 23:42:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrzfIJ8DmMW4QScinzEAhYgUNKxCYq/bobNP2Srxk7VoMi4yjGJgEMS/QOi/5SBgY+L7kH1Q==
X-Received: by 2002:a05:6a21:6d8c:b0:352:7cc0:93b7 with SMTP id adf61e73a8af0-3898f952f05mr9481271637.40.1767944570368;
        Thu, 08 Jan 2026 23:42:50 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd46a9sm98638195ad.93.2026.01.08.23.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 23:42:49 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 15:42:30 +0800
Subject: [PATCH v3 1/6] media: qcom: iris: Add intra refresh support for
 gen1 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-batch2_iris_encoder_enhancements-v3-1-196855ef32ba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767944563; l=7732;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=nIfWHbo8tV1M0b0OU9vJP6hz1dzB/dy539hJzfJpt74=;
 b=1UXOW7fhykUMw4iEs2sVKcK8tHjqGO1+19z1gkp8uMgoVZSv1eepF2KIJxp47rVvO64wmPggj
 JA4L1viT+GPBQeCGgAYiyNH7F0LipZllOuuO4oShhPhkdIvztwH2tu8
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=YNiSCBGx c=1 sm=1 tr=0 ts=6960b17b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=vcDqveFK9my7lXZq-ZEA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: NxRDaXKYwA49Rn0DZjy794jantIA1LKT
X-Proofpoint-ORIG-GUID: NxRDaXKYwA49Rn0DZjy794jantIA1LKT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1MyBTYWx0ZWRfX2ltz84kenzyE
 oXeC4J0Pw3/dJl3If/TX/9LYKSJ1/Ylc1xOj5caa1aYvXPRF4Fv5Ybh4AvJH0/bt7fOyJjzI7uL
 xKzS4iHLdD12fTFPQotxNo0rno1y3zXQ6AEqINo5qOKc97amZNwwgQ+bPejTttnk8ShGbxFLfO4
 511RUEYG+I0ShXnroqiet7JJxevwJdnaCebhweHlylUyVtDCDJNACIv/dLJ7aRiNd99FPqv+OZP
 OxlFo6sR9eTC3g1PrH1Njdf2ykJjEBktw5I20xAjtqNPCgvSKGINibaUZLyMm9ZV91xoLrakq9c
 xoeKhtZ58vTdxoNMNsRk060oWQuTrXczNobbTotolf/qV3ia+1GZjAEVu6ZXkovy8kIf+g348vY
 8dQDo0F0F/zkQ9IY6HwrpLvnrAJPnIzbQLnfxe7lkWMutiaPmxaJqIBTXIyGKvpV7m9Hkq54oK0
 6eg0pHt/1zUigf0tpaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090053

Add support for intra refresh configuration on gen1 encoder by enabling
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 39 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  3 +-
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 +++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 13 ++++++++
 .../media/platform/qcom/iris/iris_platform_gen1.c  | 19 +++++++++++
 .../media/platform/qcom/iris/iris_platform_gen2.c  |  2 +-
 6 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 1910aa31a9b9218e9423f2916aa40b85185f0dfb..eae4fedc929e980eb001a5a6625159958d53a3d1 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -962,7 +962,44 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
 					     &hfi_val, sizeof(u32));
 }
 
-int iris_set_ir_period(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+int iris_set_ir_period_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
+{
+	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
+	struct v4l2_pix_format_mplane *fmt = &inst->fmt_dst->fmt.pix_mp;
+	u32 codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
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
+	/*
+	 * Calculate the number of macroblocks in a frame,
+	 * then determine how many macroblocks need to be
+	 * refreshed within one ir_period.
+	 */
+	hfi_val.mbs = (fmt->width / codec_align) * (fmt->height / codec_align);
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
index 34cbeb8f52e248b6aec3e0ee911e14d50df07cce..338f33f39cdc09094c63e476572b0a58afc7ef67 100644
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
+		.max = ((4096 * 2304) >> 8),
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


