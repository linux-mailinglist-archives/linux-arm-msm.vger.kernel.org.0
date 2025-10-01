Return-Path: <linux-arm-msm+bounces-75709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5655BB18C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 21:00:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10F5F19C094F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 19:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A912FDC23;
	Wed,  1 Oct 2025 19:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyuLDJLi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596742D5939
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 19:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759345222; cv=none; b=qxsUCV0PEl4PDbbqxtIKnSOP3H6f5UtHwBvnhjWCAOzKcTL1NIziz/e4HpS4MJpqchBifYeOHjwYbdAPqNUUb6fx0xbHTb8REd8CWTygO7T4TBeb8dt0Xp/q7mNxgeydE3sPwMUqnVhviUi0Ypbs5c2jFQsQzBYOmJRfNdlpvzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759345222; c=relaxed/simple;
	bh=YQhkh/zo8rn9dqOUqaPBnqOpCyHvyt8DViLBp0ri8JA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qPeHqDNR0CQFoTmHP5DK7zHlFRIkItybc0EBJB2SAQ2me4eq9eZU0YIAJ/wqkyKbGjAA1TCqz7qmapzqWy8SqRmcsaNlBo6cJXI5wbcrv4pJzbk6Ra8Vcv3eY3ykVubowFYgKWUmnQtZuQ355mOKfHdRWUNWcNlsfL4C1iP4PJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyuLDJLi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IbtRE023326
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Oct 2025 19:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hR8K21apdEymPh8vH2OKxorxhtwSyOrKng/gudc+6AM=; b=TyuLDJLivdPuT3YX
	J00j1Wz1RyQIjvUTiADq0Sav78CmjRFGpxkhwKOAYdZx3KUV8XujUpYCY0PIQqan
	YyeAbB/e6hYIAGTbBOg5Vw3+N7vHiu5SfsYf6lOoSFgdnt69pXVAjTOnm9dglivV
	RQQvnp7cbicO1wij7lk+/Q6wUh6YkpwmdLwcNtneS0Rm4BhV40SxOHcdTEsCap8m
	PdCKSq6johmmFOcm0ciwaaSaJ84svilWSC3YGkkZhLC1z9nWYtJ4/rVp9tz+rG1+
	gxbknmNbJYEPIr79qVmjHTmPyVeGg/hKbLBD8xG2pP9RYYQxLaQrHpxmSeebgC1p
	sxKPtQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a65n4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 19:00:17 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-33085281806so55718a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 12:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759345215; x=1759950015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hR8K21apdEymPh8vH2OKxorxhtwSyOrKng/gudc+6AM=;
        b=vOuAIi+YZoROtzcM1tG0nbj99+yh4QbA7M1W/a1bIfRdsPW4TCCyx035WpqmKl6RnT
         7OvRrBQ24tkCrFnj4GzNYt/t8urzFtP/oe7wpTvvQvtYci9iOBAWshNaMpRSQAHJsQUK
         s1J6Yh7P+eHU8/M1IScmkT2EReveXrKTjjPiw7hntOyKqPzDWdMkkKcMqwt3W+kmr3r7
         AI6ghvEPCNh6XjtJZVfqAnL6cZZYukQOGPUEK4XSHvylKR6ON/1O5swdZVoxHvVQwQkR
         0BtVIdnWGqILRk/gC5nGRXDxuU9p2FE7ufhQX/dRNN8wUzF4oYPOcIT+b13UMdoTwN+Z
         IuZw==
X-Forwarded-Encrypted: i=1; AJvYcCW8YbC1l6dX/pWXCx0kZtLH7PNLIirtUpQkSHy7OHwqn5oggGAdfNgVGi39ng5v5K8vcBh5+5hu2LDLsAU9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaqrqs+IdRoru2oqcFrjXEr/bAhpwP/Js7K4Qjq7/DM1rZ1B7Q
	M4htyQ3DGsb3qPb49p8BFYjFcRSp7SDj9rxpgXNZGVutqVmddtRdkSyuwjTnMtdFD/QfyOK3gnV
	T0ZNwdFKclkvSxr8JlL8l24yYJna8PI1XI8xxTVkqmYMEfleBXDR6+x4nNOmhy4cmLEXF
