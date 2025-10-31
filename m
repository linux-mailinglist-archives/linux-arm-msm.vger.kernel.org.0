Return-Path: <linux-arm-msm+bounces-79845-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8E2C24485
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 10:54:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37F48188B560
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 09:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020B033859B;
	Fri, 31 Oct 2025 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n/bpTy2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P16AFVMO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1048133374B
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761904316; cv=none; b=kzcd/yO2HlSb41xaj45+dfBfDOBIQjv8kG61aTRfAM038+AGsa0dJMKud9Vf0Jr+KE/9/95R0LCyM+lGQS4LpDWYNUEJqIw10qSTO+1cwx7Y/O9V732SXVsc+YC5mlhdFFvNlLMilY4bsQ6G9a1UD9UGtGZKAmJh1yTN0O3ZURo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761904316; c=relaxed/simple;
	bh=yXQEX8LNu0TsL9VDTKU5gwOSUNtbhNTnq7C28ggjxog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FZh1+pSU1HZ5c6qvz0kXxrhnOIT6VRyA5N+4yyaDqzXAamCaj/mHcoYqA9+MnCHRM7x4ot7fOrXfoV4HO0Q/VKXM46fgzs3c1xWEcs0Y/wtz4AAN3FoLoDRPCVrhzCIvRBfDsQKX4HuF0os6CATiys10Rd9RNb5ilVlljw6NtnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n/bpTy2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P16AFVMO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V8SxW6872731
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7mUbZvm4xfQOmMBtO789r8Kq5Frjmsno6H4x8WK3gJ4=; b=n/bpTy2XST7oSEfy
	Ppo83Jjbq67eV08S19JwJUWgkhk0HZUyDGSZlJ921pMeePmRqyjamtE1tnIbg9fh
	hmf0R48u+CFQjiXm0DHK5gA+vJDt52JQkeZxeVc58ZShs6G1cnAwhCU8Ze/XCRqA
	2QDtSMvrhHAGyoDAVvbwKfEko6WheXuSdv7lWrQi/tmFR/v+s7t7DRUSXEBDfUtP
	Pk4jVMrvlm/0VaxqE1/m3FdtWJTdSYTjPwRQC65g5VGdGybiurXDyBwwgTDPrFX1
	lFNapuHYkDn/FgqJT7Z16ZslvdwivkjAk0AunLRPcGYCBprprtWTLb/oIJ1u0CWw
	0aWAqA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4fqn1qj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 09:51:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34077439124so2286182a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 02:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761904313; x=1762509113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7mUbZvm4xfQOmMBtO789r8Kq5Frjmsno6H4x8WK3gJ4=;
        b=P16AFVMOfU/XhaLl8hnHeFEFlqFR+jlol4rnj1M4crJnrnFP0zVgbB5fhkNgVPxiK3
         UbZbKq8nFa0eQrMNiRV7IWxxLwgLNbG8Az8LvyNtjy6S73ovu0bPvpEP/0pcK9oXZxz2
         YCPgbv2plwMO+P56yjD/jNsCOUdztAiUTQm+7BQaZH9gTg5EsQnvutFt+QOMvSr+kx40
         V4ZlMtl6xI86n0bND9oSo308C5bQUN5t+5jN4RdcKBnA3WStajZZ8RgWOzH44+3aJ4G3
         kZ1IYAO175s8aIJ5zQPpl1hkro85FpEJaitXehXvtHav+aT+gnRzF3hTsruf8OY89JEy
         huxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761904313; x=1762509113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mUbZvm4xfQOmMBtO789r8Kq5Frjmsno6H4x8WK3gJ4=;
        b=YK0NY5/XrDDPxuHoSUAB8DpcBNrbW50hQqDSUKbi3HC7aGiK1wO+zyTeZHeoK8Lh++
         LN0deX0g/AvxhGzkvPxoF4NTxsR/E2H66vmLXWM1oSOy+l1Airnj4BjC1/qjAgDI9fm9
         c4W+YV7amtwkcLwuOzhTEiwPnI5964iHFzeJsKXBhhyQ6c9nyuKeNbPXupf/H59gMs73
         49+pmXQu8wjw8BhInN3CxfoOToFY1XNCS27ICiU+KUxsw//tHJm8turvhUPSYFY6B/Cn
         Wee/CYCStneCnJ4G/G/fkvjz7sA2KxcNO60VBTabMgPQ0+VnsT4lMvG5auG0Wz0IW1pM
         vOYA==
X-Forwarded-Encrypted: i=1; AJvYcCW9akynbI682NMnzhaab2eAzrdtMPQdwEute7lI5hWY87D8zTJGOcjARCrGQafBGYddfzWQjieq/27fN/Et@vger.kernel.org
X-Gm-Message-State: AOJu0YxUBf857DL/DiCMpI8xnhnlfS+04vNQxuM4aT4lfzgcxtsIPi58
	RNYhRIgR9LpYq7v/ORnoOls6HrxJioIxQNRzgzMqXVSxVgy7mVRxfI6CuJCvDCx2GvQxKJnI6AK
	MsPEFQyLRnn3o3rmp+yeXwH+Lh3FkjZdRsovOE4Y/NO10Qm7a2nlhPULpC29yCjGgCYwM
