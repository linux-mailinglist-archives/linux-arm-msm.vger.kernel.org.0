Return-Path: <linux-arm-msm+bounces-80510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 869CEC39003
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 04:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DCF274FE351
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 03:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B105C2DA767;
	Thu,  6 Nov 2025 03:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lE15MsFJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CKwkdSpm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D4F2D94A9
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 03:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762399868; cv=none; b=DLut7iZKF4KfV4FrupNKQwdKw8ki4TR7kNJ8dSj165DJFKv8t3GUN2Xjy5XJ42qkj4lRYn0CJFO9/NDzzk2Wljj9/SIol3tcFs+KVMxW120S0A1jBljH0rOs7PlA+MlKpVLbQ9EDDO0zfob4adaZIRPrgKBj1zEFo0DVIcxMGkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762399868; c=relaxed/simple;
	bh=JQ5iyKLsbTvW1G+rebQp49wNfxcQrPn+UClBYzR7ixg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qLfY61ntf0OLbUdKWuDeN/KuCHah5+4zvJnifJXCBFmfy6135XB0MBZDPWFJTHVqd91MO0skdKKmbcEk4yBgip6nqvEVshOrq3pvBc4p380O2oZCaAw52DzD8C6GaJ3ZapooxACugW1Syi9Zf1px7mIIfsB2BgkADSSd5d7Nrl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lE15MsFJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CKwkdSpm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5NLWth2164467
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 03:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ugBW9Cv+1k8WLRXW2Hz0UY8b2KE1oQhBmaVaCghLSSQ=; b=lE15MsFJH0de2+tr
	dozC6uE9hzSyTIw17JCuh67gDjrzYK0JTxdYak7Haa56x5QDJ8a+q5Gyf09GEjvm
	LH7PrG26vUyJbp1jwrDGszkMlXSbg8G84a4EZ18lhf2t/V8HheJ43gV2N6JJuRB/
	RWg7W6Ugvnr24uxQ7HOmYG0MUQ8WCp4d4bc1TU61InaX3MSitt1p1tI3vxGQHBV+
	+UfM+RiQZTGavn/xjhK3Dsd8K2klWLFAzglVcOL92ytjR3O0WLOVdAuc8tFlMsjy
	hXSqhMUhlXU4oTh1jy5ADQC5BbCl7AFWYwl84tFcaWlZaRa3UdZVCuVhBMlfci9L
	bOoXBA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8g6erkdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 03:31:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295592eb5dbso7390585ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 19:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762399864; x=1763004664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugBW9Cv+1k8WLRXW2Hz0UY8b2KE1oQhBmaVaCghLSSQ=;
        b=CKwkdSpmEAZ52c782xnAn1TZAYJOvt9z4yAYypjfCgM70vD1pppY2boSBQueS/nd5f
         bFQJYU/KLCPOgrrPd1l28/X9NkWEfxp7o/Q7kTyvplUOfXnebZk0UbGuCJ3zbbLOSkab
         uaOtoAaGMfqKDXo/Tu0SDN7kgf+oiviwcDHRXdVeprF2puI21CLHD19I2f85UVMyqHBg
         wknGq6GAwZM/a45s4eM7BhsNVhkUfs09HKbtd5U5G+yxuhdrV4s7H8UBxBA4un3DI4Uf
         UcHPL60iRZ3ncJLZOX4OdlZB77QceVqVWRjqbgmITUUdOy+DswjGWvz5R56N17LwED4k
         LokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762399864; x=1763004664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugBW9Cv+1k8WLRXW2Hz0UY8b2KE1oQhBmaVaCghLSSQ=;
        b=Xr1UAz+FxQ6bdh1vRyS9xiC2qhWrqzhPwMTOBGzYwRyt+3Ex8wJtdzCnQqKhWsaFkV
         4KPYVSqvMcN/8jt5hPjKvAisJD9iRWDfYUJqpU6gdedoAHNfLIDp05ytWFVBWAi80MWB
         +E/eyQQM1EDFd16sdDefm60sZVDb4ngNWALSffLFSDxuqUWVLIlSvJnZZaXY8/gCchw2
         scmxtzUiysz1WXJ+9M9LWfLTrxN5Pq1sBKMZ7BTgvqc3Cl6PE1U5IeBOunct9BGtyf3f
         F0KBKtz/BHVJQO64SFxDqrjmbiZWQLOx/o8U8Dgm8kxSqJVZksOSYxD+0ENth92gS3Pe
         bwww==