X-Gm-Gg: ASbGncvt0rj+8Y/RGBzbL5jBdsK1NCejzE/ASEeChNkodPPkfFLUfNNxbJAro97csSO
	aM0C3cqc1a4oWntKtbZr4aiPZ+ewRoHBUG9h6YEB0dzE9tcQDi59EPBvTkA1xPMe2THFpTlmOLU
	3c/aSPZRB+YsXPKC9YFA61cQitukstotGLSFA1Uhayat4WG6yYREqIt3CtuSWTbt+BzSfCdmmLj
	ye/2Je23Tu2TI+vWorhQFVMHJ+N6fi1okGDh6lw06jNzeY05DeTiHclh2u+D4Edt32VqlQ34DXC
	vivFzjtL1wzifP6O1RnKMUpH691Jmpl0SzAsmfc102PK83mRd5URbE0dk8LL1QPSOGQBFmzV5ZO
	taaNO41lyu7FUuRkT24lSdQ+QCpb3pg==
X-Received: by 2002:a17:90b:33d0:b0:32b:e4ca:3e03 with SMTP id 98e67ed59e1d1-339a701232bmr2600633a91.6.1759345214578;
        Wed, 01 Oct 2025 12:00:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHigFZJ9JzhQfyaw/HKEWPEQCcEOYyCOKPFR+TRYycx40FBQneVEQit+JzlZV2J7ylziqqOuQ==
X-Received: by 2002:a17:90b:33d0:b0:32b:e4ca:3e03 with SMTP id 98e67ed59e1d1-339a701232bmr2600606a91.6.1759345214068;
        Wed, 01 Oct 2025 12:00:14 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701cbffsm2950074a91.21.2025.10.01.12.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 12:00:13 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Wed, 01 Oct 2025 12:00:07 -0700
Subject: [PATCH 4/5] media: iris: Define AV1-specific platform capabilities
 and properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-av1_irisdecoder-v1-4-9fb08f3b96a0@oss.qualcomm.com>
References: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
In-Reply-To: <20251001-av1_irisdecoder-v1-0-9fb08f3b96a0@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759345209; l=24641;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=YQhkh/zo8rn9dqOUqaPBnqOpCyHvyt8DViLBp0ri8JA=;
 b=7OTrHHwh0pJdrCLNORMRlSDyXPQvaREQtGpJlkXNtH43EW2tAKUtwC1q1lr8s7KYWMJlRaOs8
 8YRqztLr/vOBJLb0ZkJ2FyBD56gTyJIXfltC2FODSZLwrBdS8XmlqbD
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68dd7a41 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=AP-cJNIzh2fI31YzWqcA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: R0LWNtE9X7SZOtJsVa5WImXn71p1Ro_L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX3pVNdwX3O3a0
 fLSblulalXEUQop6G5GHwNQQarwGZ9Bt1sMffBAgapQDfDFfVKtfriEWENuf5rsd2nP3izmyBnG
 cwGcNcjmcxA5mQjIkTtMfcbqPmsq5JsYXfp1i+ZgwCBZ/HaFraQLol6rQdjCW8Zfqb6BWrQUk3s
 up9QvDYBdzJvm7EBOvRuHJM+21vcjxW+ffdWzT2sR8d28F/j3B/Dk9x8k2Z3qJ5zikTh/tamGvp
 JgmuNpO5aXq9pQ6kqAL7l888VP3Lt7qbuSp48DFGvJgHqLvRUTv2PRitBkoXqHu4JaFUdlU54em
 igNOl4XEUes6t/Pd5ynS2Hl0ZC1/5sUNykuUyv0vYWDEg325URLoFRqmYVUakrJpYYaL/Elz9uz
 8PwTlDQ0+KjJaNA1OTWazVmj5xumhQ==