X-Gm-Gg: ASbGncvJEJnEHe6RjrjI7XtZRpAMBvpbv1gl9PlRrTkG2LyBtGnhRxkQewylFqfO5SI
	NyR6ElTt02Z/Xv/8C6upf8wnV71D6ydEZoxeDJ3r0aED+BebdnLNXXvUeOq4WV5kwbWpMA2c9O8
	WKZWiwm9yRi/hP+0cQyF0L3fyJ39FiNHogylgNsSNEq/ktqfOPJdSOS+PcmACSq4Ml0h9dop/2K
	gH1P8bM2MKXAQ7XNRAAOlBCIinFuHvxDWGkvJfgXgGircES8FW8INTXUCndtik/mzjSINMfZJf0
	q3cINUoaC5gZTOS6hlRJcd5ntJjmshFRPrDNYxNA8AhDCwgJ664lF0GWrMOGTnHM/KHzzfbXbZK
	R33DT0HZnTOq7ribKm577jP+xrw/ldbqD6zfUy4cnxiCaw3b3HmMCABehlIVeuACuYtw2FAj/RQ
	==
X-Received: by 2002:a17:902:eccd:b0:295:32ea:4ce5 with SMTP id d9443c01a7336-29532ea502fmr9348515ad.6.1761904312941;
        Fri, 31 Oct 2025 02:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXe9nQdng38o4OJMobcOH9bnesb6ZHCKFN3tvNJRYZ/D77oNVbQxA4cK+EffDly7a5xbachQ==
X-Received: by 2002:a17:902:eccd:b0:295:32ea:4ce5 with SMTP id d9443c01a7336-29532ea502fmr9348255ad.6.1761904312418;
        Fri, 31 Oct 2025 02:51:52 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268716e4sm17913115ad.9.2025.10.31.02.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 02:51:51 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 17:50:43 +0800
Subject: [PATCH v2 5/5] media: qcom: iris: Add intra refresh support for
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-iris_encoder_enhancements-v2-5-319cd75cbb45@oss.qualcomm.com>
References: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
In-Reply-To: <20251031-iris_encoder_enhancements-v2-0-319cd75cbb45@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>, quic_qiweil@quicinc.com,
        quic_renjiang@quicinc.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761904292; l=6258;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=yXQEX8LNu0TsL9VDTKU5gwOSUNtbhNTnq7C28ggjxog=;
 b=xJS+oQadNRx7R2wufglLZFEq4msH9/kXRJxJPCI0aNVjGHXc6OGbeZe+MIKIEOuHmUvQg1fhA
 9JUVktI7blHCQcRUWg7/286uLaFx8Vec9vxVeZL5ocLW/3i4CFCbR+h
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Authority-Analysis: v=2.4 cv=RL2+3oi+ c=1 sm=1 tr=0 ts=690486ba cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-vM60OG-bLC5KXgFrusA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: GmMOv-4a3TBVeWVtiS2Rud5KLflnfQhk
X-Proofpoint-GUID: GmMOv-4a3TBVeWVtiS2Rud5KLflnfQhk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA4OSBTYWx0ZWRfXxv97drlE8NuL
 QwJWQW6niP21oMbadXQBJ3FegqSZQgMhRoQJN+PaE2qXjRRYIXYblyBymBZF18RBgHDyBut2rBx
 6w8vbNfzNr3RIuwYppwZHvM836EXDDkiDDIsD2j0rtZXAQNGIteoCOTb99LltlaGPT2C/iOGHb9
 GZkPkW9tfejoF6xeyXMpoNcAKV6mShrZplW0z1sMRPNtyuu4VhL+coyjAWcLpVxFcJ2xhNden8E
 mazy9ZQyZwqqx2gD/jnMI9zsnbBrb4MH4RlkFHh0kDUrVE7urqlP6wbBvmH+3jdcAwhjzD++oFR
 9W8yjdcj5niSK593cwCNGZT0y1B+BA1oGyuI5q54CODrP5JfxMKU0nBK9WQAAPNx/4HnSpQtAHX
 iXm4SeotyCg5QJdp9I1Ob0m7h5xwCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310089

Add support for V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c      | 33 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  2 ++
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 19 +++++++++++++
 5 files changed, 57 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 8f74c12f2f41f23d75424819c707aff61ea61b33..14891569247318aaa7b2009b737f077d1cb45095 100644
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
index 0f92468dca91cbb2ca9b451ebce255180066b3a4..9e8fdddf2aef439e7f133c9bb2fafa6d95062b02 100644
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
index 284d6bde6d6bcdf70016646d1c92e6ae7f067efc..30b98e769ad34c2b63dd63e7714bfeaa5b4f162c 100644
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
index e74bdd00a4bb2f457ec9352e0acaebc820dae235..ce54aac766e2bf76fa2de64c884724ca63f05dcb 100644
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


