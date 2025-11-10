Return-Path: <linux-arm-msm+bounces-80962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F20CC45EB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 11:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F21233B4105
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 10:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD67630AAAE;
	Mon, 10 Nov 2025 10:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ft+41W6A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vzhl8YMp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3640F30AAC1
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770244; cv=none; b=SQUJkHf5wYq7wWBbzTDluJ0bJVBU8r4Gyz3ULWlejUY2gFtR2oLh/SlHDy5DAGB6ZsURR83GhbfwNI4BdaO1ELYPJBct527SoNOcRKx8CeZnri72Q8luYo9lWX7iwbX964oNSKBNXiJ9udgLjFd2ajI7QAVoIq96pPbvopf6hrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770244; c=relaxed/simple;
	bh=ir6soPnuXi73OnimUuOPlkHNAeCDSvP5B2tU9zm19Wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MW4sdHVdgUWzSi9a/adYrgvvhhmvHKTKZS1weKDSQi+AihQZa+F5UOxzQXo4X7uRSzyfh8qH8Jb7OA7ciHq0w9Gl7Q4lmKjty+pOtHLwaGjjY/tLI4TjixEALRQt+DHKiapymZdjpGq0KE7Lq7wpZMqAweNckBy4MLH9eas/LNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ft+41W6A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vzhl8YMp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA3jn8B2546968
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8OS9XkmuiAShlq2VYm5mpFvdCAf1jt1FGO4tp4nBKNc=; b=Ft+41W6AHAjsGj2+
	iVT8QnUpHMYpPz7rBrRQ759qzMni6YuXCTKGjwe3MQKXbRPO3qC4IZiyy7M7SDEp
	meAAwt2AQ94mcBc++aqI6oOg911ZEKQrwRiAfU+i5VDzldxKnzpJIAQnd8y7Bo8i
	dP+3vNiwHpD4dWMMFSEu+rNmwYkeCzh9uLsCqO5KkQ0IFoLN1HHSynjhfOLeqXVQ
	Rq1TdGmQdwuoAJgSH5QeWe1xtlEZKyEBuzTegALBzR4GopHvq7/tmWveP19qPbdI
	yiJHON0sGEqhrhlCpN8CFxKKiRXC4Tp63f9sX63swZD6VHurSblTFLhOVIDN/34h
	QZAvBQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ab8ea92vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:24:00 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b993eb2701bso2473298a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 02:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762770238; x=1763375038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OS9XkmuiAShlq2VYm5mpFvdCAf1jt1FGO4tp4nBKNc=;
        b=Vzhl8YMpv8zTBHlqd5/9mn7Tg0e0hCBsfBt8m8wkuBjE9oNMgxYxPtI2szjLEwL+Ee
         TKWtOKwQG2TWRSk73a+J+o+iOY2qVXQ34etPMFlb/7HRcmbWAAqb601Jp1J98xScNj//
         QTAt14atwlzhQ0OnC2ZvnLGVkIVueW5uMShtQzIaFHVUDF4nVp+Pw2JbT34Ju7SsnYEe
         FkatysZghRUM80sqEzRc8IBxb3I74ZsjvyxybaOwwAMkvaRuYJ9rKQH5iZD9LT3FJf9K
         8eq2GArIsXrJNp9/sUgbU1baUsWzmI88g0WLj3LaCK7N8liJBJ6ueIW7+3yGFFdF/wFQ
         Hl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770238; x=1763375038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8OS9XkmuiAShlq2VYm5mpFvdCAf1jt1FGO4tp4nBKNc=;
        b=I6zrpn6dHkRt98FGahae1/rA3wN2gae0YsruAMUULIDqzG0geqjN5ZUwJeYWEYTB4j
         kINyqROhgpCSaD19nduzqiL46XF2ciBZs1SkkigsLmF9pKgwQy1BHl5MFwcdEZxLmC5O
         SScBI5eyBJBaMR0VwtknPC+Jq0b8VcTY1ujRjvbkxo+2x/CovG4zMw5hHrjiOEd2QNoR
         S3Hbzhx9kQbRKMsGRjQVl2XsBVLVbFqQakuen+Lbzaxks3JG+jCdt8G+eJsJP59m/j/X
         NBkjngH3gUV7VMj/22fW6xojMEPcVudnH5gdIlJ55253E3GlpfYB46DIIKizGoMtoriW
         tcHA==
X-Forwarded-Encrypted: i=1; AJvYcCU0T7PWhwnqXD8U1rGRXZ3aCKivAMUtce9zCkpEKdFwzLcZDpW7NgeLWBJ7tHHLYDQoDUL+KFZ4Khvm+e9P@vger.kernel.org
X-Gm-Message-State: AOJu0YycFRWbsjVRoq/zADMYu6LdHRbkW/xFAPADJBuVeBuYuGXAgSE5
	QuuKDohOr/yck6JeXVSNn+wvjAcEhZ3ZsY0wK2VOzgvTy9TpFiB5hZKbMM7jjAlxIi8LFRACypZ
	KKEG3y234P/KsWAtwJSqhTyIbS3spOm8QNpa+dwh2gxiE/yFjS2udG/e+YbdATjomOgYV