X-Proofpoint-ORIG-GUID: R0LWNtE9X7SZOtJsVa5WImXn71p1Ro_L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_05,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

Defining platform specific capabilities specific to AV1 decoder.
Set and subscribe to manadatory properties to firmware for AV1.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.h     |   1 +
 drivers/media/platform/qcom/iris/iris_ctrls.c      |   8 ++
 drivers/media/platform/qcom/iris/iris_hfi_common.h |   3 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 109 ++++++++++++++++-
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 ++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  22 ++++
 .../platform/qcom/iris/iris_platform_common.h      |  13 ++
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 133 ++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vidc.c       |   1 +
 9 files changed, 294 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index 325d30fce5c99185b61ff989fbfd4de9a56762b2..5ef365d9236c7cbdee24a4614789b3191881968b 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -42,6 +42,7 @@ enum iris_buffer_type {
 	BUF_SCRATCH_1,
 	BUF_SCRATCH_2,
 	BUF_VPSS,
+	BUF_PARTIAL,
 	BUF_TYPE_MAX,
 };
 
diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 754a5ad718bc37630bb861012301df7a2e7342a1..620c7e1bd273e25febd8ca70dd1dcfb0b862692b 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -98,6 +98,10 @@ static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
 		return B_FRAME_QP_H264;
 	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:
 		return B_FRAME_QP_HEVC;
+	case V4L2_CID_MPEG_VIDEO_AV1_PROFILE:
+		return PROFILE_AV1;
+	case V4L2_CID_MPEG_VIDEO_AV1_LEVEL:
+		return LEVEL_AV1;
 	default:
 		return INST_FW_CAP_MAX;
 	}
@@ -185,6 +189,10 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
 		return V4L2_CID_MPEG_VIDEO_H264_B_FRAME_QP;
 	case B_FRAME_QP_HEVC:
 		return V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP;
+	case PROFILE_AV1:
+		return V4L2_CID_MPEG_VIDEO_AV1_PROFILE;
+	case LEVEL_AV1:
+		return V4L2_CID_MPEG_VIDEO_AV1_LEVEL;
 	default:
 		return 0;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index b51471fb32c70acee44c37f8e9dce0c6bc0b6ccc..3edb5ae582b49bea2e2408c4a5cfc0a742adc05f 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -141,6 +141,9 @@ struct hfi_subscription_params {
 	u32	profile;
 	u32	level;
 	u32	tier;
+	u32	drap;
+	u32	film_grain;
+	u32	super_block;
 };
 
 u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index 4ce71a14250832440099e4cf3835b4aedfb749e8..e3a8b031b3f191a6d18e1084db34804a8172439c 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -10,6 +10,7 @@
 
 #define UNSPECIFIED_COLOR_FORMAT 5
 #define NUM_SYS_INIT_PACKETS 8
+#define NUM_COMV_AV1 18
 
 #define SYS_INIT_PKT_SIZE (sizeof(struct iris_hfi_header) + \
 	NUM_SYS_INIT_PACKETS * (sizeof(struct iris_hfi_packet) + sizeof(u32)))
@@ -121,6 +122,7 @@ static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
 		case BUF_COMV:
 		case BUF_NON_COMV:
 		case BUF_LINE:
+		case BUF_PARTIAL:
 			return HFI_PORT_BITSTREAM;
 		case BUF_OUTPUT:
 		case BUF_DPB:
@@ -380,6 +382,9 @@ static int iris_hfi_gen2_set_profile(struct iris_inst *inst, u32 plane)
 	case V4L2_PIX_FMT_H264:
 		profile = inst->fw_caps[PROFILE_H264].value;
 		break;
+	case V4L2_PIX_FMT_AV1:
+		profile = inst->fw_caps[PROFILE_AV1].value;
+		break;
 	}
 
 	inst_hfi_gen2->src_subcr_params.profile = profile;
@@ -409,6 +414,9 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst, u32 plane)
 	case V4L2_PIX_FMT_H264:
 		level = inst->fw_caps[LEVEL_H264].value;
 		break;