X-Forwarded-Encrypted: i=1; AJvYcCUEcLpYt/DctUVhLz3DXfxJasRPloSrruzIuM4now6TYwD3UGrUbyB7Ob390LfHPDUWym1XggTGgSpha6S9@vger.kernel.org
X-Gm-Message-State: AOJu0YxK4KHzPtEzpyjxbJtOAqjd+ViaY3RYqEWSWN0AIe1I6l3nFtkt
	p2nzwxz1in59Bu11AWl3TO0dKEe2sOcHxAyijR/WLEXAlMkX6jnCxSCB7BBLXPSxFzXYI1Rkq8S
	Wu80LzugLIPArv9dcqpCWjuKMEoXNg8Wi5kcqKQnjEC9lLCU7evKHjANCgr6KTDP9+2ND
X-Gm-Gg: ASbGncvUFFAAFoq7BVgXt0iiarnvM5O8nuOZlY+EggFCv0gJoxZQ0QZw+MUZiAHVLi1
	WPQSTyrumPzxyJeVhhrbdJ3OwSppcNzasw/X7j+L1+4YYzUgSd3Tqx7vLhCMHLijfk7h+t2Ictn
	tjS+AqMFzLq8ycpCQNdWSSkl03gT8LyB5juyMbYyq3FxW5iPVQyIRmu3DiDQMcT0fNpuw5l46iy
	7JPoGf5Ad8G4+ZTDFCgfgcnlRRwrS/YFdHB8CG87Z9lzT6f2p/kf9cTgsiribkLrEuG6JZ/YdLh
	St/NArQspjl/1CpjnyQqmtsZDQvIkNn/yTnEOyrh7rheuwLEQ3JmXZYpkXbV/ngB0cD7mlsynJY
	sv9u1nYIVZ3NjM78NwUaN2pbpKWVLq9EP0MfuzsbIYCTE9Hf5CkC4Blf77aqt1YHC5+7CPdlEow
	==
X-Received: by 2002:a17:903:2286:b0:295:54cb:16ac with SMTP id d9443c01a7336-2962ad1bc4dmr75095455ad.18.1762399863474;
        Wed, 05 Nov 2025 19:31:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0ANBdoE+euT8S2x1s+JWx4g+Ehlkq6HJ9gp+SG6qkEmCDxZ8JU5K3mDejLGnk1hCVFvAxhQ==
X-Received: by 2002:a17:903:2286:b0:295:54cb:16ac with SMTP id d9443c01a7336-2962ad1bc4dmr75094935ad.18.1762399862951;
        Wed, 05 Nov 2025 19:31:02 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651cd0060sm10361925ad.108.2025.11.05.19.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 19:31:02 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 06 Nov 2025 11:30:38 +0800
Subject: [PATCH v4 6/6] media: qcom: iris: Add intra refresh support for
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-iris_encoder_enhancements-v4-6-5d6cff963f1b@oss.qualcomm.com>
References: <20251106-iris_encoder_enhancements-v4-0-5d6cff963f1b@oss.qualcomm.com>
In-Reply-To: <20251106-iris_encoder_enhancements-v4-0-5d6cff963f1b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762399836; l=6329;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=JQ5iyKLsbTvW1G+rebQp49wNfxcQrPn+UClBYzR7ixg=;
 b=7vwksZhemnsCeknghGDmXoxZn/Ky4K1aWqGHAsIPT1HV2CAm7LDG6lS2b7v3UpdGpQBWO/JyH
 WDCodetoDFkBALBJUkXIsJInQsN/gbqb5VLD52X0i3iWr8lmSwzG21h
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDAyNiBTYWx0ZWRfX0BFORdIjU1qt
 +WW8MyrzV+8dICS8uNGo2Coep7i7NM5Dc4bHIb3Tnzc6Nx0rQOCJr9ScXVoro50vbEbs8fXlpB3
 Gxyj8r5uujRaQziLnrAu3+U8pXh9ukzXY9w2RaVSt3QpIp66r7o669Jt73Qi+pJ82BJVgjlPYEA
 fyVbW+VxfLBbXY05z9PWtLJoYZBOeG7d2HCGV9Gmp984MHChA9jIM6PrrAhGEHbbguniGrO5jes
 dyE1TNxO6kGzkbFl/oJ6Ffa/JBwMpth9yLJmCzpXLmWY0ZVNWmA5JKldzxrzsciIodz4sFv8bkg
 ZpzpoTkPbXChXQZTDUAIk4HuXQyxMVJnh4IKcPj8nwHBw3+0jVXruIARPVvNqWZ5di2pZq5Eipq
 dmS96qKgz0dMJNsQAzEbO9+6rTUseQ==
X-Authority-Analysis: v=2.4 cv=D5FK6/Rj c=1 sm=1 tr=0 ts=690c1679 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=-vM60OG-bLC5KXgFrusA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kKX6DZRsc0kKBLLcz59bmzB1UyscohBw
X-Proofpoint-ORIG-GUID: kKX6DZRsc0kKBLLcz59bmzB1UyscohBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511060026

Add support for V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD and
V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE controls.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
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