X-Gm-Gg: ASbGncvsjcCICqPVmMK6bY7kM18fYcEw3kDHAsz0gbfLTmvsp0zi8qgv4DH12d1SHmX
	cI1uqMcmCtI70yWqSfJEiZ1y2euQuzUzGC9Fnt2wpN/AhJi78nPQVMEOClbSQAFpHcnbmrEHZCb
	cne49A/d2+6mLbFr/F6jm65glvJQj/utd/T45PhnklRlGiJi4IdB0HCKJx5nW9q/O2S7fu1asFs
	CJk+FGFhvspGx47OkDYJ1jwx6rXhUrrOCwsObF51QNxW4dBQzVKCFJ+UkTYqdHv1ZjexxJkXJap
	Dk24pH9r9aJRI/zQNT2AGsMDoeTuA0y5WmZAHCfe/r0dQKwJFGjfZ6GcwVMeMOPqs+bhiw4Qqw7
	dKirFNZqkTcmrZNAvrrcW8JGSV8bQFXHc1YG+feJ8iQ5YJ7qlT7hHs5lS7Nzryf5csnip66rwDA
	==
X-Received: by 2002:a05:6a20:734f:b0:262:9461:2e5b with SMTP id adf61e73a8af0-353a448b381mr10612218637.53.1762770238226;
        Mon, 10 Nov 2025 02:23:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJ21zazZ0I4kIzPOPqkY1QG0rXFjUmN1nOTmlrkGWGwMP1iaL4BRBem10e5xTImQqk7H9yhg==
X-Received: by 2002:a05:6a20:734f:b0:262:9461:2e5b with SMTP id adf61e73a8af0-353a448b381mr10612173637.53.1762770237623;
        Mon, 10 Nov 2025 02:23:57 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc179f77sm11153832b3a.34.2025.11.10.02.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:23:57 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 18:23:17 +0800
Subject: [PATCH v5 6/6] media: qcom: iris: Add intra refresh support for
 encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-iris_encoder_enhancements-v5-6-1dbb19968bd5@oss.qualcomm.com>
References: <20251110-iris_encoder_enhancements-v5-0-1dbb19968bd5@oss.qualcomm.com>
In-Reply-To: <20251110-iris_encoder_enhancements-v5-0-1dbb19968bd5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762770213; l=6402;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=ir6soPnuXi73OnimUuOPlkHNAeCDSvP5B2tU9zm19Wc=;
 b=ghJ3+Z4wLfneg4s2Dnza7LdGl3bMZ0RK5rj0FVdzLZdhLUf1+KkfyaJ4mMLfW+OHzcUGdKJxV
 NVPyo9/MEcuDYvoik4XVlLHtQOMCyHJEKx3cz3MfFzp3RE5T+ESDiIQ
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: LVNuNsYcLnFqPS8GqOOLj1PNEwRbtoEZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA5MCBTYWx0ZWRfX2y3KOn2mSRVt
 juKNXnc+uOe9KOt6W+J3yrMrZ6QAvD9YA/vkn7Py0n6kJt4vSzZ9DGE/HNTEJ+IeXp3YouzhRdU
 fmncdc2IPSqTEfmndB/cOAGFS3pXHCjUEfuPDdkTZXEw+FcIQBKp1HnQzwirLQb49mFyRubTVkJ
 hPPnaHbZpO6CavDrfcRRJeKPwP78q7hsHC8zsWF9YKwVvwNdnrOmxLaxNh//1wqeVSr1KNACF/r
 hg8KlIZelxqksJ5Jg8gOe64apATj+EjWP/PDTckkU91ktw/kr7dkUk7Z0k1MyTINhsQp/EWV7ou
 n0+c/d1FL2KCSlnxJ5koJMyfk3IEhbPI89I4DtXEHAcaaVl3msiHaSOjfSoog3oJvzVG03aQMym
 46G2pOS+A3OU3oYrbjHzhplPDlhR5w==
X-Proofpoint-ORIG-GUID: LVNuNsYcLnFqPS8GqOOLj1PNEwRbtoEZ
X-Authority-Analysis: v=2.4 cv=QLxlhwLL c=1 sm=1 tr=0 ts=6911bd40 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=-vM60OG-bLC5KXgFrusA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100090

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
index 8f74c12f2f41f23d75424819c707aff61ea61b33..8c19aef6eb361e0ddf7f8dc45f6c67a90f16a04e 100644
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
@@ -944,6 +952,32 @@ int iris_set_flip(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
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