+	case V4L2_PIX_FMT_AV1:
+		level = inst->fw_caps[LEVEL_AV1].value;
+		break;
 	}
 
 	inst_hfi_gen2->src_subcr_params.level = level;
@@ -484,7 +492,8 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	u32 tier = inst->fw_caps[TIER].value;
 
-	inst_hfi_gen2->src_subcr_params.tier = tier;
+	tier = (inst->codec == V4L2_PIX_FMT_AV1) ? inst->fw_caps[TIER_AV1].value :
+							inst->fw_caps[TIER].value;
 
 	return iris_hfi_gen2_session_set_property(inst,
 						  HFI_PROP_TIER,
@@ -509,6 +518,56 @@ static int iris_hfi_gen2_set_frame_rate(struct iris_inst *inst, u32 plane)
 						  sizeof(u32));
 }
 
+static int iris_hfi_gen2_set_film_grain(struct iris_inst *inst, u32 plane)
+{
+	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 film_grain;
+
+	film_grain = inst->fw_caps[FILM_GRAIN].value;
+	inst_hfi_gen2->src_subcr_params.film_grain = film_grain;
+
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_AV1_FILM_GRAIN_PRESENT,
+						  HFI_HOST_FLAGS_NONE,
+						  port,
+						  HFI_PAYLOAD_U32_ENUM,
+						  &film_grain,
+						  sizeof(u32));
+}
+
+static int iris_hfi_gen2_set_super_block(struct iris_inst *inst, u32 plane)
+{
+	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
+	u32 super_block;
+
+	super_block = inst->fw_caps[SUPER_BLOCK].value;
+	inst_hfi_gen2->src_subcr_params.super_block = super_block;
+
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
+						  HFI_HOST_FLAGS_NONE,
+						  port,
+						  HFI_PAYLOAD_U32_ENUM,
+						  &super_block,
+						  sizeof(u32));
+}
+
+static int iris_hfi_gen2_set_opb_enable(struct iris_inst *inst, u32 plane)
+{
+	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	u32 opb_enable = iris_split_mode_enabled(inst);
+
+	return iris_hfi_gen2_session_set_property(inst,
+						  HFI_PROP_OPB_ENABLE,
+						  HFI_HOST_FLAGS_NONE,
+						  port,
+						  HFI_PAYLOAD_U32,
+						  &opb_enable,
+						  sizeof(u32));
+}
+
 static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
 {
 	const struct iris_platform_data *pdata = inst->core->iris_platform_data;
@@ -531,6 +590,9 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
 		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
 		{HFI_PROP_FRAME_RATE,                 iris_hfi_gen2_set_frame_rate             },
+		{HFI_PROP_AV1_FILM_GRAIN_PRESENT,     iris_hfi_gen2_set_film_grain             },
+		{HFI_PROP_AV1_SUPER_BLOCK_ENABLED,    iris_hfi_gen2_set_super_block            },
+		{HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
 	};
 
 	if (inst->domain == DECODER) {
@@ -544,12 +606,20 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
 			} else if (inst->codec == V4L2_PIX_FMT_VP9) {
 				config_params = pdata->dec_input_config_params_vp9;
 				config_params_size = pdata->dec_input_config_params_vp9_size;
+			} else if (inst->codec == V4L2_PIX_FMT_AV1) {
+				config_params = pdata->dec_input_config_params_av1;
+				config_params_size = pdata->dec_input_config_params_av1_size;
 			} else {
 				return -EINVAL;
 			}
 		} else {
-			config_params = pdata->dec_output_config_params;
-			config_params_size = pdata->dec_output_config_params_size;
+			if (inst->codec == V4L2_PIX_FMT_AV1) {
+				config_params = pdata->dec_output_config_params_av1;
+				config_params_size = pdata->dec_output_config_params_av1_size;
+			} else {
+				config_params = pdata->dec_output_config_params;
+				config_params_size = pdata->dec_output_config_params_size;
+			}
 		}
 	} else {
 		if (V4L2_TYPE_IS_OUTPUT(plane)) {
@@ -598,6 +668,9 @@ static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
 		break;
 	case V4L2_PIX_FMT_VP9:
 		codec = HFI_CODEC_DECODE_VP9;
+		break;
+	case V4L2_PIX_FMT_AV1:
+		codec = HFI_CODEC_DECODE_AV1;
 	}
 
 	iris_hfi_gen2_packet_session_property(inst,
@@ -763,6 +836,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 		change_param_size =
 			core->iris_platform_data->dec_input_config_params_vp9_size;
 		break;
+	case V4L2_PIX_FMT_AV1:
+		change_param = core->iris_platform_data->dec_input_config_params_av1;
+		change_param_size =
+			core->iris_platform_data->dec_input_config_params_av1_size;
+		break;
 	}
 
 	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
@@ -845,6 +923,16 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
 				payload_size = sizeof(u32);
 				payload_type = HFI_PAYLOAD_U32;
 				break;
+			case HFI_PROP_AV1_FILM_GRAIN_PRESENT:
+				payload[0] = subsc_params.film_grain;
+				payload_size = sizeof(u32);
+				payload_type = HFI_PAYLOAD_U32;
+				break;
+			case HFI_PROP_AV1_SUPER_BLOCK_ENABLED:
+				payload[0] = subsc_params.super_block;
+				payload_size = sizeof(u32);
+				payload_type = HFI_PAYLOAD_U32;
+				break;
 			default:
 				prop_type = 0;
 				ret = -EINVAL;
@@ -900,6 +988,11 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
 			subscribe_prop_size =
 				core->iris_platform_data->dec_output_prop_vp9_size;
 			break;
+		case V4L2_PIX_FMT_AV1:
+			subcribe_prop = core->iris_platform_data->dec_output_prop_av1;
+			subscribe_prop_size =
+				core->iris_platform_data->dec_output_prop_av1_size;
+			break;
 		}
 	}
 
@@ -1075,6 +1168,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 		return HFI_BUFFER_ARP;
 	case BUF_VPSS:
 		return HFI_BUFFER_VPSS;
+	case BUF_PARTIAL:
+		return HFI_BUFFER_PARTIAL_DATA;
 	default:
 		return 0;
 	}
@@ -1087,7 +1182,13 @@ static int iris_set_num_comv(struct iris_inst *inst)
 	u32 num_comv;
 
 	caps = core->iris_platform_data->inst_caps;
-	num_comv = caps->num_comv;
+
+	/*
+	 * If Host allocates less comv count for AV1 then
+	 * FW can raise SESSION_ERROR
+	 */
+	num_comv = (inst->codec == V4L2_PIX_FMT_AV1) ?
+				NUM_COMV_AV1 : caps->num_comv;
 
 	return core->hfi_ops->session_set_property(inst,
 						   HFI_PROP_COMV_BUFFER_COUNT,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
index bbfe7a0851ea94fb7041a868b4df8b2ec63bf427..9cc0989c67d74a9e051725e9ee571a2ab9160519 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
@@ -89,9 +89,18 @@ enum hfi_seq_header_mode {
 #define HFI_PROP_DEC_START_FROM_RAP_FRAME	0x03000169
 #define HFI_PROP_NO_OUTPUT			0x0300016a
 #define HFI_PROP_BUFFER_MARK			0x0300016c
+#define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
+#define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
 #define HFI_PROP_RAW_RESOLUTION		0x03000178
+#define HFI_PROP_AV1_FILM_GRAIN_PRESENT		0x03000180
+#define HFI_PROP_AV1_SUPER_BLOCK_ENABLED	0x03000181
+#define HFI_PROP_AV1_OP_POINT				0x03000182
+#define HFI_PROP_OPB_ENABLE                 0x03000184
+#define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
+#define HFI_PROP_AV1_DRAP_CONFIG            0x03000189
 #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
 #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
+#define HFI_PROP_AV1_UNIFORM_TILE_SPACING	0x03000197
 #define HFI_PROP_END				0x03FFFFFF
 
 #define HFI_SESSION_ERROR_BEGIN			0x04000000
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 2f1f118eae4f6462ab1aa1d16844b34e6e699f1e..eb3373f0ad4a1b26fb847db02449ec8d8cb3bdbb 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
 			return BUF_SCRATCH_2;
 	case HFI_BUFFER_PERSIST:
 		return BUF_PERSIST;
+	case HFI_BUFFER_PARTIAL_DATA:
+		return BUF_PARTIAL;
 	default:
 		return 0;
 	}
@@ -72,6 +74,7 @@ static bool iris_hfi_gen2_is_valid_hfi_buffer_type(u32 buffer_type)
 	case HFI_BUFFER_DPB:
 	case HFI_BUFFER_PERSIST:
 	case HFI_BUFFER_VPSS:
+	case HFI_BUFFER_PARTIAL_DATA:
 		return true;
 	default:
 		return false;
@@ -596,6 +599,10 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 		inst->fw_caps[PROFILE_H264].value = subsc_params.profile;
 		inst->fw_caps[LEVEL_H264].value = subsc_params.level;
 		break;
+	case V4L2_PIX_FMT_AV1:
+		inst->fw_caps[PROFILE_AV1].value = subsc_params.profile;
+		inst->fw_caps[LEVEL_AV1].value = subsc_params.level;
+		break;
 	}
 
 	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
@@ -608,6 +615,11 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
 		iris_inst_change_state(inst, IRIS_INST_ERROR);
 	}
 
+	if (inst->codec == V4L2_PIX_FMT_AV1) {
+		inst->fw_caps[FILM_GRAIN].value = subsc_params.film_grain;
+		inst->fw_caps[SUPER_BLOCK].value = subsc_params.super_block;
+	}
+
 	inst->fw_min_count = subsc_params.fw_min_count;
 	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
 	inst->buffers[BUF_OUTPUT].size = pixmp_op->plane_fmt[0].sizeimage;
@@ -711,6 +723,12 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
 	case HFI_PROP_NO_OUTPUT:
 		inst_hfi_gen2->hfi_frame_info.no_output = 1;
 		break;
+	case HFI_PROP_AV1_FILM_GRAIN_PRESENT:
+		inst_hfi_gen2->src_subcr_params.film_grain = pkt->payload[0];
+		break;
+	case HFI_PROP_AV1_SUPER_BLOCK_ENABLED:
+		inst_hfi_gen2->src_subcr_params.super_block = pkt->payload[0];
+		break;
 	case HFI_PROP_QUALITY_MODE:
 	case HFI_PROP_STAGE:
 	case HFI_PROP_PIPE:
@@ -841,6 +859,10 @@ static void iris_hfi_gen2_init_src_change_param(struct iris_inst *inst)
 		subsc_params->profile = inst->fw_caps[PROFILE_H264].value;
 		subsc_params->level = inst->fw_caps[LEVEL_H264].value;
 		break;
+	case V4L2_PIX_FMT_AV1:
+		subsc_params->profile = inst->fw_caps[PROFILE_AV1].value;
+		subsc_params->level = inst->fw_caps[LEVEL_AV1].value;
+		break;
 	}
 
 	subsc_params->pic_order_cnt = inst->fw_caps[POC].value;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9aca70b4c0690f0d8d799e2a9976bd20d6bb8c94..19f0660f0388499ab71a1413b2c05f891bd5d511 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -100,6 +100,13 @@ enum platform_inst_fw_cap_type {
 	LEVEL_H264,
 	LEVEL_HEVC,
 	LEVEL_VP9,
+	PROFILE_AV1,
+	LEVEL_AV1,
+	TIER_AV1,
+	DRAP,
+	FILM_GRAIN,
+	SUPER_BLOCK,
+	ENH_LAYER_COUNT,
 	INPUT_BUF_HOST_MAX_COUNT,
 	OUTPUT_BUF_HOST_MAX_COUNT,
 	STAGE,
@@ -237,8 +244,12 @@ struct iris_platform_data {
 	unsigned int dec_input_config_params_hevc_size;
 	const u32 *dec_input_config_params_vp9;
 	unsigned int dec_input_config_params_vp9_size;
+	const u32 *dec_input_config_params_av1;
+	unsigned int dec_input_config_params_av1_size;
 	const u32 *dec_output_config_params;
 	unsigned int dec_output_config_params_size;
+	const u32 *dec_output_config_params_av1;
+	unsigned int dec_output_config_params_av1_size;
 	const u32 *enc_input_config_params;
 	unsigned int enc_input_config_params_size;
 	const u32 *enc_output_config_params;
@@ -251,6 +262,8 @@ struct iris_platform_data {
 	unsigned int dec_output_prop_hevc_size;
 	const u32 *dec_output_prop_vp9;
 	unsigned int dec_output_prop_vp9_size;
+	const u32 *dec_output_prop_av1;
+	unsigned int dec_output_prop_av1_size;
 	const u32 *dec_ip_int_buf_tbl;
 	unsigned int dec_ip_int_buf_tbl_size;
 	const u32 *dec_op_int_buf_tbl;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 12dfbb79da4838069fd0c2b00c539f4a17e300ba..7ca7b1350723f29002890984836d87660f630a4c 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -64,6 +64,16 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
+	{
+		.cap_id = PROFILE_AV1,
+		.min = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
+		.max = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN),
+		.value = V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN,
+		.hfi_id = HFI_PROP_PROFILE,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
 	{
 		.cap_id = PROFILE_VP9,
 		.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
@@ -147,6 +157,33 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
+	{
+		.cap_id = LEVEL_AV1,
+		.min = V4L2_MPEG_VIDEO_AV1_LEVEL_2_0,
+		.max = V4L2_MPEG_VIDEO_AV1_LEVEL_6_1,
+		.step_or_mask = BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_0) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_1) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_2) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_2_3) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_0) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_1) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_2) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_3_3) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_0) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_1) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_2) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_4_3) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_0) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_1) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_2) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_5_3) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_6_0) |
+				BIT(V4L2_MPEG_VIDEO_AV1_LEVEL_6_1),
+		.value = V4L2_MPEG_VIDEO_AV1_LEVEL_6_1,
+		.hfi_id = HFI_PROP_LEVEL,
+		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
+		.set = iris_set_u32_enum,
+	},
 	{
 		.cap_id = TIER,
 		.min = V4L2_MPEG_VIDEO_HEVC_TIER_MAIN,
@@ -158,6 +195,53 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
+	{
+		.cap_id = TIER_AV1,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_TIER,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = DRAP,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_AV1_DRAP_CONFIG,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
+	{
+		.cap_id = FILM_GRAIN,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_AV1_FILM_GRAIN_PRESENT,
+		.flags = CAP_FLAG_VOLATILE,
+	},
+	{
+		.cap_id = SUPER_BLOCK,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
+	},
+	{
+		.cap_id = ENH_LAYER_COUNT,
+		.min = 0,
+		.max = 1,
+		.step_or_mask = 1,
+		.value = 0,
+		.hfi_id = HFI_PROP_AV1_OP_POINT,
+		.flags = CAP_FLAG_INPUT_PORT,
+		.set = iris_set_u32,
+	},
 	{
 		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
 		.min = DEFAULT_MAX_HOST_BUF_COUNT,
@@ -701,6 +785,19 @@ static const u32 sm8550_vdec_input_config_param_vp9[] = {
 	HFI_PROP_LEVEL,
 };
 
+static const u32 sm8550_vdec_input_config_param_av1[] = {
+	HFI_PROP_BITSTREAM_RESOLUTION,
+	HFI_PROP_CROP_OFFSETS,
+	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
+	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
+	HFI_PROP_PROFILE,
+	HFI_PROP_LEVEL,
+	HFI_PROP_TIER,
+	HFI_PROP_AV1_FILM_GRAIN_PRESENT,
+	HFI_PROP_AV1_SUPER_BLOCK_ENABLED,
+	HFI_PROP_SIGNAL_COLOR_INFO,
+};
+
 static const u32 sm8550_venc_input_config_params[] = {
 	HFI_PROP_COLOR_FORMAT,
 	HFI_PROP_RAW_RESOLUTION,
@@ -714,6 +811,12 @@ static const u32 sm8550_vdec_output_config_params[] = {
 	HFI_PROP_LINEAR_STRIDE_SCANLINE,
 };
 
+static const u32 sm8550_vdec_output_config_param_av1[] = {
+	HFI_PROP_OPB_ENABLE,
+	HFI_PROP_COLOR_FORMAT,
+	HFI_PROP_LINEAR_STRIDE_SCANLINE,
+};
+
 static const u32 sm8550_venc_output_config_params[] = {
 	HFI_PROP_BITSTREAM_RESOLUTION,
 	HFI_PROP_CROP_OFFSETS,
@@ -737,11 +840,18 @@ static const u32 sm8550_vdec_subscribe_output_properties_vp9[] = {
 	HFI_PROP_PICTURE_TYPE,
 };
 
+static const u32 sm8550_vdec_subscribe_output_properties_av1[] = {
+	HFI_PROP_PICTURE_TYPE,
+	HFI_PROP_WORST_COMPRESSION_RATIO,
+	HFI_PROP_WORST_COMPLEXITY_FACTOR,
+};
+
 static const u32 sm8550_dec_ip_int_buf_tbl[] = {
 	BUF_BIN,
 	BUF_COMV,
 	BUF_NON_COMV,
 	BUF_LINE,
+	BUF_PARTIAL,
 };
 
 static const u32 sm8550_dec_op_int_buf_tbl[] = {
@@ -806,11 +916,18 @@ struct iris_platform_data sm8550_data = {
 		sm8550_vdec_input_config_param_vp9,
 	.dec_input_config_params_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.dec_input_config_params_av1 =
+		sm8550_vdec_input_config_param_av1,
+	.dec_input_config_params_av1_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
 	.dec_output_config_params =
 		sm8550_vdec_output_config_params,
 	.dec_output_config_params_size =
 		ARRAY_SIZE(sm8550_vdec_output_config_params),
-
+	.dec_output_config_params_av1 =
+		sm8550_vdec_output_config_param_av1,
+	.dec_output_config_params_av1_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_param_av1),
 	.enc_input_config_params =
 		sm8550_venc_input_config_params,
 	.enc_input_config_params_size =
@@ -831,6 +948,9 @@ struct iris_platform_data sm8550_data = {
 	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
 	.dec_output_prop_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
+	.dec_output_prop_av1_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
 
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
@@ -900,10 +1020,18 @@ struct iris_platform_data sm8650_data = {
 		sm8550_vdec_input_config_param_vp9,
 	.dec_input_config_params_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.dec_input_config_params_av1 =
+		sm8550_vdec_input_config_param_av1,
+	.dec_input_config_params_av1_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
 	.dec_output_config_params =
 		sm8550_vdec_output_config_params,
 	.dec_output_config_params_size =
 		ARRAY_SIZE(sm8550_vdec_output_config_params),
+	.dec_output_config_params_av1 =
+		sm8550_vdec_output_config_param_av1,
+	.dec_output_config_params_av1_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_param_av1),
 
 	.enc_input_config_params =
 		sm8550_venc_input_config_params,
@@ -925,6 +1053,9 @@ struct iris_platform_data sm8650_data = {
 	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
 	.dec_output_prop_vp9_size =
 		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
+	.dec_output_prop_av1_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
 
 	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
 	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index d38d0f6961cd5cb9929e2aecbec7353dcc2d4a7d..05eec18f937a51d3c081d0f98a8ffa6bbd30d166 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -178,6 +178,7 @@ int iris_open(struct file *filp)
 	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_1].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
 	init_completion(&inst->completion);
 	init_completion(&inst->flush_completion);
 

-- 
2.34.1


